Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB8B88C18
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 12:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3DA10E97F;
	Fri, 19 Sep 2025 10:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JfHlFJn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A93C10E97F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 10:07:23 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-74381df387fso999684a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758276442; x=1758881242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYhfjUK1x5CaHU+bBQpIf5Hfve0v31gXpshuVItW08o=;
 b=JfHlFJn9d/nJhbn7cmOeLJB8Yc3/zl6tvL1KqtAXqci/qhOk4tJQTriOTiUP3RKDRo
 +I5iAsxC3wZ2gMKFtkDVy74dXeD8ZRG3aQ8MOH40/1mAuks592yM6Lzp+Tva6lGxTZyB
 M+4PfXk3EFPUjtT54wFGFgnmfAg551VIlnO4MVM0SA+pKXFeazDLkC179VGUG3jNtw33
 SuvF8qy8uoA1HWkxrdkm5OOet1jwoZNv+oke2iCkQ+iKJbLf80epLdapeeQ+VIRARNSf
 VJBgOAychnvOuULPllc7X3eTzM24zLk0PzLl8mJSF3OgsMaTLOU7JYMQRr2UNLwmMsAF
 Qu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758276442; x=1758881242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYhfjUK1x5CaHU+bBQpIf5Hfve0v31gXpshuVItW08o=;
 b=PNNO+h2ud/J3O5wnK085uTZsPmEqSj+1QB86Z/XaP/TaF4m6SpIwqZ+p5mLeUb7//e
 spjBGDk/CqVyS4eQncVS5JUH6aIEoOhqMeOs+vjNUEsOen8JMbLA8z4OLllpTLfgEI0o
 meh50qcVUnmUJzncesvRwFp5Jse/g4vJtHrvGQ6PCtuajQZdmjrE8NKEo2KjNaD1/tTi
 tcUQ6GBlzZBHXqCfZVdTYuR7PmcdsJMynI0VJr6wKVVzC8sdNkB3rAdJAkyiEBUAuQqm
 2glsZ7m+Rl835/ipRCoWEHzriVipKfYgtvD0jO1AI65QaVVHwE/DmqZaLK0oJgoN7usA
 Uggg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1T9JSB0HznBQAxVOUn/Oi9jIVOrsdqVeXvUrRMiJ8HKEaVZbIksq9LSMlopZ1OD8ZFu8oGnP0OxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS5cdegE8cU+8HG1ga+ZeKTqdbdIeYy9aqNGXKKpwOuVMcUSiC
 04YD0bpZuCwSn2OMkx6yYFHUTCSmj8SBIcHhfOFzzyGRAz9BhyxYUql6PnmPCrYS4oWjKyV+g51
 fjXe8EXhNXeorwNNR51b0buUgW3CrW9Q=
X-Gm-Gg: ASbGncsqQip1sZTRiyrBUDbNNZHIed2CnqxFzp5EXr5flGwmaivA9lKk488Wp38LAWk
 kz5d5DpfetzkwjpJgccnp66oKPN47gOEcV71OS5YZ+BiXfQWs30mUB+Q6LCSbIMWG1l0/yQRRrU
 ZadbxSsTyW3FgShYv/A1i618htGBGJAgTEO6EpNo/qf5ByHkiudhv1PYxx/eDRmeJ5sapNv2vAE
 ePjgt0nDWrkIYwI
X-Google-Smtp-Source: AGHT+IG3pwAX0P0OmWvDUSHxsTDML+xUqsup0/py7274z3KYl9bT+8g9kp4A/IHN1kyclBFzjgxxAh2Ui20Z69c/0xI=
X-Received: by 2002:a05:6808:1382:b0:439:adcd:9ea8 with SMTP id
 5614622812f47-43d6c194b5amr939850b6e.18.1758276442388; Fri, 19 Sep 2025
 03:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250918150703.2562604-1-n.zabelin@mt-integration.ru>
In-Reply-To: <20250918150703.2562604-1-n.zabelin@mt-integration.ru>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 19 Sep 2025 12:07:11 +0200
X-Gm-Features: AS18NWDg_NlMhQXUpLYoGp9dgBPIiIu4R6ec8UuM0Fv8JoBCIBvXXeRAngP3GPU
Message-ID: <CAMeQTsb1dBpd+87DDpNS5uyM8sTAhzZmxNvE_RLZFAC2dD2Lxg@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Fix null dereference in hdmi teardown
To: Zabelin Nikita <n.zabelin@mt-integration.ru>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, 
 Alan Cox <alan@linux.intel.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 18, 2025 at 5:08=E2=80=AFPM Zabelin Nikita
<n.zabelin@mt-integration.ru> wrote:
>
> pci_set_drvdata sets the value of pdev->driver_data to NULL,
> after which the driver_data obtained from the same dev is
> dereferenced in oaktrail_hdmi_i2c_exit, and the i2c_dev is
> extracted from it. To prevent this, swap these calls.
>
> Fixes: 1b082cc ("gma500: Add Oaktrail support")
>
> Found by Linux Verification Center (linuxtesting.org) with Svacer.
>
> Signed-off-by: Zabelin Nikita <n.zabelin@mt-integration.ru>

Thanks for the patch.

I fixed the following DIM warning before applying:
WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+
chars of sha1> ("<title line>")' - ie: 'Fixes: 1b082ccf5901 ("gma500:
Add Oaktrail support")'

Pushed to drm-misc-fixes
-Patrik

> ---
>  drivers/gpu/drm/gma500/oaktrail_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma=
500/oaktrail_hdmi.c
> index 95b7cb099e63..9c7d9584aac7 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
> @@ -724,8 +724,8 @@ void oaktrail_hdmi_teardown(struct drm_device *dev)
>
>         if (hdmi_dev) {
>                 pdev =3D hdmi_dev->dev;
> -               pci_set_drvdata(pdev, NULL);
>                 oaktrail_hdmi_i2c_exit(pdev);
> +               pci_set_drvdata(pdev, NULL);
>                 iounmap(hdmi_dev->regs);
>                 kfree(hdmi_dev);
>                 pci_dev_put(pdev);
> --
> 2.43.0
>
