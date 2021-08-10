Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C93E5A68
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 14:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC9E89686;
	Tue, 10 Aug 2021 12:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7843489686
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 12:51:39 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z20so4129232lfd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=COWCMGHIbMOml8oSzWr/dWDbmo5VnvHeIUlohNVVgbA=;
 b=GgpnMPCih9w2+JFm1yn7J9s/amiSzIA7+c25pxNxAUCaicDRMluo90cki8m5iLTPF8
 yXwaUEfjsTM0D/fjrDnVWnC2ir6tPXRZvytSsBO/XHB+qkcDHSA2ycrx8xmR8Icc/rcm
 e12+e9A+5QBvwKORXO9ffMvGL5FcC+EMczIaQMSURwlK+W8aS7wH3QxMmDbSXkjoZV03
 3xMCYgOJlCSut6+x/Rqe3BBrGbbhvoqPRBnLsmjVT0FLjts1PkJWQ07jt5aBhg11M3vF
 g6dFW1cCKjIdTtGrm2Qpd5CbcKDgwgg6rNHcqMiv6XDqW4pRo/+k1hksDEpesz/FUWY5
 ijJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=COWCMGHIbMOml8oSzWr/dWDbmo5VnvHeIUlohNVVgbA=;
 b=MF4jRpN1CXoazkwgn814Y03KKcujbOj/WsKF61NRntXfeBPl+ywxJ0+XcWhdFi1K3m
 iDavUdS2zBwOUw7dVfkfkjL6Z3fQboRsbxV7/4CCzRmxX2xOxM+kWH0t1qGDMbCBDrZm
 fYKT0noJooeTGohAKmKLJzn8WGlThFlw4Thm4qNd8TA//K4sCzAGoGyB8Gu9wDY0lwxF
 SbVLNBJdkSX2YK9BHKQ6TU6dK6JZVjs6BMWClm9le9UUqze6pgWb+cJI7YHpGSuHI7ix
 K+I6QvZuXt3g+ia+2l0/f59OM+AQEo51LduE76KzD6KIElx1ARF6TJh/L20LazBek8dT
 JIhw==
X-Gm-Message-State: AOAM533aOnSruU6XW4+40hOguiXGz1iCIHOxklbczpIOLMsBs9O4U5rA
 j9VdWmv6KuFyOnzM5rrTZQ1u4oNUFBZu64IL9Vs5Gg==
X-Google-Smtp-Source: ABdhPJx9IsgfsTOT8THkhkunUTedenh0kP5K6wZ864dEuCRjcGxI/3CsvwqdSFqCuqShDKeibW0Taqk3bG/qjmKS84A=
X-Received: by 2002:a19:c7cd:: with SMTP id
 x196mr21304513lff.465.1628599897540; 
 Tue, 10 Aug 2021 05:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210722044155.864600-1-javierm@redhat.com>
In-Reply-To: <20210722044155.864600-1-javierm@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Aug 2021 14:51:26 +0200
Message-ID: <CACRpkdY9UNYEs3w3JHLR78OmPSA+wkLb=FDP5kXdWTZpxnRU1g@mail.gmail.com>
Subject: Re: [PATCH] drivers/firmware: fix sysfb depends to prevent build
 failures
To: Javier Martinez Canillas <javierm@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Peter Robinson <pbrobinson@gmail.com>, kernel test robot <lkp@intel.com>,
 Borislav Petkov <bp@suse.de>, Dinh Nguyen <dinguyen@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 He Ying <heying24@huawei.com>, John Stultz <john.stultz@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Jul 22, 2021 at 6:42 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:

> The Generic System Framebuffers support is built when the COMPILE_TEST
> option is enabled. But this wrongly assumes that all the architectures
> declare a struct screen_info.
>
> This is true for most architectures, but at least the following do not:
> arc, m68k, microblaze, openrisc, parisc and s390.
>
> By attempting to make this compile testeable on all architectures, it
> leads to linking errors as reported by the kernel test robot for parisc:
>
>   All errors (new ones prefixed by >>):
>
>      hppa-linux-ld: drivers/firmware/sysfb.o: in function `sysfb_init':
>      (.init.text+0x24): undefined reference to `screen_info'
>   >> hppa-linux-ld: (.init.text+0x28): undefined reference to `screen_info'
>
> To prevent these errors only allow sysfb to be built on systems that are
> going to need it, which are x86 BIOS and EFI.
>
> The EFI Kconfig symbol is used instead of (ARM || ARM64 || RISC) because
> some of these architectures only declare a struct screen_info if EFI is
> enabled. And also, because the sysfb code is only used for EFI on these
> architectures. For !EFI the "simple-framebuffer" device is registered by
> OF when parsing the Device Tree Blob (if a DT node for this is defined).
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I don't know who picks up firmware patches though, I would send them
to soc@kernel.org if nothing else works.

Yours,
Linus Walleij
