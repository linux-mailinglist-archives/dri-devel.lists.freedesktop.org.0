Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E12FAE7241
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 00:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD4410E631;
	Tue, 24 Jun 2025 22:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SsukCSqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C741F10E631
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 22:25:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFC1gS020750
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 22:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 edaUDKUgQvnygzPp/PS/HdXpkUYt7JSXmWXEzbbbfIQ=; b=SsukCSqqLpu32Hz9
 Zf0WYnYAUsdgRGVgVHeBDS+Vt4cOuE+YPa/vPuaGAFvTTfpN/DIhkGm56K2tc2h8
 B0XMTamMiVSNOQ5u6sJfzCqguLBcpx40urMNWDwetimfWOQyv+UyCn1H85Chr1+O
 Ph1iamfB5wvgJSzlJ1gGI1UPAfUbA9g/abceuybTcNVs+iR8TsYD5GuC5drO1Vu1
 P1z3zIYquMu5rCyqACViyurk7raj4M7ER3IiNZyW5nTNqSnNs1MuBv4ON4latMBN
 GUEnbf77dgoUJaqmX8Z1b74Oqey7MoceMbg6wRCFPT8NqNn6fwUvclbardghvWGH
 P4O0MQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwv1fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 22:25:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-311ef4fb5fdso949131a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 15:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750803917; x=1751408717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=edaUDKUgQvnygzPp/PS/HdXpkUYt7JSXmWXEzbbbfIQ=;
 b=MWlhioiwVlcLgBi+DQzOSBYDH6RdHD4QXr4A21ikJFptatupD8PgvwIgK2ap8juB5p
 ywTEEO6kKWCgOMzMBSA9bIGwOwA4w8n6hGO5Gh+C8bmh5FqC0mpkaI5UsLeWgFN+GCq5
 xdDYYLljs+fvv6P+x7BGHpaJLNLFBWThb/zzX+jeyTL+46URRg7r4wgfSa8jrl5KcTtW
 3niNDcQ2gLjIe3Iwc9rFf6tW3HBrWEsd0cwJf9nJ8Y/g1b8dhRbI+UjZcF0Ln81ZrVRZ
 wbpb3tMsheJNjH1Nax3tBxYvbd7JFk4VyfmCf6bMRNzmnrkgJ5km7vPLQmmxl2TYvkVp
 Z/Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4wzuQlVVhQ76AigdOGwE72D9HlWhH6UzOoyhwaRkeq+v+i4MSSjs9ht5U4/TnHgZ7yLlPnkx45k0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp7jsFy70HC18buHWNouSXXpFmnSzpmiXkksh6jhVFiusr2+vK
 C/knoOrb7upPmWEuaRwX537BvTo32UIDJSSsdY7UgIwcoFO4git5XxUY6wktpuSMxtGIshtMS0i
 r2OWE4UXHuMkd4tcwnQBLHYoT5ZJ3H0l2WjteDxJ6bNfStrDSRQiiRRdrG0IpBZZlvXY2L2u71S
 PwKqwja7qRrwJkIyBxva9lOIAhK5GMEa/3ov3hUMKwslM7CQ==
X-Gm-Gg: ASbGnct+EOwvihYpk46BrgVcxaXTHhfzNhRrxo004U7a6vkVO2owx1BaTQJE/PUTmZD
 VNoh1mciuf3bkQBm7/dTYjt64nWpzypnJDP6Sx4t16GIoyLFZzTM0Wu8OHbPkSgVMR2MkTsRsyN
 OSW9iZY9lOapq6q0kiXQ==
X-Received: by 2002:a17:90a:e7cd:b0:312:639:a06a with SMTP id
 98e67ed59e1d1-315f26a19f1mr625750a91.31.1750803917208; 
 Tue, 24 Jun 2025 15:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnJYacbGygKmNc7/TEfsmJQ26aNfJyLjp214T8au+stbrq01Rv+OX3Ye4iYF2UhpPFpvURsWdwI0ZhDx83xEU=
