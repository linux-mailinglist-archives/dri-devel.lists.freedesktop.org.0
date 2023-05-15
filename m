Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7785702694
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 10:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7640010E15F;
	Mon, 15 May 2023 08:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410CD10E16B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 08:01:50 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-b9e27684b53so10990474276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 01:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684137709; x=1686729709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fDbLM9AKIzDo+K7qoEp+5R2pQ1eDBh5/IlLRK58HgUQ=;
 b=gsGf7Y3N2KuwHvdtkHkyAfCiGZRBiO7sN1EbWxKGCmJ9iX8AgWGSfE91f2twk2GAGw
 WBAxwBxYEe2Bnpn66Ji3qANhQ0GgbQJB948/lvQe0lRYhgZ5/y+22CkqPUprKIIkynvD
 uIoUTs1oKIxDkmErv4d4bkTMZ3/4OMNmAW9xeAeIJz8NPdN6DqFNfSKfQYpk3r412i0Y
 QEcWacWm5dTNIojr89AWqeXVMdSnSydXOrLVn1JapZpfrbgs+HvSKeeuE4QvwjPleGKI
 aOj5bmuGsjF+8s3BQWYhHG6JwUZkBP2qnvvrijO1hHDvCg1o8Kpe60x/t68P2X+oAjiv
 YWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684137709; x=1686729709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fDbLM9AKIzDo+K7qoEp+5R2pQ1eDBh5/IlLRK58HgUQ=;
 b=Vvu3T9A4du4A8gqY1ryLM/NVKU3UdnisKoMS3Mfd8S5iGRZFv2I0WDAzTSr8LGbTFz
 IYMInuf8MqV7Ss8xbO7dMX+NHQaWGwQD48DuLjJ5bA0ylfnZPInzZKJFmJ18nXYyWWcW
 5OO+8DWRNrpL4dcUGf1D58ybpsOjheVGNlPjf8O3iPYBe242Rhp2hFZotX6jy4xhJ5JU
 CbJcjA6rAl9H3/5Gxk8j7yv1psA6CRpaDQF8fwe558BsCxB+I4vVUEnZ+Pri5SRrwU9G
 5e505CDl+qxWJil+hMiieXmUxPJclhFA2zCjbcyYz4QyHiFWXnFz6WKNTcyocmTbA/bw
 MkSw==
X-Gm-Message-State: AC+VfDygZjaj+j5XNRyut7oIpVyVE2fi7EA3EN3/z/FQTUS+mitu2cIH
 5h0e4AKpfz51RVUG/p4FfBc8hwK6dEynGY6dUwIQTA==
X-Google-Smtp-Source: ACHHUZ6kZLvkF+51fMWmKFFVroQNXRbsTOzlfcsSDfEnCies9Ja+AruPZX/bSw/HtyAkVt0eOsx0zDmVO52D0qsod2s=
X-Received: by 2002:a0d:f347:0:b0:556:1065:e6a8 with SMTP id
 c68-20020a0df347000000b005561065e6a8mr33995487ywf.2.1684137708914; Mon, 15
 May 2023 01:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
 <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
In-Reply-To: <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 May 2023 10:01:36 +0200
Message-ID: <CACRpkdamUcATRymMLxe5X9QHXbEZ9S4rd7KfEkVAV2gUXAaG7g@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: mairacanal@riseup.net, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 4:11=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> > Any hints on how we can fix this?
>
> According to a quick grep for fb_bpp, it's only used for the call to
> drm_fbdev_dma_setup(), right? In this case, you should set it to 15 for
> the models without rgb565. The switch at [1] should then pick the
> correct values.

I tried this. It does work better, the selected format becomes

0x35315258 =3D LE '5', '1', 'R', 'X" =3D 'X', 'R', '1', '5', =3D
DRM_FORMAT_XRGB1555.

But the display is flickering like crazy so the updating frequency is
totally off, which is because it does not scale down the resolution,
the print used to be:

Console: switching to colour frame buffer device 80x30
drm-clcd-pl111 c1000000.display: [drm] fb0: pl111drmfb frame buffer device

It is now:

Console: switching to colour frame buffer device 100x37
drm-clcd-pl111 c1000000.display: [drm] fb0: pl111drmfb frame buffer device

100x37! (i.e. 800x296), this display can only do 640x240.
Any idea what else is going wrong here? Or is this another regression
on top of the first regression ... I was under the impression that
your change was only about formats not resolutions.

Yours,
Linus Walleij
