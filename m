Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C56BCF87D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 18:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C6910E09F;
	Sat, 11 Oct 2025 16:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFtwP9Uf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E90710E09F
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:57:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B3VKB5019194
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Xy1TDfM9Hn+Ss3qcAnJ0/lo5
 9/hSSLBS4fspMrOt/L4=; b=CFtwP9UfiZHiCGMUOw1deU4fP4xpIF+oTXGJDPPE
 tIL89PvjLtTf/YbkszSYepRnEDxvkn3PVliVw4u4TAkGO3LUgC/Q9jdUNZLTdGwo
 gmqHB9xnY0fbHRymvvggtm+gwEPtfxmvem0N1+J5zGWuk/yAZ8j913d3wv9kfqCu
 znuNTU5DIfxEgKNV/JyFbG1dm0iQ8kEDixgK4WteCdzXVvJp/OSPlJHWMT3v+R9/
 ROSpe+5KfOguZ+K4VVqtIUghzCUQklTR8lLvDJ5jbRIERbz+7G+oGIRc8RvjdGJl
 wqvtgyUzuJ6JXTrmQZv4RdlrXbiRL+GtUJw8xbEOEC6jEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8rx6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:57:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-854bec86266so929675985a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 09:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760201830; x=1760806630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xy1TDfM9Hn+Ss3qcAnJ0/lo59/hSSLBS4fspMrOt/L4=;
 b=aGQanJf56N/yzLIXXRE+eqiy1ylZ8krJfmWsQ9mpYcxsiIZpj7HAq0sQjaNj+HQ32i
 RFoBeTl8UzGkXs0Wjfdleo0qNSfUzrJGyu0qMRTlbo/J5btSu1bfcFGG8vG/JhQsZE9F
 URykByG0QggV5YB9Q9qIsU6C9XM/yogOjwK69FzJfATLVQYacMOrMgeQBoF2/GXzbQKM
 /QIKF/3BBVN/AIaZSf332uz3VN6goH+unUpNzHTUofpmLylmjWxvr3nvlbFoelFqy9hI
 ZR9J02HJ6ky3/MOlV6/Qa3/SfsI6nmH/vM5l30DiC6keh2ed/oZ8thvmCt8XVTetklqp
 UKTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYXOXYHzl3ltmu3LYK63RJvO51DR/oKCisY8lEabUCZ19/tucwA0RMO/MiXI/7ivnmZkVDY+q2r5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW3aTTzK5Cmy2H4VQkzJRFs8Fzfl5uTepCLEl+vTxJwPic/IgL
 ryaWfn1G04TOzz6fGbazecM7cDhYAjPQ7ZRAXOPx2OXzfZKxQSt/pcE/VbN4BotXe1TmYPMRNn6
 N4XjojN/lhz7wpHdQoJfP8ZQK9DpELloIlgWNKsGmk6YoP9B4yZMNX4ZwssIi8KHszuRkWo4=
X-Gm-Gg: ASbGncv6OLxbTTPLetyVxhy07ffhjAzPqXaXRRzDWl3ukrivstKzmoOOhcpcDpmk3qg
 Be3z5QYvACNqJ4V5avVSDiq378hsGK2XZckXv8xe5UBrFhH1FG/iZJc+8zfbEDyUcsMDyw1zR6a
 /KBritugl8+cq98x+LgEmjU/UBrynjUGv6YqjH90WvJ96NaM1NGmHBuxBfjQxZ1o88gxqVCwCbh
 oKdJVXWkVCGgUdFBu8Vf/JRooEliYQCRv8/laBY1a1UDgb+/5sgh2AAcW2rjaY2M1Zky85ILsZc
 hnrLpk8TXbZAr6wGcKWCGBZ1lp5EaCnPhy8tlR/IUu2HomFVZlo3o+qiILJLUdaTDGdNnyRwseY
 jP4w3RHeRDrRvyaYKNeFVG5l1BSwdbtc7I56IaNtI3cqiTQV2KNRp
X-Received: by 2002:a05:620a:7116:b0:85f:82c1:c8b1 with SMTP id
 af79cd13be357-883525c06e8mr1943888685a.46.1760201830213; 
 Sat, 11 Oct 2025 09:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkyWtOfdJ+0TNDoUMTrOlJySqi8eotm+EQmXbUDmQfKpz1vM/MTeAx4339cLuXyfh1vmmWVQ==
X-Received: by 2002:a05:620a:7116:b0:85f:82c1:c8b1 with SMTP id
 af79cd13be357-883525c06e8mr1943885685a.46.1760201829687; 
 Sat, 11 Oct 2025 09:57:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59088577f2csm2081972e87.107.2025.10.11.09.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 09:57:08 -0700 (PDT)
Date: Sat, 11 Oct 2025 19:57:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 3/8] phy: rockchip: phy-rockchip-typec: Add
 typec_mux/typec_switch support
