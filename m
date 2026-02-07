Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBmHLzICh2mQSwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 10:13:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722BC1054A1
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 10:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B064110E18B;
	Sat,  7 Feb 2026 09:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb5Yoqmw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+EQjD5S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2619F10E034
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 09:13:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6174e5K22496916
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Feb 2026 09:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZnhPfRcyvXmJuJSiZfwzyHe7
 jzBv7YRscb6FfNKJ8LI=; b=pb5YoqmwIkiTWV4BTcm1MMbKPi8Nhj8aVVJ9cG0V
 76vEeGsPWhJQvNxzHJ8PWKegr7VI+D3ohps176Htydpl7W7TIpa6xyJuwzx77CKv
 7lnMXr+R44bt00GQQDerJ6tRzTxjKffxtBjdfvazdUICpCLw/lmUx+i/1ZbFBHBN
 SbPYC+3vvn2mIanSL520174D1KMTlY6eWyOP8BvojNVLWmLI2A9V7Y8RQy+Mh5ly
 A35LSKrwrNt2j7/oKzG/S8CON1vrgh2BEasO410oXbLnL2+rkOSK113dj+8wQpnz
 1OgG7trhbL4JNF077BfOwHlDF6vf9/RYVwJ4hWnIUF0QcQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xjg8ch1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 09:13:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-89471437f64so109002056d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 01:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770455596; x=1771060396;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnhPfRcyvXmJuJSiZfwzyHe7jzBv7YRscb6FfNKJ8LI=;
 b=h+EQjD5SVJaE7DWdLxdly1/6oVpVoRHT1P2SNJ+mSHj6YN42+JkA1972p+CdG8R7OT
 bfL2onXrNz4O0M0hXPcYyt0j4rqauHJiLWbR+BXOUOa+uG9LFare5/kcpcYlmgs98UC9
 HaajIcbPyu/R7/F/FvXpoJyTwSQHEgS9q+lq40j4ZsZiMU5QKS80TvtXlzfLOaUguR0e
 U8NST51mrTvFAfAuOYQoy4WsQkvWFgWy7a3YkdnbM5zsHdSWXkZaOtZl1DmGKoacYTdE
 FZ2ejTbMALW+EETueZdf9UPCEpiHqSxcgUAoPI8wQtv4OlNFsrNzFgA4NHbUqMgCe1z/
 6OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770455596; x=1771060396;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZnhPfRcyvXmJuJSiZfwzyHe7jzBv7YRscb6FfNKJ8LI=;
 b=pxJ9nZCHmOVnxCSW46I4VQeI2c0sCm2SSX/ELycqvkdhDlYrnnN5RE6s2E0SF8gWAf
 sSAah+BXsWfpIQHekQd0pRyrfCVNJ3JW5jtxmf7as2IdPGOLWJJWwRz3n6QckbYmFLrr
 NGVJK8E3rf1nh8565TTAKFujTaG78qwQeumtSENmXsJVV1udJzY5vQRxGo44WcDLeD8y
 QhWPKLZzqdFiCoSl4n6tK3YnjBdKywlO71mBcfyeW5hebvcADe66krrv5GmlYK6sQ/R9
 4Z8X52EFedEaPRoYAmMK7/Zi7axLt4U3QB7fksZTh6RJbnxHFXm1P7ia3UGDkv+oYEtE
 ZYbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoxNMlzQqX7WkGjHSQnQ+dviyMS7RXzT5tGNQbkKs5vDsmNcrp/HjcQYIqWDYJsJKvOL6S4ADX5EQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8Sha7jZ1pqnS3MrL0O60B3ud8qSCyJ7BIeNTGVqo59nI1vB3d
 KQv057jGKTKrA1NKHFC8xZGANjm8oP+x68Jm4I5rykh64yM7i0W2s3Gm05eDImKPPx4Ci9sM/kR
 3L5GwloK2kRrTBtLc5nY6Ctkg2TW/uxUbKeiC4ZkoUMt4kIVuwSTOpzvXl9iSQmkTZ7wxHrU=
