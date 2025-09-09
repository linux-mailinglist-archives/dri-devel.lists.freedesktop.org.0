Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A678AB4ABAB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B8E10E246;
	Tue,  9 Sep 2025 11:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocZKxBmq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640F410E246
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:24:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LiP0020685
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 11:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KRjLROUBK5GNMNTT3bqbN9Gw
 tJh3/RE+/25tzLkEzd4=; b=ocZKxBmqiKmvw6Je/NWnjH48liN++RNyJ9wA43xV
 bnpm0pmhorsTk5HRgFSWPp1+laYU4FarMjvSIRJvEmctbN70tbPJWCRlwI6r8b3P
 8Apqi7+3w2HAjS7fNcuhnEBqTsdHzcKs/FajsJLrfGSaiLXt3A6WbaaYG24QoLEW
 vwyU1AMMW5XD5697kW5VuaXHM0f6JurzSd1tpxBETh9lw1TNcTwON1BSTlqlQ5jm
 rzFjoThNh4ueyIA84rzfeT1uUxHGyqmGcLJxQTgmC9MXTuWjrDXEDi6m2dnz88mn
 JY7ddj0YsDcQsIiXiBpmOeTLnEAVUR+3+GQ6LnEAvF8OCg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a7x1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 11:24:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5f290579aso102002331cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 04:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757417054; x=1758021854;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRjLROUBK5GNMNTT3bqbN9GwtJh3/RE+/25tzLkEzd4=;
 b=Q52cWoF0uwuWU6mOyThvDvI3G9reAOELFzCWoLYfh/tMFEqaIbOJH33n0ckSEXUdfs
 wKIhUL7vodnXo6NhrGJQEEkdf1dY7p7SJCprr1ZHX4dAumlwUwQds9wR1ayybVHdJZb0
 sgGAkT6gVOjIZ39QTyPoN4FQs/SzR0MS5eHVm4hIKaJht6uZf+K81YYOKwuGCl8h1Bw8
 rjHxskhMLh0Fdvaa0vLeU2uNvdh/xAxBfUZEgYzNHaWTr/+RTmuDbqtIXPDXQmqX0FEu
 GTOOeZt8tv43wjRSSGhLtSDsn2FL5wXyouLqbFtDefgKKjTrsmCB/jHaBGpArOQbX4oI
 sr0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6qiWFAiV3AmHkt25Ja3gbqi4rcz02N9fDqn0DiuNK5rYcBlObH+Y/h/F7aWGJ5/jcQ4jaJZZK9mM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWgvb21mKZlbLV2Z+MCJCLKz2AuQkb7SELB1MeWq34yr2KGUVK
 MUGYWsn7IMFBU3YSS9X/JaTR5YXHd30Nwq7e2htiQ8moQ2bpF7w52O25hcCqk18/UsuEfXZqpwY
 +wa0vRopD1tzvjE5YPBtaAWLOo5oNSvXlZlbFOmVsTQg81VCAXRX++Ct4yEslx3pC89+Cyuo=
X-Gm-Gg: ASbGncuKYxZwdBkDAPLhRrI64LDBAfE4rzCvIzdOpt3HvQy7LIlRJxYtB3v8jbwILcm
 t2V+OcYdBujXTKYEp/2n6+ngsPLbsQtxOl8E9iiw8MpS0qaiqDVwyVZkQlkdqR7PR0z9T/8/Kr5
 vvHXv591eV4rg+LeDlDUL7xno2aJuUAvqRyc9CgH8PXkwvhqCzvmPNnGQXVUbsHBjPrKMIERwDp
 ejkXcUfwn9jq3b0IfWGbAJFWfq6iGfxSa0SDe4//lve/6zddeZpixUirNrORCBlQSMxQrdwh4FX
 fs5g4LQN/eYH9yhIIhjBxYJGBelhkzwe6f2drKl8QLgkFk1HgJ/5Mi3VDyM4DizndzYAOM9pBLh
 DvmCbr3IaNKOxb6JaUaiXhIZwE4hQZs3LxVPWvQFUF5p6VOqEur28
