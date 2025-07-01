Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C6DAEFDF3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 17:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F8A10E2B3;
	Tue,  1 Jul 2025 15:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIlakh6W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C499810E2B3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 15:21:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619otqs018851
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Jul 2025 15:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nWs/xb1vRSVrZ23orH469KqPX5Uv0VM7XaZIbkm6Jh4=; b=UIlakh6W1MCgTS0w
 dQ8YPd0+SU/cW248W90o4Yn+WukQbWtsRGcboMH8I+RWg6rWgEse+YqacUs29E0v
 oRiJ+a0dDL5ayDgStgmik0I26Nhnx+x/LkFotu4/Ns1kxcPWo4TluIq1qiRj3GY+
 GMxyh6bkcsDfxD9uSWeGtu0qnhuVNtdoUE5NFXmkh2r4OHzpoTXe4KvkuOYgXrn/
 Kul5rvlt4XmBwOigbvoWEZnZOebN8vwkou5DuEAXjhzEij8FbdTYZ/C8Py8qiH+2
 WjLotb9uB8PRQa+EdoKYLd/cAk9vVbNEyj7y1FCM/qVnHKBaQoM5qyqjbxIs9a/u
 bHVwtA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxhffb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 15:21:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b3216490a11so4237943a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 08:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751383259; x=1751988059;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nWs/xb1vRSVrZ23orH469KqPX5Uv0VM7XaZIbkm6Jh4=;
 b=Pect6K/NYHnUoXO+izCesaoe6Er6X1Ll/VApBqzfHJvY0bTBhpdPBsTvUSU0jOktlE
 3fU2zCSGwpyBNU0T69B73KV4YB+r9IKyGzbwhPBgjhG59q5UTT64N9PENrn32QZl38/P
 XqhgfgbXrAP8En0J498zw+SY+YUID1rtCz0BhpYctxp1dg1l2ORZulg65A3eflMwvU9n
 u2guHc5Whz4dguSYsSYHDU2cpHcce4tDZQ7JovPFJVeoppZzEH1J9FsBJdh+fHCB5wQ2
 M/GmrMc6a25oNlW+bjPnxrFfLbbrnaCyeOD0gmdruAvH+hIIfz6TWhgr8zGaNkf6mo20
 Z2WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLMvxDKUams+OIo65JelqFfZwKeDhspLMALsv3in1BbUdkT99SqtKIBv3DPPeSp89GFAv5P7sbfcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydSUxKeOlylux/PZze1mOq2jWq7DVK0k8avSWdtqRHCxhKdjil
 yNgUQ8EkKc0dI8lCdD/83zFPzY/iYDk8iXvyFuw1m/yB8cO9P1Jyh/Q9CgfivYCMeaMNmwYu7c5
 y6cd6LLe3f1qt6zV90pao7DN2z5J7GwFY3Uq61zdmq3qNLvYVLpR7zZO4qmZcDu6ILp3AXIQ=
X-Gm-Gg: ASbGncvue2+UMhie9WIXEmrYkFEX1t+0IYCcX1Ls/hCbgvUI8+x2AEMb+9E/zPUE7jM
 CICNI/I5PZqYf7VRyVaLokwXjAkttxg+RVhYSs35/doMhs4hMl7wqO3cHxq+qAwdsnuwLxlVESX
 8rGYPSJfBSpgGOD9tdau72maBztdrkbO5UjSCm/+/6wfH9x+mcbDPSPQuqLAHS5NNdxOhaxpmuN
 YLwTSuiPpisOi0E2DX9v1vVHXSPvP2fYXf1nHmRT2uIqWHFsDnZCVWJYCaIN/dlELdhWLxlCgNt
 L7wArVovwSN/zs4JmsZdzK5r1cw3Och/DpYU0m8hhu/nWgoUwOSN0c3VyL10dFlulUKgUKmb
X-Received: by 2002:a17:903:2acc:b0:234:a139:11fa with SMTP id
 d9443c01a7336-23ac381b1efmr236944105ad.3.1751383259292; 
 Tue, 01 Jul 2025 08:20:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFStwjk67YEUI9Oq8heAN5eBmkoywGIh/1YJEVqnxjaukSDuHrgyVq2fd/MD04Ev/pgKWVXWg==
X-Received: by 2002:a17:903:2acc:b0:234:a139:11fa with SMTP id
 d9443c01a7336-23ac381b1efmr236943785ad.3.1751383258925; 
 Tue, 01 Jul 2025 08:20:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e1b49sm110555205ad.22.2025.07.01.08.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 08:20:58 -0700 (PDT)
Message-ID: <04216cc3-c8ec-4782-a021-705f53c0fefc@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 09:20:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] drm: move drm based debugfs funcs to drm_debugfs.c
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "phasta@kernel.org" <phasta@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20250701063303.3210665-1-sunil.khatri@amd.com>
 <BL1PR12MB575314D550E85AAB35321DA79341A@BL1PR12MB5753.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <BL1PR12MB575314D550E85AAB35321DA79341A@BL1PR12MB5753.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMiBTYWx0ZWRfX1SY0RAfg6jDT
 6FYZyolfVJJUdDgiTia3Z/PMal9gWbW1Mii1tI4JC+ZVx8g6O+ItnLL/mANaqyQP5oqDh0tEadl
 XOxrM5/v6QKGg5M7UhNUBcsZkVGCfEJmHH+ke9HVMY6Lj3Xhg+FVJqNT2ykVor3jOUnBypZLbjk
 czn4s0YXWqbzmKid5/8tqxRc3Mx5WjT+y4/uPX6ATp4HcePbtWPTA9bd2mahU3gyGhBS/EvKWd8
 V2KB00AChO9WVmhuiIjAOitnKSjfM313bcgqw99r2X/zp0173DXZ1rEuSYPaBUSTaW+PWdlIQFR
 /382tiHm/tI5Ma1ThRbSAAVDCkpyaR7Yp2Wzsjwih6phoBzfVHrSv4aA98rLWIzKtQPWTamrOiL
 gAr6235SvWhR9a4ZNGpc6+pkBdA3XVhvWvWqdP5AE7/MPKTjlhvS54BCs6+yR3T5ow1uH4KD
X-Proofpoint-GUID: 3ZKWEXcehs0knzz7GqnFSvl7GRRuwYqI
X-Proofpoint-ORIG-GUID: 3ZKWEXcehs0knzz7GqnFSvl7GRRuwYqI
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6863fcdc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=RAJSH83syF66xFRst6sA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=943 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010102
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

On 7/1/2025 7:02 AM, Khatri, Sunil wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]

I cannot review this message with this restriction.  In my opinion, your 
email client is not properly configured for interfacing with the community.

-Jeff
