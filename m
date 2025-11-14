Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B389FC5D903
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF47C10EA8D;
	Fri, 14 Nov 2025 14:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLlLy3pa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSSSB9Jl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3921710EA8B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8ZhJk1607749
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 N7lLyrVazxmxh0VMg9OnWGdTYdsEX1P3McdO903iSkk=; b=lLlLy3pa/0oPh88T
 N4IRDkueP0JPSpzFc9me6FoeuFZlhcIsd+18Wd+dx7kGs1cqozEehv3ikffFNdSv
 /PCa4oOZ0xoaXBo2+ICEqkuj1sXA1yto43G011Q8HBWEO9xUk65KdIiHxCtMpKAS
 2crrO7u9VAG1jF+WjIZpFfSQCDoSnLTU4w1ugHux7ifSOuaC74j75VCNXkw2GPqb
 +vrOdEPg1LcLDf8QAjgDkMCqEZovY4jZmltuvYhHN7oB8hRPLe2PaAUN0IkEVD9z
 DgO6lqyKjfxIen7Hmb5zpLkR5hGMebKZWWCvUXiKpqpLU9U5e+iD1PklZRL/u+Z3
 VPy4hw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ftex8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed6ceab125so56551821cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130401; x=1763735201;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N7lLyrVazxmxh0VMg9OnWGdTYdsEX1P3McdO903iSkk=;
 b=hSSSB9JljI07/jwanvstL/UFpkDs3C5LCoFfnDQODdUsCb7jS77BG7uTcYe+zlpt9E
 PpKIx4rKOlYZn2Hv00rZ7T/wz7fQxWHd7dTewq+x8PNrioLVP7N4aUfM4zo9VX/wkmXC
 w54nRraF6Drdb3q+w3fKE01oBmmrW9lZCJOzad4RK2Te62KlG+77NNtWes6lSVTzIhgt
 TmVxwMMxEKjdZ1EEcv1UPa0z/soGn6JUmsM1Ig+wdRVjaFdk7J1v05UIkokzqDgYC8k6
 BsT6SRB02adFX/U7iA4tuHCpcx3Bb3c0MWpsh1WJ+naNHdM3IdnYSVdBzEYFcecdcM/P
 6knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130401; x=1763735201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N7lLyrVazxmxh0VMg9OnWGdTYdsEX1P3McdO903iSkk=;
 b=OipNBRexipxnZdEfHsPuFZc6jcuOulld/0NSYrYIZkk3jNJYCGfhBq2rIV9QEjzHso
 y4pRukDLdb7yoNJISZh7O1PrzoG7m5jN0FwQU9UXOO6JVerrbYl7JRkIn5wsxaVjOuLl
 noXQqDcMIO/JNyt5f9E7kIE+aWVjWJg/L/FY91G3iKMaIDMuFO06N9cpU3nKXB+foaq0
 At8fim9qyPJiRKaEQquTZkQBDgfI13lo9hkup5SNMbTZR3pqEpSpK3XjeAjMd1JSDgFs
 N75s/Y2Nx/efJ+LXDjgtuaHNUpSS6lw1GgEHfxJmCpgRHCUuuuVWhbw0O5O4ZPq+hdRy
 IrgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeYJi3oIRW3ZQZ7YDsGsAfVFLzl86Z95sMlUKn7MZiLzrsJcmsBNyjrmLqA4kFFqYJO0IVFsz7YqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2ibkfzl3sE8cOOFBED1SMHwdE3n6nkKuWRQq0sl5Ilwece9E7
 Ei66kyt9M9oTZufYdfWfjLbX9AdZA1PkK+t7z/r0R3c1H+xe+rj0MPPfdnL++UVfnLTKgwIn1HQ
 JszCTkX5UCIg/0cQ7jUvn81DRHzXjDxnJxLX+rGaJ6rK8N1lE9UhQqmLyX+o2+5dTKRazQHw=
