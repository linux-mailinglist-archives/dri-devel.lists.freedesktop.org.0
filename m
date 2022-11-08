Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C4A621EEE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 23:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094DF10E52A;
	Tue,  8 Nov 2022 22:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D80D10E2E0;
 Tue,  8 Nov 2022 22:16:28 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so23066130lfb.13;
 Tue, 08 Nov 2022 14:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NtwsQ3gidzESt2kFCVdtlss3L/VOyObE+9Zu1FVQJqM=;
 b=fVzvtBWNhshjyjYovUQGIibF6vUrBH2VbFfqJ7T4w9NyZBksRCcnhbaL4M5QsfpdwQ
 YJegQc8gUgGQy6xj8MJuf7+OQOVD5MWKKAyOS8lrJjp5DUmAgQmddWHIskkpu/BzZKQq
 1rv9bopMI6VmlMz2/C+oGWw8CroX5j7ZX7xD4K2/HF3yve7KYFO4a9AB6sN+N2TQ5Cym
 lGmtcgYS0dYxEFtQV/GcxW+1UNNw+9uNwYv2ZFatbmv+Z38JE6WS8bZ3oqUTE/ad7Odq
 utuxkE57gnrnFQjHiUgZpzRLrfJm3wAU+QRbuNz9HCz69LTpnlQO8pIlX9I+DtQpDSu/
 2vaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtwsQ3gidzESt2kFCVdtlss3L/VOyObE+9Zu1FVQJqM=;
 b=6/u7j/ikiG9soH2GwwBI6Keq9npuqnN04Om5azfK2C4iKvGB/SpKW3gk0Ve+Y2+1Yo
 ovcKt/VBGQ+vsxLO+Ow7IwcUWAdxh3FMgFzvUWGZ9qqXtjKIHLYs2FdRFQWRR7Zd8h4K
 20SVshhG3Rjbd7Uq5Z8e0AJZ4a15bIvIkyTStp9h7v8Po6j8zHrJ0fN4bPkrRK+f+nK6
 HpYYrp6AEEmK+7TsBwpNZdxDyvYfyxshzBtnEKumFpirMjWzcWZanrR+pI3XMvvWep7T
 LbSdVdbed/Osx1Rv8QsKMXTXGq3Wb4WV7VhSkyV15wtkIK7Gf9SjdG1xrlnPt6Jg1V5H
 q1xw==
X-Gm-Message-State: ACrzQf2btNQ1xefeRoX+NhUvA3Li2hbmnoZbT4hAB3+p+UslN+UHMjWS
 fDq3hinRZCVR7BHf+t8EStXMunVoUUeJfw==
X-Google-Smtp-Source: AMsMyM77qvcMxyrwPALZwxY+K2q6Edks3WL4j3/Qml+1dYBrXETAkECQR7yCMrLsx34kG+eukvfSFA==
X-Received: by 2002:a05:6512:224d:b0:4a2:7710:9b8b with SMTP id
 i13-20020a056512224d00b004a277109b8bmr18805622lfu.128.1667945786604; 
 Tue, 08 Nov 2022 14:16:26 -0800 (PST)
Received: from ?IPV6:2a02:a31a:a240:1700:c55e:6e7d:cf12:d8b7?
 ([2a02:a31a:a240:1700:c55e:6e7d:cf12:d8b7])
 by smtp.googlemail.com with ESMTPSA id
 a14-20020a056512200e00b004979ec19387sm1938366lfb.305.2022.11.08.14.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 14:16:25 -0800 (PST)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <137895ef-b2c4-6e10-e245-125745b882bc@gmail.com>
Date: Tue, 8 Nov 2022 23:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [Nouveau] [PATCH v7 22/23] drm/vc4: vec: Add support for more
 analog TV standards
Content-Language: pl
To: Lukas Satin <luke.satin@gmail.com>, Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-22-7072a478c6b3@cerno.tech>
 <CAEFVmOKn4Won90xyX2Efh2esZ94npoy0BuTQ7n-in+KapfBb=w@mail.gmail.com>