X-Received: by 2002:a17:90a:e7cd:b0:312:639:a06a with SMTP id
 98e67ed59e1d1-315f26a19f1mr625722a91.31.1750803916579; Tue, 24 Jun 2025
 15:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
 <bmzte2ywtlygl4rru73efnfb4vpi3vkveeq32jhonrmxbogp5h@kqaukhzvcxx3>
 <2ab43ae7-12b6-4d41-9ffd-dbea70e2a662@quicinc.com>
 <njz3apifgcv2k3kzlmti5rjgqpl43v5yvjqpu6qhpe2kw3bzlu@pqvnrh6ff2um>
 <35527541-30dc-44dd-a108-79f599ace831@quicinc.com>
 <bd0fba5c-9e38-4a40-adf9-cc70fa2d0f57@oss.qualcomm.com>
 <ad1db558-c33e-4788-9f25-cac6c21713f1@quicinc.com>
 <997c2a3a-44e7-4169-8664-7b600deaa618@oss.qualcomm.com>
 <69f0c53a-0ac3-4858-a644-373af0473ddd@quicinc.com>
In-Reply-To: <69f0c53a-0ac3-4858-a644-373af0473ddd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 01:25:05 +0300
X-Gm-Features: Ac12FXyvsFi_beIPF9O4FOutFpu-hhHQggNgbzkyumWeGmqoN9ZlAKqWxrqVmXo
Message-ID: <CAO9ioeXHqJ80y=07RyaRuPeWXu4OhjHKOznrWwunSu81EYGVEw@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _8pxJq2OrdtDQp6VBkvkd_ECtmDYpTrx
X-Proofpoint-ORIG-GUID: _8pxJq2OrdtDQp6VBkvkd_ECtmDYpTrx
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685b25d0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=COk6AnOGAAAA:8 a=N_YKmpcrgEzAbr5VYMoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE3OSBTYWx0ZWRfX/6DC2Un+we5W
 hpgtvqIv2nRf2yKrvDivtTN5b6rM8tbtqHmo/bBToXX9K/hWe6y0ecD3kC/92Z7Lggi+amqlx8B
 XI8vEF4Zfmavpkbx+Fb+X9Af4lkW19z772KikkjfJ4BevZ5PfmaemOzvx29lOLF5XtJrqBzDO4A
 u9GXdn3BGV779aT/4wO4/rkJ2+5VFehxWlZyDrYGKp792tq9AGW4cL6AMQs/ppBf2wx2HeJt+kB
 m0zb8ivFJ3Mwqzlmcx6jxtRcDESGL+UR3dcIuzXggWOqNacbdG14nN/xLYimxlq7UsJUGUQ3dKk
 iVt+FVF+oV3zwrTiQBxxtZMcTLD4TODy6RrdtgmVNHacrPiS1sn00z9nEBK88fSv9dhwGB3RKpE
 RzmoAiYrC2JEmmjmPuttcJBhH2oTNcrMG9thlR5NQ3hukWm+Tgz0tKo98cv36/vGTWPcuuXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240179
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

