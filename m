Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C928595A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6A86E895;
	Wed,  7 Oct 2020 07:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD0C6E899
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 07:01:56 +0000 (UTC)
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kQ3SV-0007H6-ED
 for dri-devel@lists.freedesktop.org; Wed, 07 Oct 2020 07:01:55 +0000
Received: by mail-pf1-f198.google.com with SMTP id k4so868807pff.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 00:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YY+uRp9H9LhgOdIjOkhoHSwMjiC62Tl2vVWx4QZWuVY=;
 b=Zt+9bUow+39deHhlXOLAgCf9Ni73amLEj5RmJqEF1zqnK2TVV3x+YcnFQa1s3cp9hM
 NBPFsza2qUVFvyK1EQvgv0Ixk0GuB3KZbljKq1q3GIpSfM7kWvCJ8HxZz9YMpRNoby2b
 hrAk/sfOpmNXoJMLrrcyzDLubO8+jIfdxBFlQmvoqx3FG4tEnwO7Ax7aXwmZmLLNPS9M
 xO/VA51XpVg85dlyKudV8/tkja0J6sehf8dkBHCIQpv8DPDi7zoMiMVQtsjqxwQjTJkz
 Yvrc4QWjFagZrykGclacvBfKo3rwhJD5IwNXawRtGpwFxUk54ZtqhklpEofI4JMOjsea
 O8Gw==
X-Gm-Message-State: AOAM530XM0tUSOtyWOOfP7F6uW15Vls11hVxIY+eVEvKy1C+UyVfmMEs
 ZQe2CyLOZqv94FWVtuLp99sK5jzB4PdCvP/jUilQBv91t4wtOynbeMFwl4UkyG/nGetXcx9/KPM
 0oaNcTNjJjVOhYPDrs7Ur6qoZ5nMadwHKw43NqWaDeUkNJQ==
X-Received: by 2002:a17:90a:fd03:: with SMTP id
 cv3mr1703129pjb.137.1602054114050; 
 Wed, 07 Oct 2020 00:01:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIRZWLnm2Wo/uKpT2AkEa+DSpYn1D+tXclumaSTvgwwKloSqhzPMVO8i0oY6NaCoTpjIkC1Q==
X-Received: by 2002:a17:90a:fd03:: with SMTP id
 cv3mr1703110pjb.137.1602054113754; 
 Wed, 07 Oct 2020 00:01:53 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id b2sm1603211pfp.3.2020.10.07.00.01.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Oct 2020 00:01:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] drm/i915: Force DPCD backlight mode for HP CML 2020 system
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <87k12qigpw.fsf@intel.com>
Date: Wed, 7 Oct 2020 15:01:51 +0800
Message-Id: <3D7AEAE9-AFE4-49C6-A8C0-3F744CC8D529@canonical.com>
References: <20200407075353.12747-1-kai.heng.feng@canonical.com>
 <87k12qigpw.fsf@intel.com>
To: David Airlie <airlied@linux.ie>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Apr 8, 2020, at 15:23, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> 
> On Tue, 07 Apr 2020, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>> There's another Samsung OLED panel needs to use DPCD aux interface to
>> control backlight.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

David, 

Can you please merge this patch? Thanks.

Kai-Heng

> 
>> 
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> drivers/gpu/drm/drm_dp_helper.c | 2 ++
>> 1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
>> index c6fbe6e6bc9d..d0cfee3b7a65 100644
>> --- a/drivers/gpu/drm/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>> @@ -1299,6 +1299,8 @@ static const struct edid_quirk edid_quirk_list[] = {
>> 	 * only supports DPCD backlight controls
>> 	 */
>> 	{ MFG(0x4c, 0x83), PROD_ID(0x41, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>> +	/* HP CML 2020 system */
>> +	{ MFG(0x4c, 0x83), PROD_ID(0x45, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>> 	/*
>> 	 * Some Dell CML 2020 systems have panels support both AUX and PWM
>> 	 * backlight control, and some only support AUX backlight control. All
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
