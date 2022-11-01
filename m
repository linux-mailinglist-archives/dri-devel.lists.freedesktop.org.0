Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CF7614316
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 03:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFBE10E02A;
	Tue,  1 Nov 2022 02:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB98710E02A;
 Tue,  1 Nov 2022 02:12:01 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id q1so12226523pgl.11;
 Mon, 31 Oct 2022 19:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eLIgCkgfgn5iTxPM1gVk+h8esf5par019LyioMO/CLQ=;
 b=gU2fp1alF/CfGOz27zUV1tjPYcplNa+O+KfQ2mlTKNBOYkbaz2YHEWSbyw9BTJ1iB9
 CXJmh50YXtArdV/k5JEmRpQT7DHUB13lbMbIEtMBtOo+wtF6Y1gfdeeoGWJBl62TkAzQ
 BEfh7yEbZSKS008pEA1eFifU/N7E7UzTdJM7X4nRvegykLKHnXQ+jVyGFPsgg0Ulhl9Q
 ox24q4Ks2nKRUU2/XPksxf2/D9e6nIWtubBmOjYa3dURJXgXRmFaIpH8cglg/K2hIxIl
 xX9QGIkiqZjks4prwAhu1OqO7bIYQ0E0+sIiXC75Mn9QhPJTVFgtkV1g77gONuYDTja9
 vpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eLIgCkgfgn5iTxPM1gVk+h8esf5par019LyioMO/CLQ=;
 b=CtmXHADk1yCTojL0C+iLmc89b2c3AyEpKSkksxkxUfszKClfdoSSMjGU9GITHI5ryj
 vbxABDklZ5SKrvykRM8vDi055fSFuoUlrjO1CPZ6WnYGzEGiP6wNDtngHaxoD/WIBy09
 3n/TFJ9IiqktPATq/caQ1oxteVdMTQ0PZv2cj0jS0zanXuixbW4+pGB5G/5x4mjlowqd
 tsTF4kVLJnm5Pm+sTbGpa3Jz0mP9PrPPWgniaVqCu14yTAzFXQIZFkoppnUEzHY4N3bq
 SokfDe6grh5TuATy7dejai1hEGBcKvxzFwRvtHmjZs72Q6DFgpfw3gvcJZuTpSvZAhqX
 ghMA==
X-Gm-Message-State: ACrzQf2Qn4LnAZek7eFmWlkqf3aNL1DKprAVnQOSuE3ErpHvPDIr8vCF
 bm49iqrI/IKr39BPWIvj6Sk=
X-Google-Smtp-Source: AMsMyM4mI22oj7nqThjTGVGTfQDqYJrZXRbzCHmvjp5TFLMaXojFrrR1id5r7IJQp6VGKrbltoxdnw==
X-Received: by 2002:a05:6a02:186:b0:431:25fb:f1fe with SMTP id
 bj6-20020a056a02018600b0043125fbf1femr15584524pgb.130.1667268721265; 
 Mon, 31 Oct 2022 19:12:01 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-90.three.co.id.
 [180.214.232.90]) by smtp.gmail.com with ESMTPSA id
 11-20020a63134b000000b0043ae1797e2bsm4744655pgt.63.2022.10.31.19.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 19:12:00 -0700 (PDT)
Message-ID: <5a61ae6a-8a16-8abb-e718-895c41e2e7a8@gmail.com>
Date: Tue, 1 Nov 2022 09:11:54 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/nouveau: Add support to control backlight using
 bl_power for nva3.
To: antoniospg <antoniospg100@gmail.com>, linux-kernel@vger.kernel.org
References: <20221029184851.25340-1-antoniospg100@gmail.com>
 <20221031163211.13228-1-antoniospg100@gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221031163211.13228-1-antoniospg100@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/31/22 23:32, antoniospg wrote:
> Summary:
> 
> * Add support to turn on/off backlight when changing values in bl_power
>   file. This is achieved by using function backlight_get_brightness()
>   in nva3_set_intensity to get current brightness.
> 

This is [PATCH v2], right? If so, next time please pass -v <version
number> to git-format-patch(1).

Also, just say the prose without using bullet list. "Summary:" line
is also redundant. And again, please describe why this change be made.

> Test plan:
> 
> * Turn off:
> echo 1 > /sys/class/backlight/nv_backlight/bl_power
> 
> * Turn on:
> echo 0 > /sys/class/backlight/nv_backlight/bl_power
> 

Shouldn't "test plan" above be documented in Documentation/ instead?

Last but not least, is "antoniospg" your real, legal name?

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

