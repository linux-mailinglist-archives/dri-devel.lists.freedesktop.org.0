Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054BB0EF68
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D06410E79B;
	Wed, 23 Jul 2025 10:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVibFs78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD49510E138
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:10:58 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9M1ds022564
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 367qI0nz7D+7h4lGNKFfyYMcgYPJRnaZzBeo2TflJFQ=; b=cVibFs78mpAbpqKm
 uF8czhr8zLx2t4Qe27UCNjJL81V0q2OYEG1FpSQWB/bKdWqDmB4M+AE1OgetC+wv
 JHsywSzGtQ/T+n47iZ1WLol0PVw9buC1KizXkkhhJ/QqHcqaXT/VRZmcVvYG/qPM
 Qf4/jw4miQeR5x7PrdId5DJgJ2WkVr/MgKaqKmvTQMoHBdGMzYI2NRbwxn566b66
 Gb56vuMXwJUOp39PMt/ep/xobhf3JTnjOywpHv6WSYl8kKFgoKeSjGisTfhOOxAv
 93kUO9oH4QWUlgBODKksBeK0tTXDMmUWqStrGJiuw9OuPHrVZGa8JNA6ngTO7wlI
 3Y2J+w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ub98s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:10:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fd5e07066eso19719456d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 03:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753265457; x=1753870257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=367qI0nz7D+7h4lGNKFfyYMcgYPJRnaZzBeo2TflJFQ=;
 b=MWF0zhwg97L8N8HR0ltSKK0kGHI6OjxGWd2iI5vWkewF8cjws/4QdbHkpBg/uQ+3tP
 pXp+H3if2vcPY7DL/orVlTHnUUvNYyN59I4M3tZMpvrEZeFDDRX0MDFn28Fr0GBLrzf0
 omDNhFCof2VaoRZ48mYgWHcnaN1sZ1REakv/JyAjB57tUDGLZ+yL53pZjfPG59RD6rOc
 i1jLSm5QcCX8Aggt4X7nBhV9zZPGF9ctzIHW57VAHat76Zvcg06E26fEtTUBfevDehxN
 6r7Wbkm5wrkJ0H2MZPk9Y0WvqBVV8VegXvz5mY6VzH2RF2NfC0BDqZNM7xe269Oi593K
 aVUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjA1YpitZvlHdzuL88zxX3k/36xtcfb1zzdd6kqtZ2Hzqyw3jFy5xz/6dYP9xHKkAdi2rh7wxtjaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/cmdNh+bxO9wVMNd6nEKQRtp59K61FuSA0js4aXNjY1FPNcmv
 GEtlOlr0vf74sANeCTWuuk+bAqcmUgybGsKUdPa2XxspMWwtqjRMMmjb8WPs+ufsEOiKYP3g7GM
 +kUKd2XiOAG/VecFF8sUtYHgy5MnrjHrESrDQpPVI1tckOk8qJk9QwoGehridsYkl5TSnPu0=
X-Gm-Gg: ASbGnctFyHgjvYAuBIf36xZ8CdsVqUdLxw9QkfoB9Y5whvG8UHrw+8KKZl5ivY/0Q76
 XGt3sTsKAwL/12Ey3my3MmNo6iWvSXYI7yc+/Io/WnmvmjHENwPRaB8cdtI5yDXCfCstMQ/7ncu
 w0T6sXw5A/S/nsfdMAuTyBe4DZu3bjhKKfwESeXCMC/X/VUrDC0m5TV+SP6O2OXktda6Qmk/ATx
 rxL4B80nHVxaeliFTMo2tr6p2MylIN49NsfSRloXzHa4EBJ0WPPC8CqUsKsSpca/xoE1/7t1O+I
 TSIhQUKACqeTugo16j8cx99HwI5uNTRty/UPhxDt2eu+ySk56znk0Gn2PjFnwvge9j+KCUSSiKy
 A95kDgBUc09FUHQ1Mjg==
X-Received: by 2002:a05:620a:3187:b0:7e1:ba5:6ee0 with SMTP id
 af79cd13be357-7e62a0390eemr120704685a.0.1753265456503; 
 Wed, 23 Jul 2025 03:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR6Y6ZAAWdnN6iFKod/XOWI6twM2I3VQjkDNOIwbsj0NfFRXCat4cq56yGbwtYclqGHHydmQ==
X-Received: by 2002:a05:620a:3187:b0:7e1:ba5:6ee0 with SMTP id
 af79cd13be357-7e62a0390eemr120702285a.0.1753265455848; 
 Wed, 23 Jul 2025 03:10:55 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612f1312e17sm6525453a12.39.2025.07.23.03.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:10:54 -0700 (PDT)
Message-ID: <ef79b37e-8b63-4ccc-a739-994a119b95c9@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Poll AHB fence status in GPU IRQ
 handler
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-10-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-10-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6880b532 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=LpQP-O61AAAA:8
 a=wn_gRGg2Iv5gsIDpaVAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NSBTYWx0ZWRfX3C6hyYKch2ll
 UowBKNM0TXOGmopshV4FWtTOkpKijnBtReEHxm6Gpg8Kq2konRzqZRICFSaVqsdUicrYPUPuUzN
 PGNL74cMKVTAPf4e/QiZdvWse0DGMu2l3ybGdEUcfJTV3zVigsEh3BT1uGeSuay0p+HJ9gfLkHB
 S4SQVDyFLZ9hPUxY2ZntI0BhwroHklCfLyLcmPXL9v2yV/jul6CoJR+iwUE6CLb/P85Ak98iiYv
 pADO6niPW6z250PePxnvFbp5cUIN+NI3ilqvINED035jvfCPSAKdIr+UpW0newINGxKQenBxybV
 PQNBUr1eU3u4ESDDTW6+Uw9mlPy+HbMxndpJPqkyIX/1c1QLNgN2sVghYT2Dcm/ZBxyuErOfLZk
 644/cCCWHMWQCHlRVl2JH7ExMhvq/0Fv2s8IA/R/P23Nl1m/RmSddiu80yxD3BlGsDD2OEUl
X-Proofpoint-ORIG-GUID: 1YzH5oVJvrbvm0b0fekKblgTQHpEYFQn
X-Proofpoint-GUID: 1YzH5oVJvrbvm0b0fekKblgTQHpEYFQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=862 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230085
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Even though GX power domain is kept ON when there is a pending GPU
> interrupt, there is a small window of potential race with GMU where it
> may move the AHB fence to 'Drop' mode. Close this race window by polling
> for AHB fence to ensure that it is in 'Allow' mode.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

There's some more context in this commit message, please include some
of it:

commit 5e1b78bde04ca08ebc27031aba509565f7df348a
Author: Kyle Piefer <kpiefer@codeaurora.org>
Date:   Thu Oct 19 13:22:10 2017 -0700

    msm: kgsl: Prevent repeated FENCE stuck errors
    
    If the AHB fence is in DROP mode when we enter the RBBM
    interrupt handler, it is usually harmless. The GMU will
    see the pending interrupt and abort power collapse, causing
    the fence to be set back to ALLOW. Until this happens though,
    we cannot proceed to read the IRQ status and write the clear
    register because they are inaccessible.
    
    Poll the fence status until it is ALLOW and we can proceed.
    If we poll for too long and the fence is still stuck,
    the GMU is probably hung. In this case print an error
    message and give up.
    
    <cut off tags so as not to confuse b4>


Konrad
