Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C737DB584C3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 20:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A08810E532;
	Mon, 15 Sep 2025 18:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCkD/Dgh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F42610E532
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:38:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FEb9uU006882
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7ZvFNed0T7k2vLP+CStAQL0NWTskP6Fm2LosIqYY0ko=; b=UCkD/DghafOnqoSw
 L3cbah4SNpTv3PPIg/jLwZ+4+X6VEQNW7+6LX4azpyoaMPAkNmdJoUf+uBAW9s2J
 UI3wrsiUlAe0TXYu3XXa97tlPrfMooiNmP9X0vtATkSaVzEt9fHgUTvOxvFtbtmx
 WzQVISyC8EDf1yZrSRYc2H5jjbZx+1hCfi1TuKwgrXHKMxQpsXQilqRQ3rEvhE02
 lViX/S5QlfSJjJumva0c/nYZV5shquw3qUH0WXA1WFBwID5PKW6AEi+U6hEY23Cv
 eUHKp9rKgVR7+Tjs6lSlJ6C8Mf/tEG2K7qai8TuzKYVqTo1KipD9oANDd0HWvNNh
 0QMZxQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snnwwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:38:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-77ccfa8079cso33770046d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757961530; x=1758566330;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ZvFNed0T7k2vLP+CStAQL0NWTskP6Fm2LosIqYY0ko=;
 b=qQzJYAUqfIWfCDEJBav8cvOj9owxsT3XM2vtza19smKu6nWQiyJqdrDJT401+372Li
 Ox79ZN9GlBHtTLXKKj7x04e08a2n/C2dFq6Rt5GDmVwAnTYw92VseBEeN1t1cxsHWCbA
 bPYXaXQdKx87eY8EOxD+h5h7TZeHPDG1hc7Mc9Znc/L/OYEZZdQDbjrsitVwpBEk+jRj
 zoJS5HsLcrWcfaiWO81N1SJXOIuw8zD4XaUXRXTaVUtE/L7Fh6m11MUKvXm7lNByrYHn
 J7EXVdWznOjXMpCWvtrArxn9pKPcew+yl7UZ712uZf3DqUhpKZjypXL5MiyVoNMbr5uA
 y7/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuTiJjfcwfrf9NCXVJkBZwxjKZYPXQRaqSRUBagNUM5fiRlU1BIAcL3w6WqMTnW7ItTqNt7c77RWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKfwKGS5mHRdOEUD63dW4ZhiaDxIgRIHeFAhQDUNA/eHss9hWY
 b+Topk0tAXiMSD1YvlBSKkvkR6mdMPgSPzTzDKhyOavI4h0/WYt0yCvUGJ5CTPHlasGO3zqgQUH
 V/Yoq5g3DYoN0eyo5pUimV54zRxTV73s0OXT6SE327utNsmQxma6v2eIooxhrW3aLdJe+4iU=
X-Gm-Gg: ASbGnct/DcHZEvmK433HA++auhWNaeSEhJGwFeuT0STx5uoOujTB9WeOGwY64mbfSgG
 blcDvGOrba0kD/pHqZa9G7MRjx1JBTTo6Ht7EfwxSFtYGj/wknyInIah78NMZh1G2hMddGdtZ63
 Qu8SAzp1SUQ9EGd5O9x2D0mUFNJwZKU7KQnqmdSmHKkhadAHPaONHeoHzZZi0mQSuUKzKiXd2Dh
 Ocdqb6Tgw+tXY9cfu3ES47ajYtWSqBZkY34wRrjdpxag/rPaaRGxjwVvefxA/bHw51BaRjr2m1L
 vtr30sG5gbc3ObG2enlSAvNs+zzV4glhDn1XON+pwK4qxYs9YI70x8C951IA/DmBFSx6Gr8v3MK
 JgESblgOMbeJxxsDBM/8LcPEUh0Gg3zsBk4vfyO9gtibrpmOQCuSc
