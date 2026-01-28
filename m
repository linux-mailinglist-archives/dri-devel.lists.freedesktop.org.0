Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMhKM7LzeWnT1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:32:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49BEA0757
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5246F10E696;
	Wed, 28 Jan 2026 11:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOiVB/47";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhQ0QWX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873C210E694
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:26:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60S927iU811587
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +dtH0gsaiv63D6FJ6lGxMPX3Bt/oiCLpxKmOH0S/rHg=; b=JOiVB/47GEY29+7c
 tyZ7zuuAoSwDCKYobegMurNqDL2xMr8q9lgyWl9+MytsvPe0GWqd6//GnStisdr0
 H2gSq0wnNgnXBwG5OhP2Gc373shEN8EI2mD0pcOQ++FxoVOc2In3BCh+cApKiLNA
 F4WZtM2Y+qQVGQJUtqekKWyYftuSEnJWSNQZjOhsKJsSLlYPm2mtULhskK8Ed/Dr
 czouPkt+e18J8jO529G3MwMpW/EHoSrT4L47dzIT9o/EqxBAGku4/rBdOF6R+DA2
 cHtH7azYVabT98BfOUrj7B0maMDdLPOLQZqlEoUUZxjOcDFve17HzEAKyElUOltm
 j1v99Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbj833-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:26:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c710279d57so48602485a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 03:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769599570; x=1770204370;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+dtH0gsaiv63D6FJ6lGxMPX3Bt/oiCLpxKmOH0S/rHg=;
 b=BhQ0QWX9l1w4Q7Dtt8K19QXd4Toj+K8GlCjeSg5hlQHMLvtluBGD4+hN0z4I28eYNH
 IxTbWxSKs1+0i3QLH4/bkiE+tWyQVoTy0JTT2FA26pJBXhq74RctwaKLnOxV+lAKsZx4
 2wqYNrbQn8xQwAxT4Msik47536Gh5F6J2tVaQ+4hs6XzE4BcOwWvdxKV2GNrE2JbG1rU
 hIlMpDvoDDiQQvvsDtcLzbsKvjYNOMjDUuWZ/W6POsazUfzi5mwXsmn+YF9H+Q3XURxZ
 ortf4mmor5ck+z3JPd1ACWXkJ31jvS5yz2aKBLqn2ck9Y4IuZ7OqgNOgkyDWNzKShyiZ
 V4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769599570; x=1770204370;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+dtH0gsaiv63D6FJ6lGxMPX3Bt/oiCLpxKmOH0S/rHg=;
 b=TOfd+sz+xP4mVIrvhPwXnCfXbPpo5yliI+KwKr/Jlt9GJ/tiNj7MExevPr6nnvf2GW
 HfQcJt3YtRG0oDPRwPc5rIkJ7E4lgp8wkqqC6xdwSM+wOn8qwJ2RLUFt01DMgKGDqMdj
 w9dmi3oLRWvaa7F1D8aAj1kbDaa++oGcrl16ocT731otjBmiXlrbvW+nqZ0kfl/zpaz1
 trTAAF7e+I6kD1tny+8ENRv41zzPkO/jxdPAF2YzefAaAJvL3GdakRU1hzsYJV/kr4WP
 J2sbZ6kZRJ2BOaN3Y5qOho7La6ML+oJeU0omtXcgSitqkKk6yipGxPuVXTpaO7mRg+uv
 yulg==
X-Gm-Message-State: AOJu0YxUm48VEWguJ1H5sJEab0BNOXCHVxuuoVOJJMEC1iy1bF0IgAq0
 nGI1zjx0XS0297TkEgl3GwRUVogP4KZmNEojTny/zngES43j0FxFpr5FJ4v4Upy4mV3u6EKoQWl
 /N0ANKWyhOctadxjuNscK6hyhEePRo+PQoOjA9CYpy4bCyVl3y9xFS5LbO6/rIkzdY4tKCJE=
