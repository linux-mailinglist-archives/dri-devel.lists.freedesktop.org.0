Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABcVKTauemnv9AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:47:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABEAAA5D1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F45110E79B;
	Thu, 29 Jan 2026 00:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fx0pyN6I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YMC++uAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9685410E2F2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:47:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SIO6oX2082186
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DqDq1cvCNyW61HnnmnGzvOGO
 SfA+3QT1Lq6O2dEG8gs=; b=fx0pyN6I+XTIjRFqz2AlVAmtwnzbW9KP9iddaPfM
 9VnzJeIoTsS4nTuv5K1m+D4WKK7pHoeYj5fJsVGkV1XBLDC+GRo0psfrv1J1154K
 cKTTTCJygpvTI9sEERdEySqQoEZwo7TqHtqPo2k84xJ8JeTNQbO9k/ljNvkvqyTx
 iKxfEdG467JCS6xYmxOCfDXhzFceu6+YNiB4nEcphrYqBphrM4BVDOvZeuEnZuJl
 gYMCYeNBBzRiSekY6c7b8eC3+SuBcn1esSaEYhfxbh2hnBgJoBM+RfDIyBpU5ZQv
 ZdURWdDc7gdWCBx8z+An1Wu5J8rnJ9VeGdEsZwrPCfAj9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byqpxgwqt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 00:47:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c70ef98116so90208085a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769647665; x=1770252465;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DqDq1cvCNyW61HnnmnGzvOGOSfA+3QT1Lq6O2dEG8gs=;
 b=YMC++uAgK+Qmvmtrr5LnlRr2yHBohgn+Gc+yhcZwwiT7oQZvqhT2jwpJb0KqRhYJ9Q
 1a9U08cwTJ0yIkYUqvk9yojtcSU4Uc/tUMIs9W6ft7lTLFAwcWzqwqFZrGHMF8aSrM/J
 uIXPQmwZbhOPA0xIhXGljQFPQ+FEIh0NH0XDANrbzT12Ev7BKbqOam8b10OHfIVDYTMQ
 OBNf6LhL6nb6R2LCQa5JigoRzi0Z2h1xvsZi0lYYdQLjUXG0TTF2ieAt2EfZJkNAop/F
 IObpLh6Bws9Gn+Di6xhUeElca8WFUl3PQkAcAqdB6j6Ur+K63pdEtfp/nxGcn+J3LDKB
 APYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769647665; x=1770252465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DqDq1cvCNyW61HnnmnGzvOGOSfA+3QT1Lq6O2dEG8gs=;
 b=rkRG5ZksBWozt5lDFKmDZ1gcE3uJOfI9Vu4DBnDd5xjzj3Dfgy9jYZsxUUhlgHmexR
 4TUBmtgbcPTQHd9wfnCvKvZPs7YR5Owjci8zXUUe4v1JFMNChOtkCwYAPxky/98dZL7N
 bPUlu3WsnWYVTZPYU6VQSIdRiR0cCpG9s+la5R0AjNlbomQyUpls8Wf+FeWhhxrBUH2S
 wXF2LpEK9z65juZpTqOg7z/LRyblf22luy4dYyv4XVGrFqCRsMEWdXBEAwPIayIHHjBA
 tQqQ0xtbrCGG8LNdT7UfBjBOktbfSwJ2Vu4LVre6sFj+o5iTuDrUteF0QYeHkKcqchP+
 77Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDVWSDise+qtL0ED0TINbP4zSqSdZffTOZ5u/kCzgAIilLDyZ+Rdxq9Wb1CwUM5mfZdxWlo9n6tWs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8CpPjBTr41YMw4kvdDQQI4sdAGocY7yGTX/mNABJwjUubzoDt
 tBLO9Ah57H30evVtP/8if32hxAqZrcohv7w+e2rInfsf54kaBl/HTaoZrjxRWKq7zjo23HFKTVj
 fIcsYHTz52hqgyrbFSp2MoL0dsP2fwPVxNtK7B/aqBX4/pDzKZDLXbOL8i4rEJbijTmQHimI=
