Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97675ADB456
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 16:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0C510E3C4;
	Mon, 16 Jun 2025 14:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYEVmbIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4483410E3C4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 14:47:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8ooVi030300
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 14:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QH0J2l9uHSJZCOh4wtepSQeUNDV1jSsRvpZ2JjBsrr4=; b=VYEVmbIZ0+zmr/Fg
 qyzL0WTi5VPJ6mE/AKED8OR6e34YXuJE8YHvMzIYwcA7CnpxAoOvb0kZ+FiFmWKU
 rZ1f6fYC37cd2ud5ymfNal1axe6c9IxbCTrEugnE1/MTGVh+jHLeN9W00GkCSpa5
 /4z/glSCLDIppIKgTOKF9aVCHg0M0Zk8x8ZXPW/+xofAQ6QKcm4RfIQM9rtaagta
 gmh6LXhq34RiA/pvZ5+XZ4+RVp3NnhucYPog5RM8p9GPk6GPsPiHNphZpfuYkgOD
 1n+xJ17iVaqaBp/aDey7QgKcu+YCrUlJlVhotpEwEKpPAzXc+s3E0uA7505X1vK5
 fB0wgA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791encwph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 14:47:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fb3bb94b5cso58723756d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 07:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750085246; x=1750690046;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QH0J2l9uHSJZCOh4wtepSQeUNDV1jSsRvpZ2JjBsrr4=;
 b=nvYbL37QLbElFdStUmFLWoDdOtK6lMDiwRtacz+oLFbLkN9eshY1irl5XxFgiH49AY
 d7phB1eQktAEVjpc8oK6Qn1ejf06Ii8ksaRLGigHv5OvLVrHOW72+1iklBjdX0ZSiC9t
 80OEW3DmXO8qtMCtYFBUVZGmoXlgOdYvR496Q/SjLFVCvVCoTvDqZc2ET1sReemVpGtW
 S5jtmmHfB4rp/o5OPazvyCmUMNdOLcocTK1HUpCCogJpIePKCePYqMQni50zG9/O6cQk
 glAaSsENMdxqkMzN89kvQ2uX67rpTdUMxz+m+Njkafl/QDl/fJRr4llmGWMGbCRI1Ja5
 3PsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTVEN1qDQtt99GZRhj6d1rUFkaUGEBxn70NNqvOusQhjgxmcb2pt7sIatCgavcrjWRCZdBufDvz1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz1XASITMCgUamop1sTGW9PVn2bpwfIS/OCBvRq0ffHEgviSQF
 DN1uYXnBj/6PszXmUeeXnfY7V/T8ObhW20xHrEzp5Tn3N2jRG4N80D6r58qos3yoa1TCf9vC+9i
 Af7bXJDW+YuwqQWLvaHopnLkFinQKtyV2Fk2PPO+8mntnYRU7WrfrWD66UyQlH61N1vTtHrA=
X-Gm-Gg: ASbGncs1N/wb7pZ9pp2cwcE+qr+RdDBFPYn1y9y5T2Epb1kBQ6d4OHgMkTDCvs0jhP1
 S4w7sTLz/pwj0pXEPN1ysGM+7UqNyImLnz3cKIT6mwxnVaude/ceo04qOhgZy0GPgPa68NqUr26
 a348t9otsFFKqR9KklmbBo4hdZFZrW+WlheFkMERmAwHnQ0zuoLbRaMmQ0ARLUvparvyEtjj6p9
 CaRiTkvsDNDLMAzFLNsmezDHYshhbp1YasBBGh7PhM6zCDEfFQgJxltgvTdeAt/5fB4hY9cYaAp
 +HSmKQpoN4LZQqErpuidM+BlUJ1rDfaOp05XYMW1ga17poL/A5Bq0r6Vu4qYfn7PB9vIfHDeWCA
 yhQImQ7fR60A4PgGdmbYgdHTfOFrykamOb8dGPJj7fo4tnPVHB1ANyWP5s16t0Fa42fnz21jFoO
 M=
X-Received: by 2002:a05:6214:d4c:b0:6fa:c5f0:bf57 with SMTP id
 6a1803df08f44-6fb4779a596mr144638456d6.38.1750085246132; 
 Mon, 16 Jun 2025 07:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDmCUg9B33wXiiELGXGfTAxH1JwZagDN//DWPW0cKUjJcQEC/PvHUwjiRWcCCVoeUik+VHoA==
