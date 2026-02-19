Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPlhL4G9lmntlAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:36:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B98815CBF6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC92E10E67D;
	Thu, 19 Feb 2026 07:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVya0mlO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLFg1zgW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE13A10E67D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 07:36:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61J18Q7a3078399
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 07:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MCZpjhj4wsYnVOHuQmF3nIly
 abkBsaiwAgzaIrzQF2M=; b=BVya0mlO2jBDhGlPa9Zpqyunsx8FuXsHKwBoeohH
 DjVUBe9P0GM/pJB7euJt+j2J4WuxoSe9oScPAXz28V3OND6BmxDhyobKGIPow7/X
 l88UmYqSBgQZEeBqZZmU2NiDkeQViO48LLmxfyByLY+HRvz2FjBRvoGQ1Awyk7RK
 aYK7klo0g7HWqCSoRR9CeR4gmri89Yq3We+PtT6Oe1LWI8ebkk+BYTKE5V2B8Faf
 qWRDCl3HstfVlWhPN3BGmQO6kLfK/LCLZi7C6tOVfGaUbR9OXbawcCIzgLN9RFXN
 SG2ZHiE1JrkpD1VMp+yl58FC5+fD7plfXNfcd/V508e2mA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk80pc0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 07:36:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c71156fe09so494000585a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 23:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771486588; x=1772091388;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MCZpjhj4wsYnVOHuQmF3nIlyabkBsaiwAgzaIrzQF2M=;
 b=RLFg1zgW+++brGuOOGxww9BY1RFPVHQ+YT1co/P7ZvcLaPMPYnwG9+K3CchJOu0VNw
 Qgrfm7E9Ihvw5F7xrKtALXtRraKOT+FIH1H+aY9Sj9lSj/dSCz7xD3JhYIMS5b+rrmht
 TVzp82xdE1vnP2GjM07fHqutancqsRnvd97priQMpMsybHkqVxdEKbvbBjAxdMBmkNBI
 EOEKbyotUROnNUfmCmTm5CcGR68TSVYr0scpayC+UgHGLSh3onhW6MC72w6tjd52TMUB
 nul4IBhY1rpOhm0EXNNIuzm5FZ9nR8H7rpELt3I4RMFFck+K3xX7S1B1kkQISXaiIUr/
 V+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771486588; x=1772091388;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCZpjhj4wsYnVOHuQmF3nIlyabkBsaiwAgzaIrzQF2M=;
 b=DNR4HNAGyWIWJZoQEgWCcwDa+kP0Sgi3bDDEqfZ/AaKkRSrsBcHi3FNVnqNmNWchLZ
 aK5VNrsgkWywSaRHhZ8O11z/nAkBQmc6Uc3k9FuCytdOuyDj9sPpTKE/VqxjwvXkHkjs
 4YzsG9AMNj244JK+by2YVeNk+Nbt3dv2OsBK7TFtJK1OxfoI7PgCiUdof4PaFObW3+EN
 1TMVYW9jeLq6yLI2VGm9jtjVIH/PkXuSsktUE3bPqCBAwWTKvtvVq181RiFIqdZ1LAu9
 M6R2RrcucwB4oaLFdEsqXwpLrEOyNCarCViSlbbt5ubuJjrDyX++Vt5vNZak0+6XXDf6
 L7BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEcGj1fjIC1ixNBahiI+olts1pFKMtx3J6x5trugsuAwLuDzfpP0yiaD49MJpfV8a79CDXMwIbfF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvlf/ZbwnKQNKqyCupMfEF8wf1SeyBvc+py+TIx36P5UGeXxwV
 OnXj9jsb7XdASwsc9bwwtBP1iBnDfjeJBCufha4hBPLUMxVvKb3wPQ72k1MsikoBTnYH/MGjXX7
 g8eNgo1VFuSt87CbKNzNzYKA/kTpLRi7Zy0oPcm2cVBBlq9L/CZCHabxZ01bwM6hnX407Kng=
