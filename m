Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E395FC2DB4C
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 19:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6448410E212;
	Mon,  3 Nov 2025 18:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gcCDkhSV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E207110E217
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 18:40:11 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-586883eb9fbso5885130e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 10:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762195210; x=1762800010; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjg0NORPD0YzwL4UUD+8RwP+2UOFcZACYrXvQ2r4HyE=;
 b=gcCDkhSVCHgIfTU9CguvowRdcSxPkwK8kkyUy2iI3xjgyZJJXef3gtebDfJP79rzs7
 yikh0qBVVILSgvia3poaWy5BP4Caywe4smA8Xb+cT71jor60DmSoV9lvNwLzteVx3x3Z
 e0FouG9nu/8KbKjOMxpTso5gelIaxR2aQisae78d53SyQ20WmFGpxHrzCSUKWz+HPLxf
 44QptMamToDMrAy/Kn2rEfKvnVTxte6F0665L5NdjLHqyBrRYBQFpbrqkI2lPOB89COM
 xyzmW2Ni0fOtV/ihgIT1byoATdjDYhzkS1MzEzkt8PZ/vSl+Cugai+hmr8//Ul+VfW8t
 VPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762195210; x=1762800010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yjg0NORPD0YzwL4UUD+8RwP+2UOFcZACYrXvQ2r4HyE=;
 b=KWCJTdic5mbAQwnwUWlSD+sIwemfb+Ji5/MDxz8P6fINtG/hmRROEV/AAU0nubN9AI
 Nwcx0Lux/FpqdADhHOjQGOQhF7kCC/GhIlsoG2KgRYING02mKwMvTAtP1Wolht0SdbqE
 rjdT9S7FWtX2JlFbeVYbqygGnp+0XnS/+AyXESphHgff2dNjj/DkOYnx+UFIPFF3HkYo
 xQV85Rj7D8+s8KSH3MAxiwnt/MPWGyjNZwdfcky6SXgMOO6soN8vLU0jI4R2G9peshIJ
 jStUl5YVMs00L2l5WbPkv36XpjhPIAbk1uzNzfi7F3R40mwCmcDI1HjmWevto5I4Jxvw
 4QIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8d0AuYDbnOHErWjCPMEoTLmrL4tMExDbzMNkbWI66W+rN7YfY+fLwgasoxaGMJF//iUPNh5zB1DI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2jYZAZQ5uXG/De0RySt4fsh3nsUPLUv9pca4LpA6D/XwfPo4f
 u94uD23JHlOmYdtVGopYsBMn0WqoVGMQu/MPDvuqcEaiX7oJDFe2oL5V6iS/NcNH3w7ng3oJO5X
 WKJ719XRF1XJwSfv0U/XbzYoWl+VVS+w=
X-Gm-Gg: ASbGncuy7LAeYKhlDMImm4KYDDedLpbfI+2lOfEVHl9wQCNUBN3PDKKUbbdeinqJxnL
 h2HDTfdj3mnD0k2vLfJ+k9q50vkqLbVR4DT5QpABwyMe1RUb/4r3jkv5mye3Jva2Ncze5bB/M4p
 DQpfMcDwqcjasIdRz297kd2VQHDjxI41dfnBn1eEXHgorc2pFti7y7M9HZqcRNTSsTcHC7KQNDC
 RmVu0yJZrUpFvowvo77Oz2LtJP5e6L/yuH6Ewsf3yOs1oh+c62d7FpN6Jx9
X-Google-Smtp-Source: AGHT+IHrf8InG0YVbUPJlQOpnMRHCWVus3nqEpRvI8vqF+TG6Uh4sODD1cviMuv9p58GAy7Gm7Gozb3SPZgLNqd21ko=
X-Received: by 2002:a05:6512:3047:b0:594:2d64:bd0f with SMTP id
 2adb3069b0e04-5942d64c00fmr1202652e87.16.1762195209578; Mon, 03 Nov 2025
 10:40:09 -0800 (PST)
MIME-Version: 1.0
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
In-Reply-To: <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 3 Nov 2025 12:39:57 -0600
X-Gm-Features: AWmQ_bkmrKbleFAu7ESCM5Htipr7i0Mg_ld8nr47Ao7g3e6yS9xY-p2wo60fwAI
Message-ID: <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Without the cmu, nvdisplay will display colors that are notably darker
> > than intended. The vendor bootloader and the downstream display driver
> > enable the cmu and sets a sRGB table. Loading that table here results i=
n
> > the intended colors.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.h  |  13 +++
> >  drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 219 insertions(+)
>
> What does "darker than intended" mean? Who defines the intention? How do
> we know what the intention is? What this patch ultimately seems to be
> doing is define sRGB to be the default colorspace. Is that always the
> right default choice? What if people want to specify a different
> colorspace?

