Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B4BB793B
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 18:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0511110E94A;
	Fri,  3 Oct 2025 16:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDAabfTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518A010E94A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 16:38:04 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AFt96000949
 for <dri-devel@lists.freedesktop.org>; Fri, 3 Oct 2025 16:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PaB05ReHzVkjcgDOQJ8wCEcv
 GYDkEolJa/U3B3s4jhQ=; b=BDAabfTBHu4Qu7hHQcd4IUutsFopPzc789XbybRe
 tzimqUkbL+tppeZO0qOdF4ae7AbWNAr2ewqk7VA4DRN0VBawMYahdyLjSNZvPO5Z
 wW7YVot4zjAiwsgzl7HQ3u6gDxNHcgI//Gy3/hnKOYssKKxqixoGbog/jtwbC2hw
 p8FFXFFJuRrfRvpmEaSadBLlCN552h4+fAQUuc3+vol+H5TKYaiPXwZr/BKz1/jV
 KU2jbNZ+R+r0lM9bnAw3DEBwULi20Ndl5XVUo1ix8tKuocoxXxMiBynlsgXtwhiU
 GCwz2Zr/jlzRNlqtU/iA63FyGrk7TSpwt3VKA1grlgQ1rw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x63gv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 16:38:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4d9ec6e592bso44678591cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 09:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759509482; x=1760114282;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PaB05ReHzVkjcgDOQJ8wCEcvGYDkEolJa/U3B3s4jhQ=;
 b=sMUWhcZ+85ViM5xomKv2odLq2DtrkL+WPYEySx2+oj/OfaCOhdbySHe4iKDzIJh4GQ
 HCPgXzooktgcWyAP+JwVXga3dsD5rdJR0dtKMN3rKDHDPSIbGF0I+xFqJ6xo7M4VCzhD
 wzMix2nqCfZa6Gglm0UWImw2jbVaEKMxnaG3H3k6v6rYBudcHrEQ7Mr+i7cs5RxIsySg
 XId3DFc52E4/UOXhLPyJLLUGiTMQoYKRGuOxii//Ek20Rgxejefx3yOKiU3CAc0x91ac
 gMYnfVx/7g4Y3zXWQE2y8SWUEDFDZqHD1jooBHCSz8F/2B7lDGkyWvLgV2C0TVV78Z26
 Ofug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLdrXZnHe07VzTnpZdlMiBr/IfDl8YY68uaBNWR5kRSNRkjuYX+MlV2DX6FLT3RJCHMg9bTC1Y72U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoCOZZg8dMtf+H7tpfLGchvzHQzPUvIOZwKvTMMqGAEPOdexsM
 uTmcRAQOem8H0DUsbNtQoQXvp4bb5nwhAnILp59AWktCWdvmJ4HfaEmHIJbdNFdUR4uN8MkFSK5
 lEEnjz3iBQtMV2SgHMzjNitZ2kqvNfImeLUGnLBxdL5Fihhd/VyTB+4x7fzS13HTmvNjZE94=
X-Gm-Gg: ASbGnctiaY/y4Du7K/EyEl8GKn7ZiLvN/mp4ndu5f79gbpTg0izQ9eTpiv3nZPR1BoP
 xEpZkprx728VhexoUl0+ZPpCxbRft5qQ4g+YMpO6onrqAV30Vw2QvneLbq9bMcq/mz0xbW9ORsm
 yutG6+mOQPystIzM+dXDLURlgJuJ2MAH8FO+g5g7V1h7kCuYPJNkHSg09/WJaho2sV/1UexiWm7
 Sn9GcaT3D8Ist40g7BzkqmGUP00pqggxCMlYP4BgcekGvxHsoOyzlm14C5qmf1UtUtKYepWt+43
 HhAqGjXZ5fXHbqWBFSz/7ifzT+N8L8NTGsXkarWFhMQG9Wz+CVKtcnPPBL2EP5LKu4jfEYUzUmm
 HY9NDKsjUSxpYIoBraqJ5m/sjwidxJqAe6N5zAJFAqwSzS2BbplcE934eGw==
X-Received: by 2002:ac8:5a84:0:b0:4e0:33d8:c636 with SMTP id
 d75a77b69052e-4e576a80529mr50279301cf.26.1759509482167; 
 Fri, 03 Oct 2025 09:38:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSWbvfWkZQINoQDGTwKD6Xs8g7eq9/yE76D0brkwEkWdt9KSTmMQhBBhVaw7u8NS1F6T0QKg==
X-Received: by 2002:ac8:5a84:0:b0:4e0:33d8:c636 with SMTP id
 d75a77b69052e-4e576a80529mr50278691cf.26.1759509481479; 
 Fri, 03 Oct 2025 09:38:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0119e878sm1983385e87.99.2025.10.03.09.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 09:38:00 -0700 (PDT)
Date: Fri, 3 Oct 2025 19:37:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
Message-ID: <v37d36nd7ues6fp53ncrqdzvmikzjn4pf427wztzatc3pvqhvn@kpg5jrkqbfc4>
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
 <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
 <e42176e9-cac0-4142-b463-9eaf86906c46@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e42176e9-cac0-4142-b463-9eaf86906c46@linaro.org>
X-Proofpoint-GUID: ObfXhECIr38VKascC2-NW3o_LVD9-pQc
X-Proofpoint-ORIG-GUID: ObfXhECIr38VKascC2-NW3o_LVD9-pQc
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dffbeb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=qOohxIfdt6ZrimawmyUA:9 a=CjuIK1q_8ugA:10 a=2MHBSq50hwYA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX0oKFPXdOV8tC
 qFwHS6tSLiJ8j7/LeKsVHFPFVQB1tlajiQ25BV54DESecyxw7YMCJUI9u9/GqMxci8hUUd3W/0e
 qKQllFQVp8tLoTwhM4nwX2rQt3BYQ8vkvNmbs6Q5LDIfoEWhQk9EAS0nh/tB6iGiQsynTtSZ0bK
 vCDe9567uvRL5GzGncF2jbkEPPGZ9WYwnN8i9y7xyQKyJuIeGleIDSW6m6OXc/5Zrv0LE7KCvIV
 P9z8YWiSDAjh1QAu4DRLBMgX4cD6vON5UVdLGqLC+/7z6/xy4WTaLjbx5Nwx869uqRNMS5fHo6u
 hVz4nLO6Ad68WSYI/D+i51hfmLfsfaNkcWbAY24bmrw0a38P/Rwr34rIIWidKV1pdc+WrzdlwQV
 dBZlzLsB9JAMSdoIo5G0ahVLFi3iCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
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

On Fri, Oct 03, 2025 at 11:01:56AM +0200, Neil Armstrong wrote:
> On 10/3/25 03:17, Dmitry Baryshkov wrote:
> > On Thu, Oct 02, 2025 at 04:57:35PM -0700, Jessica Zhang wrote:
> > > My current email will stop working soon. Update my email address to
> > > jesszhan0024@gmail.com
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   MAINTAINERS | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > 
> 
> So dim complains you didn't review with the right address...
> 
> dim: ERROR: 261785a47e0b ("MAINTAINERS: Update Jessica Zhang's email address"): Mandatory Maintainer Acked-by missing., aborting
> 
> I guess it expects Dmitry Baryshkov <lumag@kernel.org>

No. It is a known limitation of dim, it expects a maintainers's review,
but there aer no maintainers for MAINTAINERS file. 

-- 
With best wishes
Dmitry
