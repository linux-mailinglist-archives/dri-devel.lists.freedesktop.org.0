Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232661FA414
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 01:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48AE6E532;
	Mon, 15 Jun 2020 23:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD256E532
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 23:25:03 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id x14so2725101uao.7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 16:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dHV//JeVZwUCJpEL3xxVW8ltiRmVeR1bCpb+AU5FTcw=;
 b=YTfX+qUwuVa8VI7ZmSwoHK21jcKKvIQ2AMJ4ei2fBY2W1aDUO8b4pNMb6bO7xd4gnK
 wnrINz5Yt9I7IoyMTxTIAwuNdpm2vAdbK/Yy2ff7XoIjYu6SMDJnBTZaSWIxHHkDpuYo
 Pu6dHwu+QYIstUMVR8ufgU2E3b7Y6SFzOhshZo+sOVsETs8j1DHRE1pisjgj3mKGZ6EC
 gHA4humBq1iZ3e5MAFgQg62px1mKcDM69QTxvVCn+m7AiHXEI7IILB9SXSBVowSKk2fF
 nwG7fd7uPrZcIuO4FYibvmYqgEH0eZbfFEjmkD71pFRi3QKxP4QSpqxzqQY1Hu67UzDm
 c5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dHV//JeVZwUCJpEL3xxVW8ltiRmVeR1bCpb+AU5FTcw=;
 b=lGgdn6AFGRQPeJFXMuWan9gyu4PpYAPdWoWmNKRyDRsy8jiZLNdqbbdMQ28oubl5gv
 DCaQXDi3m5RIDQru05Trl0lGDLJ9aq3OA1r7612FpX/F534KI6tNpnpw+kT3d4eskVaE
 qhKAwX1WUqgQDgqDe51bAaTIKwgta+t5kQt425KHiQCMazBcVjUG0jk4vuIbhEule3fS
 PjMgdYAB8HYmRue9d5qXxtYre9/lvxGHoQi1PAluZTEeLwFamQD9jbdnUPuHBvGjXG6G
 3g64W/tRao3e+C0QawrREe1jgBmEkR46rbBmsL1wl1/xEX+ix1ULK66VHlgSN5GOFmge
 NFlA==
X-Gm-Message-State: AOAM531GnYQq5GcMWffadZRKXGRTiAr9f3h7SfLCJVfQzsU9Ln6WCzUL
 Hi2LyJlZ4K5o6Iuu/NNT80R9yb2+1M6Xv82W6oQ=
X-Google-Smtp-Source: ABdhPJyozyB/pcw8SmH/NTCH9Xl0Zn9uO781EnwTZkuV48K7BasYLBvE1BZMVb+8Fd/BqmhEwxp9QCbFe6G8Gg5m59A=
X-Received: by 2002:ab0:2758:: with SMTP id c24mr42983uap.64.1592263502193;
 Mon, 15 Jun 2020 16:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200611082809.7838-1-tzimmermann@suse.de>
 <20200611082809.7838-2-tzimmermann@suse.de>
In-Reply-To: <20200611082809.7838-2-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 16 Jun 2020 00:21:21 +0100
Message-ID: <CACvgo53MoViSck=VpYb1jVaTXb1CtuR9t3251COFQ_H_qZucBg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/ast: Remove unused code paths for AST 1180
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: chen@aspeedtech.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, 11 Jun 2020 at 09:28, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -59,7 +59,6 @@ static struct drm_driver driver;
>  static const struct pci_device_id pciidlist[] = {
>         AST_VGA_DEVICE(PCI_CHIP_AST2000, NULL),
>         AST_VGA_DEVICE(PCI_CHIP_AST2100, NULL),
> -       /*      AST_VGA_DEVICE(PCI_CHIP_AST1180, NULL), - don't bind to 1180 for now */

Since we don't bind to this pciid, the (removed) code is never
used/dead. For the series:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Small idea below: feel free to ignore or if you agree - follow-up at a
random point in the future.


> +       if (dev->pdev->revision >= 0x40) {
> +               ast->chip = AST2500;
> +               DRM_INFO("AST 2500 detected\n");
> +       } else if (dev->pdev->revision >= 0x30) {
> +               ast->chip = AST2400;
> +               DRM_INFO("AST 2400 detected\n");
> +       } else if (dev->pdev->revision >= 0x30) {
> +               ast->chip = AST2400;
> +               DRM_INFO("AST 2400 detected\n");
> +       } else if (dev->pdev->revision >= 0x20) {
> +               ast->chip = AST2300;
> +               DRM_INFO("AST 2300 detected\n");
> +       } else if (dev->pdev->revision >= 0x10) {
> +               switch (scu_rev & 0x0300) {
> +               case 0x0200:
> +                       ast->chip = AST1100;
> +                       DRM_INFO("AST 1100 detected\n");
> +                       break;
> +               case 0x0100:
> +                       ast->chip = AST2200;
> +                       DRM_INFO("AST 2200 detected\n");
> +                       break;
> +               case 0x0000:
> +                       ast->chip = AST2150;
> +                       DRM_INFO("AST 2150 detected\n");
> +                       break;
> +               default:
> +                       ast->chip = AST2100;
> +                       DRM_INFO("AST 2100 detected\n");
> +                       break;
>                 }
> +               ast->vga2_clone = false;
> +       } else {
> +               ast->chip = AST2000;
> +               DRM_INFO("AST 2000 detected\n");
>         }
>
Instead of the above if/else spaghetti, one can use something alike

static const struct foo {
    u8 rev_maj; // revision & 0xf0 >> 4
    u8 rev_scu; // scu_rev & 0x0300 >> 8, ignored if table has 0xf
    enum ast_chip;
    const char *name;
} bar {
   { 0x3, 0xf, AST2400, "2400" },
   { 0x2, 0xf, AST2300, "2300" },
   { 0x1, 0x3, AST2100, "2100" },
   { 0x1, 0x2, AST1100, "1100" },
   { 0x1, 0x1, AST2200, "2200" },
   { 0x1, 0x0, AST2150, "2150" },
   { 0x0, 0xf, AST2000, "2000" },
};

+ trivial loop.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
