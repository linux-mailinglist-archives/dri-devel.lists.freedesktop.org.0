Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B65ABBA70
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0685510E077;
	Mon, 19 May 2025 09:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXNHU6nO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB5110E04C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:58:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4F1U9014338
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LtRSP0W/Hi/ORrZUvPbtJEppxen42qKsaFvRPV9cHiU=; b=TXNHU6nOVjDmQnQ0
 ZHwB9FxGEVR1jbikywyZQNXsDj14RHa/q6hIkEiNJguUpQE+gc9J1kJr2le2hgUp
 38+m5/DS92ZsBbW8O4SlK1aKX/p69bqdfZOqlMsS/le7fU32hni+oB6n/WLAsLco
 mcU/A/bboiwpxVsfrvTj6AsoJn3iRoQNVnqnX0PlLHqIkynieQTiYeAza8ZwY73g
 cgYxYNYAD7d7NNSOWiqjjp4224FS8BwWC1ElKuxky8iYEBjlYTkdIjWHXiSsEjRS
 gbwLmulsLbgjXC37o/Lo+TLSciuJ0yDg5zQoBFSov9GqzAP8r4r8LDeOfmMFHJb3
 pXPIJA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwengyxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:58:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2323bd7f873so8278365ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 02:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747648714; x=1748253514;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LtRSP0W/Hi/ORrZUvPbtJEppxen42qKsaFvRPV9cHiU=;
 b=VpBQAtZYyFLyO+hn0leNDcmyvYiehs9DulaTWz6dYS3LTJFvUkTilEV3zPH66HfWVZ
 ktnJ1CWS7mWB8Zt4MrEgzSqa42Ww51c6Iy3tCFcxlAcQhIM/NMcFTE3++l5knD5AubLP
 rNF8GKDbNMQhH9b1WHannZnKMgYmkbqseibMLlhVXsrgCMfxBNIz7XNO4wMiqdbGpayu
 hnPAYcYUedAWxkgkuDhQB8p3l7meHKgcqletCMCE01ndaQmawCAqEGEvfcOOaCf7W6A8
 UT7+q2X9elE7oG0cOo/QED6L12igh0B9K6Wf5SZyQabVxLPh99k4qZ5DFS0DeTnDjDoD
 yKkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJDuVNuH881VyLxIriBw8/CbCyXsMZmIOME9Rwjf2w5IKP6Xc9+C7PR58Hfht+oK2N70igBE8/e7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX12uHAWK8fa/zJpA5Y33FdyOpNCz3r0Q8SWqpgcb1zaMsVlri
 nr4rjkUNdUk7Th9cVsayiVv7g82dR8lL9NPHk9QelCTz3qRLzJnLyFOFssFjiKorbBB+0xdUDoH
 3DMX24pHVyaqm2Mi8epnoWPafTLZMFsukI/2C9Rk1JxUOMuIJNAFAsGpcHIyXqptd2wOu/LYOiB
 cjXnR3bZSBBRoWteid49wVyKbU5H+wd7xMh08XLQy8uOqX+Q==
X-Gm-Gg: ASbGnct5yol/V4f7XQOvkrGZ57lkupgEtWBKC4AepgUrfUSbJCoNNyF1P7a1V5dcYtl
 E0IabG7if/GcvFj0fLVnue09UU+5YVNY3IvQYPxZt+/gp1rU/26H/1Yn52b67tJk49nCLWg==
X-Received: by 2002:a17:903:32ce:b0:220:ca39:d453 with SMTP id
 d9443c01a7336-231d43a3e56mr158912365ad.17.1747648713765; 
 Mon, 19 May 2025 02:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExn4Fi0qVE9XRinsKH7NraHA9o5v8AI9xLA26xgaqMjhcTZYmC0IGjhwzyp6Xbz3vqAPlHRfX1tB5ApLE9zIE=
