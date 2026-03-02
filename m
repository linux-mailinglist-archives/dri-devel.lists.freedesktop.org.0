Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Pc6NR5apWlp+AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:36:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8731D5A21
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A5010E46F;
	Mon,  2 Mar 2026 09:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HG76QltA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOFhEPv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E8710E209
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 09:36:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6227maxT055870
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 09:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=W/+pREnN5e1VxpAxRAovD9rw
 Dlgzw5wWA1UEsPKKJ3A=; b=HG76QltAhcQoR3rz/gGVhRMMFMawMLGtmyEzEBQ/
 RVn1dkPrPp7w7+lOS4gOYluBGrH8G9B0Ngrw/1d9yHFBn1SWYWj3APSGXjtue+Tp
 nc3pwToZyyB+TBlRFFCcEJ9JHLZuGPSTVNBMP5d2oVXnuslbXtlxqXQnFEbW8jTc
 4J+G78idwZ1/QAaJjZo9kc5sMYjuafub4CcrbJ5Q0Loiq3SmF72vDJEnBzfn+l/n
 npLhRwUs5fShAO9at6WAiQICN6QPr+ylP7ZQw9+aMIAhngBJuqNL4G02CZSxeCMd
 dw/LsSencxfv2Wl7lxzCaV68ySRF4iORUxyheU89jbltZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw649rja-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 09:36:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8ca3ef536ddso4230844685a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 01:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772444185; x=1773048985;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W/+pREnN5e1VxpAxRAovD9rwDlgzw5wWA1UEsPKKJ3A=;
 b=hOFhEPv35fvUrfoU1uCys9vap2cPs8yRhRhu/khMDmitphRp29c3QsciIYQ+HLuwDu
 IcvJ3KgBg38BjV9tg3FIUya1cerj0QoPltZWk6jRmSp4X9ptwMwS+TcYdKIZEUUn068q
 piJ6d4bgR7xD3NbEznwwVox54LZpQo5uFa7QhQKu3eSA634LsdUEOdqq4z9vjkuzjQNG
 NoSy8ICRZt+cIfM6FiGSlS4mrpb/UtA5z2Slj7DRDm7rKjBtWhHoKqkERP4Q3GHWIN8P
 FXbk6ML4WQbHhEalHgEFMJLu8c9vAbIaM42hV41qEENry3Gonm+0HjSmq1jGbxnc+OtD
 iUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772444185; x=1773048985;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/+pREnN5e1VxpAxRAovD9rwDlgzw5wWA1UEsPKKJ3A=;
 b=Uaxl8wpBT4NtuXadtYgArpt6UT13dHaJslE/OcISJXmH5j28SlkMEBxwY9U8UxYvTJ
 J2TdVGvnzQ68rPpdoWBjNnbAuvurVM57Iw+whiEa1apek2ygQpT+OdejrURbfaTo6CSf
 jd5tPl40eDajES8MlY7DNytzbmso8/EvUXQ8Hq9T7UCmWj2/xUkDzLg4Yo+1cReQNj66
 TOPqdU6FZsmM3RbWE/syKjoZ8qcB62UMz/P1kaWip5WZ18+eM9WPSdCCDv6q4jWiHDP7
 P34ihpoO1WmZadcnU761wOCftKNiwEMLaApDZEAAAF3Nyi7mJI51a6fo9MPvCan9baG8
 zn9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbdArHUQHbnje8aO7USF2W8KZ62UAIdzy5w4eHXJNeG4TTqHF0TZmRIZ9t2+jPlsaVCGRq+1IoYA4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/0zVAWiPhofrQziCib5uHinhmg6eEV46181WYBU+XLdRQFdA7
 jwg5H9i1e7GWIVDug/d9E9WT50vbrHG9TSHrVl5mk9s3EG8/9yzNWzfAAiRYu6mq2cFK/XcTucb
 HCRTT+1y6Vo1a5pNuWc7jLz/ZXGDNaAsRU+ziX7ZYQLMJxaPia/aqjrCHYqyZxcqCNkktTYI=
