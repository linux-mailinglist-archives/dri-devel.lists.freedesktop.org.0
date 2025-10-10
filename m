Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE96FBCCF33
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 14:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365A810EBF6;
	Fri, 10 Oct 2025 12:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJ6CoIt9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE0610EBF6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 12:43:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6Wi0C009942
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 12:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VNsUbT10s5zSfVe/NID+AupK44Pimf1cna/+6kSnqDA=; b=VJ6CoIt95oBJ80un
 2gMnh/GiQqHK97PV63qSektfmunXEeLtZZ12JITb+nGjrCeiA6CSo00VxOiRUBVM
 PZNq7xieoiKe3XKvYIPVK8NgJbZ90ZvVYUVeCJsjULHQArMP1TOHURivkT7Wt170
 B/vM2wNagv20ShNkRKLKExcvNL3pZS7iLggZMjf74RLRr7oJxHGU4+/qG/+KW5Uv
 kGDkYD2KO2ieu6qrOSzO708popFfV1xpgShF5/eFDgj2ZDz6ScjAQtPH/cKTfZ/Z
 Tr5ikGxlPTAGH/9V+DB3jjS/yAIXl2aeGF25DjTA57F+En0cVJAC73oxwxAb74Ie
 HsYqnw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nxe66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 12:43:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e6e51d9dd9so82040771cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 05:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760100184; x=1760704984;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VNsUbT10s5zSfVe/NID+AupK44Pimf1cna/+6kSnqDA=;
 b=fL7WBpVtutq/KkqsOn/OdfZWFZCmtc8Er8ueIhCLN9VKxqCvaXt+NR2FW5ObqqlYZl
 ADrSU4JQ96d5GhQKBQqVuxjfum59VeMw1mZrrn021EfcuW7MFjCvxjBVhG7wl8W0YlZW
 R/Rl8Skk0fzG7ZXnIPaKVRtTijAVx1b2TdovS2ZHPYAbZ6zuovgN+Q8cxjrMYwBXzrjt
 WR97U6Br5cRY4lMTyF5YQxCBjtOsx7e1cBjzZXPz3uGqYVldCEAgK1nphPSqzBzlwGvQ
 g7be3h7oOkRJAuJca/hOzXHrRpYwYm8z6aLVvLfgug/sHCigM3avhVHPGqDgL2SJ5fyu
 7Ykw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsHT3G4554JNRbyc0PYpfiOmXrEkkmyrDrZZgkZyec/0+8+mnIlskp45kyuPWKLYsaQSMv6izzm1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy63YRvomjqj330f4ikjum4bfuCEZxzwpy6o79SjgzsFhPKEdaD
 4YsnmWNXUEzCUOruTgqvtz6mwwwpUBtlwyDjHZuSwno6VULjPXIXk2oE3rrJicWuD2mwTmYccoi
 m1jgeSIQZ5W3BHvOeGdxIj1vahk8qCMssedTZOMYD4o7bxZ+jWzG5bhizzTkM4zCkINHpdwc=
X-Gm-Gg: ASbGncvQT8TGGHjRM84gGHH3O6Fsr33GHB2ZqsI9DCB+wlWfjQrRAS+WhWL6hqHVzkA
 MbWQRAtpvaVUdkLas5fF9dertZ2QMSQCIzEsDOVBF5037bQXKhpaGbcQ8UHgGihBGFnGn5Ig6iz
 5tofI0wDatVjOlCyVJldx3aMCnFAaFXBbTeH+rSbmhaUgRul1RZamHh3Xgcb0bxKp3qEDu507G8
 FV5oCm4utWsOon1tx6YIemBlbYhheAl93BWnVOFvezIW8PzzN0P2ypEc4csGHOODWwDqQwE4+hH
 uNdayeEiCmDNQP6KKEjdPq/nCCtP55RlQm18lrSSHYyMphUKchdVqiJZ24WdSCIwIvuPyS4EFaL
 fNGXoHqyOpcm9wUxuT3Y/FmkvGElB31tfre2j2MP3vLXNP+RU9R2o
X-Received: by 2002:ac8:7d0a:0:b0:4e4:beb1:73d4 with SMTP id
 d75a77b69052e-4e6eacf551amr173804501cf.31.1760100183546; 
 Fri, 10 Oct 2025 05:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1ZudeCrHVqgLFSFdYWiioumPJG3NkOroOV8K0GCBnWR2pTMVmS9VaAdEuh0dVymq3W77cGA==
X-Received: by 2002:ac8:7d0a:0:b0:4e4:beb1:73d4 with SMTP id
 d75a77b69052e-4e6eacf551amr173804061cf.31.1760100183037; 
 Fri, 10 Oct 2025 05:43:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762ea3aafasm6103321fa.49.2025.10.10.05.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 05:43:02 -0700 (PDT)
