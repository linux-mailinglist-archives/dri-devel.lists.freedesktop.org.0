Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C59B968B3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 17:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AB210E051;
	Tue, 23 Sep 2025 15:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NS+g3sxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFDD10E051
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:20:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NF2OpV020604
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P5BhJYEa5kkq/g7zvanxd2EpTIktaXudAbbPYcsLERY=; b=NS+g3sxHqpJHpvrW
 dcmNhkU+GKTJsTIwPR8vVPAvp7t+SmgDLAzDk418vE3IPrXEEIDYJoKY7/Dlz5F0
 Loyz7T/KgUW5nspg3mf40rQePehoNNLdIeuhJptkoQMKp2HO/h/Ps7spfAtEfTT2
 80oK/W50yc2x597kNNtaBIwFtQGy1IHcCjSaWExAisn8uC6fXGUmkHrW69ucwnRV
 uvZq5n/IgQc2N07fscy5S4klznzda4tB4QwVTdScv7eirPTjxaosxAQzdOJUZp+Z
 IPbs1vxGlpyV8NzgTNXsrrhGdk5TwvhuRK8IPtPqx0Nbx3shNBoIzGtXi9miiWZ6
 OJZYyw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjte2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:20:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-797ab35807eso45019606d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758640845; x=1759245645;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P5BhJYEa5kkq/g7zvanxd2EpTIktaXudAbbPYcsLERY=;
 b=bc8ivF/SCz+vvPFC9PRED2aZIG3TQrkxaBbsTNgmP4sWlTzwzHPC8kLdRDDmYQX/U/
 JeD68jR2e31mYt1eeN7t29hq3swliXXKQH/jQqUwjt/8kc8CL8/ypvJ5Ee7B1mmAq6xu
 brA46ZlK6YdiYDiw7aYfEN2/ZgF2MeDkqx4TInhYOGa7HA5gBqzoHqRFqnn2mqPP4k8E
 QrQxcUYeWYPgwqhiVvz5nknxM+7ts6z8GkZP0Mn+G+md4yZVyVxWIDdYgcOA1Cg24pxM
 sGjvBL6Id+usWwwJ0rywljdMGoZ0o8rQBoLbh9a2cNIe4VdK56Q25h5eMIzAPGQiKGFu
 79dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn4hJTc4N6zgx0ZXaJyrzUsgxXaQjOANnjPzZctRbVPbgBz9PRf/zCnS5LQi7E4XWedGW9T+B0Vg0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+PCqB1BNRq3ZDRigKkQhl5IswK8/5KpEabljfUVAesyx4E4KK
 9jMabwuTUySJrbZ7ut7MAqh3XzBLRULvvZBxN0FKfFjeZvBjjfG89LTKif7ExbYUupd72v3YY3w
 KLNJuxWOaoaQcbgTIY4jXGLth4M21t+pcdsulyEJ3tj0O7NkrWaxwLAkVk2JVCyPIVqprvRo=
X-Gm-Gg: ASbGncuhUgAH/PiLr1QNNYcMpDKLWIKZ+un+wSPbQzCWcPBd/XgK6fx3UUAdrKoH1M/
 BT8FQ8pA8h2/CRM5+h+7GsWLkOTazM4DVFwvHMiYs14Tm0d8uktatGXfo/NdgHwR5Kbqx4b6kNp
 7o+OqXmruJlR00S/F2ir2W6SS/RsNId+5E0ZBQjMlwqDwC2tj/dU0QGXr+GUTRn+78/c6zSJ01Q
 sm7DeVbZhR7F/G3Z/GEJJzcV4a+Znh09WY2GKiVrU0KtXMXJkGsPYORrEu4aGoTOdWxHuUI4UKc
 wVp5RsIm9hqnGdmzU0j2j6hessbTRRCnop3R6rm19hsBwfOImOJHM9TIgWtAOVr1w+jz9AYWe35
 Tk+AeOOgpur8UN5OUb9OkraN6cBmra+H6m1SzxVWTasnl8yykHonn
X-Received: by 2002:ad4:5e89:0:b0:78f:430d:3299 with SMTP id
 6a1803df08f44-7e71c090ff1mr33549436d6.61.1758640845288; 
 Tue, 23 Sep 2025 08:20:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDk6PMrvqeVfGlFCX9JHJu94NNvw3khoWjGpMJxmVieYS53CCbq+PLWEglEVFavbOzM5/Clw==
X-Received: by 2002:ad4:5e89:0:b0:78f:430d:3299 with SMTP id
 6a1803df08f44-7e71c090ff1mr33548546d6.61.1758640844431; 
 Tue, 23 Sep 2025 08:20:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57b3af2612asm2719629e87.116.2025.09.23.08.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 08:20:43 -0700 (PDT)
