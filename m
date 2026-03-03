Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMwwBJDmpmnjZAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:48:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D251F0A8E
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88B210E818;
	Tue,  3 Mar 2026 13:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXghRw4D";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3GyYhZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7378510E80F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:47:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239nGbC3349600
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 13:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=idB39/nW/QhmcKfOGj0Rxpu2
 b1UnI9mrQh1XvR9bGp8=; b=eXghRw4DzPDoGGV5ypOhZGjCv9ygZv2FFxbr3B/c
 KSaIPFeudF/6b7fmGYhuEIzvKWmJJWl2GLJnPG0+ga//Yhtib8DbxDKih2V3GNV7
 4+OJt3RDYlxmXFMKoBM39X/yZe4yWzBlR398QdEMRbduOT7N844NUjEd6zaRVw8e
 +yE6833LC9VzABZXLORmWNat/WMYN1lEBoZyrfZMwQSTTCB51SyQi8t3KZmOVQBg
 b5jOMcYXgKTdEZm8Il400SUoqK3eUt/diH5pHpTQLHaPgFewr1yJr+cd10kZxI9o
 tLd7Sz2nOUUYtH3AoNDDb1yzVzNueFJEtrl4rFBGeZBQ3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsay65-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:47:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c70ab7f67fso6292330485a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 05:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772545659; x=1773150459;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=idB39/nW/QhmcKfOGj0Rxpu2b1UnI9mrQh1XvR9bGp8=;
 b=i3GyYhZC9J4kNwkGoadfqq+1ySflqaKdz0dWynC4OVhWtuozNVAK8WFJtPFny4c720
 OQ1vgWaZ//NK/3sUTZGizjB9gr14CFqQgWaZMF1IeFebguvQ0dEQJcZcx4pU0HN5zrnh
 GprQuvjVNpp7eEJCwrjts+b2LzofOB98W8vNLJnsrq/LTm3TT2NzwL7XsyAmZP7fKOJ5
 eOvxJsG/9WovjuFljxRZ+XgmA1CoaFJNMOeDn9gu+jwUFuZouhHgJL/En1L+S4/ykmoo
 VnzSsj6JvKZ1kO3E6RZDR90dopsrkHanOaTTUhQacgGRsqVJS9eqbj+vtbjb6DPvc9o2
 Zj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772545659; x=1773150459;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=idB39/nW/QhmcKfOGj0Rxpu2b1UnI9mrQh1XvR9bGp8=;
 b=RD0X+bMtCkAlFEnQiOu0F4sQnPCldnOOwuidoxQDdsufwPPTEgsv2cirvEIPA/uZip
 mM6yzCMy8EVxhL3B16GERGy/TN+ouAhKm1olJq1SHBduwk0EH9fsvS1pvD4tphvYwCFo
 uFqGmkCfkVL/gSKFiqnVBEr8MPYHh1ZEsij3PZEgJB/EG4ckDZpAGnJGVaA9lqG12XBN
 3fE6PaqM0MDT4FLXH7lOGJgMClzrAWcjris8HW+wm8esAKpLE8dvntoVRLVdFz7etr2n
 OIw67unIyNqYzd8ddrAgjXYedzAJsk7cTQ6RANF43wf6oV9iHeiaA9xzIFoln8ym7xan
 j3AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+jiPzTapf6zA74pqQUnV2s1eJmOuNA37IEB9KZUnpABBTNZKD4zeSvw86JvRWUMSzyaOesHBbQYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTLfPSHairDDIsHk1ZPrTekCDgYOa8pRLTIJ0UwBT/Pn5ucKzF
 Dux1p+rP8oUbaiLsRL4aDJjy9IekwclwaUpPuPZ+kYNAO2i/uxTv76XjH8vgt2K3Sd7cxhC8qx1
 SMIR3sRhw26qgFeHc6h14obYhEx8LgLpf99Jc61M122isCfoUF1z4X34OpH0No+Jjrzfrzjg=
X-Gm-Gg: ATEYQzwjQLRjoGwG2wVyyQobE1qPNMoY+gUeGHDF0RKgYEYmC5fA8QWFz49z6+nZCws
 l26APd/uRRFMxISUpZR6MIGDhPxwwY4ogvl8K+BQM+xd9ITC/Kffu4VcXkVQITpZlE5sfMTLSEV
 oNl9CMSeZg79w/nuI7nfz2Or7JtCRpd0e9nD+OEG8CGE1i2vin0PR2+gBrnQ9aPmKcpXjpL7ZPO
 giM1NmeebrUr+bbPcJVZ7oEmtw5pl+jjmwexFSJWoOGngiSyyUoNTn29giJAScGfts6njXljp1e
 Yr1eqOmdI808Zj04dwNdXivnL6B2wnanlZYo/cKBuATK2KJiKrKAT0MdWFQwNgd490vTigBpo12
 8djvnYsWntqe3ZWEqXCZvpTaw/FM7VsnNO0zeCIxXhbXQGoOAmWIX1eQS3Snj5WGP+z5LFQlTaS
 y+O8H+cO+L4l4NrRtX21Yr+ttvT32mL7MvkUI=
X-Received: by 2002:a05:620a:d89:b0:8cb:b062:c2f1 with SMTP id
 af79cd13be357-8cbc8dee51emr1996041585a.29.1772545658944; 
 Tue, 03 Mar 2026 05:47:38 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8cb:b062:c2f1 with SMTP id
 af79cd13be357-8cbc8dee51emr1996038085a.29.1772545658449; 
 Tue, 03 Mar 2026 05:47:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a1235845a8sm578691e87.13.2026.03.03.05.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:47:37 -0800 (PST)
Date: Tue, 3 Mar 2026 15:47:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
Message-ID: <i5hiqu26ljplmajinfmf6spccydtfwgw3ak3ey6fuzykvrnusm@izbedyarqdow>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-2-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-2-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: S7IF73xg5y3fJvQDnYt_et8UIJaepDgO
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6e67b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=fTnWfZjI5X7wAvt4R4YA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: S7IF73xg5y3fJvQDnYt_et8UIJaepDgO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfXxCmtrFBvsBZN
 Va6rP7LZ7X+VrH8mTtCOr8iRoRdEG9/O2JhKIT8v1OSNsX81ar/Pk7Ids9mhJWT3I6X8cEVsIU7
 lsOWVIw9mrw285ouxFiimvOdxiLW9X3I7PPuY+7OEY/2m3gWFPEKE2HDdCbncgx+V1hIGxYldmt
 0z7dJb5lFeA3Z+ASQ0d9G+4qI0xX78vkYYLzwHV5UB/T1abZEPo9YYsh2OWltx2G3n+g6v6oCWb
 zqZTrPBdZULEQGDrPpxTRB7TpnWU16iBMjke8NlbClJx/YTwgKHc5vIE2UqERLaHID71N5VtQnv
 YOstvZR+4pRaafP/1gVppmjcQg6P2Je34FqSprPml4ekRVtCcoc7Uz6B9f7d667diC/M+iFnj/4
 Xsv4vQOvQ2YlY8wK357iPnjTyN5I5eTIEPkR0Jo1iBPkeUbNcrAvRUPk8yFRNBtAizHYYD6676l
 031SHYmNnPvqAQjaaTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030109
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
X-Rspamd-Queue-Id: 90D251F0A8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:52PM +0100, Krzysztof Kozlowski wrote:
> Add DSI PHY 4nm v5.2.4 for the Qualcomm Eliza SoC, fully compatible with
> SM8650.  Note that this DSI PHY, unlike the Eliza MDSS DSI, is not
> compatible with SM8750.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
