Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CA9AE21DB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 20:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4197C10EBB4;
	Fri, 20 Jun 2025 18:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qk8zULvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8E410EBAD
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGVAns029047
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CVc7A8xrMHlaIP4yJolGlsjNwADCMbUKZl/ABsd4jtk=; b=Qk8zULvMyRlrQu9v
 Sx2Or7V8X6C89vR74Y/LH3FGphJ+F/3IE2Mt7D57ZjK7y9CyrMb1Q4TdjjUoeN/O
 Pt6Oyekff1vNYFvcEwwcnSgb/nkWyNkTrZRC8qvuuS9dow6CfWqVyvC6I4B6/L24
 mIRUj6te82cSxJ4w1fd/pbgOZkwMJxYIX57hRiROW+7gU0nijDM+8QuZ/KMHWPRj
 oAVCHfnKmlQSZ+fDFS+g6dr5azg1peKZi63bxGvBeOSVd+4cfz6lPkqojQSLX0gH
 qHlDiSgKS22uWQnfQQWasRg/sw6/b5trBk/gdLRobsRb32azWi2gGGna+5lWrJgD
 jlbv/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47db82g8r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d0981315c8so187188485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 11:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750443244; x=1751048044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CVc7A8xrMHlaIP4yJolGlsjNwADCMbUKZl/ABsd4jtk=;
 b=QQxcmeQDDOiGU7y75eBNktzskapImrF7tfvXzePWd78aEnhBlc1BRgq1l0iRKFV22T
 VnF3xVZ9tjyqeF845hkj7tnZZ0XYwbVu7iBJwObSunGixyhHeUncm18Y9if7MI/l8TQv
 +egbw8nhVY+GVjt82xPhZ7491DHyIo6n6m4VGn03HnWpC5PMzcVUvI8VEtqdYX6wT6mn
 Qmgzq0DksnoWveuvKJnAGXG3sKKnPyRdjl3Lnv2gg62FPU3DxluF8po1Da3YMVnBNNKt
 qLDBpcMODi4dC59Hva6C0FcPB7bON33k3vAhp6jD4zsNkFq3lYrqhWUgQ55nox2Xix6U
 5hlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM/Mha0ooQ+RpaVCBXGl8abegbXwVNUUoqaYnxcbdZJ5Ht/GEfMdOU9kU/4YmwKImjPq3i/qyxNDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx97IWpsvf6ZOZ+73+IjYNk2nglwTpIaRZJ5+qhL6IqL3tyDcVt
 0R3081s+C72Ei0hztfgsel57OwjmxPY9GXQvfexQmxQzn7cksRQCjcqHVLcdfsQ8ybhcUoYtdfx
 jfYwCxK1uMUCUdP+irOZ8t6E5ExdbVaT/0t0f980TfHsnRi2Z85SpkM5xLs7ncySEhlBg6F0=
X-Gm-Gg: ASbGnct2sk5hlFL2LA0WEwz1zVKCNzoPRbW39A69Cwd9i9xVj9eioUZrRli/ppCUFqP
 saGTVe5+ailA+jis5QfJhIQWfmxPqaogAx2ERoCLhbDexpM20lzhRks2Hxv4cporH3wM4RbME5S
 sc8zyatotxI7+M7HU36aUKSvxe/6f0/KNZYzoohYV+Tn9rFJcY0pYgz1W+IP+YWRyA6UXk+FVta
 A6KewnPk7aq3eQG5pOhDqv1p9nJvd+QbaJkm+vQH12Ywgd1QLyELKPFZVJW7L9EY6UUSMnpHWyO
 ktdlv//scNu+mGvZrzSYAPFxdYCu/OtPpHeBJD8OR7h/EwCpkOyGUyWVV2umO3jlln/0vXO13zL
 soMVIimzg322wnOgDcDxoFU7O0TjBGHvwcsc=
X-Received: by 2002:a05:620a:4707:b0:7d3:e8b4:3386 with SMTP id
 af79cd13be357-7d3f982d109mr467393985a.0.1750443244516; 
 Fri, 20 Jun 2025 11:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYRug5gJS078hOPt3466yq98+p4r3R9GxsncNqHjb/+sLWrB1qjkQE/6D68L+cdn2aDAgI0A==
X-Received: by 2002:a05:620a:4707:b0:7d3:e8b4:3386 with SMTP id
 af79cd13be357-7d3f982d109mr467390685a.0.1750443244082; 
 Fri, 20 Jun 2025 11:14:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 11:14:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
Date: Fri, 20 Jun 2025 21:13:53 +0300
Message-Id: <175044313809.2014621.13604308903491514079.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
References: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oF-9I-Nb6eGStq7B_TDbksP86A-yr-r2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX/WaIYbWnkoVm
 869Kvm276+gB5OYmyyiMjH60r1Fvz3b2ttW2mbF2W93OreYb5YCYxg77QtvYll2T9XGfUieE71a
 mSOONbFMqcDz9tindB6L+nzTFatKwrGvGRr/l1QmHV6g7vwHCgeYdDNP7ekB9hkyK0ZlSbSTL3y
 C2d70xY0/hCPVD04DsJ7OXJ4gxeJOWpZIe1ps8WmA/1gR3N1W6WwhKeDA9VLgxQdvW8kKQnj2uA
 6HGljw/yQPh0FBs0YaYvW76wK++l/6Dfqp/VfOxnzWZ53x1kVJajlzni68d5uxfXFT2jLW7fSdg
 3oxlGmgSXqAbNQqnGlJZcKf84PKI7o/1Pt+ggQE9Mk9nbufk67yfTjajL1GMvr2Gl+mzZ6oEY/5
 Y1hnfqE/2yjQqUhRAZWJILSdGIh+3LCgLLRbDH6BKj2bU49TYeOfIb0Km/HDfmB+l85373fr
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=6855a4ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=yxMiGmJVoxqqM-PvpN8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: oF-9I-Nb6eGStq7B_TDbksP86A-yr-r2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=777 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127
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


On Tue, 10 Jun 2025 14:50:03 +0200, Konrad Dybcio wrote:
> Based on the downstream release, predictably same value as for SM8150.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/457fad6dee5e

Best regards,
-- 
With best wishes
Dmitry

