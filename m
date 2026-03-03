Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHxKLJuZpmnfRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:19:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660E11EAB0F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36C310E036;
	Tue,  3 Mar 2026 08:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2GpSR/Y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0FcEznF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317AF10E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:19:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6235fXJD2995968
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 08:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4N213Yy/tErC/qPxFB4Ckztq
 tBqutFx9DF1gTLrNKsE=; b=A2GpSR/YSU35p94ku9bB8xdmQIUe8J9wM74m1FoJ
 Ab8sgMbTptb3ppeypULLoSNUO+hqRKRH9/5XfpTbcSp8FfTvAZCONmN82DXRt9Vc
 LZrmJPmF+cBXeXl9GOQNz3N0GztUcvmv40l3vzajboP4X9L7CRxRiIlhqymXS8Lm
 iIgZAi65R4c8ayKRhNz4B10ZB4cC8kBzncxjbT9n21STliZ0ORmPVxYcWbQhmBAK
 WdB8rjk+f5mwzEcEDk9Gefyu8lRqLrRHm0vShUWUPnnKoS4/aRdq5e29XbNo82ML
 aJ02rY9h4XiShDY+N7xJlFqV04qoYEGMqMJ7rC5gKRw37Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnh6ua3nu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 08:19:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3ad1b81aso6517198385a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772525973; x=1773130773;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4N213Yy/tErC/qPxFB4CkztqtBqutFx9DF1gTLrNKsE=;
 b=O0FcEznFbtdiCq4nVLtFEsinL/4hbl66afMaIn37I/3d/VrXiZN4c3x0KU3kGEIXPs
 pPfjCfZvg/CYLREyKWlU2h5Cro1HeaevfIiZaD6+1IoxRgc2JfBT9EQA+a70RElqByJ7
 DmpD7Aej3ryASqmzoYy2s3T5HE2EZrlrFZe4toxYwO/uuORVCWvPIEWUuxpeW8RJK+1W
 PXnyouYXw1Xyz0WAxtJEOFMSCaLZdzdaqHp0a5tmFUJqPm2tF1mFYSYu92PfFRu4VYTK
 Jb95wEFagRx24EMpDbwffr9z3pD+cUMdFW63zg7AmU2Li5I+mQFk21M7fk2gRnZohVrx
 QCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772525973; x=1773130773;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4N213Yy/tErC/qPxFB4CkztqtBqutFx9DF1gTLrNKsE=;
 b=w2YrK/GbXmmXAIKNpX6zJ92O7zQ2zOayWKYN+3yvn4O/RkQGsdm6p8VNw/M2k3Rm3e
 fvYpEp/i57rvG8xiFi0FIpe+WvsJP9vMth44ddDcIdT+bc2mrdy2FbVvWScwKbjqaYpn
 hI3TUlNYBQb9UdKNqZXCcQjR/0N5CWgqIWmXd8l/OyHTllT3JmPjV7/KO1iB866jqFA0
 vxrwwWDgR7rdbFUZ68sPdMgkAIOaH7aUp7dYeRxbPzqwDyXTAYkmUta2AxNQV9hb15H7
 +Jdb6b7hOCxVTRbxBzWp+S9QTazNDbhCQZJDAOQ4z3QfpCKw/MMHRmmGPXfCxIT05l9g
 80xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRtgos02fTokCF+ItKEIIba/Z1YAvQcjs5kQj4cTVgISspu1a8wG+r1WIgaOR5dVBC20rwGwSY59I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0fYyUzEsfd/DOXhFssLhhNhhkhu1xPIn39xHJJ+3gBv3vy2de
 RvVXwHaY7eI798SlE5zf8gcysg0n8iSIhllAGpkkBf3Y3bx/D3Yi6jUXn3bH61iUio3VwpGzCtm
 R+NRkZRK72h7lRoV4eQX/uKyveqCIxnx7BDLt1wIp5vneL3OfoAlGVSI9jIeMvPmjcJ5/jxI=
