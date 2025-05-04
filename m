Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAC1AA87BE
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C65510E2D7;
	Sun,  4 May 2025 16:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p61HPtGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F363810E2D3
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:13:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544DkrUT001029
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=; b=p61HPtGlIeEUxjqo
 ybywT5R1PFpAyKPZrQFAiTzHEkkKv0mRm11o7LyHDiys31qJI/nQ45V0w0HEnLwx
 Jc/K2zT6KjvWz7OkhlHVloBS6Q69jmEjaxNIa8wxcMzaGwNE2cpfjF74yleafYys
 2H9n+GA4P3pB8MclK5INKPmMr+tVT+rJ7IDT4wZ586o5OyAjnulK0p0Gpok7jnwZ
 Zohh2mA8Gb//nS99mU5BcKvJKYO8aPujBAaiE1DVjYrvTegcOHS0+jMi7BlIcM+x
 vpIhZlTndetVnqAp3JWyG4pCb4vL60Zq/D9OsRhtacCzexQSUTUiJi89EHyazPXD
 JLDw0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakj33m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:13:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5b9333642so416600385a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375227; x=1746980027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=;
 b=ayxAeiua53lt/Zb2ivuspf+CM71V+bN/LlWH2VQV2T/4soguE0j8s6TwRr57FYKlzh
 CbUJXtDjLW4rqJQwspemyuZIM3TrQDgB4Ry3AS5cW5UfFFVOwPPU+ImEFBCZ0HAyXCgg
 8im6FlXUpw9hDel8k17qcIH30PwipBTqYHH+rIIz+y/JOfAKdMUdFZ5fMp7qXLG8Unts
 B3nZfJP+KFMuDFNYqi/0YFSt8U9YBFbOyqqyb4yLnd8a9+6G0LwEybXxdnGUEKpFeP6P
 QB0oyrglSTj9leZsDVH0gB6sQcR0mATKRL7LmsKcXphlcKPfAsAl98Fplhtd+Von436L
 oeAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7VIPBNEh1A9JmBmt/ieIbcOnr4+91PhAchow60sv/CRAGrYG6o3FsnDHxh0HsIO0NKqQNDehTYAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuvrwWqG4lHWU0FeX28wfWAk6kIGRWbShgTDDKhIWiBqJjJ+sj
 WR15+sIrn4sXFTpzvhMyzQxYa3mU5iZBCWjbNgT6CuThd23sTm+AVVHFf6aiob456oSfJ2kwPK1
 ZyPULoGGaHtaYfezhZ+c92dcrGIgU+HgQCCuZP+RraUK1c9eKch19wwxrK7JJ3nJsaZA=
X-Gm-Gg: ASbGncuf2mqxQ4NXyPnRcMlp3B6gpB94oEIWCjpEV6OcrrAiBvmRV6OqVDFA2dSW2aH
 B1XwItUyVb5Zv9f2sSQtxSabSx4rx1Kuyf1qH1VIky7nnGIrsLrW/whh+UgF8j0kAPUVZ5ZwIHd
 qz0GTpoTSuyOxJP7Byn+QLgKKvrzHBYAYNvJmQCxsIX0c0NnEmfgvCnWAbwZEUGcD/MbF1RQDPa
 yxAJOx22CRbqeTB3sMpIswqf4lH8wnXrKwo/PsuxmKU9/fglETu69vyqJOFJXpj57LRPiZ0tQUV
 6Ftkvi/2C1SBUKLyO8oCR6G6B4DnNq2XTkrSEK0RpFVlg707PFaqzC5igGR3YA+YrxRSIMresNg
 ma5xfDnF04P/Bq0nTyYgrW3ur
X-Received: by 2002:a05:620a:414f:b0:7c9:23c7:a92b with SMTP id
 af79cd13be357-7cae3a883afmr521805385a.8.1746375227108; 
 Sun, 04 May 2025 09:13:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWfqVRImHTF2hlg2i8dPTXb3VY+dorTtSOXnHwH9+M7i4F2YAepO0JanfpdKI8BQ8brOlCnQ==
X-Received: by 2002:a05:620a:414f:b0:7c9:23c7:a92b with SMTP id
 af79cd13be357-7cae3a883afmr521800685a.8.1746375226766; 
 Sun, 04 May 2025 09:13:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
Date: Sun,  4 May 2025 19:13:27 +0300
Message-Id: <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX5fQGo7oYa6pm
 s2x33tWE8dq/aD3la0JZ1vsTN2ieMNYnoOXW8B7PP31zzkGF6663B9KA+XltXUA7fNYbxOYmb2Q
 ayeLO0eUsva8bofV6CGevEeV/BoI0KHHyT/VQ/FoExAnytKJVtRj1Hap/np9EMYQ43o2TXLD4ji
 1mIplpKYnRt9I+f1eAillWi8Q8FIp7vHZHf8SwFd58Uss6EwXa5ydtnIyRgwaDOanLUn+8WDIdN
 M2F8NgtALGpY202yERfCAJw5mv4wnn0DIcdJCiAfI8TI0dvAaqgTWhQQzFVHloauYWs0oHXsgFO
 r7aTGjfUoPHNSvy9mnnB5MbEHzd1bP5ZjmCBf0xTJMo5XD9wW8MDK1oTKybLL15nMw/soENbtrD
 yLTLerURc8BtSFMckw+EI2BQnDQP+wzrWAb2SSkDO/2FYf81/UFvZ33rpqZPAKAefsCrQEEJ
X-Proofpoint-ORIG-GUID: 0QauIMw6h5AdhnE0wbioItJlyazvtnyC
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6817923c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=AprTATsQUE9CPNEuHX8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 0QauIMw6h5AdhnE0wbioItJlyazvtnyC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=888 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152
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


On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
> A set of not quite related bindings warnings fixes.
> 
> 

Applied, thanks!

[02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
        https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
