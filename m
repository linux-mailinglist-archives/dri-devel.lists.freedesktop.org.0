Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A7EBF72CC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCB610E2FF;
	Tue, 21 Oct 2025 14:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="akosL2Cr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB04710E2FF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:52:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEMeQa010742
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Em9/rJl9Wie8PxF2J1wtN/wbFabOjF9ZEKafl6+3A+c=; b=akosL2Cr8+5+0svM
 /XjOr0dg5guhe11G88jCOOSF2RtRQjxt3HaAo9Oj7PRJOJFSDoRkezmKLBGSu5IX
 diNW+sOIe6Iu0IO3S2S4Z0gDv7qMKRNa951nrTiEqc7Jb0kaVA93LCnPNoI6mtlC
 9/JISQiD0VTYvXQGOm1hqnnNJx1MdlYqb+KLuKikl30E/VLxXznQ+L37TYcSHMrR
 dtHcMscp/vbZ8cpW+qZ0drITDFUbNu9fJsx2B981ZkgGo9kFzHaOF2LDPmQJmKUP
 hGa5rzd4YGRb5JTuM6reiuh4K1PZIqAdS1a203xk6GQ8PwdfD6O8nZD5Cuu6BCkX
 z6qrqg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wtgeucve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:52:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-290e4fade70so42239755ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761058331; x=1761663131;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Em9/rJl9Wie8PxF2J1wtN/wbFabOjF9ZEKafl6+3A+c=;
 b=dMILJlht41Wwfa5tmPRqk22K2y+9fOA+TFInf34/QZQfLKEOr/IxRlLylCNzbopKPp
 6ngoPJlf2wj4Ko3kFDyPb9HiasdhRJfseCCypnerqOBwFvYuddM7CR2Jw1Ez9QPThSZU
 bUJOFEyKiuR39fOtXTP20eA4Qf5beSII2otHnYX8u7G2N2Kt2NarS9RVc9I5f48urk4P
 bQv1br/D0oJax/llFY9cSLUwV2hhTubjVFo9T5h/Zq6t7Ei9n4CIKJztkdhuL4zk0T7Y
 uYB62Ex+1Xg5D4gMFFFeHKPseekGYUJAAi68J+RIktlTzbiOdpRJQmOLQgXrZveRwdSB
 E6Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSjLRsZJkIexBP2zFHeWdhsprnLWXZljpzXQvDaMNafTCo8FRx0JADR5ovQwxMTlvNJS/4iFaby7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNMmnXmPwixMDVp7RYun1U8iRo9HoDzOlsza4qtR6gMn6O22lz
 is5TQaeZ4g1aNMQYKH89kUUXcTmP5HJQo8YrLNopIA70Jy9O3jHymu8RczVYcU44GNa0I5lmhP/
 yE/dPKkRc0Fviy6hcwr2EItkbJZkhDxcNJ7B7RBp/f3uzGp17Go0NC/tj6w2e3LcXwIGVkrNPwn
 2RW5Y=
X-Gm-Gg: ASbGnctYacYgpjYBcQhE0D1Q8VdqSbKWzgAU25FTuJKOzBvTXzpxQnzUgJ8UpwE9Cvp
 szEdBVg5f3P4ess5CNSVOxpAPoyGtsQNH9IjTH2Ar2Zu9eaJSNtASvhqZfiZ45ohX85PvgIO7up
 i6CAs/afuS4AmD706OkH7JrCJ+KPnfMIoyy//iwcR4qzCQZE03ugleiY8w5NjVxR57HSx0XClXD
 ZxPqjk0UDFF1WxBiJcLCqhTStwHXbh4u7idoMK0QcbA6oWm1DMQN7BzgjZj0XUcj+r5Cfde5VnR
 ZMJawdchwBxHKCc+wC5ZRR/0ARzFNscY1DkLdM/soxu3+YGEreGyauvYTZaGY5THNm2c35jPAeV
 t95WwLXhsntmlO7EX4kRBQJMEa736pQz1OLglGFZrqiHWr1eCaWz9
X-Received: by 2002:a17:903:11ce:b0:273:3f62:6eca with SMTP id
 d9443c01a7336-290c9ca804emr219844795ad.18.1761058331467; 
 Tue, 21 Oct 2025 07:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKlW0zUQ5dP9215lLLhLFUr7po2uXZaQSAYjeyaM3p2+HJWbTsoD9Nz6yR4gkPQZLXQPE5aw==
X-Received: by 2002:a17:903:11ce:b0:273:3f62:6eca with SMTP id
 d9443c01a7336-290c9ca804emr219842985ad.18.1761058329367; 
 Tue, 21 Oct 2025 07:52:09 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2924721b6fdsm111346235ad.118.2025.10.21.07.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 07:52:08 -0700 (PDT)
Message-ID: <0485ac05-38a7-49b1-8928-d3c4a42bf0d3@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 08:52:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add support for Nova Lake's NPU
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, karol.wachowski@linux.intel.com, lizhi.hou@amd.com
References: <20251021141948.2216735-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251021141948.2216735-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wCT08FUpLPMiCjMmY1TXAkXw42WADavo
X-Authority-Analysis: v=2.4 cv=JeaxbEKV c=1 sm=1 tr=0 ts=68f79e1c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=AtBEedvpfnXa7H_QwbwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: wCT08FUpLPMiCjMmY1TXAkXw42WADavo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE1NCBTYWx0ZWRfX6lu0P4bwbjRz
 KD6O4bZehbNi8qjuwGwBwSUjbG3nkaJaAdCW96KInTv9wAC/74wRNj+CJiA32mOAwJCtRXovahT
 HlI4Lq22YbNEdGSyf6XoV1afKF7fsIK9XXsidyB+RJj7OAbinMI6wBzysym+i3a1h8xTcKZGlWM
 Ywu4PZmEwxes2Y48FroSRjswY2399y4kKs/PEFvdY/NknL9Mc9ekVz0LozedOii1PEHgkuCyg6y
 zfABPd15ySaPauPtakZFTDWvts1tCQC+DmIbbiRy2Wt944ybYEdK1NFkNy785vpnFgn4+dQedAc
 TE4BbXnHxklKpL3xW8oKyGk+4cywX48rfXe9HB1GxHl0vOgCXCNYK96993XdrgSaHFSnfn9Hm9o
 DB1KenOcxZtg4hlywC/y5Hthn3PKtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200154
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

On 10/21/2025 8:19 AM, Maciej Falkowski wrote:
> Add support for NPU6 generation that
> will be present on Nova Lake CPUs.
> As with previous generations, it maintains compatibility
> so no bigger functional changes.

Looks like this got word wrapped early. Commit messages can go out to 75 
columns if I recall correctly.

> 
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

With that,
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
