Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A600854380C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1CB10EF60;
	Wed,  8 Jun 2022 15:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C758210EF60
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:50:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i17-20020a7bc951000000b0039c4760ec3fso4637049wml.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=CMsRXdWPmCDKvHowScgEPfcStDkBg94b5gd4aiXfFOo=;
 b=Xqtl8Ykb4qZhu60PLm3yREsrhfN7nycopV9Cg9DUODp+2a1GNn/lBEVFmoUaJT4ctn
 Og0NsuClCH8RLjcbeHc3nTohfjXaaOF5zeejqNfesaxvPyIkipv6pYygVud9iJNcmYKh
 ahaIdZft8ba9IAW5aiqjdFaX5F43Oza1EtamY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=CMsRXdWPmCDKvHowScgEPfcStDkBg94b5gd4aiXfFOo=;
 b=k72tBMKb8rYMeECtjs79LYhfyo5kfDwApmKi/VQRYH8FMx4aP+pfHrlEW5q/dgu/Pi
 TbtakfNLs2I+oT8ACifzVvJ1KMG7U/x5ql0wic1YRVHSH0BFcxe67jiHQKp+f6J1ouZS
 MGgHGWOjWjmyf244nwZq0IpckPznHNd0N1cK5Rrj4CSMPD24d+2TlG8MJEqTHiHiSeEq
 W1ra2OrWKkaXc7/A2IcSbTGRCHJyU/K/lMaJ2DEDQVbF0Hbbf0rufyfrgEOZLrvfRl2q
 KR1PBoQs9Jnu7yo5ZHv3Z5T3SJZWlIxKWNx9tT5RtnX/pUZXm8UIjuS/WsKaD3e10Wjz
 JEBw==
X-Gm-Message-State: AOAM531kd02MWm1j131Pb/in68f8lawuuRycXMCtiHvn6jaSoumizyGq
 LE/7yaGTF2G8ShHyIKNsSJuV3w==
X-Google-Smtp-Source: ABdhPJyiIwGCreHBsvQ2VeugCyr176Iz/EYHcScGY1DBTFXJ2J9uF7B9z1Usvrt4vZT/C7DnLh5RkA==
X-Received: by 2002:a05:600c:10cb:b0:39c:4e74:2b41 with SMTP id
 l11-20020a05600c10cb00b0039c4e742b41mr19026418wmd.130.1654703418228; 
 Wed, 08 Jun 2022 08:50:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adffd44000000b002102d4ed579sm21547079wrs.39.2022.06.08.08.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 08:50:17 -0700 (PDT)
Date: Wed, 8 Jun 2022 17:50:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
Message-ID: <YqDFNx0Oim9RBIMf@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Philip Chen <philipchen@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>,
 freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521091751.opeiqbmc5c2okdq6@houat>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 21, 2022 at 11:17:51AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > This adds a devm managed version of drm_bridge_add(). Like other
> > "devm" function listed in drm_bridge.h, this function takes an
> > explicit "dev" to use for the lifetime management. A few notes:
> > * In general we have a "struct device" for bridges that makes a good
> >   candidate for where the lifetime matches exactly what we want.
> > * The "bridge->dev->dev" device appears to be the encoder
> >   device. That's not the right device to use for lifetime management.
> > 
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> 
> If we are to introduce more managed helpers, I think it'd be wiser to
> introduce them as DRM-managed, and not device managed.
> 
> Otherwise, you'll end up in a weird state when a device has been removed
> but the DRM device is still around.

Top-level post since I didn't see any good place to reply in the thread
below:

- devm is for device stuff, which drm_bridge is (it's not uapi visible in
  any way or fasion)

- drmm is for uapi visible stuff (like drm_encoder)

Yes the uapi-visible stuff can outlive the device-related pieces. The way
to handle this is:

- drm_dev_unplug() when the device disappears underneath you (or just a
  part, I guess the infra for that doesn't exist yet and maybe we should
  add it).

- drm_dev_enter/exit wrapped around the device related parts.

Iow, this patch here I think is the right direction, and gets my

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But also, it's definitely not a complete solution as the discussion in the
thread here points out.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
