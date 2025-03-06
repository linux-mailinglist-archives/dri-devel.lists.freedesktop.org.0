Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A519A54F5D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 16:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9551A10E24E;
	Thu,  6 Mar 2025 15:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jvoYdGvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2248A10E24E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 15:41:29 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43bcbdf79cdso5387815e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 07:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741275687; x=1741880487; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfAw/lWzC06xKDDTRZDupFFimlwRpNal8Mn/TGIr/gI=;
 b=jvoYdGvP4dSEmrVXNugFIOGyJOtES/wGoKrGw66Jptwcf39wIBVcsD0tSeNt22H8/b
 wX07RsBV02+7jJuUaOmP4tfL3/NAauDYTHsIMyVRgNQlxOqvhkXullW8TTiljsiouCwI
 3+rZTOpy6mJ9YBIfwnePy5jjvXnzB/0kqFSbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741275687; x=1741880487;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KfAw/lWzC06xKDDTRZDupFFimlwRpNal8Mn/TGIr/gI=;
 b=VGuY4te93YUag0AE0HRVDT7B0pCI4laFsc54IAL5gc3kgL5Aq3iqhBwHbjZ90t2Mvw
 2LolXNimdqvgkbDV2FneIJkNi2+ez8+bd14Weij2KlRj+aHEGgadIIpj+6hF+sX9M43E
 uoDb0h0LdzNdqjT4ekJX0lLyF53RW9HNvw+fCKoG3eESoB87ydhe7ml708QoTLq7xCNT
 n1hMUFzAYc3+70Rtdi/3wNLVTINjJ9KhvETcw81Hzb9z8UwrAZhPPmPFRfECxdS9FCdq
 QtOwF2BDfPXHVO/p6KfDXRvNdqXpsUPhYHO93sqzZgdcVURZtvc3Eci+QBgXL67EdGOU
 63bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfW8rnV7boU8IkM76EXeV3AOgWBKhejcAQn1OrCJb1lxpLdRHu9bkYa9aimqKwcaoNAcpP/nVtEKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPPtLrcKHfjnyLssIDLL8WfJEcrGGKfe/zz1/EIeimkBSdkTTZ
 kCypraOGHmTncdNHLtyBVkqTbpWdqqUpw5LJ5ajwu2bqVjAiOhocqqAqAi8RFDw=
X-Gm-Gg: ASbGnct1izgqnJxFGXX1s8QQvUL0+Ks3BHXZ0m9gYZMAi2u6SLkL1Ft4ZbajX2e+LWA
 jA9slvOTzJg1l+1xZ55EIZT/l919El1Szt/IOl0S2osybphl5ufTT35nFZiMn564/B7j7GWwP9X
 l+Uj+VDi3ilBhje/6CWLwXMSIaa4rxWVzkxKAB/fV6Zv1+f/yKL1B2QpUQYmUt49qOcZCno4hwr
 LnaTQNJ8y+9qiXRFEwPVfZlSL3oCr5ujjgh6Zp5dRDGwN/Eu+BeWZLOJ9j/oplMo8ZZAf/cxMlv
 APUkeOxsTS40+UInyTouAniOV/6Lw5ccfwCsomYdooSirkR4ZEujD5oL
X-Google-Smtp-Source: AGHT+IHILhgpH9qsFMyPlni2g1PV1h6rdNmhtz7SSlpztS/80IfakxCQlbtDJtFSlQ77i0LW0AVdJw==
X-Received: by 2002:a05:6000:2ca:b0:391:454:5eb8 with SMTP id
 ffacd0b85a97d-3911f7c83f0mr7652632f8f.48.1741275687342; 
 Thu, 06 Mar 2025 07:41:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c015a29sm2342134f8f.42.2025.03.06.07.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 07:41:26 -0800 (PST)
Date: Thu, 6 Mar 2025 16:41:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andy Yan <andyshrk@163.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
Message-ID: <Z8nCJACBmcUNvQB8@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Andy Yan <andyshrk@163.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-4-aacf461d2157@kernel.org>
 <5180089f.a640.19566290538.Coremail.andyshrk@163.com>
 <20250305-ruddy-nightingale-of-wealth-db100a@houat>
 <mqh4wedfokuta2tmyctoi6jrzol7mqzm27nj3ylu6yj2vjy22j@mexke5x2o7a2>
 <7c1c61e7.10e1.19569067029.Coremail.andyshrk@163.com>
 <20250306-able-wonderful-saluki-aacd1d@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-able-wonderful-saluki-aacd1d@houat>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Thu, Mar 06, 2025 at 08:10:16AM +0100, Maxime Ripard wrote:
> On Thu, Mar 06, 2025 at 09:16:24AM +0800, Andy Yan wrote:
> > 
> > Hi Maxime and Dmitry:
> > 
> > At 2025-03-06 04:13:53, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> wrote:
> > >On Wed, Mar 05, 2025 at 02:19:36PM +0100, Maxime Ripard wrote:
> > >> Hi Andy,
> > >> 
> > >> On Wed, Mar 05, 2025 at 07:55:19PM +0800, Andy Yan wrote:
> > >> > At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@kernel.org> wrote:
> > >> > >With the bridges switching over to drm_bridge_connector, the direct
> > >> > >association between a bridge driver and its connector was lost.
> > >> > >
> > >> > >This is mitigated for atomic bridge drivers by the fact you can access
> > >> > >the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
> > >> > >drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> > >> > >
> > >> > >This was also made easier by providing drm_atomic_state directly to all
> > >> > >atomic hooks bridges can implement.
> > >> > >
> > >> > >However, bridge drivers don't have a way to access drm_atomic_state
> > >> > >outside of the modeset path, like from the hotplug interrupt path or any
> > >> > >interrupt handler.
> > >> > >
> > >> > >Let's introduce a function to retrieve the connector currently assigned
> > >> > >to an encoder, without using drm_atomic_state, to make these drivers'
> > >> > >life easier.
> > >> > >
> > >> > >Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> > >Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> > >> > >Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > >> > >---
> > >> > > drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
> > >> > > include/drm/drm_atomic.h     |  3 +++
> > >> > > 2 files changed, 48 insertions(+)
> > >> > >
> > >> > >diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > >> > >index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b132590e78f8d41d48eb4da4bccf170ee236 100644
> > >> > >--- a/drivers/gpu/drm/drm_atomic.c
> > >> > >+++ b/drivers/gpu/drm/drm_atomic.c
> > >> > >@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
> > >> > > 
> > >> > > 	return NULL;
> > >> > > }
> > >> > > EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
> > >> > > 
> > >> > >+/**
> > >> > >+ * drm_atomic_get_connector_for_encoder - Get connector currently assigned to an encoder
> > >> > >+ * @encoder: The encoder to find the connector of
> > >> > >+ * @ctx: Modeset locking context
> > >> > >+ *
> > >> > >+ * This function finds and returns the connector currently assigned to
> > >> > >+ * an @encoder.
> > >> > >+ *
> > >> > >+ * Returns:
> > >> > >+ * The connector connected to @encoder, or an error pointer otherwise.
> > >> > >+ * When the error is EDEADLK, a deadlock has been detected and the
> > >> > >+ * sequence must be restarted.
> > >> > >+ */
> > >> > >+struct drm_connector *
> > >> > >+drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
> > >> > >+				     struct drm_modeset_acquire_ctx *ctx)
> > >> > >+{
> > >> > >+	struct drm_connector_list_iter conn_iter;
> > >> > >+	struct drm_connector *out_connector = ERR_PTR(-EINVAL);
> > >> > >+	struct drm_connector *connector;
> > >> > >+	struct drm_device *dev = encoder->dev;
> > >> > >+	int ret;
> > >> > >+
> > >> > >+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> > >> > >+	if (ret)
> > >> > >+		return ERR_PTR(ret);
> > >> > 
> > >> > It seems that this will cause a deadlock when called from a hotplug
> > >> > handling path, I have a WIP DP diver[0], which suggested by Dmitry to
> > >> > use this API from a &drm_bridge_funcs.detect callback to get the
> > >> > connector, as detect is called by drm_helper_probe_detect, which will
> > >> > hold connection_mutex first, so the deaklock happens:
> > >> >
> > >> > drm_helper_probe_detect(struct drm_connector *connector,
> > >> >                         struct drm_modeset_acquire_ctx *ctx,
> > >> >                         bool force)
> > >> > {
> > >> >         const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> > >> >         struct drm_device *dev = connector->dev;
> > >> >         int ret;
> > >> > 
> > >> >         if (!ctx)
> > >> >                 return drm_helper_probe_detect_ctx(connector, force);
> > >> > 
> > >> >         ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> > >> >         if (ret)
> > >> >                 return ret;
> > >> > 
> > >> >         if (funcs->detect_ctx)
> > >> >                 ret = funcs->detect_ctx(connector, ctx, force);
> > >> >         else if (connector->funcs->detect)
> > >> >                 ret = connector->funcs->detect(connector, force);
> > >> >         else
> > >> >                 ret = connector_status_connected;
> > >> > 
> > >> >         if (ret != connector->status)
> > >> >                 connector->epoch_counter += 1;
> > >> > 
> > >> > So I wonder can we let drm_bridge_funcs.detect pass a connector for
> > >> > this case ?
> > >> 
> > >> Do you actually see a deadlock occurring? AFAIK, drm_modeset_lock is
> > >> fine with reentrancy from the same context, so it should work just fine.
> > >
> > >Andy, that probably means that you should use .detect_ctx() and pass the
> > >context to drm_atomic_get_connector_for_encoder().
> > 
> > Unfortunately, the drm_bridge_funcs does not have a .detect_ctx()  version .
> > The call chain is:
> >  drm_helper_probe_detect 
> >  --> drm_bridge_connector_detect(struct drm_connector *connector, bool force)
> > --> drm_bridge_funcs.detect(bridge)
> > The ctx got dropped when drm_helper_probe_detect call  drm_bridge_connector_detect
> > The connector got dropped  when connector call it's bridege.detect
> > 
> > So I think the simplest solution is to have drm_bridge_funcs.detect
> > directly pass the connector
> 
> I don't disagree on principle, but I think a better first step would be
> to provide a detect_ctx hook to bridges.

Yup. There's other reasons you really want to get at the locking context
in detect callbacks, doing this special case by passing something for
everyone doesn't sound like the right approach to me.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