Date: Tue, 23 Sep 2025 18:20:41 +0300
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
Message-ID: <qutg3vvms7whzxpdy57wzvbwciw7zuq5txudy3hn7lmvmjebrt@ccddcrydz57s>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
 <03240fae-544f-4753-96c5-a116b4b5a318@suse.de>
 <20250915-active-placid-bustard-6e1faa@penduick>
 <2ry3txigq3jyivtyz7i4c76g74vdgvlozsjkeswxalhu2vs5yx@jqswyjle632h>
 <20250923-debonair-earwig-of-abracadabra-940fa8@penduick>
 <osdt4teotc6qvja734dyo7be35nzy5lo4sw4dcniaqicqb3o5l@gabq5adeliha>
 <20250923103223.GA15509@pendragon.ideasonboard.com>
 <6s3tqwwpb4syypxo4hic4mgchdexjxvfvzmk3eordn3fpvoqw5@6pj24rhxhyls>
 <20250923114116.GC20765@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923114116.GC20765@pendragon.ideasonboard.com>
X-Proofpoint-ORIG-GUID: r08AnQNPY9losxRtL_ZIXz7Re0C47Mpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXweW+bpAqou7P
 BlpYurnYomdxXJbu4Dex9c9EWhcwLsH8nGAQq/digGHuPM2O+H+iKQw1voKmw0C68vBpUXDtbft
 /WXt3ICn8f6o7vJMRGrFhZbWAM5mwjsaiuynhR1qVi2wPVZMg1kV3YR3lMhh2wjgoL8eAvlTUlb
 2sdvEycDLMhAbYoEylGYJTjAAf/oDwtR/yr7T1v2Op1GrkGZN8ou5coki5Qhz8NUXUkqPgL5/5U
 SRPvwqPhw+Tl9lepBrIBfSMd5NMLkXiAwe9ON2CKn2HN+qqtlDzxsfgtLHmYP/KcnfIXNIPsshd
 0nX/rALLihFU1/+ZZpJgCqmlC105VIzMcRVZP9FqM9Yxj4nUXPJ/WZd0xK5+pXFdCESqrm5NniP
 29+gSj4s
X-Proofpoint-GUID: r08AnQNPY9losxRtL_ZIXz7Re0C47Mpu
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d2bacf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=if1EDNqy696QCxWzRmQA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011
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

On Tue, Sep 23, 2025 at 02:41:16PM +0300, Laurent Pinchart wrote:
> On Tue, Sep 23, 2025 at 01:43:29PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Sep 23, 2025 at 01:32:23PM +0300, Laurent Pinchart wrote:
> > > On Tue, Sep 23, 2025 at 01:28:57PM +0300, Dmitry Baryshkov wrote:
> > > > On Tue, Sep 23, 2025 at 11:38:17AM +0200, Maxime Ripard wrote:
> > > > > On Mon, Sep 15, 2025 at 09:38:44PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Mon, Sep 15, 2025 at 10:42:22AM +0200, Maxime Ripard wrote:
> > > > > > > On Tue, Sep 02, 2025 at 03:44:54PM +0200, Thomas Zimmermann wrote:
> > > > > > > > > +/**
> > > > > > > > > + * drm_atomic_build_readout_state - Creates an initial state from the hardware
> > > > > > > > > + * @dev: DRM device to build the state for
> > > > > > > > > + *
> > > > > > > > > + * This function allocates a &struct drm_atomic_state, calls the
> > > > > > > > > + * atomic_readout_state callbacks, and fills the global state old states
> > > > > > > > > + * by what the callbacks returned.
> > > > > > > > > + *
> > > > > > > > > + * Returns:
> > > > > > > > > + *
> > > > > > > > > + * A partially initialized &struct drm_atomic_state on success, an error
> > > > > > > > > + * pointer otherwise.
> > > > > > > > > + */
> > > > > > > > > +static struct drm_atomic_state *
> > > > > > > > > +drm_atomic_build_readout_state(struct drm_device *dev)
> > > > > > > > > +{
> > > > > > > > > +	struct drm_connector_list_iter conn_iter;
> > > > > > > > > +	struct drm_atomic_state *state;
> > > > > > > > > +	struct drm_mode_config *config =
> > > > > > > > > +		&dev->mode_config;
> > > > > > > > > +	struct drm_connector *connector;
> > > > > > > > > +	struct drm_printer p =
> > > > > > > > > +		drm_info_printer(dev->dev);
> > > > > > > > > +	struct drm_encoder *encoder;
> > > > > > > > > +	struct drm_plane *plane;
> > > > > > > > > +	struct drm_crtc *crtc;
> > > > > > > > > +	int ret;
> > > > > > > > > +
> > > > > > > > > +	drm_dbg_kms(dev, "Starting to build atomic state from hardware state.\n");
> > > > > > > > > +
> > > > > > > > > +	state = drm_atomic_state_alloc(dev);
> > > > > > > > > +	if (WARN_ON(!state))
> > > > > > > > > +		return ERR_PTR(-ENOMEM);
> > > > > > > > > +
> > > > > > > > > +	state->connectors = kcalloc(config->num_connector, sizeof(*state->connectors), GFP_KERNEL);
> > > > > > > > > +	if (WARN_ON(!state->connectors)) {
> > > > > > > > > +		ret = -ENOMEM;
> > > > > > > > > +		goto err_state_put;
> > > > > > > > > +	}
> > > > > > > > > +
> > > > > > > > > +	state->private_objs = kcalloc(count_private_obj(dev), sizeof(*state->private_objs), GFP_KERNEL);
> > > > > > > > > +	if (WARN_ON(!state->private_objs)) {
> > > > > > > > > +		ret = -ENOMEM;
> > > > > > > > > +		goto err_state_put;
> > > > > > > > > +	}
> > > > > > > > > +
> > > > > > > > > +	drm_for_each_crtc(crtc, dev) {
> > > > > > > > > +		const struct drm_crtc_funcs *crtc_funcs =
> > > > > > > > > +			crtc->funcs;
> > > > > > > > > +		struct drm_crtc_state *crtc_state;
> > > > > > > > > +
> > > > > > > > > +		drm_dbg_kms(dev, "Initializing CRTC %s state.\n", crtc->name);
> > > > > > > > > +
> > > > > > > > > +		if (crtc_funcs->atomic_readout_state) {
> > > > > > > > > +			crtc_state = crtc_funcs->atomic_readout_state(crtc);
> > > > > > > > > +		} else if (crtc_funcs->reset) {
> > > > > > > > > +			crtc_funcs->reset(crtc);
> > > > > > > > > +
> > > > > > > > > +			/*
> > > > > > > > > +			 * We don't want to set crtc->state field yet. Let's save and clear it up.
> > > > > > > > > +			 */
> > > > > > > > > +			crtc_state = crtc->state;
> > > > > > > > > +			crtc->state = NULL;
> > > > > > > > 
> > > > > > > > Chancing the crtc->state pointer behind the back of the reset callback seems
> > > > > > > > fragile. We never how if some other piece of the driver refers to it
> > > > > > > > (although illegally).
> > > > > > > 
> > > > > > > I agree that it's clunky. I'm not sure who would use it at this point
> > > > > > > though: we're in the middle of the drm_mode_config_reset(), so the
> > > > > > > drivers' involvement is pretty minimal.
> > > > > > > 
> > > > > > > I did wonder if changing reset to return the object instead of setting
> > > > > > > $OBJECT->state would be a better interface?
> > > > > > > 
> > > > > > > > For now, wouldn't it be better to require a read-out helper for all elements
> > > > > > > > of the driver's mode-setting pipeline?  The trivial implementation would
> > > > > > > > copy the existing reset function and keep crtc->state to NULL.
> > > > > > > 
> > > > > > > I also considered that, but I'm not sure we can expect bridges to have
> > > > > > > readout hooks filled for every configuration in the wild.
> > > > > > > 
> > > > > > > But maybe we can look during drm_mode_config_reset() at whether all the
> > > > > > > objects have their hook filled, and if not fall back on reset for
> > > > > > > everything.
> > > > > > > 
> > > > > > > It would make the implementation easier, but missing bridges
> > > > > > > implementations would trigger a mode change when it might actually work
> > > > > > > just fine since bridge state is pretty minimal.
> > > > > > 
> > > > > > DP bridge drivers have a pretty big state (DPCD and all the features).
> > > > > 
> > > > > I meant drm_bridge_state. Subclasses would have their own implementation
> > > > > anyway.
> > > > > 
> > > > > > Other bridge drivers randomly leak state to the non-state structs.
> > > > > 
> > > > > I'm not sure what you mean by that though. Can you expand?
> > > > 
> > > > I think I've seen bridge drivers which stored subclassed drm_bridge
> > > > instead of drm_bridge_state or stored the data in the long-living data
> > > > structures. YEs, that's a bug, which should be fixed on its own.
> > > 
> > > There's one exception to the "all state in state structure" rules if I
> > > understand things correctly (and I'm mentioning it here partly to be
> > > corrected if my understanding is wrong). Active state data that needs to
> > > be accessed from a non-sleepable context need to be copied to the
> > > device-specific structure when the state is applied, as we can't take
> > > the mutex protecting state access there.
> > 
> > I'd even relax this slightly (please correct me if I'm wrong here): the
> > state can be extracted to the device-specific structure in
> > atomic_pre_enable() and cleared in atomic_post_disable().
> 
> Overall I agree. I think this should be minimized when reasonably
> possible to avoid data duplication though.
> 
> > Likewise it's generally fine to store non-state changing data in the
> > private data (e.g. hw params or infoframe from the HDMI codec data).
> 
> Most hardware parameters are a translation of the software state. I
> would store them in the state when possible (e.g. when they need to be
> computed at atomic check time, and when the computation is expensive
> enough to make caching useful), and store in private data only the data
> that needs to also be accessed from a location where state access is not
> easily possible.

I'd agree here.

> 
> > > I'd expect that to be uncommon
> > > for bridges.

-- 
With best wishes
Dmitry