Message-ID: <xbblw4jfte7re2pyroanvzqv4ddwhxbgcui5ubpnw7rwuo4s4d@gkph7jqzf33o>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011033233.97-4-kernel@airkyi.com>
X-Proofpoint-ORIG-GUID: CAgr06h9Cwl3O55L1TcZA9fAwoEItLhI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2KapxgNhrUOm
 6oJdKcNgcbJoB1P636pw2ea16S5tPFjTDBBXDiI/QksSaxquMXXRTGA5TMvj6WFBtd+p3Si/l3T
 KRHw2R0DOX1El+4wBmKQ3eRHlIjzYhtzLY2IvnasRXtmmqgNDNTVf8CvvIpi5hdGxJ7LiUj+Kc1
 QnPFZxCSYMf4oT194klDf3BtmbAnujjAgvYydsL3anCGS1Yssu70GUNF8RXHLzKgt8gsHC427+z
 k0pkk/GjTLYXBTWpd2ddtgTo1pKlJsDIkwqLcfKeMNPbpxtwK0mt0qbGVMVCljNp/TYRebZHNx3
 d33DJLEjjJZfpMsSwtnH+y0wfu+oc3TfIc0lcFbQWhR8tPLZp7gpzmwG2RmUDXtrxCgwhFDsC7n
 1nwI9vQTp2rOvRMP2R0sI6ipd3HKCw==
X-Proofpoint-GUID: CAgr06h9Cwl3O55L1TcZA9fAwoEItLhI
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ea8c67 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=MMthkAsgp7NQWkXk_3cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Sat, Oct 11, 2025 at 11:32:28AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This patch add support for Type-C Port Controller Manager. Each PHY
> will register typec_mux and typec_switch when external Type-C
> controller is present. Type-C events are handled by TCPM without
> extcon.
> 
> The extcon device should still be supported.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> (no changes since v5)
> 
> Changes in v4:
> - Remove notify DP HPD state by USB/DP PHY.
> 
> (no changes since v3)
> 
> Changes in v2:
> - Fix compile error when CONFIG_TYPEC is not enabled.
> - Notify DP HPD state by USB/DP PHY.
> 
>  drivers/phy/rockchip/phy-rockchip-typec.c | 365 +++++++++++++++++++++-
>  1 file changed, 349 insertions(+), 16 deletions(-)
> 
> @@ -850,6 +998,72 @@ static int tcphy_get_mode(struct rockchip_typec_phy *tcphy)
>  	return mode;
>  }
>  
> +#if IS_ENABLED(CONFIG_TYPEC)
> +static int tcphy_orien_sw_set(struct typec_switch_dev *sw,
> +			      enum typec_orientation orien)
> +{
> +	struct rockchip_typec_phy *tcphy = typec_switch_get_drvdata(sw);
> +
> +	mutex_lock(&tcphy->lock);
> +
> +	if (orien == TYPEC_ORIENTATION_NONE) {
> +		tcphy->new_mode = MODE_DISCONNECT;
> +		goto unlock_ret;
> +	}
> +
> +	tcphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
> +	tcphy->new_mode = MODE_DFP_USB;

Carrying over unanswered(!) comment from the previous series:

I don't think it is correct. Orientation defines only the cable (plug)
orientation. You should be getting the mux events for the mode
selection.

> +
> +unlock_ret:
> +	mutex_unlock(&tcphy->lock);
> +	return 0;
> +}
> +
> +static void udphy_orien_switch_unregister(void *data)
> +{
> +	struct rockchip_typec_phy *tcphy = data;
> +
> +	typec_switch_unregister(tcphy->sw);
> +}
> +

> @@ -1037,6 +1251,89 @@ static const struct phy_ops rockchip_dp_phy_ops = {
>  	.owner		= THIS_MODULE,
>  };
>  
> +#if IS_ENABLED(CONFIG_TYPEC)
> +static int tcphy_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
> +{
> +	struct rockchip_typec_phy *tcphy = typec_mux_get_drvdata(mux);
> +	struct typec_displayport_data *data;
> +	int hpd = 0;
> +
> +	mutex_lock(&tcphy->lock);
> +
> +	switch (state->mode) {
> +	case TYPEC_STATE_SAFE:
> +		fallthrough;
> +	case TYPEC_STATE_USB:
> +		tcphy->new_mode = MODE_DFP_USB;
> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], 0);
> +		break;
> +	case TYPEC_DP_STATE_C:
> +	case TYPEC_DP_STATE_E:

You need to check that altmode->svid is DP before checking for these
modes.

> +		tcphy->new_mode = MODE_DFP_DP;
> +		data = state->data;
> +		hpd = !!(data->status & DP_STATUS_HPD_STATE);
> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], hpd ? 4 : 0);
> +		break;
> +	case TYPEC_DP_STATE_D:
> +		tcphy->new_mode = MODE_DFP_DP | MODE_DFP_USB;
> +		data = state->data;
> +		hpd = !!(data->status & DP_STATUS_HPD_STATE);
> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], hpd ? 2 : 0);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	mutex_unlock(&tcphy->lock);
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