X-Gm-Gg: ASbGncv2Q8b7bgf35FFQaYxNVrb3lKD0YT46bpRKxfJwhCnJYdGoKvTiaspng2WJxeb
 /DPQjfAtSt7zN5HmSDrv2nlDPkbxOduL1KtwwG+ni9E/GQp2C25y49Vj/uY5QPndfUz3fnYQRPZ
 mwieUxbq/RSggmX0a4IdCNXb9cqMDcyzJkDWEslGlLqEQWHE8KZache9js67nFVvx947kepqEk2
 sA4cNCPs5n7o08METdGkycZdJW1r7MjJoKS5dP7ktl3xFXFO8jwCtZsN13NqY2D2wTSdCRjY6vx
 n1HHw6Nee0A/7jc9oG0zbQIfR30jB62R1z4qeFW9reaDNY9bYs+Pk/wXXigS0XiX2RSFrcLzCGM
 0c0tODLmA2YmdUJveEgyJgidRCLDHYbPYrqOOxN4AXNWIfCBQKeENLjDjEgqyEJCQKKD6uFztHf
 Qa4JuC4gGyzu4N
X-Received: by 2002:a05:622a:199c:b0:4ec:efdd:938e with SMTP id
 d75a77b69052e-4edf20480fcmr52130481cf.11.1763130400735; 
 Fri, 14 Nov 2025 06:26:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbcH9zzsrqHSq4+dSl0dRGmoS3/QGOx/7GRhtG2RrVtk+FqMmOeboWeMMmkXnDPOqFtSlstQ==
X-Received: by 2002:a05:622a:199c:b0:4ec:efdd:938e with SMTP id
 d75a77b69052e-4edf20480fcmr52129901cf.11.1763130400126; 
 Fri, 14 Nov 2025 06:26:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: Reference DAI schema for
 DAI properties
Date: Fri, 14 Nov 2025 16:26:31 +0200
Message-ID: <176312947285.1737000.12844638893324731858.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69173c21 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=76GXk1XwVRG-H1p1aUoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Jr8qxSL7EOBXSONN6or80N1slDalWIG5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX20mrbBmwuwOB
 BQwx1gdOLPPIzp43Dfp/mMUyWv+PTUKe5Zshsxy30e8EKEMU5uIVF7MpsJJ84knBDhlC9xFZXWp
 bcKpeLjIUclXJO8nSsbL7nvfpoY67bgsWGK0D6NR+i8jZcCOFGbQ+WF4lBlni3cc08Px2ZGfHON
 mLzeq/MfS5AjanBLAWwtqQMHaMmViInxgIxfPgu/AxzbtUTHVGH4fN+kB8o+pimyZjKuPNCINYi
 aBddK83/mrqQv038dkakfpV/fT6zJnZuFhRAtvYjlW408hdQVKPN19CLaHb82dTrRwKi4D9ensV
 rmGXtd5+QDvPwPuR+EffyoB2yiYZu7IOYm+a/1GrfgNT9Uf7ZoMYGsaPDHBKyyXpT7Nfi4mQKJy
 I0rC5G/8RZjuRxAX7I+cNudJLcxiXg==
X-Proofpoint-ORIG-GUID: Jr8qxSL7EOBXSONN6or80N1slDalWIG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116
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

On Tue, 21 Oct 2025 13:10:51 +0200, Krzysztof Kozlowski wrote:
> DisplayPort nodes are DAIs (Digital Audio Interfaces): they have already
> 'sound-dai-cells'.  Reference the common DAI schema to bring common
> properties for them, which allows also customizing DAI name prefix.
> 
> 

Applied to msm-next, thanks!

[1/2] dt-bindings: display/msm: Reference DAI schema for DAI properties
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a4b9c1acf401
[2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback over DisplayPort
      (no commit info)

Best regards,
-- 
With best wishes
Dmitry


