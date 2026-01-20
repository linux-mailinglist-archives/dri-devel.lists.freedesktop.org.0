Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EB1D3C2CA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 10:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146BD10E58D;
	Tue, 20 Jan 2026 09:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhQ0diNE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irNU4gLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01B910E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 09:01:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60K33Ju23805148
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 09:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Yjzuv0ePPdXqKjH0QPcogZGtD8FOEUgKpB75DN2Dp3E=; b=ZhQ0diNEE//PwZxM
 5uvrnqP/uWlmHcqwsH0GwbL7MLcSyCQxjXrQicw71ds51O1GT4nIPtKrbUYqPs8c
 piyBGl3Ch+lveUuXtreJ+YItMHvfnfMxBu7K46n0UgsMA8nq2KEoL0H4nZXgq7Vv
 Uojyn1a8AzMS1gCHx9oQtxMwKYMdQjsDSbRE2nDsR0cr0+zvqeujIisGAzYX4SAw
 2vKGhCoP1fkfv8j5bn16QOTK3mijsf4C0KrKkEx7lcaeYCV+5X5UWA7FEI5MS3Rk
 uGaLdoVfXzU+YvtU6VANow7jCRrx3KwP2BGgCpXyr3SLSkaBHt88Et8wsznHvwyp
 mSbnrw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt1f88y9s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 09:01:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so58302185a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 01:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768899661; x=1769504461;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yjzuv0ePPdXqKjH0QPcogZGtD8FOEUgKpB75DN2Dp3E=;
 b=irNU4gLzHfMZ1NqJhtvtDal4SSYsx+sA4m3km5gKyn1Y3FlGUG8W7gYu/U2UHGN35c
 CAnuG1tQWqZHKmMB04JSf65bazgErkoszgdhL5L+H5/O4zTrEQMDobpA1Xre/tw+Dwew
 VJ3mZjvhHzL17xdrQscw2syv42yXXSj0Pz4AZkTjzdNqmuzr2L59JxJU47mKROQBYLIL
 KPcJenxn1nFGzsjBC2/nFhls7fAByvbDvHE8B9hpae7VQoHFXuAiU3R+wgzZnkssyoUK
 ZgHRSc1zmrDSaXjOLwKhTnX7an7srLSnzN7ZXeWv6KbO09fHYoyCenStPPDpXuk+P+FO
 PWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768899661; x=1769504461;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Yjzuv0ePPdXqKjH0QPcogZGtD8FOEUgKpB75DN2Dp3E=;
 b=OO/vIct4yH3CZUkPdq6R502pOi3mgyR8g60pB1b0az2kW9kJyf+FV9IcFN7dc9H6hA
 HJ3p8NoCmcyP6ZPZYRa8l+NaxHrHszmCS0mnKSew7ZDwTbaOmrVR4DafuMDFc+JBM0Zp
 HbQdTY3pmidls1ZhRd1R5sb7zSnmLUZPqhV+I65fvn3j9pOhvr+kd/62tzA5k6C/hC+P
 B25s2R8gZey6aIPHYsFWY5sxxiGfmIvN4I4hYClJ0qbqkoLMaZLLamiNZWthWkBHXcDM
 J/jkI68Yp7b2EqdZk1okd/5JdSuJtX0h+GTOR/pkgBrduJ9JSXhBGUolJb1SKdRf5Kd6
 MWDQ==
X-Gm-Message-State: AOJu0Yyvu60NBnF+FTC3YG/Cs6qqhN0swXRvAr5G1T332H4DjXNmz4ug
 tk0+OecCtcRb7Fp5oSnW8H0GInvuuA1R8hlEg7360EtogFilMjMnmgMS6wgA9g9LfwEfMqQJO13
 LH3Jx4cGhcJmz7Jjar3zLbC7NPjUPaMAg86eMsmkOD9VaxQYkoZpZgJgZR08V26rgf4FOuWc=
