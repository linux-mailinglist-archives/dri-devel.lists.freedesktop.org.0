Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC5B492F5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 17:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BAF10E550;
	Mon,  8 Sep 2025 15:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1IkmVTD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BED310E54D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 15:21:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58897ObE007130
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 15:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f6Pkzb5kg5j3jhry+0rAbxrUj/psaHYMGrHrVc/RvVE=; b=b1IkmVTDioXYCvCt
 NGOY6mesOdodrYENwnVsGxDKbMOM8N1ZDWhZnwe7KEg2T09hiYFosNFK5sNCFFID
 QQsFpfmAWTm6CK9AhopTyak4RxBI2DEFtAdDzMXr0+sMOXtDcR3JMPnnDZ2F2LXt
 ac1m6HXUzAcNiBDCbITYeeeXTnupsdBwNUQAmhSEg5qNrSLOu7oQ/jbGT47U/rBw
 ObinWYLympLe1DMcq5yZ+CigfODqgc5DUqFqVess2ieX/geqg4qvfo8mqfjuP+m5
 7Lc/CyFhxqwY+1m4ts23U2E7AbTgyZLvmydMPcHxmNFLFaX6e1tlNFyVpA3I8xzh
 YQaHTQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a4w63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 15:21:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b33e296278so7712251cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757344872; x=1757949672;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f6Pkzb5kg5j3jhry+0rAbxrUj/psaHYMGrHrVc/RvVE=;
 b=L0LXbR55iAh7lQcKixujTEJVgtl13IlToeNld5wNIb6MEK8NAfglmoAov2nmWJqNee
 R92B9ji1EkWxIFNW7hKWm9gnQCN/9YDVD6SiDMTwnvvoF5EJCud5kkKZimBqFGVnmaDO
 fvfcqD8Wu78GvPXtgdxztPpGweH8mV9Mv0bhXBlYkvIYVNqQetBNx2jf03LlCUHn6PFN
 4CVkOuKeW16ujh+AixTm1a9+ByEcOwtPRdK2I4pi4IyLXAwz6c6aKSBCsXbYJsZuE/cr
 yffE2aljX+BMuwuosMJnQD+DX88KkQfToAhxQVvw7OzGvrsByZ6F05tnif2afYHOuBha
 N8bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWniY+t3rDsR6J4xyYS74/AE/XE1n1S4bKKSa76L26fjAJPb2UIl5SgjUlp7ed84QvE+/5WNZ2Q2mQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6SiAbhgxWWkka51y12qKrjVTcA408J3rVLBqk7tceWwNLCgmj
 0LwRKFx5kDepEGUQdr9U0SeiNP3Pt2YDYLDqRGAgz4fg4scCKwXlig6q4LPFOyrHPJpAduKQyWZ
 iuEE312+ZQLKGi7qHCqT0qVD8xuPDaSQ+lNpXDBqORlajD61DaAxvBCATRa6LlhPd7sR9Ffw=
X-Gm-Gg: ASbGncvBbjc3G00dET7UCl8DCjMk9StUIA4akwbrypRG37VK9NFpFTVpBwWZ7G4TZGI
 Va74yKmr/cVHDJ6OixB2Lec2lQKYSMKjZMzeq0ZRl+c3Ft81X9Wj0th64PcVmlp1QXCkTLymAJY
 S8nB/3deSWqKmEg/65BSOc7sQdHTiNHipMUgG3BRocAzHmof7bNnFXXG0uw4l4sV5qmemhn+W7M
 CE2nKqY3hxXdsJo+BRXJlNsLfDB5vHA0BI03xBMhf6ojYqpR56O5xQ7m0IeYUj165jsMGMsI18O
 aFVf43N1YMSkScAuwVFsy4o7HnMdKhBojqmbK4rH2YVFcP3hSIzADpDBjlFp2c2wAJIA5qzHYoo
 rWFj4RuGM5YN/90yqrk8haw==
X-Received: by 2002:ac8:5787:0:b0:4b4:9d39:3432 with SMTP id
 d75a77b69052e-4b5f85322c4mr61314891cf.10.1757344872159; 
 Mon, 08 Sep 2025 08:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsQXC64Y9u+F8HSfWVUBHFUIev7jGr7kCnI+D3oKSm/zJ4ylRrmHPoXwe05OfIypUYK6l3lA==
X-Received: by 2002:ac8:5787:0:b0:4b4:9d39:3432 with SMTP id
 d75a77b69052e-4b5f85322c4mr61314421cf.10.1757344871484; 
 Mon, 08 Sep 2025 08:21:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0409bf055esm2249764966b.85.2025.09.08.08.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 08:21:11 -0700 (PDT)
Message-ID: <f034dd83-0f50-4632-94a4-ff68400dd922@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-5-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-5-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bef469 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vomQ-D7Nz7_NnwrRMiMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 6J74O30_FbJ78bk6iHSaDww8EuMRx1nG
X-Proofpoint-ORIG-GUID: 6J74O30_FbJ78bk6iHSaDww8EuMRx1nG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX6OHNwXP8g4Ki
 xL4wRz18mcdIAPznhU8oiDui8PUYPiL08T5CTN4HmW6VHKqGG/OW60aW6IaWMf1UNfDZQp3CPKz
 CGlJJR2pQGFF+s4WXCZ9COrfbP3AuN2w6SJLzzWXNOaLU1dLscEzWJfXTozWfbLEfXeNNgKHcTs
 wz0JXN4fuo802XOoG5Vo57L2FvhIcPvh/9QU7OporMSZWQvVEEwWB0659+zI9Ai3zrVe6DkD6/J
 fICpsTc6knA6wKkzJHbGhSU6OJ4bDn/dNB8JafsdXcmjzQaqxEGg6G5GdxPrfxuLrINwnliXtpj
 iVF+cud+4gPolVf98Zhr9clgBGi4W+0STrQwrGNVpySdhCfz+zCfQLu/UPcUYDEDIY7aISMdgZb
 0FXTtL5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On 9/8/25 10:26 AM, Akhil P Oommen wrote:
> A minor refactor to combine the subroutines for legacy a6xx GMUs under
> a single check. This helps to avoid an unnecessary check and return
> early from the subroutine for majority of a6xx gpus.
> 
> Also, document an intermediate unknown low power state which is not
> exposed by the GMU firmware.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