X-Gm-Gg: AZuq6aKR2BA4gsyuoWcrgtCVgm6PVGuBUzbyWRUMryLNT6We99ddjYb3D/xskwlQNSA
 Wk7rktBpRVGckUwT9xPEWkaerIZ62oCYwTR6PRyztSxfzvnLPafrAF28LGWrCpjhbaPnP9mqj/e
 S0meTfXjuSoYUgpa4BBLVa5B9Diaru2ogtfWg4Nt12/jO4QA7pAlEGcqwNA8C+N88SnB1M0WuDp
 lzFO2gE+OwU2EzrqqbsdHbQLKfgW5kdpUdcDyUTjAOKjJNMpFDyMi03zUcOfka75xZM9tDvyW5N
 A7THLgVM+OrncPWdixRuRvLDFQlXl2eRS85B8zDr5E/TNzqZY8CNgBZv/OsX2C06oNY63vhDERK
 P8nso1RPRrStJ0ElozpKPYOxThK4NTj6XwRTaI3e2fphr+D8JuCoczNqiRizaeM8dPYND/RP5yw
 kThTkr3czVGRWph+28SzQ7x4s=
X-Received: by 2002:a05:620a:3705:b0:8c6:d309:212e with SMTP id
 af79cd13be357-8c70b906af1mr934999485a.63.1769647665043; 
 Wed, 28 Jan 2026 16:47:45 -0800 (PST)
X-Received: by 2002:a05:620a:3705:b0:8c6:d309:212e with SMTP id
 af79cd13be357-8c70b906af1mr934994785a.63.1769647664493; 
 Wed, 28 Jan 2026 16:47:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38625c74bb2sm7270041fa.17.2026.01.28.16.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 16:47:43 -0800 (PST)
Date: Thu, 29 Jan 2026 02:47:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH v2 2/3] drm/bridge: lt9611: Add support for single Port B
 input
Message-ID: <xlo7l73dzj2eah4skge2pc2uo7lnoqfyikeekazyrklnybdab2@37tlfbz2zqiw>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-2-ba51ce8d2bd2@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-rubikpi-next-20260116-v2-2-ba51ce8d2bd2@thundersoft.com>
X-Proofpoint-GUID: xdFsF5r0Xts0BIvSIBMQZo_r0iRv4knq
X-Proofpoint-ORIG-GUID: xdFsF5r0Xts0BIvSIBMQZo_r0iRv4knq
X-Authority-Analysis: v=2.4 cv=dfSNHHXe c=1 sm=1 tr=0 ts=697aae31 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8 a=A0XAqx3_xGthHy5t7UgA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwNCBTYWx0ZWRfX2AwyUE5pog1a
 swUcVeuxD1WklU8r3y2sThfYwLvos3Bm3YccrWXL8BpEmvH9F5Hp4anvcBbTluvqWmdxAn/dWQs
 cLsMNgh70wUnleaWSEMsAaNMoMwhiLoXWjApq5u3gCdQuiYs+qCe4VNBH8uG/K9Cxnf8ifSlgFq
 RRMtFb8+vFBkztgpRVQsGt5gKhAt1oD389Yue7hP7zrPBiouCSHGgeaSyA+BWdhDCHPdrF0N1df
 spwJwyOyvuE0t6yF5af+8t7DmmhRs7eTwd+t014EkNgaQ7+D6Kl75YmxlU+mkW/iirBdouth/0e
 gjkaCjQoW29jYyoX2eMH2qiSyEW/QzJanAxeyE19hUzN+jIuhIO1Ta/3xSjH000AFLkBP1c6q0S
 QfrUcGReTBl5BIDA2mfe8LBbh4KwIpiC/n663lEMRjrTJsGbiBxZWqJBAYepzw9h1neHbtxizfE
 0w/vHrTBplwVBN85aKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290004
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [9.19 / 15.00];
	URIBL_BLACK(7.50)[thundersoft.com:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rosh@debian.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org,debian.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.673];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,thundersoft.com:email,0.0.0.1:email,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: EABEAAA5D1
X-Rspamd-Action: add header
X-Spam: Yes

On Wed, Jan 28, 2026 at 07:15:46PM +0800, Hongyang Zhao wrote:
> The LT9611 has two DSI input ports. The driver currently assumes Port A
> is always used for single-port configurations. However, some boards
> connect DSI to Port B only.
> 
> Update the driver to detect which ports are populated from devicetree
> and configure the hardware accordingly:
> 
> - If only port@1 (Port B) is populated, configure port swap (0x8303
>   bit 6) and byte_clk source (0x8250 bit 3:2) for Port B operation
> - If both ports are populated, use dual-port mode (Port A + B)
> - If only port@0 (Port A) is populated, use single Port A (existing
>   behavior)
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 46 +++++++++++++++++++++++----------
>  1 file changed, 32 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
