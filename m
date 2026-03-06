Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jWo6OJKYqmkxUQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:04:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732AC21D952
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B958E10ECB2;
	Fri,  6 Mar 2026 09:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC7Ygr6l";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPTpexRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B89410ECB2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:04:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6264aW9h3886649
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 09:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wpzlyfMW6qIzRUSwOmgxcxG0pvbFNx4Z7XT2ZPVRg2A=; b=ZC7Ygr6lpr2kAY8X
 IgeJ5VxLfrx0j5WmTRV0Y68+fmxoCbW0F4G9ynmzN3VnGUECIG5SE/b7Wwii9Rxr
 Pc89fgdKfkQBDrUEE3oOMSGC4UCgaZM31DLJ+Cjv/zPGjxVl4eqYYiDC8jVyFJ7f
 Q6LkdL4nWyXKmAHiARAvyCytv5AtniFZN+T79r5GmYKVIRjygIZetPOlgDqspSwd
 juQqKYIwdobBmuBxS+mCA0lNi8DdQpxq9ixowtHN3kJwAeQRmzVTOrfQVzeg2axd
 +h0lorD7rnvQ0/W4d18fD68R7acYYEKlR9harMg739oQarhcJMPHvmlnjOfzoYv3
 32aJ7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4s9ykf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 09:04:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c70c91c8b0so675954485a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 01:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772787852; x=1773392652;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wpzlyfMW6qIzRUSwOmgxcxG0pvbFNx4Z7XT2ZPVRg2A=;
 b=fPTpexRUoUuB/p7UYs9iDG9+m1fBcAZ163MJ+FixHHsztt9FxdBkGM5cAKLEdeSjFl
 4woKr33Ua8TB9KG7DsBOuM+tqTAWLYd6pnBvWo8fbl6SJD4CF2czX3/PKtulyVVzp5ei
 Oyw4V+PPa1VgEFVkuD3Libh7yiEjHHhyaaoTvVZ1pHC9SpJYn4vSMI4M2du/CNq0EFDc
 edJKb7tL3Glfr1abR9egxmftyBcpP5QuIV+I+d55Zug29JrXkK/4L1n5mGQNLFpBKeqX
 w2AF1njDgMh3FOaM3CqYRl6u4Ni92/7pucAoF8yF5jafW3BEf96dJ2732LUPegf2wTqd
 QAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772787852; x=1773392652;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wpzlyfMW6qIzRUSwOmgxcxG0pvbFNx4Z7XT2ZPVRg2A=;
 b=q4bzeSotje14/OGGrhl8XivB1MVI1HdkpDvRGUtPq6uDy2NgAG4avx/818Tpk2s+1c
 M8B3L2KatUC6xMO8XqWorahTesG5eW89vQxFuIRnLNvd89MK7PbuAa3BK87hL1NM1VVB
 teZqYdUwUyL3lIM6zXDKKsD33/geMpWDqR5DfHirLIfhInyEkQtyYKeoG0w2zKD+IM70
 6/zsmpxgSZD45dtZCPPJDIXPDuvIj0OFL7k+DFk/yv1rJgi/q8jINHyOdLUC3+Zb/bly
 x3a4B1qs8OXnpKAJGvq9nexI7aw6VNXk+WhYfdS7MTZrn6Hl8CAjJ0g2SZeGgCr1swIa
 fa2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe5NTkk5TQSGYAjRmsJCS5kCIFGe8w33qYGIl7P4y3bS5M0e5An5kqEk/XH6pCoPvjiBm1FSz2PF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBV034p4wnAmyaCHPta5gPSqXygU058kbvGo9g3OH3ID1lsmOb
 9jIrdCLzE0hU89kFE9y1CxkP5P7bCL8iF6qBBTfLgFKFMataIpJMgqoqRJjUHAltQT4jNMtTVvB
 dpOZz5IXooPSkJpHVUrjJZ8bpiMBfFSoU2rNvlAX5GrlJNEk4CZPkgvdn0/y3loI5humSphU=
