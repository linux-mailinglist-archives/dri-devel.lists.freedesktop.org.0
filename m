Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3FC041F9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 04:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF88310E9B6;
	Fri, 24 Oct 2025 02:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ei+CveU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56E610E9B6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:32:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NE6dlM015958
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=K8n4jQJ0OSelSp8GbDvqIHis
 YCrNm03CqsfjSom7lUs=; b=ei+CveU6DUojLyPgBThAtXMSMw1ukexnV7Y1Kbuv
 /oKwWUCmC2Ig4HRts6V3s6+L7yzD1KSuChwZqPGWrnVttXdd2+s2xkMp23AM+N2b
 hyBOULPPFdvIL+PJRqoyrOL8nuolzMNJzyEELU0S2c1oXgYJuRQjE+J5fTM0PXo3
 GTQg6zmgbzpqBJW8aYZoS+84+8TdFn63ne/xLAqu9SyAXHoUlw7y7vRWdO2aKd6y
 bVYOir0kZirfceU0onX6Uwy72XFyQma2jPraEj3lL5q8+WNoh+Vfogc9luDInfg9
 2+OCWBpbYTnHIi6I4wvOTFnXP1uZNByHgUKm44dArZ95JQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsg4uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:32:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e8916e8d4aso76831241cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 19:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761273164; x=1761877964;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K8n4jQJ0OSelSp8GbDvqIHisYCrNm03CqsfjSom7lUs=;
 b=acvxiRfnDS9HxLehD2lAcKfM5Pt1y78LRTvy6I3glAJL6P9VNx4513u0tUibXqjRp/
 G/R9bxY8LcWZcIg179SORI5tQArGJ+h2ufxIIvRa7aZuNcFP1MonI+9HZvjzcbBfN2Ow
 GQFxuvdrPnzO7AAARWOVmUA7Yt/DPWgbnBbyfyQcjvkCZQ4JqwnzMZdP7eggC4GYRqwx
 mjotLUPHNZFcQy2r8VdZWyAkowhqLiadj5/SKeiTXpJcHoMdPoDKWzV93247aIccTmuk
 VPfob8iizqdzUgIa6zuBtN750H2VZ7hUIrzOguk0ABiLS67HBkZPr/zuIqC0xS1X6wdg
 xukg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXErhEMcrkGXt3ssSWxn9nHRX90SG3gFtBQDV/qwJx/HQPFdycFKqtDtwuYjA1xP4BEVwd1hrJ5uqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFwskPyH2ufuDqaiO8clihSS1ZcyX80l7ukZjJrNmw7qbQ6Nh1
 CXZyP8RMVUk3ctV2mGnZIPsyoTQMp/4yw4SwU5KOg+wMFziyMELRx3pqhKsPBD19l2eEPPMmkEC
 Y/0qSed3fTJw3I/BG+LNo3LIOExOvVFejRBcgKUhmrtu5m4OLyLrwVWdwcZLum/o0RHOHrc8=
X-Gm-Gg: ASbGncvDAwi+otwBcAHuk20zTMWZixwBUWuCVd++0MlXpTF8MzKZbPOH1pOAgXS0tSr
 mPWSKwK6e/A/LDB4PxJNIm0uX7DmUjNnlUUzqVvVRPGomztpv0ly25gu1BFYb9qW67gSwRaCE/a
 3y3Hc3DYGZkzI3zBtvg9bFFOHW7MKW7RH0pRcdVKzGYYMoB6JLjcurN6q2EZ9rkfLqxwowqKZ+r
 DBWXwTrtXprAMNXq7Y6PsrqEjLKN/3CALvTPIP86FCBdGhJViC1oLDwTcMttCYT1J2rHGk2TUbN
 5LYrvp0nb2y/LzRqTEIpY1p+Ckg7LCqOSm5XLCn8xHUMcI/MJxPCreq9ecGuWMWKOT9JKg/6oCF
 nuX1yGlNj9kKHquUZ3Jjqtikv5fftlpECQuyJxnOoavJycBU3lPejhsSQCQ6f
