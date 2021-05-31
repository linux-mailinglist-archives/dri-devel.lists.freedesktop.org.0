Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267D03967CA
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 20:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F24C6E0AB;
	Mon, 31 May 2021 18:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1FD6E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 18:26:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id w33so17957395lfu.7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7TI7fQuGaEfrByk2jtW55koqbA8DqlXxD77ZaJA6t1A=;
 b=BkqV3rt98TP8hqluqk7VN+9VjYOs4gN36fKstt5LLa66Bu7ISUjjVmcQy9TiOopU1F
 dkgnNj4jAXIwqh4wTq317S097l2dsU64IghALR1A6U0mb84x07ThGdFvMURGAMxs6+5y
 +5H0RZdUqKWvfaPArMVk99wHUWIDOH22UY5dC7b0jvdFFwi4vxtMf7NWiyHxbRAdMc17
 v13KHXE/Fv+btg6OgaFJ3sPyIwoSVPuUeZSU+0COxXRci8fq5rhI0H/biQ/ZE1WSnhmI
 c7zEsHr2dQmSoh9RkgmAhEA2YDeU0B4X13ijZx3O6HwV7jVkuW8kkMFD0x+N8cpnonCu
 fvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7TI7fQuGaEfrByk2jtW55koqbA8DqlXxD77ZaJA6t1A=;
 b=rjlErxSL4H7Wl42FRRAiEeofTdQqMnIhK7ajVC8B2y+x/5yWMUdM+xaG7+M1hPksVn
 9TtxoA9qPF7Ga71Q1vh0JNcQc6WQblQWBiG1GdaQXTIFEi0FUec7ON1w8rwMuSzYw9QH
 sXziwNEkqoDL1kasMuRZ/hiVwpOKtIE61CzL5DjGN/XQhtxSDr5+Q6EdU52Lyn0fRHN/
 zSHWtBVF4VvHZM5fYTCSyxNpxjeXj37JFUn1Z6iLjtUYSIcmWQEHw3MdIwk96nrzShDZ
 YqM9N4qLMX0tPvz3cKIXrj6TJuqc4y90v12ozLNDrcTut+AE0g1owOSZ824R+DCqkEYu
 GElQ==
X-Gm-Message-State: AOAM532EMm6etkuFC6140+AGcv/pawGLf5kAhVGXpt7LLcEJ/qSWSqWB
 LxdyflKpM9yp97ltahrWmG+Fcz0+k8Q=
X-Google-Smtp-Source: ABdhPJzDaLCMVaI7SnJjyJWhEBHUkGbEWE2LJwZQCfXoFut+QRa+E1/YyAwrYwqCaa4eqtQBY/9Qiw==
X-Received: by 2002:ac2:455b:: with SMTP id j27mr15219533lfm.587.1622485560717; 
 Mon, 31 May 2021 11:26:00 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru.
 [79.139.170.222])
 by smtp.googlemail.com with ESMTPSA id r17sm1424817lfr.18.2021.05.31.11.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 11:26:00 -0700 (PDT)
Subject: Re: [PATCH v17 1/2] drm/tegra: dc: Support memory bandwidth management
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210510232709.1349-1-digetx@gmail.com>
 <20210510232709.1349-2-digetx@gmail.com> <YLTvAVvWY0KcOx8s@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <97bfce90-46d9-0ab0-e437-ce1e43b01b52@gmail.com>
Date: Mon, 31 May 2021 21:25:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLTvAVvWY0KcOx8s@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