X-Received: by 2002:a05:6214:d4c:b0:6fa:c5f0:bf57 with SMTP id
 6a1803df08f44-6fb4779a596mr144637946d6.38.1750085245559; 
 Mon, 16 Jun 2025 07:47:25 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a4:c3fb:c59f:e024:c669:a69b?
 (2001-14bb-a4-c3fb-c59f-e024-c669-a69b.rev.dnainternet.fi.
 [2001:14bb:a4:c3fb:c59f:e024:c669:a69b])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32b3318f19fsm15713611fa.83.2025.06.16.07.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 07:47:24 -0700 (PDT)
Message-ID: <260fd5a5-ee2d-4f19-9ef6-e4145dfb2bc8@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 17:47:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
 <bmzte2ywtlygl4rru73efnfb4vpi3vkveeq32jhonrmxbogp5h@kqaukhzvcxx3>
 <2ab43ae7-12b6-4d41-9ffd-dbea70e2a662@quicinc.com>
 <njz3apifgcv2k3kzlmti5rjgqpl43v5yvjqpu6qhpe2kw3bzlu@pqvnrh6ff2um>
 <35527541-30dc-44dd-a108-79f599ace831@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <35527541-30dc-44dd-a108-79f599ace831@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: p227Rk6JTceLVn2y7FTbIreaKiCiC8iL
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=68502e7f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=wqPfgNt102ecysN_towA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: p227Rk6JTceLVn2y7FTbIreaKiCiC8iL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5MyBTYWx0ZWRfXw+Ug5YcLUm/I
 tjEMldao6qjoGWBFXcqdO1HkJyD9PW0iP+YxpEWZeGP60LgI1Ut2kIXceKfi0TZEVzsqH58j1ae
 mUGcNt2vn5WJMz9UlsWCOitHwMj41OLJnxIWZvIsToZFce8JXDYjyFiZGhYDU+VfCNXsbTis1HL
 ea0zLxe0o6EK40U0SsPaec8l49ExuRVJLpnLv6c8PAQTF4nMbsUCKQyxQsiDt+eUx5FgWS/1/K0
 Q4c9Gcf7+PRqihb+Lauy/UhAziY/yaoCnsG4ZjRr4LCWb6ABPXgPYxQG/i3E+85X/OYrC6cPSrl
 Y8NJKVBuhSXAxB9OBTJ+wI/s2zkwBIOR1ylTJnoqx1vN2akkZJ4RScE8ioQ1AOM+tT8KoeLD0GO
 op1NUUU2nEzZTVPWxEK/h1gBU/8KY4dVh/gMVotc/bsR32/pqFacQ4zFo+ilhdbxxfil9OpP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160093
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


On 16/06/2025 17:09, Yongxing Mou wrote:
 >
 >
 > On 2025/6/11 22:31, Dmitry Baryshkov wrote:
 >> On Wed, Jun 11, 2025 at 08:06:28PM +0800, Yongxing Mou wrote:
 >>>
 >>>
 >>> On 2025/6/9 23:44, Dmitry Baryshkov wrote:
 >>>> On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
 >>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
 >>>>>
 >>>>> Add connector abstraction for the DP MST. Each MST encoder
 >>>>> is connected through a DRM bridge to a MST connector and each
 >>>>> MST connector has a DP panel abstraction attached to it.
 >>>>>
 >>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
 >>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
 >>>>> ---
 >>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 
++++++++++++++++++++++ ++++++++++++++
 >>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
 >>>>>    2 files changed, 518 insertions(+)
 >>>>
 >>>> It generally feels liks 80% of this patch is a generic code. Please
 >>>> extract generic DP MST connector and push it under drm/display. 
Other DP
 >>>> MST drivers should be able to use it.
 >>>>
 >>>>>
 >>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c 
b/drivers/gpu/drm/ msm/dp/dp_mst_drm.c
 >>>>> index 
