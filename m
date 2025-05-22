Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A851AC0BB8
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8512A10E747;
	Thu, 22 May 2025 12:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jchA7C/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81FB10E747
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:39:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7T4tT027699
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=19244OeHzQNxf5SDPlapadMw
 0CElU62/QrqnAm04GGQ=; b=jchA7C/tYzQs3FSMKQFxdC+2jE3n4zIlVl/HdbX9
 n8tskfMryHGAmKxZ6NN8UAkxanofJJ1VJnP1CthR+8hAOE3UosADh9y9xCNSzMYk
 j0kZr37FN7+gTunVFYJu7rbofO1TOObyb0HrLl+tdJFy8wBSZ3MOhF/G6v1+iLOm
 h/arkBxRSwvR7USQsmLjjupau1ElYP7fqal2xhnEy00Dkqa1Bylmjz8VNkk48wsZ
 BAySQnq/YOExshiMcnDGfxX80OFBWRSfB7VHW02Di04MnD4abWSuFEzvy1LlP/lX
 pki7Pnd6/fAW8sv4iQBCRvzzDyeyYHF0ZJqBP+gUeTpVmA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9e8cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:39:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8e23d6657so67953066d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747917540; x=1748522340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19244OeHzQNxf5SDPlapadMw0CElU62/QrqnAm04GGQ=;
 b=BahAHd+4EOvMllyRqP5wCSqnbM9ZNZ8qL12mxhv+fnSJ1o1A1q1zY9GDtMBKtQaDfl
 MpiQvK4lqS8RKP7FCDP/yPmDUiV2ImO0TLfQ3F0beSMcnyV025/l2tXcIW3Bj+48n/Vc
 k5uIwbnOrnix15jkW8GgK53fsjXAmTWBFEVE3X9MG1DsU4e5XwkwQ5RMQ2DiqZNgtJth
 W6w9nysGz1YRfgBixbQTwDVbDklnaEu2OwB0cF3ZyHfA1jZVKC2H6pN/H4v+kzJ5gq7W
 pGG9ePHS7qHUum3osqVgX8u6jfuZAea1gSGPPaMKQ6tWSOxb0OI6Mga/uKRSXYf5K6en
 1dCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxc7mLJSXKOMt9v/yyzMY6rbjXbbAu1k702slWM21lplyIKwsi4Ri2ZSL16wNNVSYgU4IcBptUpIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQxXE2alKSXRZcowVnVZG9pHdadTjvEyte0oaH3+DW7Qee7BvB
 9/PPMtAISZ52KjEnaOaRuEDuYPIcJS7j2/+NFz6H8djFzXUHmBDv/5mQN47JTEo4O3zVZSmgogX
 9HjNZiq+WLLHqdVsQtBWOrgACkcXsO985nyiuL4OmiEWmVrYGTP1Zg2HRRk5LXsp5aM/8R4k=
X-Gm-Gg: ASbGncuQCeTOhinVxDNlRiXjS+GTAMy9ZJ5k0lIe7c/OYRBl+5IeFotI3jaspS3POIG
 WgfxXzhZ21ecoDkRqVMgPP9hKhA4MMJmNGd5r7ZcaxLFz2nWL/bJHOO+T/9Z9+Ug45QGd/Mhw2a
 CAxhGmVFODOw+feCrN0CjWwt/9ulgpKy1BRNzw/fqr12F+Q5pQHhxyj3qT9IxiKDZHYzPzYOpBH
 4O1B/2y4mgusovvzmPyxdYTHNf9ugwkGOKMgLeAeWX1wlwV6QIqujB7n8H8Llt18nOI5BTWwZRP
 qSZdRcgNVBvEguUFpiTMkEjTvtOvtnafs80oAmBE8zIRoT91DPPOFdz3LfEHXF+0SI29CdRm8nc
 =
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5266 with SMTP id
 6a1803df08f44-6f8c23c834amr265730916d6.3.1747917540258; 
 Thu, 22 May 2025 05:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3dD1d3o6Uh9VFUBMuETCUX8JC+Gh5YdI+vMkCsFQ+A6CYWX5t0w0CnMrGeqa/WbJpReveg==
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5266 with SMTP id
 6a1803df08f44-6f8c23c834amr265730536d6.3.1747917539880; 
 Thu, 22 May 2025 05:38:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084b6c7csm32876471fa.2.2025.05.22.05.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 05:38:59 -0700 (PDT)
Date: Thu, 22 May 2025 15:38:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 04/45] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts
Message-ID: <smj62cjqy7ihd3ywnvwkqzczlg7op4rqy3yrwlibjvouqerofr@bnlpwl3j4jge>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-4-f8618d42a99a@quicinc.com>
 <osctzl3bgutcjt3hjvgxaq64imn2i67hagqm5slfozf33tnj66@5hlfmqmt7if5>
 <2a54ffe8-8e40-49f6-8735-96da47e1bbc6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a54ffe8-8e40-49f6-8735-96da47e1bbc6@quicinc.com>
X-Proofpoint-ORIG-GUID: APQzPIJ11elyz8OPKVv7RwGqUuDGRFlI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNyBTYWx0ZWRfX8BRR1NB+wvmi
 8rlIIW7wfwudOgMUFwhRlOpGygBjj5KSFFusrdpmV0dAt3KnQpzE0iMGLeti5vBtULbLSB9tzNv
 ANQKQk1i54SwZ3Eg2jV+e9CStaIAAUALB0PZfrEQw1qyh1l6yk+Gnp/7OJrO81moDiGQZbnT/oo
 GW6sy4jbdWO+vjSQ0eW7n3oAXkAv5PtsZ/ejmo6PFPn5oCYSr2J9XInKJ9tU00nRejNeGzChmsS
 D/wZMcqVwVb+Ccryj1GNYO2WKDALuo/71ECabCMy2gBldsAM8kUI96VvqiSY2o+vAjTs1GPRKWg
 zLEko0z8ejRcVymgfhliKYMKB1xiXwH5QoZ+STh7QauMmG37nsHxsy5FgZAJW4rw9V4PAcSDLyV
 Mxy9hrI4mIdXaPdQwzeG262RD1GzVdquebOmbB4XwM9zqAIPieeqJh9naQhdajl68zxGwl3E
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682f1ae5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=YGB3awJd4VowHVBKth8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: APQzPIJ11elyz8OPKVv7RwGqUuDGRFlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220127
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

On Thu, May 22, 2025 at 05:51:52PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 16:51, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:35PM -0800, Abhinav Kumar wrote:
> > > In preparation of DP MST where link caps are read for the
> > > immediate downstream device and the edid is read through
> > > sideband messaging, split the msm_dp_panel_read_sink_caps() into
> > > two parts which read the link parameters and the edid parts
> > > respectively.
> > 
> > As you are touching this part, could you please refactor the code
> > instead by dropping the msm_dp_panel->drm_edid? There should be no need
> > to store EDID in the panel structure.
> > 
> Hi, Dmitry, Abhinav will be leaving the company and will no longer be
> responsible for updating and address the comments. I will take over handling
> MST patch series. Regarding this comments, I don't got that where the
> drm_edid should be stored. In MST cases, where multiple panels exist, i
> think that there should be a separate drm_edid saved for each panel.

Why do we need to store EDID at all?

-- 
With best wishes
Dmitry
