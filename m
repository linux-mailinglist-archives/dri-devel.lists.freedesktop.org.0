Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425891F770E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 13:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2106E93A;
	Fri, 12 Jun 2020 11:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF376E91B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 11:04:16 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q19so10613998lji.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bTCLOyMG5WAJlNutWrbvXvzVWtTz1Ki5CE4mfBnFpug=;
 b=dopIPNC0Rsp46b+MXz6/oO1UNbscIY6zf6Pt0pb/CcwoXuN6bx2qlmAs9grcZw2RQX
 v9wTidKjbsgVhGi1AIZewuqb3MgYHuF590imU5BLQV1eb607hqUYJje80R9c3U77BqBk
 1D7TEdXmbySrLP2i3r6pXRylXpWq59EOr+2o117zkmECxWlemA+20S3Su7jiHLyW8qTW
 +rfEVC44lf/dDJMZdvBGrxY6YYcXhh89viRfnWKVxAcjSrOPUTs3l6U8g3F//LCgnlm2
 Qd1KPZQdyxVLSa27A/CLluErNY7z5DxbHk/zPiMY8QR8qqDBuqtNPecHwGSAeLTxiIzS
 n91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bTCLOyMG5WAJlNutWrbvXvzVWtTz1Ki5CE4mfBnFpug=;
 b=a11F/EHjq+/7tUX61GY3tJ6J+CbN1J/cAft/OljegQ2VsciIjIrQA/7l8x0kGo78aG
 kXpiGbYg+wpAxQULY81A4ibIsXdqx7M7MEPGSxxlsRMWmb38kUiaAJRcWTRbKrgp0T2k
 aAybT98NRgc/t4ipgIaXPiMK06IyJEQxpT1E9DG5A803hEQeBLd5RHoHYbCb76L9Xt/I
 lYezv2LbWL134Z2dluP4PiRuJ5IJVTn6JBFS1AlL49s40/g7G9UZoIaEeuT1Ot5TGZSF
 fnfbIGd2GQtkifyJYhorgNVquJGOiK6JhGMU3nk8C5LU/QC9xTHaYO2H/g2jSClln5JM
 0d2Q==
X-Gm-Message-State: AOAM531igCgf8SsysH6YscHqhkgZtJlCfA/jLdAkXg7Abxb5xEtDjiGn
 v+4ld8sQa3OAgLdraVWOz5vaAxLinJAoy6C7tMawnA==
X-Google-Smtp-Source: ABdhPJzJUo2m4/QEOCUVTfeCUSii5+RSbexYUNIuSMs+0+OTNWgT2a1MpJJeb11vL4/k5gZj/09L/Tm9A7bjqHhGJCM=
X-Received: by 2002:a2e:974a:: with SMTP id f10mr6883910ljj.283.1591959854875; 
 Fri, 12 Jun 2020 04:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200609200446.153209-4-linus.walleij@linaro.org>
 <202006101538.mV5c2loX%lkp@intel.com>
In-Reply-To: <202006101538.mV5c2loX%lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Jun 2020 13:04:02 +0200
Message-ID: <CACRpkda+GJpHQjvfjcFfhher+Vfr66DRgf6my2Fx7qg9=-5ATQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: pl111: Update documentation
To: kernel test robot <lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, Russell King <linux@armlinux.org.uk>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 10, 2020 at 9:38 AM kernel test robot <lkp@intel.com> wrote:

> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on drm-exynos/exynos-drm-next]
> [also build test WARNING on drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linus/master v5.7 next-20200609]
> [cannot apply to drm-tip/drm-tip drm/drm-next]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Linus-Walleij/drm-pl111-Credit-where-credit-is-due/20200610-041025
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
> reproduce: make htmldocs
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

What on earth was that. The robot reports on a patch only adding a few lines
of comments as breaking the whole universe, and none of these systems
even use the PL111.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