X-Gm-Gg: AZuq6aJ07Un0AaLu8muukbL35PF04R0KdNaZgW9eh3sFN1hudXkZ7xjBgAJ2CavgxSw
 0eg1Fdiy2L6HUOorwoAqrhzOo8p+8LFA9YmaySamyiekd1ZlQ4RRHMkU94fcYuzkVn0iNnRsIrG
 dJAXPCCXV3b+mng4otfRPEOI5w2N84xxKZUnavx3X0JVbdOMz3HixaqA4n3lDv4Hjmskj8EhXZ6
 Kfbd+j4C5VaUn4H6lL1gIfBpLnzN7dexOdqIi1yYLyfJnw85znvyHkOJO2FHYS18IGW4onHSMr2
 JcLMxsmGWie0PPpGNOn6M7LHlBSHQcsyC1doicSEA1MUoYcGdgF0NJkAPADSS2AeCZCey8AnTig
 cmq6sjPEWQlt+a319O0joQVHJuMEW/mBsY/jAbsuxWAtPcuj7v+ZyTfn7pguyWQaXCKunQyPgAz
 azUdcg6tLJIf8v86fpwfhLaA4=
X-Received: by 2002:ad4:5dc2:0:b0:896:17e6:b3d7 with SMTP id
 6a1803df08f44-89617e6b59dmr1403966d6.68.1770455596330; 
 Sat, 07 Feb 2026 01:13:16 -0800 (PST)
X-Received: by 2002:ad4:5dc2:0:b0:896:17e6:b3d7 with SMTP id
 6a1803df08f44-89617e6b59dmr1403876d6.68.1770455595931; 
 Sat, 07 Feb 2026 01:13:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-386b63adc3fsm10918031fa.26.2026.02.07.01.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 01:13:13 -0800 (PST)
Date: Sat, 7 Feb 2026 11:13:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kees Cook <kees@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate()
 allocation type
Message-ID: <734wzdoihl2qn4lu4inig5taw5n2aovabpce5y27qb5kiftnwh@ynnugouvaran>
References: <20260206222151.work.016-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206222151.work.016-kees@kernel.org>
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=6987022d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8
 a=parfbKQTulTwLggSwN0A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: K4MRRHgcRSZ6SvNLGa9NR8CaHRk8axcL
X-Proofpoint-GUID: K4MRRHgcRSZ6SvNLGa9NR8CaHRk8axcL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA3MSBTYWx0ZWRfX+NAv2Nv8djmr
 fYIlYMwu7/39K/J9TMBROZtxqxbE14MG7uQRz6JQv16+vIRG4aGQAh/69iblDypNG2daQhIcbng
 J9SNgcs4eIgwNi7u0qRRPzmYRjAXXrflmGpM9LB4hUtf9HIvM+iDt71m3aTZYdJe8IN5MmpkfEQ
 aqot2+C2RGCRUlv+7uw7RO/mPIy7LZqk/eneI+jczqyLy43+7ZEkOfZVyn0F41cdbSu+j0jfy7T
 R9KW3zEGaZgMBdB/YMEcd/nrawZCeP8nhxFQTW4BIq7X9jt+6KC0p0plbjKmf8HKh8E6FyRjd+M
 zz5xNjY5rqQWDsYxrcI+msyahqNR1VmKGeTUl1K9m4PbSyXZ7X2QeqaKpzKogjaQ0LVf68ekCqN
 pimOIglY6cXc9chtmpb5OdEZnR32HKQHuBfMTvflhqvLwxsZqglpmn3rVyCWrTBQy7lyUSCDgWi
 dm1QMqFW478wi5r5Zhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602070071
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.dev:email,ffwll.ch:email,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 722BC1054A1
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 02:21:52PM -0800, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "void **" but the returned type will be "void ***".
> These are the same allocation size (pointer size), but the types do not
> match. Adjust the allocation type to match the assignment.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <dri-devel@lists.freedesktop.org>
> Cc: <freedreno@lists.freedesktop.org>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
