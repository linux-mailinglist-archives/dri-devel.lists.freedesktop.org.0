Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8FD1C60EE
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 21:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054A96E811;
	Tue,  5 May 2020 19:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354586E811
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 19:17:27 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id q10so1999453ile.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 12:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JGWtDPFJFvJbELqtTuPzk6LfT6mv0oz8nn2/9XlSU3Q=;
 b=qclpj/dGRht+Y7fUGP7/FudbQ/5yEi9etymvceMusEjDnIk6dwjvat9davZniUU2+y
 pmIY0b7VIzp4tY2xYfAsDIZwFZhfJ+Eo83rvF+DJGM0A7HVhECZ6s3v4NXHkIHWWnNsR
 NRSUAnbVrsbT/jfYvZ9NlQPy8B5fAcVnbvxLlyVI6AlPKWtfCbqcQ2G/MxpBy4PdwKYI
 wPr7rTYfhyDT846ttujxIoTNCxOGLBSZzfkn1R/MlyFmtjPnLM6EXzTRGhalX1htKJ3p
 jeqWaKWnAM3umzRW6CKtjigccqFOUjH/y0sK1j5kRO2kASTTp3Zy5R9fTIjttmRy2PRX
 Kz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGWtDPFJFvJbELqtTuPzk6LfT6mv0oz8nn2/9XlSU3Q=;
 b=qYW/20LWuFSmCpT2R2K+gh7WQLOXnIFPQ30JGtWZZ6c+rLxg7o6WPZSl60rNTQ+IDh
 sodACu5PECsYvnCAsiEkoQZh2/fZh60fCB3p06uPfLrdFC5Te4gmpjbXY+WcbQwLbQ7r
 3rWYC87ckwOD0P54qjMKeNUoJFab1Z9hFMEb2HvXtg+sTtY8Jz11cILBs0TCSg1ATfEx
 ZRGE0x9aEFaBgr9jEJnqqUlMA+tOOl++rm5uZKr5hjHoFcJAVmQhCfW+h9pXLwfr7kil
 kTZZmhrdWdnaDr5LaGV4EdvfkhxcPBZ/WhnDuuxT2n08AdPJlRGifCvcdXAEN2VMoT8t
 j6Dg==
X-Gm-Message-State: AGi0PubrtS+hP+r3HAiO+1SgIr1OACWB9o9bpzLXDzeNB82Mk8T0voTn
 bKHhjxgzM/FpLwFrhcwZZNFu8oSaagAVETIQbMk=
X-Google-Smtp-Source: APiQypKELxG2Zu+/IgnOHznksCTrFyYCI3/sZ1fZH4dlfuIptkeTpaoBq89BBsr63uaFngoOVdlLMTMHMYn3exK6JO8=
X-Received: by 2002:a92:b69b:: with SMTP id m27mr5240435ill.250.1588706246508; 
 Tue, 05 May 2020 12:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwc6KtGT4+Y2jT1fxzYrkcqvkxgs9GGqxT-zZtj6ktRf-67jQ@mail.gmail.com>
 <20200505190336.GA12664@ravnborg.org>
In-Reply-To: <20200505190336.GA12664@ravnborg.org>
From: Artem Mygaiev <joculator@gmail.com>
Date: Tue, 5 May 2020 22:17:15 +0300
Message-ID: <CAJwc6Kv8D+h-eYsGyk2+QXvbZY5MA8B5ExVBW3mEY9cCbPqZ3Q@mail.gmail.com>
Subject: Re: Question about sRGB framebuffer support
To: Sam Ravnborg <sam@ravnborg.org>, Phong LE <ple@baylibre.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam

On Tue, May 5, 2020 at 10:03 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Artem.
>
> On Tue, May 05, 2020 at 01:24:16PM +0300, Artem Mygaiev wrote:
> > Hello all
> >
> > I am currently working on DRM/KMS driver for Fresco Logic FL2000 USB display
> > controller [1]. I have already implemented a POC driver [2] which is working for
> > me, although there are still plenty of things to improve or fix, of course.
> >
> > So far I have one thing that I somehow cannot find in DRM/KMS documentation or
> > existing drivers: how to tell the system that HW expects sRGB (i.e. non-linear)
> > color encoding in framebuffers? This is a HW limitation that I cannot influence
> > by configuration.
> >
> > Any pointers are greatly appreciated.
> No clue, I hope others can help you.
>

Meanwhile I have implemented conversion to rgb565 in driver, HW seem
to handle it correctly.

> >
> > [1] www.frescologic.com/product/single/fl2000
>
> > [2] https://github.com/klogg/fl2000_drm
> I just visited your github site - and noticed you are using the
> it66121 bridge.
>
> Phong LE <ple@baylibre.com> have recently submitted a patch to
> add this bridge to the kernel:
> https://lore.kernel.org/dri-devel/20200311125135.30832-1-ple@baylibre.com/

Thanks for the pointer, the code looks familiar :)

@Phong, feel free to add me to reviewers, I'll also test it with fl2k later on.

>
> I did not really looks at your code, awaits that you feel ready to submit
> it.
>         Sam

Best regards,
Artem Mygaiev
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
