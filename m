Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E9EA67C7C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 20:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8196910E4B9;
	Tue, 18 Mar 2025 19:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAox4kP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A8A10E4B9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 19:00:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAGuri028624
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 19:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/fa/zQzC3XYwGnrj2UgjhABI
 p77QSQtLxlQXEGwlhEY=; b=jAox4kP+FNjHuQwXW9/IxqPZWTGNmI3rStlmVfBk
 mKnXFXDNMDv6A38uzxkcotKzEV2GHuWuKPmpVZAIDOTVeFu5CzSd9z9h1TxuKlTt
 KPgABoGOU38tMb4eHyUtGGZwW9Pby2Yu7qnqOXXldgxqq4CVX9evUb2hEOzRhzj2
 MhUulsh4FNV3kEmhzefHze4+LKg92VRdy0M6jRESDc4ECNE7Nrw9csWd9DNIFjmW
 G5lbtCvieX1Iw80rbTgOvRdr7ujfVpBYrWYUSJmx0jboQLTauZvE+Q1ZLL2VMXGn
 HLOSzE7b0NWySs0hT59IAdDUq6/Hdt5cBl5H9eVFtvNy7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy19sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 19:00:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4767261982eso112501301cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742324436; x=1742929236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/fa/zQzC3XYwGnrj2UgjhABIp77QSQtLxlQXEGwlhEY=;
 b=BuKNxYGc0pxP/Llmr2n4EENFaskVre4j587V3KrexZYKlfEsEAi91x99DhF9X1BMRV
 gbiWuKSkuymTjKipIPfCtwfkzK45RcfxWrhTwV2LURGutvy0fKsm/+aMSaA5UHo/PEk9
 miwnJl0gcTH5AEkPNldAqQiYs4VeN0wf9mQJZC2KNd1wZ9zOS/fpcJQNfbZQnFjpYF4l
 My6jUuZ3QaCCXZSvZRgy8bimccwGZ052NxxsE4hvQDlI9Cdm2xA27QH5iJz7GX5swdRz
 yZt/O9tCWyjtpLJwZNysNbEYsW14EySjv/AbKzxW0O5IoV5hWOTpJjpmOKzDyWUu0BYg
 H6oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwQiexVGAFXIU0A1SxeoCOjDPnG8T0/O1nSdkWiNgB7dKBazwZHIBXFv/iDV/O7KSNe0NUSE+bFD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHJ7VEMJCtXY2xowkY17gNBbsK5lQ3vCNCc1Lwgfy6SzGRuPU3
 SVfLczRscB5hmiS1eHxJg/rwC+uRFEeX5VsUC0TPamC62yoAtMosWUFiqevDNcil6AzermSk4/U
 uuIm8gvnBuPKMuHtIX72skH4NgelefXbnycJqcKj8Mjjd3wRVM3ZIveua2fUfJ8hLXyE=
X-Gm-Gg: ASbGnct2DsvkF2puo2WAy4GHNB3qXjNhODy865qhEt79IoVijKG09u+TCRwSaeL76ze
 2aTONgW4I353uta+f6PTF7/P98UDwJ/gPhSzHLfbekDjcn78cbuKClhrJBk6rsQn+Ifrzo+ZA5p
 lDbpnMZXluWmgNpvZRJqEw8BKBT+yfyHT0MgE0Kx98kJop4cy2f6q5qRT6Hz2Qo1xh7fOqKmOg9
 cbNgz7KFdiUZfqlGO873VWtYHVz2B5uCKYXlsGwwvlTWRSqzvYh0tg5n1QKLAvXlZWGI+aDR8X+
 Oshhhuz+32QJfWs9UoLl6ddjw73UKQ5U4upSkNR4Ad76FHm0Iaz4hD9goWGjMB+yxfdHB3mo7OZ
 bMEg=
X-Received: by 2002:a05:622a:4ccc:b0:476:85d9:5ec0 with SMTP id
 d75a77b69052e-47708195668mr1537321cf.0.1742324435509; 
 Tue, 18 Mar 2025 12:00:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjrV/vhKsJE6xbGbalWDdinB3bZhzXd7T0vraSvIvXRw4sJbwSLXGZsvwqyif0eZD6GIYOuQ==
X-Received: by 2002:a05:622a:4ccc:b0:476:85d9:5ec0 with SMTP id
 d75a77b69052e-47708195668mr1536831cf.0.1742324435050; 
 Tue, 18 Mar 2025 12:00:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba86507csm1753548e87.120.2025.03.18.12.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 12:00:33 -0700 (PDT)
