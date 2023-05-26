Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A8A7127BF
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 15:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD6710E1CC;
	Fri, 26 May 2023 13:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5346F10E1CC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 13:47:23 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d18d772bdso1153912b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 06:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685108842; x=1687700842;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9TW6tTngWb25r/POiswswB/QyhpYIVptjKJqMAEVpQI=;
 b=piyIs9X8Ll5ISV/iWmt8KPgg0B7Tqe8eQT1TjmOyW1U1spGfaEnx6RVNxr8WFlmvzY
 iwfhG4jTstzaotQklI39xA3D8/fduc9M1sNCOuHpjeTayB1hoHDg038i4bKmc+w3QFTt
 0gQNSXptjrhT13Ya9vBaOpOYvudq89gi3n1vM4Dk0/VHwri3sYCD/ebivD1mSnA2jLga
 BlLh/iKtdJHCNtp3bRfyvJRhgGXmgu1GXBqdhOwcxqsPa05UUWtnoTuLp7n/EA395Kk7
 oqwqMtBB0IGl7ZrPUOx8ImIimXddQEYZ9giEYlRpuF3kpu9GhoQa+RwMTubagLy4GMi8
 6ADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685108842; x=1687700842;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9TW6tTngWb25r/POiswswB/QyhpYIVptjKJqMAEVpQI=;
 b=Nr4xbtJ+ZlyKOx1b8vOEAph+gzM2EU9CrofEt0wsIat21F4gPKp90zlzYanLhCa2UH
 xsRNnJLX0f8d5fXpAFgieXcmqRBf0Ay5uCW0Iz369DThK3gx67iy4rxzhLE2CDNWQNLQ
 Ot7cuQ0pza2DBh4hlltC6kuWIJPDLTwNrnYhsDKPy3oAqwTUpXr9bEihyRSm4EH2/RNe
 3S02/6A/LLNyTc3hQGuIVgdhdrPXYM3SCrsqrMlRHjAd+FO2o5+3DUdYf7NnDGqGZCq+
 tFWzcyvamjhnKl0blZVypqdNaOhtV0hxztlNQhoUT5LVdtGYNCi7AuPj7DsRR1dzI6DN
 W1TA==
X-Gm-Message-State: AC+VfDzjY3qzzxcffn3KtVEOxqMUPt/qizB460lGXgxa67J26ZCopTGF
 uvblU9dlDGl56bnc7R1TGCQ=
X-Google-Smtp-Source: ACHHUZ4K0GD+iAjkaF75NrVdiUroHsbTjcoay2+CJ/EytE3C7jNawfKrN4fA5I5u3rphgfmJhBAOLA==
X-Received: by 2002:a05:6a00:b93:b0:64b:205:dbf3 with SMTP id
 g19-20020a056a000b9300b0064b0205dbf3mr3785656pfj.34.1685108842119; 
 Fri, 26 May 2023 06:47:22 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-61.three.co.id.
 [116.206.28.61]) by smtp.gmail.com with ESMTPSA id
 j1-20020aa78001000000b006437c0edf9csm2881304pfi.16.2023.05.26.06.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 06:47:21 -0700 (PDT)
Message-ID: <288db372-9797-540f-e8bd-794a23648573@gmail.com>
Date: Fri, 26 May 2023 20:46:32 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Samsung SoC Support <linux-samsung-soc@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Does not work backlight on Chromebook XE303C12 with Kernel
 version 6.3.4
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew <quark@disroot.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> I did check it by flashlight. Even with all available backlights drivers compiled as modules it does not work. With Kernel version 5.15.106 backlight works fine.
> Kernels for Chomebook uses dtb files that have some backlight config set (used gpio), like exynos5250-snow-common.dtsi and dmesg of 6.3.4 gives some gpio warnings. Maybe cause in it.

See bugzilla for the full thread and attached dmesg & kernel config.

Anyway, I'm adding it to regzbot:

#regzbot introduced: v5.15..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217489
#regzbot title: Chromebook XE303C12 backlight stopped working with gpio warnings

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217489

-- 
An old man doll... just what I always wanted! - Clara