In-Reply-To: <CAEFVmOKn4Won90xyX2Efh2esZ94npoy0BuTQ7n-in+KapfBb=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reply-To: kfyatek+publicgit@gmail.com
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lukas, Maxime and everyone,

W dniu 8.11.2022 o 14:17, Lukas Satin pisze:
> They are important for retrogaming and connecting TV out to CRT TV or using
> emulator.
>
> I have PS1 that is using PAL-60 for example.
>
> Can you add 240p and 288p non-interlaced modes for NTSC and PAL, please?

To add progressive mode support, at least for the VC4/VEC device that's used
on the Raspberry Pi, all that's necessary is a patch like:

--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -623,7 +623,9 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	VEC_WRITE(VEC_CLMP0_START, 0xac);
 	VEC_WRITE(VEC_CLMP0_END, 0xec);
 	VEC_WRITE(VEC_CONFIG2,
-		  VEC_CONFIG2_UV_DIG_DIS | VEC_CONFIG2_RGB_DIG_DIS);
+		  VEC_CONFIG2_UV_DIG_DIS |
+		  VEC_CONFIG2_RGB_DIG_DIS |
+		  ((adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) ? 0 : VEC_CONFIG2_PROG_SCAN));
 	VEC_WRITE(VEC_CONFIG3, VEC_CONFIG3_HORIZ_LEN_STD);
 	VEC_WRITE(VEC_DAC_CONFIG, vec->variant->dac_config);
 

and then you can just add custom modes, for example within Xorg:

xrandr --newmode 720x240 13.5 720 736 800 858 240 243 246 262
xrandr --newmode 720x288 13.5 720 740 804 864 288 290 293 312

Note that the pixel aspect ratio will be all over the place - unfortunately this
is necessary at the driver level, because VC4's VEC does not support pixel
clocks other than 13.5 MHz. However, you can fix it by running something like
"xrandr --scale-from 320x240" or "xrandr --scale-from 384x288". Other (non-X)
applications would need to be adapted to similarly configure DRM scaling.

I'm not sure if Maxime wants to introduce any more code like the patch above to
facilitate progressive scan support, though (@Maxime: feel free to grab the code
from above or anything else from https://github.com/raspberrypi/linux/pull/4406
if you do, however!). We talked recently that the priority is to finally merge
existing functionality first, see this message:
https://lore.kernel.org/dri-devel/20221027115822.5vd3fqlcpy4gfq5v@houat/

I'm willing to post a couple of follow-up patches to improve things like
support for progressive modes or exotic TV norms (such as PAL-M-50 or PAL-N-60)
within the VC4 driver once this patchset lands - but I agree with Maxime's point
to focus on merging existing functionality first.

> Lukas

Best regards,
Mateusz Kwiatkowski

