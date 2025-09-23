Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D746CB956EA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 12:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F172E10E103;
	Tue, 23 Sep 2025 10:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYXCA+Qq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFB210E103
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:29:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H9Fi027288
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vcQLzv4hN3x7E+ZxRBUC7E65OQflHJ1QFBu9EjsyneA=; b=IYXCA+Qq0srZd8W/
 Gr5cu4JztxLjqahviDuzLw/UMH1r06QyVJXnLA7meKiGzKONoQJTaRa5cXhU8zyZ
 SB65Omow9QTnivFMQBNA+scQfOdurRX/DUlMMmQv09phBfC4cBVO3RE7hKK1MfiM
 a/n7/zA/HBSqdKx+Ueg5cyd0hRrBGuV/vipCulMkamviJkvBjodC6dbABYGPw1ho
 wHZw3+BldyoW+IF/a6sPPdUrCnvBe7ZcyiGQ3Cm11/9eok0U+uqTcIasbGHs6MAe
 vlJxGIObenLSZI9xAlUrOsFh5684oi/qvbH5mqjlTM3bnnXbJtF2JiFoV5XKtDPM
 rBcTFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajetn7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:29:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5f6eeb20eso187523111cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758623341; x=1759228141;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vcQLzv4hN3x7E+ZxRBUC7E65OQflHJ1QFBu9EjsyneA=;
 b=fOH5PQBGZ1XJd1GHxA+vPz5IovQ06BYbXH8qYT8/b5s/gtv5R74EZiS6+X4w7wS04A
 +UN2xjK0oANx6sYT9e3w8Pv7XLXY1pcPlnfFaCkqLM77rE+v7Z/ARhsRREEN4QLt3K1U
 WBKrBOspPx4DUQDneKoch9ESr3gFW6kEcNkous4JYbd+YLUPrSfYp0j8Rnv5rHOvR4MR
 ZAfaprzqZjcghokrFFrCO4xx6+lhNxG8MT4yQYtigVq5M21y43Plg6jNxKzuePy8p3ah
 cO1vInvw6dESHSHYlNJ4uRGCF3gEFnIUVbjNOTsA74hatpCgHDZ9P641LpsBoGX8WZ/b
 rwDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt5VlfOJdIM5ssFSHT9fVN6wPnOCEunrF4zUEI56n2PM/ptmcpXvXLpCEG/zXepXkX+ewGVLlVl0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN9V1VpzCP91anVWqhG+0ufwLPzS1t5+ydvjCTLRg7jg1xsuro
 +LyuqW3aX+Jr/Fv9aWvr0T3Ir9L6qmNjjOm7Wu5a2S4hxmmExO4mdaDo9dkL9kbBntPs1gFRCUZ
 dESYpCaBRx6UrLawhmfM179/sYy3DxABLferjQEGbRY5bkFXKWhBxb3kB8WEkjhpNTj0XhFg=
X-Gm-Gg: ASbGncs++DYCqqI1dD8/1MXK6thotFEBrkvDD8iTBTPSR32sY3xS68v+ET9PBKN+S2D
 6Tt8Ip4q65r7LbOH5ojIz0u0X37sE3YgJk0Qt9GBb66Lir+xtHHvQKKRgZcKHV5XCv6l3FLYXjG
 gAagu1KSWIRjRZdg8FpGJGYtpn9YkqKfhY7JCXGPXG6MYVlf4Hu1BPJY99V9wU3IJcJldiKh7wX
 8yO/JG340q75KHIgweSPGn/7zxVNK2+CScT9YenIvKyHhTdh4Tu0/qMz2MV6YDDZ24zIusyAWkl
 WhKjaG3/wRHIQKabnJ/rzPYK1iWQD3K7iJmg341Fb+mNHH2a/naSfCpmwQv1GNX8sNb+ljZUUan
 RbdYgBOxOQPK69BPOCeuMHtJue78st5BYI0dcL8DbSUZoyZOOWOKk
X-Received: by 2002:a05:622a:2590:b0:4b4:8f6b:d243 with SMTP id
 d75a77b69052e-4d36773dd7bmr19799441cf.7.1758623340891; 
 Tue, 23 Sep 2025 03:29:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdyNNd5NWlS3tfjYoQk1LprFDWXpjh2LHV0xGI85+jVgfKpzm2hdXkVtJbSIeE2eHrY+9ApA==
X-Received: by 2002:a05:622a:2590:b0:4b4:8f6b:d243 with SMTP id
 d75a77b69052e-4d36773dd7bmr19799151cf.7.1758623340251; 
 Tue, 23 Sep 2025 03:29:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57fcb8914b3sm901237e87.99.2025.09.23.03.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 03:28:59 -0700 (PDT)
Date: Tue, 23 Sep 2025 13:28:57 +0300
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
Message-ID: <osdt4teotc6qvja734dyo7be35nzy5lo4sw4dcniaqicqb3o5l@gabq5adeliha>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
 <03240fae-544f-4753-96c5-a116b4b5a318@suse.de>
 <20250915-active-placid-bustard-6e1faa@penduick>
 <2ry3txigq3jyivtyz7i4c76g74vdgvlozsjkeswxalhu2vs5yx@jqswyjle632h>
 <20250923-debonair-earwig-of-abracadabra-940fa8@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923-debonair-earwig-of-abracadabra-940fa8@penduick>
X-Proofpoint-GUID: Tp4Vb9inLmAhDNc777kD8ys6PAliyT62
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d2766e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=dLeCnL7T2w2gXzoZ4OcA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX0y9p/ERKFh+R
 2i97GBgpY3Dd2CltmvSJBvwfZOXz4UiPanBZvp7i0Tvs4zX13SOwwxmySzbSqyrxRMGUfuL+cw/
 S46f52bcgjC+jL2FL4MdR1H+86PInBe1UTMJykNdWnv6xIQXbE0GwREMWdq6cguG+PUNYxW/VZe
 haqy1Thi47TMuleHFhl8SR/LQZ7U8pZV4CtckUNvkmoJiRUYT9v0rgSrwAyXdt5nDiQe6ETkOPF
 JWS4a0QaDXn455wwUJ+HfqVeFAK05TgRyjuQwAg/3IZkj+onvW2MEsQRE6QhciGa5WYaRWEddxV
 0o4XisQJu8T64FL3gRJ6b44Fyt5xkkxzKRfvWzi0st5QidC1NHgcf373WTta/S1wzzzmIZUNLzP
 F2wDHFhY
X-Proofpoint-ORIG-GUID: Tp4Vb9inLmAhDNc777kD8ys6PAliyT62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168
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

On Tue, Sep 23, 2025 at 11:38:17AM +0200, Maxime Ripard wrote:
> On Mon, Sep 15, 2025 at 09:38:44PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Sep 15, 2025 at 10:42:22AM +0200, Maxime Ripard wrote:
> > > Hi Tohmas,
> > > 
> > > On Tue, Sep 02, 2025 at 03:44:54PM +0200, Thomas Zimmermann wrote:
> > > > > +/**
> > > > > + * drm_atomic_build_readout_state - Creates an initial state from the hardware
> > > > > + * @dev: DRM device to build the state for
> > > > > + *
> > > > > + * This function allocates a &struct drm_atomic_state, calls the
> > > > > + * atomic_readout_state callbacks, and fills the global state old states
> > > > > + * by what the callbacks returned.
> > > > > + *
> > > > > + * Returns:
> > > > > + *
> > > > > + * A partially initialized &struct drm_atomic_state on success, an error
> > > > > + * pointer otherwise.
> > > > > + */
> > > > > +static struct drm_atomic_state *
> > > > > +drm_atomic_build_readout_state(struct drm_device *dev)
> > > > > +{
> > > > > +	struct drm_connector_list_iter conn_iter;
> > > > > +	struct drm_atomic_state *state;
> > > > > +	struct drm_mode_config *config =
> > > > > +		&dev->mode_config;
> > > > > +	struct drm_connector *connector;
> > > > > +	struct drm_printer p =
> > > > > +		drm_info_printer(dev->dev);
> > > > > +	struct drm_encoder *encoder;
> > > > > +	struct drm_plane *plane;
> > > > > +	struct drm_crtc *crtc;
> > > > > +	int ret;
> > > > > +
> > > > > +	drm_dbg_kms(dev, "Starting to build atomic state from hardware state.\n");
> > > > > +
> > > > > +	state = drm_atomic_state_alloc(dev);
> > > > > +	if (WARN_ON(!state))
> > > > > +		return ERR_PTR(-ENOMEM);
> > > > > +
> > > > > +	state->connectors = kcalloc(config->num_connector, sizeof(*state->connectors), GFP_KERNEL);
> > > > > +	if (WARN_ON(!state->connectors)) {
> > > > > +		ret = -ENOMEM;
> > > > > +		goto err_state_put;
> > > > > +	}
> > > > > +
> > > > > +	state->private_objs = kcalloc(count_private_obj(dev), sizeof(*state->private_objs), GFP_KERNEL);
> > > > > +	if (WARN_ON(!state->private_objs)) {
> > > > > +		ret = -ENOMEM;
> > > > > +		goto err_state_put;
> > > > > +	}
> > > > > +
> > > > > +	drm_for_each_crtc(crtc, dev) {
> > > > > +		const struct drm_crtc_funcs *crtc_funcs =
> > > > > +			crtc->funcs;
> > > > > +		struct drm_crtc_state *crtc_state;
> > > > > +
> > > > > +		drm_dbg_kms(dev, "Initializing CRTC %s state.\n", crtc->name);
> > > > > +
> > > > > +		if (crtc_funcs->atomic_readout_state) {
> > > > > +			crtc_state = crtc_funcs->atomic_readout_state(crtc);
> > > > > +		} else if (crtc_funcs->reset) {
> > > > > +			crtc_funcs->reset(crtc);
> > > > > +
> > > > > +			/*
> > > > > +			 * We don't want to set crtc->state field yet. Let's save and clear it up.
> > > > > +			 */
> > > > > +			crtc_state = crtc->state;
> > > > > +			crtc->state = NULL;
> > > > 
> > > > Chancing the crtc->state pointer behind the back of the reset callback seems
> > > > fragile. We never how if some other piece of the driver refers to it
> > > > (although illegally).
> > > 
> > > I agree that it's clunky. I'm not sure who would use it at this point
> > > though: we're in the middle of the drm_mode_config_reset(), so the
> > > drivers' involvement is pretty minimal.
> > > 
> > > I did wonder if changing reset to return the object instead of setting
> > > $OBJECT->state would be a better interface?
> > > 
> > > > For now, wouldn't it be better to require a read-out helper for all elements
> > > > of the driver's mode-setting pipeline?  The trivial implementation would
> > > > copy the existing reset function and keep crtc->state to NULL.
> > > 
> > > I also considered that, but I'm not sure we can expect bridges to have
> > > readout hooks filled for every configuration in the wild.
> > > 
> > > But maybe we can look during drm_mode_config_reset() at whether all the
> > > objects have their hook filled, and if not fall back on reset for
> > > everything.
> > > 
> > > It would make the implementation easier, but missing bridges
> > > implementations would trigger a mode change when it might actually work
> > > just fine since bridge state is pretty minimal.
> > 
> > DP bridge drivers have a pretty big state (DPCD and all the features).
> 
> I meant drm_bridge_state. Subclasses would have their own implementation
> anyway.
> 
> > Other bridge drivers randomly leak state to the non-state structs.
> 
> I'm not sure what you mean by that though. Can you expand?

I think I've seen bridge drivers which stored subclassed drm_bridge
instead of drm_bridge_state or stored the data in the long-living data
structures. YEs, that's a bug, which should be fixed on its own.



-- 
With best wishes
Dmitry