X-Received: by 2002:a05:622a:4ccb:b0:4b2:8ac4:ef64 with SMTP id
 d75a77b69052e-4b617ab79a6mr53467771cf.71.1757417054191; 
 Tue, 09 Sep 2025 04:24:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwyKidHOZHQUdMHjuNAtLDDa/IAQun/33WbLv7lhyDBwjJicuH8c4C2tkyAmG306W39xJ2pQ==
X-Received: by 2002:a05:622a:4ccb:b0:4b2:8ac4:ef64 with SMTP id
 d75a77b69052e-4b617ab79a6mr53467261cf.71.1757417053656; 
 Tue, 09 Sep 2025 04:24:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680c424dafsm469142e87.28.2025.09.09.04.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 04:24:12 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:24:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 4/5] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
Message-ID: <77itzcvk23emlsoem2xcs7wswic7a2nj52i3m74kmkmo3xp65s@lsh7vmu2aqjb>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
 <20250908-topic-x1e80100-hdmi-v3-4-c53b0f2bc2fb@linaro.org>
 <dfhvmeo3pnjubgiwvakpzhzgl6uwlopyrkwuqyhfqw6jfh4mty@t4lhuh4jh6af>
 <b8156d1e-a4a5-46dd-8b78-4f2528a177c3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8156d1e-a4a5-46dd-8b78-4f2528a177c3@linaro.org>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c00e5f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=bPd9SfhoXQ6rEPgJaLYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rQF-Hp23vXw6b1a0IpLqChnP9qwhJ7HA
X-Proofpoint-ORIG-GUID: rQF-Hp23vXw6b1a0IpLqChnP9qwhJ7HA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXyMDn0sg4CLTD
 s0qD2I3XQ7NhOkAYM7wFtkgo0B34+uEOpnC0UcLPrlKgtYpOtvraAJIrdOiFwvVJHJ98m8dg6vN
 kqh4eBN3B2UbX4/rPKcMdTPNFFllSu0ohKu7vz/bp3vVdLnO7H1F92WjRDoVNF+d9t6p+y0l7nM
 /LgT/rC3fYPCAaOjTfLjZXgsF+FqtkXPVeqCgTDYIZXMMSgHWd7p8O9b+OD1eHPV6dTyyG7+B1R
 FhxO82CSWnuKgmFwE3d/xnMd2/PT+d/1EBEuYrPr21eFc2Wlg+Jf9BtNHJbbG4kYJd9M/fNOsRZ
 V2yt0aYIfEfYyLPfp52wk4bXcWQadxUKIrK8GOI5GyysOVcAdfAIB1RNtTbfMz0vPTmAkCUua1h
 owdwRYpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On Tue, Sep 09, 2025 at 09:21:33AM +0200, Neil Armstrong wrote:
> On 08/09/2025 23:24, Dmitry Baryshkov wrote:
> > On Mon, Sep 08, 2025 at 03:04:21PM +0200, Neil Armstrong wrote:
> > > The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> > > of a combo glue to route either lanes to the 4 shared physical lanes.
> > > 
> > > The routing of the lanes can be:
> > > - 2 DP + 2 USB3
> > > - 4 DP
> > > - 2 USB3
> > > 
> > > Get the lanes mapping from DT and stop registering the USB-C
> > > muxes in favor of a static mode and orientation detemined
> > > by the lanes mapping.
> > > 
> > > This allows supporting boards with direct connection of USB3 and
> > > DisplayPort lanes to the QMP Combo PHY lanes, not using the
> > > USB-C Altmode feature.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 132 ++++++++++++++++++++++++++++--
> > >   1 file changed, 124 insertions(+), 8 deletions(-)
> > 
> > Looking at the patch... Would it be possible to make it more generic? I
> > think some of the RockChips also have similar combo USB+DP PHY (and
> > similar issues). I believe, Mediatek might also have the same issue.
> 
> Since they don't use the data-lanes property, it's hard to make it generic and I would
> avoid migrating their DT to data-lanes just to solve HDMI on the Thinkpas T14s...

