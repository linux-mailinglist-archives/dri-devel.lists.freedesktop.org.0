Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F44259DAB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 19:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787A56E8AD;
	Tue,  1 Sep 2020 17:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EE86E8AD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 17:52:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y2so1272727lfy.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CMpumXM77amvS49xy/9DUPd0nToJWJsPGlhtEwylJnk=;
 b=jEUATbvPxL4kAIYHkXIwoYi+GGSwy30deBV1xEisCvLy42+AeuuUbtSSMFhjSVDXFT
 QL8dys2wre+530ezC5hLsEaDgQzfqNkRQ5IkWdI+nkdCjrWCq187OvcpkDXh0Fu6wGPR
 uLziA+UTyf2Co9pSHVky6Uhz6v4aFt7TsZN6KSyOg0BVnINFR9PNYA51N/V9Iwgo91PZ
 7YzcBS0VmydOO9pDsRtVgZKRZ7xmkN8nwscG5f3lxf9R0xbtrgAVOv37/cdIe9JbH9T6
 TVzMzAPT7z/09HXiI7jzAXJR5q1s6TqlWPfkcXFPOXGlA1xO9TmwTFrRxt2efTluBt3g
 84/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CMpumXM77amvS49xy/9DUPd0nToJWJsPGlhtEwylJnk=;
 b=XN6bV2+T6mqv8ZVU1KA98MYA60jpeFx2bfNfES2qOd6VeVNKxCJmSaA6jtd0LClEPZ
 szXF8/7Zc9YlvrKy+vKmI5s/RZi5yIKmh5duvu1hne1v4bp3awgi/LPPIJtGFMQTlCMJ
 lx0GOIWJbppUdUm8Q+l9jda5MYfdgTxpntOC4kJKY7tHj1TNb5dW1yjCoutejv2QgvHW
 o4pqO6M7l6bBo4fCmYSCEREIqzHb8CtSmghT+EXAPbNUewuigITPuLOgabv/wU2bacal
 Lz6bawvFc/u6wJsQTeLXYkh/puMb94UtSZ8G2z691ULaAyB01zoi91q8PRgOGyBKNF13
 NfmQ==
X-Gm-Message-State: AOAM530fnh5tBaBIad+5YVHLBJTVNq/RrKjyggOzcO5DWqnYuMPPK9A5
 BYV1jbVwn9sB49Nt51Sqjh4/tbKP3dvlJD0WryAYm4MnFOA=
X-Google-Smtp-Source: ABdhPJyyV/RxbSMWOGBItEFz4WiBpWYrsnMK3PtnzYYJr3XWLVbRhW7CnNJ4zOC11FhCqJC/ReoFdFPIRoAi/OMoOLo=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr1221019lfq.194.1598982756539; 
 Tue, 01 Sep 2020 10:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200820203144.271081-1-linus.walleij@linaro.org>
In-Reply-To: <20200820203144.271081-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Sep 2020 19:52:25 +0200
Message-ID: <CACRpkdYHB2SFVqpuL0GtPe-yk7wrA=nFiQk4f7Kj0aFB9rOAvw@mail.gmail.com>
Subject: Re: [PATCH] drm/tve200: Stabilize enable/disable
To: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: stable <stable@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 20, 2020 at 10:32 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The TVE200 will occasionally print a bunch of lost interrupts
> and similar dmesg messages, sometimes during boot and sometimes
> after disabling and coming back to enablement. This is probably
> because the hardware is left in an unknown state by the boot
> loader that displays a logo.
>
> This can be fixed by bringing the controller into a known state
> by resetting the controller while enabling it. We retry reset 5
> times like the vendor driver does. We also put the controller
> into reset before de-clocking it and clear all interrupts before
> enabling the vblank IRQ.
>
> This makes the video enable/disable/enable cycle rock solid
> on the D-Link DIR-685. Tested extensively.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Would someone have mercy on this patch and review or
at least ACK it so I can merge it?

I offer any reviews in return, on stuff I understand, such
as panel drivers.

Best regards,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