X-Gm-Gg: AY/fxX6y+EMk5tpkLS2eJ/2nnEymRtpn1vZ1CyhDyXC4N8BuxKqRf1cHGrEV7IpyoYw
 66ItAgQ5kj1xQH27r5HlYwmXhucvpVBMk8CB3X+w4pDclr+9OSucCc6OILaydoB4jQlqlHmeG3j
 LM5vwNHF8begiv8e93FVNU3jgyAWyxsI0aAQuWNSDpUaUu0faB/sU5pCfALAxCBZ720Vyk2qDEP
 iNNaHpuGhYpM3IvMD2h0zsq6ZOUFIe1QCyQ9A5K71sIaPQpfT5lm7Xry3nF53gHRngsdg+ruUrn
 GWJBxOGvUpBRdjVQtuqPoDHLXHdPTXF5SkoXC7wXhYk9KUdJFMesZE9xyScUKeP6vjthPYw+nZa
 Jo/zcZxpVUjOcOZsaHEMUfvnIXs26IoS+RU+T90cVbAVOtB5lpHrtZIY5i/bBflg1z4EJOsbhJq
 fP8qHiT7TddvQgLlIMuDFhFxY=
X-Received: by 2002:a05:620a:480b:b0:8b2:f0dd:2a97 with SMTP id
 af79cd13be357-8c6a690623bmr1720164985a.37.1768899661049; 
 Tue, 20 Jan 2026 01:01:01 -0800 (PST)
X-Received: by 2002:a05:620a:480b:b0:8b2:f0dd:2a97 with SMTP id
 af79cd13be357-8c6a690623bmr1720159685a.37.1768899660448; 
 Tue, 20 Jan 2026 01:01:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384d3dc4bsm38691921fa.7.2026.01.20.01.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 01:00:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
In-Reply-To: <20260119-fix-kunit-infoframe-v1-1-5f2f9b066594@oss.qualcomm.com>
References: <20260119-fix-kunit-infoframe-v1-1-5f2f9b066594@oss.qualcomm.com>
Subject: Re: [PATCH] drm/tests: hdmi: fix build failure
Message-Id: <176889965883.3507898.5407712131941310985.b4-ty@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:00:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA3NCBTYWx0ZWRfXzNKaQ3H2C2eQ
 IIXP6OkTqiNNECO9b0S89tDOXwc+NQo1tZmr2jdrQtlacovnH/OeHHPW5SI66a1LHTYoJze157q
 +5XLwfgyQAa5gpdDpQr0cbdRmx2OvAiz+jx6BNEOHdnNuzg5nI1diiGFGafR8j7qZ0aTcIxBQjd
 tFkq6U6iFvFg0MFJIEOKmRLAVK99AcuxLZBorlsnjDynI6VFQ3xKrelzKc+5LE0KcCVHVkeN8gO
 CoiMUGwJ030B6QuOvNYcd2QyV4DRTKj8OBEDdotSEkL9AiRy0j7qWLdB/nciD3QlV1GdhXtmGux
 kzZEiVdi69UewnhIWRNCrkY0P6RdFjzng+A9fQQ9eVRU7D1wN3AGpsb/9tyCjChlDeYYSTuRHG/
 pv6tIwfFb+bfHrBXTADDvh/zudKLZ2dDGAxapKxInuxpaahLOUhMwOO9TZlhREV6bkYz7pyjCVu
 mTopDyqyef51FI5JBKA==
X-Proofpoint-GUID: 5qA0UqikBA-AVzBWpeW4aKeGNigWyUZr
X-Proofpoint-ORIG-GUID: 5qA0UqikBA-AVzBWpeW4aKeGNigWyUZr
X-Authority-Analysis: v=2.4 cv=LdQxKzfi c=1 sm=1 tr=0 ts=696f444e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RK6GIuRVuTSDpkYaR68A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200074
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

On Mon, 19 Jan 2026 22:08:09 +0200, Dmitry Baryshkov wrote:
> The commit ca59e33f5a1f ("drm/atomic: add max_size check to
> drm_property_replace_blob_from_id()") added a new parameter to
> drm_property_replace_blob_from_id(), however commit 7436a87db99d
> ("drm/tests: hdmi: check the infoframes behaviour") was based on the
> older tree and used the old number of params (with me failing to run
> kunit tests when applying).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/tests: hdmi: fix build failure
      commit: d1c0978a7e7864fcaa7cdd562a8f938afcd2ad39

Best regards,
-- 
With best wishes
Dmitry