X-Gm-Gg: AZuq6aIlj5OGU5mlFwxkIQKjWxf2DRINyZE/JSw/R9fE0hMI0FFgRpVn8sAnGmzDOUw
 BJDJR3HMLRVWz+P7UT4oELO8UxSvt1XRG4jZRDNQn1+XEl8Q5kFtTsVFwF9ak8UA/LzGtemoTQm
 BXNfmulItV/dEUePreQ744fYLi8kcSdHXO+55vDOssCdmv3rPSz+nRe+lEsV4StYczOhaTaswm4
 7jxscs371pLuZS31a1Ka21hksjHl9mWRnGygTKtdc56YAMzIDH4BtcOJS+//hc4U/M+IuCGVHg2
 AW/X05Ckl+UPGpl1KUynUr9/eJfo4ySQnp6RzcPnE5xNs8cxwhFQNJiFINtAz47ZfEeELS0wyDm
 QPktnWU2F38EIv3QdSovENiyVttkXU9g9nR23R94uw3bDjJA5nPTqi5uNYSeVg3KIDdo=
X-Received: by 2002:a05:620a:5817:b0:8c7:17af:7ae with SMTP id
 af79cd13be357-8c717af0904mr41074085a.7.1769599569872; 
 Wed, 28 Jan 2026 03:26:09 -0800 (PST)
X-Received: by 2002:a05:620a:5817:b0:8c7:17af:7ae with SMTP id
 af79cd13be357-8c717af0904mr41072685a.7.1769599569390; 
 Wed, 28 Jan 2026 03:26:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf183cbesm111830666b.38.2026.01.28.03.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 03:26:08 -0800 (PST)
Message-ID: <37689820-4d67-4422-98a8-d01275cf4904@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI
 Port B
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
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
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Roger Shimizu <rosh@debian.org>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wOOG71Pd6aOJBlTBLlPu4RHUT1p8Yk7K
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979f252 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8
 a=6TRhWV5S5Ysso8lYXqYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: wOOG71Pd6aOJBlTBLlPu4RHUT1p8Yk7K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5MyBTYWx0ZWRfX1oFqp6I7CAts
 X1T+Lxjav3u79N1/bzQLTjgcO9h4j1SGLOLQe8z033x+DEqnZCLomF7s2SMJPeu6+YgWcOMPxq1
 +xUmmCVALfWhQudva3J8D+jurg85fDs+KDyl5BXiXwiXoEVA4JvoUkBezLJ4AoZKCQ7syx09icm
 1nuMasTcAHVk/inzTfcEwda3OOcnQys68/EwNg+9i0cu5RlROFPC/7t/WNBuOXBMOuMc2QiINhJ
 /oqu/IDcMjq3knkdvYNCgZMKRgXyqgUCrml+/g+qhBd3w+xKWzLVXGo1mE9AJI/ALgCQS4F8HsH
 USPi4ZqGKu2Mj73/Bg9pU5Dl9WCxc+atQ/whW2SMvhvQ6vtZu3bKfLvcjogEmjV8TVzgy2xEaEG
 m2R97FAGcsyZD0wIKbuBata31uyKze2i1FNxCuheb5ouuR34+lbXFVaDtAmBS2opdbBYKaJbCyz
 tL7J+GzsPCQDUyta9QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280093
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
X-Spamd-Result: default: False [8.69 / 15.00];
	URIBL_BLACK(7.50)[thundersoft.com:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rosh@debian.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_TO(0.00)[thundersoft.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email,thundersoft.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: B49BEA0757
X-Rspamd-Action: add header
X-Spam: Yes

On 1/28/26 12:15 PM, Hongyang Zhao wrote:
> The LT9611 HDMI bridge on RubikPi3 has DSI physically connected to
> Port B. Update the devicetree to use port@1 which corresponds to
> Port B input on the LT9611.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---

Fixes: f055a39f6874 ("arm64: dts: qcom: Add qcs6490-rubikpi3 board dts")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
