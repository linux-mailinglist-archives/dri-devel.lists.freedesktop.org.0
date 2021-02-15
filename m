Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E031B70C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 11:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF79D6E17F;
	Mon, 15 Feb 2021 10:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB116E17F;
 Mon, 15 Feb 2021 10:25:03 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id w18so3903069pfu.9;
 Mon, 15 Feb 2021 02:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KM7TCDJh8gpTDG5Q8gExFbYPTexcOat3ZceHInBbrV8=;
 b=c3PzPRmaGCtdEsA8zdKsW1imgEwC/GclVJD5S986AFr6tm+OjUZ/TgYrymzD7eSCWf
 7ZIgFWF0M4PE4EoyCLisGu2VnwRKe9Yys0w6tDOwmHGbDnHtU2rGxTYDIKomvYdjDsLM
 xkyDJj1MTkh44wTgqxx4Ghn1hZfPqFG06KEJ41Y8vBlBFM+1wXHVcWlTLbfDOEMzOivo
 Z/pawEs3DFuErC4RjEtWEhQirxX05LB6RELJshvrnotY1/YHOkT1V1YmYBpagRxE5YVp
 BAyK0sccTeP25aX54Q0RnrgdBohiisQU0dTpEg35oVFWSW37NQ4/5GT0sWcfs3gS03o3
 eXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KM7TCDJh8gpTDG5Q8gExFbYPTexcOat3ZceHInBbrV8=;
 b=gRllp3xrf9q0gI5nj+bYH7xlpfWmYqiVEugFULB3fVCBywKdQhMGBrbTVSRmSN5wjt
 9GyU3So3/cYGATB+4IH39dhsNuElZGH1Lx0p5/m2vcKp82rzGbNBCvqXpRCrvPvKqu/1
 5/r+PAmHUwiOSuViX1/w4NeQCqD5LG7sbI+AT/xNyASwayiT+eb5lWj8lTrbz0vQpFZM
 JuoFfk53RYTT3tTaBfLV/f1kjrmB7vJr/xBl6+OtQGvgY71BWDC0M7UO7KdPoTEuIqU1
 FXvmB/uajXscF1TwrwG1OjE6KoFZHjarMbKRlJK87GwJLEep+LmSUHK9Gu/vL6cvPKOv
 2w2w==
X-Gm-Message-State: AOAM531c43NCuXkrGt9H2hiX/okDQovVh2jwzkaJEzzRjFQaHwD9f9xH
 IBcMhG/riE7wXOkz/hhISUd+P+EWpThnPO/tEO8=
X-Google-Smtp-Source: ABdhPJwKr8xtXgDkUwLSIEAkqcbUMWBE/NdHSN1a6AlWcRbzU7jBsVrPkdfP/Wrqrr1+7AhpnxNbVV17sjZSgU7O4r8=
X-Received: by 2002:a62:ea08:0:b029:1ec:a029:c04a with SMTP id
 t8-20020a62ea080000b02901eca029c04amr3471105pfh.40.1613384703064; Mon, 15 Feb
 2021 02:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20210215113939.03e44e3c@canb.auug.org.au>
 <CAHp75Ve2TyPx4H=7E92tKZ=GV46Y0Vzi-NwGMLrGtiXv-Nv7gg@mail.gmail.com>
In-Reply-To: <CAHp75Ve2TyPx4H=7E92tKZ=GV46Y0Vzi-NwGMLrGtiXv-Nv7gg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Feb 2021 12:24:47 +0200
Message-ID: <CAHp75VfGL_NmkpYxFDGMf781VyYEsvWSkQSaw-qTX8ch_S8cPw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the pm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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
Cc: Mark Gross <mark.gross@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Cc: Patrik (JFYI).

On Mon, Feb 15, 2021 at 12:23 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Feb 15, 2021 at 2:45 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> >
> > In file included from drivers/gpu/drm/gma500/mdfld_output.c:28:
> > arch/x86/include/asm/intel_scu_ipc.h:23:12: warning: 'struct module' declared inside parameter list will not be visible outside of this definition or declaration
> >    23 |     struct module *owner);
> >       |            ^~~~~~
> > arch/x86/include/asm/intel_scu_ipc.h:33:17: warning: 'struct module' declared inside parameter list will not be visible outside of this definition or declaration
> >    33 |          struct module *owner);
> >       |                 ^~~~~~
> >
> > Introduced by commit
> >
> >   bfc838f8598e ("drm/gma500: Convert to use new SCU IPC API")
> >
> > OK, these will go away when the drm-misc tree removes this file in commit
> >
> >   e1da811218d2 ("drm/gma500: Remove Medfield support")
> >
> > So, if you don't want to see these warnings in Linus' build testing,
> > you need to make sure that the drm-misc tree is merged before the pm
> > tree (or the drivers-x86 tree).  Or you need to include module.h in
> > mdfld_output.c before intel_scu_ipc.h (or in intel_scu_ipc.h itself).
>
> Thanks for the report.
> I guess the DRM tree should carry this burden, or they can merge the
> immutable tag themselves.
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