a3ea34ae63511db0ac920cbeebe30c4e2320b8c4..489fa46aa518ff1cc5f4769b2153fc5153c4cb41 
100644
 >>>>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
 >>>>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
 >>>>> @@ -25,8 +25,12 @@
 >>>>>     * OF THIS SOFTWARE.
 >>>>>     */
 >>>>> +#include <drm/drm_edid.h>
 >>>>> +#include <drm/drm_managed.h>
 >>>>>    #include "dp_mst_drm.h"
 >>>>> +#define MAX_DPCD_TRANSACTION_BYTES 16
 >>>>> +
 >>>>>    static struct drm_private_state 
*msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
 >>>>>    {
 >>>>>        struct msm_dp_mst_bridge_state *state;
 >>>>> @@ -79,6 +83,61 @@ static int msm_dp_mst_find_vcpi_slots(struct 
drm_dp_mst_topology_mgr *mgr, int p
 >>>>>        return num_slots;
 >>>>>    }
 >>>>> +static int msm_dp_mst_get_mst_pbn_div(struct msm_dp_panel 
*msm_dp_panel)
 >>>>> +{
 >>>>> +    struct msm_dp_link_info *link_info;
 >>>>> +
 >>>>> +    link_info = &msm_dp_panel->link_info;
 >>>>> +
 >>>>> +    return link_info->rate * link_info->num_lanes / 54000;
 >>>>> +}
 >>>>> +
 >>>>> +static int msm_dp_mst_compute_config(struct drm_atomic_state *state,
 >>>>> +                      struct msm_dp_mst *mst, struct 
drm_connector *connector,
 >>>>> +                      struct drm_display_mode *mode)
 >>>>> +{
 >>>>> +    int slots = 0, pbn;
 >>>>> +    struct msm_dp_mst_connector *mst_conn = 
to_msm_dp_mst_connector(connector);
 >>>>> +    int rc = 0;
 >>>>> +    struct drm_dp_mst_topology_state *mst_state;
 >>>>> +    int pbn_div;
 >>>>> +    struct msm_dp *dp_display = mst->msm_dp;
 >>>>> +    u32 bpp;
 >>>>> +
 >>>>> +    bpp = connector->display_info.bpc * 3;
 >>>>> +
 >>>>> +    pbn = drm_dp_calc_pbn_mode(mode->clock, bpp << 4);
 >>>>
 >>>> Is this going to change if DSC is in place? Will it bring 
fractional BPP
 >>>> here?
 >>>>
 >>> Actually, in this patch series, MST not support DSC. So we just don't
 >>> consider this scenario.
 >>
 >> But you still can answer the question.
 >>
 >>
 >> [...]
 >>
 > 1.Emm, for my current understanding, if DSC is enabled, the BPP 
should change and recaculated.
 > Will it bring fractional BPP here?

That's what I am asking

 >  >>>I'm not entirely sure about this answer. I checked how other 
drivers call this function, and they all use bpp << 4, so can we assume 
that this way of calling it is valid?

It is valid. I'm trying to understand the implications and future changes.

 >>>>> +
 >>>>> +    return msm_dp_display_mode_valid(dp_display, &dp_display- 
 >connector->display_info, mode);
 >>>>> +}
 >>>>> +
 >>>>> +static struct drm_encoder *
 >>>>> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, 
struct drm_atomic_state *state)
 >>>>
 >>>> Do we need this callback? Don't we have a fixed relationship between
 >>>> connectors and encoders?
 >>
 >> This was left unanswered.
 >>
 > Sorry, I didn't mean to skip any questions — I just planned to reply 
a bit later. Apologies for the confusion.
 > For this question, yes , we don't have the fixed relationship between 
them. Under the current codes, the Connector selects the available 
encoder and bridge in order from index 0 to 4 (up to max_streams) when 
the connector's status changes to 'connected'.

