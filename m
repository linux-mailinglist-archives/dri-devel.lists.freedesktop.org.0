Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7FC16DC8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594E410E20F;
	Tue, 28 Oct 2025 21:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3zMR63R";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfhtYv/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182D810E661
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:06:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlPBp2616013
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3LuDd6Mqkc5UQN+6Kj33eDjK
 A0G6b3Ct+WK02iCqVko=; b=U3zMR63Rc8+9bWu7MD990IAbZnQc1JmD0cYakHK3
 ElAuoxoNkhHenZM520RRB0hRAO+XuMPW+hty4VztogTFWdpp+3NWvTUAPao/3gQi
 Us87yalsSQ2t0GiioPBTs8QMiNm9MsUNi64FBKtSmZyFbABrZn8OS0Is2QHTP9xR
 /n0RRi25EfQNP1JoNN2qzMBz0gUtoPXgwK52tJ05ndOpF54VXzcC4k7fUcorKkpZ
 +6Rgu2EZ0wX2OL73JIUJLqC2DkplXTY0iNhiNqbX0wK3N6hdN/f+k89M1/w6CPYj
 yrQ7eCziIoSOu9QVufu3/pZ1llklvO6qqgOTwZHUAcR9wQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0g5rx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:06:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e88ddf3cd0so175493321cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761685576; x=1762290376;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3LuDd6Mqkc5UQN+6Kj33eDjKA0G6b3Ct+WK02iCqVko=;
 b=WfhtYv/VKll1zKYWNi+VcyKPK/OW52cU5zkxvL52/fOLP36CXi1mtGp3CA48uG/fkz
 J1kwtcylZpvbZ63Y+PH4NomwKH+8nbtwW45c5IJkOBWOlkiG9DZIra9i/YR7Pyh9cA7v
 TrtRH8ken5LKmhL3kn7s3e08WlBZq/Kh5UDyxznnc4wjnj/TgygRwuMJYp4m/4Pccjpg
 u9msqBAc243UgmckLmJAtRAutIW7oGCzntAPbECCI9bsMDKUIkFrvLrzWI1dpFON9vCd
 CPZAIZNKV88O4+cwkgQfqX1g/R92lx+i9r/5vDPLgQaHggwB6IbJIS96naOP40XIMtjS
 z8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761685576; x=1762290376;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3LuDd6Mqkc5UQN+6Kj33eDjKA0G6b3Ct+WK02iCqVko=;
 b=jm0AuYZY36mUy9qASz0PsF5WcXY7NG/sWbYqJQmzR9mX4w/3urtFrVjifOIk0uxN95
 DwF2/2C/nT3Vm94QNTY2cFqFVAdkWf8ga8z4KZtvbQcw2CgToRy6adLIoD3/WqjRS9+i
 DDM1vazBbg3U6GUBmcXXiQecwN3tHGjw2/+A8irW5s32oa525WTVbhXrAjfK0fxNDScY
 Kn+jSjpqS9V91zljhMbiao/UVhZCdCS0L0I6/nsqvoc11DCRZvxFgPDoT2+0m3JepalL
 Ktsqy3Dzu3EdZ6L0DDMON46iMo0D6kD/1n45hyeWPf0aPXp5nQfOlB5m4JgpDlQtr/7t
 OKLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfLGmmLF7NJXPvN4Qbp+OC3TwvNEcMnIj4fklkHFbdwmEpfCcJ1/a4zLvlSNXUy62TlpncADiwzqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGoFLUKWtBGecVWmW59ZVe6RSErlWOfOe1x7LzdqbZGaHs96mV
 DB5i2fjaw3Q7CTUhfshiWPtOP2bo5cSjKky0t5wlFCslPSfqWBf9dx4nobRFdz6hbI9bSjUwZP1
 oXSK3Kf+VrhfWLlbQCI8ZVALllN1Ou4n6WYCW5QQGqLAIS0ayftAHn/Xuc6HTN08yh8nTUvI=