X-Gm-Gg: ATEYQzwx923We/ciCVWh4O2HyQB/0qRbUkxQ24T6vYQnGdfJYdyyZgiooWNZO2Jg09y
 kUghckienVlt+W3E80KxGDX4M+qPHnkK0q0ymnVfgHe71sITLM+hNdmR6HI/CQ/zDnO1ZzYThGY
 sHgbM05REk35w5VzVqzg9hpD+YYYDkXA6Z2KQVqRxrlIaFQJRtxxwD7kRyNeAXqpX12+Bw6Kjh9
 LPcvpeqxELfF06v7jHsk13wia3ulMv2Vkh6lv8dgVzXyhvwtJTG7FCXCItPwjtOG68OLIycz9qd
 6M+4dSScXOx5c3Kah8SVvTDwcephqmS/IBKuufgtU9CatKDOGmgXa4ty42MpR3e2gxdIFEMP4jH
 b+O5d6ujtM+wu9nmMkWPapW5jE4+X7ZlK+a2BzFcTJzuMiyBwQ5NFGk/IbZFkB8mIi+570mlysg
 jo5pk=
X-Received: by 2002:a05:620a:4892:b0:8c6:e2a7:ad1c with SMTP id
 af79cd13be357-8cd6d43c6e3mr137002885a.5.1772787852167; 
 Fri, 06 Mar 2026 01:04:12 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8c6:e2a7:ad1c with SMTP id
 af79cd13be357-8cd6d43c6e3mr136997285a.5.1772787850777; 
 Fri, 06 Mar 2026 01:04:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b94351894bfsm16204966b.1.2026.03.06.01.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 01:04:10 -0800 (PST)
Message-ID: <344eea89-e7f6-45d1-8413-dc238a73f200@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 10:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a8xx: Fix ubwc config related to swizzling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4NSBTYWx0ZWRfX7kNHRJRTIVII
 v/EEE9l1U2+JmZhECNTP3Ws572DQJIx5SzN0/2NMFBypsioPhmIScq7sKc8qNwayc7lCIPlHK8T
 Yx4Ni0hEzDJMsw9nZVTZlL0S4mx9hCUrVpjE+ugFt7ltprhrVXeIHx1dLnypYTTWjj4Ohn/8z4T
 tdUHaXqqRypBfQvubaWJ0/0ZH/fAw1Rj8bGI0BNvnWrZ9wQ7gXJDSk7d6Rn8KjKdHJD0bdYL5b7
 CcBPiVNXHaaiY4qCNIR/r+A4EMY01TsTWjQuRhDOr/Xz5Pxr95xitGgnTQwlhMZS/IHTgPCyyS8
 WN1rmNiWGmi0Ei2c3I2qvx2peZS3ZTOeEsAaixQM7VPQMH32aWm2Ywiq/dUajaGo8gkaby95DLv
 JQLAn9NfVsc30t6sETo+gYyyySqR+LNS1hMCtBTVevcrp2ThGEPsFBZyjkCvz0k4d06o5+bgEwX
 vjeTv5Sno+F6DU/vaLg==
X-Proofpoint-ORIG-GUID: VoqhS4kfIxYRU6Jo9NazRcLB4l331Yyp
X-Proofpoint-GUID: VoqhS4kfIxYRU6Jo9NazRcLB4l331Yyp
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aa988d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sCGn9XAE_lF3poFM8OEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060085
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
X-Rspamd-Queue-Id: 732AC21D952
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

On 3/5/26 7:21 PM, Akhil P Oommen wrote:
> To disable l2/l3 swizzling in A8x, set the respective bits in both
> GRAS_NC_MODE_CNTL and RB_CCU_NC_MODE_CNTL registers. This is required
> for Glymur where it is recommended to keep l2/l3 swizzling disabled.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
