Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E69BD1325
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 04:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A8310E363;
	Mon, 13 Oct 2025 02:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgBt1V/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D35F10E363
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 02:12:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D0slNZ006899
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 02:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=86ZWYyPnzwyBT1SEdx2OYD4Y
 N65eSOUUs/UhqpCdnLU=; b=DgBt1V/4SL91g2tYdnkd8pnKY7IuVA+EB+yRk0Vq
 v8PHbqTD0VzuzZyY21lKErYPzBoXYywy+s4e9jCOvA3kPBADojpuhoAXBxGvmtgc
 BT4BG9IFTTf8n2dEjw2F/8FWrtb31sviYrI5Se30CpVvFpocz165YwzJHDEKo1fX
 frSI4/nEPXQqFlP2+MjVLT7S48x0lOc+kmYEdEaEKYzGPP5zSJxvf65fBjKr1EPQ
 38PCMSI5I4C9C61Kd9DqFv0aJrFSHpfv19sw9sqCiu1xKoh27NK5iv8bqgbbvXIi
 YOqcZu0byPqYfQcYHIC/NJIBC6pMoZTkbHOFEA7f67qLwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfertyba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 02:12:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-88375754e8aso1696338285a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760321524; x=1760926324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86ZWYyPnzwyBT1SEdx2OYD4YN65eSOUUs/UhqpCdnLU=;
 b=W9jcOR+iAYTUoakVOfl5g7FzDC1/Z3qh3VVWhbmmqBKo2WKmzrxSXWCghtW8w7A4Vd
 H6biEDsCAAo+Y+cdjsj9KKYoiGw8MOStsHJSpwBAvZonykeSCh5JGlX7yqFTJW8OEsR5
 S3WX8n9DYtnlp9LwPGhWaHTKUnwKEZCRy0e5+QsokQgdzWXoNrE3TuQERpQT9Pr9KBK1
 IP+OY+8vScNt2DTOIELK7pdmcSajplOiCbBQ1SYVp3cIaVlTN+1kUJgaO+OxVEeagX4A
 wkxKIlG8jSyvcWdOY+xgpA+raxpNfQ+HHYpfQ+VUXaPgO5PMtBfyc9GF+rt7NeNwCkfX
 YqEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQt7KUOj1Npa6LlWtRQ3dlAAplySbhz24yWwLfmRQkK1ISzShHZBR1wHrjMbisx+ZBSEvwgM3LV9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV9SBL31xOJw5cVvZGNQZhK4T4aMOKQnfUDX5WqFPqpVt0dGh5
 0glrHFkptGMbmI2zMeGiIKTpnFoW19NmjWQnAAGyLqhoNdtBtV7Sn//MaMniBHlOUjrE0SUpc46
 xtIeUZGcldbmPJCns7bnP68SYWFKOKAwJGllmp1UpnLSmrEFF7Mm8sonhFJRtSWQefQTcrDE=
X-Gm-Gg: ASbGnctQsUr1gEKmN8z39/podxnvgKWoTsKWxqMzoTNd6NG771Oj2WzVnI1FacUE5vn
 U3I6fX/wnibSxOxsNO5mtq0NwFllbjhfGrQcbYPngEjy8hrxQvzG8nlDIqDtqoor8qT8ILT0iu1
 ZWYxNHjSv2iXpD742kofVBVRzfXkCIOW9p4idYEx3xWfrL+whPrnP1cYbCKIseeoslVPnyNlBki
 Bg0J0oXnQKPpF6uClLbVqAmCJ1NRX1fHwC7HQIMbfkIb7XfSySjXM2tr6YQHjMBOgZZ9aXwK0F1
 tDMFTTsj1xlhZ3KvYV3P6MyY8Y1Z1f+9+UelSjuC7geAKrUSZBz2rqbr21vNEVUq6lMwBUL9unE
 SQORLHfaNbjtUWLpI5668rnH2tOeliZvZxuCOtfpsBTpb/rCtXaQe
X-Received: by 2002:a05:620a:1aa7:b0:863:42ea:d687 with SMTP id
 af79cd13be357-88352d9a142mr2371627685a.78.1760321524328; 
 Sun, 12 Oct 2025 19:12:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMoQF7op5MF9g/GW/8bpQeNO9MGh0k/WN4mxk7m/kz0sYWr+GEzFx7kK0Z0muN7KMj1v1Eng==
X-Received: by 2002:a05:620a:1aa7:b0:863:42ea:d687 with SMTP id
 af79cd13be357-88352d9a142mr2371624385a.78.1760321523808; 
 Sun, 12 Oct 2025 19:12:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5909a119fdbsm2285439e87.112.2025.10.12.19.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 19:12:01 -0700 (PDT)
