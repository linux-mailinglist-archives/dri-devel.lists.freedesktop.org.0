Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAhmIWKXpWmPEQYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:57:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2708B1DA3B3
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DFB10E4F8;
	Mon,  2 Mar 2026 13:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/b5Uln9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jj1GeAfQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD6B10E4E2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 13:57:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622Cf0qO2504592
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 13:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qkH3iB4kjIas2KiqSaQBUpgT
 lIwjx8CWzuCP1dOMDyQ=; b=m/b5Uln9J52/7OQT4VhISIjxFm8maPg9IPnI7rZ4
 yy22faAvmoOqBc1yqEU0n1LwX7VXGKDeBjIwUs9J4icsk+Lav6fn32RWRQK+IZkM
 mUtGV9v422EkeeCs3NejYrvxbY8jAkd/YQ5upt1z3CXeTSMELBE/gxjN7aWOO7nW
 4zRubj2WlRV3tDBSNmdXX2ruygCdnDHMOq8ullAjtuj95gbOiNxc3U8o3XzwQxZh
 UR0oElUvD2QJk8fm0554Gm7/mRHhxH87sChT7VgcW/nBslys6IUR6wQC37V/qqdH
 heqUdE7O5mkx+R6YwhpQ9LiD+0b4h1zSV7OKypeu0AmaeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hesgk0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 13:57:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb4817f3c8so3036661485a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 05:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772459867; x=1773064667;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qkH3iB4kjIas2KiqSaQBUpgTlIwjx8CWzuCP1dOMDyQ=;
 b=jj1GeAfQZkZvdn9hsA43NBz0sUkjrIwfVw3Lmt7+TUqO2svg2uA7qago51rRokb48+
 K6UWWVeuewy3SHDy1A58dLP0eQ9vZNSUS8eY/Ly5OTkZ0zi5UY3P5dl2tValBX4RAMa5
 VmRvLDuIU6y4bbutXmGdnP4CqXauc6UgFOqTzSZ6DmgU+ujaR00n5ixyuVR+LySakMFL
 nnjPfb8hRS3oEFqu9tWu3jEmB4Y1x0B9wL8LT/lx8mEnEAswFOjN40mmhJKDv1GOxC/z
 LKUYDAzvJme3U3Cmmp5iMp3S67C19stKUoFVUycIqcwdJ0sMhIm5wyX3O8/tcjQGDPqW
 m2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772459867; x=1773064667;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qkH3iB4kjIas2KiqSaQBUpgTlIwjx8CWzuCP1dOMDyQ=;
 b=F/kg0iznlooLpI4rzNcJWtLkcazM9ak2skhgCITq3GmKkvEEuzMCkPgk7s6PqoZY3y
 N07g3wCArx+vATj598WB6p5ISDBAZ0SspEAz8q/7Hiayhb59lK3AfVkL8UpU/U2YsLAE
 Z24394TIykmj2XmTZg0vuYbu77LCyxvCC2FnapSaEirQo7FadqhgWct9UOgeSJu9rvmA
 YYEY0QbKAit0p+OyWF/5POAPuNhRjN+iTKUMjOEnggqg0qBqKVsW/jdV9enJJMA8i+QD
 ZF6rQ208vKCmP9496R1PfMPN7WdiTModqaeUhwwU/3wMr36GvEIZ0eWbTpKtWboVJ9CU
 +cRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDSWyNp8qiRSsdkb3KxQMDSPrQwrO3Yd7gcZW0gQ/vwmLFnX9Wrf3PZDWf6aHLGzNMDmB2NHO0Gls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR/p8FrWhj//9URNbb3VJxAp5PPgGkH6lIoVKB9ir9M3jYtbSv
 K4+JRHeMuiDsK+6KZrfnnT4dNz6Irto8x3l8AiYrdQJqmdZzOa4agkxJ+TJRjw7nrQCWbFtIyHB
 /11bCPpjp8woh+l0V7FdEB4FJ5dDMFae11+zYNLL5PeegX/11s0kxx3KxC5SQr+Cqv7CXtAQ=