Date: Tue, 18 Mar 2025 21:00:29 +0200
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
Message-ID: <lsbzit4765y6jrw7jmbpfb6rixidenpndjwgw2yx57rz2espux@hbfco2ht6vwi>
References: <5180089f.a640.19566290538.Coremail.andyshrk@163.com>
 <608c01c.7716.1958e8d879f.Coremail.andyshrk@163.com>
 <20250313-dazzling-deer-of-ampleness-21db67@houat>
 <6ae1c567.8c6.195922195d6.Coremail.andyshrk@163.com>
 <k2md4q2tgwsdynaeljieqlzjdds677wqqduimfyrgmvyfi732a@vh3dbg7kdaop>
 <20250314-courageous-bison-of-prestige-8b884b@houat>
 <lf4wu5v3wym3foqgimuulyzz2dmd2jezkj3otn7xm7xp77nast@azqmajrn45lw>
 <20250314-hissing-spirited-armadillo-dc9d3a@houat>
 <2tfryn5plcqysdobavbjljnd3rq5ar2n2qmeyyryk6wqbx2zpk@qvqpkxe5ffjl>
 <20250318-active-giraffe-of-memory-e0c66d@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-active-giraffe-of-memory-e0c66d@houat>
X-Proofpoint-GUID: AgJvQqpQ-wQvaU5XvIQKgZRg9Y8honUF
X-Proofpoint-ORIG-GUID: AgJvQqpQ-wQvaU5XvIQKgZRg9Y8honUF
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d9c2d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Byx-y9mGAAAA:8
 a=KKAkSRfTAAAA:8 a=VxP10FUge1u--hFDBm8A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180137
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

