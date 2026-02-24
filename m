Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDZeJJojnWkcNAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:05:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B931818CA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AF610E4B0;
	Tue, 24 Feb 2026 04:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnRcJ7+7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZvD/+t4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A5E10E4B1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3KpCc2189160
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tJCNJcyv6krVTe9H3QCOJjGUcENmq65QNQwF5TAy7pk=; b=XnRcJ7+7eOeqLr4X
 /TYxJ2iiDw4wtCZ/OwCsm/iq9ykaaAdGmINfM0uD0aP1M67Fvr0gbgm8//njJlK1
 h4UazrpL0KYUA3q0Vr4iDGZR5LBWCGQbP/EU3HKuKvb27BKKYVRCL1Jk8CvcV9n3
 GyuMITnB2n4nlm9YcURtJgaZyQthGX7Q4ACSDQZXkJrULIBn+1m0peK2qsaj0Qj2
 nzYNQu0g8CHIb1dNduj+zNxbbwoZ37DMtn2fLaWu0yyX/PKG1CE9HiFMhygs8/fu
 z55QCP9LOmrxh9qlwhvzy7ISGoKnw8SHrsOk5Yr53wkjTpQIdY7RINzAKRoWI3Ll
 tF6P5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj9n1w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb0595def4so5923784685a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771905940; x=1772510740;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJCNJcyv6krVTe9H3QCOJjGUcENmq65QNQwF5TAy7pk=;
 b=ZvD/+t4UNLCDtoapRQr7c5X7/sGLebsUgHcPmH+EPDWBR6h0o4J/HC39+QuuLBqSr/
 iE52ZS9g15IG22E0RlrkPSjdTIEs/WglOdrdm7Mx3Ox4lg2seJzh6JfkZZV6Qwnb97/+
 NufNPSMcVl7mKfE+osroQWMn7hgAgASzOAYZF0RgHKoth4lcnWZzmcYDdAjnA0QyJjlW
 ow/OYwEv+boG8rjEMKT26tCWrbI7Fr2AJPf9Yo1dfKKVkGYLzE5Zs9ylv4f7hPvHXrL8
 Sy1FZDRalrp3GVGD5Ul5bAzUwaEapVtOItNJ5A8JgpDf3E6+hJIhab3qEFaO+8FcnVNn
 1Rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771905940; x=1772510740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tJCNJcyv6krVTe9H3QCOJjGUcENmq65QNQwF5TAy7pk=;
 b=saola1j9uBWrjHsrcspgxb+bt8wgjulJzGbh/JT43ddxcvGfW7Tz7LZYrUwN66DiQz
 eC6RlES/w/PqIOc7hliR60QBL7rAAcOFAj2c3T7xH3b9YW0jNNWvjL6VQA3N0bWT1NBM
 xto32TBrGKFEg1XLlj05lCx0jJQhLUdg18JJg3YGFWoN0ve/5xQNra3dR/mS26gEhSBM
 ofSYWUQ/5cdTa1Z+owsXQ55eq5+Ugu+6x1NIuzDWFEPaJxCiYmr70TdVtOErMEaFBr5Q
 eU1LS0fNgidSgNw8/IzMCKz1dOTI5x1c1YkL2dt8nllYqUSWkeQIOCnLIJn9PxRUkcoF
 zPIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp/MLj+yZTtDnZb3SYyakYy8Bt4fmH+64b9p/zuxGolb+439yuKfBlT7QDZcWejqxkNYdvYRKQmgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx6nSoYZLbhFus+EUWtGTXF6zmfYeiwC2YQrdT1aDvLUdcZEJy
 dLMta+3OumNJduBjwtXjaT1SbKHjPz7wabXM5BiCR9AKwwwOX2IOAWj+VO1l2Wpf+5qs4sEWy6c
 +md1neVYPi6I2uxjwlZyBxHtgtJP9MF4aqrTDHlJICxIT4qSR5eZateVynuOv33XM1AYJSek=
X-Gm-Gg: AZuq6aJkJh4bOJnsQ4sWE0E8UknRJ4EAFOH4yQ8aQRgHkVJu4a0bdYZt2/ASWSA2Pto
 MtFnQgDWDOVt+hPe5eEMN7O4TmZIF7xhiUI5b5omUkmwXA2KdgMzGrPige+feZjKf7GyC+EsDKB
 LVyNPhGhnih9CSYAcfDTPRjBzVGPURpQFpIa7fBy9eX4rkHglJzjulqEexXyClFV0M1PT7mmJj5
 0Xd0+6Q0jfd104h5SjxK6DgAOqGqqIMP5nhGvyO93cTeUkLHq+r+3Kt2CK/tDjb7Azo0x49sI7T
 m+dg75Rnsthg0xD6jPCLIE9QpGiEzYr6xyI5IKgXX/rcIMDhNjhiJ9nIwUpmYhTrFPM7tvvtDTZ
 rPZwE1saSdfkKEvMvZwQ2VUKaTkjM+0P+ZBwUAw//n/umY9gv/J5i4cayBGfK0BVxN54RSF+/KO
 ihbIH/vxEfBHiyD2AT1SXLR5nxIyAMVUEb4Vw=
X-Received: by 2002:a05:620a:2946:b0:8ca:3715:eea5 with SMTP id
 af79cd13be357-8cb7be70d9cmr1773392885a.14.1771905940216; 
 Mon, 23 Feb 2026 20:05:40 -0800 (PST)
X-Received: by 2002:a05:620a:2946:b0:8ca:3715:eea5 with SMTP id
 af79cd13be357-8cb7be70d9cmr1773392385a.14.1771905939776; 
 Mon, 23 Feb 2026 20:05:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 20:05:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sunliming@linux.dev
Cc: sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Date: Tue, 24 Feb 2026 06:05:27 +0200
Message-ID: <177190591480.429979.2382561876586023167.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260130053615.24886-1-sunliming@linux.dev>
References: <20260130053615.24886-1-sunliming@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699d2395 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=QJ83nO9Bkbp2MILl3NoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: qexU-kD8dIc4is_-IFGwmJNTYTDupdnZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfXw+obXi5CxYD6
 qux57zFh7HamT1Xcz0dH5iISf54onVw/hjqJ/YmNwu2P7PfUsbvDYxXS8uTXebiz/TDeP0vmkF+
 2A8qpm0eLagpFZJWsCd+yNEeVmsY/tctOitcvzvxF+KFOFYkC6okQfZRgfteztxUMXaFHUqZRZ0
 nx4uM2IWW+gEpilp/awVYbNpUfA7r05+kWLVE9vR8L2F89eOHpqYlPBpCcxW9j1l6yGa50kSBaw
 QpTWCZZ8O8RykFH8BhOZI+8LbdbAJ9swCsAvHpvRlYozsOKY3JebmKTScBcvvhMNFsk+UaNYZ6Q
 FGMM5YgKWohv5brhdaDewBAgtYCAl+ybuYb9wByK7+o+nArK0cz0H3U6G6pvXAaZ7+DNknWePqU
 0elIIY2n3DzxL11yrFvDPMmQwc6Wu/EV4m1CCfZ61QO+bOP6i43GxPDIrpA3IzZ1vBLEgIqXnvn
 11vaBdP5VRzMIGDLl7A==
X-Proofpoint-GUID: qexU-kD8dIc4is_-IFGwmJNTYTDupdnZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240031
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@linux.dev,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kylinos.cn,intel.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linux.dev:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 47B931818CA
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 13:36:15 +0800, sunliming@linux.dev wrote:
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Fix smatch warnings about variable dereferenced before check
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b1dcc804f466

Best regards,
-- 
With best wishes
Dmitry


