Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6FB95780
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 12:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB10F10E5DF;
	Tue, 23 Sep 2025 10:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1VxNaPM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906E110E5DF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:43:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8HEGZ025794
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BrOEuQI6Op7fIUBoJcp9SXhiXSbyKzi3wXrdvlXbTfk=; b=M1VxNaPM8tuPcY0H
 xn4Oaaw1XxuO9UTTuaXxvW4hEY/S95TtZ/IedLMlLwZlEIG/FckTnYLV9zaJPc4U
 CD1DpQAj77xgoTP3wfz1vCcqWpA0xv/rmO3QGyW5AL/Z20u1+D9p9xe+UjS/ezaD
 NlaVacgbFcZxjgv7XLURjJmW+8+Hc2WxeTPWbF0juvgJwmUvAUlRqcwE2xEhTbaN
 ekwEQQ0h1mDLDknkvODoFTuFJJugEx4ox1OkqEAvobmhmA7UGgITeC6jHLKNBnwM
 U3wgTsBkdOss2d6xmXLiEnMcCKXnAN8UGXqns5UJ9hSM8TIOlHXtLCEE5+uLLQDb
 fMHZNw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn7g9cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:43:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-78e4e07aa39so87946436d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758624213; x=1759229013;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BrOEuQI6Op7fIUBoJcp9SXhiXSbyKzi3wXrdvlXbTfk=;
 b=RLR5mX02+MtS/hK5eoIjrqQ7/Gu23VP/LYFAmvD6K9ajdxnf80yVBv1mczzlQay/IH
 B/vVmHZUIw17bXU7c5FAt/tw2f99cnzMzkMFhe4nNF1xowwm4lmu5rj2gf5G9ySQpm6p
 flnlMSrEFnEwr6BIH4OH9a0wgO7L1f0YNuTfz4QIs/AooRgbhX4ph1i2iwTdvBxSGGzF
 n0yibjusuZx43vlEiOC+11vn1E2mp8KS+SuRPbMUUtp1CDloxOqAcH372Spit5ZCBFLd
 39fcsstmy9WESy03r5EJHA7hZeYEAP89XyxishuPYntqhnwCTDwr8Xu4rp0vWnK5DA+V
 yEtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb7xk0Nhp1rjnHzGB/KvUBrkNgsPDPxhCd3RHBTE1h4CPnRFT+eWhK2IQtK2g8HK5RU/ss1vsgzog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxL5t5p3mhLPZVKDg/rXgGtGWpNwyGdH41fLdr2Nrhask4/q5m
 l1mxhg+Gmhr8Eu+Jx3wgajHfcvIYcEmWXjn5YMKw68jyPqaEgOOPhTEW7LkDctbmzmEzYFniB0x
 Ou4EkAh0L3Wyiw+c2z68hbUFv2ULlVPf9cYxdjsSea5skhdpE71/9nFIefFCqylxDK/PEhvs=
X-Gm-Gg: ASbGncv1rrfJp9FXhfov6QrF4V9ahJ3VLTuXvlKYJO/4cJQYOIx8OOKm5tAEASFkU34
 5RcJMK4fQ5yxSVwbARJkhOIiNcdHRbA+x6S+UOGciixVPEGdwOGtExUkm+/N0wT8NKjfASBG+uS
 7M3/N2JdRlx8aG3NorSNjZTCbcLLr6MrAM2jQCVHWFJyjaRvpuDGtKHXHQop09j4uKVrnooqzC/
 3RWKhBf9eoar/oJSLprcS7WZ37B/04x3+CN8pQjt0ni6WpNpIEq3+qdvFp5ER04VRPoQLDbjD6E
 sLwhJJx9tx1oxmp7mBAT2GjD1zpuxNlpj3J9pAPvjWXWIM8gc4ly8vpP1UpOJaATiWbW26u98o2
 hJl0+ROf5rHJVEhKZs9W7jYI+dHjh3rbnXRsOzBc1heFs2PUtfoU2
X-Received: by 2002:a05:6214:5012:b0:7c0:cbcd:8919 with SMTP id
 6a1803df08f44-7e71133e61fmr20308556d6.37.1758624212515; 
 Tue, 23 Sep 2025 03:43:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBjJ3Q0oGAVwYQIBeHLPfS7nx65eA95PPQdE1qaLA8fMoMNpI7sJhR/aE7ERM1o9EOw/89jw==