Date: Mon, 13 Oct 2025 05:11:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 6/8] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
Message-ID: <6hilafgpdbsppeeib75b5uamwf22kbu4likcp64ahb4u7zehhw@c3mtlzwx7qcp>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-7-kernel@airkyi.com>
 <qzcdulyj2enho7l6vyvad7ln46zk2u4z7rnsjv2nv4tbw5j6jf@6oenbixoh3sp>
 <08eb7560-c13e-462f-8110-d4ce5ccbd687@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08eb7560-c13e-462f-8110-d4ce5ccbd687@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ec5ff5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=46buKmVFnKFTYA1G4KoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: i6jzUUXN0oyf_6a7YiqvAw_N9jfz_ZPF
X-Proofpoint-ORIG-GUID: i6jzUUXN0oyf_6a7YiqvAw_N9jfz_ZPF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9geh7vf+IGtJ
 j3jC7VeQbButeEFgel5+TB3Qn4fC+hPrmHdshd1PPS6ajVqnh/0U7Mehamg4bge4paSodBynCpY
 Yu1ruxM80mp3/lARnB5dqZZSLY01SPbKfHo89lEZLbiDaa+iebPztZXBJOvhhsOJ0e/bnf6KnJh
 /6tjkVLO77a9AuUfCux0i6oTSgzqlssqhNqwRtBdKSZE/Zgm2WsL/6UetK2odsfRxX1b9DrW5Sm
 ebTcsk5PJWVk0iERuwimBpWgPtsFrRjM1D57AejurbF2iok8Iu/unBY5xoityJg/y6U05mX4clm
 LHr28oQkpsfnmKUEqMAO2cYPT69vZI1EXdnh5G4+sYkVXrGoj6QkZiGYkZ5zZhhjVB43/CMSfqN
 EObTeyR4QAEoJaF5H3w0JNdcS/X4Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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

On Mon, Oct 13, 2025 at 09:26:06AM +0800, Chaoyi Chen wrote:
> On 10/12/2025 2:52 AM, Dmitry Baryshkov wrote:
> 
> > On Sat, Oct 11, 2025 at 11:32:31AM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> > > the CDN-DP can be switched to output to one of the PHYs. If both ports
> > > are plugged into DP, DP will select the first port for output.
> > > 
> > > This patch adds support for multiple bridges, enabling users to flexibly
> > > select the output port. For each PHY port, a separate encoder and bridge
> > > are registered.
> > > 
> > > The change is based on the DRM AUX HPD bridge, rather than the
> > > extcon approach. This requires the DT to correctly describe the
> > > connections between the first bridge in bridge chain and DP
> > > controller. For example, the bridge chain may be like this:
> > > 
> > > PHY aux birdge -> fsa4480 analog audio switch bridge ->
> > > onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge
> > > 
> > > In this case, the connection relationships among the PHY aux bridge
> > > and the DP contorller need to be described in DT.
> > > 
> > > In addition, the cdn_dp_parse_hpd_bridge_dt() will parses it and
> > > determines whether to register one or two bridges.
> > > 
> > > Since there is only one DP controller, only one of the PHY ports can
> > > output at a time. The key is how to switch between different PHYs,
> > > which is handled by cdn_dp_switch_port() and cdn_dp_enable().
> > > 
> > > There are two cases:
> > > 
> > > 1. Neither bridge is enabled. In this case, both bridges can
> > > independently read the EDID, and the PHY port may switch before
> > > reading the EDID.
> > > 
> > > 2. One bridge is already enabled. In this case, other bridges are not
> > > allowed to read the EDID. So we will try to return the cached EDID.
> > > 
> > > Since the scenario of two ports plug in at the same time is rare,
> > > I don't have a board which support two TypeC connector to test this.
> > > Therefore, I tested forced switching on a single PHY port, as well as
> > > output using a fake PHY port alongside a real PHY port.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > ---
> > > 
> > > +	/* One endpoint may correspond to one HPD bridge. */
> > > +	for_each_of_graph_port_endpoint(port, dp_ep) {
> > > +		struct device_node *phy_bridge_node __free(device_node) =
> > > +			of_graph_get_remote_port_parent(dp_ep);
> > > +
> > > +		bridge = of_drm_find_bridge(phy_bridge_node);
> > > +		if (!bridge) {
> > > +			ret = -EPROBE_DEFER;
> > > +			goto out;
> > > +		}
> > > +
> > > +		dp->hpd_bridge_valid = true;
> > > +		dp->hpd_bridge_list[count].bridge = bridge;
> > > +		dp->hpd_bridge_list[count].parent = dp;
> > > +		dp->hpd_bridge_list[count].id = count;
> > This looks misnamed. They are not necessarily HPD bridges. There can be
> > a random chain between your controller and the actual output / connector
> > /etc.
> 
> Yes, and more precisely, this should be `pervious_bridge_list` . Will fix in v6.

I think the typical convention is around next_bridge, not previous.


-- 
With best wishes
Dmitry
