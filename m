Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33B739BC4A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 17:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C456E0FB;
	Fri,  4 Jun 2021 15:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393C56E0FB;
 Fri,  4 Jun 2021 15:53:40 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id s14so5102153vsk.1;
 Fri, 04 Jun 2021 08:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=127yXl/UShns/2wfr5uGoIpOuzw7GyEKyVvhwVQyJtQ=;
 b=kc2SLka9HpEgOq6UnwF1ypcG6AHTDqKeBZ9DL/401PweFnSxe3WCwmPfRHGSHbuDU3
 jqFHQ3Za3LDxzmA0cxZWsYlu5j6yzr2z29OREnL1obbchE5hff8dDrZhMOZEmoAfNj2r
 nA11RZnrz3YIru2gpuCa9mpTw6Ljs2RNmdX1o8H4wT7pugxolAS6Dc/CMBDC8wNUx9eE
 RCeH2tzqXLwzkg+wkd38NMTyTF+b7aY+yahfh+x+kuF4c42T5/5KuRjZ8bID/GPdbTiV
 VrZ5UbLsFRNjTHYUNcKymryF77dzaLDaqpFTCfzpRFlky016ycd9awA4OV8U8QeL6jPq
 3VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=127yXl/UShns/2wfr5uGoIpOuzw7GyEKyVvhwVQyJtQ=;
 b=S6ssIYY1KM+ysvaKTfZDLBSIwFMmpC2BxwygIvSab00XJH8GOXsUeTP9m5SjcZlx7e
 6ndZIVg6l6KePi8klNuiYp+a0HeGt65E0d5BrdtmJcEDE3OnwQKpggRSa0mdq9MK7kXU
 0hlFYDFIEjIDhD+LYOFdWldyltY1HehNHSfvUIwpgZtg/Pvc3/u+/eBJMxtSBRo2aIT4
 4DsVR3M3fdU60MjPp1BaQnBJFrc9jYDvZLJtV7zWCXhjlZyDfJPXDSbz5uTjltNtd5I7
 xow+zG8P2EWtg6hw/Igy2yyrUgRWTjP72TrWNmZcWDwlVaTJeUJbHtamk8T2gyVGWZyZ
 QixA==
X-Gm-Message-State: AOAM530+r+fd8oXBlD3YbEvBbQLM/5bgJc/8XkqsJT2sVjX5K2cdYOKF
 PAMNolVF65OuAUhE26SJg0NlPIC/citiFsVVWO1nTpNy0uy0Iw==
X-Google-Smtp-Source: ABdhPJwkPZr+IHFzhqCJ7r0KBSOwI9/K6FbGyxR86OmmJ4Yyfrm4QJ5efZ/pc1y1pgsZNRLmO2rOqZEyaQRK988FKMc=
X-Received: by 2002:a67:878a:: with SMTP id j132mr3309449vsd.18.1622822019374; 
 Fri, 04 Jun 2021 08:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210516171432.1734268-1-emil.l.velikov@gmail.com>
 <YKKmsbvTZBwCUiRu@intel.com>
 <CACvgo53H7GAjN_aFsCBOw+xtVbjcbR1q-U3vdgjT1KUPKoMkkg@mail.gmail.com>
 <YKOiN1EFXz7TfYyV@intel.com>
 <CACvgo52f_8XzkKpzAsgQ-E4VHn9md+rZVbTau5H40PPRVa4SdQ@mail.gmail.com>
 <CACvgo53nKn0nKL195FEJ6gRyTyA_23QnLnP-awPXOtv4DwDyiQ@mail.gmail.com>
 <YLoz9oZSzdE97OOj@intel.com>
In-Reply-To: <YLoz9oZSzdE97OOj@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 4 Jun 2021 16:53:28 +0100
Message-ID: <CACvgo51AcM7Xd5p1kZVp41VU2yMfQ_Q7A8VCEGDJQpZ8H9=cow@mail.gmail.com>
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

On Fri, 4 Jun 2021 at 15:08, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Jun 04, 2021 at 02:47:16PM +0100, Emil Velikov wrote:
> > On Wed, 26 May 2021 at 17:21, Emil Velikov <emil.l.velikov@gmail.com> w=
rote:
> > >
> > > Hi Ville,
> > >
> > > On Tue, 18 May 2021 at 12:17, Ville Syrj=C3=A4l=C3=A4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Tue, May 18, 2021 at 12:09:56PM +0100, Emil Velikov wrote:
> > > > > Hi Ville,
> > > > >
> > > > > On Mon, 17 May 2021 at 18:24, Ville Syrj=C3=A4l=C3=A4
> > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > >
> > > > > > On Sun, May 16, 2021 at 06:14:32PM +0100, Emil Velikov wrote:
> > > > > > > From: Vivek Das Mohapatra <vivek@collabora.com>
> > > > > > >
> > > > > > > This patch is to do with seamless handover, eg when the seque=
nce is
> > > > > > > bootloader =E2=86=92 plymouth =E2=86=92 desktop.
> > > > > > >
> > > > > > > It switches the vga arbiter from the "other" GPU to the defau=
lt one
> > > > > > > (intel in this case), so the driver can issue some io().
> > > > > >
> > > > > > I don't understand what this commit message is trying to say.
> > > > > >
> > > > > Bunch of context is lost due to the patch age, so I'm not 100% su=
re of
> > > > > the actual hardware setup where this occurs.
> > > > > Does the following make sense?
> > > > >
> > > > > Currently on dual GPU systems, we do not get seamless handover as=
 the
> > > > > output flickers during the transition bootloader -> plymouth ->
> > > > > desktop.
> > > > > This happens as a result of switching (via the VGA arbiter) from =
the
> > > > > "other" GPU back to the default i915 one and issuing io() command=
s.
> > > >
> > > > Hmm. Does this work?
> > > >
> > > > --- a/drivers/gpu/drm/i915/display/intel_vga.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> > > > @@ -29,6 +29,9 @@ void intel_vga_disable(struct drm_i915_private *d=
ev_priv)
> > > >         i915_reg_t vga_reg =3D intel_vga_cntrl_reg(dev_priv);
> > > >         u8 sr1;
> > > >
> > > > +       if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
> > > > +               return;
> > > > +
> > > >         /* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,h=
sw */
> > > >         vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> > > >         outb(SR01, VGA_SR_INDEX);
> > > >
> > > Was able to replicate the issue somewhat and the above does help quit=
e a lot.
> > > Feel free to add my:
> > > Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> > > Tested-by: Emil Velikov <emil.velikov@collabora.com>
> > >
> > Humble poke.
> >
> > Cannot see this patch in the drm-misc or drm-intel trees. Is there
> > anything I do to help move it forward?
>
> Can you just respin the patch with this?
>
I've used your suggestion and redone the commit message completely.
Hope it's far less cryptic now.
Patch is on the ML - realised I didn't CC you, just as it went out.

https://lore.kernel.org/dri-devel/20210604154905.660142-1-emil.l.velikov@gm=
ail.com/T/#u

Thanks
-Emil