X-Gm-Gg: AZuq6aK+T2oOXW7kXYrG1CKc8vq5IjmKmzb4JCKXOCXFzYcHb3gyN+F1+bFrp4B86xV
 xiIx5r6y41Z6zuyd4RZpm8mKP1jNmQwpqRBaQiGtXysphaQA+LtptmyAGgMIpcU1YpSfD/4ydc3
 zTSgrnMQLmOZh+fQTSk9vkBvfvm4iS7aSLhHk0H3Uy20R2zranlkVc8v2AZ+3rEVC/mKTyy+QUF
 rSVGupvSnIehSfMZeAKd3kHAol0Kr6DIXpboYugioJm428E0Eei/w1j8iX4sA2bh1qEX2g5OcTe
 EQxqUtQghg3GJLQBTLFzyr09yTM2n9sXJW18PjB4d3tcQVxfPpKTIaj+A/mot1Ed3Wa2Z7kvrpX
 FGQ+hraK4HtTjTwiiCJ2LHRmdvC4rRH333sy63A0WeD31QO4243yEiR55ELfW3j75G8t7ejE=
X-Received: by 2002:a05:620a:4586:b0:8c6:e0c5:7b9f with SMTP id
 af79cd13be357-8cb4c00d509mr2168828585a.44.1771486588226; 
 Wed, 18 Feb 2026 23:36:28 -0800 (PST)
X-Received: by 2002:a05:620a:4586:b0:8c6:e0c5:7b9f with SMTP id
 af79cd13be357-8cb4c00d509mr2168825885a.44.1771486587619; 
 Wed, 18 Feb 2026 23:36:27 -0800 (PST)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5b2e35sm5073903e87.82.2026.02.18.23.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 23:36:26 -0800 (PST)
Date: Thu, 19 Feb 2026 09:36:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v6 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <gz57juqrntvqfjm6zwikrs5arfba5q5x5nuiqfbpccjodmrnri@nt5jnryy6i5i>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: c3utgIq2vn4VYud7Wnf8_ZxSrCabbPk6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA2OCBTYWx0ZWRfX/pr/fYvX7cx+
 E22lklgJSaf/P/QnEvePu5zqKXAhnwkCJMQRZ5AnwR6+b5Utj0UO+3FLC9rcmx/gzeHMVGK3RYa
 LeQpNXx2ve5jCSP810Ls1io5I01pEYS6CIwtWcMyfJlZ2uNalz9k6kcFr4wkVsrps+vo/TV0p+Z
 RY7uELKtiUAG7duc+UVvDu+15KUQtGo/n8DUIhRQungS2QCujYGHmXgg70UXQPxi7lpAEDeC/vF
 IYZOcLyqno8x8jUNGveaLJa8LjlUqhP8qfbmLJ0EtLKCaC/2soZOLVE8my/P3adRpItDH5Qbs2t
 6EHnoSK3BnSEqzDzSOmtwFxSIkMiOqd0bxCovMWz/X4sQ/epM6X8d9NBOrrmtZRlLuSG44LQEi/
 VPMyiIYSTTRvOTgq9P3jyjZfMyAc/c2sPNm4IyZ1pbNQOh9Zm8UjCxOmfSGGiXINRuPFGbI4jq+
 n0lFW6oqAsxAszVlymA==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=6996bd7c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=tArtvQTw_6Z0F1H7qHYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: c3utgIq2vn4VYud7Wnf8_ZxSrCabbPk6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190068
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 2B98815CBF6
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 11:51:35PM +0530, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included. Add polling
> mode support with which fastRPC driver will poll continuously on a
> memory after sending a message to remote subsystem which will eliminate
> CPU wakeup and scheduling latencies and reduce fastRPC overhead. Poll
> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
> request with FASTRPC_POLL_MODE request id.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c      | 142 ++++++++++++++++++++++++++++++++++--
>  include/uapi/misc/fastrpc.h |  10 +++
>  2 files changed, 145 insertions(+), 7 deletions(-)
> 
> @@ -1812,6 +1912,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	return 0;
>  }
>  
> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_ioctl_set_option opt = {0};
> +	int i;
> +
> +	if (copy_from_user(&opt, argp, sizeof(opt)))
> +		return -EFAULT;
> +
> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
> +		if (opt.reserved[i] != 0)
> +			return -EINVAL;
> +	}
> +
> +	if (opt.req != FASTRPC_POLL_MODE)
> +		return -EINVAL;
> +
> +	if (opt.value)
> +		fl->poll_mode = true;
> +	else
> +		fl->poll_mode = false;

I think I've raised this question beforehand. This implementation will
return success to the userspace even on the platforms where polling is
not supported. This is not correct.

> +
> +	return 0;
> +}
> +
>  static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_ioctl_capability cap = {0};

-- 
With best wishes
Dmitry