X-Received: by 2002:a05:6214:5012:b0:7c0:cbcd:8919 with SMTP id
 6a1803df08f44-7e71133e61fmr20308326d6.37.1758624212012; 
 Tue, 23 Sep 2025 03:43:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578d5f4e53csm3867888e87.151.2025.09.23.03.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 03:43:31 -0700 (PDT)
Date: Tue, 23 Sep 2025 13:43:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
Message-ID: <6s3tqwwpb4syypxo4hic4mgchdexjxvfvzmk3eordn3fpvoqw5@6pj24rhxhyls>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
 <03240fae-544f-4753-96c5-a116b4b5a318@suse.de>
 <20250915-active-placid-bustard-6e1faa@penduick>
 <2ry3txigq3jyivtyz7i4c76g74vdgvlozsjkeswxalhu2vs5yx@jqswyjle632h>
 <20250923-debonair-earwig-of-abracadabra-940fa8@penduick>
 <osdt4teotc6qvja734dyo7be35nzy5lo4sw4dcniaqicqb3o5l@gabq5adeliha>
 <20250923103223.GA15509@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923103223.GA15509@pendragon.ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfX9VZ/c2g+ZBsu
 ZjKkmyItGH3uS5yxz+VeJ25yL5YQdbFm40qTUicteoLmvXXBgovqwP/B1RU9FU4XeuGwLq79hal
 YwfbajWWmMJ3Yq50jTaGvFiIR985ov8JlmTDzQ22idhuqJ24wIXRI5TJNWulsqZsVvdam9Ejnfg
 YBC80mtxhkQzdF2cHFbuN3N3SrsM1ONqCnR1kuc0Tunuomsb6ozZ1KE4SGd4YwR9I8w/LLVKmz+
 SQNXC6YZv0BjX0CXqNhE/eDAmZxrSGFdAIY8xEtmNCf5O8EMpiC6ZavK0UFvQjq0ebfrkYDN5b2
 b7VW/+g3jLQVRhAk8rTw4ky0gq30vzzFjeB9WCWBg5dixL/JNI+r/uEen1KifM0pv+v1Qoha3Dx
 AlSmU8F2
X-Proofpoint-GUID: Y2hy6-0WrbocSmuY6N3l11B5H2MxxKUa
X-Proofpoint-ORIG-GUID: Y2hy6-0WrbocSmuY6N3l11B5H2MxxKUa
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68d279d5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=ZwO8-XhQ80xaZHITHuEA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033
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

