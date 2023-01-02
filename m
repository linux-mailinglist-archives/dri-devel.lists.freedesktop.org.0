Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CD265B6CB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 19:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815E010E37E;
	Mon,  2 Jan 2023 18:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1233710E37E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 18:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672685981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7WOPN/LK/WXz6Ghsv8Bn+UnAhtmBnvTXnzOz5HK8Rlk=;
 b=Ri+dz3mRpwXmkrUJan2EfCA0NHyPyHyIHbnrU18lQ49gHeR/T/AaahJQu0nurcoe05kXQo
 4b+EJOTsZMtGqU6dZNcAVqW4vyKpiFrvid8UdcIj+bjIhx0rtx3uqNAcHrh0c4s3lJDUcF
 hltLT6r9yPhVyMRLlewKJkCtizCpGXc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-223-191xG0oGNXO0YsEut-vmtA-1; Mon, 02 Jan 2023 13:59:39 -0500
X-MC-Unique: 191xG0oGNXO0YsEut-vmtA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so5777892wmq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 10:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7WOPN/LK/WXz6Ghsv8Bn+UnAhtmBnvTXnzOz5HK8Rlk=;
 b=yfPf4x65c0boXfv2AMRkQxB8mv3j1MG9fFoGJFQmRfEPz0ubIcbCaTq8rwE3LjPfh5
 UzGnY/uWpONeLpiO+l/yhSI3XiXbkmdPS/XbJAb7vjhl27zN7l/D9LzPUt9MgkT6u1JF
 T+1WnWrtJxHW7lQIGXET0kd9aAy8qMtKMrs9CK4a7Th9s6ogx1o13hGg6USRNSP6B8Ho
 1Fx5LjtDYu1fprR8tn5aLwv4k3z66G3qLJp2pGibb0McT7EkmsPsRPWSrokef3HmtH9+
 iwcPkCRsH5PcQwrFLabfLYobQ+dYgwRMfEiPFHttAUDA4FvIRZi8iKGLfevZ8vUKJJQO
 VCxQ==
X-Gm-Message-State: AFqh2kpMe7yEj/qzl9TrVMtRjJSSMWb5iOHZ3UEPHVrFPF1F2pSEMLbB
 rSTK593e+rpjr4nLqHaG+5gVmE3uURl6+mq05UcXo4uVp4QY4eQv284HqgJeRTs4WDLyYSowSoX
 H79VxPaWqhrCck7h8eLTXvJR1gYkf
X-Received: by 2002:a05:600c:1c9d:b0:3d1:f3eb:c718 with SMTP id
 k29-20020a05600c1c9d00b003d1f3ebc718mr36368380wms.19.1672685978893; 
 Mon, 02 Jan 2023 10:59:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtY7ieM99CQJWNJHqwEx3e+hU/MU5mpbx0U8M5qHx6VgaHdqWH0s9s0pCZ5kSIUjOcd5tCbcw==
X-Received: by 2002:a05:600c:1c9d:b0:3d1:f3eb:c718 with SMTP id
 k29-20020a05600c1c9d00b003d1f3ebc718mr36368375wms.19.1672685978701; 
 Mon, 02 Jan 2023 10:59:38 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003d96c811d6dsm41003934wmq.30.2023.01.02.10.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 10:59:38 -0800 (PST)
Message-ID: <8de738ef-588b-1c59-6e97-c0277eb313b1@redhat.com>
Date: Mon, 2 Jan 2023 19:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 01/14] drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro
To: Sam Ravnborg <sam@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <20221228014757.3170486-2-javierm@redhat.com> <Y7MkzucDEdsYenqX@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Y7MkzucDEdsYenqX@ravnborg.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

Thanks a lot for your feedback.

On 1/2/23 19:39, Sam Ravnborg wrote:
> Hi Javier.
> 
> On Wed, Dec 28, 2022 at 02:47:44AM +0100, Javier Martinez Canillas wrote:
>> Many panel drivers define dsi_dcs_write_seq() and dsi_generic_write_seq()
>> macros to send DCS commands and generic write packets respectively, with
>> the payload specified as a list of parameters instead of using arrays.
>>
>> There's already a macro for the former, introduced by commit 2a9e9daf75231
>> ("drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro") so drivers can be
>> changed to use that. But there isn't one yet for the latter, let's add it.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>  include/drm/drm_mipi_dsi.h | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>> index 20b21b577dea..c7c458131ba1 100644
>> --- a/include/drm/drm_mipi_dsi.h
>> +++ b/include/drm/drm_mipi_dsi.h
>> @@ -297,6 +297,22 @@ int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
>>  int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
>>  					u16 *brightness);
>>  
>> +/**
>> + * mipi_dsi_generic_write - transmit data using a generic write packet
> s/mipi_dsi_generic_write/mipi_dsi_generic_write_seq
> (As the bot also reported)
> 

Ups, sorry for missing that.

> with this fixed:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>

Thanks!
 
>> + * @dsi: DSI peripheral device
>> + * @seq: buffer containing the payload
>> + */
>> +#define mipi_dsi_generic_write_seq(dsi, seq...) do {				\
>> +		static const u8 d[] = { seq };					\
>> +		struct device *dev = &dsi->dev;	\
>> +		int ret;						\
>> +		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
>> +		if (ret < 0) {						\
>> +			dev_err_ratelimited(dev, "transmit data failed: %d\n", ret); \
>> +			return ret;						\
>> +		}						\
>> +	} while (0)
>> +
> (If you align '\' under each other it would be nicer, but I could see
> that mipi_dsi_dcs_write_seq() do not do so).

Yeah, I was actually thinking about doing like you suggested for this macro
but preferred to keep it consistent with the existing mipi_dsi_dcs_write_seq()
macro definition...

Maybe I can add a preparatory patch that just fixes the backslash characters
indent for mipi_dsi_dcs_write_seq() to be all aligned?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