X-Received: by 2002:a17:903:32ce:b0:220:ca39:d453 with SMTP id
 d9443c01a7336-231d43a3e56mr158912045ad.17.1747648713296; Mon, 19 May 2025
 02:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-5-09a4338d93ef@quicinc.com>
 <CAA8EJpoY8hySQd00yODGeHjSpVZpEBLjF3aBiKGJPUhpr-2mgw@mail.gmail.com>
 <d2a3cd6f-1077-4edb-9f0c-0c940a639050@quicinc.com>
 <zvapsvfftai4fp6vwrn33edqsyuuprq2pxz6spij6j7t4y6xmn@zzgp7gbsivbk>
 <93ddb63c-42da-43c8-9a77-c517ca5d6432@quicinc.com>
 <CAA8EJprAFYD6ykN10-r=JwHM4A4XeDDcZVcVWYp_5A5FP-=RyA@mail.gmail.com>
 <e647d143-dc6e-483d-ac81-2733fb526fc3@quicinc.com>
 <h6tmbuv26tdv633udphttsydpbvnwownulvglcxktdaxqdhtvw@ereftfs5hiso>
 <9fb34496-d823-414a-b7dc-54b4677829e5@quicinc.com>
 <td4dkb6qoxfa7lfmfszlowov6qxdukqq5qnwnhmajnskr5mu2u@todczb6inttv>
 <84500975-eb32-471f-a64a-283e885ae84e@oss.qualcomm.com>
In-Reply-To: <84500975-eb32-471f-a64a-283e885ae84e@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 12:58:24 +0300
X-Gm-Features: AX0GCFvlZEV_LK_ZpMUc7YfrpjUtt-lV8Ml6r7s02ciIgwoo4P2Pz40tNLgyS3s
Message-ID: <CAO9ioeUNgF=ZipJjOyo=szFOqqpMgbyM_srq19PbEy3sfmNgag@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/msm/dp: Add support for lane mapping configuration
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 quic_xiangxuy@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: q_LbZAmBdhXqou6M0to1iVYnXg7c0q_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NSBTYWx0ZWRfX1tqjDoPYeq+2
 Bqq51xkh6WAol98L9lVOqRJP/H9hiGebBOPpCh29v+qa74G15SU3CNyAI/ZySy2BEkUR/iJoE3t
 6mqui2ValFdE+bv8jawEr9c/pi+zOpGb7IvRDX7UNc2MdACr4iKLzczo/MSA4WWWgq36X3IKVqc
 PvkvrByQu1//OY8VMNclQALMxkbKMBaDp/s8/VzlANQI+7L87IK+CM6zYbxztNrq7nn9d4rSOqG
 Maq05rCyKoVtv28/MZxMA5Hwr9ILTCqyaUZ0M6rY10qoJjs86IirF4nRzhtBIOYqfNhe35wpVql
 Lw9TgvqtF3pQ9pA2ZZ+0NV2sOQ9yYcVSkVHmqY81jY3jhCygo4J+hvTusg2akeYkClNEERoHlCY
 Vz4kyasDAjLkIQVigIesEVJqFC94Vq2RVUNIxPXClr05f0rh6jCep9t5DPwrxLcb3E+Fqaep
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682b00e0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=e5mUnYsNAAAA:8 a=Oh2cFVv5AAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=4rmEANqFzdCXNiHzqtoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=7KeoIwV6GZqOttXkcoxL:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: q_LbZAmBdhXqou6M0to1iVYnXg7c0q_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190095
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

On Mon, 19 May 2025 at 11:20, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com> wr=
ote:
>
>
>
> On 3/6/2025 5:14 AM, Dmitry Baryshkov wrote:
> > On Wed, Mar 05, 2025 at 06:16:45PM +0800, Xiangxu Yin wrote:
> >>
> >>
> >> On 12/20/2024 5:45 AM, Dmitry Baryshkov wrote:
> >>> On Thu, Dec 19, 2024 at 06:36:38PM +0800, Xiangxu Yin wrote:
> >>>>
> >>>>
> >>>> On 12/5/2024 7:40 PM, Dmitry Baryshkov wrote:
> >>>>> On Thu, 5 Dec 2024 at 13:28, Xiangxu Yin <quic_xiangxuy@quicinc.com=
> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 12/2/2024 6:46 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, Dec 02, 2024 at 04:40:05PM +0800, Xiangxu Yin wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 11/29/2024 9:50 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicin=
c.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>> Add the ability to configure lane mapping for the DP controlle=
r. This is
> >>>>>>>>>> required when the platform's lane mapping does not follow the =
default
> >>>>>>>>>> order (0, 1, 2, 3). The mapping rules are now configurable via=
 the
