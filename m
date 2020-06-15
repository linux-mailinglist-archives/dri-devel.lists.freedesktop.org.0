Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F81FA426
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 01:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4486E558;
	Mon, 15 Jun 2020 23:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362836E558
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 23:34:49 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id o2so10414043vsr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 16:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v7N0YxSuMH4D9rTnapFHftODF1N2BLDsJbU6TCHO/Qg=;
 b=XG5eBIPguxRxvrNMnZxci9ZrieN12g/yQUbT1Mq6HVHO+ZXaKPoEskuWdx98rb3Vkg
 57cdpQrxf7BXxFaxZPZ5Nth/LfndEbaNqzTN+WiLN1PWzxKJRjPrLUAV93TkYrZZVjK2
 UgVoH6RJDbrAIZMSWSpRIFw3sTNbTOqySi904Lp0Nw98xl7bKyfjvGXUH9YNrTycHt4D
 4g4U19RngVclWtPWvFkDRavpWGkzawf3H6QD7NBNuGzRHsOesEthods1KrkUI5Jr4iRn
 FYwrjC4KbC/D9URRWvvR4LmwiIH8ZfOKMdHNHUoWNwSl5R2VLLVXAixdOXWpGZ+mf7y7
 c9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v7N0YxSuMH4D9rTnapFHftODF1N2BLDsJbU6TCHO/Qg=;
 b=MNMVqwi6G975CKacr4dXSlG/5uP9sQPRbj8vyt/nCn8MqzxWOpBZBVf/a/b1ztoHOo
 Srt8fGVSf9FdJEL0fknHcDMJVH9chXVcxkLQHAIyhADWXBa3DNybqjtXUVMmU/LVF2RN
 XXWQBd/R3NoNEMlCcNIS+F+o+4tCSwNiXMlEAXa3J5phqO5uBCqdT/BqpfaxVyhcSAcH
 WJ84kX2AbnHRrsstJa2rUbVMPL8+od+42+70c1U/h4zlYtLudVG3nLOs3sh/WXG31AO8
 l4jfgu4aPajnrAXLZJXIuBcF5k0tG1kY8C/vVBHPgSBmPmXmEXLWD3IpKxr8P+IRFpfg
 tzuA==
X-Gm-Message-State: AOAM532N7ThJO7SPXeK8gWXFdTFJRyG/uR5Wo65uefC4qIBQtusntrli
 Agx6Zja8+CnTFvMgYZ5KvfU+NW9KE1d5rPD9zcg=
X-Google-Smtp-Source: ABdhPJw3ZPkbX9BjIq7F4jI/Zi2sH+yeC1FgKNWXr8ID5D9/ms1ZrJcfRvnChBn3jQReE0CjUtT07ryK0CknKfdTEhs=
X-Received: by 2002:a67:c18a:: with SMTP id h10mr115652vsj.186.1592264088189; 
 Mon, 15 Jun 2020 16:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200613223027.4189309-1-linus.walleij@linaro.org>
In-Reply-To: <20200613223027.4189309-1-linus.walleij@linaro.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 16 Jun 2020 00:31:07 +0100
Message-ID: <CACvgo520jX2k1GdhLLqYJBOoEQ1ZQo1QCW21-EH5W2J+=KsOFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: mcde: Fix display initialization problem
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
Cc: LAKML <linux-arm-kernel@lists.infradead.org>, Sean Paul <sean@poorly.run>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Sat, 13 Jun 2020 at 23:30, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The following bug appeared in the MCDE driver/display
> initialization during the recent merge window.
>
> First the place we call drm_fbdev_generic_setup() in the
> wrong place: this needs to be called AFTER calling
> drm_dev_register() else we get this splat:
>
>  ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at ../drivers/gpu/drm/drm_fb_helper.c:2198 drm_fbdev_generic_setup+0x164/0x1a8
> mcde a0350000.mcde: Device has not been registered.
> Modules linked in:
> Hardware name: ST-Ericsson Ux5x0 platform (Device Tree Support)
> [<c010e704>] (unwind_backtrace) from [<c010a86c>] (show_stack+0x10/0x14)
> [<c010a86c>] (show_stack) from [<c0414f38>] (dump_stack+0x9c/0xb0)
> [<c0414f38>] (dump_stack) from [<c0121c8c>] (__warn+0xb8/0xd0)
> [<c0121c8c>] (__warn) from [<c0121d18>] (warn_slowpath_fmt+0x74/0xb8)
> [<c0121d18>] (warn_slowpath_fmt) from [<c04b154c>] (drm_fbdev_generic_setup+0x164/0x1a8)
> [<c04b154c>] (drm_fbdev_generic_setup) from [<c04ed278>] (mcde_drm_bind+0xc4/0x160)
> [<c04ed278>] (mcde_drm_bind) from [<c04f06b8>] (try_to_bring_up_master+0x15c/0x1a4)
> (...)
>

Worth adding Cc: stable or Fixes tag, so this lands in the stable branches?
If anything I'm slightly worried that w/o such a tag, the AI bot (as
used by the stable team) might auto-nominate this even where it's not
applicable.

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