On Tue, Mar 18, 2025 at 04:51:19PM +0100, Maxime Ripard wrote:
> On Fri, Mar 14, 2025 at 08:28:22PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Mar 14, 2025 at 06:40:24PM +0100, Maxime Ripard wrote:
> > > On Fri, Mar 14, 2025 at 09:59:36AM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, Mar 14, 2025 at 08:45:17AM +0100, Maxime Ripard wrote:
> > > > > On Fri, Mar 14, 2025 at 07:52:35AM +0200, Dmitry Baryshkov wrote:
> > > > > > On Fri, Mar 14, 2025 at 08:50:29AM +0800, Andy Yan wrote:
> > > > > > > At 2025-03-13 19:55:33, "Maxime Ripard" <mripard@kernel.org> wrote:
> > > > > > > >Hi,
> > > > > > > >
> > > > > > > >On Thu, Mar 13, 2025 at 04:09:54PM +0800, Andy Yan wrote:
> > > > > > > >> At 2025-03-05 19:55:19, "Andy Yan" <andyshrk@163.com> wrote:
> > > > > > > >> >At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@kernel.org> wrote:
> > > > > > > >> >>With the bridges switching over to drm_bridge_connector, the direct
> > > > > > > >> >>association between a bridge driver and its connector was lost.
> > > > > > > >> >>
> > > > > > > >> >>This is mitigated for atomic bridge drivers by the fact you can access
> > > > > > > >> >>the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
> > > > > > > >> >>drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> > > > > > > >> >>
> > > > > > > >> >>This was also made easier by providing drm_atomic_state directly to all
> > > > > > > >> >>atomic hooks bridges can implement.
> > > > > > > >> >>
> > > > > > > >> >>However, bridge drivers don't have a way to access drm_atomic_state
> > > > > > > >> >>outside of the modeset path, like from the hotplug interrupt path or any
> > > > > > > >> >>interrupt handler.
> > > > > > > >> >>
> > > > > > > >> >>Let's introduce a function to retrieve the connector currently assigned
> > > > > > > >> >>to an encoder, without using drm_atomic_state, to make these drivers'
> > > > > > > >> >>life easier.
> > > > > > > >> >>
> > > > > > > >> >>Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > >> >>Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > > > >> >>Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > > > >> >>---
> > > > > > > >> >> drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
> > > > > > > >> >> include/drm/drm_atomic.h     |  3 +++
> > > > > > > >> >> 2 files changed, 48 insertions(+)
> > > > > > > >> >>
> > > > > > > >> >>diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > > > > > > >> >>index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b132590e78f8d41d48eb4da4bccf170ee236 100644
> > > > > > > >> >>--- a/drivers/gpu/drm/drm_atomic.c
> > > > > > > >> >>+++ b/drivers/gpu/drm/drm_atomic.c
> > > > > > > >> >>@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
> > > > > > > >> >> 
> > > > > > > >> >> 	return NULL;
> > > > > > > >> >> }
> > > > > > > >> >> EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
> > > > > > > >> >> 
> > > > > > > >> >>+/**
> > > > > > > >> >>+ * drm_atomic_get_connector_for_encoder - Get connector currently assigned to an encoder
> > > > > > > >> >>+ * @encoder: The encoder to find the connector of
> > > > > > > >> >>+ * @ctx: Modeset locking context
> > > > > > > >> >>+ *
> > > > > > > >> >>+ * This function finds and returns the connector currently assigned to
> > > > > > > >> >>+ * an @encoder.
> > > > > > > >> >>+ *
> > > > > > > >> >>+ * Returns:
> > > > > > > >> >>+ * The connector connected to @encoder, or an error pointer otherwise.
> > > > > > > >> >>+ * When the error is EDEADLK, a deadlock has been detected and the
> > > > > > > >> >>+ * sequence must be restarted.
> > > > > > > >> >>+ */
> > > > > > > >> >>+struct drm_connector *
> > > > > > > >> >>+drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
> > > > > > > >> >>+				     struct drm_modeset_acquire_ctx *ctx)
> > > > > > > >> >>+{
> > > > > > > >> >>+	struct drm_connector_list_iter conn_iter;
> > > > > > > >> >>+	struct drm_connector *out_connector = ERR_PTR(-EINVAL);
> > > > > > > >> >>+	struct drm_connector *connector;
> > > > > > > >> >>+	struct drm_device *dev = encoder->dev;
> > > > > > > >> >>+	int ret;
> > > > > > > >> >>+
> > > > > > > >> >>+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> > > > > > > >> >>+	if (ret)
> > > > > > > >> >>+		return ERR_PTR(ret);
> > > > > > > >> >
> > > > > > > >> >It seems that this will cause a deadlock when called from a  hotplug handling path,
> > > > > > > >> >I have a WIP DP diver[0],  which suggested by Dmitry to use this API from a 
> > > > > > > >> >&drm_bridge_funcs.detect callback to get the connector,  as detect is called by drm_helper_probe_detect,
> > > > > > > >> >which will hold connection_mutex first, so the deaklock happens:
> > > > > > > >> >
> > > > > > > >> >
> > > > > > > >> >drm_helper_probe_detect(struct drm_connector *connector,
> > > > > > > >> >                        struct drm_modeset_acquire_ctx *ctx,
> > > > > > > >> >                        bool force)
> > > > > > > >> >{
> > > > > > > >> >        const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> > > > > > > >> >        struct drm_device *dev = connector->dev;
> > > > > > > >> >        int ret;
> > > > > > > >> >
> > > > > > > >> >        if (!ctx)
> > > > > > > >> >                return drm_helper_probe_detect_ctx(connector, force);
> > > > > > > >> >
> > > > > > > >> >        ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> > > > > > > >> >        if (ret)
> > > > > > > >> >                return ret;
> > > > > > > >> >
> > > > > > > >> >        if (funcs->detect_ctx)
> > > > > > > >> >                ret = funcs->detect_ctx(connector, ctx, force);
> > > > > > > >> >        else if (connector->funcs->detect)
> > > > > > > >> >                ret = connector->funcs->detect(connector, force);
> > > > > > > >> >        else
> > > > > > > >> >                ret = connector_status_connected;
> > > > > > > >> >
> > > > > > > >> >        if (ret != connector->status)
> > > > > > > >> >                connector->epoch_counter += 1;
> > > > > > > >> >
> > > > > > > >> >So I wonder can we let drm_bridge_funcs.detect pass a connector for this case ?
> > > > > > > >> >
> > > > > > > >> >
> > > > > > > >> >
> > > > > > > >> >[0]https://lore.kernel.org/linux-rockchip/047EECFC-7E55-44EC-896F-13FE04333E4D@gmail.com/T/#m25bc53b79f5cc7bddfcb7aae5656f68df396f094
> > > > > > > >> >>+
> > > > > > > >> >>+	drm_connector_list_iter_begin(dev, &conn_iter);
> > > > > > > >> >>+	drm_for_each_connector_iter(connector, &conn_iter) {
> > > > > > > >> >>+		if (!connector->state)
> > > > > > > >> >>+			continue;
> > > > > > > >> >>+
> > > > > > > >> >>+		if (encoder == connector->state->best_encoder) {
> > > > > > > >> >>+			out_connector = connector;
> > > > > > > >> 
> > > > > > > >> 
> > > > > > > >> When try to use this patch in my bridge driver,  I found that the connector->state->best_encoder 
> > > > > > > >>  maybe NULL when   drm_bridge_funcs.detect or drm_bridge_funcs.detect_ctx is  called:
> > > > > > > >> 
> > > > > > > >> [   52.713030] Invalid return value -22 for connector detection
> > > > > > > >> [   52.713539] WARNING: CPU: 7 PID: 288 at drivers/gpu/drm/drm_probe_helper.c:602 drm_helper_probe_single_connector_modes+0x5e0/
> > > > > > > >> 0x63c
> > > > > > > >> [   52.714568] Modules linked in:
> > > > > > > >> 
> > > > > > > >> [   52.724546] Call trace:
> > > > > > > >> [   52.724762]  drm_helper_probe_single_connector_modes+0x5e0/0x63c (P)
> > > > > > > >> [   52.725319]  drm_mode_getconnector+0x2a4/0x488
> > > > > > > >> [   52.725711]  drm_ioctl_kernel+0xb4/0x11c
> > > > > > > >> [   52.726057]  drm_ioctl+0x22c/0x544
> > > > > > > >> [   52.726358]  __arm64_sys_ioctl+0xac/0xe0
> > > > > > > >> [   52.726706]  invoke_syscall+0x44/0x100
> > > > > > > >> [   52.727039]  el0_svc_common.constprop.0+0x3c/0xd4
> > > > > > > >> 
> > > > > > > >> This is because  best_encoder is set by set_best_encoder, which is called from
> > > > > > > >> drm_atomic_helper_check_modeset. When we call drm_mode_getconnector 
> > > > > > > >> for the first time, the functions mentioned above have not been called yet,
> > > > > > > >> then we can't match the encoder from connector->state->best_encoder for this case.
> > > > > > > >
> > > > > > > >As far as I'm concerned, it's by design. Encoders and connectors have
> > > > > > > >1:N relationship, and only once a connector has been enabled it has an
> > > > > > > >encoder.
> > > > > > > >
> > > > > > > >If the connector is disabled, there's no associated encoder.
> > > > > > > 
> > > > > > > Does this prove that this API is not suitable for my application scenario: 
> > > > > > > Get the connector in the bridge's .detect callback, so this means that I may
> > > > > > > still need to modify the bridge's connector callback so that it can pass the connector ?
> > > > > > 
> > > > > > I'd say, yes, please.
> > > > > 
> > > > > And I'd say no :)
> > > > 
> > > > Fair enough :-)
> > > > 
> > > > > There's no reason to deviate from the API other entities have here. It's
> > > > > just that the switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR hasn't been
> > > > > completely thought through and it's one of the part where it shows.
> > > > > 
> > > > > We have two alternative solutions: Either the driver creates the
> > > > > connector itself, since it doesn't seem to use any downstream bridge
> > > > > anyway, or we need a new bridge helper to find the connector on a bridge
> > > > > chain.
> > > > > 
> > > > > We have the iterator already, we just need a new accessor to retrieve
> > > > > the (optional) connector of a bridge, and if there's none, go to the
> > > > > next bridge and try again.
> > > > 
> > > > The problem is that there is no guarantee that the the created connector
> > > > is created for or linked to any bridge. For example, for msm driver I'm
> > > > waiting for several series to go in, but after that I plan to work on
> > > > moving connector creation to the generic code within the msm driver.
> > > > 
> > > > In other words, with DRM_BRIDGE_ATTACH_NO_CONNECTOR in place it is
> > > > perfectly legit not to have a bridge which has "connector of a bridge".
> > > > It is possible to create drm_bridge_connector on the drm_encoder's side
> > > > after the drm_bridge_attach() succeeds.
> > > 
> > > Sure, but then I'd expect detect and get_modes to only be called *after*
> > > that connector has been created, right?
> > 
> > Yes. But you can not get the connector by following bridge chain. Well,
> > unless you include encoder into the chain. If that's what you have had
> > in mind, then please excuse me, I didn't understand that from the
> > beginning.
> 
> You can't include the encoder either, because the encoder doesn't have a
> connector assigned yet at that time.
> 
> However, you can:
> 
>   - Store the bridge attach flags in drm_bridge
> 
>   - Create a hook that returns the connector a bridge creates, depending
>     on the attach flags.
> 
>   - Create a helper that iterates over the next bridges until the
>     previous hook returns !NULL. If it doesn't find anything, return
>     NULL.
> 
> AFAIK, it solves all the problems being discussed here, while dealing
> with legacy and new-style bridge drivers.

I'm still fail to understand how does that solve the issue for new-style
bridges. How do we find the created drm_bridge_connector for them?

> 
> > But frankly speaking, I think it might be easier to pass down the
> > connector to the detect callback (as drm_connector_funcs.detect already
> > gets the connecor) rather than making bridge drivers go through the
> > chain to get the value that is already present in the caller function.
> > 
> > (For some other usecases I'd totally agree with you, especially if the
> > connector isn't already available on the caller side).
> 
> Still, we've tried to converge to the same API for all entities, it
> feels like a step backward to me.

I'd argue here a bit. The drm_connector interface has connector here.
drm_bridge is an extension/subpart of the drm_connector, so it would be
logical to extend that interface.


-- 
With best wishes
Dmitry
