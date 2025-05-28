Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683AAAC6D82
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EEE10E2C3;
	Wed, 28 May 2025 16:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jATkvto2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CF910E2C3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:09:18 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S7gVn0007545
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0ebk4FuXKBEehQnwIzWbtceY
 5Eq5Hvk7/WPMviultPQ=; b=jATkvto2sObAkLZQpbEMzNj94YJNvCCQ5aSCVBDh
 XTcWBQ2FjoLXpexqv68kpBzYdad4VozIQcq3xnzDnh6oCeqRE8Cx37JVopqaGCqO
 2e7+CzGS4hS53+T6kLKboYju65mFsKpiovPevzTkySJTgNlZNKvX8jHhUERZMyDU
 wlvDVWhnuJ5fzjf03HI1Q4z3j9BX8326ajLkaGaemlnbNYlpSHbXua0nIeutZnFq
 9/aamuWTykZFzcQRz+i0Cs067IbHC+doHuMPO34fglInHZ9aFUBEm5H7MQH+x7tB
 DOe0PnSFAaOqW9g/u3KXCnXVfQ0qYOolg1U13yusYooq+A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g92t5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:09:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-30ea0e890ccso4239736a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748448556; x=1749053356;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ebk4FuXKBEehQnwIzWbtceY5Eq5Hvk7/WPMviultPQ=;
 b=FzxaL3eZivxwuJKHq4F97LAvtIHru11vgzTI5mXZotT+eK5mQG0iNm7YUT8m2KMpE4
 NJb1rz1KRfLzSK0QZz0/pvuHbR5y5avS5isuiKOjIKcxDRVKjEoSqtxFr1Xp8RHDCTgG
 ycqSaiCm0ChLEKZC4WiNLKXzqbkQ2lv6Nhv/1AJTZT3AfojYfmAe6ADlsaMdqboPy0OX
 tThELw7d/uke98lIh5C/ieC9JRdBF341Iolrda9C5qZZlDbD5hV8s/OxnsUmtvUdzK3x
 1xPkSg6yzwK8TQSAKywPvP2L8+kLpibx0FHM5EB9J2Rqwkwr1Kn7nBPOGRK/mphBX7DW
 uijg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+zNvYO3m5ZQH+WYGdXmAon8pd8ThYg5KIR5qL3fUlvJU8qDgigJocONloo06evRYfh8ljP2Qd130=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymMlWwlbwZ+zGqc9fwxNHzV+WfvkGh7aTIyUhDrIQGR4xm6ZvK
 gyQYm8AESAE0TO7a9qD5nHfC+kQ3/CIZldAlrbsbC08VBAUwWh2TNBwCaGAaQx0qQhI32ecaP6h
 S8Me7Wtxxb3Zc3lGIU1pl2pQQQyjh72FN6fMkIGVbgAITEZv+Bs+SmwG25dCyUoJahUV5MKGs5M
 MM2LOjPwf/SQ7V/YFpVNAaACjS0KPfheEcEtrzVPH/2JiSmg==
X-Gm-Gg: ASbGnct0iC6TsN3e6DLRNHenkDV6Z7LRv6D9cyh3kUd/raWbRiqmVu4ohB3cKYeKf0K
 wwzjSfsvpA8dXrjAYYekyw2j5FRVHKCyg9/WDbkt+/Gs9QQl0h/qiQx8RaUTmLjdegtWF7sJa/w
 pjremZuRWJ4WkqZXINdnfE9FM=
X-Received: by 2002:a17:90b:1fc8:b0:311:e8cc:4264 with SMTP id
 98e67ed59e1d1-311e8cc4409mr5694239a91.12.1748448556273; 
 Wed, 28 May 2025 09:09:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEyU9Na6w19P6vBrFWsatyjVSIe0mXXTuG1XS0eEc1904ZaykvV6ov/DP09T7xW5vDmnuTXfgVmAxcYzfANhw=
X-Received: by 2002:a17:90b:1fc8:b0:311:e8cc:4264 with SMTP id
 98e67ed59e1d1-311e8cc4409mr5694169a91.12.1748448555821; Wed, 28 May 2025
 09:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250527081447.304-1-kernel@airkyi.com>
 <e2dnvpbze4xuubggduqr3p5nnhg7huk3dnpdcb6tldxbrn2qtn@bfsewz5trfv3>
 <bc321a71-1934-4889-bd8e-3bb593c8feba@rock-chips.com>
