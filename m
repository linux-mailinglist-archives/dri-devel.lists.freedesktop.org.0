Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9753039BA24
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 15:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE496E5BF;
	Fri,  4 Jun 2021 13:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A266E5BD;
 Fri,  4 Jun 2021 13:47:28 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id z7so1037959vso.3;
 Fri, 04 Jun 2021 06:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=op04Di3PZdwaBM43wkV7mDypOrvb+rZhXxhpmN4buHA=;
 b=uJL73wGFWEV+jOhqR9TLUv8l4zsIKpNu3jBVH/rcaEZWA0Zt/ShlPOUWHoOU9yGDaL
 pQDnaoFe0eX+8Ufr7JPW7h2d1wTVrHNAvPTAIwvtTjfFq4hOxhM0YTqbnAMbUTuJZb1r
 yP5gKN8WfIT2IEZMprUMVlEjC9WXzAcUH13IjItRfAzBPuYVk/zIZLjC2dEVh/riZ4Zn
 ZSva7EnYOLprgsEr1GjX2eEugjCme54OR1EycNZXTrKLshdhgt2L9RubZQn0bLiSyBPO
 CHDHSbiiv8tBWQv5sQ95YQbpTVgB96Fy8t0fXqSZHuk6LhsieUNSDsoBc8Ij6c3S065g
 losA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=op04Di3PZdwaBM43wkV7mDypOrvb+rZhXxhpmN4buHA=;
 b=LTYqFwbDbUvQVom45iUX/3h9UQYUibeNivQTDmIbk62mZZZODiH03RThJUs98C77ow
 8yLAqJ954DdCxTlIS/L1XBlGOp3i6BVlMiuInbE9i2trO6LnJd2Dp25ir+hpzcflKWuD
 qJytmSlex0kGM301VUSlzy45b4zYiH7D7ovMojRIRsUAGxsj6ziB5xHcNKRkX5hnXnWo
 HSBm7tnQ76yw2mKr/uaItCMHCPSFIP1rR1HHld3dDU0ySMZK1UciOm2lzS+WH6DLrJOT
 m4adOb8EGyGS9SDUgeEkm2pTVESMf5YOhuGzioob59ZFboIxs9tIr+NIeCE2RC7DkQ2T
 X4bA==
X-Gm-Message-State: AOAM532/XNEOWvVb2OLSh1gZkk/MGHZeW5nrWDCUDHSfifgg7vIsclsI
 MIFvo9qLZ12tw0oDx6ycFftBQP02445baXce14c=
X-Google-Smtp-Source: ABdhPJxQ/ctDBqtFrWZiAb6a5E5zZSvNln33fiDTOMOoYg7pUqsRD9CM0Hwq8khxERaFai1PpbpDFPxvKaKKLdbhPUw=
X-Received: by 2002:a67:878a:: with SMTP id j132mr2553712vsd.18.1622814447786; 
 Fri, 04 Jun 2021 06:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210516171432.1734268-1-emil.l.velikov@gmail.com>
 <YKKmsbvTZBwCUiRu@intel.com>
 <CACvgo53H7GAjN_aFsCBOw+xtVbjcbR1q-U3vdgjT1KUPKoMkkg@mail.gmail.com>
 <YKOiN1EFXz7TfYyV@intel.com>
 <CACvgo52f_8XzkKpzAsgQ-E4VHn9md+rZVbTau5H40PPRVa4SdQ@mail.gmail.com>
In-Reply-To: <CACvgo52f_8XzkKpzAsgQ-E4VHn9md+rZVbTau5H40PPRVa4SdQ@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 4 Jun 2021 14:47:16 +0100
Message-ID: <CACvgo53nKn0nKL195FEJ6gRyTyA_23QnLnP-awPXOtv4DwDyiQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: only disable default vga device
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kernel@collabora.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 May 2021 at 17:21, Emil Velikov <emil.l.velikov@gmail.com> wrote=
:
>
> Hi Ville,
>
> On Tue, 18 May 2021 at 12:17, Ville Syrj=C3=A4l=C3=A4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Tue, May 18, 2021 at 12:09:56PM +0100, Emil Velikov wrote:
> > > Hi Ville,
> > >
> > > On Mon, 17 May 2021 at 18:24, Ville Syrj=C3=A4l=C3=A4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Sun, May 16, 2021 at 06:14:32PM +0100, Emil Velikov wrote:
> > > > > From: Vivek Das Mohapatra <vivek@collabora.com>
> > > > >
> > > > > This patch is to do with seamless handover, eg when the sequence =
is
> > > > > bootloader =E2=86=92 plymouth =E2=86=92 desktop.
> > > > >
> > > > > It switches the vga arbiter from the "other" GPU to the default o=
ne
> > > > > (intel in this case), so the driver can issue some io().
> > > >
> > > > I don't understand what this commit message is trying to say.
> > > >
> > > Bunch of context is lost due to the patch age, so I'm not 100% sure o=
f
> > > the actual hardware setup where this occurs.
> > > Does the following make sense?
> > >
> > > Currently on dual GPU systems, we do not get seamless handover as the
> > > output flickers during the transition bootloader -> plymouth ->
> > > desktop.
> > > This happens as a result of switching (via the VGA arbiter) from the
> > > "other" GPU back to the default i915 one and issuing io() commands.
> >
> > Hmm. Does this work?
> >
> > --- a/drivers/gpu/drm/i915/display/intel_vga.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> > @@ -29,6 +29,9 @@ void intel_vga_disable(struct drm_i915_private *dev_p=
riv)
> >         i915_reg_t vga_reg =3D intel_vga_cntrl_reg(dev_priv);
> >         u8 sr1;
> >
> > +       if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
> > +               return;
> > +
> >         /* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw *=
/
> >         vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> >         outb(SR01, VGA_SR_INDEX);
> >
> Was able to replicate the issue somewhat and the above does help quite a =
lot.
> Feel free to add my:
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> Tested-by: Emil Velikov <emil.velikov@collabora.com>
>
Humble poke.

Cannot see this patch in the drm-misc or drm-intel trees. Is there
anything I do to help move it forward?

Thanks
-Emil
