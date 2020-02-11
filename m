Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD8515A34B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FF26F483;
	Wed, 12 Feb 2020 08:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc2b.google.com (mail-yw1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DC76E1A8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 19:06:08 +0000 (UTC)
Received: by mail-yw1-xc2b.google.com with SMTP id 10so5716157ywv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 11:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=wPdyB8BXraQOD7tLtMr9ZV817UwsVe3LQShrz9AB71o=;
 b=hcviG1/qorx7l4xH40ZtuRYm2w+B4cOpjR68es00EDjvVqtgKLGTMp2tWDQpxurDSP
 B2tcidAOREXJ9g+9tnplWkUnE5PqcH/1Pwjk6J1ybG1r3+ZapTsYc0/p7CRZ2CMEFvci
 gsLFkVJjDaR6SATkziFS3Kw5aLXZIPzbiVZ01nDpLHIxXdor2e9PXVo49LyE4nV6B2jI
 NN/CVR7/rhSWKG1QzTDHQwWxeOAuRDelG1lSrSLoLK48sDXhqJPw7B7QSAntf/s1SeOn
 GzAFSvu1GZdKPKWFQUVffJSllZ0lruxX1XgAWHQrUfsoGAn12KxdWf0R7isqwYxBiSYY
 H5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wPdyB8BXraQOD7tLtMr9ZV817UwsVe3LQShrz9AB71o=;
 b=R4Np1ScvVfTob4wZH/uU5rENgngyOggdiQKWRLaiziZkjbjSGmXh/vwaJXAv5S19gq
 FxCV7WS6eNTplbrMAoUCFAGpEf1a9M2uSgrR6rj0rQRzeqwKqJlACAqYxaEKGDUMkWww
 JP6acj5zdYjwmQfh2GJFMSF+MCLXpFEHvy/rHMY4lOlYMRjbqHVnuze4CsJeJKjVYdGr
 JB3MPErg/sPgusDxgnQkJSi+gYFbsQEGOJE0qPo7xCvPDXnCwfA3CwAw1WV/eaiMhqW+
 Rz06zL7iexd/Xz55pK67d5MBwcUBm+7xendGFzlSOrpGxfOvIzeayB/drzBjG+5uwyJP
 CQzg==
X-Gm-Message-State: APjAAAUZ4JqanXr2yiKOLau51WyH8RcPrlsQPQGg7A+UnwigJqy212Es
 EdEEcuj+49F6CEGtQ5oSkZSDxHgh
X-Google-Smtp-Source: APXvYqyrbf0Yi0My9AVtmvvXRiHg+YhKUVB+wqHwXuqkiygW0m3qa3XX1OCLmDSfhL6EsR/P1W3kDw==
X-Received: by 2002:a81:50d6:: with SMTP id e205mr6470075ywb.208.1581447967258; 
 Tue, 11 Feb 2020 11:06:07 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net.
 [73.88.245.53])
 by smtp.gmail.com with ESMTPSA id b73sm2281079ywe.28.2020.02.11.11.06.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Feb 2020 11:06:06 -0800 (PST)
Subject: Re: build error: f7655d42fcee drm/edid: Add CTA-861-G modes with VIC
 >= 193
From: Frank Rowand <frowand.list@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <4e918a35-dbcd-b2fd-1888-a86e7d448128@gmail.com>
Message-ID: <3e5d7142-cacc-6830-94d3-f57ef18592d9@gmail.com>
Date: Tue, 11 Feb 2020 13:06:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4e918a35-dbcd-b2fd-1888-a86e7d448128@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/11/20 12:48 PM, Frank Rowand wrote:
> I am getting a kernel build error at version 5.6-rc1:
> 
> drivers/gpu/drm/drm_edid.c: In function 'cea_mode_alternate_timings':
> drivers/gpu/drm/drm_edid.c:3275:2: error: call to '__compiletime_assert_3282' declared with attribute error: BUILD_BUG_ON failed: cea_mode_for_vic(8)->vtotal != 262 || cea_mode_for_vic(9)->vtotal != 262 || cea_mode_for_vic(12)->vtotal != 262 || cea_mode_for_vic(13)->vtotal != 262 || cea_mode_for_vic(23)->vtotal != 312 || cea_mode_for_vic(24)->vtotal != 312 || cea_mode_for_vic(27)->vtotal != 312 || cea_mode_for_vic(28)->vtotal != 312
> make[4]: *** [drivers/gpu/drm/drm_edid.o] Error 1
> 
> 
> Kernel configuration:
>   make qcom_defconfig
> 
>   (arch/arm/configs/qcom_defconfig)
> 
> 
> Compiler is arm-eabi-gcc 4.6.x
> 
> 
> The build error goes away if I revert:
> 
>    f7655d42fcee drm/edid: Add CTA-861-G modes with VIC >= 193

I did not actually revert f7655d42fcee from 5.6-rc1.  I checked out the commit
before f7655d42fcee and was able to build the kernel.  Then I checked out
f7655d42fcee and the build failed in the same manner as at 5.6-rc1.

Simply reverting f7655d42fcee at 5.6-rc1 does not result in a buildable
kernel due to other related changes.

-Frank

> 
> 
> The build error also goes away if I comment out the two lines added to cea_mode_for_vic():
> 
>  	if (vic >= 193 && vic < 193 + ARRAY_SIZE(edid_cea_modes_193))
>  		return &edid_cea_modes_193[vic - 193];
> 
> 
> -Frank
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