31.05.2021 17:13, Thierry Reding пишет:
> On Tue, May 11, 2021 at 02:27:08AM +0300, Dmitry Osipenko wrote:
>> Display controller (DC) performs isochronous memory transfers, and thus,
>> has a requirement for a minimum memory bandwidth that shall be fulfilled,
>> otherwise framebuffer data can't be fetched fast enough and this results
>> in a DC's data-FIFO underflow that follows by a visual corruption.
>>
>> The Memory Controller drivers provide facility for memory bandwidth
>> management via interconnect API. Let's wire up the interconnect API
>> support to the DC driver in order to fix the distorted display output
>> on T30 Ouya, T124 TK1 and other Tegra devices.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
>> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/tegra/Kconfig |   1 +
>>  drivers/gpu/drm/tegra/dc.c    | 352 ++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/tegra/dc.h    |  14 ++
>>  drivers/gpu/drm/tegra/drm.c   |  14 ++
>>  drivers/gpu/drm/tegra/hub.c   |   3 +
>>  drivers/gpu/drm/tegra/plane.c | 116 +++++++++++
>>  drivers/gpu/drm/tegra/plane.h |  15 ++
>>  7 files changed, 515 insertions(+)
>>
> [...]
>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> [...]
>> @@ -2011,7 +2143,215 @@ static void tegra_crtc_atomic_flush(struct drm_crtc *crtc,
>>  	value = tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
>>  }
>>  
>> +static bool tegra_plane_is_cursor(const struct drm_plane_state *state)
>> +{
>> +	const struct tegra_dc_soc_info *soc = to_tegra_dc(state->crtc)->soc;
>> +	const struct drm_format_info *fmt = state->fb->format;
>> +	unsigned int src_w = drm_rect_width(&state->src) >> 16;
>> +	unsigned int dst_w = drm_rect_width(&state->dst);
>> +
>> +	if (state->plane->type != DRM_PLANE_TYPE_CURSOR)
>> +		return false;
>> +
>> +	if (soc->supports_cursor)
>> +		return true;
>> +
>> +	if (src_w != dst_w || fmt->num_planes != 1 || src_w * fmt->cpp[0] > 256)
>> +		return false;
> 
> Technically there could be some random overlay window that matches these
> conditions and is erroneously detected as being a cursor.

The "random overlay window" with the DRM_PLANE_TYPE_CURSOR could happen
only for the oldest Tegras. It's not a problem at all since everything
will work properly anyways because we skip only the small sized plane
that doesn't contribute to the BW requirement.

> I wonder if we
> should add a field to a plane that marks it as being used as cursor for
> the cases where we don't support a hardware cursor.

I don't think that we have information about how plane is used in the
driver. DRM core should know this, tegra-drm not.

It's unpractical to worry about this case, hence I think it's better to
leave this part as-is for now, if you don't mind.

> [...]
>> diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
>> index 29f19c3c6149..db10af097033 100644
>> --- a/drivers/gpu/drm/tegra/dc.h
>> +++ b/drivers/gpu/drm/tegra/dc.h
>> @@ -15,6 +15,8 @@
>>  
>>  struct tegra_output;
>>  
>> +#define TEGRA_DC_LEGACY_PLANES_NUM	7
>> +
>>  struct tegra_dc_state {
>>  	struct drm_crtc_state base;
>>  
>> @@ -23,6 +25,8 @@ struct tegra_dc_state {
>>  	unsigned int div;
>>  
>>  	u32 planes;
>> +
>> +	unsigned long plane_peak_bw[TEGRA_DC_LEGACY_PLANES_NUM];
> 
> Why can we not store this peak bandwidth value within the plane state? I
> know that this isn't exactly per-plane data because it depends on the
> state of other planes, but that doesn't really prevent the value to live
> within the plane state. The plane state is, after all, part of the
> global state, and hence any such state needs to be considered within the
> context of that global atomic state.
> 
> I suppose that might make it a little bit more difficult to get at the
> data, but I think the end result would be less confusing than having an
> array here with potentially unused fields. It would also get rid of the
> need to look up planes by their per-CRTC index.

The reason I stored the peak_bw in CRTC state is because it feels more
natural to me somehow. It shouldn't be a problem to move it to the
planes state. I'll prepare the new version shortly.

...
>>  static const struct drm_mode_config_helper_funcs
>> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
>> index bfae8a02f55b..f1bbc5991854 100644
>> --- a/drivers/gpu/drm/tegra/hub.c
>> +++ b/drivers/gpu/drm/tegra/hub.c
>> @@ -358,6 +358,9 @@ static int tegra_shared_plane_atomic_check(struct drm_plane *plane,
>>  	struct tegra_dc *dc = to_tegra_dc(new_plane_state->crtc);
>>  	int err;
>>  
>> +	plane_state->peak_memory_bandwidth = 0;
>> +	plane_state->avg_memory_bandwidth = 0;
>> +
> 
> Since ICC isn't supported yet on Tegra186 and later, does it even make
> sense to initialize these?

I added it for consistency, right now it's not needed for Tegra186+.