X-Received: by 2002:a05:6214:2aae:b0:785:c012:cc71 with SMTP id
 6a1803df08f44-785c012ce25mr34397456d6.22.1757961529747; 
 Mon, 15 Sep 2025 11:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFcYo39nIFSQwMRtH9wQGOFkG81XgQRHt/zFW69OUnDfhWL6P6ACP456SvE2c5pQ25KFKQUQ==
X-Received: by 2002:a05:6214:2aae:b0:785:c012:cc71 with SMTP id
 6a1803df08f44-785c012ce25mr34397106d6.22.1757961529254; 
 Mon, 15 Sep 2025 11:38:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1b39db54sm28662261fa.55.2025.09.15.11.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 11:38:47 -0700 (PDT)
Date: Mon, 15 Sep 2025 21:38:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
Message-ID: <2ry3txigq3jyivtyz7i4c76g74vdgvlozsjkeswxalhu2vs5yx@jqswyjle632h>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
 <03240fae-544f-4753-96c5-a116b4b5a318@suse.de>
 <20250915-active-placid-bustard-6e1faa@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915-active-placid-bustard-6e1faa@penduick>
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c85d3b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=Cyg6RtkmpQHzVPyx2I8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: hh-XodR112ImEyr0YpbcWGSMDQES9coA
X-Proofpoint-GUID: hh-XodR112ImEyr0YpbcWGSMDQES9coA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX5s8+DYpdzVld
 w1Pr8AwDyMFoh0SIzb3FzIy9a5M0lgCOyiNMmqSowAbi0tBTM2yo2rzal6lu5kUsdErBzSj7DhW
 y54oNrHs2P8xyIH4qbaPRd7fTgAKPmsl8FCItL6+CDwnxDhlKYwG86ynLR4pB+5lp4Q6rQGjIUV
 z6WDQLtTCor11iwaup6qJJpWi1YZby1ZsZB6Zaf1V9LGxGw3oso2eSLQJValGCVdopeZTHhA++A
 5cP43JE/btc47DgPldX198BXQcMeuDmsAgpf8b4OGfU0QIzsXEIv0h7TcuCbKcven8OnzqvXqnE
 c+dQDW3ol4+vcifCi6aDmng3pilqqizLWtSCXzgm6YbbN9RXlvJGp27uchGJav8FxqFK7Gfonfp
 vo6fEeLM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040
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

