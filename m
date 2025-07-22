Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DBB0DE88
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3B710E1B5;
	Tue, 22 Jul 2025 14:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdGQRjjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6F110E1B5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:29:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MCcTdQ000994
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L/t/U8NrW8TH1v4cz/v5CiT2IWa3w/9B+BWVu8gjtT8=; b=WdGQRjjjjUQiYTnX
 NbWVHmUM5tD0olJAUy+q5iPDUVy07mpouMpybesEt5vaHi4dR6X7z5rQ6w4GFMoo
 nFrSC8DQphUPwXBuW5RYNLKy0+L7zS+VYP4LT3cfajI89DF1HzDumaoGEV9+4hal
 stnmhZFl1tjDQksoaIpUU2zZ1p6sq3gJK3aKaMDKVpALLZzBXoRZtfTYy+WSxha4
 NjZ/oAhE2P1oeyd30PBRtNloZdT8Oo0WZezzaoXgPlPM17eItF3/dRnAS9hVVCVQ
 prxN8okIYU8oLQxOjbKEGQHdcH5tLIrd+FccKv3ttuRQl2aoiJMUv6eUYMUHNJ31
 unjgoQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dhknw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:29:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b321087b1cdso6348060a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753194545; x=1753799345;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L/t/U8NrW8TH1v4cz/v5CiT2IWa3w/9B+BWVu8gjtT8=;
 b=c8rN6zVHkWVOy81FhAaeC5p8EOg6kOaKzY0+hVgH2oLi5zf9E4wrzczVE0B4L9juIp
 UwCPivH2eugm1eI2mB6o/B/bMitrpL0Tj4CGmgTZhe7ae1qOX/6nfr6DxRr9rAXyleUJ
 g7AMFMKy04Ih6HO1yN3vQOU+5gdf2ZWh5aY0pM0pKmr7mDSL/E8OP2byGmBO57MTN3P6
 oVbQ120OTMgecVMifgtO5Wkm4BF1y5d5DKIf783jgnJViGUUlfxlvWdLYWd3su8VvAEG
 ZZ9N5oEQoGdDFxqJC9FxCmv2tjZoY2LwphI8aQfx9+J7kPHE2dXHFK8bsB2A5lLtbdgx
 pXaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvLmfb+/07Dt11w1JPrh7vElHgkrayLVqzNi5iKtW8hpnV1Ie9X9Nfyg98JWmUt/ZnMLcwLiFUNik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTPmmgE1yTEgU6XgmeLSVfPe1ojAH8d1LH1XtKTHt3miSaj1d3
 UJpPYtFzutfxe9X52ak+XCddChujdKj0OuI3pIKx9PVsAa65JoTcA7F7NHs1i4eFiGKLL7sjjbw
 xeOHvhQQy0mDt1VhQyCRRfdWTg0ToPCD6WBIqts++7G14YgTu4eKZrCAfJ9S5CWfiYdzyP9w=
X-Gm-Gg: ASbGncsrm43By0JCWSDHN8s2TELBRtZ+B+iOFGqGSYUIrAf9VwVLo+TKtZpwX5UWIr5
 Tk0XI9u7xd0oYOQn510NEHHMyAdVLuNd8ocgGDhyhTLQfyVVWCGtj0Ekr8gqB8qZvUhP2Vu2JFQ
 A/8wLrFjXWzd2tcebDqiTH6CtPv/GL8Ah6qUE9z+cn+5ou1mtL41U9QLjxKdh99ecwQeJ+en3oM
 HpHyhqVFhWSM/nBbTeO8S5epiZA6pg0bKFzZqExq7MBJwfsO2SZeF70AMhPWWiQl4fp4/mVmqnL
 u2HklOldueM6AnqYj/T8eu7nkvkuSVjbvstuH8ZSWysyN3netvn2e+rIqDwC3t/2aZ9Ib8zO6Jd
 FqZTO6E9IyLf0mQ==
X-Received: by 2002:a05:6a21:4591:b0:23d:33ce:bc7a with SMTP id
 adf61e73a8af0-23d33cebcf4mr8952808637.23.1753194545191; 
 Tue, 22 Jul 2025 07:29:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk6ziSCa0eUKXdOkaay2OxzfvzOV9k3AF+tm7ydoIPuevdAdofR49jy2FIh1F6ODl6RmvAMQ==
X-Received: by 2002:a05:6a21:4591:b0:23d:33ce:bc7a with SMTP id
 adf61e73a8af0-23d33cebcf4mr8952765637.23.1753194544791; 
 Tue, 22 Jul 2025 07:29:04 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2ff643b2sm6030029a12.39.2025.07.22.07.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:29:03 -0700 (PDT)
Message-ID: <cc1bc62d-d89b-4c01-9623-b8422bc30a2b@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 08:29:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add new intel_vpu maintainer
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: lizhi.hou@amd.com, karol.wachowski@linux.intel.com
References: <20250722100421.500984-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250722100421.500984-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687fa032 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=imzvJ6F8dsTbEIJwwxIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: CgxlBdVy6Sg_LGLQWVYA9GhuTziCI0Xf
X-Proofpoint-ORIG-GUID: CgxlBdVy6Sg_LGLQWVYA9GhuTziCI0Xf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMCBTYWx0ZWRfXx0/eDnjSix1P
 Ja3z36NGTnzDcJ9XgCIPFB6PJpErx15WgZnvBe7K590HwScSEHFol3spscklaMclkskJpBJvHIU
 C+rGPIYomOnpjtpnI0JJ6CXvdTE0CmyXab2Xu2NNXdEVVEy/+O/xeWiGBkjuq3F2w9YijqTzl+L
 lNMVDe8nce3aDfp/DxKA/iJ5PHG0hB+b85AzdxitoYe9MmFsBPx1R2wmXjVH8Fm/c9JMDzK3J2a
 v96JLzoTegukuhY9jp3bWU1RrVMDAMHOZDsVtiJgMaqw+f10m7jyap70iNqip3fxaHNUMm+io4i
 fr3rOZlVtQY7crdLQk5mcCN3f3rsN8On7AUn4aUlY7ZqXjdQbBQq3dmPVA0RQpHcj4xaBNGFX+f
 HMK2TTvo2K8TMcFoAhFmhyk93ExzJ9IukLRikQ9VYBhvRxl4j9hdujSKJFHS0p1zLerOsbWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=968 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220120
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

On 7/22/2025 4:04 AM, Jacek Lawrynowicz wrote:
> Add Karol as a new intel_vpu maintainer.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
