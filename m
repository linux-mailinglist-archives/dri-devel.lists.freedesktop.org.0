Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A060C3109FE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 12:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA5D6F40D;
	Fri,  5 Feb 2021 11:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3D76F40D;
 Fri,  5 Feb 2021 11:14:34 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id l12so7296069ljc.3;
 Fri, 05 Feb 2021 03:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jodvZXZJV/ktuYkXeYXaYKMnlFJkJCqmkyDrOT8X24s=;
 b=ZN+zXLUn5VPc3YjkaZtNDZEFmrBZTl3+BFCRaLRH2MBCUPMr4kH2YiWrUebhenNPdS
 lMglSCGlmEXkjJded4JC3sTkfCoP9oKgjrsU2yfKZHzAdNov5+A7Eh3EbFjT9hnVQy11
 vsg8TPoRC+2CU9oDe1WjYHyHzCgf2Qb8XP6d+Q9iFB0fD5VOB3d/9Nt0S8R0lfHOZOjx
 2wR4pij7Vao99UWQ7HGadIRtuwMzy+de7kazaiOgaD7XfsuvO3MeHDEGh0hrSFhq63wy
 B4yBuk5Gx+Jg9xZexvyq/qM9n4bxTAjylQt4279jGPAy/U3azN8q77P0bFLm/ZznTZjJ
 ENUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jodvZXZJV/ktuYkXeYXaYKMnlFJkJCqmkyDrOT8X24s=;
 b=N8YLyWDuBAdr0RW5B4OxgAUjXjZKWm1E16X4Msc5NJZ6vKpFV9uR+aA6Uc4k3xKMxZ
 IMmY96P5pFwKxKDp68TuIVfno4DYoCLT3IaXG69PYfrW10/0uBMusY5u2IxIaZOVTPP0
 enOL/PiDAsLn0sOBdGpvaZmT1opVnHttQGdScScSaAHoc82xuMtW7FuQochaTzj3nFhi
 NTAHB1nIKhudBMvKDFWxbwkYGJ16q/t4jXb+ej7MH8UWyFjyg7XcIse5kqfQMKG6pboA
 5VC43pyVLpcFzle/+u+9X2tWAfkaBQzZhEvOjn1clWYk4BOkFuyZ4ITcundtYvclR1On
 nwyw==
X-Gm-Message-State: AOAM532FacHqF/bf6t/yd2QmP/j8+FavJnWnFAo7NMkZtRo4XLJqPhVV
 9Yr7ArzediGohV+0OGYlT8EZJoETp+T7MmCzneU=
X-Google-Smtp-Source: ABdhPJxiIcmAg+6rvfRXrVJAwTv++V3HK7scgangGoU/StB/uTu2dCddy1o1UCYxLpfbZBSmMzcu//AII6B9tr1Cd5o=
X-Received: by 2002:a2e:a201:: with SMTP id h1mr2411016ljm.130.1612523672809; 
 Fri, 05 Feb 2021 03:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20210204155846.5aef94a8@canb.auug.org.au>
 <CAHp75Vct=jSQxu187hwz4Wrc_xRKiTmKFt_bgT-m-z=iW31drg@mail.gmail.com>
 <CAHp75Vc_xJFpUECZenOYEyJ6YDzfDFmJe9cTeGh0x-c_fKQPHw@mail.gmail.com>
In-Reply-To: <CAHp75Vc_xJFpUECZenOYEyJ6YDzfDFmJe9cTeGh0x-c_fKQPHw@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 5 Feb 2021 12:14:21 +0100
Message-ID: <CAMeQTsYK5GoL=VNB0CPrGi0Y-804N1q24dkii20OuV8=ckhmuA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 drm-misc tree
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Gross <mark.gross@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 12:07 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Feb 4, 2021 at 11:04 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >> Today's linux-next merge of the drivers-x86 tree got a conflict in:
> >
> > Thanks. I already asked Patrik yesterday day if DRM missed to pull an immutable tag I provided. I think they can pull and resolve conflicts themselves. Alternatively it would be easy to resolve by Linus by removing Kconfig lines along with mentioned files,
>
> Patrik, I have sent a PR again, so you may consider pulling it, thanks!

Daniel, is this something you can pull into drm or ask one of the
drm-misc maintainers to do?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
