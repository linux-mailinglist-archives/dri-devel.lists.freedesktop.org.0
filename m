Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAMiKZALlWmqKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:45:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158471525F6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5694D10E0BC;
	Wed, 18 Feb 2026 00:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MehId1me";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/77W6KT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2305810E0BC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 00:44:56 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HN7eMc4060325
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 00:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MDILxvRtKcp720/UrtSTDBg6
 /HJjHwoeZ4/0fsSNcL8=; b=MehId1mePzlN7KBHLwUFoqLPqxbNclcPWhxpiS+G
 b9tLOO2g9J2tgOZRUMgO6xTrVYrwCZLBu0r8+nynHO/1wk3YTqvtONu++sB/WfCz
 KhVY0YHBJPcf7txj+z5UyzxUPSUqEUtsEwSqNKSlyFs7eCwc9SYa2xdX2yd0rn0u
 um8w4X/VLXxX/go52+7FUFYnkdYsySY57k8xBmLhhLIC4wUfI1Mzuu8U3skBr1iI
 qWWZZwULTsUfiUCnokC6E5P1z+epF+N3JoZBLs+4uXn/SxpgxhZh70YubHahkRYg
 arwVbGom30ZUJ5ZYmOdEhG/Ly2FoZF2KDxj7e08BR99JxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1qx073k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 00:44:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70ab7f67fso4742282085a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771375494; x=1771980294;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MDILxvRtKcp720/UrtSTDBg6/HJjHwoeZ4/0fsSNcL8=;
 b=a/77W6KTdImzhAF+yCef0lrqM4IrOpAMz1KfdsbcYnqKafQgymQwV5svid40pxgbuC
 Ghjrkgt/+IZYQ1wjIbwvp8MklslbVwYrYzeyKU3aycJA5cAybKaLUvOhYZpI2ZTXVYKH
 CPTnMTuyLwDVHQpxeyo+Y2XX42PxG2iRQC6BPOlQAJtlnmOsu9Kcbr7+FANg17+JXd9U
 qKqMWiIx2dDrxrEmOywMY6xoBwGaDkvx8xWGzE57YBUwwnNnZVQO+9FyKg8GLigjs26i
 9TYtkFuZY9SpEPl53NJxddjmCuX3du6+Hl96DhQLn8rro/R03IHXo/OsmZK+JQeqxAIx
 dtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771375494; x=1771980294;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDILxvRtKcp720/UrtSTDBg6/HJjHwoeZ4/0fsSNcL8=;
 b=BwFxuhG8y7uLmhZRiiZKPPVVs9dsrY2p8fiCK0Q8kO2PGPzsqZqZj7q2wOJlgx+cyO
 ph/7PeCNInyfzkD7q4l1/wax6I26o2Jw3RkdhowkOoeAmtjOL8FzSuizNfzOEn/z0CKJ
 lu4B9YEmekprrAgvPRXtHZhyRJ0ahZ7CFJINPznGKUcoE+Go3gOttbYqsCiKO58fE5Wc
 2OmUnoT5ZTmMP+OMDwEzXQsECzvJQ+gNO0U0DKoCsiWaxFibCyO6msWgu6vVLlklxzuS
 czH/GstC+c+axvkrB8seLq189fdmMIcU7FG8xry44rtWom2IGjFvj4WFxdfB1Gm3K2ov
 U5kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6y/VwseTPw8EGRqa2LQ9Vn4qFXLGUsTZx091kC6RqLfg5VJrAYeTULaWLNjXY7GUSK91vTycalzg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6PW4fOHiGdVHQY/pThGbB+7Bt3oaP4w8cI6CqNvFZINcUb/PR
 lOJtCGoxdQndcYqxaGBV9c5g/APq9B6aoUEfimskv4YsUH2nDmGT1+PbV0/SzxoWGio1JFNZ9o1
 ZvjkLPlUvmBlOMF1639Ct6/KmvWt4dTsFqK6Pizu4r0qKCZlDvqFSYeFOhXslHWQGte2T7Ck=
