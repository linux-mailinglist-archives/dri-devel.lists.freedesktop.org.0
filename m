Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5866649216D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 09:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB21110E1F2;
	Tue, 18 Jan 2022 08:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613EE10E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 08:41:59 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id f24so1240344uab.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 00:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNdm03VJLU0BRz6mn7wssWGuiqSMikdKv8hszmF1Z7g=;
 b=fp0pPPybvHDMubZTQZ2HiAEe3BKoQi4gBiRzAq7Iz9ubc+qLu+IV5sUnqS6xS92hEJ
 MHFeW9ChCrmwjO+APVwRxSAi4Je4/yNwF4/O8YrNwEXeVXMHH6VniBFl01yu9GNlhr8f
 +nCjN3UZIM32m1fO8mkyRDdvuKv7/NG7jhSQBJIzevek4juklRvNJx+UGmf1U3LUaFO7
 XjGohvdkfUE0oBU6aM9OL+6a5UL+e3Hf5t273Vi53Cg4/3yiISpb0PS252pJd9x8RAas
 +xE4Q7CO5PLjsQDyaPHhbDn+fMgf5DVYesmLYNsrjbHEclKXNNknM02k1VFheZ6Ch3kM
 aslg==
X-Gm-Message-State: AOAM532TAzmqnK71RRbchRzu5ZbYdjDPOxYIVCPZUgPbqXsJaTeYB4kr
 pZT6MJMkx03klJFrCdIQslcfgxX/Hp9MAw==
X-Google-Smtp-Source: ABdhPJw1E+t8oPPIIZKpXwdFrpX1blBLN1IavalqnHX/vh1py4hkvMmljks0BjfPllXNqEy4J5TAbg==
X-Received: by 2002:a05:6102:304a:: with SMTP id
 w10mr8577410vsa.31.1642495318322; 
 Tue, 18 Jan 2022 00:41:58 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id d3sm3873050vsl.4.2022.01.18.00.41.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 00:41:57 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id u6so35269986uaq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 00:41:57 -0800 (PST)
X-Received: by 2002:ab0:1861:: with SMTP id j33mr8946930uag.14.1642495317021; 
 Tue, 18 Jan 2022 00:41:57 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
 <87ee5659dt.fsf@intel.com> <4f1d6018-d74e-8e62-ea4d-0ca79c6bbbc5@gmx.de>
 <87a6ft5thv.fsf@intel.com>
In-Reply-To: <87a6ft5thv.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jan 2022 09:41:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVE6OY29qB+F-QPgQt2q5xAYfyuPhKqSDrh_HhD9PPw9g@mail.gmail.com>
Message-ID: <CAMuHMdVE6OY29qB+F-QPgQt2q5xAYfyuPhKqSDrh_HhD9PPw9g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Tue, Jan 18, 2022 at 9:38 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 17 Jan 2022, Helge Deller <deller@gmx.de> wrote:
> > On 1/17/22 22:40, Jani Nikula wrote:
> >> On Mon, 17 Jan 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>> Seems like few people read linux-fbdev these days.
> >>
> >> How much traffic is there to linux-fbdev that is *not* Cc'd to dri-devel
> >> also?
> >
> > Doesn't seem like much traffic - which IMHO is OK for such a tree with
> > mostly just maintenance patches.
> >
> >> Do we still need a separate linux-fbdev mailing list at all?
> >
> > Yes. I want to have it seperate of dri-devel.
> > Actually I'd prefer to drop dri-devel from the list where patches
> > for fbdev are sent...
>
> Disagreed. If anything, this thread shows we can't have fbdev and drm in
> silos of their own.

Unless DRM drops fbdev support. Isn't that the long-term plan anyway?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
