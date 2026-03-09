Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAcbI0+rrmntHQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 12:13:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD78237AEB
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 12:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E9B10E4DA;
	Mon,  9 Mar 2026 11:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjdhlMsz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMuFletN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9F710E4DA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 11:13:14 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6298WHfk3773507
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Mar 2026 11:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ViZa1zocX9dQk4M6JkOKAoaHQXer580SAL6DDAoGSLI=; b=UjdhlMszBBK+MaVC
 5l3h5F6zItBiWf5R8oXbQnYEhYKppH6m87+COcbgFLoeRnnzKH7ZSDvVcpfDCare
 MLK+Qg8IwIqKOlH9iRwNuOYtqe+ZhRZJ0DzAoDtliajGekLvLTPueekw4/TEiQfN
 Kx9DbpC8E2P8O6tBZKQagJvwBNs73MrLMWWZf6848HoMLJOWkWH5ehVSTAGehxXe
 xdUgm46lMu2W41kZkLEou8zq0ZLJ1PU6BiqM3C0D46YEMpFafQZEm3cUAOmz+EDE
 DM76/5lZQ56UZ5NqAh0tQyC4SOB/6S5j7XffeZH/BItcHrZJDX/C/LNG6JS7oWio
 iewesg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8jc3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 11:13:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70cb31bcdso761633485a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773054793; x=1773659593;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ViZa1zocX9dQk4M6JkOKAoaHQXer580SAL6DDAoGSLI=;
 b=dMuFletNGAlrn4xxhf5I2h0a40zobwkvWhE6R1r5PtgMR4/Tid23wcQhQ8u266hOEC
 4tUalHG+2IOWc83ADLSH9jwtNYAN7PKa91rNYlYOsrRWLZ3uF0CpPwMYJoolMCR4VHYF
 YnHGOOPPjx5tfwsxeUyRbtSEcBUy+thTTu8xhv01dAOVhQK89y+zIhQRwQSQFiIWU2Is
 u68/LEwDeyb3iyV4X3nHx78hVMEBbXqGbxgMd0AkytPDF0tT4Ql/1BgAO/IQbrZ2ElwM
 qMpjn8Cv4Wy+iAxxBhJ78YlDC3BAboi7piw1gDF9pFyxXrhrpLQJ4myyk2I3XFKTbVyC
 2bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773054793; x=1773659593;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ViZa1zocX9dQk4M6JkOKAoaHQXer580SAL6DDAoGSLI=;
 b=kYORZq5R0mbK00Whp+bnsiE30RJmRBBx++Y97qYAyxhmEz9OWVr7QxjIYQzDeuzrGf
 KdDkg5NNBf86vzIJuqTTbJiuHWmkhIKPF8arPxbUmAkMV4oQxevgmVn6WWFWvlUTCAMc
 kWJKJAyqrP2Ba1sWsvqhsqFZi4+ngF13yrAAAM63i8/mFZ//UsJuMY4v12UQ+85/57Tp
 7+7NmcET2j7dGnCAi8Cts5T/qKhx1QZ+l0x/kapLs8wAUcaosVsEiwyWfijoDfm7UevZ
 5a6e61pxNeIx8ABLwsYY15WdiAe+mct7HnpDMXn98Qm8dKnQtLWf/TIWYrNC0eoHpYte
 EKqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkY+h4oKOwXPJLu2AXTSadAmEdOsif8LXB0l2jreh/ZsiYdXKC8cdi05gfiiarAqPyAug9TWWgZis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL2mbN8DMe9opq8gXL1ckQh3rhQJ/AB6hOZam1nc07yQK5uhec
 tNU5KlO53Pf1QgzAIuAgJacVrBklLwSpLaF7pwr2//YdeoAd7LjYjbhGqKsCfgfqImWVVrrpzVe
 5jy4N/7Pq4nmED8FU5bGSX+8LFY2Tt/q60thILwcrzA4Lsr81VuyvT8zDJyses2TzYKccKz4=
X-Gm-Gg: ATEYQzwL28SkErWoKaxhgos3GenGmEv5KIeXoyBrDgRlxwJhYUHSvkdD9fWPeOa12/I
 7eoK+TI0aiQ3MK5hidOLO4oXr7bTMZy81NhaoGGMoB8o7TLNLTq/pbug7+eTVk5o1ATKbL+2McE
 0rQJcNLWcNYgbvkvEX88msBM0pWs7GP+X/tEolYXyNIBSHKZT0SebWTo3CfXLaMxtyZ7DB5eUVc
 nSSfoR4/eEE6Qb35wMkWYGVA7FytHLjUDMQj5F/nam7QIRQ8KqBacDkbIiOLvOATA3cUjJ57LZS
 F96Wg0z3mIvZYTOFVV2Z270yuvfDSIvEEDkB7wrGz0D1YwkAg77d0utGj4SkjodCFLBXxZyrP+W
 6lb6XRr0UiTUThqvfljVcDvwYlEU9XF/h0uPNlfCMF+7nnnfJ/ata/7qI536n+Kzhg45HZROVip
 avFho=
X-Received: by 2002:a05:620a:45a0:b0:8cd:8d50:16a0 with SMTP id
 af79cd13be357-8cd8d501f65mr150787885a.3.1773054793404; 
 Mon, 09 Mar 2026 04:13:13 -0700 (PDT)
X-Received: by 2002:a05:620a:45a0:b0:8cd:8d50:16a0 with SMTP id
 af79cd13be357-8cd8d501f65mr150783485a.3.1773054792899; 
 Mon, 09 Mar 2026 04:13:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b942ef8b7dbsm347172866b.24.2026.03.09.04.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 04:13:11 -0700 (PDT)
Message-ID: <a683dbdd-db32-40fe-b6de-95edcd6c6962@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] soc: qcom: ubwc: define UBWC 3.1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-2-9cfdff12f2bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-2-9cfdff12f2bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aJdS8yTpNFOcxsMcz5RfkrJBcmW2pjz8
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aeab4a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=H6PoK_6MoztC_fAPAd4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMyBTYWx0ZWRfX1UuI62fNin2S
 Y0BXFIONbUUwiKqAXNAPS3OUdu5SMJQp/5d8gdTunXOK/gAwf+W897VHsBxPNLWsROuMAoceAPD
 Z+7l2LYpZQiSyOzVlfT31+feLycAKXenLRXPdZmRLEgwuSAXgIbhi9y4+2sGiGE+L3uS+6vSRyj
 RDq4aWX7qojq7hR9HuPNQIHPf6Dgh3Vik9g8cRZovieE4Y70E2Mq0z7Pp5rhlbiDUCbTg4mKg/G
 Hu/sCVxg8buZUq9QK2luzcpW3fYiPbeD3rKoitb3YmJFAlCYydsuFk46EuQZ0ecfH6O0pfW0q8D
 qyS/5BSdnlVtfviRZc4zrcjx1Zr688qOX4t/NtD6L5FNFFI/+qSZViOeY0hk0GKjw3E9PTAu4Ml
 nb8vxfT6C4Cqdbul0CM2KRdiPksFvYYFmLJl5cCLIP5HscdVXLLdgfbF/ljFWnKXLvWUOxNgJge
 MuXUJv5BluiLC108Bmw==
X-Proofpoint-ORIG-GUID: aJdS8yTpNFOcxsMcz5RfkrJBcmW2pjz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090103
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
X-Rspamd-Queue-Id: 3CD78237AEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> Follow the comment for the macrotile_mode and introduce separate
> revision for UBWC 3.0 + 8-channel macrotiling mode. It is not used by
> the database (since the drivers are not yet changed to handle it yet).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