Date: Fri, 10 Oct 2025 15:43:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix connector status detection
 for bridges
Message-ID: <wzeleliof47ogogxqrlwswfbnvummoydtegpgwf463k5ve3uue@tpemjilgagpl>
References: <20251009193028.4952-1-heiko@sntech.de>
 <v6aqic6kffc3x42dkb4bika5tvoqdpmmloroqio2656g74pkws@7fe3bsfzbasn>
 <3572997.QJadu78ljV@diego>
 <b47c5579-511e-4831-b86e-48ad4cefaa6c@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b47c5579-511e-4831-b86e-48ad4cefaa6c@rock-chips.com>
X-Proofpoint-ORIG-GUID: 0_t4UKwRhwqy7pf2xaNILb1idvF4SwqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2BHn3kYZkMBf
 kSWkgu8YWOWwfBDZmNq3b8yS0tHJj9sQd6WPb1fsYJM8czPN5xmcll+IMnGIc6Vqo8+u8g1qXt/
 3IYmfEq+Zr01wNs3KSyj9j4LjUpZGPtBf6Q0MGoxobaVsLw0/kn8tPYQpkjxPt8Uv/HHVOyu/1N
 kjNxQvNNiPgE6gGnT+6jsRMq1FLh55h7P03vacXScNaVNTK7hNkLoaHAG/cAQ6Z84l/d/XQyLRH
 hFDnTyi9lOAe0PlZR84b4vR/gLjCtrypnPINOy0gGIRD2cNhvtHYTZoeNhjNTTBTO06+s2GwnpF
 AN07vyoe9GuUB8Xhv0lEGRwKVZ9NkBskPRQ1WfEkBkmBuZn2RSIM6JAJRrE9VJr6P7bnwbws/mY
 QmFQ8HEmNM852prc+Iq0/HdYp1xv9g==
X-Proofpoint-GUID: 0_t4UKwRhwqy7pf2xaNILb1idvF4SwqS
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e8ff58 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=s8YR1HE3AAAA:8
 a=V7SD_xnUNx52fGP0aLEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Fri, Oct 10, 2025 at 12:02:43PM +0800, Damon Ding wrote:
> Hi,
> 
> On 10/10/2025 7:42 AM, Heiko Stübner wrote:
> > Hi Dmitry,
> > 
> > Am Freitag, 10. Oktober 2025, 00:30:11 Mitteleuropäische Sommerzeit schrieb Dmitry Baryshkov:
> > > On Thu, Oct 09, 2025 at 09:30:28PM +0200, Heiko Stuebner wrote:
> > > > Right now if there is a next bridge attached to the analogix-dp controller
> > > > the driver always assumes this bridge is connected to something, but this
> > > > is of course not always true, as that bridge could also be a hotpluggable
> > > > dp port for example.
> > > > 
> > > > On the other hand, as stated in commit cb640b2ca546 ("drm/bridge: display-
> > > > connector: don't set OP_DETECT for DisplayPorts"), "Detecting the monitor
> > > > for DisplayPort targets is more complicated than just reading the HPD pin
> > > > level" and we should be "letting the actual DP driver perform detection."
> > > > 
> > > > So use drm_bridge_detect() to detect the next bridge's state but ignore
> > > > that bridge if the analogix-dp is handling the hpd-gpio.
> > > > 
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > ---
> > > > As this patch stands, it would go on top of v6 of Damon's bridge-connector
> > > > work, but could very well be also integrated into one of the changes there.
> > > > 
> > > > I don't know yet if my ordering and/or reasoning is the correct one or if
> > > > a better handling could be done, but with that change I do get a nice
> > > > hotplug behaviour on my rk3588-tiger-dp-carrier board, where the
> > > > Analogix-DP ends in a full size DP port.
> > > > 
> > > >   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++++--
> > > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > > index c04b5829712b..cdc56e83b576 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > > @@ -983,8 +983,12 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
> > > >   	struct analogix_dp_device *dp = to_dp(bridge);
> > > >   	enum drm_connector_status status = connector_status_disconnected;
> > > > -	if (dp->plat_data->next_bridge)
> > > > -		return connector_status_connected;
> > > > +	/*
> > > > +	 * An optional next bridge should be in charge of detection the
> > > > +	 * connection status, except if we manage a actual hpd gpio.
> > > > +	 */
> > > > +	if (dp->plat_data->next_bridge && !dp->hpd_gpiod)
> > > > +		return drm_bridge_detect(dp->plat_data->next_bridge, connector);
> 
> I have tried to use the drm_bridge_detect() API to do this as simple-bridge
> driver, but it does not work well for bridges that do not declare OP_DETECT.
> 
> Take nxp-ptn3460 as an example, the connected status will be treated as
> connector_status_unknown via the following call stack:
> 
> drm_helper_probe_single_connector_modes()
>   -> drm_helper_probe_detect()
>      -> drm_bridge_connector_detect()
>         -> analogix_dp_bridge_detect()
>            -> drm_bridge_detect()
>               -> return connector_status_unknown due to !OP_DETECT
> 
> However, the connected status will be connector_status_connected as expected
> if Analogix DP does not declare OP_DETECT[0]:
> 
> drm_helper_probe_single_connector_modes()
>   -> drm_helper_probe_detect()
>      -> drm_bridge_connector_detect()
>         -> return connector_status_connected due to CONNECTOR_LVDS
> 
> Base on Andy's commit 5d156a9c3d5e ("drm/bridge: Pass down connector to drm
> bridge detect hook"), the drm_connector becomes available in
> drm_bridge_detect().
> 
> It may be better to unify the logic of drm_bridge_detect() and
> drm_bridge_connector_detect(), which sets the connected status according to
> the connector_type. Then the codes will be more reasonable and become
> similar to the simple-bridge demo via
> 'drm_bridge_detect(dp->plat_data->next_bridge, connector)'.

I'm not sure, what you are trying to achieve here. The
drm_bridge_connector should handle the OP_DETECT and use the last bridge
in the chain that supports detection.

Note: OP_HPD and OP_DETECT are not that tightly connected, especially
for DP bridges. It is fine to have a later bridge which generates HPD
events, while Analogix DP bridge responds to .hpd_notify() events and
performs its duties.

For example, it's perfectly fine to have dp-connector with the HPD GPIO
pin routed to the connector (in which case it will declare OP_HPD). But
the Analogix bridge should perform actual detection. Normally this is
handled by reading DPCD and ensuring that there is an actual connected
device (i.e. either a non-branch device or a branch with at least 1
sink).

> 
> But we still need a specific check for DP-connector to resolve this issue.
> The '!dp->hpd_gpiod' may not be well-considered. Perhaps we could introduce
> a new API, similar to drm_bridge_is_panel(), called
> drm_bridge_is_display_connector()?
> 
> > > 
> > > And it's also not correct because the next bridge might be a retimer
> > > with the bridge next to it being a one with the actual detection
> > > capabilities. drm_bridge_connector solves that in a much better way. See
> > > the series at [1]
> > > 
> > > [1] https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com/
> > 
> > Hence my comment above about that possibly not being the right variant.
> > Sort of asking for direction :-) .
> > 
> > I am working on top of Damon's drm-bridge-connector series as noted above,
> > but it looks like the detect function still is called at does then stuff.
> > 
> > My board is the rk3588-tiger-displayport-carrier [0], with a dp-connector
> > which is the next bridge, so _without_ any changes, the analogix-dp
> > always assumes "something" is connected and I end up with
> > 
> > [    9.869198] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> > [    9.980422] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> > [   10.091522] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> > [   10.202419] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> > [   10.313651] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> > 
> > when no display is connected.
> > 
> > With this change I do get the expected hotplug behaviour, so something is
> > missing still even with the bridge-connector series.
> > 
> > 
> > Heiko
> > 
> > 
> > [0] v3: https://lore.kernel.org/r/20250812083217.1064185-3-heiko@sntech.de
> >      v4: https://lore.kernel.org/r/20251009225050.88192-3-heiko@sntech.de
> >      (moved hpd-gpios from dp-connector back to analogix-dp per dp-connector
> >      being not able to detect dp-monitors)
> > > 
> > > >   	if (!analogix_dp_detect_hpd(dp))
> > > >   		status = connector_status_connected;
> > > 
> > > 
> > 
> > 
> 
> I see... There is also a way to leave the connected status check in Analogix
> DP bridge:
> 
> 1.If the later bridge does not support HPD function, the 'force-hpd'
> property must be set under the DP DT node. The DT modifications may be
> large by this way.

Well... The drivers should continue to work with old DTs, if they did so
before.

> 2.If the later bridge do support HPD function like the DP-connector, the
> connected status detection method is GPIO HPD or functional pin HPD.

dp-connector should set OP_HPD
analogix-dp should set OP_DETECT

> 
> With the DT modifications for above 1, the analogix_dp_bridge_detect() can
> be simplified to:
> 
> static enum drm_connector_status
> analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector
> *connector)
> {
> 	struct analogix_dp_device *dp = to_dp(bridge);
> 	enum drm_connector_status status = connector_status_disconnected;
> 
> 	if (!analogix_dp_detect_hpd(dp))
> 		status = connector_status_connected;
> 
> 	return status;
> }
> 
> Best regards,
> Damon
> 
> [0]https://lore.kernel.org/all/22a5119c-01da-4a7a-bafb-f657b1552a56@rock-chips.com/
> 

-- 
With best wishes
Dmitry