On Tue, Sep 23, 2025 at 01:32:23PM +0300, Laurent Pinchart wrote:
> On Tue, Sep 23, 2025 at 01:28:57PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Sep 23, 2025 at 11:38:17AM +0200, Maxime Ripard wrote:
> > > On Mon, Sep 15, 2025 at 09:38:44PM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, Sep 15, 2025 at 10:42:22AM +0200, Maxime Ripard wrote:
> > > > > On Tue, Sep 02, 2025 at 03:44:54PM +0200, Thomas Zimmermann wrote:
> > > > > > > +/**
> > > > > > > + * drm_atomic_build_readout_state - Creates an initial state from the hardware
> > > > > > > + * @dev: DRM device to build the state for
> > > > > > > + *
> > > > > > > + * This function allocates a &struct drm_atomic_state, calls the
> > > > > > > + * atomic_readout_state callbacks, and fills the global state old states
> > > > > > > + * by what the callbacks returned.
> > > > > > > + *
> > > > > > > + * Returns:
> > > > > > > + *
> > > > > > > + * A partially initialized &struct drm_atomic_state on success, an error
> > > > > > > + * pointer otherwise.
> > > > > > > + */
> > > > > > > +static struct drm_atomic_state *
> > > > > > > +drm_atomic_build_readout_state(struct drm_device *dev)
> > > > > > > +{
> > > > > > > +	struct drm_connector_list_iter conn_iter;
> > > > > > > +	struct drm_atomic_state *state;
> > > > > > > +	struct drm_mode_config *config =
> > > > > > > +		&dev->mode_config;
> > > > > > > +	struct drm_connector *connector;
> > > > > > > +	struct drm_printer p =
> > > > > > > +		drm_info_printer(dev->dev);
> > > > > > > +	struct drm_encoder *encoder;
> > > > > > > +	struct drm_plane *plane;
> > > > > > > +	struct drm_crtc *crtc;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	drm_dbg_kms(dev, "Starting to build atomic state from hardware state.\n");
> > > > > > > +
> > > > > > > +	state = drm_atomic_state_alloc(dev);
> > > > > > > +	if (WARN_ON(!state))
> > > > > > > +		return ERR_PTR(-ENOMEM);
> > > > > > > +
> > > > > > > +	state->connectors = kcalloc(config->num_connector, sizeof(*state->connectors), GFP_KERNEL);
> > > > > > > +	if (WARN_ON(!state->connectors)) {
> > > > > > > +		ret = -ENOMEM;
> > > > > > > +		goto err_state_put;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	state->private_objs = kcalloc(count_private_obj(dev), sizeof(*state->private_objs), GFP_KERNEL);
> > > > > > > +	if (WARN_ON(!state->private_objs)) {
> > > > > > > +		ret = -ENOMEM;
> > > > > > > +		goto err_state_put;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	drm_for_each_crtc(crtc, dev) {
> > > > > > > +		const struct drm_crtc_funcs *crtc_funcs =
> > > > > > > +			crtc->funcs;
> > > > > > > +		struct drm_crtc_state *crtc_state;
> > > > > > > +
> > > > > > > +		drm_dbg_kms(dev, "Initializing CRTC %s state.\n", crtc->name);
> > > > > > > +
> > > > > > > +		if (crtc_funcs->atomic_readout_state) {
> > > > > > > +			crtc_state = crtc_funcs->atomic_readout_state(crtc);
> > > > > > > +		} else if (crtc_funcs->reset) {
> > > > > > > +			crtc_funcs->reset(crtc);
> > > > > > > +
> > > > > > > +			/*
> > > > > > > +			 * We don't want to set crtc->state field yet. Let's save and clear it up.
> > > > > > > +			 */
> > > > > > > +			crtc_state = crtc->state;
> > > > > > > +			crtc->state = NULL;
> > > > > > 
> > > > > > Chancing the crtc->state pointer behind the back of the reset callback seems
> > > > > > fragile. We never how if some other piece of the driver refers to it
> > > > > > (although illegally).
> > > > > 
> > > > > I agree that it's clunky. I'm not sure who would use it at this point
> > > > > though: we're in the middle of the drm_mode_config_reset(), so the
> > > > > drivers' involvement is pretty minimal.
> > > > > 
> > > > > I did wonder if changing reset to return the object instead of setting
> > > > > $OBJECT->state would be a better interface?
> > > > > 
> > > > > > For now, wouldn't it be better to require a read-out helper for all elements
> > > > > > of the driver's mode-setting pipeline?  The trivial implementation would
> > > > > > copy the existing reset function and keep crtc->state to NULL.
> > > > > 
> > > > > I also considered that, but I'm not sure we can expect bridges to have
> > > > > readout hooks filled for every configuration in the wild.
> > > > > 
> > > > > But maybe we can look during drm_mode_config_reset() at whether all the
> > > > > objects have their hook filled, and if not fall back on reset for
> > > > > everything.
> > > > > 
> > > > > It would make the implementation easier, but missing bridges
> > > > > implementations would trigger a mode change when it might actually work
> > > > > just fine since bridge state is pretty minimal.
> > > > 
> > > > DP bridge drivers have a pretty big state (DPCD and all the features).
> > > 
> > > I meant drm_bridge_state. Subclasses would have their own implementation
> > > anyway.
> > > 
> > > > Other bridge drivers randomly leak state to the non-state structs.
> > > 
> > > I'm not sure what you mean by that though. Can you expand?
> > 
> > I think I've seen bridge drivers which stored subclassed drm_bridge
> > instead of drm_bridge_state or stored the data in the long-living data
> > structures. YEs, that's a bug, which should be fixed on its own.
> 
> There's one exception to the "all state in state structure" rules if I
> understand things correctly (and I'm mentioning it here partly to be
> corrected if my understanding is wrong). Active state data that needs to
> be accessed from a non-sleepable context need to be copied to the
> device-specific structure when the state is applied, as we can't take
> the mutex protecting state access there.

I'd even relax this slightly (please correct me if I'm wrong here): the
state can be extracted to the device-specific structure in
atomic_pre_enable() and cleared in atomic_post_disable().

Likewise it's generally fine to store non-state changing data in the
private data (e.g. hw params or infoframe from the HDMI codec data).

> I'd expect that to be uncommon
> for bridges.

-- 
With best wishes
Dmitry