X-Gm-Gg: ATEYQzxzygYhglyeZvxbSPYDLegst16ySb0s5TmnSAtp8hkuSI4PzS77AT32Ldi8IgY
 uqmyC2hSzwnpTskWrJhYIQnrF2r76IJ7dTmswf3S9C6bJyuRxCvBfV2I51UyUrhFRUd14puJBP/
 3ISLY7MeFx6TygFmZvcxbTvmbC9n8nIBtLCUmhKXvemS1yL40d+ka8c9DoU4J5zhTzXm/MlAkX5
 yJpXSYJMUvFr4wBLk0xUEyWRAHHjJhH2GsQuDK0DLrG47QnQW0lEbSBpEw8pYGjBOdCyg6ZXxDc
 nrfT9mopyEUknQdAWB8NJKyRdfTq3EqVYJDPKAsiigFIgWmyCApeVcrLJ5yXhGYKr6JZT/Hz2Zs
 /mrkkBwgcAE0QI09Hotk3yqsiaWL6CohOZalXshYozhobjn/yC7nM/e1rhfsmJLRd/YjsKIa6hf
 MN9dK24E5/ema8iBsKRron82EyAdr+koyBopM=
X-Received: by 2002:a05:620a:25c7:b0:8cb:4dc4:61d3 with SMTP id
 af79cd13be357-8cbc8df6970mr1651529485a.45.1772459867582; 
 Mon, 02 Mar 2026 05:57:47 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8cb:4dc4:61d3 with SMTP id
 af79cd13be357-8cbc8df6970mr1651526785a.45.1772459867133; 
 Mon, 02 Mar 2026 05:57:47 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f3016dcfsm27256831fa.34.2026.03.02.05.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 05:57:46 -0800 (PST)
Date: Mon, 2 Mar 2026 15:57:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/mdp5: Remove MSM8974v1
Message-ID: <hpehzfsrwpekkzucn335ilryrimyip4powy22cpykxtto66sat@js5iyp2xfgho>
References: <20260302-topic-goodnight_8974v1-v1-1-e0006f7a0526@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-topic-goodnight_8974v1-v1-1-e0006f7a0526@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a5975c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1GWdzEGf9deON7KR2R8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: c-R38g3qnZvVbzHU5OYSgh0zdX_C8YMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExNyBTYWx0ZWRfX3Fmj+J4GzVpP
 i8R/qI0bEetM229PneL/RrM6IlWx9H1BIKQg8iP2uZ1STqLtVYRzIAMv5vM4gZw7WhSqttFrpXt
 ce8sXh6o3gPfwp0mjpNPdnhVgD+q/1TTFbxUhnofugoOcDqYrldNUeEtp6q/hR9/5ZRHtUUwjeT
 xXpAdCwbbLMFmltFshtWYOR8XJhhMb9z9szU6iCTSdu9JZfB/2KzqLyGyP4Ka8EgfrF/caZ21I7
 h14hVZSBczhZcZbp1GCnuj+q7HwLU/WH/MtbhR7mQXPMF+zITUc918YWswA+Ycpy5Yhc3OfVtX7
 pwcSk+auQaVNx+RdsI+pBVw1xE+FmMvKIPPZt0oByVLPOa0/1+DnBVrSnVKUDiTJdExq5DoL74B
 vAFxjRwvCWTcqY9/ZpwWgeCCht+ct7cJganAXK1FAjuzmoyLeQiCLdG1zii23GGnEFy0K6KBL5n
 YfQvbYZpjZAW6Y1wYxg==
X-Proofpoint-ORIG-GUID: c-R38g3qnZvVbzHU5OYSgh0zdX_C8YMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020117
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
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2708B1DA3B3
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:41:26PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> To the best of my knowledge, the v1 version of this SoC had been
> superseded before any device was released on the market. Everywhere
> else in the kernel, there are assumptions about the SoC being revision
> 2 or the later MSM8974PRO.
> 
> Remove the config for that flavor of MDP. To bring the naming in line
> with the rest of the kernel, remove the v2 suffix from the remaining
> config.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> related: https://lore.kernel.org/linux-arm-msm/20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com/T/#m579aac6cddd5bd5b0adfa778061e6397082014fe
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 94 +-------------------------------
>  1 file changed, 2 insertions(+), 92 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