X-Received: by 2002:ac8:5a46:0:b0:4b3:3b2:2b4b with SMTP id
 d75a77b69052e-4e89d0507eemr299680051cf.0.1761273164503; 
 Thu, 23 Oct 2025 19:32:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8RJLrpZlLDIekUoulVf3HkGeQaD97twoWzv+nd9iE5tF9H+Ujsga2U2zLGTAjXkx/iNwf2w==
X-Received: by 2002:ac8:5a46:0:b0:4b3:3b2:2b4b with SMTP id
 d75a77b69052e-4e89d0507eemr299679691cf.0.1761273163987; 
 Thu, 23 Oct 2025 19:32:43 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c12056aefsm284098785a.48.2025.10.23.19.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 19:32:43 -0700 (PDT)
Date: Fri, 24 Oct 2025 10:32:31 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 00/12] drm/msm: Add support for Kaanapali
Message-ID: <aPrlP+vtLTt/j23E@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <r6kjuxajnimaqazeimzc5gscv2qxudjzkyooxumzakjzojibbl@2jiw6duxfbtz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r6kjuxajnimaqazeimzc5gscv2qxudjzkyooxumzakjzojibbl@2jiw6duxfbtz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfXxA3oD3UOlqCy
 w5E/3IUakIic+XdrnxjhqcCbprOsgEhltFUq58lcth/uDx3kzye38aVDf39NNEcAH2fzkKaN5AC
 dxe8COxgGL5M564vo4yFhx178qE+dTAhjPqbmV59lgi4raQHkKu/HEQLCr+3XaGzGz5UTVducRO
 tYgpAbETvqBxbhhgA1wW3Dv7qXnzbv80eAdWuWCZxuFbFtCddssDrx9WL7lXUcQJZ08RZQw2l6G
 sHNP9MBfmtFTZNg1GCrpGeHOeTSPmVXuO3wANPOY4jNSo3RDJS/GDcYt2EL+Sman22C8TjSho7y
 xSos9tnc+cHBSYBzmKVipdXW7t4tzhcxgj2VL/RRcozn5o0yplSdKqxpIM2CDLIjQwLUdj7sCwO
 CQEgWsIRW3LXTwIDxrPg4igiYq6n2Q==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68fae54d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=sB9pjYolMnSuqpLAuykA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: v4FyL1ogLzVrBwfXyYW9t6PnxHYA-zQe
X-Proofpoint-ORIG-GUID: v4FyL1ogLzVrBwfXyYW9t6PnxHYA-zQe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
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

On Thu, Oct 23, 2025 at 02:46:10PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 03:53:49PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> > - DSI PHY/DSI base address have some changes.
> > - DPU 13.0:
> >   - SSPP layout has a great change.
> >   - interrupt INTF layout has some changes.
> > 
> > This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> > in addition to the driver changes.
> > 
> > We have already tested the display functionality using the Kaanapali-mtp
> > device on the Kaanapali branch of kernel-qcom repository.
> > Test command: "modetest -r -v"
> > kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> > Yuanjie Yang (12):
> >   drm/msm/dsi/phy: Add support for Kaanapali
> >   drm/msm/dpu: Add support for Kaanapali DPU
> >   drm/msm/dpu: Compatible with Kaanapali interrupt register
> >   drm/msm/mdss: Add support for Kaanapali
> >   drm/msm/dsi: Add support for Kaanapali
> >   drm/msm/dpu: Add Kaanapali SSPP sub-block support
> >   drm/panel: Set sufficient voltage for panel nt37801
> >   arm64: defconfig: Enable NT37801 DSI panel driver
> >   dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
> >   dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSi PHY
> >   dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
> >   dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali

OK, get it, will fix.

Thanks,
Yuanjie
 
> The order is wrong:
> 
> - bindings
> - driver changes
> - DT changes
> 
> 
> -- 
> With best wishes
> Dmitry