I reported this issue almost a month ago. See kernel lore [0] and
freedesktop issue [1]. The pictures in the latter show what nvdisplay
looks like right now. It's nigh unusably dark. When booted into
Android with a tv launcher that has a black background, as is default
for LineageOS, it is really hard to read anything. Is it correct as a
default? Well, cboot hardcodes this, so... presumably? It would be
more ideal to expose this and csc to userspace, but I'm not sure if
drm has a standardized interface for that or if tegra would have to
make something vendor specific. I think that would be a separate
change concept compared to setting this default, though.

> Looking at the enum dp_colorimetry it seems like sRGB is the default for
> DP at least. But then it says the default is sRGB or ITU-R BT.601, but
> if I compare that to the Wikipedia article for sRGB that says sRGB is
> closer to ITU-R BT.709 than BT.601. Can we narrow in what exactly the
> LUT in this patch corresponds to?

I really don't know. While trying to fix the broken colors, I came
across the same table in cboot [2] and the downstream tegradc driver.
Cboot was released as a tarball with no commit history. And the
tegradc commit history did not have any further clarification beyond
'sRGB'.

> > diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> > index 0559fa6b1bf70416e51d5067cc04a6ae6572de23..286eddd89a28f7ea9e64c00=
f03af76f6c68ae9d8 100644
> > --- a/drivers/gpu/drm/tegra/dc.h
> > +++ b/drivers/gpu/drm/tegra/dc.h
> > @@ -447,11 +447,24 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define BASE_COLOR_SIZE_888    (  8 << 0)
> >  #define BASE_COLOR_SIZE_101010 ( 10 << 0)
> >  #define BASE_COLOR_SIZE_121212 ( 12 << 0)
> > +#define CMU_ENABLE_MASK        (1 << 20)
> > +#define CMU_ENABLE_DISABLE     (0 << 20)
> > +#define CMU_ENABLE_ENABLE      (1 << 20)
>
> _MASK and _DISABLE are unused (and also quite useless in this case).

Fair. I was trying to match the style of the rest of the header, but I
can drop the unused defines.

>
> >
> >  #define DC_DISP_SHIFT_CLOCK_OPTIONS          0x431
> >  #define  SC1_H_QUALIFIER_NONE        (1 << 16)
> >  #define  SC0_H_QUALIFIER_NONE        (1 <<  0)
> >
> > +/* Nvdisplay */
> > +#define DC_DISP_CORE_HEAD_SET_CONTROL_OUTPUT_LUT     0x431
> > +#define  OUTPUT_LUT_MODE_MASK        (3 << 5)
> > +#define  OUTPUT_LUT_MODE_INTERPOLATE (1 << 5)
> > +#define  OUTPUT_LUT_SIZE_MASK        (3 << 1)
> > +#define  OUTPUT_LUT_SIZE_SIZE_1025   (2 << 1)
> > +
> > +#define DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE     0x432
> > +#define DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE_HI  0x433
> > +
>
> There's a section in this header titled "Tegra186 and later", where
> these new definitions should go. Anything in this section is part of the
> old registers (or the emulated ones for backwards compatibility).

I figured there had to be a section for that somewhere, but my
searches failed me. I see it now and will move.

> >  #define DC_DISP_DATA_ENABLE_OPTIONS          0x432
> >  #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
> >  #define DE_SELECT_ACTIVE        (1 << 0)
> > diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> > index 21f3dfdcc5c9576580b9aa9990dd1bedcdeb4482..a381cb35113c0f3191d7204=
302f4024f33141622 100644
> > --- a/drivers/gpu/drm/tegra/sor.c
> > +++ b/drivers/gpu/drm/tegra/sor.c
> > @@ -443,6 +443,9 @@ struct tegra_sor {
> >       bool scdc_enabled;
> >
> >       struct tegra_hda_format format;
> > +
> > +     u64 *cmu_output_lut;
> > +     dma_addr_t cmu_output_phys;
> >  };
> >
> >  struct tegra_sor_state {
> > @@ -483,6 +486,180 @@ static inline struct tegra_sor *to_sor(struct teg=
ra_output *output)
> >       return container_of(output, struct tegra_sor, output);
> >  }
> >
> > +static u16 default_srgb_lut[] =3D {
> > +             0x6000, 0x60CE, 0x619D, 0x626C, 0x632D, 0x63D4,
> [...]
> > +             0x9FE2, 0x9FE9, 0x9FF0, 0x9FF7, 0x9FFF,
> > +};
>
> I don't take it there's a way to generate this table? And these are not
> standard values that could be shared among different drivers?