Why? Can we have 1:1 relationship as we do with other bridges?

 >>>>
 >>>>> +{
 >>>>> +    struct msm_dp_mst_connector *mst_conn = 
to_msm_dp_mst_connector(connector);
 >>>>> +    struct msm_dp *dp_display = mst_conn->msm_dp;
 >>>>> +    struct msm_dp_mst *mst = dp_display->msm_dp_mst;
 >>>>> +    struct drm_encoder *enc = NULL;
 >>>>> +    struct msm_dp_mst_bridge_state *bridge_state;
 >>>>> +    u32 i;
 >>>>> +    struct drm_connector_state *conn_state = 
drm_atomic_get_new_connector_state(state,
 >>>>> +                                            connector);
 >>>>> +
 >>>>
 >>
 >> [...]
 >>
 >>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 >>>>> +        if (WARN_ON(!old_conn_state->best_encoder)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        drm_bridge = 
drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);
 >>>>
 >>>> This really looks like this should be a bridge's callback.
 >>
 >> And this one
 >>
 > Emm, the bridge does not implement atomic_check(). All MST-related 
checks (such as drm_dp_atomic_release_time_slots, 
drm_dp_mst_atomic_check, or others) are performed in the connector's 
atomic_check function. I believe this is because both num_slots and pbn 
are stored in the bridge, and we call this to get the drm_bridge..

So, please split them into connector and bridge checks, calling them 
from corresponding hooks. It might be easier to migrate completely to 
the bridge's atomic_check(). At least it will save us from this clumsy 
code getting the bridge for the connector.


 >>>>
 >>>>> +        if (WARN_ON(!drm_bridge)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +        bridge = to_msm_dp_mst_bridge(drm_bridge);
 >>>>> +
 >>>>> +        bridge_state = msm_dp_mst_br_priv_state(state, bridge);
 >>>>> +        if (IS_ERR(bridge_state)) {
 >>>>> +            rc = PTR_ERR(bridge_state);
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        if (WARN_ON(bridge_state->connector != connector)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        slots = bridge_state->num_slots;
 >>>>> +        if (slots > 0) {
 >>>>> +            rc = drm_dp_atomic_release_time_slots(state,
 >>>>> +                                  &mst->mst_mgr,
 >>>>> +                                  mst_conn->mst_port);
 >>>>> +            if (rc) {
 >>>>> +                DRM_ERROR("failed releasing %d vcpi slots %d\n", 
slots, rc);
 >>>>> +                goto end;
 >>>>> +            }
 >>>>> +            vcpi_released = true;
 >>>>> +        }
 >>>>> +
 >>>>> +        if (!new_conn_state->crtc) {
 >>>>> +            /* for cases where crtc is not disabled the slots 
are not
 >>>>> +             * freed by drm_dp_atomic_release_time_slots. this 
results
 >>>>> +             * in subsequent atomic_check failing since internal 
slots
 >>>>> +             * were freed but not the dp mst mgr's
 >>>>> +             */
 >>>>> +            bridge_state->num_slots = 0;
 >>>>> +            bridge_state->connector = NULL;
 >>>>> +            bridge_state->msm_dp_panel = NULL;
 >>>>> +
 >>>>> +            drm_dbg_dp(dp_display->drm_dev, "clear best encoder: 
%d\n", bridge->id);
 >>>>> +        }
 >>>>> +    }
 >>>>
 >>>> This looks like there are several functions fused together. Please
 >>>> unfuse those into small and neat code blocks.
 >>
 >> And this 😂
 >>
 > Got it.. this code only do one thing, check and try to release 
time_slots.. we can try to package it into small functions..

I still don't understand, why do we need to release time_slots here 
instead of using MST helpers.

 >>>>
 >>>>> +
 >>>>> +mode_set:
 >>>>> +    if (!new_conn_state->crtc)
 >>>>> +        goto end;
 >>>>> +
 >>>>> +    crtc_state = drm_atomic_get_new_crtc_state(state, 
new_conn_state->crtc);
 >>>>> +
 >>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state) && crtc_state- 
 >active) {
 >>>>
 >>>> Use of crtc_state->active doesn't look correct.
 >>
 >>
 >> ...
 >>
 > Sorry, I'm still not quite sure where the issue is. Could you please 
help point it out? Thanks~~


Please refer to the documentation for drm_crtc_state::active. The 
drivers are not supposed to use this field in checks.

 >>>>
 >>>>> +        if (WARN_ON(!new_conn_state->best_encoder)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        drm_bridge = 
drm_bridge_chain_get_first_bridge(new_conn_state->best_encoder);
 >>>>> +        if (WARN_ON(!drm_bridge)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +        bridge = to_msm_dp_mst_bridge(drm_bridge);
 >>>>> +
 >>>>> +        bridge_state = msm_dp_mst_br_priv_state(state, bridge);
 >>>>> +        if (IS_ERR(bridge_state)) {
 >>>>> +            rc = PTR_ERR(bridge_state);
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        if (WARN_ON(bridge_state->connector != connector)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>
 >>>> Can all of this actually happen?
 >>
 >> ...
 >>
 > Actually not, I haven't encountered it yet. I'm not sure how to 
trigger it, but it might occur under race conditions? Or we just remove 
it untill some case it really happen..

No. You actually think whether this condition can happen, then keep it 
if it can (and drop it if it can not happen).

 >>>>
 >>>>> +
 >>>>> +        /*
 >>>>> +         * check if vcpi slots are trying to get allocated in 
same phase
 >>>>> +         * as deallocation. If so, go to end to avoid allocation.
 >>>>> +         */
 >>>>> +        if (vcpi_released) {
 >>>>> +            drm_dbg_dp(dp_display->drm_dev,
 >>>>> +                   "skipping allocation since vcpi was released 
in the same state\n");
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        if (WARN_ON(bridge_state->num_slots)) {
 >>>>> +            rc = -EINVAL;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        slots = msm_dp_mst_compute_config(state, mst, connector, 
&crtc_state->mode);
 >>>>> +        if (slots < 0) {
 >>>>> +            rc = slots;
 >>>>> +            goto end;
 >>>>> +        }
 >>>>> +
 >>>>> +        bridge_state->num_slots = slots;
 >>>>> +    }
 >>>>> +
 >>>>> +end:
 >>>>> +    drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic 
check ret %d\n",
 >>>>> +           connector->base.id, rc);
 >>>>> +    return rc;
 >>>>> +}
 >>>>> +
 >>>>> +static void dp_mst_connector_destroy(struct drm_connector 
*connector)
 >>>>> +{
 >>>>> +    struct msm_dp_mst_connector *mst_conn = 
to_msm_dp_mst_connector(connector);
 >>>>> +
 >>>>> +    drm_connector_cleanup(connector);
 >>>>> +    drm_dp_mst_put_port_malloc(mst_conn->mst_port);
 >>>>> +}
 >>>>> +
 >>>>> +/* DRM MST callbacks */
 >>>>> +static const struct drm_connector_helper_funcs 
msm_dp_drm_mst_connector_helper_funcs = {
 >>>>> +    .get_modes =    msm_dp_mst_connector_get_modes,
 >>>>> +    .detect_ctx =   msm_dp_mst_connector_detect,
 >>>>> +    .mode_valid =   msm_dp_mst_connector_mode_valid,
 >>>>> +    .atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
 >>>>> +    .atomic_check = msm_dp_mst_connector_atomic_check,
 >>>>> +};
 >>>>> +
 >>>>> +static const struct drm_connector_funcs 
msm_dp_drm_mst_connector_funcs = {
 >>>>> +    .reset = drm_atomic_helper_connector_reset,
 >>>>> +    .destroy = dp_mst_connector_destroy,
 >>>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
 >>>>> +    .atomic_duplicate_state = 
drm_atomic_helper_connector_duplicate_state,
 >>>>> +    .atomic_destroy_state = 
drm_atomic_helper_connector_destroy_state,
 >>>>> +};
 >>>>> +
 >>>>> +static struct drm_connector *
 >>>>> +msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 >>>>> +             struct drm_dp_mst_port *port, const char *pathprop)
 >>>>> +{
 >>>>> +    struct msm_dp_mst *dp_mst;
 >>>>> +    struct drm_device *dev;
 >>>>> +    struct msm_dp *dp_display;
 >>>>> +    struct msm_dp_mst_connector *mst_connector;
 >>>>> +    struct drm_connector *connector;
 >>>>> +    int rc, i;
 >>>>> +
 >>>>> +    dp_mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
 >>>>> +
 >>>>> +    dp_display = dp_mst->msm_dp;
 >>>>> +    dev = dp_display->drm_dev;
 >>>>> +
 >>>>> +    mst_connector = devm_kzalloc(dev->dev, 
sizeof(*mst_connector), GFP_KERNEL);
 >>>>
 >>>> This shows that somebody doesn't understand the reason for drmm 
and the
 >>>> difference between devm and drmm and the lifetime of the objects. 
Do you
 >>>> see two issues in this line?
 >>>>
 >>>> Let me help you. Please use normal (non-managed) memory here. It 
is the
 >>>> only correct way to allocate memory for MST connectors.
 >>>>
 >>> Thanks for point it.. it will lead to mem leak.. so we need to use
 >>> kzalloc()...
 >>
 >> - Did you understand why devm is unsuitable here?
 >> - Why drmm is also unsutable?
 >> - What is the implication of using kzalloc() here?
 >>
 > For my understanding, memory allocated with devm_kzalloc is released 
when the device is removed, while memory allocated with drmm_kzalloc is 
released when the DRM device is unregistered. I believe this is because 
the allocation and release of connectors happen during hotplug events, 
which have a different lifecycle from other devices. If we use 
kzalloc(), we would need to manually free the memory.

Ack, thanks.

 >>>>> +
 >>>>> +    drm_modeset_lock_all(dev);
 >>>>> +
 >>>>> +    rc = drm_connector_dynamic_init(dev, &mst_connector->connector,
 >>>>> +                    &msm_dp_drm_mst_connector_funcs,
 >>>>> +                    DRM_MODE_CONNECTOR_DisplayPort, NULL);
 >>>>> +    if (rc) {
 >>>>> +        drm_modeset_unlock_all(dev);
 >>>>> +        return NULL;
 >>>>> +    }
 >>>>> +
 >>>>> +    mst_connector->dp_panel = msm_dp_display_get_panel(dp_display);
 >>>>> +    if (!mst_connector->dp_panel) {
 >>>>> +        DRM_ERROR("failed to get dp_panel for connector\n");
 >>>>> +        drm_modeset_unlock_all(dev);
 >>>>> +        return NULL;
 >>>>> +    }
 >>>>> +
 >>>>> +    mst_connector->dp_panel->connector = &mst_connector->connector;
 >>>>> +    mst_connector->msm_dp = dp_display;
 >>>>> +    connector = &mst_connector->connector;
 >>>>> +    drm_connector_helper_add(&mst_connector->connector, 
&msm_dp_drm_mst_connector_helper_funcs);
 >>>>> +
 >>>>> +    if (connector->funcs->reset)
 >>>>> +        connector->funcs->reset(connector);
 >>>>> +
 >>>>> +    /* add all encoders as possible encoders */
 >>>>> +    for (i = 0; i < dp_mst->max_streams; i++) {
 >>>>> +        rc = drm_connector_attach_encoder(&mst_connector->connector,
 >>>>> +                          dp_mst->mst_bridge[i].encoder);
 >>>>> +        if (rc) {
 >>>>> +            DRM_ERROR("failed to attach encoder to connector, 
%d\n", rc);
 >>>>> +            drm_modeset_unlock_all(dev);
 >>>>> +            return NULL;
 >>>>> +        }
 >>>>> +    }
 >>>>> +
 >>>>> +    mst_connector->mst_port = port;
 >>>>> +    drm_dp_mst_get_port_malloc(mst_connector->mst_port);
 >>>>> +
 >>>>> +    drm_object_attach_property(&mst_connector->connector.base,
 >>>>> +                   dev->mode_config.path_property, 0);
 >>>>> +    drm_object_attach_property(&mst_connector->connector.base,
 >>>>> +                   dev->mode_config.tile_property, 0);
 >>>>
 >>>> subconnector? Or do we report the subconnector only for the main DP
 >>>> port?
 >>
 >>
 >> ...
 >>
 > Sorry, I'm not quite sure what 'subconnector' means in this 
context... Could you please help explain it a bit more? From what I’ve 
seen in other drivers, these two properties are registered for each MST 
connector.
 > 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
drivers/gpu/drm/i915/display/intel_dp_mst.c?h=v6.16-rc2#n1618

I was thinking about the 
drm_connector_attach_dp_subconnector_property(), but it seems it's not 
used for MST connectors.

However, we should definitely be setting the path property, see 
drm_connector_set_path_property().


 >>>>
 >>>>> +
 >>>>> +    drm_modeset_unlock_all(dev);
 >>>>> +
 >


-- 
With best wishes
Dmitry