I'm waiting for Sebastian to respond regarding the RockChip USBPD PHY.
In the bindings he mentioned having separate USB and DP connectors, so
it might be relevant.

> 
> Let's solve this first, and code can be aggregated afterwards if the DT representation is correct.

Yep.

> 
> > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > index 7b5af30f1d028c592500e723ecd27b54ed554709..f3f91a69dc8b81e049cd06f7ab4f04baf57776cd 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > @@ -13,6 +13,7 @@
> > >   #include <linux/module.h>
> > >   #include <linux/of.h>
> > >   #include <linux/of_address.h>
> > > +#include <linux/of_graph.h>
> > >   #include <linux/phy/phy.h>
> > >   #include <linux/platform_device.h>
> > >   #include <linux/regulator/consumer.h>
> > > @@ -1744,6 +1745,21 @@ static const u8 qmp_dp_v6_pre_emphasis_hbr_rbr[4][4] = {
> > >   	{ 0x22, 0xff, 0xff, 0xff }
> > >   };
> > > +static const u32 usb3_data_lane_mapping[][2] = {
> > > +	[TYPEC_ORIENTATION_NORMAL] = { 1, 0 },
> > > +	[TYPEC_ORIENTATION_REVERSE] = { 2, 3 },
> > > +};
> > > +
> > > +static const u32 dp_2_data_lanes_mapping[][2] = {
> > > +	[TYPEC_ORIENTATION_NORMAL] = { 0, 1 },
> > > +	[TYPEC_ORIENTATION_REVERSE] = { 3, 2 },
> > > +};
> > > +
> > > +static const u32 dp_4_data_lanes_mapping[][4] = {
> > > +	[TYPEC_ORIENTATION_NORMAL] = { 0, 1, 2, 3 },
> > > +	[TYPEC_ORIENTATION_REVERSE] = { 3, 2, 1, 0 },
> > > +};
> > > +
> > >   struct qmp_combo;
> > >   struct qmp_combo_offsets {
> > > @@ -4167,9 +4183,114 @@ static int qmp_combo_probe(struct platform_device *pdev)
> > >   	if (ret)
> > >   		goto err_node_put;
> > > -	ret = qmp_combo_typec_register(qmp);
> > > -	if (ret)
> > > -		goto err_node_put;
> > > +	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
> > > +
> > > +	if (of_find_property(dev->of_node, "mode-switch", NULL) ||
> > > +	    of_find_property(dev->of_node, "orientation-switch", NULL)) {
> > > +		ret = qmp_combo_typec_register(qmp);
> > > +		if (ret)
> > > +			goto err_node_put;
> > > +	} else {
> > 
> > At least this needs to be extracted to a function (or set of functions).
> 
> Yes I was not sure about how to split, and overall I'm not supeer happy about the design.
> 
> > 
> > > +		enum typec_orientation usb3_orientation = TYPEC_ORIENTATION_NONE;
> > > +		enum typec_orientation dp_orientation = TYPEC_ORIENTATION_NONE;
> > > +		struct device_node *usb3_ep, *dp_ep;
> > > +		u32 data_lanes[4];
> > > +		int count, i;
> > > +
> > > +		usb3_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> > > +		dp_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 1);
> > > +
> > > +		if (usb3_ep) {
> > > +			ret = of_property_count_u32_elems(usb3_ep, "data-lanes");
> > > +			if (ret == -EINVAL)
> > > +				/* Property isn't here, ignore property */
> > 
> > In all thsese error cases we are leaking a ref count on usb3_ep and
> > dp_ep.
> 
> It would be much simpler to solve in a separate function.

I'd suggest having one function which gets USB3 EP and parses it (and
then puts it), another function which gets DP EP and parses it (and
puts). This way you won't have to worry about reference leaks.

> 
> > 
> > > +				goto usb3_mapping_done;
> > > +			if (ret < 0)
> > > +				goto err_node_put;
> > > +
> > > +			count = ret;
> > > +			if (count != 2)
> > > +				/* Property size is invalid, ignore property */
> > > +				goto usb3_mapping_done;
> > > +
> > > +			ret = of_property_read_u32_array(usb3_ep, "data-lanes", data_lanes, count);
> > > +			if (ret)
> > > +				goto err_node_put;
> > > +
> > > +			for (i = TYPEC_ORIENTATION_NORMAL; i <= TYPEC_ORIENTATION_REVERSE; i++)
> > > +				if (!memcmp(data_lanes, usb3_data_lane_mapping[i], sizeof(u32) * 2))
> > > +					break;
> > > +
> > > +			if (i >= TYPEC_ORIENTATION_REVERSE)
> > > +				/* Property value is invalid, ignore property */
> > > +				goto usb3_mapping_done;
> > > +
> > > +			usb3_orientation = i;
> > > +		}
> > > +
> > > +usb3_mapping_done:
> > > +		of_node_put(usb3_ep);
> > > +
> > > +		if (dp_ep) {
> > > +			ret = of_property_count_u32_elems(dp_ep, "data-lanes");
> > > +			if (ret == -EINVAL)
> > > +				/* Property isn't here, ignore property */
> > > +				goto dp_mapping_done;
> > > +			if (ret < 0)
> > > +				goto err_node_put;
> > > +
> > > +			count = ret;
> > > +			if (count != 2 && count != 4)
> > > +				/* Property size is invalid, ignore property */
> > > +				goto dp_mapping_done;
> > > +
> > > +			ret = of_property_read_u32_array(dp_ep, "data-lanes", data_lanes, count);
> > > +
> > > +			if (ret)
> > > +				goto err_node_put;
> > > +
> > > +			for (i = TYPEC_ORIENTATION_NORMAL; i <= TYPEC_ORIENTATION_REVERSE; i++) {
> > > +				switch (count) {
> > > +				case 2:
> > > +					ret = memcmp(data_lanes, dp_2_data_lanes_mapping[i],
> > > +						      sizeof(u32) * count);
> > > +					break;
> > > +				case 4:
> > > +					ret = memcmp(data_lanes, dp_4_data_lanes_mapping[i],
> > > +						     sizeof(u32) * count);
> > > +					break;
> > > +				}
> > > +
> > > +				if (!ret)
> > > +					break;
> > > +			}
> > > +
> > > +			if (i >= TYPEC_ORIENTATION_REVERSE)
> > > +				/* Property value is invalid, ignore property */
> > > +				goto dp_mapping_done;
> > > +
> > > +			dp_orientation = i;
> > > +		}
> > > +
> > > +dp_mapping_done:
> > > +		of_node_put(dp_ep);
> > > +
> > > +		if (dp_orientation == TYPEC_ORIENTATION_NONE &&
> > > +		    usb3_orientation != TYPEC_ORIENTATION_NONE) {
> > > +			qmp->qmpphy_mode = QMPPHY_MODE_USB3_ONLY;
> > > +			qmp->orientation = usb3_orientation;
> > > +		} else if (usb3_orientation == TYPEC_ORIENTATION_NONE &&
> > > +			 dp_orientation != TYPEC_ORIENTATION_NONE) {
> > > +			qmp->qmpphy_mode = QMPPHY_MODE_DP_ONLY;
> > > +			qmp->orientation = dp_orientation;
> > > +		} else if (dp_orientation != TYPEC_ORIENTATION_NONE &&
> > > +			 dp_orientation == usb3_orientation) {
> > > +			qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
> > > +			qmp->orientation = dp_orientation;
> > > +		} else {
> > > +			dev_warn(dev, "unable to determine orientation & mode from data-lanes");
> > > +		}
> > > +	}
> > >   	ret = drm_aux_bridge_register(dev);
> > >   	if (ret)
> > > @@ -4189,11 +4310,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
> > >   	if (ret)
> > >   		goto err_node_put;
> > > -	/*
> > > -	 * The hw default is USB3_ONLY, but USB3+DP mode lets us more easily
> > > -	 * check both sub-blocks' init tables for blunders at probe time.
> > > -	 */
> > > -	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
> > >   	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
> > >   	if (IS_ERR(qmp->usb_phy)) {
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