I don't know of a way to generate it. As mentioned above, this was
copied from downstream.

As for sharing, I don't know. If I read the tx2 trm correctly, the
display pipeline goes through a input LUT, which is not currently
enabled by tegra-drm, then into csc, which expects some 'linear
colorspace'. Then that outputs into the output LUT, which is labelled
as the cmu, which is expected to translate from that linear colorspace
into the colorspace expected by the display. Given that this LUT
generates expected colors on my displays, I assume that the pixels in
the pipeline are in that 'linear colorspace'. I'm not sure if that's a
standardized thing or something nvdisplay specific. If it is the
latter, then the table wouldn't be useful anywhere else.

> You could probably make this a bit more compact by indenting the data
> with a single tab and squeeze in 2 or 3 more values per line.

 Ack.

> >  static inline u32 tegra_sor_readl(struct tegra_sor *sor, unsigned int =
offset)
> >  {
> >       u32 value =3D readl(sor->regs + (offset << 2));
> > @@ -2241,6 +2418,13 @@ static void tegra_sor_hdmi_disable(struct drm_en=
coder *encoder)
> >               dev_err(sor->dev, "failed to power off I/O pad: %d\n", er=
r);
> >
> >       host1x_client_suspend(&sor->client);
> > +
> > +     if (sor->soc->has_nvdisplay) {
> > +             dma_free_coherent(dc->dev, ARRAY_SIZE(default_srgb_lut) *=
 sizeof(u64),
> > +                               sor->cmu_output_lut, sor->cmu_output_ph=
ys);
> > +             sor->cmu_output_lut =3D NULL;
> > +             sor->cmu_output_phys =3D 0;
> > +     }
> >  }
> >
> >  static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
> > @@ -2255,6 +2439,7 @@ static void tegra_sor_hdmi_enable(struct drm_enco=
der *encoder)
> >       unsigned long rate, pclk;
> >       unsigned int div, i;
> >       u32 value;
> > +     u64 r;
>
> This can be moved into the branch to narrow the scope.

Ack.

>
> >       int err;
> >
> >       state =3D to_sor_state(output->connector.state);
> > @@ -2557,6 +2742,27 @@ static void tegra_sor_hdmi_enable(struct drm_enc=
oder *encoder)
> >       value &=3D ~DITHER_CONTROL_MASK;
> >       value &=3D ~BASE_COLOR_SIZE_MASK;
> >
> > +     if (dc->soc->has_nvdisplay) {
> > +             sor->cmu_output_lut =3D
> > +                     dma_alloc_coherent(dc->dev, ARRAY_SIZE(default_sr=
gb_lut) * sizeof(u64),
> > +                                        &sor->cmu_output_phys, GFP_KER=
NEL);
>
> You need to check for failure, otherwise you might NULL dereference the
> pointer below. But then it's probably even better to allocate this at
> probe time so that we can guarantee that the LUT can always be set.

Moving alloc to probe and free to remove makes sense. Less thrashing
that way too. Will do.

> > +
> > +             for (i =3D 0; i < ARRAY_SIZE(default_srgb_lut); i++) {
> > +                     r =3D default_srgb_lut[i];
> > +                     sor->cmu_output_lut[i] =3D (r << 32) | (r << 16) =
| r;
> > +             }
>
> Given that this was taken from the downstream driver, this is probably
> correct, but I'm not sure I understand why the same value is written to
> the LUT thrice. Do you happen to know?

I do not, no. I wondered at that too.

>
> > +             tegra_dc_writel(dc, (u32)(sor->cmu_output_phys & 0xffffff=
ff),
> > +                             DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE)=
;
> > +             tegra_dc_writel(dc, (u32)(sor->cmu_output_phys >> 32),
> > +                             DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE_=
HI);
>
> You'll want to use the lower_32_bits() and upper_32_bits() functions
> like we do for other address values (see hub.c, for example).

Ack.

I will stage the code review changes, but will hold off on sending a
new revision. Pending any additional changes coming from the
discussion of the concept in general.

Aaron

[0] https://lore.kernel.org/all/CALHNRZ_vMy1CTosZ=3DymOhAyMNRh+oBOU9NJ8Gvr8=
EkqQ5XjFDw@mail.gmail.com/
[1] https://gitlab.freedesktop.org/drm/tegra/-/issues/8
[2] https://github.com/LineageOS/android_bootable_cboot_common/blob/034b04d=
3ac7f2f80d72e3b894d97da4f6e2cd591/drivers/display/nvdisp/tegrabl_nvdisp_cmu=
.c#L24