In-Reply-To: <bc321a71-1934-4889-bd8e-3bb593c8feba@rock-chips.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 28 May 2025 19:09:04 +0300
X-Gm-Features: AX0GCFsUqNN07CMI1cNHp3U4iz8XhLlLFw-nWKQWlciyho8w9zoePiczSCHemug
Message-ID: <CAO9ioeXLSQyBFuedtt4=_OjEWZW6T9HaaYr8_NiNy2eh4yw-qg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/rockchip: cdn-dp: Convert to drm bridge
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6837352d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=ePr-TV-LAAAA:8 a=s8YR1HE3AAAA:8 a=RRhK3aCThXU4g2SLoiEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=uGDpjx9DKq9E8W49yboe:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: 9Tuxe0-Wl4gX3W-MDPr-Utayvkv-RrtF
X-Proofpoint-GUID: 9Tuxe0-Wl4gX3W-MDPr-Utayvkv-RrtF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfX0KzsNx9hP2MJ
 9nTz5uU0NCeJlBW0DpSCwJtPhnGlCoSyAaaOHK2Gzyz3ehIT+GC7XnIkMmw2UlY9PE/0EV2/0u9
 aC1bvRR1uhMNrNFSZDH40xS41o6H5C/YQclaAzBbimMfW0dBLjR0/RkFpPHN07dWkAztcykKjSy
 2F8isJ/a9UbjbBk6yzdFN/vQcNOa7+fR/vcCUY+JTE6+i41GqTIxrlrxrv5BN9RZYx/YxanRtaQ
 d1qYokeP5yPkhIBMPzAv2XzE4QuTiUF+pZ6DW6KGgi3MQPiOVXZlLoRhahTvS0BAQwOCEIooPRG
 DcU3vyRNsKnmUz6xbvYR9JAAtqq2I0hexxwGZ6wj9YwfMxOjP5HlIgAC2PWWsUiB6s897SdSYVz
 0qyY9d3X5ZmPqOoWjhpa0bzSYsHf/9XhGhK7Ex0KPgqWY9OiQxCIhnRS7Kkn7zX8Yj6nOmuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280141
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

On Wed, 28 May 2025 at 04:57, Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>
> Hi Dmitry,
>
> On 2025/5/28 4:25, Dmitry Baryshkov wrote:
> > On Tue, May 27, 2025 at 04:14:47PM +0800, Chaoyi Chen wrote:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> Convert it to drm bridge driver, it will be convenient for us to
> >> migrate the connector part to the display driver later.
> >> Considering that some code depend on the connector, the following
> >> changes have been made:
> >> - Only process edid in &drm_bridge_funcs.edid_read(), so no need to
> >> store additional edid info.
> >> - Now cdn_dp_get_sink_capability() only focused on reading DPCD_REV.
> >> - Update bpc info in cdn_dp_bridge_atomic_enable() instead of
> >> cdn_dp_encoder_mode_set(). Actually, the bpc data will be used in
> >> cdn_dp_bridge_atomic_enable().
> >> - Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers.
> >>
> >> This patch also convert to use devm_drm_bridge_alloc() API.
> >>
> >> Tested with RK3399 EVB IND board.
> >>
> >> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >> ---
> >>
> >> Changes in v3:
> >> - Link to V2: https://lore.kernel.org/all/20250523011310.120-1-kernel@airkyi.com/
> >> - Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers
> >> - Remove the dependency for connector
> >> - Remove the extra stored edid
> >> - Code cleanup
> >>
> >> Changes in v2:
> >> - Link to V1: https://lore.kernel.org/all/20250507035148.415-1-kernel@airkyi.com/
> >> - Use drm_atomic_get_new_connector_for_encoder() to get connector
> >> - Convert to use devm_drm_bridge_alloc() API
> >> - Fix typo: cdn_dp_connector_edid_read -> cdn_dp_bridge_edid_read
> >>
> >>   drivers/gpu/drm/rockchip/cdn-dp-core.c | 279 ++++++++++---------------
> >>   drivers/gpu/drm/rockchip/cdn-dp-core.h |   9 +-
> >>   2 files changed, 110 insertions(+), 178 deletions(-)
> >>
> >
> >> @@ -595,16 +546,41 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
> >>   static void cdn_dp_audio_handle_plugged_change(struct cdn_dp_device *dp,
> >>                                             bool plugged)
> >>   {
> >> -    if (dp->codec_dev)
> >> -            dp->plugged_cb(dp->codec_dev, plugged);
> >> +    if (dp->sink_has_audio)
> >> +            drm_connector_hdmi_audio_plugged_notify(dp->connector, plugged);
> > I'd say, notify always and let userspace figure it out via the ELD. Then
> > you shouldn't need sink_has_audio. This would match the behaviour of
> > HDMI drivers.
>
> Oh, I find that there are similar usages in qcom msm driver. Is there
> any more progress?

For msm driver it is required as DSP requires HDMI to be plugged for
the audio path to work.

>
>
> >
> >>   }
> >>
> > [...]
> >
> >> @@ -705,8 +681,6 @@ static int cdn_dp_encoder_atomic_check(struct drm_encoder *encoder,
> >>
> >>   static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
> >>      .mode_set = cdn_dp_encoder_mode_set,
> >> -    .enable = cdn_dp_encoder_enable,
> >> -    .disable = cdn_dp_encoder_disable,
> >>      .atomic_check = cdn_dp_encoder_atomic_check,
> > Nit: for the future cleanup, it should probably be possible to get rid
> > of these encoder ops too by moving them to the bridge ops.
>
> Interesting, have these patches been submitted upstream yet?

Everything is already there, see drm_bridge_funcs::mode_set() and
drm_bridge_funcs::atomic_check().


-- 
With best wishes
Dmitry
