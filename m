Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC322E686
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 09:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92B789C93;
	Mon, 27 Jul 2020 07:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E066189C93
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 07:28:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 3so6731696wmi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 00:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=esRwbTCzDO7x2Eh5vxgXr51hblMhF7XMAdzGe185q58=;
 b=RcFtDGx2prygoi/goLympmWmMWrHgs+W+Mu8GWjpCcrcy5qljVybkEdf4FSqlvKvB5
 gFsyOki6z1CTxJB85UYVCV/xddThoGl56Gm+kIOMzsY8x+RR0QH8EQ+uC011LxY6y6DN
 FO1lP8Ne4sJg+kDhGugIRthqY6y7LCKhwmskh+k1GXjrhOCdEqiKdsUh7L+5nkJ0ke49
 rTq5PuDKFubDWBaXPdjJRE9lf7nPbwKv8uf3z/R6jsFIVndcLu8K11Cg2YaQ+fDmjTyZ
 8pBAd8vmo3eK/LCzxVW1LfhiVeU6EnNz5lS5ZmDxbz4HqpSEzrlxtmW6vDSn0/nCamL+
 5Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=esRwbTCzDO7x2Eh5vxgXr51hblMhF7XMAdzGe185q58=;
 b=YOefqgE8ZPKYgA/W4qsJfJJ7Sz4Sp4pucKs63nKkpqZMsRsBi2WnD6yvLT5xpC5WL/
 99nvQ5uU+FtD3mSrBdLVVCJ9DMfXRCU1Pldir0fMA7DpMSxiGrPpJ/w7JKYDJqc1sVgD
 qvWCgw/g0X5pxKsQbhq78WnTpE2vsLHRCnOcKROMj2j0Yc0k3JOPfdeQ3l1R/0vOthM8
 8yphe6c3ATCRM3Y+KrpL/eooUQJqMW3lAQJQI6lOT1KyX0KJcXYMOZnEnaRV8bpAtpRY
 Shba4La2u2Qb5RKbOCEETMh/uKi8bp8SCdupcpNm9RlVtGTIse4gw4IjMpI+uiOhM9m6
 7y3A==
X-Gm-Message-State: AOAM5319W70hkzJ0QNANJSbgKtxuOiSzWCRzyxLkpbkvIq56TvEiTSUM
 X6FTTsZjNJx1AManwP1NL1G8pw==
X-Google-Smtp-Source: ABdhPJwwFyXP9m/QKHlWEoJgeVi7242QOXUA6jx28eAS7kwNdU7yV7fLodxpOYPkpJ7kyPDLJVd3yg==
X-Received: by 2002:a1c:c256:: with SMTP id s83mr17451497wmf.17.1595834926293; 
 Mon, 27 Jul 2020 00:28:46 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:c02:85df:32ef:2826?
 ([2a01:e35:2ec0:82b0:c02:85df:32ef:2826])
 by smtp.gmail.com with ESMTPSA id y189sm19988868wmd.27.2020.07.27.00.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 00:28:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/fourcc: fix Amlogic Video Framebuffer Compression
 macro
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200723090551.27529-1-narmstrong@baylibre.com>
 <20200726172549.GH3275923@ravnborg.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <c056f317-c705-8356-e83b-ef3e206f4811@baylibre.com>
Date: Mon, 27 Jul 2020 09:28:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200726172549.GH3275923@ravnborg.org>
Content-Language: en-US
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
Cc: khilman@baylibre.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2020 19:25, Sam Ravnborg wrote:
> Hi Neil.
> 
> On Thu, Jul 23, 2020 at 11:05:50AM +0200, Neil Armstrong wrote:
>> Fix the Amlogic Video Framebuffer Compression modifier macro to
>> correctly add the layout options, a pair of parenthesis was missing.
>>
>> Fixes: d6528ec88309 ("drm/fourcc: Add modifier definitions for describing Amlogic Video Framebuffer Compression")
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Looks correct just looking at the patch below.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I assume you will apply the patch.

Yes, indeed

Thanks !
Neil

> 
> 	Sam
> 
>> ---
>>  include/uapi/drm/drm_fourcc.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> index 4bee7de5f306..82f327801267 100644
>> --- a/include/uapi/drm/drm_fourcc.h
>> +++ b/include/uapi/drm/drm_fourcc.h
>> @@ -1004,7 +1004,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>>  #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
>>  	fourcc_mod_code(AMLOGIC, \
>>  			((__layout) & __fourcc_mod_amlogic_layout_mask) | \
>> -			((__options) & __fourcc_mod_amlogic_options_mask \
>> +			(((__options) & __fourcc_mod_amlogic_options_mask) \
>>  			 << __fourcc_mod_amlogic_options_shift))
>>  
>>  /* Amlogic FBC Layouts */
>> -- 
>> 2.22.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