X-Gm-Gg: ATEYQzzV3e8TOLsf9qVKOgx+DobgPK2r/tz1nMgHqEQ2t7dU0jfZVzBkn1wZx1aLvja
 kx6W7kF/Ts/BWMiOZAbdt2JNOBsKTYMRqe1PzAKfb0eiHlD6TFnQS4RaTj9zORs1wbzUH3RXChG
 MwrWQKOLkIX2PnO8kIxcWyLOlqE11Gwdz1pf28cQYm4OU1hCQ/FvHer+JyHRBL6FljCbGiaUjsD
 D7nVZIq9b5iZbPs54ks/5XEQpZQqCfqMUDvfVJkWUidq686Ym1qIyyuofl/STbjpXnSRayiRvJN
 QZRxc7iN960PHJVn3ilMJ+F2SZbIQE41BoiAm/+UZUzEYgAhFyEGtPoOTSW8OJhFeFH5a/U3pM8
 j7hgqK/PMjyLpIkdbvFivTRkb7B9/eOUGoENO
X-Received: by 2002:a05:620a:370c:b0:8ca:4288:b175 with SMTP id
 af79cd13be357-8cbc8e1d882mr1703927685a.55.1772444184971; 
 Mon, 02 Mar 2026 01:36:24 -0800 (PST)
X-Received: by 2002:a05:620a:370c:b0:8ca:4288:b175 with SMTP id
 af79cd13be357-8cbc8e1d882mr1703923985a.55.1772444184259; 
 Mon, 02 Mar 2026 01:36:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd6f2f88sm381265025e9.2.2026.03.02.01.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:36:23 -0800 (PST)
Date: Mon, 2 Mar 2026 11:36:21 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] (no cover subject)
Message-ID: <nu4hcmawoq6kzug7lx7pmhp3f4tep2ttpo3mugdk5fg2mviqn2@p7nfdcllvnbb>
References: <20260302-glymur-fix-dp-bindings-reg-clocks-v2-0-e99b6f871e3b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-glymur-fix-dp-bindings-reg-clocks-v2-0-e99b6f871e3b@oss.qualcomm.com>
X-Proofpoint-GUID: ywZrFcFQSGwvsFQFQUlb6-W1lSsKDXcy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OSBTYWx0ZWRfX+y1FpAzSzKwK
 oOcGxYaWJZCQg7a284XQzfn+GnJm2AJt8e1XPP5wO0zF3nMpuNKLdJqOHSuG8Y3sjFb1v4hPr+M
 KEl3HfsSeTpd1/xj3rYIpp25QDtU0Z9s0GytB8BC6XYc8TZR18ibFbArmhbP/SaZiqVXuNaj7Ec
 /T4WcI7tsa4EUKyY9Fh6ZcQQTqGdUbpY+z41JvfNvZtzpcu884n1u1ZVyVRwJ+T5d223ZAz5mTa
 wqhK3p+65mz/NVWk84jvD7RX6z7dUBeecPu/DScfRJze0S6C6cHDaW5ULNLp0Ecgo7TWUIZoAkH
 GslUz8upi6UA7i0mud30oGeiV5ZZwcYR06bm9cP1zeeM+L7cx9JRVfanbtT6IjiJG0pGC5zYcMk
 ermBuEWlptit2gM/comUhvg9ffm8jJYMCtlB7JP+YzH+A1lm5Jwtktg2ywG6twUHw679FY/NmrJ
 jBW5GrpcQrxGRgHa8kQ==
X-Proofpoint-ORIG-GUID: ywZrFcFQSGwvsFQFQUlb6-W1lSsKDXcy
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a55a1a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Zo8LqNs0DLUyECXxfzQA:9 a=CjuIK1q_8ugA:10
 a=VxAk22fqlfwA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020079
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:abelvesa@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,msgid.link:url,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 8A8731D5A21
X-Rspamd-Action: no action

On 26-03-02 11:33:18, Abel Vesa wrote:
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed the reg ranges in the example node in qcom,glymur-mdss.yaml as well.
> - Link to v1: https://patch.msgid.link/20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com

Ignore this please.