X-Gm-Gg: ASbGncs4U08slIVYiq9bva+M2zzts+Tc6sifCRDH4Roua7XXxdt4ReOf0iw7BHwTKys
 CjyrOH0pdDvUYJbxnEpOXZdfqZACmU9RqOoZRiTDJSnqi7B2fQckUB3FYbaUEwM5k1vXlY+SQTs
 USVsM65AkK9jXd0tRFeHKs110uDXnICSuE/ZNb2blqyqRnarAL+YMtf8sQTEHmE5RogTop4Bkcx
 9FztcBk9EOJOruzqtlzU85du3n4JAh5osvYiAdAZHOvtaRuEBUP/v3kDi6LYT/E9J5PkDZFE7Nd
 7xvacn5RCLpq7O9j+LRl7tdK8/ywO6/SB5mvBzQJt6K7Lo+mNO9o41mVgH2/pC6zuw0w1yxwQA8
 jQLpzIR8NupmbHHNh7QH8rdgx4vhauKcZKqdWQPczclNsey82hSSOxknbhxurL6opAYcFzcFswN
 QdKo7xjmp+uoOD
X-Received: by 2002:a05:622a:2b4f:b0:4eb:a216:c070 with SMTP id
 d75a77b69052e-4ed15cc0fd8mr9754221cf.84.1761685576499; 
 Tue, 28 Oct 2025 14:06:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsAXdNpraFNqns3dJFErOHHCkGYA7vRGOdqLB7Vapn2gKMaCa6HiAkrwDzj46FFPulHQDr+A==
X-Received: by 2002:a05:622a:2b4f:b0:4eb:a216:c070 with SMTP id
 d75a77b69052e-4ed15cc0fd8mr9753721cf.84.1761685575889; 
 Tue, 28 Oct 2025 14:06:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee09d2e5sm28860611fa.17.2025.10.28.14.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:06:15 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:06:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <k5aszduqmczeuxpwzuq7wvkotvnqdnkhn4kdnmc6mjvzyxw6r6@kfa3cnb5qwnc>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
 <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
 <ump2gq7hta5dzul7bwjmb45dtrxezkbticdwis7opl2drmnuyz@wwlanncd6xlb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ump2gq7hta5dzul7bwjmb45dtrxezkbticdwis7opl2drmnuyz@wwlanncd6xlb>
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=69013049 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=JArj1d4ql11fNzbR7T4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: P7zumoVTTLfZFkg-V5ctWjtw2JtZTvhy
X-Proofpoint-ORIG-GUID: P7zumoVTTLfZFkg-V5ctWjtw2JtZTvhy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3NyBTYWx0ZWRfX6ererRboE7P4
 gQJgJKeC906i83SCzTeyB7KZ8dmrofpiSt+xzqQET6glxw0WPFEgIten+vXx4jneQrHqP7k62fw
 hh6ABsn7NOfaJlVNpFrQrlA2QjyDDIZi/ai+ED7i0gkF/BUUDsWafipvjBUI5eUqvDDQcvLi7K7
 t2vHBpGsqttpCJvNamHS084/dB+B8GiBbKULSWBbkWW/YzlXX5eS20+gNDpp/jlVDhSe/Yqi+ND
 uCFaXDcD5OGJf2AFV+GtQtxLCTF9ICEiuDYznhyaL6rmPYnMVYkKX6kggiEsYtBEUq4Emyi6Dft
 sf6hUUYxKMHj2iIevXdCmm4VY0Dzl+CZCFNlGbPd9J6VFyGsyMwc9ock4XCcTP060hqh0qaiuXC
 aHK9Rr36+90Q827gWShYCqgBjiiL/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280177
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

On Mon, Oct 27, 2025 at 12:17:13PM -0500, Bjorn Andersson wrote:
> On Mon, Oct 27, 2025 at 02:29:01PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> > > Describe the Universal Bandwidth Compression (UBWC) configuration
> > > for the new Glymur platform.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > 
> > Bjorn, do you indent to pick up this patch on your own or would you ack
> > merging it through the drm/msm tree?
> > 
> 
> As there's no dependencies between the trees, I can pick these through
> the qcom tree now.

Thanks, SGTM.

-- 
With best wishes
Dmitry