X-Gm-Gg: AZuq6aIyP7pQP/chMj1t+lPPmpg7y+xAzcJeTO7SPygpm+7a/bMqo6Oe1yBxwoem6P2
 6/DrPCzLfwQqohrhhKca1ryw/daYxXgjr5UDxeaFsZSLzuzSJnRvjPYPU8Kzs3FERz/uA0TCTRO
 UiZQ1Vo6/K7zthAcAq1/DNnB904uFsyrSUoS1qi4lotWXkEOGZiFo9FcPdDAhhuOUTJezG8auNO
 aG+d6kAezYy/WPF3upYCo/H/urx2uCwlBu5MRiobk37We7dLDpQaXl06E1JKkcHLh6Hqtmt4nP9
 5JxudAqJa/I9JwaK4S1e+gkesSgakg5wMgcgl5zO0wVU46s5bpDtggvBc27eSvgVbWs/kN67X0l
 4RaVUTZswDnM9LRcC7r9+RF1w04ctSp5CBRmJ+QotXDwy6UyuLk8+UwPgdAKB+XmJ8FdHQeEKXn
 JUJJx6Y6gwqGpEzwSpCd5Y1EXOXMsGId2dCIM=
X-Received: by 2002:a05:620a:4607:b0:8c7:176b:ebbe with SMTP id
 af79cd13be357-8cb4c014765mr1607893485a.57.1771375494350; 
 Tue, 17 Feb 2026 16:44:54 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:8c7:176b:ebbe with SMTP id
 af79cd13be357-8cb4c014765mr1607890785a.57.1771375493872; 
 Tue, 17 Feb 2026 16:44:53 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-387068e5976sm40285091fa.27.2026.02.17.16.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 16:44:52 -0800 (PST)
Date: Wed, 18 Feb 2026 02:44:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
Message-ID: <pl7gyocwutgt4ftfjql7ipmsvvsje3jkzi62gnostcxartcb5d@trrdjswrldnv>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
 <5dd7834b-2e9c-4865-af6f-c362aa0c8287@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dd7834b-2e9c-4865-af6f-c362aa0c8287@oss.qualcomm.com>
X-Proofpoint-GUID: w1QgQ-inQY4dTI5ldhOlnMkO-QDIE4tH
X-Authority-Analysis: v=2.4 cv=R7oO2NRX c=1 sm=1 tr=0 ts=69950b86 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=UiVfME4oCffaLAUF7oQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDAwNCBTYWx0ZWRfX5E7ZDwQnKpWI
 C3RIDTs3Z1FnLg1cSzezv2m1i0iThgdkfNAUJYQs8cwKDuYD6gqnHh3qhK8J5ctD1vgrPUQhedc
 ULdKhwAdQFqGyYhCpMx4BpgQA2FA+MdxFtH62nQHbBJ3jNdOXkruOdzlTf3CmqkvnEVebKWX9WZ
 SNJtxowTEU4i/wbTtkFWmiiW7op9jg9KUTa/gTh4Jkk/G2R80vyIqcDuUOXJ+BWTGllKN/HX2I7
 6H3xxmjmpooRKdH6HXHCacG+FhPt+KyeraFOq2BsxxgBl0TP9M5AGJ1KBPZJ3Z8WYYGN+3b+ibw
 NNDXnmUTJFqP39GPC6NhR8mydc154cqp5NCMKmWDcGbVGWUDVlx6e7ir76PpyUvBZFsJgpstOV3
 WPaoo49PJPAMv/00zARzhmOg6nNjcLe6szpQMvVRhWFqkJgxYDwxLla+PHOn1/KSXJBYdPREFlk
 xp/tCh5xF94lPWsSnVg==
X-Proofpoint-ORIG-GUID: w1QgQ-inQY4dTI5ldhOlnMkO-QDIE4tH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180004
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 158471525F6
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:55:41AM +0100, Konrad Dybcio wrote:
> On 1/25/26 12:30 PM, Dmitry Baryshkov wrote:
> > Currently the database stores macrotile_mode in the data. However it
> > can be derived from the rest of the data: it should be used for UBWC
> > encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).
> > 
> > The ubwc_bank_spread field seems to be based on the impreside data we
> > had for the MDSS and DPU programming. In some cases UBWC engine inside
> > the display controller doesn't need to program it, although bank spread
> > is to be enabled.
> > 
> > Bank swizzle is also currently stored as is, but it is almost standard
> > (banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
> > being Lemans (it uses only bank 3).
> > 
> > Add helpers returning values from the config for now. They will be
> > rewritten later, in a separate series, but having the helper now
> > simplifies refacroring the code later.
> > 
> > Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> > index 5bdeca18d54d..f5d0e2341261 100644
> > --- a/include/linux/soc/qcom/ubwc.h
> > +++ b/include/linux/soc/qcom/ubwc.h
> > @@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
> >  		 cfg->ubwc_dec_version == UBWC_3_0);
> >  }
> >  
> > +static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
> 
> Should we rename this to something like "qcom_ubwc_macrotile_mode_8ch()"?

I'd rather land it as is (and maybe add a comment).

> 
> Konrad

-- 
With best wishes
Dmitry
