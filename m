Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B35B1424B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 20:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AE010E58B;
	Mon, 28 Jul 2025 18:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcFmvrzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5214C10E57E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 18:59:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlMnI023447
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=g3b9mjC0DOS1TwNiZSFPS5aw
 kCSouvEfEECI0Xi46LI=; b=pcFmvrzckhuIL++xLIxfre8lNoQD6k+Ws3MV2M6w
 btcd6Titg9W1w/jUeebgyZbMIgfwYKc71Bk4rnApD8XY5EW56PdJbompNCwbJD6i
 7EJJFtNSbNprjMuS4Q4D1+uFs7lTCMbC4XEfoyKTyeCdskXzGVBU7WRjYpoBY+Ja
 SN0Kvz3cnFujCiq09UUWfWtxoUcdQODiGRdSJW11M7f9iWeef1BK4lwP24g4mlzc
 555Cn72oYPTQ2krMRu6FUoksgZWFWkquoVIClMOc4IjftpJe/tQsP7a79kW4XV8p
 iBmXxnTXff2Xo2YnHgUMWfqh5RrVhqlwsmZAlYSdeqOSoQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qnhe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 18:59:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7073140087aso35779496d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 11:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753729149; x=1754333949;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g3b9mjC0DOS1TwNiZSFPS5awkCSouvEfEECI0Xi46LI=;
 b=JP9Su+nIxQ0i+QMBIr5KWGMx/uZcOgotpXUc35C8A+6MCnvEcmSth/LWJN3hwO4Fkp
 WRC5vzKBacz3DfyoWMnVJyi5LI8lipWeL2VsL3bo6IlFQds/7Plaj/mI4Poq3fj5KV2F
 UUAivTSD7889dTEQDgw7ypdxCZ1QmCmZ+Yz8VylAOLVg9YGu4XnJjq+lSmeRK1ZjfcRK
 9JpPWwvHZckL6P+pNZthnOsCD1a5WIN/TbhSuRAY7VpHP4hMDpm8l5aw685zeRcaL61Z
 GqM3dmjkWK1kgQhlQYLebVd2hCua3RxyzTluQbELW/GHpvEZ6BvwyW9k/ETdEDIgBszU
 XBuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRWmiAiFn18kYv7H6EFgVIvahu+s9l5ozxAQBuR6+oqbrpfc7GGIH+EBHE4mn+DWCV2ckQqY7g8xA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXD6TwQLNyYdcSZtlqg28R63M+KXVeR+wNWRQwCHtAMgtqjG/P
 LNl2COF2feYlUrKOKwzGo576Miavi42wYSF6vBtoLIcaVQmaguMaJKlA50CEDgAqLTUlk5xNmHa
 E6MqgLUQwdGoOuKGrxuOCjydnmXQN9aMIsvjy5mIoFxuaTufvnEce7wsB77Q7HgovbdoxVpI=
X-Gm-Gg: ASbGncsEwZ9uaApdunutfqyQT9TYrvWyKFVZDY6vaAn4s6Gzt7oISlpGB27DH1UzU1o
 ADhNjyAipJdlxGoeWJCk5/9lGJG4vhW1HYdDAIRy/0G70+jQ0UPAZ9VgWBoiRCt3908t3IlTM0H
 Satiy0y1P21vdtKjDGU9wCKs/gSIv3eNJMcTw24a1zdyFeF0O13EhOc5klQw/O5yP5xj/2aSh5A
 AP/0oh/QBj9sI/J8RxB26cSlkymfLUyf/rILLV1dwC6hTQPSzv3Q8yvWTG8enP5TIJ29P/LLfH8
 x0mUvXH4nTtpI45nCSP6+vurkMCFJMRagojwa9NpWm+XltP05MdLa/nyxQdu//p2q+qsAotKD2N
 J+XGd4LZkWtUp1FWzXXBIzP3YwKy4+9V3jb6x9yC7y0Av1xQ97bIS
X-Received: by 2002:a05:6214:2261:b0:707:1b3c:4124 with SMTP id
 6a1803df08f44-70720514bc6mr139816176d6.6.1753729149022; 
 Mon, 28 Jul 2025 11:59:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeR/e5yy2Dmbqpj9B2szzZpphi7NqKMlFSMX2Qojm62xxZ84NsscDMGppFa+sWmqZGFGaQuQ==
X-Received: by 2002:a05:6214:2261:b0:707:1b3c:4124 with SMTP id
 6a1803df08f44-70720514bc6mr139815506d6.6.1753729148113; 
 Mon, 28 Jul 2025 11:59:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f4267695sm13324171fa.50.2025.07.28.11.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 11:59:07 -0700 (PDT)
Date: Mon, 28 Jul 2025 21:59:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for
 X1E8 and SA8775P
Message-ID: <kvnw3wkbn3jedfxryqdikef4db6ij4lobgj4qp4dgrpd3sliga@w6do67fiyhri>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
 <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEzNyBTYWx0ZWRfXxb3OUUawpk+3
 u8EFoiI6ekGy8N+H9dJJq25IP5CpU1nOGeCQ5ZM80L+3Mt+sUpytspIQZ7xI8NuY9aLfNIXmFtG
 AyCDuyygUi4Iglo72H4HFIqb+lCyec7dDXlM3tS+KUiJDCyflTx9srbx2grp6ZEcWEDZVD/VF7x
 ypXQogTkI8/qyS95hqR3MIUSBOT6jhOe1jWhH4pdhN2OsvlB7iBNov5OgHNw1GHYTJI4n5yRfMT
 9NmAW45Es0KCBAPADBXGsatAWxiupqtKhFS6ElmiUHbLvOmgwJh1K8AJkZ1sBhXZCmEZdOQbx+a
 J93YZpMtiOMFgRI1bVvlSvRJckvZ/AcvyZyKgkhliczt8T2kMsWV1L4qrMjqja2ZThavZb8qzXf
 DoaDXJgoN4q50zK9tgunFjX7U0GV4tlQ+uXZZFYihkA3XgmHYci5gMGN3xVSChMbsTNkAa0f
X-Proofpoint-ORIG-GUID: 84VUJk07ELlszzyBR6ZLg1FoaJlQFZsA
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6887c87e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_uIZQMxxb9QNBo7-lSMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 84VUJk07ELlszzyBR6ZLg1FoaJlQFZsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=745 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280137
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

On Mon, Jul 28, 2025 at 11:29:31AM -0700, Jessica Zhang wrote:
> 
> 
> On 7/19/2025 2:14 AM, Dmitry Baryshkov wrote:
> > 
> > On Qualcomm SA8775P and X1E80100 the DP controller might be driving
> > either a DisplayPort or a eDP sink (depending on the PHY that is tied to
> > the controller). Reflect that in the schema.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > 
> > Jessica, your X1E8 patch also triggers warnings for several X1E8-based
> > laptops. Please include this patch into the series (either separately
> > or, better, by squashing into your first patch).
> 
> Hey Dmitry,
> 
> Thanks for providing this patch -- I'll squash this with patch 1 and add
> your signed-off-by w/note.

Perfect! Then it should be S-o-B and Co-developed-by. Thank you!


-- 
With best wishes
Dmitry
