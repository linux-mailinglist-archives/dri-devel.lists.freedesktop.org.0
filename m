Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C884543C071
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 04:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DFD6E508;
	Wed, 27 Oct 2021 02:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109C56E508
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 02:57:03 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z20so4758124edi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+MnMGWD/0lv6QE/2RZDyhTwihVaLaY/cF7VXa6a77gU=;
 b=ZaNVx/jqk9FWOrIgexWO/hOBqGfCeeBmqbojUEelH+VIpmg5St9QloHjV2C1+VvhTT
 t7MPi+nZ4z/Fo15zsr28uLoGGxiK6FvKZMnMqv4hPPkre96n58ktGO355LHuuQ5H1CqH
 eaEuYLl1bJjgYwCaabrq+lq4D9ku5jq+J+TaScuvWE1m5CPtDTOaUx0EXIMDiMZ7uyUU
 9zjDyq2q16TEwZgTO72CuOGgixDNxjAF67A96baU6kD8hkWePLImvIALsVxiJPFPa9x+
 2P3f7WuDYHsxQIk4UVy1JC7oR0xJovKp/QU50a6GrBYwoY87R5ClSagU53FAfV4zXlch
 fOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+MnMGWD/0lv6QE/2RZDyhTwihVaLaY/cF7VXa6a77gU=;
 b=43rQOCUaU7wq3XozzcvIT/VYJtS+1s2W7zoPKAI8YuNpXcz8u0zIM7cTMZyt8ETnrs
 uoguaI5DY5vxpG+D/ke2q1rm+1boVf7BQOenGGO81hWUKp+lsJLTvIy/0SVlIQuL0sTm
 n9RlVQJsjD/BTW6cj1Y1dGSNnwxwrFQFJgQ5SyvZc3CLJ6dzmMS02wuifTr6IBBvkUjW
 gWB2UUiDLuFwmL9PXLpc76NJsoH4jJHgnPUFualRTudQht8s3ZRRuIRB85k47C4hVvzL
 UKVOLDQ61bAdOjpLIZTLKw8B+55OFK2iKeHUFmic75PHeEq/LItoRs57xGcBXG+NekHj
 VNCw==
X-Gm-Message-State: AOAM5300TghXjTJuJFAKf+djyMUneiyUwAbsrrXAt37PVKgZ2BJLZc3r
 hVgFRjguM8wokDN7LWidsV4DAIUnt00t+EFbi7JlBA==
X-Google-Smtp-Source: ABdhPJwIK61/V7qcKbhx4yii4iHXjQOUbVeTBUCQwnBLVrY1BbKYFYOd48L8rLqNKXbJxAp/xU4REFHyMBfMvTKiQy8=
X-Received: by 2002:a17:906:c7c1:: with SMTP id
 dc1mr35935786ejb.6.1635303421412; 
 Tue, 26 Oct 2021 19:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <CA+G9fYvdhk-H8wBDdaPmRMZS_egxndncUkbZ92HCnUFD1g_wSQ@mail.gmail.com>
 <b26491f8-66a4-d532-e866-2dc0ecb922d2@suse.de>
In-Reply-To: <b26491f8-66a4-d532-e866-2dc0ecb922d2@suse.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 27 Oct 2021 08:26:48 +0530
Message-ID: <CA+G9fYvsfNO5qNj7TChXQ_si1xDwL3gqyM+8SUgCowocpRqKdA@mail.gmail.com>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Thomas,

I have tested the fix patch [1] and it works fine for me.

> Could you please try the patch at [1]? It fixes the problem for me.

=F0=9F=8E=89 Pass: 6d61a7c3bc2a ("arm: multi_v5_defconfig build fix")
 arm (multi_v5_defconfig) with gcc-11
@ https://builds.tuxbuild.com/204SnLe1DFWQ4iAHpwAMiyUcpsL/


> Best regards
> Thomas
>
> [1] https://patchwork.freedesktop.org/patch/461426/


Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh
