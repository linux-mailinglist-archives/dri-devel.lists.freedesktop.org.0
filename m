Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C79A6195E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 19:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF5710E868;
	Fri, 14 Mar 2025 18:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hvx297HW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA14C10E868
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 18:28:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E9DJt3022814
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 18:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=77SlCTEuZzQGrUvy+p+yjSOQ
 D5z6SnrWUcEzDE7M/js=; b=Hvx297HWjmrdfv+CWxCf/w9brZcoil2p5lvk2MIN
 xXDxT4YCLN4vhUMPEYNEAlmhR+9IH0QSn6zCPrCM52jsd5j+KUV5L9PQfJcPzcqA
 WtoY0POjZDrwfEvyGKK6GM1bF85s0Avo5O6PDrrO8XQDFk/3qOumEKIJvopkF+9Y
 /w9f4bradCsO+x/AUbKCB7aIQsdfpBaGbwAbORsXde10p2RuJYCdWtjwGSFzQk8H
 L1NN4DiiVDnjmsREgkVr3OSwZyZt0TV8UonT2VlIWzFA4xncO1PDTeCRF1essw54
 JYRpWcDrglzLFAdHCU3L9XyOLOoOIfpBaotPxtgwn/EPQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45chmqsene-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 18:28:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c0b7ee195bso418284585a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 11:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741976908; x=1742581708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77SlCTEuZzQGrUvy+p+yjSOQD5z6SnrWUcEzDE7M/js=;
 b=rZ2+nHNwMz+pOIQ68OuEqMBMwcGwGpRGt9Ma/uH4vqYjIb//lttXlYS6xs0SlBh9DV
 cMogOEScC9lWweilj5ABqRa74toJolTIfWeuNJFCrUe1Y8mmI0611ttUDbtuHjxY3K/u
 wkTKe8BgRSEiHU5+B1OrXA/Tr29xoRdKSm6sH0mWJ1wEUY9PJ7/Nd3gPvjWr39tD2kjg
 ZDj+BDPMEH1X1pqgYMVbJ+iWlB/b6elTG8QfLRRmQpzG3SoFeWExPg5t7bup8S8r7Qhp
 eG49QswKigsgq03PwXvp4z0aiBQQAMsfv6S8lHD7vFIjOmwu8Bh4k+pSusyDSFVry8SR
 3Uvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Qp+KFZhFZYBcoJJBASdo0Jhgb0o4+m/ptdio8j0X6Vvn6aRI6zP9hxltZpx0r+9fQFl/R4gc0vA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIIHOyuBDZUNccs/sqtX+OalH9JHgowCT31sMZsesnBtgCrZVV
 lxCmCw5hzJuZGA+n6bJWiMraiZHTP4VSrK+MbzUrLkaiB+71enguGCSGrRxxQBaZtaDZBTVYEoO
 ffQJCKXhKTVHu7B+3cjgalh2+y4Dpel9h/KuVfURaKJ4OQpQw4g8wBClVbjRLOL2uXEY=
X-Gm-Gg: ASbGncvcugJWIKpdxEDJ/rZqnYbOCoj4suErLbnSEjFWrn8s5Sx7oY2rueWPXHVMvbg
 x/Bso81BaWch44AaJpSd+4xWuyRxYCJ/NUWJEVJ0f3PSVohGEUw8qAokKl9uzJ4pe6RMHGx/Fzg
 AGVshuOZePuWdgaVjkepX7qKgBVvC+tqygZSss0oUOplF+5l6IXprVi2QLtxwntJp2v6ZiI2U7z
 1eFSyNs09rMn97/jxABQOTS/tkfFxViG/mJChbZtqDJ3mULjOLP7dQrOJd4C6VNIABDWIboH3L2
 2ASUi4Fs20vrhoJPsWQdeYRBtfjm2l+DqFVdlrh1FGB8Dsk4W5MRHrCpXcnx8nHD+R2tNjwNB4M
 S7xk=
X-Received: by 2002:a05:620a:4706:b0:7c5:5909:18dc with SMTP id
 af79cd13be357-7c57c778293mr497821585a.14.1741976907731; 
 Fri, 14 Mar 2025 11:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0h8IOJ7RZc9gLRD/okAuLWAiF3FFBnJObQEwVZSv2v9bDdF6dLpNJNPQhuCBMW3JcO/JOng==
X-Received: by 2002:a05:620a:4706:b0:7c5:5909:18dc with SMTP id
 af79cd13be357-7c57c778293mr497818485a.14.1741976907325; 
 Fri, 14 Mar 2025 11:28:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0ea431sm6316801fa.38.2025.03.14.11.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 11:28:25 -0700 (PDT)
Date: Fri, 14 Mar 2025 20:28:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andy Yan <andyshrk@163.com>,
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, lumag@kernel.org
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
Message-ID: <2tfryn5plcqysdobavbjljnd3rq5ar2n2qmeyyryk6wqbx2zpk@qvqpkxe5ffjl>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-4-aacf461d2157@kernel.org>
 <5180089f.a640.19566290538.Coremail.andyshrk@163.com>
 <608c01c.7716.1958e8d879f.Coremail.andyshrk@163.com>
 <20250313-dazzling-deer-of-ampleness-21db67@houat>
 <6ae1c567.8c6.195922195d6.Coremail.andyshrk@163.com>
 <k2md4q2tgwsdynaeljieqlzjdds677wqqduimfyrgmvyfi732a@vh3dbg7kdaop>
 <20250314-courageous-bison-of-prestige-8b884b@houat>
 <lf4wu5v3wym3foqgimuulyzz2dmd2jezkj3otn7xm7xp77nast@azqmajrn45lw>
 <20250314-hissing-spirited-armadillo-dc9d3a@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-hissing-spirited-armadillo-dc9d3a@houat>
X-Proofpoint-ORIG-GUID: --2dKGH1egzR8oBY7oHA2Bpsl1k5gSgf
X-Proofpoint-GUID: --2dKGH1egzR8oBY7oHA2Bpsl1k5gSgf
X-Authority-Analysis: v=2.4 cv=d9P1yQjE c=1 sm=1 tr=0 ts=67d4754d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Byx-y9mGAAAA:8
 a=KKAkSRfTAAAA:8 a=OmCYDoi2QOHnqlVcfJMA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_07,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140144
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

On Fri, Mar 14, 2025 at 06:40:24PM +0100, Maxime Ripard wrote:
> On Fri, Mar 14, 2025 at 09:59:36AM +0200, Dmitry Baryshkov wrote:
> > On Fri, Mar 14, 2025 at 08:45:17AM +0100, Maxime Ripard wrote:
> > > On Fri, Mar 14, 2025 at 07:52:35AM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, Mar 14, 2025 at 08:50:29AM +0800, Andy Yan wrote:
> > > > > At 2025-03-13 19:55:33, "Maxime Ripard" <mripard@kernel.org> wrote:
> > > > > >Hi,
> > > > > >
> > > > > >On Thu, Mar 13, 2025 at 04:09:54PM +0800, Andy Yan wrote:
> > > > > >> At 2025-03-05 19:55:19, "Andy Yan" <andyshrk@163.com> wrote:
> > > > > >> >At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@kernel.org> wrote:
> > > > > >> >>With the bridges switching over to drm_bridge_connector, the direct
> > > > > >> >>association between a bridge driver and its connector was lost.
> > > > > >> >>
> > > > > >> >>This is mitigated for atomic bridge drivers by the fact you can access
> > > > > >> >>the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
> > > > > >> >>drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> > > > > >> >>
> > > > > >> >>This was also made easier by providing drm_atomic_state directly to all
> > > > > >> >>atomic hooks bridges can implement.
> > > > > >> >>
> > > > > >> >>However, bridge drivers don't have a way to access drm_atomic_state
> > > > > >> >>outside of the modeset path, like from the hotplug interrupt path or any
> > > > > >> >>interrupt handler.
> > > > > >> >>
> > > > > >> >>Let's introduce a function to retrieve the connector currently assigned
> > > > > >> >>to an encoder, without using drm_atomic_state, to make these drivers'
> > > > > >> >>life easier.
> > > > > >> >>
> > > > > >> >>Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > >> >>Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > >> >>Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > >> >>---
> > > > > >> >> drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
> > > > > >> >> include/drm/drm_atomic.h     |  3 +++
> > > > > >> >> 2 files changed, 48 insertions(+)
> > > > > >> >>
> > > > > >> >>diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > > > > >> >>index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b132590e78f8d41d48eb4da4bccf170ee236 100644
> > > > > >> >>--- a/drivers/gpu/drm/drm_atomic.c
> > > > > >> >>+++ b/drivers/gpu/drm/drm_atomic.c
> > > > > >> >>@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
> > > > > >> >> 
> > > > > >> >> 	return NULL;
> > > > > >> >> }
> > > > > >> >> EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
> > > > > >> >> 
> > > > > >> >>+/**
> > > > > >> >>+ * drm_atomic_get_connector_for_encoder - Get connector currently assigned to an encoder
> > > > > >> >>+ * @encoder: The encoder to find the connector of
> > > > > >> >>+ * @ctx: Modeset locking context
> > > > > >> >>+ *
> > > > > >> >>+ * This function finds and returns the connector currently assigned to
> > > > > >> >>+ * an @encoder.
> > > > > >> >>+ *
> > > > > >> >>+ * Returns:
> > > > > >> >>+ * The connector connected to @encoder, or an error pointer otherwise.
> > > > > >> >>+ * When the error is EDEADLK, a deadlock has been detected and the
> > > > > >> >>+ * sequence must be restarted.
> > > > > >> >>+ */
> > > > > >> >>+struct drm_connector *
> > > > > >> >>+drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
> > > > > >> >>+				     struct drm_modeset_acquire_ctx *ctx)
> > > > > >> >>+{
> > > > > >> >>+	struct drm_connector_list_iter conn_iter;
> > > > > >> >>+	struct drm_connector *out_connector = ERR_PTR(-EINVAL);
> > > > > >> >>+	struct drm_connector *connector;
> > > > > >> >>+	struct drm_device *dev = encoder->dev;
> > > > > >> >>+	int ret;
> > > > > >> >>+
> > > > > >> >>+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> > > > > >> >>+	if (ret)
> > > > > >> >>+		return ERR_PTR(ret);
> > > > > >> >
> > > > > >> >It seems that this will cause a deadlock when called from a  hotplug handling path,
> > > > > >> >I have a WIP DP diver[0],  which suggested by Dmitry to use this API from a 
> > > > > >> >&drm_bridge_funcs.detect callback to get the connector,  as detect is called by drm_helper_probe_detect,
> > > > > >> >which will hold connection_mutex first, so the deaklock happens:
> > > > > >> >
> > > > > >> >
> > > > > >> >drm_helper_probe_detect(struct drm_connector *connector,
> > > > > >> >                        struct drm_modeset_acquire_ctx *ctx,
> > > > > >> >                        bool force)
> > > > > >> >{
> > > > > >> >        const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> > > > > >> >        struct drm_device *dev = connector->dev;
> > > > > >> >        int ret;
> > > > > >> >
> > > > > >> >        if (!ctx)
> > > > > >> >                return drm_helper_probe_detect_ctx(connector, force);
> > > > > >> >
> > > > > >> >        ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> > > > > >> >        if (ret)
> > > > > >> >                return ret;
> > > > > >> >
> > > > > >> >        if (funcs->detect_ctx)
> > > > > >> >                ret = funcs->detect_ctx(connector, ctx, force);
> > > > > >> >        else if (connector->funcs->detect)
> > > > > >> >                ret = connector->funcs->detect(connector, force);
> > > > > >> >        else
> > > > > >> >                ret = connector_status_connected;
> > > > > >> >
> > > > > >> >        if (ret != connector->status)
> > > > > >> >                connector->epoch_counter += 1;
> > > > > >> >
> > > > > >> >So I wonder can we let drm_bridge_funcs.detect pass a connector for this case ?
> > > > > >> >
> > > > > >> >
> > > > > >> >
> > > > > >> >[0]https://lore.kernel.org/linux-rockchip/047EECFC-7E55-44EC-896F-13FE04333E4D@gmail.com/T/#m25bc53b79f5cc7bddfcb7aae5656f68df396f094
> > > > > >> >>+
> > > > > >> >>+	drm_connector_list_iter_begin(dev, &conn_iter);
> > > > > >> >>+	drm_for_each_connector_iter(connector, &conn_iter) {
> > > > > >> >>+		if (!connector->state)
> > > > > >> >>+			continue;
> > > > > >> >>+
> > > > > >> >>+		if (encoder == connector->state->best_encoder) {
> > > > > >> >>+			out_connector = connector;
> > > > > >> 
> > > > > >> 
> > > > > >> When try to use this patch in my bridge driver,  I found that the connector->state->best_encoder 
> > > > > >>  maybe NULL when   drm_bridge_funcs.detect or drm_bridge_funcs.detect_ctx is  called:
> > > > > >> 
> > > > > >> [   52.713030] Invalid return value -22 for connector detection
> > > > > >> [   52.713539] WARNING: CPU: 7 PID: 288 at drivers/gpu/drm/drm_probe_helper.c:602 drm_helper_probe_single_connector_modes+0x5e0/
> > > > > >> 0x63c
> > > > > >> [   52.714568] Modules linked in:
> > > > > >> 
> > > > > >> [   52.724546] Call trace:
> > > > > >> [   52.724762]  drm_helper_probe_single_connector_modes+0x5e0/0x63c (P)
> > > > > >> [   52.725319]  drm_mode_getconnector+0x2a4/0x488
> > > > > >> [   52.725711]  drm_ioctl_kernel+0xb4/0x11c
> > > > > >> [   52.726057]  drm_ioctl+0x22c/0x544
> > > > > >> [   52.726358]  __arm64_sys_ioctl+0xac/0xe0
> > > > > >> [   52.726706]  invoke_syscall+0x44/0x100
> > > > > >> [   52.727039]  el0_svc_common.constprop.0+0x3c/0xd4
> > > > > >> 
> > > > > >> This is because  best_encoder is set by set_best_encoder, which is called from
> > > > > >> drm_atomic_helper_check_modeset. When we call drm_mode_getconnector 
> > > > > >> for the first time, the functions mentioned above have not been called yet,
> > > > > >> then we can't match the encoder from connector->state->best_encoder for this case.
> > > > > >
> > > > > >As far as I'm concerned, it's by design. Encoders and connectors have
> > > > > >1:N relationship, and only once a connector has been enabled it has an
> > > > > >encoder.
> > > > > >
> > > > > >If the connector is disabled, there's no associated encoder.
> > > > > 
> > > > > Does this prove that this API is not suitable for my application scenario: 
> > > > > Get the connector in the bridge's .detect callback, so this means that I may
> > > > > still need to modify the bridge's connector callback so that it can pass the connector ?
> > > > 
> > > > I'd say, yes, please.
> > > 
> > > And I'd say no :)
> > 
> > Fair enough :-)
> > 
> > > There's no reason to deviate from the API other entities have here. It's
> > > just that the switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR hasn't been
> > > completely thought through and it's one of the part where it shows.
> > > 
> > > We have two alternative solutions: Either the driver creates the
> > > connector itself, since it doesn't seem to use any downstream bridge
> > > anyway, or we need a new bridge helper to find the connector on a bridge
> > > chain.
> > > 
> > > We have the iterator already, we just need a new accessor to retrieve
> > > the (optional) connector of a bridge, and if there's none, go to the
> > > next bridge and try again.
> > 
> > The problem is that there is no guarantee that the the created connector
> > is created for or linked to any bridge. For example, for msm driver I'm
> > waiting for several series to go in, but after that I plan to work on
> > moving connector creation to the generic code within the msm driver.
> > 
> > In other words, with DRM_BRIDGE_ATTACH_NO_CONNECTOR in place it is
> > perfectly legit not to have a bridge which has "connector of a bridge".
> > It is possible to create drm_bridge_connector on the drm_encoder's side
> > after the drm_bridge_attach() succeeds.
> 
> Sure, but then I'd expect detect and get_modes to only be called *after*
> that connector has been created, right?

Yes. But you can not get the connector by following bridge chain. Well,
unless you include encoder into the chain. If that's what you have had
in mind, then please excuse me, I didn't understand that from the
beginning.

But frankly speaking, I think it might be easier to pass down the
connector to the detect callback (as drm_connector_funcs.detect already
gets the connecor) rather than making bridge drivers go through the
chain to get the value that is already present in the caller function.

(For some other usecases I'd totally agree with you, especially if the
connector isn't already available on the caller side).

> Returning NULL in the case where we don't have a connector (yet?) in
> such a case would make total sense to me, just like we return NULL if
> the connector is disabled and doesn't have an encoder here.
> 
> Maxime



-- 
With best wishes
Dmitry
