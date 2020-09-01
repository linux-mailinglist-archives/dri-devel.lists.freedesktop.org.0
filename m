Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09338259DD4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 20:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61F86E8B5;
	Tue,  1 Sep 2020 18:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774C16E8B5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 18:04:40 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id v16so1937756otp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 11:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+zE7ox0ywDYN1OeLMkgE979l6agCoJMD3xzmvypBDE=;
 b=Ipap6GUqdOvmbNmIjQWTpqSau0ISEVl6saoRlxVssQeZPfHFrOiUiYN/l0bCMfQEsf
 8xyGF3E8+CYBWoDizzB5AVWy7QlCJOJibMR80/hMKKFE67/33cnK0eM23PFGVrcs98cR
 24Gk2cRv6jblswhn7hTasFFu5Rf4MuBOjh1+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+zE7ox0ywDYN1OeLMkgE979l6agCoJMD3xzmvypBDE=;
 b=FwfSY/rKLB//FY5DRqlYbea3q1Vk4QUzb6+y9k+7naZSb9UKJBMd9pHI1JtW8kx8Us
 G3v2Hb8hJqeUI+8R/WJHiU02IjOWw0ovYztFOk+Bs8dYXyvkF0txyGpi4woYCpfprl8r
 SO0kET2OIzZFdpXLnTPCDx5gm2wnq+9grAqkHHMauHyJ3ylXTdKgmQgYN9VQWxaCFJ3U
 IzRum8nSL+oFjZESX7a2kwnstzQISKsISa26O4pt8qHRDVLeGY8QyNFuhkDOPYgkgtCl
 vliwXAbAZmvUoh3BQD3Wf/Bik85MAOcxuOK2/lWssXgLyP06SYpRTunUHt5REaGnaa9p
 S2/Q==
X-Gm-Message-State: AOAM5311+DfsVbgAR8KUeUOw+7viyACwSf/+EjO7JzptkvR8bRnU/ylE
 JMA2DkylFvWLPeLcClP9a64628UGgQ7t53PRAodW8A==
X-Google-Smtp-Source: ABdhPJxg/1XYItddKooMbgmsc5AprWCw5inYHmcfZ/4zjBVFPzx6bgfhLJth6A8xiN7kvxcaHVETKyPw8ppTtJB+g4E=
X-Received: by 2002:a9d:7a52:: with SMTP id z18mr997165otm.281.1598983479593; 
 Tue, 01 Sep 2020 11:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200820203144.271081-1-linus.walleij@linaro.org>
 <CACRpkdYHB2SFVqpuL0GtPe-yk7wrA=nFiQk4f7Kj0aFB9rOAvw@mail.gmail.com>
In-Reply-To: <CACRpkdYHB2SFVqpuL0GtPe-yk7wrA=nFiQk4f7Kj0aFB9rOAvw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 1 Sep 2020 20:04:28 +0200
Message-ID: <CAKMK7uH1NQZMfzEmmPzUuovON-MhLnvhWnkuwU8qSBGTxKQDaQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tve200: Stabilize enable/disable
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 1, 2020 at 7:52 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Aug 20, 2020 at 10:32 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > The TVE200 will occasionally print a bunch of lost interrupts
> > and similar dmesg messages, sometimes during boot and sometimes
> > after disabling and coming back to enablement. This is probably
> > because the hardware is left in an unknown state by the boot
> > loader that displays a logo.
> >
> > This can be fixed by bringing the controller into a known state
> > by resetting the controller while enabling it. We retry reset 5
> > times like the vendor driver does. We also put the controller
> > into reset before de-clocking it and clear all interrupts before
> > enabling the vblank IRQ.
> >
> > This makes the video enable/disable/enable cycle rock solid
> > on the D-Link DIR-685. Tested extensively.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Would someone have mercy on this patch and review or
> at least ACK it so I can merge it?

Does what it says on the label, looks symmetric, and "do this five
times for luck" is a classic.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

The irq reset looks a bit like maybe separate patch, but *shrug*,
since your description says you're missing interrupts, not that you
have too many. But can't hurt (and maybe if we have spurious ones it
then looks like the next vblank went missing, so makes some sense).

Cheers, Daniel

> I offer any reviews in return, on stuff I understand, such
> as panel drivers.


>
> Best regards,
> Linus Walleij
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