X-Gm-Gg: ATEYQzxt+TgnU0VMYXOutZohp5Rd8hYJzTsnhAAIB03zqlzkjQO+LVyGFOXJBTGU8/N
 hsV44xe7bH0SJLmgKgAtwwgTVr0GhtVi8KzSYE7QKvZM8VlDjO2Qbi6bIPdG/xNlOc0SJcrigJj
 v+iReU3XC1mvfkzawYtubdp9ItxUjFa1s95HgCyrO95dt9MutO8MJR4zvt0tSXEg/x6u4rxWhiD
 +jzaYrWETxR3v3/mBf3D3lyKFjkUcc7pRzlkzaxFfV0lSkiUJ5tHIwyVHFSMR0/h8cNZ9ncIQZj
 A18gpAoZLnrlUzALY3HHHnw7SZ5lJ9vIjvAG6a42PjroQ4hsFa8sb+rXT7dZe6YlsPWna32OjhX
 WqjlYOXWEQSgc6Tnk8OuZ3GFEUor046Ew8kyj
X-Received: by 2002:a05:620a:4004:b0:8cb:7ad9:65a9 with SMTP id
 af79cd13be357-8cbc8e79948mr1962843785a.59.1772525973137; 
 Tue, 03 Mar 2026 00:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8cb:7ad9:65a9 with SMTP id
 af79cd13be357-8cbc8e79948mr1962840785a.59.1772525972438; 
 Tue, 03 Mar 2026 00:19:32 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd70e692sm486645545e9.7.2026.03.03.00.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:19:31 -0800 (PST)
Date: Tue, 3 Mar 2026 10:19:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abelvesa@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: display: msm: Fix reg ranges for DP
 example node
Message-ID: <tzzwpymjwwqem7zph7ecjvwsfhmylvgvgel7jpr7zrfcdaevzi@aggighjasjac>
References: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
 <20260302-glymur-fix-dp-bindings-reg-clocks-v3-2-8fe49ac1f556@oss.qualcomm.com>
 <20260303-resilient-bouncy-anteater-b4cf0f@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-resilient-bouncy-anteater-b4cf0f@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA1OSBTYWx0ZWRfX0F0Q4aH6k7jZ
 /JhBFYZ3Ii8Xe5yMqD434TXg2sEW5G0uoh2IuEgYFnh12xkCwTkDPYjkqcdfkLlsZ5uMCJsPdMC
 cEJJV5suYnVKwYSVDpQ4HrHDC2xIFsElAwGhkkL0YzHeqPlN7RPppK1p3F/9cTbnbYMYGZDiwWi
 bmMcjkNmi8fifKxXJfKXJUfKmvGviEFWPXNbo1simaK1kT58R8GTUP4nKnXrrF3JYeaQLzKBxXO
 ZM3AzlFpSqMpydfsQPujZ14Nn6em7at+onAOkFj2OEWLK0jcxaJ1voFj8I0FUhTcfv9uDcfwY+5
 tK6AyO48F/lo9ndRpnoOryhv84cGwi4aS75fxgggIQ99lcjE1mMkvsb52lX+VxCC35zHVg0WZ6d
 +tpk7Rn1p93dyxtMzOhvn+whvi+yRg3QTQ5OEQS0MdRuSBjdjL25CETtpPZhoN2iGlC9SacUS5c
 aqBJcuIB2OjorzYNjBg==
X-Authority-Analysis: v=2.4 cv=MuhfKmae c=1 sm=1 tr=0 ts=69a69996 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=hwl0D8rbNs11RpkTeDcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: IlWD3dBbwEgqljL8ELX1lKvKiAaQQ2V1
X-Proofpoint-GUID: IlWD3dBbwEgqljL8ELX1lKvKiAaQQ2V1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030059
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
X-Rspamd-Queue-Id: 660E11EAB0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:abelvesa@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 26-03-03 07:31:50, Krzysztof Kozlowski wrote:
> On Mon, Mar 02, 2026 at 11:58:36AM +0200, Abel Vesa wrote:
> > Add the missing p2, p3, mst2link and mst3link register blocks to the DP
> > example node. This is now necessary since the DP schema has been fixed.
> > 
> > While at it, use actual addresses from the first controller instead of
> 
> As pointed out by bot, this must stay bisectable, thus should be
> squashed. You can keep two Fixes tags, if both are applicable.

Will do exactly that.

Thanks for reviewing!