> On Mon, Nov 7, 2022 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
>     From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
>
>     Add support for the following composite output modes (all of them are
>     somewhat more obscure than the previously defined ones):
>
>     - NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to
>       4.43361875 MHz (the PAL subcarrier frequency). Never used for
>       broadcasting, but sometimes used as a hack to play NTSC content in PAL
>       regions (e.g. on VCRs).
>     - PAL_N - PAL with alternative chroma subcarrier frequency,
>       3.58205625 MHz. Used as a broadcast standard in Argentina, Paraguay
>       and Uruguay to fit 576i50 with colour in 6 MHz channel raster.
>     - PAL60 - 480i60 signal with PAL-style color at normal European PAL
>       frequency. Another non-standard, non-broadcast mode, used in similar
>       contexts as NTSC_443. Some displays support one but not the other.
>     - SECAM - French frequency-modulated analog color standard; also have
>       been broadcast in Eastern Europe and various parts of Africa and Asia.
>       Uses the same 576i50 timings as PAL.
>
>     Also added some comments explaining color subcarrier frequency
>     registers.
>
>     Acked-by: Noralf Trønnes <noralf@tronnes.org>
>     Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
>     Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
>     ---
>     Changes in v6:
>     - Support PAL60 again
>     ---
>      drivers/gpu/drm/vc4/vc4_vec.c | 111 ++++++++++++++++++++++++++++++++++++++++--
>      1 file changed, 107 insertions(+), 4 deletions(-)
>
>     diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
>     index a828fc6fb776..d23dbad3cbf6 100644
>     --- a/drivers/gpu/drm/vc4/vc4_vec.c
>     +++ b/drivers/gpu/drm/vc4/vc4_vec.c
>     @@ -46,6 +46,7 @@
>      #define VEC_CONFIG0_YDEL(x)            ((x) << 26)
>      #define VEC_CONFIG0_CDEL_MASK          GENMASK(25, 24)
>      #define VEC_CONFIG0_CDEL(x)            ((x) << 24)
>     +#define VEC_CONFIG0_SECAM_STD          BIT(21)
>      #define VEC_CONFIG0_PBPR_FIL           BIT(18)
>      #define VEC_CONFIG0_CHROMA_GAIN_MASK   GENMASK(17, 16)
>      #define VEC_CONFIG0_CHROMA_GAIN_UNITY  (0 << 16)
>     @@ -76,6 +77,27 @@
>      #define VEC_SOFT_RESET                 0x10c
>      #define VEC_CLMP0_START                        0x144
>      #define VEC_CLMP0_END                  0x148
>     +
>     +/*
>     + * These set the color subcarrier frequency
>     + * if VEC_CONFIG1_CUSTOM_FREQ is enabled.
>     + *
>     + * VEC_FREQ1_0 contains the most significant 16-bit half-word,
>     + * VEC_FREQ3_2 contains the least significant 16-bit half-word.
>     + * 0x80000000 seems to be equivalent to the pixel clock
>     + * (which itself is the VEC clock divided by 8).
>     + *
>     + * Reference values (with the default pixel clock of 13.5 MHz):
>     + *
>     + * NTSC  (3579545.[45] Hz)     - 0x21F07C1F
>     + * PAL   (4433618.75 Hz)       - 0x2A098ACB
>     + * PAL-M (3575611.[888111] Hz) - 0x21E6EFE3
>     + * PAL-N (3582056.25 Hz)       - 0x21F69446
>     + *
>     + * NOTE: For SECAM, it is used as the Dr center frequency,
>     + * regardless of whether VEC_CONFIG1_CUSTOM_FREQ is enabled or not;
>     + * that is specified as 4406250 Hz, which corresponds to 0x29C71C72.
>     + */
>      #define VEC_FREQ3_2                    0x180
>      #define VEC_FREQ1_0                    0x184
>
>     @@ -118,6 +140,14 @@
>
>      #define VEC_INTERRUPT_CONTROL          0x190
>      #define VEC_INTERRUPT_STATUS           0x194
>     +
>     +/*
>     + * Db center frequency for SECAM; the clock for this is the same as for
>     + * VEC_FREQ3_2/VEC_FREQ1_0, which is used for Dr center frequency.
>     + *
>     + * This is specified as 4250000 Hz, which corresponds to 0x284BDA13.
>     + * That is also the default value, so no need to set it explicitly.
>     + */
>      #define VEC_FCW_SECAM_B                        0x198
>      #define VEC_SECAM_GAIN_VAL             0x19c
>
>     @@ -197,10 +227,15 @@ enum vc4_vec_tv_mode_id {
>             VC4_VEC_TV_MODE_NTSC_J,
>             VC4_VEC_TV_MODE_PAL,
>             VC4_VEC_TV_MODE_PAL_M,
>     +       VC4_VEC_TV_MODE_NTSC_443,
>     +       VC4_VEC_TV_MODE_PAL_60,
>     +       VC4_VEC_TV_MODE_PAL_N,
>     +       VC4_VEC_TV_MODE_SECAM,
>      };
>
>      struct vc4_vec_tv_mode {
>             unsigned int mode;
>     +       u16 expected_htotal;
>             u32 config0;
>             u32 config1;
>             u32 custom_freq;
>     @@ -236,35 +271,68 @@ static const struct debugfs_reg32 vec_regs[] = {
>      static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
>             {
>                     .mode = DRM_MODE_TV_MODE_NTSC,
>     +               .expected_htotal = 858,
>                     .config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
>                     .config1 = VEC_CONFIG1_C_CVBS_CVBS,
>             },
>     +       {
>     +               .mode = DRM_MODE_TV_MODE_NTSC_443,
>     +               .expected_htotal = 858,
>     +               .config0 = VEC_CONFIG0_NTSC_STD,
>     +               .config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
>     +               .custom_freq = 0x2a098acb,
>     +       },
>             {
>                     .mode = DRM_MODE_TV_MODE_NTSC_J,
>     +               .expected_htotal = 858,
>                     .config0 = VEC_CONFIG0_NTSC_STD,
>                     .config1 = VEC_CONFIG1_C_CVBS_CVBS,
>             },
>             {
>                     .mode = DRM_MODE_TV_MODE_PAL,
>     +               .expected_htotal = 864,
>                     .config0 = VEC_CONFIG0_PAL_BDGHI_STD,
>                     .config1 = VEC_CONFIG1_C_CVBS_CVBS,
>             },
>     +       {
>     +               /* PAL-60 */
>     +               .mode = DRM_MODE_TV_MODE_PAL,
>     +               .expected_htotal = 858,
>     +               .config0 = VEC_CONFIG0_PAL_M_STD,
>     +               .config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
>     +               .custom_freq = 0x2a098acb,
>     +       },
>             {
>                     .mode = DRM_MODE_TV_MODE_PAL_M,
>     +               .expected_htotal = 858,
>                     .config0 = VEC_CONFIG0_PAL_M_STD,
>                     .config1 = VEC_CONFIG1_C_CVBS_CVBS,
>             },
>     +       {
>     +               .mode = DRM_MODE_TV_MODE_PAL_N,
>     +               .expected_htotal = 864,
>     +               .config0 = VEC_CONFIG0_PAL_N_STD,
>     +               .config1 = VEC_CONFIG1_C_CVBS_CVBS,
>     +       },
>     +       {
>     +               .mode = DRM_MODE_TV_MODE_SECAM,
>     +               .expected_htotal = 864,
>     +               .config0 = VEC_CONFIG0_SECAM_STD,
>     +               .config1 = VEC_CONFIG1_C_CVBS_CVBS,
>     +               .custom_freq = 0x29c71c72,
>     +       },
>      };
>
>      static inline const struct vc4_vec_tv_mode *
>     -vc4_vec_tv_mode_lookup(unsigned int mode)
>     +vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)
>      {
>             unsigned int i;
>
>             for (i = 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
>                     const struct vc4_vec_tv_mode *tv_mode = &vc4_vec_tv_modes[i];
>
>     -               if (tv_mode->mode == mode)
>     +               if (tv_mode->mode == mode &&
>     +                   tv_mode->expected_htotal == htotal)
>                             return tv_mode;
>             }
>
>     @@ -273,9 +341,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
>
>      static const struct drm_prop_enum_list legacy_tv_mode_names[] = {
>             { VC4_VEC_TV_MODE_NTSC, "NTSC", },
>     +       { VC4_VEC_TV_MODE_NTSC_443, "NTSC-443", },
>             { VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
>             { VC4_VEC_TV_MODE_PAL, "PAL", },
>     +       { VC4_VEC_TV_MODE_PAL_60, "PAL-60", },
>             { VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
>     +       { VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
>     +       { VC4_VEC_TV_MODE_SECAM, "SECAM", },
>      };
>
>      static enum drm_connector_status
>     @@ -306,11 +378,16 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
>                     state->tv.mode = DRM_MODE_TV_MODE_NTSC;
>                     break;
>
>     +       case VC4_VEC_TV_MODE_NTSC_443:
>     +               state->tv.mode = DRM_MODE_TV_MODE_NTSC_443;
>     +               break;
>     +
>             case VC4_VEC_TV_MODE_NTSC_J:
>                     state->tv.mode = DRM_MODE_TV_MODE_NTSC_J;
>                     break;
>
>             case VC4_VEC_TV_MODE_PAL:
>     +       case VC4_VEC_TV_MODE_PAL_60:
>                     state->tv.mode = DRM_MODE_TV_MODE_PAL;
>                     break;
>
>     @@ -318,6 +395,14 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
>                     state->tv.mode = DRM_MODE_TV_MODE_PAL_M;
>                     break;
>
>     +       case VC4_VEC_TV_MODE_PAL_N:
>     +               state->tv.mode = DRM_MODE_TV_MODE_PAL_N;
>     +               break;
>     +
>     +       case VC4_VEC_TV_MODE_SECAM:
>     +               state->tv.mode = DRM_MODE_TV_MODE_SECAM;
>     +               break;
>     +
>             default:
>                     return -EINVAL;
>             }
>     @@ -341,6 +426,10 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
>                     *val = VC4_VEC_TV_MODE_NTSC;
>                     break;
>
>     +       case DRM_MODE_TV_MODE_NTSC_443:
>     +               *val = VC4_VEC_TV_MODE_NTSC_443;
>     +               break;
>     +
>             case DRM_MODE_TV_MODE_NTSC_J:
>                     *val = VC4_VEC_TV_MODE_NTSC_J;
>                     break;
>     @@ -353,6 +442,14 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
>                     *val = VC4_VEC_TV_MODE_PAL_M;
>                     break;
>
>     +       case DRM_MODE_TV_MODE_PAL_N:
>     +               *val = VC4_VEC_TV_MODE_PAL_N;
>     +               break;
>     +
>     +       case DRM_MODE_TV_MODE_SECAM:
>     +               *val = VC4_VEC_TV_MODE_SECAM;
>     +               break;
>     +
>             default:
>                     return -EINVAL;
>             }
>     @@ -448,13 +545,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
>             struct drm_connector *connector = &vec->connector;
>             struct drm_connector_state *conn_state =
>                     drm_atomic_get_new_connector_state(state, connector);
>     +       struct drm_display_mode *adjusted_mode =
>     +               &encoder->crtc->state->adjusted_mode;
>             const struct vc4_vec_tv_mode *tv_mode;
>             int idx, ret;
>
>             if (!drm_dev_enter(drm, &idx))
>                     return;
>
>     -       tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode);
>     +       tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode,
>     +                                        adjusted_mode->htotal);
>             if (!tv_mode)
>                     goto err_dev_exit;
>
>     @@ -648,9 +748,12 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
>
>             ret = drm_mode_create_tv_properties(drm,
>                                                 BIT(DRM_MODE_TV_MODE_NTSC) |
>     +                                           BIT(DRM_MODE_TV_MODE_NTSC_443) |
>                                                 BIT(DRM_MODE_TV_MODE_NTSC_J) |
>                                                 BIT(DRM_MODE_TV_MODE_PAL) |
>     -                                           BIT(DRM_MODE_TV_MODE_PAL_M));
>     +                                           BIT(DRM_MODE_TV_MODE_PAL_M) |
>     +                                           BIT(DRM_MODE_TV_MODE_PAL_N) |
>     +                                           BIT(DRM_MODE_TV_MODE_SECAM));
>             if (ret)
>                     return ret;
>
>
>     -- 
>     b4 0.11.0-dev-99e3a 
>

