Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE1B5A73DA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 04:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0910910E15B;
	Wed, 31 Aug 2022 02:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758A010E15B;
 Wed, 31 Aug 2022 02:23:26 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g7so1072507lfe.11;
 Tue, 30 Aug 2022 19:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc;
 bh=D594wEp0LEmyYOAx7Tirjq3SGwda2pe5svLBID/NRVI=;
 b=eyXn8XNL5R+c7skqJd2CXAmkkmv+PO53H99rqyOH87xBrXhsqaRc9Cafy09+sKEMJA
 iijHh/Vgr/N8ms8DrRs7ZsyH/kfkPXSLcSAHRoh1+w4hJSgtLHkhgFqawSk+ZXu7vLVu
 etWsQ2c8F5mlpD6pXL4Jnwu7reEvEQPvt2Kcq7iIfhsfn4Yu0eFb5/ZnRE0d433DYCkK
 cdghwZHl1psSvBmHBmPiKQam64a3GgKwsjlObk+WtdqaHxXkPRZOKXlEsDxfpMbOFJ+F
 qvawNpaI/5HTMI7FX7pKKny6H0CoBufGQKBaV+h3B0J6ooncWt1iyUW0Dhc0OQr52xk/
 Icrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc;
 bh=D594wEp0LEmyYOAx7Tirjq3SGwda2pe5svLBID/NRVI=;
 b=ONsodCQJDYGLAzmir2o5yxXoNw+Csqxt2vulJxJk3aNqmZmDXH4sxAuK7ITh3DddZj
 GOURpw3Sz7//7Ipg25hgxH6qcI3u2Jc2zqgch9rG0lC1QmYXO/tyT7x8UzEK0BGDeg7m
 7N0ZiLVFqF3Rk9vMS/7h6OWQgPcRRva4Sxq1zik1DTc/PXB+9Bj2xl94hFWJJIhg7gbl
 Re7JKKPdZbWi/RGNHZaMCYYj8qHAux5sxjfbfA16PBeTeZq3KSYp1NIpxGuj0IbSo5Mk
 mgvOu7XcYte4oeUkvC0f8cCYxPF4SFlQ0pTUOZfJogw8xnBJIhX2/XvqVNI9fy/tweOi
 RGmQ==
X-Gm-Message-State: ACgBeo2eAjWedWz0Cs9xKe4AwX4VNlZyuqZH+ylp+UnB6GbcS7BxMNdO
 J4N+DgJiXWg/nLdOqAA5Xe8=
X-Google-Smtp-Source: AA6agR5RnfuFyIONMTqsPbIII5CYS1rbgB3cSxzqkqMVekfKEnddXN6p9IGLZ6Lzgilorerw0vcwmQ==
X-Received: by 2002:a05:6512:1054:b0:494:8ce3:24c8 with SMTP id
 c20-20020a056512105400b004948ce324c8mr235583lfb.360.1661912604645; 
 Tue, 30 Aug 2022 19:23:24 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:d40b:b088:5bfe:3b81?
 ([2a02:a31a:a240:1700:d40b:b088:5bfe:3b81])
 by smtp.googlemail.com with ESMTPSA id
 k9-20020a2eb749000000b00261eb75fa5dsm1960508ljo.41.2022.08.30.19.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 19:23:24 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <c8f8015a-75da-afa8-ca7f-b2b134cacd16@gmail.com>
Date: Wed, 31 Aug 2022 04:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v2 32/41] drm/vc4: vec: Convert to the new TV mode property
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-32-459522d653a7@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-32-459522d653a7@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I tested your patchset on my Pi and it mostly works. Good work! However,
I noticed a couple of issues.

> -static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
> -                    struct drm_crtc_state *crtc_state,
> -                    struct drm_connector_state *conn_state)
> -{
> -    const struct vc4_vec_tv_mode *vec_mode;
> -
> -    vec_mode = &vc4_vec_tv_modes[conn_state->tv.mode];
> -
> -    if (conn_state->crtc &&
> -        !drm_mode_equal(vec_mode->mode, &crtc_state->adjusted_mode))
> -        return -EINVAL;
> -
> -    return 0;
> -}

I may have said it myself that we should allow custom modelines without too
much validation. The VC4 and VEC, however, have some considerable limitations
when it comes to the modelines that they can reliably output.

In particular, attempting to use "50 Hz" timings in NTSC/PAL-M modes (or
"60 Hz" in PAL/SECAM modes) results in a weirdly skewed image. Here's how it
may look like:
https://user-images.githubusercontent.com/4499762/187575940-736e7262-c82d-42f3-a2d8-f309cbd51139.png

This is because if the CRTC does not trigger the sync pulses within an
acceptable time window, the VEC apparently generates them itself. This causes
the VEC sync pulses (which go onto the wire) not quite line up with the ones
from the modeline, which results in what you see on the screenshot.

I once wrote a validation function based on extensive testing of what
produces a sensible output and what doesn't. You can find it here:
https://github.com/raspberrypi/linux/pull/4406/commits/15c0c51. I think it
might be a good idea to include something like that - even though I know it's
somewhat ugly.

(BTW, those %2 checks on vertical timings in that linked commit can be ignored;
those values are divided by 2 for interlaced modes anyway. Those checks were
intended to ensure proper odd-first or even-first timings; I'm not sure if your
code calculates those in the same way)

>  static int vc4_vec_connector_get_modes(struct drm_connector *connector)
>  {
> -    struct drm_connector_state *state = connector->state;
>      struct drm_display_mode *mode;
> +    int count = 0;
>  
> -    mode = drm_mode_duplicate(connector->dev,
> -                  vc4_vec_tv_modes[state->tv.mode].mode);
> +    mode = drm_mode_analog_ntsc_480i(connector->dev);
>      if (!mode) {
>          DRM_ERROR("Failed to create a new display mode\n");
>          return -ENOMEM;
>      }
>  
>      drm_mode_probed_add(connector, mode);
> +    count += 1;
>  
> -    return 1;
> +    mode = drm_mode_analog_pal_576i(connector->dev);
> +    if (!mode) {
> +        DRM_ERROR("Failed to create a new display mode\n");
> +        return -ENOMEM;
> +    }
> +
> +    drm_mode_probed_add(connector, mode);
> +    count += 1;
> +
> +    return count;
> +}

Xorg is pretty confused by these modes being reported like that. The 576i mode
is *always* preferred, presumably because of the higher resolution. If the NTSC
mode is set (via the kernel cmdline or just due to it being the default), this
results in a mess on the screen - exactly the same thing as on the screenshot
linked above.

Note that drm_helper_probe_add_cmdline_mode() *does* add the
DRM_MODE_TYPE_USERDEF flag to the 480i mode, having detected it as preferred
on the command line - but Xorg does not seem to care about that.

I remember Noralf suggesting setting DRM_MODE_TYPE_PREFERRED for the mode that
corresponds to the currently chosen tv_mode - that would fix the problem.
An alternative would be to _not_ add the "opposite" mode at all, like the
current default Raspberry Pi OS kernel behaves.

Note that if you decide to add the modeline validation like I suggested in the
comment above, then without setting the preferred mode properly, Xorg will just
give up and sit on a blank screen until you run xrandr from another terminal
if tv_mode incompatible with 576i is selected.

Best regards,
Mateusz Kwiatkowski
