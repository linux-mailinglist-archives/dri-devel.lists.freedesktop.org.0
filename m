Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B9E622CD3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 14:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FD310E5C9;
	Wed,  9 Nov 2022 13:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12ACF10E467;
 Tue,  8 Nov 2022 13:28:25 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1322d768ba7so16219317fac.5; 
 Tue, 08 Nov 2022 05:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WPWVYQ0Z9ltcIE4c05Ej0FmG7bk0l6eEO7bzYB98jI4=;
 b=XE2KXjdXehufQbTqtTdpbdrU9M/63xZ+oA84H7JvrAL9PDoDEHfDIzzokYaOvT7HNU
 7TQzQFth84EVpn7atZ4M0tdqBDy41wJZUpSWeXBfneoKgtZSqgm93SsusJFg1gOCgCr+
 TKD9gDvNdo648JUBmFZGvs9T3uj7Un9Qq2DShcVI0FD7tWp574B2X9RMnDqp0kI78/JI
 cJYbmEB9r+lj8aLg3IqPyZybFTK1q5+DtuQVppxENySmuZAtrmWTh3LvE42vvaz6vYUh
 myprtnqGnFs/uG6YBaGCoHDRNQz/VRZ+GL/k0/w8sBqTvC9d7UqIBRpawRoNAZCVZbyk
 MOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WPWVYQ0Z9ltcIE4c05Ej0FmG7bk0l6eEO7bzYB98jI4=;
 b=u3XSytWXemOGUGj7Ky9DXKLyRCFMOBw9ELZfvYh070O28hJORWIxCogTPGUs0nxjg5
 +x1PdaBPdG/liQlpJtq0yL0KKTyFYXhmEmlEoNJjMAGrLSjQWanBXyvVLGAEu1K76E8H
 wBQNu6SAPaldoib8XEQtwYEEWYe3zQvxCNw7fPeZc/9/NkA2OBSCtL1q0K4pkEqwuMew
 npnrHhorGwTKPokWwHKSWbNL3rcYTiD10nNZHsTlLm1hLxGU7QiHhkIj66hHL7ndlwcS
 NtFE7EkPqJh6Nk7KC6kOV0aeNoo2PVgLyE8QqEvavNj6w6emCdEe8M+J3mpThvO/eEkc
 G56w==
X-Gm-Message-State: ACrzQf0sRCw9dVSPxa6Md0mwGS8i00L79BAcQ0d6Gwft665mZAkb4k+W
 BkYziUfyIcXYqOjIdYONVmO+mZomGdvxddt+B4E=
X-Google-Smtp-Source: AMsMyM49p85Cp5I4e2sMSkgk9h2Zwh2vDF0DWA7npimpitP/HbGJOIj1AjncAQvKn9CcfCsWgQ5OGuoDpVL+cuCjXoo=
X-Received: by 2002:a05:6870:5596:b0:13c:831a:f150 with SMTP id
 n22-20020a056870559600b0013c831af150mr33072421oao.234.1667914104053; Tue, 08
 Nov 2022 05:28:24 -0800 (PST)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-6-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-6-7072a478c6b3@cerno.tech>
From: Lukas Satin <luke.satin@gmail.com>
Date: Tue, 8 Nov 2022 14:28:12 +0100
Message-ID: <CAEFVmOJbjK2iug+UsxD8w7W0RTc0AGD=wxB5bX-es=Qc-Mcgrw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v7 06/23] drm/modes: Add a function to generate
 analog display modes
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: multipart/alternative; boundary="000000000000b0243905ecf58340"
X-Mailman-Approved-At: Wed, 09 Nov 2022 13:50:31 +0000
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
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b0243905ecf58340
Content-Type: text/plain; charset="UTF-8"

Hi, your statement:

"However, analog display usually have fairly loose timings requirements,
the only discrete parameters being the total number of lines and pixel
clock frequency."

Please do not make it as a rule. You said yourself: "usually". Arcade CRT
have more loose timings, but professional broadcast TV's such as Sony PVM,
Sony BVM, JVC. These cost tens of thousand dollars back in the day. Now
they are affordable for gamers. I just solved issue in Retroarch, CRT
Switchres library here: https://github.com/antonioginer/switchres/issues/96

This model is quite common among retrogamers and on Reddit.

Some developers do not test it properly.

This model requires exact number of lines.

For Switchres we came up with these ranges:

        crt_range0 15625-15750, 49.50-65.00, 2.000, 4.700, 8.000,
0.064, 0.192, 1.024, 1, 1, 192, 288, 0, 0
        crt_range1 15625.00-15625.00, 50.00-50.00, 1.500, 4.700,
5.800, 0.064, 0.160, 1.056, 1, 1, 0, 0, 448, 576
        crt_range2 15734.26-15734.26, 59.94-59.94, 1.500, 4.700,
4.700, 0.191, 0.191, 0.953, 1, 1, 0, 0, 448, 480

crt_range0 is default, more loose definition for MAME emulators. crt_range1
is PAL and crt_range2 is NTSC.

Yes, this model does support both NTSC and PAL.

Does your driver or library support that?

For example old driver in Windows 7 with NVIDIA 2007 driver on Geforce 7600
can support both NTSC and PAL and these are being switched automatically by
the resolution you choose. So in desktop properties, you change to 640x480
and it will switch TV chipset to NTSC 480i. Then you change to 720x576 and
it will switch TV chipset to PAL 576i.

It would be preferred if advanced users could set up these numbers from a
commandline during a runtime, so it would depend on the app being used.

Lukas

On Mon, Nov 7, 2022 at 3:17 PM Maxime Ripard <maxime@cerno.tech> wrote:

