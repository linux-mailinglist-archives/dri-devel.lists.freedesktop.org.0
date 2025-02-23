Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D256A40CE8
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 07:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E87A10E1B2;
	Sun, 23 Feb 2025 06:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sladewatkins.com header.i=@sladewatkins.com header.b="BDKiCpJZ";
	dkim=pass (2048-bit key; secure) header.d=sladewatkins.net header.i=@sladewatkins.net header.b="oTnUa6Om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 452 seconds by postgrey-1.36 at gabe;
 Sun, 23 Feb 2025 06:07:24 UTC
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com
 [148.163.129.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D3010E217
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 06:07:24 +0000 (UTC)
Received: from dispatch1-us1.ppe-hosted.com (ip6-localhost [127.0.0.1])
 by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 7BB382A8002
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 05:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sladewatkins.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=selector-1739986532; bh=tL+mVeQMxkFXhPRf8l5PyJu7sCPJ52EsfXLbcrTR+QY=;
 b=BDKiCpJZcHVNtp9XhIZUjCzWBmNxRliQMBGWvI4JMHvuxv1LWDeJ+MxP/hc5OP9+gGr6H7POsveQG6FYx7O6FDEGEll8LRjmos1viL2GVUI1yuxAqO0aBmvC9aRK0FmNPDhvm3CdwOw9od61u24oRhJ3jpK9q9aEyQgJuhKSX2uby/W4iDl2cBmwNmZwFcJYXumd5xeAgPTJ+4rd33dfYhfrl0QKxuhraXjW1w1y/M75NQkcfMWBu3BlC6qaLmdmL48isPiMSYmeGfeqjdy3cIznWW77VYg4qyZFEIchgvi/8UtTMNVmihQo2Cm5K/dNJCl/C61wk7GtK9cggDm/bg==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 2E263700066
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 05:59:49 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-47220fab76eso1648121cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 21:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sladewatkins.net; s=google; t=1740290388; x=1740895188;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tL+mVeQMxkFXhPRf8l5PyJu7sCPJ52EsfXLbcrTR+QY=;
 b=oTnUa6OmuZip/40FwRBVphXqCh5Ga8LHVmCJ9jLyJEqCxr9kyc4q6AFdo8wCQ7eXEJ
 wtP6B+YyerTNg0zoNCxCVIw+81caRvPhSHtKXz97kxi4hAr1/dKLurDt1i2ketNA8rN9
 Dec7s4GHG76jCQpJ34aiWnjLkTHBevHcUOYX4LrqkkYHq68LBhzifME1k6TcXT/ICp2C
 zvrDQI82WjogjWl0Zb4QdOUg4OR/0me15WvPST6PzkitSLfvRQQFZaaGjUtVEHnXfD7r
 dpYv2Bb7a74CHDnSVgUb73WY+IO7OvwkDYAD6zUgU2u/K9xdnvrzy1DSNgrdPeTczFUI
 jAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740290388; x=1740895188;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tL+mVeQMxkFXhPRf8l5PyJu7sCPJ52EsfXLbcrTR+QY=;
 b=gPECVaGVIVeTNkNYICzexA2cxCUqPxyrEMkPhQPWrfx0ivf8tggAV6lUBBRa3AScx+
 KpKk1Sf4F1i/leGoIuHl1vX4uUzJ4F5esKk4SlhTiFF8jgZqVg5KqIoDxX04Eq2LiBGs
 y+5zqiXvft3bPfuuvcZQ6Ju8/BSVJp/3BDeAKzdfDogcOYKtfQIT2paBUMi+5ykjeAH/
 y8qtwaBnbr+XBA4Tv1+/befz1lHNoHqToyBFEiD/D9BQwDm0JlK18J8sybp+7kkY5TtT
 M6HXH/y5AeWGLsxT/Ahwq9QEWafFJl8FN4kLAcnRJO8M1/N/vHwKr7tpN100P3NwJhqx
 Q4ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOGP6j5SgF2vGyN/dRPgv4szZ3OYmv6Q38UXXx6ahFCU32Qks1Gr9SYkC7RV/noy8kLTdeAKyTf+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPbDZInvlj3HiztN8/bVeMeOzwkLUmiXEkuxcPN4JVqwm8ZmBy
 r8sM8Wh9XBlQzvi7Zsw98ZLGzsgwhs1M5ISJUOfwhx4Gto2BhzFo4JUW1jk9oQ2TGzZvIhEmaLt
 wIYsAKDmBd0Y6rcLUbKFGed/Dz7mvFlkmdBHlJ9eAv8KAoS5lvQIJBQ8pmmNgaFH2kpk0dIryWa
 J5sorNI9f9G/U=
X-Gm-Gg: ASbGncuVFx2q9bkTh8lDCYM1w3gbSTo5Mwp3/Vd1M8RVO5g3KuPrV+BYv5c6v+SIs7+
 QxG96E4JFk6IJumF7wi5oSWTs1rdLQ72/7otvcspR3oGdYaxsP0GWKK3ivvGA674FkqsMGyBRNc
 icbv2rUG1asOlvFqG4UFmPYraRM/cIp/2OPUPmJlwwdSKtoGlN3V2oa2mok8NHvD1L+kHIDvDP7
 aaCr1lt9DOc3/rJs2l8AlazelDUKkZW2ZVsEhaq0cQthxtuj+cWMQYpCE49ydf7t0aKvarUw+Sf
 ZIJVeZYeVxGNcLcEztP68gKR7jiN6XOKpKSdwkHN2qwDq95lEcMTaIoi1VH5QTkXMwwpoCr87Cl
 O9c0=
X-Received: by 2002:ac8:5943:0:b0:471:ef27:a313 with SMTP id
 d75a77b69052e-472228e0cd8mr132522321cf.23.1740290388338; 
 Sat, 22 Feb 2025 21:59:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHobZoEPNEVbzAjy+6qRcpI57LJnIrUU7nIRUOKBrAOd5qMdLhrdrimMqYyYbwOoH1p1MYTJQ==
X-Received: by 2002:ac8:5943:0:b0:471:ef27:a313 with SMTP id
 d75a77b69052e-472228e0cd8mr132522181cf.23.1740290388021; 
 Sat, 22 Feb 2025 21:59:48 -0800 (PST)
Received: from [192.168.86.23] (syn-076-037-141-128.res.spectrum.com.
 [76.37.141.128]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47207d1dc11sm53927831cf.6.2025.02.22.21.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Feb 2025 21:59:47 -0800 (PST)
Message-ID: <4569fa6a-cee5-4499-964e-b1e9e1aef474@sladewatkins.net>
Date: Sun, 23 Feb 2025 00:59:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Please backport "drm: select DRM_KMS_HELPER from
 DRM_GEM_SHMEM_HELPER" to 6.13.x
To: NoisyCoil <noisycoil@disroot.org>
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de
References: <bfd2258b-9bbe-42e6-89aa-1bd77a58983b@disroot.org>
Content-Language: en-US
From: Slade Watkins <srw@sladewatkins.net>
In-Reply-To: <bfd2258b-9bbe-42e6-89aa-1bd77a58983b@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1740290389-uFeRupSBAoee
X-MDID-O: us5; ut7; 1740290389; uFeRupSBAoee; <slade@sladewatkins.com>;
 dbfad48f6c13e9a10057019461e11712
X-PPE-TRUSTED: V=1;DIR=OUT;
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/22/2025 8:20 PM, NoisyCoil wrote:
> The build (actually, linking) failure described in [1] affects current 
> stable (6.13.4). Could the commit that fixes it in mainline, namely, 
> c40ca9ef7c5c9bbb0d2f7774c87417cc4f1713bf ("drm: select DRM_KMS_HELPER 
> from DRM_GEM_SHMEM_HELPER") be backported to 6.13.x, please?

+Arnd?

-slade
