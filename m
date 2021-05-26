Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8838E391CE8
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 18:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDAF6EDBF;
	Wed, 26 May 2021 16:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0D26EDBF;
 Wed, 26 May 2021 16:21:33 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id d14so1092420ual.5;
 Wed, 26 May 2021 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TyjCiPAhnrbf2fMWsVTrk+vNWjZDmn66jkggQRHDV8c=;
 b=gNsx/PovsvIHJh6zP3RNNianCSGTUaAHeSnG+PhW5IPBoI55ICu+xSz20fgt94lT5y
 VsjFnMVaaN1ObOjcJt2Z6wOP0CKmwHl+a8xqzA3lX2kvEF7EqKy9xy7SV7LhNyBcMuVN
 z19i+t1ILqT8YPRIk6wJWcOWjNxuvHwsZOZsx+6Ys8RN2D7mL6tvXAsqYMDK9VN6dLZB
 0UkDSkB7YNnmHluph8O8zHG6CYHbyYjNmaJdAoqoJFgagdMhz8LLLROl8CD/cHumePnV
 K7ScuFvZZ2eW8b0DCdQANzHstXq05H+NqpsEWGE/uMgTtDJMbtzh/O/PWfvw/GGtfdvV
 62yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TyjCiPAhnrbf2fMWsVTrk+vNWjZDmn66jkggQRHDV8c=;
 b=GZKBXpXNHW57YNdDjrB7NvdUJz8tDcpWi8DVrneLOq8f0xHzzW6YvlXyWTJLd6F73t
 WgEdDxfiRpEy2PokMQPhy/skJK/z9P/sP94Li+ch5LDuc2QXt6TMjYa89PXF1fXOmQvD
 QUUDYLRURSI6crTvxNrk/G6bq4bPAkc/2NxEvEbhk9vh8hthSIGqeTqHXThRmaEMNI/V
 qVWfXGmMv79JWrcSmbryWzjmkmrxGb+UpOqko2xaFW4+uCCxAAmlU4mvbH78Kj6J4NPU
 kcPODUree+bbLHw/NHTgFZsh1gg2RwLwJza7Ree+V8RcBwCZU4Q30IGwcgRqn7LAV7sg
 8/aw==
X-Gm-Message-State: AOAM5327oHavNxj6lY/J58okacXX5UDNC3a4R6dKBOhXj51LKUUO7Tq+
 qjXc9oG9GoLNMnwU/IHQbZFFLEtW/zP8cFSMNoA=
X-Google-Smtp-Source: ABdhPJxkFIJHD5G+sHKDDZhetQ7golkfaXMDUXrac4w6e5h1b2229x+b1/izFo1mNEU6RW8ztIANhysBmulXZm1TYlA=
X-Received: by 2002:a1f:b488:: with SMTP id d130mr31749720vkf.17.1622046092243; 
 Wed, 26 May 2021 09:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210516171432.1734268-1-emil.l.velikov@gmail.com>
 <YKKmsbvTZBwCUiRu@intel.com>
 <CACvgo53H7GAjN_aFsCBOw+xtVbjcbR1q-U3vdgjT1KUPKoMkkg@mail.gmail.com>
 <YKOiN1EFXz7TfYyV@intel.com>
In-Reply-To: <YKOiN1EFXz7TfYyV@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 26 May 2021 17:21:20 +0100
Message-ID: <CACvgo52f_8XzkKpzAsgQ-E4VHn9md+rZVbTau5H40PPRVa4SdQ@mail.gmail.com>
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

Hi Ville,

On Tue, 18 May 2021 at 12:17, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, May 18, 2021 at 12:09:56PM +0100, Emil Velikov wrote:
> > Hi Ville,
> >
> > On Mon, 17 May 2021 at 18:24, Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Sun, May 16, 2021 at 06:14:32PM +0100, Emil Velikov wrote:
> > > > From: Vivek Das Mohapatra <vivek@collabora.com>
> > > >
> > > > This patch is to do with seamless handover, eg when the sequence is
> > > > bootloader =E2=86=92 plymouth =E2=86=92 desktop.
> > > >
> > > > It switches the vga arbiter from the "other" GPU to the default one
> > > > (intel in this case), so the driver can issue some io().
> > >
> > > I don't understand what this commit message is trying to say.
> > >
> > Bunch of context is lost due to the patch age, so I'm not 100% sure of
> > the actual hardware setup where this occurs.
> > Does the following make sense?
> >
> > Currently on dual GPU systems, we do not get seamless handover as the
> > output flickers during the transition bootloader -> plymouth ->
> > desktop.
> > This happens as a result of switching (via the VGA arbiter) from the
> > "other" GPU back to the default i915 one and issuing io() commands.
>
> Hmm. Does this work?
>
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -29,6 +29,9 @@ void intel_vga_disable(struct drm_i915_private *dev_pri=
v)
>         i915_reg_t vga_reg =3D intel_vga_cntrl_reg(dev_priv);
>         u8 sr1;
>
> +       if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
> +               return;
> +
>         /* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
>         vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
>         outb(SR01, VGA_SR_INDEX);
>
Was able to replicate the issue somewhat and the above does help quite a lo=
t.
Feel free to add my:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
Tested-by: Emil Velikov <emil.velikov@collabora.com>

Also feel free to reuse as much/little of the following setup details.

To reproduce the issue:

Get a dual GPU system - Intel+Nvidia in my case. Set the other
(Nvidia) as default in UEFI and connect monitors to it.
Ensure the bootloader (and if using splash manager like plymouth) are
set to display the UEFI BGRT. Personally I tested systemd-boot,
although GRUB should also work. I couldn't get plymouth to work/behave
here :shrug:

Note: Having the Nvidia drivers in the initramfs can lead to extra
flicker so leave them out. Include the i915 drivers in initramfs.

Without the patch, the existing bootslash is wiped clean almost
instantaneously as the i915 driver calls intel_vga_disable().
With your patch the call is a no-op, and the bootsplash stays around
until the login manager (and X) is spawned.

HTH
Emil
