Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5786483CAB0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 19:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359DB10E246;
	Thu, 25 Jan 2024 18:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E91010E246
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 18:18:25 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a27e7b70152so186490466b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 10:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706206644; x=1706811444; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LX2Biyswi3lcTJguDEv72aHM8YWWcEZE57McfhSqDfM=;
 b=Y1icyBU6jfzFIh9gAqXbIzs8l/etjnt0gK2vo8V4l81BM+8nL0hcBHxhDlFXqt8Se8
 Jeqg/VEN6QpvkUK4GTzU0/0T2MBbQRTyAG1OHNKrtgyPAtkkQf1YxdK6osJMn25wrOU4
 jiYJZW41U9NcHfPQlXKrFDiur1OISvHP/BCus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706206644; x=1706811444;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LX2Biyswi3lcTJguDEv72aHM8YWWcEZE57McfhSqDfM=;
 b=oei0oufAUmjFKF4fI6AcAnNAPrrpPoSDHO+JuONVhgrU/Yj7TLlIhixC9uM8Ffkyxn
 Q1rGF4b+Uxt4HGZfLU5BK+aitm8x0YAojfVx/S8GAa5pKj38aPxDQsIzb60IPiaty+BN
 A2oV/dFh7ghmdWxWbOmteSeC1B9ATITZ83NDtgcjZMpvmxlhUe550nRAHr/azY5UN4H2
 YeLbTSkTAZjkT1TAWs5o3X6I4MH0GfbsPenY4zaLxVUCWqjU6eG4tRt8FWGtvfH5ppHd
 Vu0HoKtE3TEhHl3YUHM6F8/8OilsvVyt6807ztjb40w+7CXlnTSHbzURM/v3rSfmU1oY
 pNbw==
X-Gm-Message-State: AOJu0YzLvjv+wzAvPdbSMB2t9r8FwzoFKd3BU/taoiHVzQ0qK95QyGwW
 bYal2JEQiBTjTHMxsPe1RUeXLrMWXo+vuwVswU9bn6ukjAd1Jc07+Pp9mxX2dgU=
X-Google-Smtp-Source: AGHT+IFFgR3FnuKNaxcbSF/D45iFGEkVO7DwIYkEGMWwJWTauy+SOrnz8WOVHQePtLtXFKX663PQaQ==
X-Received: by 2002:a17:906:a2d6:b0:a31:7e9c:60bf with SMTP id
 by22-20020a170906a2d600b00a317e9c60bfmr23085ejb.0.1706206643807; 
 Thu, 25 Jan 2024 10:17:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 tl15-20020a170907c30f00b00a3186c2c254sm765083ejc.213.2024.01.25.10.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 10:17:23 -0800 (PST)
Date: Thu, 25 Jan 2024 19:17:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
Mail-Followup-To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?=
 <Jason-JH.Lin@mediatek.com>, 
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "mikita.lipski@amd.com" <mikita.lipski@amd.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: "fshao@chromium.org" <fshao@chromium.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mikita.lipski@amd.com" <mikita.lipski@amd.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (林睿祥) wrote:
> Hi Maxime, Daniel,
> 
> We encountered similar issue with mediatek SoCs.
> 
> We have found that in drm_atomic_helper_commit_rpm(), when disabling
> the cursor plane, the old_state->legacy_cursor_update in
> drm_atomic_wait_for_vblank() is set to true.
> As the result, we are not actually waiting for a vlbank to wait for our
> hardware to close the cursor plane. Subsequently, the execution
> proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> buffer. This can lead to use-after-free issues with our hardware.
> 
> Could you please apply this patch to fix our problem?
> Or are there any considerations for not applying this patch?

Mostly it needs someone to collect a pile of acks/tested-by and then land
it.

I'd be _very_ happy if someone else can take care of that ...

There's also the potential issue that it might slow down some of the
legacy X11 use-cases that really needed a non-blocking cursor, but I think
all the drivers where this matters have switched over to the async plane
update stuff meanwhile. So hopefully that's good.

Cheers, Sima
> 
> Regards,
> Jason-JH.Lin
> 
> On Tue, 2023-03-07 at 15:56 +0100, Maxime Ripard wrote:
> > Hi,
> > 
> > On Thu, Feb 16, 2023 at 12:12:13PM +0100, Daniel Vetter wrote:
> > > The stuff never really worked, and leads to lots of fun because it
> > > out-of-order frees atomic states. Which upsets KASAN, among other
> > > things.
> > > 
> > > For async updates we now have a more solid solution with the
> > > ->atomic_async_check and ->atomic_async_commit hooks. Support for
> > > that
> > > for msm and vc4 landed. nouveau and i915 have their own commit
> > > routines, doing something similar.
> > > 
> > > For everyone else it's probably better to remove the use-after-free
> > > bug, and encourage folks to use the async support instead. The
> > > affected drivers which register a legacy cursor plane and don't
> > > either
> > > use the new async stuff or their own commit routine are: amdgpu,
> > > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and
> > > vmwgfx.
> > > 
> > > Inspired by an amdgpu bug report.
> > 
> > Thanks for submitting that patch. It's been in the downstream RPi
> > tree
> > for a while, so I'd really like it to be merged eventually :)
> > 
> > Acked-by: Maxime Ripard <maxime@cerno.tech>
> > 
> > Maxime

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
