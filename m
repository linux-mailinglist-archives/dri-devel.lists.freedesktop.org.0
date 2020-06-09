Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB41F4F2B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFEF6E43F;
	Wed, 10 Jun 2020 07:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D809389CAF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 14:04:22 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id o5so22799811iow.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 07:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M11TlZ8BCkkiyM14zjB6SRMJjOFPdi0sycPDLMDZtzg=;
 b=WcKt86PI06koGDiMZklr+HDKxwBnBrf72EEYGJhlLB2eLfI7DuOgfRzmxlQpnDf3P+
 xcqPS5N2kWZzPQLjpuC6LQTeBJYkCixcYSwseGmp3ZHoktGwLwjZDAryXzofcxVTm7tI
 +ZeDAoYJLmTSokrxd3haNf0dUpgnAdHtIhxPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M11TlZ8BCkkiyM14zjB6SRMJjOFPdi0sycPDLMDZtzg=;
 b=KL4nIyhckNA+B0u2jBwXRC5dqf9MmEa7z0yBrbUFkG2xPXrWewgW6ktaAPZuOa9VyS
 SRSjBRtiE92mWTM4/RYKNBkLtX+Ip3dQo4sOG4la1z5s8pmsnCoQzZ+wK+6X2XfYXumK
 cXTnqwESqVw7Fdfu9wcsKPB4oXR/UGahkitB/WwayLL9RM4ZLGTGT+68+q2F6mdDRL4Q
 bCyAH4iKHQK6K1pnfHQ8yt/3/qY757/q0j5CSuKEOC/scgoUoScVXlyOSKy8iD+qcG+5
 iWffiH+nvIQzgnI9kKNMQzMyBqACVLyXHEGm59T9k7tt8I6pj0fD05BSXnyZDsDDmJ4b
 svrg==
X-Gm-Message-State: AOAM533DuLtqMnCyuzohT8b3Kx0GfekgrALwXgaBe5CaJ25rmwY2naxO
 NW1u3g2JmhMTaTohX7xGbpq8leHvSmV+Eb+rDBRk6g==
X-Google-Smtp-Source: ABdhPJyG91jHkheJimS86A26g34xw4jYgUCjF+/j9VS/jduQO60MV/ip1Uo+HQrXE9vAcZ0eYj2cAUokFLTwKjv6VUk=
X-Received: by 2002:a5d:858a:: with SMTP id f10mr27458957ioj.184.1591711462114; 
 Tue, 09 Jun 2020 07:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191458.1260397-1-arnd@arndb.de>
 <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
 <CACRpkdYUTujUX7FdwFjehFVAOLz_w6epXRzYc8e8yB=zDsRCyw@mail.gmail.com>
In-Reply-To: <CACRpkdYUTujUX7FdwFjehFVAOLz_w6epXRzYc8e8yB=zDsRCyw@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 9 Jun 2020 07:04:49 -0700
Message-ID: <CAJs_Fx4V9JkwATGeY8eV=Z1khr6z=OVd+B=YRJ1RY7xxxM47_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix link error without CONFIG_DEBUG_FS
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 9, 2020 at 5:48 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, May 5, 2020 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Apr 8, 2020 at 9:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > > I ran into a randconfig link error with debugfs disabled:
> > >
> > > arm-linux-gnueabi-ld:
> > > drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'
> > >
> > > Change the helper to only look at this variable if debugfs is present.
> > >
> > > Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > This fixes a compilation error for me on the APQ8060.
> > Tested-by: Linus Walleij <linus.walleij@linaro.org>
>
> Could someone be so kind and apply this fix to the MSM DRM tree?
>

This should be fixed by 20aebe83698feb107d5a66b6cfd1d54459ccdfcf in
msm-next/drm-next, are you still seeing this issue?

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
