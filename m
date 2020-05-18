Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5843A1D75CE
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 13:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FE189C80;
	Mon, 18 May 2020 11:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C081389C80
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:02:53 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id w188so2296284vkf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TnOYIJ1nfLcoOoATov1dQrgNfdtrmD6iK7NVPcue8aw=;
 b=gI8KKb5wg5v2qHES5+bGI2/rAEVGlQyfyhgnrzFvpj0QTqUU0jjur8KfbXqQxC3X0f
 Oj/NDuXfzLcdQd/Ky7f0T/JOKAJ8Vdp4Jp+v5J4MFuikS8hxIRQeSa6WLZPdXf/IvZvo
 aJax/8xpfJCVDt0reyd6pXnSQWAPWO4vhodo/7GrUhA3Wj1q4r9ICNUzfzr9dQ/9X5U8
 BGVDET7wIUJFycZ9kLSGcyKN/B78T3+YBK3P6gqxigN/jDwltMSv58jZGaYPu29V54Cq
 +HblOF0A+hSQXgwsedFi9JHkeOG9e2wBiDvPtaxeU9LaOfh/+XUHNKLwDfRtrMb23t6n
 oUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TnOYIJ1nfLcoOoATov1dQrgNfdtrmD6iK7NVPcue8aw=;
 b=WeR5Tou3Nys1YI9+qEiKTzcGbOT0QmtvfycPGHdfPvbYRcho37XTmEhf3c+FR15+Ix
 r/3oBu0vAcRUm+JJ3v7RKnGJTHoRT1hGvljGLDGNPav25tkd+iOEnLktZY9LEFfUbmHZ
 XRr7XuJYSn8Bkd6ZcyC4dRdkKEEtkpHWHDFtUq448G1dQvqAD4DWzqJbXxFh0+M5IQji
 Q+xB16DDayw4K6Ki9Yt2T8SkHsll8qyZHH3UPeY5mtRWo8I9WCOEr1MNy9tO5G6sYg3u
 bxBihrOtR0NVpsiXw4QuLXpjJPydaBXVzVhwhJ/cK1Nt1t4QUYIglY63nT7Q2A7/gUam
 VLYg==
X-Gm-Message-State: AOAM532Xpr4jN3+EkO1ZiSbXfWjIILTYQQ9eCxapDzm7+IWgCGWPWzlt
 t27hQc75zV1AsXOq4RW4ezS+8CP/QlFZjaY/8RLZGR3w
X-Google-Smtp-Source: ABdhPJwl3t0P8UBkzkdQpBdqsy7c2RThfeVs2tmdfCsbYsQ/Ug1eIUBiEG7XSaPXWJV0OnBR5xJ5kOPd74G5rKrixjc=
X-Received: by 2002:a1f:2bd7:: with SMTP id r206mr818859vkr.28.1589799772920; 
 Mon, 18 May 2020 04:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <9b0db95949b973c682b449906573e7b28c6113ef.camel@kernel.crashing.org>
In-Reply-To: <9b0db95949b973c682b449906573e7b28c6113ef.camel@kernel.crashing.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 12:00:01 +0100
Message-ID: <CACvgo52Qws2VF0Bui-V3VdL5CFLsean9H=shLBi5H2S2fvjFSA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Benjamin,

On Mon, 18 May 2020 at 01:45, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Sun, 2020-05-17 at 23:05 +0100, Emil Velikov wrote:
> > As mentioned in earlier commit, the riva and nvidia fbdev drivers
> > have
> > seen no love over the years, are short on features and overall below
> > par
> >
> > Users are encouraged to switch to the nouveau drm driver instead.
> >
> > v2: Split configs to separate patch, enable nouveau (Bartlomiej)
>
> Back when I still had these things to play with (years ago) nouveau
> didn't work properly on these ancient machines.
>
I believe you reported issues due to different page size for the CPU/GPU.
Have you tried nouveau recently, there has been a handful of patches
on the topic since your report.

Alternatively, it would make sense you rebase, cleanup and merge your patch.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
