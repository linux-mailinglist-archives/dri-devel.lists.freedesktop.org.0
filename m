Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8101C6002F9
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 21:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BAA10E85E;
	Sun, 16 Oct 2022 19:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8585010E85E;
 Sun, 16 Oct 2022 19:02:21 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id d6so14476357lfs.10;
 Sun, 16 Oct 2022 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2tT8kCb/WVUuH+lBmBzSowO1khzyce9k0uFdBJXQAY0=;
 b=Wn022JhbSiAKl2X8PK/0dLLvnA2KYx59VyBDcpMKkslDxq1gmTavUweTw7TSpfsy29
 ZQNm5d5Kud9NAMBx2DWE4ATZlqZ+7v4VQY6jnBU0w/Jly+Ji2YJygQ2d2aE5SvnPOuBc
 LUaIek3ag9tos1DYUCuOXC4mBkjA654+4/vseW2aGFGg4V9Q4tOwIoveXTgC6nBCvoix
 WqKvIjohOpkxN+5vEWW2J/wJ5Bt6x6aSYTqCGGxEtIxf30EL8n0PHVh8GQ0KmrQyXays
 jsKB/0dkT524iaTd2N3LvRFONyV2QpPt9l6M6dD70TbInNsqcmnQjjZX7ML1lQcEx5+N
 Xt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2tT8kCb/WVUuH+lBmBzSowO1khzyce9k0uFdBJXQAY0=;
 b=vuj1Ph3OF1xJz/9Ig5Ri8KbzmjIeIQAFmamhJCzRK8ZBjAuFRLHeYf8tk6IQIPL+fF
 0iOMyy4LoMFjMPUn4Kg1U6tN0Q4kgndWIQh0wK0FK8JPvnArqi9MWkFx2Dt/SBI8gZxI
 f+dQF61/cVtNs2pXqj1Uhg5E65A3VSQgqPfwBSS5kL7OBE+4N3S/kCscrg/2YFzhtTUh
 SY1ZsR9FKGpFyl701MiqFp+kg9Hc0xBsKPMbA2z/ulXiq/PH9EpEZ89yLIEv3xC+CY1R
 BIb18NuOmZPqvs4PAA0dNAk7aLq45WdKBo8aMWxy1voMgOvM5YY8Dv1o3/VeilpmIE/w
 chgQ==
X-Gm-Message-State: ACrzQf2QsrbLFobLDBCYIqccPavt9EaXsIOvbrko3ychuVZkZhTyO+Qy
 UxJLC0wW7r2Gnpg+JWYBjks=
X-Google-Smtp-Source: AMsMyM7y2QYkuboXP2v70rAENTc5DitWTlWhre5mOH5uFbdJJu3TsghZ/Z8+nuj9UYyZBokwz7Tq+Q==
X-Received: by 2002:a05:6512:32ab:b0:4a2:2e49:94c with SMTP id
 q11-20020a05651232ab00b004a22e49094cmr2839114lfe.351.1665946939657; 
 Sun, 16 Oct 2022 12:02:19 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:64bb:87df:aad7:a9f0?
 ([2a02:a31a:a240:1700:64bb:87df:aad7:a9f0])
 by smtp.googlemail.com with ESMTPSA id
 p10-20020a2eb7ca000000b0026dc57ee439sm1235527ljo.71.2022.10.16.12.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 12:02:18 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <e0867d71-37c7-777f-0df2-0cd74909caaf@gmail.com>
Date: Sun, 16 Oct 2022 21:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v5 21/22] drm/vc4: vec: Add support for more analog TV
 standards
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-21-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-21-d841cc64fe4b@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

W dniu 13.10.2022 o 15:19, Maxime Ripard pisze:
> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
>
> Add support for the following composite output modes (all of them are
> somewhat more obscure than the previously defined ones):
>
> - NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to
>   4.43361875 MHz (the PAL subcarrier frequency). Never used for
>   broadcasting, but sometimes used as a hack to play NTSC content in PAL
>   regions (e.g. on VCRs).
> - PAL_N - PAL with alternative chroma subcarrier frequency,
>   3.58205625 MHz. Used as a broadcast standard in Argentina, Paraguay
>   and Uruguay to fit 576i50 with colour in 6 MHz channel raster.
> - PAL60 - 480i60 signal with PAL-style color at normal European PAL
>   frequency. Another non-standard, non-broadcast mode, used in similar
>   contexts as NTSC_443. Some displays support one but not the other.

The current version actually does not support PAL-60. Proper PAL-60 output from
VEC requires configuring it differently than for regular PAL. We have unified
the PAL and PAL-60 modes for the "TV mode" property, but the code here has not
been adjusted appropriately.

I'll try to submit an additional patch that fixes this shortly.

> - SECAM - French frequency-modulated analog color standard; also have
>   been broadcast in Eastern Europe and various parts of Africa and Asia.
>   Uses the same 576i50 timings as PAL.
>
> Also added some comments explaining color subcarrier frequency
> registers.
>
> Acked-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
(snip)

Best regards,
Mateusz Kwiatkowski
