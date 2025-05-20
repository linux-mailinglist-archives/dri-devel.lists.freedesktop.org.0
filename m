Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E723DABE53B
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 22:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAC810E5BD;
	Tue, 20 May 2025 20:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8gLY0Z8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BC010E5BD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:56:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGiHmS019121
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CP4xwurVbbToqKBRo2zAIG/y
 iqGnKWmP98PPEkImYEE=; b=U8gLY0Z8pR5SFnPRgOjKJG6Alyhq4VbwJO95rW7J
 9EZUy95ri/k7bsd9dfcod+7FpQktOdUAklg4vu6RAJzeI1P9KU1OAdags0FkzuLi
 pfPDWzJnIDUX9ke3CzgUii7CsDl9NyzJ/m4P7XF3roPeGYz1pTDYCm3TmjRQqeqf
 wTdR7F5qXyHs9Q30cYICSgRFPjBHM8DDDOP+ZALi9kezflkhdeid5Kp3XjeVIiRT
 kXamh1VaHWpa7KVbuarFOpuPeCKKUiAEGREH9iX28NXNwZ5sEkTfd4L7Zo1dcq1c
 ZH08EhLR1iHY5kMrqQjOr4PeBLBllKR4t7aZ4T6m6hWn8g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh58mc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:56:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f0e2d30ab4so101401046d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 13:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747774596; x=1748379396;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CP4xwurVbbToqKBRo2zAIG/yiqGnKWmP98PPEkImYEE=;
 b=n9GoV4W1Et+JfhSV10b/D4dVnyq+6uH+rm+KIwFWbV1veBi9YzuCxlE+0ldXWX6srv
 zCyVdoGxG1x5QVsDHoPALG8Qey7nBKLfF20K75aBqtHY+IXl6c75KXH/X5HvIvslepys
 3bU8KrYJ6pbpLBZMr/r8OreFWRi9YKhJ7iwhBVlKNA+4xy2z0bUkNw/IiUGrNoAOJQIM
 D8cvOnKGO66J/9TrPaekALkdCNaWigy/SYWIYog8gwf+PZQN2g284qAJHZIpa+d4CRuh
 OOJoCVGY1DXzTViCYmXaeF9miMQp045NRA+fmCKNZRYQ90Vrt21/WHOMX4Y7zksQPBLN
 nQzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUToDgWYgHhU/y7xZtGIgjcANHzbNprpNs/VGFUUHkvnFGRe5/oXlc6mDqlQLsaJQ+LSEIdr16OT4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrdlwtQHJVx/sGKafTtZgvXrJescH0YUJuEJKXQC/qL/+Wb1u+
 14cX3fZoKZJRQ8sZtNd79wBAeiyOvIJUPI9Qcr7H2igXo0eNQdp4Uk9eZnE2zKsn8DpET2pFzo8
 IhCTyDPPLk1YmQeA3IQqYGvyJ8l0HEqliT69uA8VPawdJ8WxITmI8i2X6+PMfAUoTXjI1Se4=
X-Gm-Gg: ASbGncsQFiN/tz398OenpknbfzgIf3k1wWlkyrTzcKfmiHzuviAk3h8NVKKGTBcnZW3
 nJLGppSrKXAmQbYwklR8Y/cLJrAe2EfXLBChWO5bdnsShss70pUQVLze1W0Uqj8jH8npVm1OtEh
 ieVdDh7FZefn1ZU8zL4mUAffsxYHroQeJTLMYqSb9NfyIPA1NjtnCOTp/NodnXIAoSnhaKSeCX4
 L5kSckUwrHBkX97MVf74O/pxt4MF7eqAG56gJF/lncpHe82KWdbney4iaK60qBchEK2kVY6Wh5g
 XWoqZ9GwAFZ/NrEJjehNGEUKjCYO00689BCdyXv0KXekxn1JIrFXrenil+Rh/ZConF59+CetgO8
 =
X-Received: by 2002:ad4:5f8e:0:b0:6f8:9b75:a62f with SMTP id
 6a1803df08f44-6f8b086659cmr266190136d6.24.1747774596256; 
 Tue, 20 May 2025 13:56:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFy83aHJuT/E6OBhfe1n52CIbQyDvRG65Dk2H4hxXroNmeP8X+zaXZZgMd9JBrOkilPmPJ4w==
X-Received: by 2002:ad4:5f8e:0:b0:6f8:9b75:a62f with SMTP id
 6a1803df08f44-6f8b086659cmr266189796d6.24.1747774595898; 
 Tue, 20 May 2025 13:56:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702c0e6sm2479511e87.161.2025.05.20.13.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 13:56:35 -0700 (PDT)
Date: Tue, 20 May 2025 23:56:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v4 04/14] drm/msm/a6xx: Get a handle to the common
 UBWC config
Message-ID: <vfl5autirf6a7fg3ck55xh26rx3nbfkl7cq3kthwmffsfhdc5b@r6ibkyn2n6nq>
References: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
 <20250520-topic-ubwc_central-v4-4-2a461d32234a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-topic-ubwc_central-v4-4-2a461d32234a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MCBTYWx0ZWRfX44pc6x/Ce8pm
 w+BwZ6Zx7aXIqR0qFHV8j7PbYNkeoHT9PEeB6OUX5fxcDUMvKeB9gjC97ANM9m9c8+WLn6oSOOn
 QbWQwkOB0kcOHQtYnQ47mKbPAhOjjOQXz+LjP35jR1k6trYtM/hFmbszmFI2/KXE+hccK/mvuMi
 VybRugPQO2Nk9Z8uhKEEcM9AltVLENvFuJ0xQWqO/9FCmEzh8rSlpPjzgfEabXzO7dGnlzeLR4A
 q5U3ZSR3y03l1VYaM4p6JJXuMivY7/MCpqviVI4hASmGa9NeIgxWl4nhvpKphPGv7P2YjcKBQWD
 QHG4T8ZMGqn6LgEgBSzkpMul1LPQJO2QCb2gIOHWSG9To1rTILGz9LdB6TA+sp4MP2MQ+/sk7y8
 cucxqVDNOK33Xzji31T1u4Yqwl2m42FFCsdwB1jTwhX7eY460vV7PXI3/AV6j3y1floAoA3v
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682cec85 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=93Yf4Y-vqGi4v4eIoEMA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: gi06F0NXBRXks1R0qvCa7kZL9In4IwEr
X-Proofpoint-ORIG-GUID: gi06F0NXBRXks1R0qvCa7kZL9In4IwEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=870 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200170
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

On Tue, May 20, 2025 at 01:07:09PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Start the great despaghettification by getting a pointer to the common
> UBWC configuration, which houses e.g. UBWC versions that we need to
> make decisions.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
