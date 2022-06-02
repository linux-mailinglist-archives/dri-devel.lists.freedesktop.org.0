Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA51953B453
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F921127BE;
	Thu,  2 Jun 2022 07:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBAB1127BE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 07:28:12 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id e24so4217738pjt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nB4RpqHzrf2dzscMYpBZ0hckoppigDCESfuHf56Z8Xw=;
 b=HXfO3qGk49p3NrxMUx+iu3k7WEs+39mzQEbjL0YBJPLzi0TYNkKxFF/9P/sbuZ3npg
 oVx4DAKBQaq6ERkm7bmamqXriLsJ68easllhJXx2Ib4ujKXY/fwzewUqRzcp0d091b64
 K6nIdn9LOwYhBg073hDN7l9SmLG6W+fwoERldf7SBNi66jDbFXJNRua5/LV3grZ/2gx8
 HWlReKhFENIAKbs29dRusIt1xzcet04vgMMmUQxMJUTmK8uEi7fH1sl7w09S7sRM7qCq
 fnIHMG3zAIuc2gj7naSWPtk/+EF5wGGRQYZRcB5tECSvXI6Ztwjfd0CcfcmkKW6X7iBj
 YuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nB4RpqHzrf2dzscMYpBZ0hckoppigDCESfuHf56Z8Xw=;
 b=lK30frFGoM/2l7hI9ncDZEiO4JffpRdJcmQlKWuc9z1xvjyIb/Do1MzcBCmfqbUN4H
 /GvHnf/PIizMQX9TOO1e4h92zJUJ0lxDbNXQOvFJOIgel94kCchc3HTz9+ucnV1/0ufG
 bx73CmaQyeIKe1rgbVSLB9VIBVuWZ/P03dfaL8EOa2USJ8ov7/u8XYaKyZVSpCRkIuFW
 INPeLFXcX9wJ3dLwWzoT0p5W60Z9jJt19xyZ2o5uV5ZnAQm1KyqgCutHrHXMhnRSnbCN
 WboblJfvlcmpF3k2Y/tQFCgBKYC4XoUDrn6bXIm2Ot6HJ7p8DxN2a6lfi60CfNfv264u
 kscw==
X-Gm-Message-State: AOAM530h5PbhzeM+n2VbqtQPSc2/PTVsrCHQO6ZfSdLXtQYk3qXtLQvT
 KZVP/ApyJ0N/NKaeYF/OfndOvvxA2gb+89cRDUwi+1GB
X-Google-Smtp-Source: ABdhPJxyKUhVsINhif+ywx6SfVB8JN4BHwkM41vcShLyNEyEtPuz0jlYw2Txrno2p+S19UsY3nq7I17NNuKx+2eonU4=
X-Received: by 2002:a17:90a:c981:b0:1e6:75f0:d4f1 with SMTP id
 w1-20020a17090ac98100b001e675f0d4f1mr3864135pjt.62.1654154892078; Thu, 02 Jun
 2022 00:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
 <49d7203c-6640-60a9-f269-a7d19b0b8412@suse.de>
In-Reply-To: <49d7203c-6640-60a9-f269-a7d19b0b8412@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Jun 2022 09:28:00 +0200
Message-ID: <CAMeQTsZdzGj1hKoefacROUzz6=6iSW3-X_aCO0WfBQGFMbx+aQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] Cleanup use of ddc i2c buses
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 9:56 PM Thomas Zimmermann <tzimmermann@suse.de> wrot=
e:
>
> Hi Patrik
>
> Am 01.06.22 um 11:23 schrieb Patrik Jakobsson:
> > The various chips have slight differences in how they handle and store
> > ddc i2c buses. This series tries to put the main i2c adapter for ddc
> > into the drm_connector->ddc pointer. This makes it easier to unify the
> > code for the different encoders in upcoming series. Oaktrail HDMI and
> > PSB SDVO are not included.
>
> For the series:
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> I recently posted two patches for simplifying EDID handing. The new DRM
> helper for .get_modes fetches the EDID from conenctor->ddc. [1] The
> helper for .detect_ctx uses .get_modes and the EDID data to poll the
> connector status. [2]  gma500 is one of the candidates for using these
> helpers. If you like the idea, I'd welcome a follow-up patchset.

Hi Thomas, thanks for having a look.

I'll check to see if it applies to gma500. I have some encoder
cleanups coming up for gma500 so I might do that first.

Cheers
Patrik

>
> Best regards
> Thomas
>
> [1]
> https://lore.kernel.org/dri-devel/20220516134343.6085-4-tzimmermann@suse.=
de/
> [2]
> https://lore.kernel.org/dri-devel/20220531111502.4470-4-tzimmermann@suse.=
de/
>
> >
> > Patrik Jakobsson (8):
> >    drm/gma500: Use gma_ prefix for our i2c abstraction
> >    drm/gma500: Make gma_i2c_chan a subclass of i2c_adapter
> >    drm/gma500: Make cdv lvds use ddc adapter from drm_connector
> >    drm/gma500: Make cdv hdmi use ddc adapter from drm_connector
> >    drm/gma500: Make psb lvds use ddc adapter from drm_connector
> >    drm/gma500: Make cdv crt use ddc adapter from drm_connector
> >    drm/gma500: Make oaktrail lvds use ddc adapter from drm_connector
> >    drm/gma500: Read EDID from the correct i2c adapter
> >
> >   drivers/gpu/drm/gma500/cdv_intel_crt.c     | 47 ++++++-----
> >   drivers/gpu/drm/gma500/cdv_intel_hdmi.c    | 98 +++++++++++----------=
-
> >   drivers/gpu/drm/gma500/cdv_intel_lvds.c    | 80 ++++++++----------
> >   drivers/gpu/drm/gma500/intel_i2c.c         | 36 ++++----
> >   drivers/gpu/drm/gma500/oaktrail_lvds.c     | 50 ++++++-----
> >   drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c | 36 ++++----
> >   drivers/gpu/drm/gma500/psb_drv.h           |  2 +-
> >   drivers/gpu/drm/gma500/psb_intel_drv.h     | 24 +++---
> >   drivers/gpu/drm/gma500/psb_intel_lvds.c    | 86 +++++++++----------
> >   9 files changed, 237 insertions(+), 222 deletions(-)
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