On Tue, 24 Jun 2025 at 12:57, Yongxing Mou <quic_yongmou@quicinc.com> wrote=
:
>
>
>
> On 2025/6/19 19:33, Dmitry Baryshkov wrote:
> > [initially I responded off-list by mistake, sorry for the confusion and
> > possible duplicates]
> >
> > On 19/06/2025 12:26, Yongxing Mou wrote:
> >>
> >>
> >> On 2025/6/16 22:41, Dmitry Baryshkov wrote:
> >>> On 16/06/2025 17:09, Yongxing Mou wrote:
> >>>>
> >>>>
> >>>> On 2025/6/11 22:31, Dmitry Baryshkov wrote:
> >>>>> On Wed, Jun 11, 2025 at 08:06:28PM +0800, Yongxing Mou wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 2025/6/9 23:44, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
> >>>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>>>>>
> >>>>>>>> Add connector abstraction for the DP MST. Each MST encoder
> >>>>>>>> is connected through a DRM bridge to a MST connector and each
> >>>>>>>> MST connector has a DP panel abstraction attached to it.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 +++++++++++++++++++
> >>>>>>>> + + + ++++++++++++++
> >>>>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
> >>>>>>>>    2 files changed, 518 insertions(+)
> >>>>>>>
> >>>>>>> It generally feels liks 80% of this patch is a generic code. Plea=
se
> >>>>>>> extract generic DP MST connector and push it under drm/display.
> >>>>>>> Other DP
> >>>>>>> MST drivers should be able to use it.
> >>>>>>>
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/
> >>>>>>>> drm/ msm/dp/dp_mst_drm.c
> >>>>>>>> index
> >>>>>>>> a3ea34ae63511db0ac920cbeebe30c4e2320b8c4..489fa46aa518ff1cc5f476=
9b2153fc5153c4cb41 100644
> >>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> >>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> >>>>>>>> @@ -25,8 +25,12 @@
> >>>>>>>>     * OF THIS SOFTWARE.
> >>>>>>>>     */
> >>>>>>>> +#include <drm/drm_edid.h>
> >>>>>>>> +#include <drm/drm_managed.h>
> >>>>>>>>    #include "dp_mst_drm.h"
> >>>>>>>> +#define MAX_DPCD_TRANSACTION_BYTES 16
> >>>>>>>> +
> >>>>>>>>    static struct drm_private_state
> >>>>>>>> *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
> >>>>>>>>    {
> >>>>>>>>        struct msm_dp_mst_bridge_state *state;
> >>>>>>>> @@ -79,6 +83,61 @@ static int msm_dp_mst_find_vcpi_slots(struct
> >>>>>>>> drm_dp_mst_topology_mgr *mgr, int p
> >>>>>>>>        return num_slots;
> >>>>>>>>    }
> >>>>>>>> +static int msm_dp_mst_get_mst_pbn_div(struct msm_dp_panel
> >>>>>>>> *msm_dp_panel)
> >>>>>>>> +{
> >>>>>>>> +    struct msm_dp_link_info *link_info;
> >>>>>>>> +
> >>>>>>>> +    link_info =3D &msm_dp_panel->link_info;
> >>>>>>>> +
> >>>>>>>> +    return link_info->rate * link_info->num_lanes / 54000;
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>> +static int msm_dp_mst_compute_config(struct drm_atomic_state
> >>>>>>>> *state,
> >>>>>>>> +                      struct msm_dp_mst *mst, struct
> >>>>>>>> drm_connector *connector,
> >>>>>>>> +                      struct drm_display_mode *mode)
> >>>>>>>> +{
> >>>>>>>> +    int slots =3D 0, pbn;
> >>>>>>>> +    struct msm_dp_mst_connector *mst_conn =3D
> >>>>>>>> to_msm_dp_mst_connector(connector);
> >>>>>>>> +    int rc =3D 0;
> >>>>>>>> +    struct drm_dp_mst_topology_state *mst_state;
> >>>>>>>> +    int pbn_div;
> >>>>>>>> +    struct msm_dp *dp_display =3D mst->msm_dp;
> >>>>>>>> +    u32 bpp;
> >>>>>>>> +
> >>>>>>>> +    bpp =3D connector->display_info.bpc * 3;
> >>>>>>>> +
> >>>>>>>> +    pbn =3D drm_dp_calc_pbn_mode(mode->clock, bpp << 4);
> >>>>>>>
> >>>>>>> Is this going to change if DSC is in place? Will it bring
> >>>>>>> fractional BPP
> >>>>>>> here?
> >>>>>>>
> >>>>>> Actually, in this patch series, MST not support DSC. So we just do=
n't
> >>>>>> consider this scenario.
> >>>>>
> >>>>> But you still can answer the question.
> >>>>>
> >>>>>
> >>>>> [...]
> >>>>>
> >>>> 1.Emm, for my current understanding, if DSC is enabled, the BPP
> >>>> should change and recaculated.
> >>>> Will it bring fractional BPP here?
> >>>
> >>> That's what I am asking
> >>>
> >>>>  >>>I'm not entirely sure about this answer. I checked how other
> >>>> drivers call this function, and they all use bpp << 4, so can we
> >>>> assume that this way of calling it is valid?
> >>>
> >>> It is valid. I'm trying to understand the implications and future
> >>> changes.
> >>>
> >>>>>>>> +
> >>>>>>>> +    return msm_dp_display_mode_valid(dp_display, &dp_display-
> >>>>>>>> >connector->display_info, mode);
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>> +static struct drm_encoder *
> >>>>>>>> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector,
> >>>>>>>> struct drm_atomic_state *state)
> >>>>>>>
> >>>>>>> Do we need this callback? Don't we have a fixed relationship betw=
een
> >>>>>>> connectors and encoders?
> >>>>>
> >>>>> This was left unanswered.
> >>>>>
> >>>> Sorry, I didn't mean to skip any questions =E2=80=94 I just planned =
to reply
> >>>> a bit later. Apologies for the confusion.
> >>>> For this question, yes , we don't have the fixed relationship
> >>>> between them. Under the current codes, the Connector selects the
> >>>> available encoder and bridge in order from index 0 to 4 (up to
> >>>> max_streams) when the connector's status changes to 'connected'.
> >>>
> >>> Why? Can we have 1:1 relationship as we do with other bridges?
> >>>
> >> Emm, It may be because the number of MST connectors is not fixed, but
> >> rather determined by the number of output ports on the dongle. For
> >> example, in a 2-MST case, there are 2 encoders, but there could be
> >> four MST connectors if the dongle has four DP output ports.
> >> add_connector() creates MST connectors based on the number of outputs
> >> on the dongle, rather than the actual number of connected devices.
> >
> > Ack, this should be a part of the commit message.
> >
> >>>>>>>
> >>>>>>>> +{
> >>>>>>>> +    struct msm_dp_mst_connector *mst_conn =3D
> >>>>>>>> to_msm_dp_mst_connector(connector);
> >>>>>>>> +    struct msm_dp *dp_display =3D mst_conn->msm_dp;
> >>>>>>>> +    struct msm_dp_mst *mst =3D dp_display->msm_dp_mst;
> >>>>>>>> +    struct drm_encoder *enc =3D NULL;
> >>>>>>>> +    struct msm_dp_mst_bridge_state *bridge_state;
> >>>>>>>> +    u32 i;
> >>>>>>>> +    struct drm_connector_state *conn_state =3D
> >>>>>>>> drm_atomic_get_new_connector_state(state,
> >>>>>>>> +                                            connector);
> >>>>>>>> +
> >>>>>>>
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> >>>>>>>> +        if (WARN_ON(!old_conn_state->best_encoder)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        drm_bridge =3D
> >>>>>>>> drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);
> >>>>>>>
> >>>>>>> This really looks like this should be a bridge's callback.
> >>>>>
> >>>>> And this one
> >>>>>
> >>>> Emm, the bridge does not implement atomic_check(). All MST-related
> >>>> checks (such as drm_dp_atomic_release_time_slots,
> >>>> drm_dp_mst_atomic_check, or others) are performed in the connector's
> >>>> atomic_check function. I believe this is because both num_slots and
> >>>> pbn are stored in the bridge, and we call this to get the drm_bridge=
..
> >>>
> >>> So, please split them into connector and bridge checks, calling them
> >>> from corresponding hooks. It might be easier to migrate completely to
> >>> the bridge's atomic_check(). At least it will save us from this
> >>> clumsy code getting the bridge for the connector.
> >>>
> >> Maybe we don't need to move to bridge's atomic_check(). Connector's
> >> atomic_check() do 2 things: 1.Call drm_dp_atomic_release_time_slots
> >> when unplug, 2. Call drm_dp_atomic_find_time_slots and
> >> drm_dp_mst_atomic_check when plug in.
> >
> > Actually... I don't think you are calling it in a correct way. It shoul=
d
> > be called from the drm_mode_config.atomic_check, not from connector's
> > atomic_check(). See how nouveau driver does it. Even documentation
> > insists that it should be called _after_ checking the rest of the state=
.
> >
> In the documentation, drm_dp_atomic_find_time_slots should be placed in
> drm_encoder_helper_funcs.atomic_check(),

I'm not sure about this. Our encoders are implemented by the DPU
driver, so I'd rather not call MST functions from it.
You might call it from drm_bridge_funcs::atomic_check(), it is being
called at the same stage.

> drm_dp_atomic_release_time_slots in
> &drm_connector_helper_funcs.atomic_check(), and drm_dp_mst_atomic_check
> in &drm_mode_config_funcs.atomic_check(). So maybe we can move these
> atomic_check() calls back to their original positions as do, as
> recommended in the documenttation.

These two are fine. Please move them to proper places.

> >> 3 functions need drm_atomic_state, but it seems that
> >> drm_bridge_funcs.atomic_check() does not pass in drm_atomic_state.
> >
> > You can get drm_atomic_state from bridge_state->base.state, crtc_state-
> >  >state, connector_state->state, that's not really an issue.
> >
> >> Actually both 2 actions only occur when need modeset. Maybe we can
> >> optimize this function in the following ways: (1) reduce unnecessary
> >> references to drm_bridge, especially since bridge_state-  >num_slots
> >> can replace with payload->time_slots; (2)As your comments, split the
> >> function into smaller parts to better reflect the logic.
> >
> > Yes, please. Getting rid of bridge_state->num_slots is a good path forw=
ard.
> >
> Emm, even if we can drop bridge_state->num_slots, we still need to
> access bridge_state when clearing bridge_state->connector and
> bridge_state->msm_dp_panel, so it might not be possible to completely
> eliminate the use of bridge_state here.

This is fine. We should drop state-related data from
msm_dp_mst_bridge, the msm_dp_mst_bridge_state can stay.
I wanted to get rid of unnecessary slots management in the MSM DP
driver, the state is fine to exist.

> >>>
> >>>>>>>
> >>>>>>>> +        if (WARN_ON(!drm_bridge)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +        bridge =3D to_msm_dp_mst_bridge(drm_bridge);
> >>>>>>>> +
> >>>>>>>> +        bridge_state =3D msm_dp_mst_br_priv_state(state, bridge=
);
> >>>>>>>> +        if (IS_ERR(bridge_state)) {
> >>>>>>>> +            rc =3D PTR_ERR(bridge_state);
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        if (WARN_ON(bridge_state->connector !=3D connector)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        slots =3D bridge_state->num_slots;
> >>>>>>>> +        if (slots > 0) {
> >>>>>>>> +            rc =3D drm_dp_atomic_release_time_slots(state,
> >>>>>>>> +                                  &mst->mst_mgr,
> >>>>>>>> +                                  mst_conn->mst_port);
> >>>>>>>> +            if (rc) {
> >>>>>>>> +                DRM_ERROR("failed releasing %d vcpi slots
> >>>>>>>> %d\n", slots, rc);
> >>>>>>>> +                goto end;
> >>>>>>>> +            }
> >>>>>>>> +            vcpi_released =3D true;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        if (!new_conn_state->crtc) {
> >>>>>>>> +            /* for cases where crtc is not disabled the slots
> >>>>>>>> are not
> >>>>>>>> +             * freed by drm_dp_atomic_release_time_slots. this
> >>>>>>>> results
> >>>>>>>> +             * in subsequent atomic_check failing since
> >>>>>>>> internal slots
> >>>>>>>> +             * were freed but not the dp mst mgr's
> >>>>>>>> +             */
> >>>>>>>> +            bridge_state->num_slots =3D 0;
> >>>>>>>> +            bridge_state->connector =3D NULL;
> >>>>>>>> +            bridge_state->msm_dp_panel =3D NULL;
> >>>>>>>> +
> >>>>>>>> +            drm_dbg_dp(dp_display->drm_dev, "clear best
> >>>>>>>> encoder: %d\n", bridge->id);
> >>>>>>>> +        }
> >>>>>>>> +    }
> >>>>>>>
> >>>>>>> This looks like there are several functions fused together. Pleas=
e
> >>>>>>> unfuse those into small and neat code blocks.
> >>>>>
> >>>>> And this :-D
> >>>>>
> >>>> Got it.. this code only do one thing, check and try to release
> >>>> time_slots.. we can try to package it into small functions..
> >>>
> >>> I still don't understand, why do we need to release time_slots here
> >>> instead of using MST helpers.
> >>>
> >> Emm , just as above reply.. when we need modeset, call
> >> drm_dp_atomic_release_time_slots to release payload and then clear
> >> bridge_state cached ..
> >
> > I don't see other drivers limiting drm_dp_atomic_release_time_slots() t=
o
> > the modeset case. Any reason for MSM driver to deviate from that?
> >
> Actually, you are right. I think the drm_dp_atomic_release_time_slots
> function can handle the slots releases quite well by itself. This
> function can handle various changes in crtc_state quite well. These
> constraints are more about supporting the cleanup of
> bridge_state->connector and bridge_state->msm_dp_panel.

Can't we keep msm_dp_panel in the connector's state and access it by
getting the state by the connector?

> >
> >
> >>>>>>>
> >>>>>>>> +
> >>>>>>>> +mode_set:
> >>>>>>>> +    if (!new_conn_state->crtc)
> >>>>>>>> +        goto end;
> >>>>>>>> +
> >>>>>>>> +    crtc_state =3D drm_atomic_get_new_crtc_state(state,
> >>>>>>>> new_conn_state->crtc);
> >>>>>>>> +
> >>>>>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state) &&
> >>>>>>>> crtc_state- >active) {
> >>>>>>>
> >>>>>>> Use of crtc_state->active doesn't look correct.
> >>>>>
> >>>>>
> >>>>> ...
> >>>>>
> >>>> Sorry, I'm still not quite sure where the issue is. Could you please
> >>>> help point it out? Thanks~~
> >>>
> >>>
> >>> Please refer to the documentation for drm_crtc_state::active. The
> >>> drivers are not supposed to use this field in checks.
> >>>
> >> Got it , so maybe drm_crtc_state::enable might more appropriate here..
> >
> > Well, why do you need it in the first place? This will determine a
> > correct set of conditions.
> >
> Got it. Let me look into whether this can be optimized.
> >
> >>>>>>>
> >>>>>>>> +        if (WARN_ON(!new_conn_state->best_encoder)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        drm_bridge =3D
> >>>>>>>> drm_bridge_chain_get_first_bridge(new_conn_state->best_encoder);
> >>>>>>>> +        if (WARN_ON(!drm_bridge)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +        bridge =3D to_msm_dp_mst_bridge(drm_bridge);
> >>>>>>>> +
> >>>>>>>> +        bridge_state =3D msm_dp_mst_br_priv_state(state, bridge=
);
> >>>>>>>> +        if (IS_ERR(bridge_state)) {
> >>>>>>>> +            rc =3D PTR_ERR(bridge_state);
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>> +
> >>>>>>>> +        if (WARN_ON(bridge_state->connector !=3D connector)) {
> >>>>>>>> +            rc =3D -EINVAL;
> >>>>>>>> +            goto end;
> >>>>>>>> +        }
> >>>>>>>
> >>>>>>> Can all of this actually happen?
> >>>>>
> >>>>> ...
> >>>>>
> >>>> Actually not, I haven't encountered it yet. I'm not sure how to
> >>>> trigger it, but it might occur under race conditions? Or we just
> >>>> remove it untill some case it really happen..
> >>>
> >>> No. You actually think whether this condition can happen, then keep
> >>> it if it can (and drop it if it can not happen).
> >>>
> >> Got it. Let me test a few different cases to see if these scenarios
> >> occur.
> >
> > No. It's not about testing. It's about asserting if the scenario can
> > occur or not per your call stacks and per the design / contract.
> >
> Got it. Let me check this part again. I don't think these errors would
> occur under the current design. But if the system enters a  inconsistent
> error state, this code could help improve our stability.

Then please eliminate a way for the system to enter an 'inconsistent
error state'.

--=20
With best wishes
Dmitry