On Mon, Sep 15, 2025 at 10:42:22AM +0200, Maxime Ripard wrote:
> Hi Tohmas,
> 
> On Tue, Sep 02, 2025 at 03:44:54PM +0200, Thomas Zimmermann wrote:
> > > +/**
> > > + * drm_atomic_build_readout_state - Creates an initial state from the hardware
> > > + * @dev: DRM device to build the state for
> > > + *
> > > + * This function allocates a &struct drm_atomic_state, calls the
> > > + * atomic_readout_state callbacks, and fills the global state old states
> > > + * by what the callbacks returned.
> > > + *
> > > + * Returns:
> > > + *
> > > + * A partially initialized &struct drm_atomic_state on success, an error
> > > + * pointer otherwise.
> > > + */
> > > +static struct drm_atomic_state *
> > > +drm_atomic_build_readout_state(struct drm_device *dev)
> > > +{
> > > +	struct drm_connector_list_iter conn_iter;
> > > +	struct drm_atomic_state *state;
> > > +	struct drm_mode_config *config =
> > > +		&dev->mode_config;
> > > +	struct drm_connector *connector;
> > > +	struct drm_printer p =
> > > +		drm_info_printer(dev->dev);
> > > +	struct drm_encoder *encoder;
> > > +	struct drm_plane *plane;
> > > +	struct drm_crtc *crtc;
> > > +	int ret;
> > > +
> > > +	drm_dbg_kms(dev, "Starting to build atomic state from hardware state.\n");
> > > +
> > > +	state = drm_atomic_state_alloc(dev);
> > > +	if (WARN_ON(!state))
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	state->connectors = kcalloc(config->num_connector, sizeof(*state->connectors), GFP_KERNEL);
> > > +	if (WARN_ON(!state->connectors)) {
> > > +		ret = -ENOMEM;
> > > +		goto err_state_put;
> > > +	}
> > > +
> > > +	state->private_objs = kcalloc(count_private_obj(dev), sizeof(*state->private_objs), GFP_KERNEL);
> > > +	if (WARN_ON(!state->private_objs)) {
> > > +		ret = -ENOMEM;
> > > +		goto err_state_put;
> > > +	}
> > > +
> > > +	drm_for_each_crtc(crtc, dev) {
> > > +		const struct drm_crtc_funcs *crtc_funcs =
> > > +			crtc->funcs;
> > > +		struct drm_crtc_state *crtc_state;
> > > +
> > > +		drm_dbg_kms(dev, "Initializing CRTC %s state.\n", crtc->name);
> > > +
> > > +		if (crtc_funcs->atomic_readout_state) {
> > > +			crtc_state = crtc_funcs->atomic_readout_state(crtc);
> > > +		} else if (crtc_funcs->reset) {
> > > +			crtc_funcs->reset(crtc);
> > > +
> > > +			/*
> > > +			 * We don't want to set crtc->state field yet. Let's save and clear it up.
> > > +			 */
> > > +			crtc_state = crtc->state;
> > > +			crtc->state = NULL;
> > 
> > Chancing the crtc->state pointer behind the back of the reset callback seems
> > fragile. We never how if some other piece of the driver refers to it
> > (although illegally).
> 
> I agree that it's clunky. I'm not sure who would use it at this point
> though: we're in the middle of the drm_mode_config_reset(), so the
> drivers' involvement is pretty minimal.
> 
> I did wonder if changing reset to return the object instead of setting
> $OBJECT->state would be a better interface?
> 
> > For now, wouldn't it be better to require a read-out helper for all elements
> > of the driver's mode-setting pipeline?  The trivial implementation would
> > copy the existing reset function and keep crtc->state to NULL.
> 
> I also considered that, but I'm not sure we can expect bridges to have
> readout hooks filled for every configuration in the wild.
> 
> But maybe we can look during drm_mode_config_reset() at whether all the
> objects have their hook filled, and if not fall back on reset for
> everything.
> 
> It would make the implementation easier, but missing bridges
> implementations would trigger a mode change when it might actually work
> just fine since bridge state is pretty minimal.

DP bridge drivers have a pretty big state (DPCD and all the features).
Other bridge drivers randomly leak state to the non-state structs.

> 
> Idk.
> 
> > > --- a/include/drm/drm_bridge.h
> > > +++ b/include/drm/drm_bridge.h
> > > @@ -490,10 +490,31 @@ struct drm_bridge_funcs {
> > >   	 * The @atomic_post_disable callback is optional.
> > >   	 */
> > >   	void (*atomic_post_disable)(struct drm_bridge *bridge,
> > >   				    struct drm_atomic_state *state);
> > > +	/**
> > > +	 * @atomic_readout_state:
> > > +	 *
> > > +	 * Initializes,this bridge atomic state.
> > > +	 *
> > > +	 * It's meant to be used by drivers that wants to implement fast
> > 
> > 'want'
> > 
> > > +	 * / flicker-free boot and allows to initialize the atomic state
> > 
> > I think we should only call it flicker-free boot. Fast boot is misleading.
> 
> I agree, but it's also how it's been called by the only implementation
> of it we have so far (i915), and the name of the module parameter that
> controls it.

I hope to be able to try implementing this for drm/msm (at least it will
allow us to check how does that play with bridges).

> 
> Maxime



-- 
With best wishes
Dmitry