> Multiple drivers (meson, vc4, sun4i) define analog TV 525-lines and
> 625-lines modes in their drivers.
>
> Since those modes are fairly standard, and that we'll need to use them
> in more places in the future, it makes sense to move their definition
> into the core framework.
>
> However, analog display usually have fairly loose timings requirements,
> the only discrete parameters being the total number of lines and pixel
> clock frequency. Thus, we created a function that will create a display
> mode from the standard, the pixel frequency and the active area.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
> Changes in v6:
> - Fix typo
>
> Changes in v4:
> - Reworded the line length check comment
> - Switch to HZ_PER_KHZ in tests
> - Use previous timing to fill our mode
> - Move the number of lines check earlier
> ---
>  drivers/gpu/drm/drm_modes.c            | 474
> +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tests/Makefile         |   1 +
>  drivers/gpu/drm/tests/drm_modes_test.c | 144 ++++++++++
>  include/drm/drm_modes.h                |  17 ++
>  4 files changed, 636 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 5d4ac79381c4..71c050c3ee6b 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -116,6 +116,480 @@ void drm_mode_probed_add(struct drm_connector
> *connector,
>  }
>  EXPORT_SYMBOL(drm_mode_probed_add);
>
> +enum drm_mode_analog {
> +       DRM_MODE_ANALOG_NTSC, /* 525 lines, 60Hz */
> +       DRM_MODE_ANALOG_PAL, /* 625 lines, 50Hz */
> +};
> +
> +/*
> + * The timings come from:
> + * -
> https://web.archive.org/web/20220406232708/http://www.kolumbus.fi/pami1/video/pal_ntsc.html
> + * -
> https://web.archive.org/web/20220406124914/http://martin.hinner.info/vga/pal.html
> + * -
> https://web.archive.org/web/20220609202433/http://www.batsocks.co.uk/readme/video_timing.htm
> + */
> +#define NTSC_LINE_DURATION_NS          63556U
> +#define NTSC_LINES_NUMBER              525
> +
> +#define NTSC_HBLK_DURATION_TYP_NS      10900U
> +#define NTSC_HBLK_DURATION_MIN_NS      (NTSC_HBLK_DURATION_TYP_NS - 200)
> +#define NTSC_HBLK_DURATION_MAX_NS      (NTSC_HBLK_DURATION_TYP_NS + 200)
> +
> +#define NTSC_HACT_DURATION_TYP_NS      (NTSC_LINE_DURATION_NS -
> NTSC_HBLK_DURATION_TYP_NS)
> +#define NTSC_HACT_DURATION_MIN_NS      (NTSC_LINE_DURATION_NS -
> NTSC_HBLK_DURATION_MAX_NS)
> +#define NTSC_HACT_DURATION_MAX_NS      (NTSC_LINE_DURATION_NS -
> NTSC_HBLK_DURATION_MIN_NS)
> +
> +#define NTSC_HFP_DURATION_TYP_NS       1500
> +#define NTSC_HFP_DURATION_MIN_NS       1270
> +#define NTSC_HFP_DURATION_MAX_NS       2220
> +
> +#define NTSC_HSLEN_DURATION_TYP_NS     4700
> +#define NTSC_HSLEN_DURATION_MIN_NS     (NTSC_HSLEN_DURATION_TYP_NS - 100)
> +#define NTSC_HSLEN_DURATION_MAX_NS     (NTSC_HSLEN_DURATION_TYP_NS + 100)
> +
> +#define NTSC_HBP_DURATION_TYP_NS       4700
> +
> +/*
> + * I couldn't find the actual tolerance for the back porch, so let's
> + * just reuse the sync length ones.
> + */
> +#define NTSC_HBP_DURATION_MIN_NS       (NTSC_HBP_DURATION_TYP_NS - 100)
> +#define NTSC_HBP_DURATION_MAX_NS       (NTSC_HBP_DURATION_TYP_NS + 100)
> +
> +#define PAL_LINE_DURATION_NS           64000U
> +#define PAL_LINES_NUMBER               625
> +
> +#define PAL_HACT_DURATION_TYP_NS       51950U
> +#define PAL_HACT_DURATION_MIN_NS       (PAL_HACT_DURATION_TYP_NS - 100)
> +#define PAL_HACT_DURATION_MAX_NS       (PAL_HACT_DURATION_TYP_NS + 400)
> +
> +#define PAL_HBLK_DURATION_TYP_NS       (PAL_LINE_DURATION_NS -
> PAL_HACT_DURATION_TYP_NS)
> +#define PAL_HBLK_DURATION_MIN_NS       (PAL_LINE_DURATION_NS -
> PAL_HACT_DURATION_MAX_NS)
> +#define PAL_HBLK_DURATION_MAX_NS       (PAL_LINE_DURATION_NS -
> PAL_HACT_DURATION_MIN_NS)
> +
> +#define PAL_HFP_DURATION_TYP_NS                1650
> +#define PAL_HFP_DURATION_MIN_NS                (PAL_HFP_DURATION_TYP_NS -
> 100)
> +#define PAL_HFP_DURATION_MAX_NS                (PAL_HFP_DURATION_TYP_NS +
> 400)
> +
> +#define PAL_HSLEN_DURATION_TYP_NS      4700
> +#define PAL_HSLEN_DURATION_MIN_NS      (PAL_HSLEN_DURATION_TYP_NS - 200)
> +#define PAL_HSLEN_DURATION_MAX_NS      (PAL_HSLEN_DURATION_TYP_NS + 200)
> +
> +#define PAL_HBP_DURATION_TYP_NS                5700
> +#define PAL_HBP_DURATION_MIN_NS                (PAL_HBP_DURATION_TYP_NS -
> 200)
> +#define PAL_HBP_DURATION_MAX_NS                (PAL_HBP_DURATION_TYP_NS +
> 200)
> +
> +struct analog_param_field {
> +       unsigned int even, odd;
> +};
> +
> +#define PARAM_FIELD(_odd, _even)               \
> +       { .even = _even, .odd = _odd }
> +
> +struct analog_param_range {
> +       unsigned int    min, typ, max;
> +};
> +
> +#define PARAM_RANGE(_min, _typ, _max)          \
> +       { .min = _min, .typ = _typ, .max = _max }
> +
> +struct analog_parameters {
> +       unsigned int                    num_lines;
> +       unsigned int                    line_duration_ns;
> +
> +       struct analog_param_range       hact_ns;
> +       struct analog_param_range       hfp_ns;
> +       struct analog_param_range       hslen_ns;
> +       struct analog_param_range       hbp_ns;
> +       struct analog_param_range       hblk_ns;
> +
> +       unsigned int                    bt601_hfp;
> +
> +       struct analog_param_field       vfp_lines;
> +       struct analog_param_field       vslen_lines;
> +       struct analog_param_field       vbp_lines;
> +};
> +
> +#define TV_MODE_PARAMETER(_mode, _lines, _line_dur, _hact, _hfp, _hslen,
> _hbp, _hblk, _bt601_hfp, _vfp, _vslen, _vbp) \
> +       [_mode] = {                                                     \
> +               .num_lines = _lines,                                    \
> +               .line_duration_ns = _line_dur,                          \
> +               .hact_ns = _hact,                                       \
> +               .hfp_ns = _hfp,                                         \
> +               .hslen_ns = _hslen,                                     \
> +               .hbp_ns = _hbp,                                         \
> +               .hblk_ns = _hblk,                                       \
> +               .bt601_hfp = _bt601_hfp,                                \
> +               .vfp_lines = _vfp,                                      \
> +               .vslen_lines = _vslen,                                  \
> +               .vbp_lines = _vbp,                                      \
> +       }
> +
> +const static struct analog_parameters tv_modes_parameters[] = {
> +       TV_MODE_PARAMETER(DRM_MODE_ANALOG_NTSC,
> +                         NTSC_LINES_NUMBER,
> +                         NTSC_LINE_DURATION_NS,
> +                         PARAM_RANGE(NTSC_HACT_DURATION_MIN_NS,
> +                                     NTSC_HACT_DURATION_TYP_NS,
> +                                     NTSC_HACT_DURATION_MAX_NS),
> +                         PARAM_RANGE(NTSC_HFP_DURATION_MIN_NS,
> +                                     NTSC_HFP_DURATION_TYP_NS,
> +                                     NTSC_HFP_DURATION_MAX_NS),
> +                         PARAM_RANGE(NTSC_HSLEN_DURATION_MIN_NS,
> +                                     NTSC_HSLEN_DURATION_TYP_NS,
> +                                     NTSC_HSLEN_DURATION_MAX_NS),
> +                         PARAM_RANGE(NTSC_HBP_DURATION_MIN_NS,
> +                                     NTSC_HBP_DURATION_TYP_NS,
> +                                     NTSC_HBP_DURATION_MAX_NS),
> +                         PARAM_RANGE(NTSC_HBLK_DURATION_MIN_NS,
> +                                     NTSC_HBLK_DURATION_TYP_NS,
> +                                     NTSC_HBLK_DURATION_MAX_NS),
> +                         16,
> +                         PARAM_FIELD(3, 3),
> +                         PARAM_FIELD(3, 3),
> +                         PARAM_FIELD(16, 17)),
> +       TV_MODE_PARAMETER(DRM_MODE_ANALOG_PAL,
> +                         PAL_LINES_NUMBER,
> +                         PAL_LINE_DURATION_NS,
> +                         PARAM_RANGE(PAL_HACT_DURATION_MIN_NS,
> +                                     PAL_HACT_DURATION_TYP_NS,
> +                                     PAL_HACT_DURATION_MAX_NS),
> +                         PARAM_RANGE(PAL_HFP_DURATION_MIN_NS,
> +                                     PAL_HFP_DURATION_TYP_NS,
> +                                     PAL_HFP_DURATION_MAX_NS),
> +                         PARAM_RANGE(PAL_HSLEN_DURATION_MIN_NS,
> +                                     PAL_HSLEN_DURATION_TYP_NS,
> +                                     PAL_HSLEN_DURATION_MAX_NS),
> +                         PARAM_RANGE(PAL_HBP_DURATION_MIN_NS,
> +                                     PAL_HBP_DURATION_TYP_NS,
> +                                     PAL_HBP_DURATION_MAX_NS),
> +                         PARAM_RANGE(PAL_HBLK_DURATION_MIN_NS,
> +                                     PAL_HBLK_DURATION_TYP_NS,
> +                                     PAL_HBLK_DURATION_MAX_NS),
> +                         12,
> +
> +                         /*
> +                          * The front porch is actually 6 short sync
> +                          * pulses for the even field, and 5 for the
> +                          * odd field. Each sync takes half a life so
> +                          * the odd field front porch is shorter by
> +                          * half a line.
> +                          *
> +                          * In progressive, we're supposed to use 6
> +                          * pulses, so we're fine there
> +                          */
> +                         PARAM_FIELD(3, 2),
> +
> +                         /*
> +                          * The vsync length is 5 long sync pulses,
> +                          * each field taking half a line. We're
> +                          * shorter for both fields by half a line.
> +                          *
> +                          * In progressive, we're supposed to use 5
> +                          * pulses, so we're off by half
> +                          * a line.
> +                          *
> +                          * In interlace, we're now off by half a line
> +                          * for the even field and one line for the odd
> +                          * field.
> +                          */
> +                         PARAM_FIELD(3, 3),
> +
> +                         /*
> +                          * The back porch starts with post-equalizing
> +                          * pulses, consisting in 5 short sync pulses
> +                          * for the even field, 4 for the odd field. In
> +                          * progressive, it's 5 short syncs.
> +                          *
> +                          * In progressive, we thus have 2.5 lines,
> +                          * plus the 0.5 line we were missing
> +                          * previously, so we should use 3 lines.
> +                          *
> +                          * In interlace, the even field is in the
> +                          * exact same case than progressive. For the
> +                          * odd field, we should be using 2 lines but
> +                          * we're one line short, so we'll make up for
> +                          * it here by using 3.
> +                          *
> +                          * The entire blanking area is supposed to
> +                          * take 25 lines, so we also need to account
> +                          * for the rest of the blanking area that
> +                          * can't be in either the front porch or sync
> +                          * period.
> +                          */
> +                         PARAM_FIELD(19, 20)),
> +};
> +
> +static int fill_analog_mode(struct drm_device *dev,
> +                           struct drm_display_mode *mode,
> +                           const struct analog_parameters *params,
> +                           unsigned long pixel_clock_hz,
> +                           unsigned int hactive,
> +                           unsigned int vactive,
> +                           bool interlace)
> +{
> +       unsigned long pixel_duration_ns = NSEC_PER_SEC / pixel_clock_hz;
> +       unsigned int htotal, vtotal;
> +       unsigned int max_hact, hact_duration_ns;
> +       unsigned int hblk, hblk_duration_ns;
> +       unsigned int hfp, hfp_duration_ns;
> +       unsigned int hslen, hslen_duration_ns;
> +       unsigned int hbp, hbp_duration_ns;
> +       unsigned int porches, porches_duration_ns;
> +       unsigned int vfp, vfp_min;
> +       unsigned int vbp, vbp_min;
> +       unsigned int vslen;
> +       bool bt601 = false;
> +       int porches_rem;
> +       u64 result;
> +
> +       drm_dbg_kms(dev,
> +                   "Generating a %ux%u%c, %u-line mode with a %lu kHz
> clock\n",
> +                   hactive, vactive,
> +                   interlace ? 'i' : 'p',
> +                   params->num_lines,
> +                   pixel_clock_hz / 1000);
> +
> +       max_hact = params->hact_ns.max / pixel_duration_ns;
> +       if (pixel_clock_hz == 13500000 && hactive > max_hact && hactive <=
> 720) {
> +               drm_dbg_kms(dev, "Trying to generate a BT.601 mode.
> Disabling checks.\n");
> +               bt601 = true;
> +       }
> +
> +       /*
> +        * Our pixel duration is going to be round down by the division,
> +        * so rounding up is probably going to introduce even more
> +        * deviation.
> +        */
> +       result = (u64)params->line_duration_ns * pixel_clock_hz;
> +       do_div(result, NSEC_PER_SEC);
> +       htotal = result;
> +
> +       drm_dbg_kms(dev, "Total Horizontal Number of Pixels: %u\n",
> htotal);
> +
> +       hact_duration_ns = hactive * pixel_duration_ns;
> +       if (!bt601 &&
> +           (hact_duration_ns < params->hact_ns.min ||
> +            hact_duration_ns > params->hact_ns.max)) {
> +               DRM_ERROR("Invalid horizontal active area duration: %uns
> (min: %u, max %u)\n",
> +                         hact_duration_ns, params->hact_ns.min,
> params->hact_ns.max);
> +               return -EINVAL;
> +       }
> +
> +       hblk = htotal - hactive;
> +       drm_dbg_kms(dev, "Horizontal Blanking Period: %u\n", hblk);
> +
> +       hblk_duration_ns = hblk * pixel_duration_ns;
> +       if (!bt601 &&
> +           (hblk_duration_ns < params->hblk_ns.min ||
> +            hblk_duration_ns > params->hblk_ns.max)) {
> +               DRM_ERROR("Invalid horizontal blanking duration: %uns
> (min: %u, max %u)\n",
> +                         hblk_duration_ns, params->hblk_ns.min,
> params->hblk_ns.max);
> +               return -EINVAL;
> +       }
> +
> +       hslen = DIV_ROUND_UP(params->hslen_ns.typ, pixel_duration_ns);
> +       drm_dbg_kms(dev, "Horizontal Sync Period: %u\n", hslen);
> +
> +       hslen_duration_ns = hslen * pixel_duration_ns;
> +       if (!bt601 &&
> +           (hslen_duration_ns < params->hslen_ns.min ||
> +            hslen_duration_ns > params->hslen_ns.max)) {
> +               DRM_ERROR("Invalid horizontal sync duration: %uns (min:
> %u, max %u)\n",
> +                         hslen_duration_ns, params->hslen_ns.min,
> params->hslen_ns.max);
> +               return -EINVAL;
> +       }
> +
> +       porches = hblk - hslen;
> +       drm_dbg_kms(dev, "Remaining horizontal pixels for both porches:
> %u\n", porches);
> +
> +       porches_duration_ns = porches * pixel_duration_ns;
> +       if (!bt601 &&
> +           (porches_duration_ns > (params->hfp_ns.max +
> params->hbp_ns.max) ||
> +            porches_duration_ns < (params->hfp_ns.min +
> params->hbp_ns.min))) {
> +               DRM_ERROR("Invalid horizontal porches duration: %uns\n",
> porches_duration_ns);
> +               return -EINVAL;
> +       }
> +
> +       if (bt601) {
> +               hfp = params->bt601_hfp;
> +       } else {
> +               unsigned int hfp_min = DIV_ROUND_UP(params->hfp_ns.min,
> +                                                   pixel_duration_ns);
> +               unsigned int hbp_min = DIV_ROUND_UP(params->hbp_ns.min,
> +                                                   pixel_duration_ns);
> +                int porches_rem = porches - hfp_min - hbp_min;
> +
> +               hfp = hfp_min + DIV_ROUND_UP(porches_rem, 2);
> +       }
> +
> +       drm_dbg_kms(dev, "Horizontal Front Porch: %u\n", hfp);
> +
> +       hfp_duration_ns = hfp * pixel_duration_ns;
> +       if (!bt601 &&
> +           (hfp_duration_ns < params->hfp_ns.min ||
> +            hfp_duration_ns > params->hfp_ns.max)) {
> +               DRM_ERROR("Invalid horizontal front porch duration: %uns
> (min: %u, max %u)\n",
> +                         hfp_duration_ns, params->hfp_ns.min,
> params->hfp_ns.max);
> +               return -EINVAL;
> +       }
> +
> +       hbp = porches - hfp;
> +       drm_dbg_kms(dev, "Horizontal Back Porch: %u\n", hbp);
> +
> +       hbp_duration_ns = hbp * pixel_duration_ns;
> +       if (!bt601 &&
> +           (hbp_duration_ns < params->hbp_ns.min ||
> +            hbp_duration_ns > params->hbp_ns.max)) {
> +               DRM_ERROR("Invalid horizontal back porch duration: %uns
> (min: %u, max %u)\n",
> +                         hbp_duration_ns, params->hbp_ns.min,
> params->hbp_ns.max);
> +               return -EINVAL;
> +       }
> +
> +       if (htotal != (hactive + hfp + hslen + hbp))
> +               return -EINVAL;
> +
> +       mode->clock = pixel_clock_hz / 1000;
> +       mode->hdisplay = hactive;
> +       mode->hsync_start = mode->hdisplay + hfp;
> +       mode->hsync_end = mode->hsync_start + hslen;
> +       mode->htotal = mode->hsync_end + hbp;
> +
> +       if (interlace) {
> +               vfp_min = params->vfp_lines.even + params->vfp_lines.odd;
> +               vbp_min = params->vbp_lines.even + params->vbp_lines.odd;
> +               vslen = params->vslen_lines.even + params->vslen_lines.odd;
> +       } else {
> +               /*
> +                * By convention, NTSC (aka 525/60) systems start with
> +                * the even field, but PAL (aka 625/50) systems start
> +                * with the odd one.
> +                *
> +                * PAL systems also have asymetric timings between the
> +                * even and odd field, while NTSC is symetric.
> +                *
> +                * Moreover, if we want to create a progressive mode for
> +                * PAL, we need to use the odd field timings.
> +                *
> +                * Since odd == even for NTSC, we can just use the odd
> +                * one all the time to simplify the code a bit.
> +                */
> +               vfp_min = params->vfp_lines.odd;
> +               vbp_min = params->vbp_lines.odd;
> +               vslen = params->vslen_lines.odd;
> +       }
> +
> +       drm_dbg_kms(dev, "Vertical Sync Period: %u\n", vslen);
> +
> +       porches = params->num_lines - vactive - vslen;
> +       drm_dbg_kms(dev, "Remaining vertical pixels for both porches:
> %u\n", porches);
> +
> +       porches_rem = porches - vfp_min - vbp_min;
> +       vfp = vfp_min + (porches_rem / 2);
> +       drm_dbg_kms(dev, "Vertical Front Porch: %u\n", vfp);
> +
> +       vbp = porches - vfp;
> +       drm_dbg_kms(dev, "Vertical Back Porch: %u\n", vbp);
> +
> +       vtotal = vactive + vfp + vslen + vbp;
> +       if (params->num_lines != vtotal) {
> +               DRM_ERROR("Invalid vertical total: %upx (expected %upx)\n",
> +                         vtotal, params->num_lines);
> +               return -EINVAL;
> +       }
> +
> +       mode->vdisplay = vactive;
> +       mode->vsync_start = mode->vdisplay + vfp;
> +       mode->vsync_end = mode->vsync_start + vslen;
> +       mode->vtotal = mode->vsync_end + vbp;
> +
> +       if (mode->vtotal != params->num_lines)
> +               return -EINVAL;
> +
> +       mode->type = DRM_MODE_TYPE_DRIVER;
> +       mode->flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC;
> +       if (interlace)
> +               mode->flags |= DRM_MODE_FLAG_INTERLACE;
> +
> +       drm_mode_set_name(mode);
> +
> +       drm_dbg_kms(dev, "Generated mode " DRM_MODE_FMT "\n",
> DRM_MODE_ARG(mode));
> +
> +       return 0;
> +}
> +
> +/**
> + * drm_analog_tv_mode - create a display mode for an analog TV
> + * @dev: drm device
> + * @tv_mode: TV Mode standard to create a mode for. See
> DRM_MODE_TV_MODE_*.
> + * @pixel_clock_hz: Pixel Clock Frequency, in Hertz
> + * @hdisplay: hdisplay size
> + * @vdisplay: vdisplay size
> + * @interlace: whether to compute an interlaced mode
> + *
> + * This function creates a struct drm_display_mode instance suited for
> + * an analog TV output, for one of the usual analog TV mode.
> + *
> + * Note that @hdisplay is larger than the usual constraints for the PAL
> + * and NTSC timings, and we'll choose to ignore most timings constraints
> + * to reach those resolutions.
> + *
> + * Returns:
> + *
> + * A pointer to the mode, allocated with drm_mode_create(). Returns NULL
> + * on error.
> + */
> +struct drm_display_mode *drm_analog_tv_mode(struct drm_device *dev,
> +                                           enum drm_connector_tv_mode
> tv_mode,
> +                                           unsigned long pixel_clock_hz,
> +                                           unsigned int hdisplay,
> +                                           unsigned int vdisplay,
> +                                           bool interlace)
> +{
> +       struct drm_display_mode *mode;
> +       enum drm_mode_analog analog;
> +       int ret;
> +
> +       switch (tv_mode) {
> +       case DRM_MODE_TV_MODE_NTSC:
> +               fallthrough;
> +       case DRM_MODE_TV_MODE_NTSC_443:
> +               fallthrough;
> +       case DRM_MODE_TV_MODE_NTSC_J:
> +               fallthrough;
> +       case DRM_MODE_TV_MODE_PAL_M:
> +               analog = DRM_MODE_ANALOG_NTSC;
> +               break;
> +
> +       case DRM_MODE_TV_MODE_PAL:
> +               fallthrough;
> +       case DRM_MODE_TV_MODE_PAL_N:
> +               fallthrough;
> +       case DRM_MODE_TV_MODE_SECAM:
> +               analog = DRM_MODE_ANALOG_PAL;
> +               break;
> +
> +       default:
> +               return NULL;
> +       }
> +
> +       mode = drm_mode_create(dev);
> +       if (!mode)
> +               return NULL;
> +
> +       ret = fill_analog_mode(dev, mode,
> +                              &tv_modes_parameters[analog],
> +                              pixel_clock_hz, hdisplay, vdisplay,
> interlace);
> +       if (ret)
> +               goto err_free_mode;
> +
> +       return mode;
> +
> +err_free_mode:
> +       drm_mode_destroy(dev, mode);
> +       return NULL;
> +}
> +EXPORT_SYMBOL(drm_analog_tv_mode);
> +
>  /**
>   * drm_cvt_mode -create a modeline based on the CVT algorithm
>   * @dev: drm device
> diff --git a/drivers/gpu/drm/tests/Makefile
> b/drivers/gpu/drm/tests/Makefile
> index b29ef1085cad..b22ac96fdd65 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>         drm_framebuffer_test.o \
>         drm_kunit_helpers.o \
>         drm_mm_test.o \
> +       drm_modes_test.o \
>         drm_plane_helper_test.o \
>         drm_rect_test.o
> diff --git a/drivers/gpu/drm/tests/drm_modes_test.c
> b/drivers/gpu/drm/tests/drm_modes_test.c
> new file mode 100644
> index 000000000000..550e3b95453e
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_modes_test.c
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Kunit test for drm_modes functions
> + */
> +
> +#include <drm/drm_modes.h>
> +
> +#include <kunit/test.h>
> +
> +#include <linux/units.h>
> +
> +#include "drm_kunit_helpers.h"
> +
> +struct drm_modes_test_priv {
> +       struct drm_device *drm;
> +};
> +
> +static int drm_modes_test_init(struct kunit *test)
> +{
> +       struct drm_modes_test_priv *priv;
> +
> +       priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       priv->drm = drm_kunit_device_init(test, "drm-modes-test");
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
> +
> +       test->priv = priv;
> +
> +       return 0;
> +}
> +
> +static void drm_modes_analog_tv_ntsc_480i(struct kunit *test)
> +{
> +       struct drm_modes_test_priv *priv = test->priv;
> +       struct drm_display_mode *mode;
> +
> +       mode = drm_analog_tv_mode(priv->drm,
> +                                 DRM_MODE_TV_MODE_NTSC,
> +                                 13500 * HZ_PER_KHZ, 720, 480,
> +                                 true);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 60);
> +       KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
> +
> +       /* BT.601 defines hsync_start at 736 for 480i */
> +       KUNIT_EXPECT_EQ(test, mode->hsync_start, 736);
> +
> +       /*
> +        * The NTSC standard expects a line to take 63.556us. With a
> +        * pixel clock of 13.5 MHz, a pixel takes around 74ns, so we
> +        * need to have 63556ns / 74ns = 858.
> +        *
> +        * This is also mandated by BT.601.
> +        */
> +       KUNIT_EXPECT_EQ(test, mode->htotal, 858);
> +
> +       KUNIT_EXPECT_EQ(test, mode->vdisplay, 480);
> +       KUNIT_EXPECT_EQ(test, mode->vtotal, 525);
> +}
> +
> +static void drm_modes_analog_tv_ntsc_480i_inlined(struct kunit *test)
> +{
> +       struct drm_modes_test_priv *priv = test->priv;
> +       struct drm_display_mode *expected, *mode;
> +
> +       expected = drm_analog_tv_mode(priv->drm,
> +                                     DRM_MODE_TV_MODE_NTSC,
> +                                     13500 * HZ_PER_KHZ, 720, 480,
> +                                     true);
> +       KUNIT_ASSERT_NOT_NULL(test, expected);
> +
> +       mode = drm_mode_analog_ntsc_480i(priv->drm);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected, mode));
> +}
> +
> +static void drm_modes_analog_tv_pal_576i(struct kunit *test)
> +{
> +       struct drm_modes_test_priv *priv = test->priv;
> +       struct drm_display_mode *mode;
> +
> +       mode = drm_analog_tv_mode(priv->drm,
> +                                 DRM_MODE_TV_MODE_PAL,
> +                                 13500 * HZ_PER_KHZ, 720, 576,
> +                                 true);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 50);
> +       KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
> +
> +       /* BT.601 defines hsync_start at 732 for 576i */
> +       KUNIT_EXPECT_EQ(test, mode->hsync_start, 732);
> +
> +       /*
> +        * The PAL standard expects a line to take 64us. With a pixel
> +        * clock of 13.5 MHz, a pixel takes around 74ns, so we need to
> +        * have 64000ns / 74ns = 864.
> +        *
> +        * This is also mandated by BT.601.
> +        */
> +       KUNIT_EXPECT_EQ(test, mode->htotal, 864);
> +
> +       KUNIT_EXPECT_EQ(test, mode->vdisplay, 576);
> +       KUNIT_EXPECT_EQ(test, mode->vtotal, 625);
> +}
> +
> +static void drm_modes_analog_tv_pal_576i_inlined(struct kunit *test)
> +{
> +       struct drm_modes_test_priv *priv = test->priv;
> +       struct drm_display_mode *expected, *mode;
> +
> +       expected = drm_analog_tv_mode(priv->drm,
> +                                     DRM_MODE_TV_MODE_PAL,
> +                                     13500 * HZ_PER_KHZ, 720, 576,
> +                                     true);
> +       KUNIT_ASSERT_NOT_NULL(test, expected);
> +
> +       mode = drm_mode_analog_pal_576i(priv->drm);
> +       KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +       KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected, mode));
> +}
> +
> +static struct kunit_case drm_modes_analog_tv_tests[] = {
> +       KUNIT_CASE(drm_modes_analog_tv_ntsc_480i),
> +       KUNIT_CASE(drm_modes_analog_tv_ntsc_480i_inlined),
> +       KUNIT_CASE(drm_modes_analog_tv_pal_576i),
> +       KUNIT_CASE(drm_modes_analog_tv_pal_576i_inlined),
> +       { }
> +};
> +
> +static struct kunit_suite drm_modes_analog_tv_test_suite = {
> +       .name = "drm_modes_analog_tv",
> +       .init = drm_modes_test_init,
> +       .test_cases = drm_modes_analog_tv_tests,
> +};
> +
> +kunit_test_suites(
> +       &drm_modes_analog_tv_test_suite
> +);
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index b0c680e6f670..c613f0abe9dc 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -468,6 +468,23 @@ bool drm_mode_is_420_also(const struct
> drm_display_info *display,
>  bool drm_mode_is_420(const struct drm_display_info *display,
>                      const struct drm_display_mode *mode);
>
> +struct drm_display_mode *drm_analog_tv_mode(struct drm_device *dev,
> +                                           enum drm_connector_tv_mode
> mode,
> +                                           unsigned long pixel_clock_hz,
> +                                           unsigned int hdisplay,
> +                                           unsigned int vdisplay,
> +                                           bool interlace);
> +
> +static inline struct drm_display_mode *drm_mode_analog_ntsc_480i(struct
> drm_device *dev)
> +{
> +       return drm_analog_tv_mode(dev, DRM_MODE_TV_MODE_NTSC, 13500000,
> 720, 480, true);
> +}
> +
> +static inline struct drm_display_mode *drm_mode_analog_pal_576i(struct
> drm_device *dev)
> +{
> +       return drm_analog_tv_mode(dev, DRM_MODE_TV_MODE_PAL, 13500000,
> 720, 576, true);
> +}
> +
>  struct drm_display_mode *drm_cvt_mode(struct drm_device *dev,
>                                       int hdisplay, int vdisplay, int
> vrefresh,
>                                       bool reduced, bool interlaced,
>
> --
> b4 0.11.0-dev-99e3a
>

--000000000000b0243905ecf58340
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGksIHlvdXIgc3RhdGVtZW50OjxkaXY+PGJyPjwvZGl2PjxkaXY+JnF1
b3Q7SG93ZXZlciwgYW5hbG9nIGRpc3BsYXkgdXN1YWxseSBoYXZlIGZhaXJseSBsb29zZSB0aW1p
bmdzIHJlcXVpcmVtZW50cyw8L2Rpdj50aGUgb25seSBkaXNjcmV0ZSBwYXJhbWV0ZXJzIGJlaW5n
IHRoZSB0b3RhbCBudW1iZXIgb2YgbGluZXMgYW5kIHBpeGVsPGJyPmNsb2NrIGZyZXF1ZW5jeS4m
cXVvdDs8ZGl2Pjxicj48L2Rpdj48ZGl2PlBsZWFzZSBkbyBub3QgbWFrZSBpdCBhcyBhIHJ1bGUu
IFlvdSBzYWlkIHlvdXJzZWxmOiAmcXVvdDt1c3VhbGx5JnF1b3Q7LiBBcmNhZGUgQ1JUIGhhdmUg
bW9yZSBsb29zZSB0aW1pbmdzLCBidXQgcHJvZmVzc2lvbmFsIGJyb2FkY2FzdCBUViYjMzk7cyBz
dWNoIGFzIFNvbnkgUFZNLCBTb255IEJWTSwgSlZDLiBUaGVzZSBjb3N0IHRlbnMgb2YgdGhvdXNh
bmTCoGRvbGxhcnMgYmFjayBpbiB0aGUgZGF5LiBOb3cgdGhleSBhcmUgYWZmb3JkYWJsZSBmb3Ig
Z2FtZXJzLiBJIGp1c3Qgc29sdmVkIGlzc3VlIGluIFJldHJvYXJjaCwgQ1JUIFN3aXRjaHJlcyBs
aWJyYXJ5IGhlcmU6wqA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vYW50b25pb2dpbmVyL3N3
aXRjaHJlcy9pc3N1ZXMvOTYiPmh0dHBzOi8vZ2l0aHViLmNvbS9hbnRvbmlvZ2luZXIvc3dpdGNo
cmVzL2lzc3Vlcy85NjwvYT48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoaXMgbW9kZWwgaXMg
cXVpdGUgY29tbW9uIGFtb25nIHJldHJvZ2FtZXJzIGFuZCBvbiBSZWRkaXQuPC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj5Tb21lIGRldmVsb3BlcnMgZG8gbm90IHRlc3QgaXQgcHJvcGVybHkuPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGlzIG1vZGVsIHJlcXVpcmVzIGV4YWN0IG51bWJlciBv
ZiBsaW5lcy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkZvciBTd2l0Y2hyZXPCoHdlIGNhbWUg
dXAgd2l0aCB0aGVzZSByYW5nZXM6PC9kaXY+PGRpdj48cHJlIGNsYXNzPSJnbWFpbC1ub3RyYW5z
bGF0ZSIgc3R5bGU9ImJveC1zaXppbmc6Ym9yZGVyLWJveDtmb250LWZhbWlseTp1aS1tb25vc3Bh
Y2UsU0ZNb25vLVJlZ3VsYXIsJnF1b3Q7U0YgTW9ubyZxdW90OyxNZW5sbyxDb25zb2xhcywmcXVv
dDtMaWJlcmF0aW9uIE1vbm8mcXVvdDssbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMS45cHg7bWFyZ2lu
LXRvcDowcHg7bWFyZ2luLWJvdHRvbToxNnB4O3BhZGRpbmc6MTZweDtvdmVyZmxvdzphdXRvO2xp
bmUtaGVpZ2h0OjEuNDU7Ym9yZGVyLXJhZGl1czo2cHg7Y29sb3I6cmdiKDM2LDQxLDQ3KSI+PGNv
ZGUgc3R5bGU9ImJveC1zaXppbmc6Ym9yZGVyLWJveDtmb250LWZhbWlseTp1aS1tb25vc3BhY2Us
U0ZNb25vLVJlZ3VsYXIsJnF1b3Q7U0YgTW9ubyZxdW90OyxNZW5sbyxDb25zb2xhcywmcXVvdDtM
aWJlcmF0aW9uIE1vbm8mcXVvdDssbW9ub3NwYWNlO3BhZGRpbmc6MHB4O21hcmdpbjowcHg7YmFj
a2dyb3VuZDp0cmFuc3BhcmVudDtib3JkZXItcmFkaXVzOjZweDt3b3JkLWJyZWFrOm5vcm1hbDti
b3JkZXI6MHB4O2Rpc3BsYXk6aW5saW5lO292ZXJmbG93OnZpc2libGU7bGluZS1oZWlnaHQ6aW5o
ZXJpdCI+ICAgICAgICBjcnRfcmFuZ2UwIDE1NjI1LTE1NzUwLCA0OS41MC02NS4wMCwgMi4wMDAs
IDQuNzAwLCA4LjAwMCwgMC4wNjQsIDAuMTkyLCAxLjAyNCwgMSwgMSwgMTkyLCAyODgsIDAsIDAN
CiAgICAgICAgY3J0X3JhbmdlMSAxNTYyNS4wMC0xNTYyNS4wMCwgNTAuMDAtNTAuMDAsIDEuNTAw
LCA0LjcwMCwgNS44MDAsIDAuMDY0LCAwLjE2MCwgMS4wNTYsIDEsIDEsIDAsIDAsIDQ0OCwgNTc2
DQogICAgICAgIGNydF9yYW5nZTIgMTU3MzQuMjYtMTU3MzQuMjYsIDU5Ljk0LTU5Ljk0LCAxLjUw
MCwgNC43MDAsIDQuNzAwLCAwLjE5MSwgMC4xOTEsIDAuOTUzLCAxLCAxLCAwLCAwLCA0NDgsIDQ4
MA0KPC9jb2RlPjwvcHJlPmNydF9yYW5nZTAgaXMgZGVmYXVsdCwgbW9yZSBsb29zZSBkZWZpbml0
aW9uIGZvciBNQU1FIGVtdWxhdG9ycy4gY3J0X3JhbmdlMSBpcyBQQUwgYW5kIGNydF9yYW5nZTIg
aXMgTlRTQy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlllcywgdGhpcyBtb2RlbCBkb2VzIHN1
cHBvcnQgYm90aCBOVFNDIGFuZCBQQUwuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Eb2VzIHlv
dXIgZHJpdmVyIG9yIGxpYnJhcnkgc3VwcG9ydCB0aGF0PzwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+Rm9yIGV4YW1wbGUgb2xkIGRyaXZlciBpbiBXaW5kb3dzIDcgd2l0aCBOVklESUEgMjAwNyBk
cml2ZXIgb24gR2Vmb3JjZSA3NjAwIGNhbiBzdXBwb3J0IGJvdGggTlRTQyBhbmQgUEFMIGFuZCB0
aGVzZSBhcmUgYmVpbmcgc3dpdGNoZWQgYXV0b21hdGljYWxseSBieSB0aGUgcmVzb2x1dGlvbiB5
b3UgY2hvb3NlLiBTbyBpbiBkZXNrdG9wIHByb3BlcnRpZXMsIHlvdSBjaGFuZ2UgdG8gNjQweDQ4
MCBhbmQgaXQgd2lsbCBzd2l0Y2ggVFYgY2hpcHNldCB0byBOVFNDIDQ4MGkuIFRoZW4geW91IGNo
YW5nZSB0byA3MjB4NTc2IGFuZCBpdCB3aWxsIHN3aXRjaCBUViBjaGlwc2V0IHRvIFBBTCA1NzZp
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SXQgd291bGQgYmUgcHJlZmVycmVkIGlmIGFkdmFu
Y2VkIHVzZXJzIGNvdWxkIHNldCB1cCB0aGVzZSBudW1iZXJzIGZyb20gYSBjb21tYW5kbGluZSBk
dXJpbmcgYSBydW50aW1lLCBzbyBpdCB3b3VsZCBkZXBlbmQgb24gdGhlIGFwcCBiZWluZyB1c2Vk
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+THVrYXM8L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24s
IE5vdiA3LCAyMDIyIGF0IDM6MTcgUE0gTWF4aW1lIFJpcGFyZCAmbHQ7bWF4aW1lQGNlcm5vLnRl
Y2gmZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigy
MDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+TXVsdGlwbGUgZHJpdmVycyAobWVzb24sIHZj
NCwgc3VuNGkpIGRlZmluZSBhbmFsb2cgVFYgNTI1LWxpbmVzIGFuZDxicj4NCjYyNS1saW5lcyBt
b2RlcyBpbiB0aGVpciBkcml2ZXJzLjxicj4NCjxicj4NClNpbmNlIHRob3NlIG1vZGVzIGFyZSBm
YWlybHkgc3RhbmRhcmQsIGFuZCB0aGF0IHdlJiMzOTtsbCBuZWVkIHRvIHVzZSB0aGVtPGJyPg0K
aW4gbW9yZSBwbGFjZXMgaW4gdGhlIGZ1dHVyZSwgaXQgbWFrZXMgc2Vuc2UgdG8gbW92ZSB0aGVp
ciBkZWZpbml0aW9uPGJyPg0KaW50byB0aGUgY29yZSBmcmFtZXdvcmsuPGJyPg0KPGJyPg0KSG93
ZXZlciwgYW5hbG9nIGRpc3BsYXkgdXN1YWxseSBoYXZlIGZhaXJseSBsb29zZSB0aW1pbmdzIHJl
cXVpcmVtZW50cyw8YnI+DQp0aGUgb25seSBkaXNjcmV0ZSBwYXJhbWV0ZXJzIGJlaW5nIHRoZSB0
b3RhbCBudW1iZXIgb2YgbGluZXMgYW5kIHBpeGVsPGJyPg0KY2xvY2sgZnJlcXVlbmN5LiBUaHVz
LCB3ZSBjcmVhdGVkIGEgZnVuY3Rpb24gdGhhdCB3aWxsIGNyZWF0ZSBhIGRpc3BsYXk8YnI+DQpt
b2RlIGZyb20gdGhlIHN0YW5kYXJkLCB0aGUgcGl4ZWwgZnJlcXVlbmN5IGFuZCB0aGUgYWN0aXZl
IGFyZWEuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCAmbHQ7bWF4aW1l
QGNlcm5vLnRlY2gmZ3Q7PGJyPg0KPGJyPg0KLS0tPGJyPg0KQ2hhbmdlcyBpbiB2Njo8YnI+DQot
IEZpeCB0eXBvPGJyPg0KPGJyPg0KQ2hhbmdlcyBpbiB2NDo8YnI+DQotIFJld29yZGVkIHRoZSBs
aW5lIGxlbmd0aCBjaGVjayBjb21tZW50PGJyPg0KLSBTd2l0Y2ggdG8gSFpfUEVSX0tIWiBpbiB0
ZXN0czxicj4NCi0gVXNlIHByZXZpb3VzIHRpbWluZyB0byBmaWxsIG91ciBtb2RlPGJyPg0KLSBN
b3ZlIHRoZSBudW1iZXIgb2YgbGluZXMgY2hlY2sgZWFybGllcjxicj4NCi0tLTxicj4NCsKgZHJp
dmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jwqAgwqAgwqAgwqAgwqAgwqAgfCA0NzQgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrPGJyPg0KwqBkcml2ZXJzL2dwdS9kcm0vdGVzdHMvTWFr
ZWZpbGXCoCDCoCDCoCDCoCDCoHzCoCDCoDEgKzxicj4NCsKgZHJpdmVycy9ncHUvZHJtL3Rlc3Rz
L2RybV9tb2Rlc190ZXN0LmMgfCAxNDQgKysrKysrKysrKzxicj4NCsKgaW5jbHVkZS9kcm0vZHJt
X21vZGVzLmjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgMTcgKys8YnI+DQrCoDQgZmlsZXMg
Y2hhbmdlZCwgNjM2IGluc2VydGlvbnMoKyk8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jPGJyPg0K
aW5kZXggNWQ0YWM3OTM4MWM0Li43MWMwNTBjM2VlNmIgMTAwNjQ0PGJyPg0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9tb2Rlcy5jPGJyPg0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rl
cy5jPGJyPg0KQEAgLTExNiw2ICsxMTYsNDgwIEBAIHZvaWQgZHJtX21vZGVfcHJvYmVkX2FkZChz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLDxicj4NCsKgfTxicj4NCsKgRVhQT1JUX1NZ
TUJPTChkcm1fbW9kZV9wcm9iZWRfYWRkKTs8YnI+DQo8YnI+DQorZW51bSBkcm1fbW9kZV9hbmFs
b2cgezxicj4NCivCoCDCoCDCoCDCoERSTV9NT0RFX0FOQUxPR19OVFNDLCAvKiA1MjUgbGluZXMs
IDYwSHogKi88YnI+DQorwqAgwqAgwqAgwqBEUk1fTU9ERV9BTkFMT0dfUEFMLCAvKiA2MjUgbGlu
ZXMsIDUwSHogKi88YnI+DQorfTs8YnI+DQorPGJyPg0KKy8qPGJyPg0KKyAqIFRoZSB0aW1pbmdz
IGNvbWUgZnJvbTo8YnI+DQorICogLSA8YSBocmVmPSJodHRwczovL3dlYi5hcmNoaXZlLm9yZy93
ZWIvMjAyMjA0MDYyMzI3MDgvaHR0cDovL3d3dy5rb2x1bWJ1cy5maS9wYW1pMS92aWRlby9wYWxf
bnRzYy5odG1sIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3dlYi5h
cmNoaXZlLm9yZy93ZWIvMjAyMjA0MDYyMzI3MDgvaHR0cDovL3d3dy5rb2x1bWJ1cy5maS9wYW1p
MS92aWRlby9wYWxfbnRzYy5odG1sPC9hPjxicj4NCisgKiAtIDxhIGhyZWY9Imh0dHBzOi8vd2Vi
LmFyY2hpdmUub3JnL3dlYi8yMDIyMDQwNjEyNDkxNC9odHRwOi8vbWFydGluLmhpbm5lci5pbmZv
L3ZnYS9wYWwuaHRtbCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly93
ZWIuYXJjaGl2ZS5vcmcvd2ViLzIwMjIwNDA2MTI0OTE0L2h0dHA6Ly9tYXJ0aW4uaGlubmVyLmlu
Zm8vdmdhL3BhbC5odG1sPC9hPjxicj4NCisgKiAtIDxhIGhyZWY9Imh0dHBzOi8vd2ViLmFyY2hp
dmUub3JnL3dlYi8yMDIyMDYwOTIwMjQzMy9odHRwOi8vd3d3LmJhdHNvY2tzLmNvLnVrL3JlYWRt
ZS92aWRlb190aW1pbmcuaHRtIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL3dlYi5hcmNoaXZlLm9yZy93ZWIvMjAyMjA2MDkyMDI0MzMvaHR0cDovL3d3dy5iYXRzb2Nr
cy5jby51ay9yZWFkbWUvdmlkZW9fdGltaW5nLmh0bTwvYT48YnI+DQorICovPGJyPg0KKyNkZWZp
bmUgTlRTQ19MSU5FX0RVUkFUSU9OX05TwqAgwqAgwqAgwqAgwqAgNjM1NTZVPGJyPg0KKyNkZWZp
bmUgTlRTQ19MSU5FU19OVU1CRVLCoCDCoCDCoCDCoCDCoCDCoCDCoCA1MjU8YnI+DQorPGJyPg0K
KyNkZWZpbmUgTlRTQ19IQkxLX0RVUkFUSU9OX1RZUF9OU8KgIMKgIMKgIDEwOTAwVTxicj4NCisj
ZGVmaW5lIE5UU0NfSEJMS19EVVJBVElPTl9NSU5fTlPCoCDCoCDCoCAoTlRTQ19IQkxLX0RVUkFU
SU9OX1RZUF9OUyAtIDIwMCk8YnI+DQorI2RlZmluZSBOVFNDX0hCTEtfRFVSQVRJT05fTUFYX05T
wqAgwqAgwqAgKE5UU0NfSEJMS19EVVJBVElPTl9UWVBfTlMgKyAyMDApPGJyPg0KKzxicj4NCisj
ZGVmaW5lIE5UU0NfSEFDVF9EVVJBVElPTl9UWVBfTlPCoCDCoCDCoCAoTlRTQ19MSU5FX0RVUkFU
SU9OX05TIC0gTlRTQ19IQkxLX0RVUkFUSU9OX1RZUF9OUyk8YnI+DQorI2RlZmluZSBOVFNDX0hB
Q1RfRFVSQVRJT05fTUlOX05TwqAgwqAgwqAgKE5UU0NfTElORV9EVVJBVElPTl9OUyAtIE5UU0Nf
SEJMS19EVVJBVElPTl9NQVhfTlMpPGJyPg0KKyNkZWZpbmUgTlRTQ19IQUNUX0RVUkFUSU9OX01B
WF9OU8KgIMKgIMKgIChOVFNDX0xJTkVfRFVSQVRJT05fTlMgLSBOVFNDX0hCTEtfRFVSQVRJT05f
TUlOX05TKTxicj4NCis8YnI+DQorI2RlZmluZSBOVFNDX0hGUF9EVVJBVElPTl9UWVBfTlPCoCDC
oCDCoCDCoDE1MDA8YnI+DQorI2RlZmluZSBOVFNDX0hGUF9EVVJBVElPTl9NSU5fTlPCoCDCoCDC
oCDCoDEyNzA8YnI+DQorI2RlZmluZSBOVFNDX0hGUF9EVVJBVElPTl9NQVhfTlPCoCDCoCDCoCDC
oDIyMjA8YnI+DQorPGJyPg0KKyNkZWZpbmUgTlRTQ19IU0xFTl9EVVJBVElPTl9UWVBfTlPCoCDC
oCDCoDQ3MDA8YnI+DQorI2RlZmluZSBOVFNDX0hTTEVOX0RVUkFUSU9OX01JTl9OU8KgIMKgIMKg
KE5UU0NfSFNMRU5fRFVSQVRJT05fVFlQX05TIC0gMTAwKTxicj4NCisjZGVmaW5lIE5UU0NfSFNM
RU5fRFVSQVRJT05fTUFYX05TwqAgwqAgwqAoTlRTQ19IU0xFTl9EVVJBVElPTl9UWVBfTlMgKyAx
MDApPGJyPg0KKzxicj4NCisjZGVmaW5lIE5UU0NfSEJQX0RVUkFUSU9OX1RZUF9OU8KgIMKgIMKg
IMKgNDcwMDxicj4NCis8YnI+DQorLyo8YnI+DQorICogSSBjb3VsZG4mIzM5O3QgZmluZCB0aGUg
YWN0dWFsIHRvbGVyYW5jZSBmb3IgdGhlIGJhY2sgcG9yY2gsIHNvIGxldCYjMzk7czxicj4NCisg
KiBqdXN0IHJldXNlIHRoZSBzeW5jIGxlbmd0aCBvbmVzLjxicj4NCisgKi88YnI+DQorI2RlZmlu
ZSBOVFNDX0hCUF9EVVJBVElPTl9NSU5fTlPCoCDCoCDCoCDCoChOVFNDX0hCUF9EVVJBVElPTl9U
WVBfTlMgLSAxMDApPGJyPg0KKyNkZWZpbmUgTlRTQ19IQlBfRFVSQVRJT05fTUFYX05TwqAgwqAg
wqAgwqAoTlRTQ19IQlBfRFVSQVRJT05fVFlQX05TICsgMTAwKTxicj4NCis8YnI+DQorI2RlZmlu
ZSBQQUxfTElORV9EVVJBVElPTl9OU8KgIMKgIMKgIMKgIMKgIMKgNjQwMDBVPGJyPg0KKyNkZWZp
bmUgUEFMX0xJTkVTX05VTUJFUsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgNjI1PGJyPg0KKzxicj4N
CisjZGVmaW5lIFBBTF9IQUNUX0RVUkFUSU9OX1RZUF9OU8KgIMKgIMKgIMKgNTE5NTBVPGJyPg0K
KyNkZWZpbmUgUEFMX0hBQ1RfRFVSQVRJT05fTUlOX05TwqAgwqAgwqAgwqAoUEFMX0hBQ1RfRFVS
QVRJT05fVFlQX05TIC0gMTAwKTxicj4NCisjZGVmaW5lIFBBTF9IQUNUX0RVUkFUSU9OX01BWF9O
U8KgIMKgIMKgIMKgKFBBTF9IQUNUX0RVUkFUSU9OX1RZUF9OUyArIDQwMCk8YnI+DQorPGJyPg0K
KyNkZWZpbmUgUEFMX0hCTEtfRFVSQVRJT05fVFlQX05TwqAgwqAgwqAgwqAoUEFMX0xJTkVfRFVS
QVRJT05fTlMgLSBQQUxfSEFDVF9EVVJBVElPTl9UWVBfTlMpPGJyPg0KKyNkZWZpbmUgUEFMX0hC
TEtfRFVSQVRJT05fTUlOX05TwqAgwqAgwqAgwqAoUEFMX0xJTkVfRFVSQVRJT05fTlMgLSBQQUxf
SEFDVF9EVVJBVElPTl9NQVhfTlMpPGJyPg0KKyNkZWZpbmUgUEFMX0hCTEtfRFVSQVRJT05fTUFY
X05TwqAgwqAgwqAgwqAoUEFMX0xJTkVfRFVSQVRJT05fTlMgLSBQQUxfSEFDVF9EVVJBVElPTl9N
SU5fTlMpPGJyPg0KKzxicj4NCisjZGVmaW5lIFBBTF9IRlBfRFVSQVRJT05fVFlQX05TwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgMTY1MDxicj4NCisjZGVmaW5lIFBBTF9IRlBfRFVSQVRJT05fTUlO
X05TwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKFBBTF9IRlBfRFVSQVRJT05fVFlQX05TIC0gMTAw
KTxicj4NCisjZGVmaW5lIFBBTF9IRlBfRFVSQVRJT05fTUFYX05TwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgKFBBTF9IRlBfRFVSQVRJT05fVFlQX05TICsgNDAwKTxicj4NCis8YnI+DQorI2RlZmlu
ZSBQQUxfSFNMRU5fRFVSQVRJT05fVFlQX05TwqAgwqAgwqAgNDcwMDxicj4NCisjZGVmaW5lIFBB
TF9IU0xFTl9EVVJBVElPTl9NSU5fTlPCoCDCoCDCoCAoUEFMX0hTTEVOX0RVUkFUSU9OX1RZUF9O
UyAtIDIwMCk8YnI+DQorI2RlZmluZSBQQUxfSFNMRU5fRFVSQVRJT05fTUFYX05TwqAgwqAgwqAg
KFBBTF9IU0xFTl9EVVJBVElPTl9UWVBfTlMgKyAyMDApPGJyPg0KKzxicj4NCisjZGVmaW5lIFBB
TF9IQlBfRFVSQVRJT05fVFlQX05TwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgNTcwMDxicj4NCisj
ZGVmaW5lIFBBTF9IQlBfRFVSQVRJT05fTUlOX05TwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKFBB
TF9IQlBfRFVSQVRJT05fVFlQX05TIC0gMjAwKTxicj4NCisjZGVmaW5lIFBBTF9IQlBfRFVSQVRJ
T05fTUFYX05TwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKFBBTF9IQlBfRFVSQVRJT05fVFlQX05T
ICsgMjAwKTxicj4NCis8YnI+DQorc3RydWN0IGFuYWxvZ19wYXJhbV9maWVsZCB7PGJyPg0KK8Kg
IMKgIMKgIMKgdW5zaWduZWQgaW50IGV2ZW4sIG9kZDs8YnI+DQorfTs8YnI+DQorPGJyPg0KKyNk
ZWZpbmUgUEFSQU1fRklFTEQoX29kZCwgX2V2ZW4pwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJy
Pg0KK8KgIMKgIMKgIMKgeyAuZXZlbiA9IF9ldmVuLCAub2RkID0gX29kZCB9PGJyPg0KKzxicj4N
CitzdHJ1Y3QgYW5hbG9nX3BhcmFtX3JhbmdlIHs8YnI+DQorwqAgwqAgwqAgwqB1bnNpZ25lZCBp
bnTCoCDCoCBtaW4sIHR5cCwgbWF4Ozxicj4NCit9Ozxicj4NCis8YnI+DQorI2RlZmluZSBQQVJB
TV9SQU5HRShfbWluLCBfdHlwLCBfbWF4KcKgIMKgIMKgIMKgIMKgIFw8YnI+DQorwqAgwqAgwqAg
wqB7IC5taW4gPSBfbWluLCAudHlwID0gX3R5cCwgLm1heCA9IF9tYXggfTxicj4NCis8YnI+DQor
c3RydWN0IGFuYWxvZ19wYXJhbWV0ZXJzIHs8YnI+DQorwqAgwqAgwqAgwqB1bnNpZ25lZCBpbnTC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBudW1fbGluZXM7PGJyPg0KK8KgIMKgIMKgIMKg
dW5zaWduZWQgaW50wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbGluZV9kdXJhdGlvbl9u
czs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGFuYWxvZ19wYXJhbV9yYW5nZcKgIMKg
IMKgIMKgaGFjdF9uczs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgYW5hbG9nX3BhcmFtX3Jhbmdl
wqAgwqAgwqAgwqBoZnBfbnM7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGFuYWxvZ19wYXJhbV9y
YW5nZcKgIMKgIMKgIMKgaHNsZW5fbnM7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGFuYWxvZ19w
YXJhbV9yYW5nZcKgIMKgIMKgIMKgaGJwX25zOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBhbmFs
b2dfcGFyYW1fcmFuZ2XCoCDCoCDCoCDCoGhibGtfbnM7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oHVuc2lnbmVkIGludMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJ0NjAxX2hmcDs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGFuYWxvZ19wYXJhbV9maWVsZMKgIMKgIMKgIMKg
dmZwX2xpbmVzOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBhbmFsb2dfcGFyYW1fZmllbGTCoCDC
oCDCoCDCoHZzbGVuX2xpbmVzOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBhbmFsb2dfcGFyYW1f
ZmllbGTCoCDCoCDCoCDCoHZicF9saW5lczs8YnI+DQorfTs8YnI+DQorPGJyPg0KKyNkZWZpbmUg
VFZfTU9ERV9QQVJBTUVURVIoX21vZGUsIF9saW5lcywgX2xpbmVfZHVyLCBfaGFjdCwgX2hmcCwg
X2hzbGVuLCBfaGJwLCBfaGJsaywgX2J0NjAxX2hmcCwgX3ZmcCwgX3ZzbGVuLCBfdmJwKSBcPGJy
Pg0KK8KgIMKgIMKgIMKgW19tb2RlXSA9IHvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubnVtX2xpbmVzID0gX2xpbmVzLMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAubGluZV9kdXJhdGlvbl9ucyA9IF9saW5lX2R1cizCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
LmhhY3RfbnMgPSBfaGFjdCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuaGZwX25z
ID0gX2hmcCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuaHNsZW5fbnMgPSBf
aHNsZW4swqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmhicF9ucyA9IF9oYnAswqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBc
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmhibGtfbnMgPSBfaGJsayzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuYnQ2MDFfaGZwID0gX2J0NjAxX2hmcCzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLnZmcF9saW5lcyA9IF92ZnAswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoC52c2xlbl9saW5lcyA9IF92c2xlbizCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLnZicF9s
aW5lcyA9IF92YnAswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK2NvbnN0IHN0YXRp
YyBzdHJ1Y3QgYW5hbG9nX3BhcmFtZXRlcnMgdHZfbW9kZXNfcGFyYW1ldGVyc1tdID0gezxicj4N
CivCoCDCoCDCoCDCoFRWX01PREVfUEFSQU1FVEVSKERSTV9NT0RFX0FOQUxPR19OVFNDLDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5UU0NfTElORVNfTlVNQkVS
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5UU0NfTElORV9E
VVJBVElPTl9OUyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBQ
QVJBTV9SQU5HRShOVFNDX0hBQ1RfRFVSQVRJT05fTUlOX05TLDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5UU0NfSEFDVF9EVVJB
VElPTl9UWVBfTlMsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgTlRTQ19IQUNUX0RVUkFUSU9OX01BWF9OUyksPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgUEFSQU1fUkFOR0UoTlRTQ19IRlBfRFVS
QVRJT05fTUlOX05TLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoE5UU0NfSEZQX0RVUkFUSU9OX1RZUF9OUyw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBOVFNDX0hG
UF9EVVJBVElPTl9NQVhfTlMpLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoFBBUkFNX1JBTkdFKE5UU0NfSFNMRU5fRFVSQVRJT05fTUlOX05TLDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5UU0Nf
SFNMRU5fRFVSQVRJT05fVFlQX05TLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5UU0NfSFNMRU5fRFVSQVRJT05fTUFYX05TKSw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBQQVJBTV9SQU5HRShO
VFNDX0hCUF9EVVJBVElPTl9NSU5fTlMsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTlRTQ19IQlBfRFVSQVRJT05fVFlQX05TLDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoE5UU0NfSEJQX0RVUkFUSU9OX01BWF9OUyksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgUEFSQU1fUkFOR0UoTlRTQ19IQkxLX0RVUkFUSU9OX01JTl9OUyw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBOVFNDX0hCTEtfRFVSQVRJT05fVFlQX05TLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5UU0NfSEJMS19EVVJBVElPTl9N
QVhfTlMpLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDE2LDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFBBUkFNX0ZJRUxEKDMs
IDMpLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFBBUkFNX0ZJ
RUxEKDMsIDMpLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFBB
UkFNX0ZJRUxEKDE2LCAxNykpLDxicj4NCivCoCDCoCDCoCDCoFRWX01PREVfUEFSQU1FVEVSKERS
TV9NT0RFX0FOQUxPR19QQUwsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgUEFMX0xJTkVTX05VTUJFUiw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBQQUxfTElORV9EVVJBVElPTl9OUyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBQQVJBTV9SQU5HRShQQUxfSEFDVF9EVVJBVElPTl9NSU5fTlMs
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgUEFMX0hBQ1RfRFVSQVRJT05fVFlQX05TLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFBBTF9IQUNUX0RVUkFUSU9OX01B
WF9OUyksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgUEFSQU1f
UkFOR0UoUEFMX0hGUF9EVVJBVElPTl9NSU5fTlMsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgUEFMX0hGUF9EVVJBVElPTl9UWVBf
TlMsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgUEFMX0hGUF9EVVJBVElPTl9NQVhfTlMpLDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoFBBUkFNX1JBTkdFKFBBTF9IU0xFTl9EVVJBVElPTl9NSU5f
TlMsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgUEFMX0hTTEVOX0RVUkFUSU9OX1RZUF9OUyw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBQQUxfSFNMRU5fRFVSQVRJ
T05fTUFYX05TKSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBQ
QVJBTV9SQU5HRShQQUxfSEJQX0RVUkFUSU9OX01JTl9OUyw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBQQUxfSEJQX0RVUkFUSU9O
X1RZUF9OUyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBQQUxfSEJQX0RVUkFUSU9OX01BWF9OUyksPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgUEFSQU1fUkFOR0UoUEFMX0hCTEtfRFVSQVRJT05f
TUlOX05TLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoFBBTF9IQkxLX0RVUkFUSU9OX1RZUF9OUyw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBQQUxfSEJMS19EVVJB
VElPTl9NQVhfTlMpLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oDEyLDxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAv
Kjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIFRoZSBmcm9u
dCBwb3JjaCBpcyBhY3R1YWxseSA2IHNob3J0IHN5bmM8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBwdWxzZXMgZm9yIHRoZSBldmVuIGZpZWxkLCBhbmQgNSBm
b3IgdGhlPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogb2Rk
IGZpZWxkLiBFYWNoIHN5bmMgdGFrZXMgaGFsZiBhIGxpZmUgc288YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiB0aGUgb2RkIGZpZWxkIGZyb250IHBvcmNoIGlz
IHNob3J0ZXIgYnk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
KiBoYWxmIGEgbGluZS48YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgKjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIEluIHBy
b2dyZXNzaXZlLCB3ZSYjMzk7cmUgc3VwcG9zZWQgdG8gdXNlIDY8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBwdWxzZXMsIHNvIHdlJiMzOTtyZSBmaW5lIHRo
ZXJlPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgUEFSQU1fRklFTEQoMywgMiks
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogVGhlIHZzeW5jIGxl
bmd0aCBpcyA1IGxvbmcgc3luYyBwdWxzZXMsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICogZWFjaCBmaWVsZCB0YWtpbmcgaGFsZiBhIGxpbmUuIFdlJiMzOTty
ZTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIHNob3J0ZXIg
Zm9yIGJvdGggZmllbGRzIGJ5IGhhbGYgYSBsaW5lLjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAqPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICogSW4gcHJvZ3Jlc3NpdmUsIHdlJiMzOTtyZSBzdXBwb3NlZCB0byB1c2UgNTxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIHB1bHNlcywgc28g
d2UmIzM5O3JlIG9mZiBieSBoYWxmPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICogYSBsaW5lLjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAqPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICog
SW4gaW50ZXJsYWNlLCB3ZSYjMzk7cmUgbm93IG9mZiBieSBoYWxmIGEgbGluZTxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIGZvciB0aGUgZXZlbiBmaWVsZCBh
bmQgb25lIGxpbmUgZm9yIHRoZSBvZGQ8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgKiBmaWVsZC48YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBQ
QVJBTV9GSUVMRCgzLCAzKSw8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLyo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgKiBUaGUgYmFjayBwb3JjaCBzdGFydHMgd2l0aCBwb3N0LWVxdWFsaXppbmc8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBwdWxzZXMsIGNvbnNpc3Rpbmcg
aW4gNSBzaG9ydCBzeW5jIHB1bHNlczxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAqIGZvciB0aGUgZXZlbiBmaWVsZCwgNCBmb3IgdGhlIG9kZCBmaWVsZC4gSW48
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBwcm9ncmVzc2l2
ZSwgaXQmIzM5O3MgNSBzaG9ydCBzeW5jcy48YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgKjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAqIEluIHByb2dyZXNzaXZlLCB3ZSB0aHVzIGhhdmUgMi41IGxpbmVzLDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIHBsdXMgdGhlIDAuNSBsaW5lIHdl
IHdlcmUgbWlzc2luZzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAqIHByZXZpb3VzbHksIHNvIHdlIHNob3VsZCB1c2UgMyBsaW5lcy48YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAqIEluIGludGVybGFjZSwgdGhlIGV2ZW4gZmllbGQgaXMgaW4g
dGhlPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogZXhhY3Qg
c2FtZSBjYXNlIHRoYW4gcHJvZ3Jlc3NpdmUuIEZvciB0aGU8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBvZGQgZmllbGQsIHdlIHNob3VsZCBiZSB1c2luZyAy
IGxpbmVzIGJ1dDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAq
IHdlJiMzOTtyZSBvbmUgbGluZSBzaG9ydCwgc28gd2UmIzM5O2xsIG1ha2UgdXAgZm9yPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogaXQgaGVyZSBieSB1c2lu
ZyAzLjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogVGhlIGVudGlyZSBibGFu
a2luZyBhcmVhIGlzIHN1cHBvc2VkIHRvPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgICogdGFrZSAyNSBsaW5lcywgc28gd2UgYWxzbyBuZWVkIHRvIGFjY291bnQ8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBmb3IgdGhlIHJl
c3Qgb2YgdGhlIGJsYW5raW5nIGFyZWEgdGhhdDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAqIGNhbiYjMzk7dCBiZSBpbiBlaXRoZXIgdGhlIGZyb250IHBvcmNo
IG9yIHN5bmM8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBw
ZXJpb2QuPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgUEFSQU1fRklFTEQoMTks
IDIwKSksPGJyPg0KK307PGJyPg0KKzxicj4NCitzdGF0aWMgaW50IGZpbGxfYW5hbG9nX21vZGUo
c3RydWN0IGRybV9kZXZpY2UgKmRldiw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb25zdCBzdHJ1Y3QgYW5hbG9nX3Bh
cmFtZXRlcnMgKnBhcmFtcyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB1bnNpZ25lZCBsb25nIHBpeGVsX2Nsb2NrX2h6LDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVuc2lnbmVkIGludCBoYWN0aXZlLDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVuc2lnbmVkIGludCB2YWN0
aXZlLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJvb2wg
aW50ZXJsYWNlKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgdW5zaWduZWQgbG9uZyBwaXhlbF9k
dXJhdGlvbl9ucyA9IE5TRUNfUEVSX1NFQyAvIHBpeGVsX2Nsb2NrX2h6Ozxicj4NCivCoCDCoCDC
oCDCoHVuc2lnbmVkIGludCBodG90YWwsIHZ0b3RhbDs8YnI+DQorwqAgwqAgwqAgwqB1bnNpZ25l
ZCBpbnQgbWF4X2hhY3QsIGhhY3RfZHVyYXRpb25fbnM7PGJyPg0KK8KgIMKgIMKgIMKgdW5zaWdu
ZWQgaW50IGhibGssIGhibGtfZHVyYXRpb25fbnM7PGJyPg0KK8KgIMKgIMKgIMKgdW5zaWduZWQg
aW50IGhmcCwgaGZwX2R1cmF0aW9uX25zOzxicj4NCivCoCDCoCDCoCDCoHVuc2lnbmVkIGludCBo
c2xlbiwgaHNsZW5fZHVyYXRpb25fbnM7PGJyPg0KK8KgIMKgIMKgIMKgdW5zaWduZWQgaW50IGhi
cCwgaGJwX2R1cmF0aW9uX25zOzxicj4NCivCoCDCoCDCoCDCoHVuc2lnbmVkIGludCBwb3JjaGVz
LCBwb3JjaGVzX2R1cmF0aW9uX25zOzxicj4NCivCoCDCoCDCoCDCoHVuc2lnbmVkIGludCB2ZnAs
IHZmcF9taW47PGJyPg0KK8KgIMKgIMKgIMKgdW5zaWduZWQgaW50IHZicCwgdmJwX21pbjs8YnI+
DQorwqAgwqAgwqAgwqB1bnNpZ25lZCBpbnQgdnNsZW47PGJyPg0KK8KgIMKgIMKgIMKgYm9vbCBi
dDYwMSA9IGZhbHNlOzxicj4NCivCoCDCoCDCoCDCoGludCBwb3JjaGVzX3JlbTs8YnI+DQorwqAg
wqAgwqAgwqB1NjQgcmVzdWx0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBkcm1fZGJnX2ttcyhk
ZXYsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7R2VuZXJhdGluZyBh
ICV1eCV1JWMsICV1LWxpbmUgbW9kZSB3aXRoIGEgJWx1IGtIeiBjbG9ja1xuJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGhhY3RpdmUsIHZhY3RpdmUsPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJsYWNlID8gJiMzOTtpJiMzOTsgOiAmIzM5
O3AmIzM5Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwYXJhbXMtJmd0O251
bV9saW5lcyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaXhlbF9jbG9ja19o
eiAvIDEwMDApOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBtYXhfaGFjdCA9IHBhcmFtcy0mZ3Q7
aGFjdF9ucy5tYXggLyBwaXhlbF9kdXJhdGlvbl9uczs8YnI+DQorwqAgwqAgwqAgwqBpZiAocGl4
ZWxfY2xvY2tfaHogPT0gMTM1MDAwMDAgJmFtcDsmYW1wOyBoYWN0aXZlICZndDsgbWF4X2hhY3Qg
JmFtcDsmYW1wOyBoYWN0aXZlICZsdDs9IDcyMCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGRybV9kYmdfa21zKGRldiwgJnF1b3Q7VHJ5aW5nIHRvIGdlbmVyYXRlIGEgQlQuNjAxIG1v
ZGUuIERpc2FibGluZyBjaGVja3MuXG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJ0NjAxID0gdHJ1ZTs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoC8qPGJyPg0KK8KgIMKgIMKgIMKgICogT3VyIHBpeGVsIGR1cmF0aW9uIGlzIGdvaW5nIHRv
IGJlIHJvdW5kIGRvd24gYnkgdGhlIGRpdmlzaW9uLDxicj4NCivCoCDCoCDCoCDCoCAqIHNvIHJv
dW5kaW5nIHVwIGlzIHByb2JhYmx5IGdvaW5nIHRvIGludHJvZHVjZSBldmVuIG1vcmU8YnI+DQor
wqAgwqAgwqAgwqAgKiBkZXZpYXRpb24uPGJyPg0KK8KgIMKgIMKgIMKgICovPGJyPg0KK8KgIMKg
IMKgIMKgcmVzdWx0ID0gKHU2NClwYXJhbXMtJmd0O2xpbmVfZHVyYXRpb25fbnMgKiBwaXhlbF9j
bG9ja19oejs8YnI+DQorwqAgwqAgwqAgwqBkb19kaXYocmVzdWx0LCBOU0VDX1BFUl9TRUMpOzxi
cj4NCivCoCDCoCDCoCDCoGh0b3RhbCA9IHJlc3VsdDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
ZHJtX2RiZ19rbXMoZGV2LCAmcXVvdDtUb3RhbCBIb3Jpem9udGFsIE51bWJlciBvZiBQaXhlbHM6
ICV1XG4mcXVvdDssIGh0b3RhbCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGhhY3RfZHVyYXRp
b25fbnMgPSBoYWN0aXZlICogcGl4ZWxfZHVyYXRpb25fbnM7PGJyPg0KK8KgIMKgIMKgIMKgaWYg
KCFidDYwMSAmYW1wOyZhbXA7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgKGhhY3RfZHVyYXRpb25f
bnMgJmx0OyBwYXJhbXMtJmd0O2hhY3RfbnMubWluIHx8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IGhhY3RfZHVyYXRpb25fbnMgJmd0OyBwYXJhbXMtJmd0O2hhY3RfbnMubWF4KSkgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoERSTV9FUlJPUigmcXVvdDtJbnZhbGlkIGhvcml6b250YWwg
YWN0aXZlIGFyZWEgZHVyYXRpb246ICV1bnMgKG1pbjogJXUsIG1heCAldSlcbiZxdW90Oyw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBoYWN0X2R1cmF0aW9uX25z
LCBwYXJhbXMtJmd0O2hhY3RfbnMubWluLCBwYXJhbXMtJmd0O2hhY3RfbnMubWF4KTs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVJTlZBTDs8YnI+DQorwqAgwqAgwqAgwqB9
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGhibGsgPSBodG90YWwgLSBoYWN0aXZlOzxicj4NCivC
oCDCoCDCoCDCoGRybV9kYmdfa21zKGRldiwgJnF1b3Q7SG9yaXpvbnRhbCBCbGFua2luZyBQZXJp
b2Q6ICV1XG4mcXVvdDssIGhibGspOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBoYmxrX2R1cmF0
aW9uX25zID0gaGJsayAqIHBpeGVsX2R1cmF0aW9uX25zOzxicj4NCivCoCDCoCDCoCDCoGlmICgh
YnQ2MDEgJmFtcDsmYW1wOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoChoYmxrX2R1cmF0aW9uX25z
ICZsdDsgcGFyYW1zLSZndDtoYmxrX25zLm1pbiB8fDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCBo
YmxrX2R1cmF0aW9uX25zICZndDsgcGFyYW1zLSZndDtoYmxrX25zLm1heCkpIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBEUk1fRVJST1IoJnF1b3Q7SW52YWxpZCBob3Jpem9udGFsIGJs
YW5raW5nIGR1cmF0aW9uOiAldW5zIChtaW46ICV1LCBtYXggJXUpXG4mcXVvdDssPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaGJsa19kdXJhdGlvbl9ucywgcGFy
YW1zLSZndDtoYmxrX25zLm1pbiwgcGFyYW1zLSZndDtoYmxrX25zLm1heCk7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FSU5WQUw7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqBoc2xlbiA9IERJVl9ST1VORF9VUChwYXJhbXMtJmd0O2hzbGVu
X25zLnR5cCwgcGl4ZWxfZHVyYXRpb25fbnMpOzxicj4NCivCoCDCoCDCoCDCoGRybV9kYmdfa21z
KGRldiwgJnF1b3Q7SG9yaXpvbnRhbCBTeW5jIFBlcmlvZDogJXVcbiZxdW90OywgaHNsZW4pOzxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBoc2xlbl9kdXJhdGlvbl9ucyA9IGhzbGVuICogcGl4ZWxf
ZHVyYXRpb25fbnM7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKCFidDYwMSAmYW1wOyZhbXA7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgKGhzbGVuX2R1cmF0aW9uX25zICZsdDsgcGFyYW1zLSZndDtoc2xl
bl9ucy5taW4gfHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgaHNsZW5fZHVyYXRpb25fbnMgJmd0
OyBwYXJhbXMtJmd0O2hzbGVuX25zLm1heCkpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBEUk1fRVJST1IoJnF1b3Q7SW52YWxpZCBob3Jpem9udGFsIHN5bmMgZHVyYXRpb246ICV1bnMg
KG1pbjogJXUsIG1heCAldSlcbiZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBoc2xlbl9kdXJhdGlvbl9ucywgcGFyYW1zLSZndDtoc2xlbl9ucy5taW4s
IHBhcmFtcy0mZ3Q7aHNsZW5fbnMubWF4KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZXR1cm4gLUVJTlZBTDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oHBvcmNoZXMgPSBoYmxrIC0gaHNsZW47PGJyPg0KK8KgIMKgIMKgIMKgZHJtX2RiZ19rbXMoZGV2
LCAmcXVvdDtSZW1haW5pbmcgaG9yaXpvbnRhbCBwaXhlbHMgZm9yIGJvdGggcG9yY2hlczogJXVc
biZxdW90OywgcG9yY2hlcyk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHBvcmNoZXNfZHVyYXRp
b25fbnMgPSBwb3JjaGVzICogcGl4ZWxfZHVyYXRpb25fbnM7PGJyPg0KK8KgIMKgIMKgIMKgaWYg
KCFidDYwMSAmYW1wOyZhbXA7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgKHBvcmNoZXNfZHVyYXRp
b25fbnMgJmd0OyAocGFyYW1zLSZndDtoZnBfbnMubWF4ICsgcGFyYW1zLSZndDtoYnBfbnMubWF4
KSB8fDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCBwb3JjaGVzX2R1cmF0aW9uX25zICZsdDsgKHBh
cmFtcy0mZ3Q7aGZwX25zLm1pbiArIHBhcmFtcy0mZ3Q7aGJwX25zLm1pbikpKSB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgRFJNX0VSUk9SKCZxdW90O0ludmFsaWQgaG9yaXpvbnRhbCBw
b3JjaGVzIGR1cmF0aW9uOiAldW5zXG4mcXVvdDssIHBvcmNoZXNfZHVyYXRpb25fbnMpOzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAtRUlOVkFMOzxicj4NCivCoCDCoCDCoCDC
oH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYgKGJ0NjAxKSB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaGZwID0gcGFyYW1zLSZndDtidDYwMV9oZnA7PGJyPg0KK8KgIMKgIMKgIMKg
fSBlbHNlIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bnNpZ25lZCBpbnQgaGZwX21p
biA9IERJVl9ST1VORF9VUChwYXJhbXMtJmd0O2hmcF9ucy5taW4sPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcGl4ZWxfZHVyYXRpb25fbnMpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHVuc2lnbmVkIGludCBoYnBfbWluID0gRElWX1JPVU5EX1VQKHBhcmFtcy0mZ3Q7aGJwX25zLm1p
biw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaXhlbF9kdXJhdGlvbl9ucyk7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGludCBwb3JjaGVzX3JlbSA9IHBvcmNoZXMgLSBoZnBfbWlu
IC0gaGJwX21pbjs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaGZwID0gaGZw
X21pbiArIERJVl9ST1VORF9VUChwb3JjaGVzX3JlbSwgMik7PGJyPg0KK8KgIMKgIMKgIMKgfTxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBkcm1fZGJnX2ttcyhkZXYsICZxdW90O0hvcml6b250YWwg
RnJvbnQgUG9yY2g6ICV1XG4mcXVvdDssIGhmcCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGhm
cF9kdXJhdGlvbl9ucyA9IGhmcCAqIHBpeGVsX2R1cmF0aW9uX25zOzxicj4NCivCoCDCoCDCoCDC
oGlmICghYnQ2MDEgJmFtcDsmYW1wOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoChoZnBfZHVyYXRp
b25fbnMgJmx0OyBwYXJhbXMtJmd0O2hmcF9ucy5taW4gfHw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgaGZwX2R1cmF0aW9uX25zICZndDsgcGFyYW1zLSZndDtoZnBfbnMubWF4KSkgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoERSTV9FUlJPUigmcXVvdDtJbnZhbGlkIGhvcml6b250YWwg
ZnJvbnQgcG9yY2ggZHVyYXRpb246ICV1bnMgKG1pbjogJXUsIG1heCAldSlcbiZxdW90Oyw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBoZnBfZHVyYXRpb25fbnMs
IHBhcmFtcy0mZ3Q7aGZwX25zLm1pbiwgcGFyYW1zLSZndDtoZnBfbnMubWF4KTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVJTlZBTDs8YnI+DQorwqAgwqAgwqAgwqB9PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoGhicCA9IHBvcmNoZXMgLSBoZnA7PGJyPg0KK8KgIMKgIMKg
IMKgZHJtX2RiZ19rbXMoZGV2LCAmcXVvdDtIb3Jpem9udGFsIEJhY2sgUG9yY2g6ICV1XG4mcXVv
dDssIGhicCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGhicF9kdXJhdGlvbl9ucyA9IGhicCAq
IHBpeGVsX2R1cmF0aW9uX25zOzxicj4NCivCoCDCoCDCoCDCoGlmICghYnQ2MDEgJmFtcDsmYW1w
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoChoYnBfZHVyYXRpb25fbnMgJmx0OyBwYXJhbXMtJmd0
O2hicF9ucy5taW4gfHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgaGJwX2R1cmF0aW9uX25zICZn
dDsgcGFyYW1zLSZndDtoYnBfbnMubWF4KSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oERSTV9FUlJPUigmcXVvdDtJbnZhbGlkIGhvcml6b250YWwgYmFjayBwb3JjaCBkdXJhdGlvbjog
JXVucyAobWluOiAldSwgbWF4ICV1KVxuJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGhicF9kdXJhdGlvbl9ucywgcGFyYW1zLSZndDtoYnBfbnMubWlu
LCBwYXJhbXMtJmd0O2hicF9ucy5tYXgpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
dHVybiAtRUlOVkFMOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
aWYgKGh0b3RhbCAhPSAoaGFjdGl2ZSArIGhmcCArIGhzbGVuICsgaGJwKSk8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVJTlZBTDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
bW9kZS0mZ3Q7Y2xvY2sgPSBwaXhlbF9jbG9ja19oeiAvIDEwMDA7PGJyPg0KK8KgIMKgIMKgIMKg
bW9kZS0mZ3Q7aGRpc3BsYXkgPSBoYWN0aXZlOzxicj4NCivCoCDCoCDCoCDCoG1vZGUtJmd0O2hz
eW5jX3N0YXJ0ID0gbW9kZS0mZ3Q7aGRpc3BsYXkgKyBoZnA7PGJyPg0KK8KgIMKgIMKgIMKgbW9k
ZS0mZ3Q7aHN5bmNfZW5kID0gbW9kZS0mZ3Q7aHN5bmNfc3RhcnQgKyBoc2xlbjs8YnI+DQorwqAg
wqAgwqAgwqBtb2RlLSZndDtodG90YWwgPSBtb2RlLSZndDtoc3luY19lbmQgKyBoYnA7PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoGlmIChpbnRlcmxhY2UpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB2ZnBfbWluID0gcGFyYW1zLSZndDt2ZnBfbGluZXMuZXZlbiArIHBhcmFtcy0mZ3Q7
dmZwX2xpbmVzLm9kZDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2YnBfbWluID0gcGFy
YW1zLSZndDt2YnBfbGluZXMuZXZlbiArIHBhcmFtcy0mZ3Q7dmJwX2xpbmVzLm9kZDs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2c2xlbiA9IHBhcmFtcy0mZ3Q7dnNsZW5fbGluZXMuZXZl
biArIHBhcmFtcy0mZ3Q7dnNsZW5fbGluZXMub2RkOzxicj4NCivCoCDCoCDCoCDCoH0gZWxzZSB7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgKiBCeSBjb252ZW50aW9uLCBOVFNDIChha2EgNTI1LzYwKSBzeXN0ZW1zIHN0YXJ0IHdp
dGg8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiB0aGUgZXZlbiBmaWVsZCwgYnV0IFBB
TCAoYWthIDYyNS81MCkgc3lzdGVtcyBzdGFydDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAqIHdpdGggdGhlIG9kZCBvbmUuPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICo8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBQQUwgc3lzdGVtcyBhbHNvIGhhdmUgYXN5bWV0
cmljIHRpbWluZ3MgYmV0d2VlbiB0aGU8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBl
dmVuIGFuZCBvZGQgZmllbGQsIHdoaWxlIE5UU0MgaXMgc3ltZXRyaWMuPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBNb3Jlb3Zl
ciwgaWYgd2Ugd2FudCB0byBjcmVhdGUgYSBwcm9ncmVzc2l2ZSBtb2RlIGZvcjxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAqIFBBTCwgd2UgbmVlZCB0byB1c2UgdGhlIG9kZCBmaWVsZCB0
aW1pbmdzLjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgICogU2luY2Ugb2RkID09IGV2ZW4gZm9yIE5UU0MsIHdlIGNhbiBqdXN0IHVz
ZSB0aGUgb2RkPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogb25lIGFsbCB0aGUgdGlt
ZSB0byBzaW1wbGlmeSB0aGUgY29kZSBhIGJpdC48YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2ZnBfbWluID0gcGFyYW1zLSZndDt2
ZnBfbGluZXMub2RkOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZicF9taW4gPSBwYXJh
bXMtJmd0O3ZicF9saW5lcy5vZGQ7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdnNsZW4g
PSBwYXJhbXMtJmd0O3ZzbGVuX2xpbmVzLm9kZDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoGRybV9kYmdfa21zKGRldiwgJnF1b3Q7VmVydGljYWwgU3luYyBQZXJp
b2Q6ICV1XG4mcXVvdDssIHZzbGVuKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcG9yY2hlcyA9
IHBhcmFtcy0mZ3Q7bnVtX2xpbmVzIC0gdmFjdGl2ZSAtIHZzbGVuOzxicj4NCivCoCDCoCDCoCDC
oGRybV9kYmdfa21zKGRldiwgJnF1b3Q7UmVtYWluaW5nIHZlcnRpY2FsIHBpeGVscyBmb3IgYm90
aCBwb3JjaGVzOiAldVxuJnF1b3Q7LCBwb3JjaGVzKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
cG9yY2hlc19yZW0gPSBwb3JjaGVzIC0gdmZwX21pbiAtIHZicF9taW47PGJyPg0KK8KgIMKgIMKg
IMKgdmZwID0gdmZwX21pbiArIChwb3JjaGVzX3JlbSAvIDIpOzxicj4NCivCoCDCoCDCoCDCoGRy
bV9kYmdfa21zKGRldiwgJnF1b3Q7VmVydGljYWwgRnJvbnQgUG9yY2g6ICV1XG4mcXVvdDssIHZm
cCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHZicCA9IHBvcmNoZXMgLSB2ZnA7PGJyPg0KK8Kg
IMKgIMKgIMKgZHJtX2RiZ19rbXMoZGV2LCAmcXVvdDtWZXJ0aWNhbCBCYWNrIFBvcmNoOiAldVxu
JnF1b3Q7LCB2YnApOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB2dG90YWwgPSB2YWN0aXZlICsg
dmZwICsgdnNsZW4gKyB2YnA7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHBhcmFtcy0mZ3Q7bnVtX2xp
bmVzICE9IHZ0b3RhbCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoERSTV9FUlJPUigm
cXVvdDtJbnZhbGlkIHZlcnRpY2FsIHRvdGFsOiAldXB4IChleHBlY3RlZCAldXB4KVxuJnF1b3Q7
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZ0b3RhbCwgcGFy
YW1zLSZndDtudW1fbGluZXMpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAt
RUlOVkFMOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgbW9kZS0m
Z3Q7dmRpc3BsYXkgPSB2YWN0aXZlOzxicj4NCivCoCDCoCDCoCDCoG1vZGUtJmd0O3ZzeW5jX3N0
YXJ0ID0gbW9kZS0mZ3Q7dmRpc3BsYXkgKyB2ZnA7PGJyPg0KK8KgIMKgIMKgIMKgbW9kZS0mZ3Q7
dnN5bmNfZW5kID0gbW9kZS0mZ3Q7dnN5bmNfc3RhcnQgKyB2c2xlbjs8YnI+DQorwqAgwqAgwqAg
wqBtb2RlLSZndDt2dG90YWwgPSBtb2RlLSZndDt2c3luY19lbmQgKyB2YnA7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoGlmIChtb2RlLSZndDt2dG90YWwgIT0gcGFyYW1zLSZndDtudW1fbGluZXMp
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FSU5WQUw7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoG1vZGUtJmd0O3R5cGUgPSBEUk1fTU9ERV9UWVBFX0RSSVZFUjs8YnI+DQor
wqAgwqAgwqAgwqBtb2RlLSZndDtmbGFncyA9IERSTV9NT0RFX0ZMQUdfTlZTWU5DIHwgRFJNX01P
REVfRkxBR19OSFNZTkM7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKGludGVybGFjZSk8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBtb2RlLSZndDtmbGFncyB8PSBEUk1fTU9ERV9GTEFHX0lOVEVS
TEFDRTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZHJtX21vZGVfc2V0X25hbWUobW9kZSk7PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoGRybV9kYmdfa21zKGRldiwgJnF1b3Q7R2VuZXJhdGVkIG1v
ZGUgJnF1b3Q7IERSTV9NT0RFX0ZNVCAmcXVvdDtcbiZxdW90OywgRFJNX01PREVfQVJHKG1vZGUp
KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KK308YnI+DQorPGJyPg0K
Ky8qKjxicj4NCisgKiBkcm1fYW5hbG9nX3R2X21vZGUgLSBjcmVhdGUgYSBkaXNwbGF5IG1vZGUg
Zm9yIGFuIGFuYWxvZyBUVjxicj4NCisgKiBAZGV2OiBkcm0gZGV2aWNlPGJyPg0KKyAqIEB0dl9t
b2RlOiBUViBNb2RlIHN0YW5kYXJkIHRvIGNyZWF0ZSBhIG1vZGUgZm9yLiBTZWUgRFJNX01PREVf
VFZfTU9ERV8qLjxicj4NCisgKiBAcGl4ZWxfY2xvY2tfaHo6IFBpeGVsIENsb2NrIEZyZXF1ZW5j
eSwgaW4gSGVydHo8YnI+DQorICogQGhkaXNwbGF5OiBoZGlzcGxheSBzaXplPGJyPg0KKyAqIEB2
ZGlzcGxheTogdmRpc3BsYXkgc2l6ZTxicj4NCisgKiBAaW50ZXJsYWNlOiB3aGV0aGVyIHRvIGNv
bXB1dGUgYW4gaW50ZXJsYWNlZCBtb2RlPGJyPg0KKyAqPGJyPg0KKyAqIFRoaXMgZnVuY3Rpb24g
Y3JlYXRlcyBhIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGluc3RhbmNlIHN1aXRlZCBmb3I8YnI+
DQorICogYW4gYW5hbG9nIFRWIG91dHB1dCwgZm9yIG9uZSBvZiB0aGUgdXN1YWwgYW5hbG9nIFRW
IG1vZGUuPGJyPg0KKyAqPGJyPg0KKyAqIE5vdGUgdGhhdCBAaGRpc3BsYXkgaXMgbGFyZ2VyIHRo
YW4gdGhlIHVzdWFsIGNvbnN0cmFpbnRzIGZvciB0aGUgUEFMPGJyPg0KKyAqIGFuZCBOVFNDIHRp
bWluZ3MsIGFuZCB3ZSYjMzk7bGwgY2hvb3NlIHRvIGlnbm9yZSBtb3N0IHRpbWluZ3MgY29uc3Ry
YWludHM8YnI+DQorICogdG8gcmVhY2ggdGhvc2UgcmVzb2x1dGlvbnMuPGJyPg0KKyAqPGJyPg0K
KyAqIFJldHVybnM6PGJyPg0KKyAqPGJyPg0KKyAqIEEgcG9pbnRlciB0byB0aGUgbW9kZSwgYWxs
b2NhdGVkIHdpdGggZHJtX21vZGVfY3JlYXRlKCkuIFJldHVybnMgTlVMTDxicj4NCisgKiBvbiBl
cnJvci48YnI+DQorICovPGJyPg0KK3N0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpkcm1fYW5hbG9n
X3R2X21vZGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbnVtIGRybV9j
b25uZWN0b3JfdHZfbW9kZSB0dl9tb2RlLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVuc2lnbmVkIGxvbmcgcGl4
ZWxfY2xvY2tfaHosPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5zaWduZWQgaW50IGhkaXNwbGF5LDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHVuc2lnbmVkIGludCB2ZGlzcGxheSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBib29sIGludGVybGFj
ZSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2Rl
Ozxicj4NCivCoCDCoCDCoCDCoGVudW0gZHJtX21vZGVfYW5hbG9nIGFuYWxvZzs8YnI+DQorwqAg
wqAgwqAgwqBpbnQgcmV0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzd2l0Y2ggKHR2X21vZGUp
IHs8YnI+DQorwqAgwqAgwqAgwqBjYXNlIERSTV9NT0RFX1RWX01PREVfTlRTQzo8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBmYWxsdGhyb3VnaDs8YnI+DQorwqAgwqAgwqAgwqBjYXNlIERS
TV9NT0RFX1RWX01PREVfTlRTQ180NDM6PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZmFs
bHRocm91Z2g7PGJyPg0KK8KgIMKgIMKgIMKgY2FzZSBEUk1fTU9ERV9UVl9NT0RFX05UU0NfSjo8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmYWxsdGhyb3VnaDs8YnI+DQorwqAgwqAgwqAg
wqBjYXNlIERSTV9NT0RFX1RWX01PREVfUEFMX006PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYW5hbG9nID0gRFJNX01PREVfQU5BTE9HX05UU0M7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgYnJlYWs7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGNhc2UgRFJNX01PREVfVFZfTU9E
RV9QQUw6PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZmFsbHRocm91Z2g7PGJyPg0KK8Kg
IMKgIMKgIMKgY2FzZSBEUk1fTU9ERV9UVl9NT0RFX1BBTF9OOjxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGZhbGx0aHJvdWdoOzxicj4NCivCoCDCoCDCoCDCoGNhc2UgRFJNX01PREVfVFZf
TU9ERV9TRUNBTTo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhbmFsb2cgPSBEUk1fTU9E
RV9BTkFMT0dfUEFMOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqBkZWZhdWx0Ojxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
dHVybiBOVUxMOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgbW9k
ZSA9IGRybV9tb2RlX2NyZWF0ZShkZXYpOzxicj4NCivCoCDCoCDCoCDCoGlmICghbW9kZSk8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gTlVMTDs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgcmV0ID0gZmlsbF9hbmFsb2dfbW9kZShkZXYsIG1vZGUsPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZhbXA7dHZfbW9kZXNfcGFyYW1ldGVy
c1thbmFsb2ddLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBwaXhlbF9jbG9ja19oeiwgaGRpc3BsYXksIHZkaXNwbGF5LCBpbnRlcmxhY2UpOzxicj4N
CivCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBl
cnJfZnJlZV9tb2RlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gbW9kZTs8YnI+DQor
PGJyPg0KK2Vycl9mcmVlX21vZGU6PGJyPg0KK8KgIMKgIMKgIMKgZHJtX21vZGVfZGVzdHJveShk
ZXYsIG1vZGUpOzxicj4NCivCoCDCoCDCoCDCoHJldHVybiBOVUxMOzxicj4NCit9PGJyPg0KK0VY
UE9SVF9TWU1CT0woZHJtX2FuYWxvZ190dl9tb2RlKTs8YnI+DQorPGJyPg0KwqAvKio8YnI+DQrC
oCAqIGRybV9jdnRfbW9kZSAtY3JlYXRlIGEgbW9kZWxpbmUgYmFzZWQgb24gdGhlIENWVCBhbGdv
cml0aG08YnI+DQrCoCAqIEBkZXY6IGRybSBkZXZpY2U8YnI+DQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3Rlc3RzL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL01ha2VmaWxl
PGJyPg0KaW5kZXggYjI5ZWYxMDg1Y2FkLi5iMjJhYzk2ZmRkNjUgMTAwNjQ0PGJyPg0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3Rlc3RzL01ha2VmaWxlPGJyPg0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L3Rlc3RzL01ha2VmaWxlPGJyPg0KQEAgLTEwLDUgKzEwLDYgQEAgb2JqLSQoQ09ORklHX0RSTV9L
VU5JVF9URVNUKSArPSBcPGJyPg0KwqAgwqAgwqAgwqAgZHJtX2ZyYW1lYnVmZmVyX3Rlc3QubyBc
PGJyPg0KwqAgwqAgwqAgwqAgZHJtX2t1bml0X2hlbHBlcnMubyBcPGJyPg0KwqAgwqAgwqAgwqAg
ZHJtX21tX3Rlc3QubyBcPGJyPg0KK8KgIMKgIMKgIMKgZHJtX21vZGVzX3Rlc3QubyBcPGJyPg0K
wqAgwqAgwqAgwqAgZHJtX3BsYW5lX2hlbHBlcl90ZXN0Lm8gXDxicj4NCsKgIMKgIMKgIMKgIGRy
bV9yZWN0X3Rlc3Qubzxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJt
X21vZGVzX3Rlc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fbW9kZXNfdGVzdC5jPGJy
Pg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQppbmRleCAwMDAwMDAwMDAwMDAuLjU1MGUzYjk1
NDUzZTxicj4NCi0tLSAvZGV2L251bGw8YnI+DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVzdHMv
ZHJtX21vZGVzX3Rlc3QuYzxicj4NCkBAIC0wLDAgKzEsMTQ0IEBAPGJyPg0KKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wPGJyPg0KKy8qPGJyPg0KKyAqIEt1bml0IHRlc3QgZm9y
IGRybV9tb2RlcyBmdW5jdGlvbnM8YnI+DQorICovPGJyPg0KKzxicj4NCisjaW5jbHVkZSAmbHQ7
ZHJtL2RybV9tb2Rlcy5oJmd0Ozxicj4NCis8YnI+DQorI2luY2x1ZGUgJmx0O2t1bml0L3Rlc3Qu
aCZndDs8YnI+DQorPGJyPg0KKyNpbmNsdWRlICZsdDtsaW51eC91bml0cy5oJmd0Ozxicj4NCis8
YnI+DQorI2luY2x1ZGUgJnF1b3Q7ZHJtX2t1bml0X2hlbHBlcnMuaCZxdW90Ozxicj4NCis8YnI+
DQorc3RydWN0IGRybV9tb2Rlc190ZXN0X3ByaXYgezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBk
cm1fZGV2aWNlICpkcm07PGJyPg0KK307PGJyPg0KKzxicj4NCitzdGF0aWMgaW50IGRybV9tb2Rl
c190ZXN0X2luaXQoc3RydWN0IGt1bml0ICp0ZXN0KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKg
c3RydWN0IGRybV9tb2Rlc190ZXN0X3ByaXYgKnByaXY7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oHByaXYgPSBrdW5pdF9remFsbG9jKHRlc3QsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwpOzxi
cj4NCivCoCDCoCDCoCDCoEtVTklUX0FTU0VSVF9OT1RfTlVMTCh0ZXN0LCBwcml2KTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgcHJpdi0mZ3Q7ZHJtID0gZHJtX2t1bml0X2RldmljZV9pbml0KHRl
c3QsICZxdW90O2RybS1tb2Rlcy10ZXN0JnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqBLVU5JVF9B
U1NFUlRfTk9UX0VSUl9PUl9OVUxMKHRlc3QsIHByaXYtJmd0O2RybSk7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoHRlc3QtJmd0O3ByaXYgPSBwcml2Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBy
ZXR1cm4gMDs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQgZHJtX21vZGVzX2FuYWxv
Z190dl9udHNjXzQ4MGkoc3RydWN0IGt1bml0ICp0ZXN0KTxicj4NCit7PGJyPg0KK8KgIMKgIMKg
IMKgc3RydWN0IGRybV9tb2Rlc190ZXN0X3ByaXYgKnByaXYgPSB0ZXN0LSZndDtwcml2Ozxicj4N
CivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOzxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqBtb2RlID0gZHJtX2FuYWxvZ190dl9tb2RlKHByaXYtJmd0O2RybSw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBEUk1fTU9E
RV9UVl9NT0RFX05UU0MsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgMTM1MDAgKiBIWl9QRVJfS0haLCA3MjAsIDQ4MCw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cnVlKTs8YnI+DQor
wqAgwqAgwqAgwqBLVU5JVF9BU1NFUlRfTk9UX05VTEwodGVzdCwgbW9kZSk7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoEtVTklUX0VYUEVDVF9FUSh0ZXN0LCBkcm1fbW9kZV92cmVmcmVzaChtb2Rl
KSwgNjApOzxicj4NCivCoCDCoCDCoCDCoEtVTklUX0VYUEVDVF9FUSh0ZXN0LCBtb2RlLSZndDto
ZGlzcGxheSwgNzIwKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgLyogQlQuNjAxIGRlZmluZXMg
aHN5bmNfc3RhcnQgYXQgNzM2IGZvciA0ODBpICovPGJyPg0KK8KgIMKgIMKgIMKgS1VOSVRfRVhQ
RUNUX0VRKHRlc3QsIG1vZGUtJmd0O2hzeW5jX3N0YXJ0LCA3MzYpOzxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqAvKjxicj4NCivCoCDCoCDCoCDCoCAqIFRoZSBOVFNDIHN0YW5kYXJkIGV4cGVjdHMg
YSBsaW5lIHRvIHRha2UgNjMuNTU2dXMuIFdpdGggYTxicj4NCivCoCDCoCDCoCDCoCAqIHBpeGVs
IGNsb2NrIG9mIDEzLjUgTUh6LCBhIHBpeGVsIHRha2VzIGFyb3VuZCA3NG5zLCBzbyB3ZTxicj4N
CivCoCDCoCDCoCDCoCAqIG5lZWQgdG8gaGF2ZSA2MzU1Nm5zIC8gNzRucyA9IDg1OC48YnI+DQor
wqAgwqAgwqAgwqAgKjxicj4NCivCoCDCoCDCoCDCoCAqIFRoaXMgaXMgYWxzbyBtYW5kYXRlZCBi
eSBCVC42MDEuPGJyPg0KK8KgIMKgIMKgIMKgICovPGJyPg0KK8KgIMKgIMKgIMKgS1VOSVRfRVhQ
RUNUX0VRKHRlc3QsIG1vZGUtJmd0O2h0b3RhbCwgODU4KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgS1VOSVRfRVhQRUNUX0VRKHRlc3QsIG1vZGUtJmd0O3ZkaXNwbGF5LCA0ODApOzxicj4NCivC
oCDCoCDCoCDCoEtVTklUX0VYUEVDVF9FUSh0ZXN0LCBtb2RlLSZndDt2dG90YWwsIDUyNSk7PGJy
Pg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkIGRybV9tb2Rlc19hbmFsb2dfdHZfbnRzY180
ODBpX2lubGluZWQoc3RydWN0IGt1bml0ICp0ZXN0KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKg
c3RydWN0IGRybV9tb2Rlc190ZXN0X3ByaXYgKnByaXYgPSB0ZXN0LSZndDtwcml2Ozxicj4NCivC
oCDCoCDCoCDCoHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpleHBlY3RlZCwgKm1vZGU7PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoGV4cGVjdGVkID0gZHJtX2FuYWxvZ190dl9tb2RlKHByaXYtJmd0
O2RybSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBEUk1fTU9ERV9UVl9NT0RFX05UU0MsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMTM1MDAgKiBIWl9QRVJfS0ha
LCA3MjAsIDQ4MCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB0cnVlKTs8YnI+DQorwqAgwqAgwqAgwqBLVU5JVF9BU1NFUlRfTk9U
X05VTEwodGVzdCwgZXhwZWN0ZWQpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBtb2RlID0gZHJt
X21vZGVfYW5hbG9nX250c2NfNDgwaShwcml2LSZndDtkcm0pOzxicj4NCivCoCDCoCDCoCDCoEtV
TklUX0FTU0VSVF9OT1RfTlVMTCh0ZXN0LCBtb2RlKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
S1VOSVRfRVhQRUNUX1RSVUUodGVzdCwgZHJtX21vZGVfZXF1YWwoZXhwZWN0ZWQsIG1vZGUpKTs8
YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQgZHJtX21vZGVzX2FuYWxvZ190dl9wYWxf
NTc2aShzdHJ1Y3Qga3VuaXQgKnRlc3QpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qg
ZHJtX21vZGVzX3Rlc3RfcHJpdiAqcHJpdiA9IHRlc3QtJmd0O3ByaXY7PGJyPg0KK8KgIMKgIMKg
IMKgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGU7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oG1vZGUgPSBkcm1fYW5hbG9nX3R2X21vZGUocHJpdi0mZ3Q7ZHJtLDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoERSTV9NT0RFX1RWX01PREVf
UEFMLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoDEzNTAwICogSFpfUEVSX0tIWiwgNzIwLCA1NzYsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJ1ZSk7PGJyPg0KK8KgIMKgIMKgIMKg
S1VOSVRfQVNTRVJUX05PVF9OVUxMKHRlc3QsIG1vZGUpOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBLVU5JVF9FWFBFQ1RfRVEodGVzdCwgZHJtX21vZGVfdnJlZnJlc2gobW9kZSksIDUwKTs8YnI+
DQorwqAgwqAgwqAgwqBLVU5JVF9FWFBFQ1RfRVEodGVzdCwgbW9kZS0mZ3Q7aGRpc3BsYXksIDcy
MCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoC8qIEJULjYwMSBkZWZpbmVzIGhzeW5jX3N0YXJ0
IGF0IDczMiBmb3IgNTc2aSAqLzxicj4NCivCoCDCoCDCoCDCoEtVTklUX0VYUEVDVF9FUSh0ZXN0
LCBtb2RlLSZndDtoc3luY19zdGFydCwgNzMyKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgLyo8
YnI+DQorwqAgwqAgwqAgwqAgKiBUaGUgUEFMIHN0YW5kYXJkIGV4cGVjdHMgYSBsaW5lIHRvIHRh
a2UgNjR1cy4gV2l0aCBhIHBpeGVsPGJyPg0KK8KgIMKgIMKgIMKgICogY2xvY2sgb2YgMTMuNSBN
SHosIGEgcGl4ZWwgdGFrZXMgYXJvdW5kIDc0bnMsIHNvIHdlIG5lZWQgdG88YnI+DQorwqAgwqAg
wqAgwqAgKiBoYXZlIDY0MDAwbnMgLyA3NG5zID0gODY0Ljxicj4NCivCoCDCoCDCoCDCoCAqPGJy
Pg0KK8KgIMKgIMKgIMKgICogVGhpcyBpcyBhbHNvIG1hbmRhdGVkIGJ5IEJULjYwMS48YnI+DQor
wqAgwqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqBLVU5JVF9FWFBFQ1RfRVEodGVzdCwgbW9k
ZS0mZ3Q7aHRvdGFsLCA4NjQpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBLVU5JVF9FWFBFQ1Rf
RVEodGVzdCwgbW9kZS0mZ3Q7dmRpc3BsYXksIDU3Nik7PGJyPg0KK8KgIMKgIMKgIMKgS1VOSVRf
RVhQRUNUX0VRKHRlc3QsIG1vZGUtJmd0O3Z0b3RhbCwgNjI1KTs8YnI+DQorfTxicj4NCis8YnI+
DQorc3RhdGljIHZvaWQgZHJtX21vZGVzX2FuYWxvZ190dl9wYWxfNTc2aV9pbmxpbmVkKHN0cnVj
dCBrdW5pdCAqdGVzdCk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBkcm1fbW9kZXNf
dGVzdF9wcml2ICpwcml2ID0gdGVzdC0mZ3Q7cHJpdjs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qg
ZHJtX2Rpc3BsYXlfbW9kZSAqZXhwZWN0ZWQsICptb2RlOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBleHBlY3RlZCA9IGRybV9hbmFsb2dfdHZfbW9kZShwcml2LSZndDtkcm0sPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgRFJNX01P
REVfVFZfTU9ERV9QQUwsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgMTM1MDAgKiBIWl9QRVJfS0haLCA3MjAsIDU3Niw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0
cnVlKTs8YnI+DQorwqAgwqAgwqAgwqBLVU5JVF9BU1NFUlRfTk9UX05VTEwodGVzdCwgZXhwZWN0
ZWQpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBtb2RlID0gZHJtX21vZGVfYW5hbG9nX3BhbF81
NzZpKHByaXYtJmd0O2RybSk7PGJyPg0KK8KgIMKgIMKgIMKgS1VOSVRfQVNTRVJUX05PVF9OVUxM
KHRlc3QsIG1vZGUpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBLVU5JVF9FWFBFQ1RfVFJVRSh0
ZXN0LCBkcm1fbW9kZV9lcXVhbChleHBlY3RlZCwgbW9kZSkpOzxicj4NCit9PGJyPg0KKzxicj4N
CitzdGF0aWMgc3RydWN0IGt1bml0X2Nhc2UgZHJtX21vZGVzX2FuYWxvZ190dl90ZXN0c1tdID0g
ezxicj4NCivCoCDCoCDCoCDCoEtVTklUX0NBU0UoZHJtX21vZGVzX2FuYWxvZ190dl9udHNjXzQ4
MGkpLDxicj4NCivCoCDCoCDCoCDCoEtVTklUX0NBU0UoZHJtX21vZGVzX2FuYWxvZ190dl9udHNj
XzQ4MGlfaW5saW5lZCksPGJyPg0KK8KgIMKgIMKgIMKgS1VOSVRfQ0FTRShkcm1fbW9kZXNfYW5h
bG9nX3R2X3BhbF81NzZpKSw8YnI+DQorwqAgwqAgwqAgwqBLVU5JVF9DQVNFKGRybV9tb2Rlc19h
bmFsb2dfdHZfcGFsXzU3NmlfaW5saW5lZCksPGJyPg0KK8KgIMKgIMKgIMKgeyB9PGJyPg0KK307
PGJyPg0KKzxicj4NCitzdGF0aWMgc3RydWN0IGt1bml0X3N1aXRlIGRybV9tb2Rlc19hbmFsb2df
dHZfdGVzdF9zdWl0ZSA9IHs8YnI+DQorwqAgwqAgwqAgwqAubmFtZSA9ICZxdW90O2RybV9tb2Rl
c19hbmFsb2dfdHYmcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgLmluaXQgPSBkcm1fbW9kZXNfdGVz
dF9pbml0LDxicj4NCivCoCDCoCDCoCDCoC50ZXN0X2Nhc2VzID0gZHJtX21vZGVzX2FuYWxvZ190
dl90ZXN0cyw8YnI+DQorfTs8YnI+DQorPGJyPg0KK2t1bml0X3Rlc3Rfc3VpdGVzKDxicj4NCivC
oCDCoCDCoCDCoCZhbXA7ZHJtX21vZGVzX2FuYWxvZ190dl90ZXN0X3N1aXRlPGJyPg0KKyk7PGJy
Pg0KK01PRFVMRV9MSUNFTlNFKCZxdW90O0dQTCB2MiZxdW90Oyk7PGJyPg0KZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmg8YnI+DQpp
bmRleCBiMGM2ODBlNmY2NzAuLmM2MTNmMGFiZTlkYyAxMDA2NDQ8YnI+DQotLS0gYS9pbmNsdWRl
L2RybS9kcm1fbW9kZXMuaDxicj4NCisrKyBiL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oPGJyPg0K
QEAgLTQ2OCw2ICs0NjgsMjMgQEAgYm9vbCBkcm1fbW9kZV9pc180MjBfYWxzbyhjb25zdCBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfaW5mbyAqZGlzcGxheSw8YnI+DQrCoGJvb2wgZHJtX21vZGVfaXNfNDIw
KGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICpkaXNwbGF5LDxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUp
Ozxicj4NCjxicj4NCitzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqZHJtX2FuYWxvZ190dl9tb2Rl
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZW51bSBkcm1fY29ubmVjdG9y
X3R2X21vZGUgbW9kZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bnNpZ25lZCBsb25nIHBpeGVsX2Nsb2NrX2h6
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHVuc2lnbmVkIGludCBoZGlzcGxheSw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bnNp
Z25lZCBpbnQgdmRpc3BsYXksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYm9vbCBpbnRlcmxhY2UpOzxicj4NCis8
YnI+DQorc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqZHJtX21vZGVfYW5h
bG9nX250c2NfNDgwaShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTxicj4NCit7PGJyPg0KK8KgIMKg
IMKgIMKgcmV0dXJuIGRybV9hbmFsb2dfdHZfbW9kZShkZXYsIERSTV9NT0RFX1RWX01PREVfTlRT
QywgMTM1MDAwMDAsIDcyMCwgNDgwLCB0cnVlKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGlj
IGlubGluZSBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqZHJtX21vZGVfYW5hbG9nX3BhbF81NzZp
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4g
ZHJtX2FuYWxvZ190dl9tb2RlKGRldiwgRFJNX01PREVfVFZfTU9ERV9QQUwsIDEzNTAwMDAwLCA3
MjAsIDU3NiwgdHJ1ZSk7PGJyPg0KK308YnI+DQorPGJyPg0KwqBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSAqZHJtX2N2dF9tb2RlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsPGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50IGhkaXNw
bGF5LCBpbnQgdmRpc3BsYXksIGludCB2cmVmcmVzaCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBib29sIHJlZHVjZWQsIGJvb2wg
aW50ZXJsYWNlZCw8YnI+DQo8YnI+DQotLSA8YnI+DQpiNCAwLjExLjAtZGV2LTk5ZTNhPGJyPg0K
PC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--000000000000b0243905ecf58340--