> >>>>>>>>>> `data-lane` property in the devicetree. This property defines =
the
> >>>>>>>>>> logical-to-physical lane mapping sequence, ensuring correct la=
ne
> >>>>>>>>>> assignment for non-default configurations.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >>>>>>>>>> ---
> >>>>>>>>>>  drivers/gpu/drm/msm/dp/dp_catalog.c | 11 +++++------
> >>>>>>>>>>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
> >>>>>>>>>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
> >>>>>>>>>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 ++++++++++---
> >>>>>>>>>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +++
> >>>>>>>>>>  5 files changed, 20 insertions(+), 11 deletions(-)
> >>>>>>>>>>
> >>>>>>>
> >>>>>>>>>> @@ -461,6 +460,7 @@ static int msm_dp_panel_parse_dt(struct ms=
m_dp_panel *msm_dp_panel)
> >>>>>>>>>>         struct msm_dp_panel_private *panel;
> >>>>>>>>>>         struct device_node *of_node;
> >>>>>>>>>>         int cnt;
> >>>>>>>>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES] =3D {0, 1, 2, 3};
> >>>>>>>>>>
> >>>>>>>>>>         panel =3D container_of(msm_dp_panel, struct msm_dp_pan=
el_private, msm_dp_panel);
> >>>>>>>>>>         of_node =3D panel->dev->of_node;
> >>>>>>>>>> @@ -474,10 +474,17 @@ static int msm_dp_panel_parse_dt(struct =
msm_dp_panel *msm_dp_panel)
> >>>>>>>>>>                 cnt =3D drm_of_get_data_lanes_count(of_node, 1=
, DP_MAX_NUM_DP_LANES);
> >>>>>>>>>>         }
> >>>>>>>>>>
> >>>>>>>>>> -       if (cnt > 0)
> >>>>>>>>>> +       if (cnt > 0) {
> >>>>>>>>>> +               struct device_node *endpoint;
> >>>>>>>>>> +
> >>>>>>>>>>                 msm_dp_panel->max_dp_lanes =3D cnt;
> >>>>>>>>>> -       else
> >>>>>>>>>> +               endpoint =3D of_graph_get_endpoint_by_regs(of_=
node, 1, -1);
> >>>>>>>>>> +               of_property_read_u32_array(endpoint, "data-lan=
es", lane_map, cnt);
> >>>>>>>>>> +       } else {
> >>>>>>>>>>                 msm_dp_panel->max_dp_lanes =3D DP_MAX_NUM_DP_L=
ANES; /* 4 lanes */
> >>>>>>>>>> +       }
> >>>>>>>>>
> >>>>>>>>> Why? This sounds more like dp_catalog or (after the refactoring=
 at
> >>>>>>>>> [1]) dp_ctrl. But not the dp_panel.
> >>>>>>>>>
> >>>>>>>>> [1] https://patchwork.freedesktop.org/project/freedreno/series/=
?ordering=3D-last_updated
> >>>>>>>>>
> >>>>>>>> We are used the same prop 'data-lanes =3D <3 2 0 1>' in mdss_dp_=
out to keep similar behaviour with dsi_host_parse_lane_data.
> >>>>>>>> From the modules used, catalog seems more appropriate, but since=
 the max_dp_lanes is parsed at dp_panel, it has been placed here.
> >>>>>>>> Should lane_map parsing in msm_dp_catalog_get, and keep max_dp_l=
anes parsing at the dp_panel?
> >>>>>>>
> >>>>>>> msm_dp_catalog_get() is going to be removed. Since the functions =
that
> >>>>>>> are going to use it are in dp_ctrl module, I thought that dp_ctrl=
.c is
> >>>>>>> the best place. A better option might be to move max_dp_lanes and
> >>>>>>> max_dp_link_rate to dp_link.c as those are link params. Then
> >>>>>>> lane_mapping also logically becomes a part of dp_link module.
> >>>>>>>
> >>>>>>> But now I have a more important question (triggered by Krishna's =
email
> >>>>>>> about SAR2130P's USB): if the lanes are swapped, does USB 3 work =
on that
> >>>>>>> platform? Or is it being demoted to USB 2 with nobody noticing th=
at?
> >>>>>>>
> >>>>>>> If lanes 0/1 and 2/3 are swapped, shouldn't it be handled in the =
QMP
> >>>>>>> PHY, where we handle lanes and orientation switching?
> >>>>>>>
> >>>>>> I have checked the DP hardware programming guide and also discusse=
d it with Krishna.
> >>>>>>
> >>>>>> According to the HPG section '3.4.2 PN and Lane Swap: PHY supports=
 PN swap for mainlink and AUX, but it doesn't support lane swap feature.'
> >>>>>>
> >>>>>> The lane swap mainly refers to the logical to physical mapping bet=
ween the DP controller and the DP PHY. The PHY handles polarity inversion, =
and the lane map does not affect USB behavior.
> >>>>>>
> >>>>>> On the QCS615 platform, we have also tested when DP works with lan=
e swap, other USB 3.0 ports can works normally at super speed.
> >>>>>
> >>>>> "Other USB 3.0 ports"? What does that mean? Please correct me if I'=
m
> >>>>> wrong, you should have a USB+DP combo port that is being managed wi=
th
> >>>>> combo PHY. Does USB 3 work on that port?
> >>>>>
> >>>>> In other words, where the order of lanes is actually inverted? Betw=
een
> >>>>> DP and combo PHY? Within combo PHY? Between the PHY and the pinout?
> >>>>> Granted that SM6150 was supported in msm-4.14 could you possibly po=
int
> >>>>> out a corresponding commit or a set of commits from that kernel?
> >>>>>
> >>>> For "Other USB 3.0 ports", as replied in USBC driver, USB3 primary p=
hy works for other four USB type-A port.
> >>>
> >>> So if that's the USB3 primary, then why do you mention here at all? W=
e
> >>> are taling about the secondary USB3 + DP.
> >>>
> >> OK, sorry for confusing you.
> >>>> The REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING mapping determines how logi=
cal lanes (0, 1, 2, 3) map to physical lanes sent to the PHY.
> >>>> This ensures alignment with hardware requirements.
> >>>> The PHY=E2=80=99s polarity inversion only adjusts signal polarity an=
d doesn=E2=80=99t affect lane mapping.
> >>>> Both DP ctrl and PHY lane related config will not affect USB phy.
> >>>
> >>> Probably we misundersand each other. The DP PHY should have orientati=
on
> >>> switch register, which controls whether 2-lane DP uses lanes 0/1 or 2=
/3.
> >>> Can you use that register?
> >>>
> >> Yes, DP PHY have orientation register as below.
> >> DP_PHY_DP_PHY_CFG_1(0x88e9014) bit(7) SW_PORTSELECT
> >>> Also, could you _please_ answer the question that I have asked? Is th=
e
> >>> order of lanes inverted between the DP controller and DP PHY? Or betw=
een
> >>> DP PHY and the DP connector? If one uses USB3 signals coming from thi=
s
> >>> port (yes, on the other board, not on the Ride), would they also need=
 to
> >>> switch the order of USB3 lanes? If one uses a DP-over-USB-C, are DP
> >>> lanes are swapped?
> >>>
> >> It's inverted between the DP controller and DP PHY.
> >> If other use USB3 on the other board, will not need switch order of US=
B3 lanes,
> >> If one use DP-over-USB-C, then need DP lanes swap.
> >
> > Thanks!
> >
> >>>> Without extra Type-C mapping, the DP controller=E2=80=99s mapping in=
directly decides how signals are transmitted through Type-C.
> >>>> Mapping ensures proper data transmission and compatibility across in=
terfaces.
> >>>>
> >>>> We only found sm6150 need this lane mapping config,
> >>>> For msm 4.14, please refer these links,
> >>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c6=
7d4f1915b05d0c1488/arch/arm64/boot/dts/qcom/sm6150-sde.dtsi (qcom,logical2p=
hysical-lane-map)
> >>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c6=
7d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_parser.c (dp_parser_misc)
> >>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c6=
7d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c (dp_catalog_ctr=
l_lane_mapping_v200)
> >>>>
> >>>> If need process orientation info like dp_catalog_ctrl_lane_mapping_v=
200,
> >>>> then
> >>>> if implement in DP phy, then we need config dp_link register in PHY,
> >>>> if implement in DP link, then we need pass orientation info to DP dr=
iver, perhaps we could add a new attribute to the phy_configure_opts_dp str=
ucture to pass this.
> >>>> Do you have any suggestions?
> >>>
> >>> Does SW_PORTSEL_VAL affect the DP lanes on this platform?
> >>>
> >> SW_PORTSEL_VAL for USB3PHY_PCS_MISC_TYPEC_CTRL will not affect DP lane=
s in this DP or USB3 chip series.
> >> USB3 will use USB3PHY_PCS_MISC_TYPEC_CTRL(SW_PORTSEL_VAL BIT_0) and DP=
 will use DP_PHY_DP_PHY_CFG_1(SW_PORTSELECT BIT_7)
> >
> > Is it possible to set this bit from the PHY driver rather than remappin=
g
> > the lanes in the DP driver?
> >
> I have verified and confirmed with chip verification team.
>
> We configured the logical2physical mapping primarily to correct the PHY o=
utput mapping.
> Currently, the logical2physical mapping defines the input-to-output mappi=
ng for the DP controller,
> while the SW_PORTSELECT in PHY determines the swapping between PHY input =
ports 0=E2=86=943 and 1=E2=86=942.
> When the DP controller input to PHY output mapping is correctly configure=
d, PHY's SW_PORTSELECT can be used to implement flip operations.
> However, due to the improper mapping implementation on Talos platforms, u=
sing SW_PORTSELECT would require additional modifications to the logical2ph=
ysical mapping.
>
> For example, other platform except Talos implementations the data-lanes m=
apping follows <0 1 2 3> sequence.
> A proper flip operation should produce <3 2 1 0>, which can be equivalent=
ly achieved either through DP driver configuration or PHY portselect.
> But in the Talos where the initial mapping is arranged as <3 2 0 1>, the =
expected post-flip sequence should be <0 1 3 2>.
> then when applying PHY SW_PORTSELECT setting 1, the PHY output becomes <1=
 0 2 3> which mismatches the expected pattern.

Ack. Thanks for the detailed explanation. Please add similar text to
the commit message, with the only change: s/Talos/SM6150/

>
> To maintain cross-platform compatibility between Talos and other platform=
s, recommend the flip handling at the DP driver level such like dp_catalog_=
ctrl_lane_mapping_v200 in sm6150.
> >>>>
> >>>>>>
> >>>>>> Additionally, if it were placed on the PHY side, the PHY would nee=
d access to dp_link=E2=80=99s domain which can access REG_DP_LOGICAL2PHYSIC=
AL_LANE_MAPPING.
> >>>>>
> >>>>> I was thinking about inverting the SW_PORTSEL_VAL bit.
> >>>>>
> >>>>>> Therefore, we believe that the  max_dp_link_rate,max_dp_lanes and =
lane_map move to dp_link side is better.

--=20
With best wishes
Dmitry
