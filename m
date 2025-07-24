Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F032EB111D9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 21:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63ED810E29E;
	Thu, 24 Jul 2025 19:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9JillTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDA110E29D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 19:41:37 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OA8Bk5022037
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 19:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wwNM3mtjau7uqQilaPmYdY7ZPk417VPjIHda79n7D24=; b=f9JillTeN1WWZHH5
 ZY3pIKR7gBlgsbTV8nCfFkTwKQFvc5kAKHYZv2Tuj8F0FDRD9jScKpxAp/K2jnaB
 euatl+Z9Tsi99VFiPUFZdOBnCGc0I3d3Jx8BF33TP7IxPwSyl722y8Z3ZgTaIgfH
 Bvt/53/FSMaoTtatXZAU9N5bKFUAa9xDFVCbyz1RzCKGaz263feye4ADoqGNI6w9
 NaFOJuXW3mu1PVZ9howbmHPYzAbpkvSRfFgJrxlQt78K0uKPrjADeNIv3eokqoAv
 CeQRDXO50Jw6HStpgErl+H0NVJCIiz+OAQYbMO6T3mZ/7BBEkwIOGDQ0EO+F2g/b
 WhrZVg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dspj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 19:41:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-706efc88653so28944776d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 12:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753386095; x=1753990895;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wwNM3mtjau7uqQilaPmYdY7ZPk417VPjIHda79n7D24=;
 b=ehCwfqHvy0hSv9/ZCQCQ87WrpyPIZdteBtBZALfxqYVzm39eKpFyteyKjn2Nmapgow
 enwFElq8cDWl8bUQNY07P7JS8cR1Wpcl1T6EY4y54HO4D4zsWIKR0EmOiiB+cKG+1IBG
 rRYGB1rj4HkGGKs1BcqgXVuGXKkPzgeepCUHpKdMup7R29/wSsV2xyOGNeY4kWufhnM6
 ZknxLEcoRVribZCeQiu0pnwgCQ//LO026DQcT5Ob5JLWgTnkEakinVf6xHm823fRfAGR
 RDoXyiDz4nzwOiOxJnhIky5Ww9MgZHiuryYuIgn9aVT8boKIOpdyyIatpZHoEzqn7noN
 0+Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7wPJ/tn5maR0ZqGCdA7S0NDdyCHXJ83mWm55qmqQrUwWuDrKXcQqLMdP2pGaoFhdC6pEOfuJcUNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV8iigZS4qQ4k9YqIxUw/wr9biqzLq+zvqlZCGsQbwzbdg0z8K
 BcV1xvdhaAbe0QAHxLV7WXAJJ4tKXyl5M6kjNVrWSeBK7yxxMYv07nVbexlN8e0NikNOVuTYFtN
 9fp80RWZ1/FFm5Ks2EjjGsCl25NXnDPPdLyGEZX607HQeupR45ClBgpHapxE53+1HGAvvyE4=
X-Gm-Gg: ASbGncub/i53bwQBuGgDd7/yvHNzs9Pqq3w4T5U9R/lB2hpuHdn+Ri1/1sXIKjV+oAu
 AdJICsAsJz4vtb+zH9ikAQ/mVlq3NHgUByz5xJloJOBwLXc+NCy1y7tppxiH69XTnJUut1laA2i
 W2vLOa2AVGul5SN+p/kgsq2D3Y5wPa9rJNJkNnNCi21ew4wibYQAPS95EJhpDK4Xg+jebiKnbLF
 nsSjROB3eZy4DGyr/HSN7+KhkFbMSxz6IWyhJ+LLlP7/USkGd76dyCcEkErfDHLallFsGA0LV+S
 5jUNJ+y+Z2NFsGYTy044PywQF3x0FPWjxPm4+Zhsdwr/NpWM8OR79cB2FJgL5WtwE5ScfhdN7A5
 pqeH7x42ptizxD8Kg/Rs2C7dGFyXq19SJDO436V1pIMS662WCqa0Y
X-Received: by 2002:a05:6214:2508:b0:706:6967:71da with SMTP id
 6a1803df08f44-7070069c664mr109753516d6.38.1753386095140; 
 Thu, 24 Jul 2025 12:41:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQDqKstosSneJZpb85nOhQ+2TXw7qj/NhXKc7lo8KhtjTczwG5CeYfAMo04mula3VPY10+OA==
X-Received: by 2002:a05:6214:2508:b0:706:6967:71da with SMTP id
 6a1803df08f44-7070069c664mr109752856d6.38.1753386094418; 
 Thu, 24 Jul 2025 12:41:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b53c87a88sm501393e87.152.2025.07.24.12.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 12:41:33 -0700 (PDT)
Date: Thu, 24 Jul 2025 22:41:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 01/14] soc: qcom: Add UBWC config provider
Message-ID: <jfslenwbfdoy7qz44on5ckzuljrxfjce2encitxiz5pws2iecl@2xnwdlpppmsk>
References: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
 <20250626-topic-ubwc_central-v6-1-c94fa9d12040@oss.qualcomm.com>
 <CAL_JsqLviOtUjzyq6Yg5tksxV3ANuxorX7kXcn6ibFi+mPwTog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLviOtUjzyq6Yg5tksxV3ANuxorX7kXcn6ibFi+mPwTog@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=68828c70 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xQNkBhgbifyRU6rVYtUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: M3rHgruYKF_OclPnI10MTe2AYF1jyPSV
X-Proofpoint-ORIG-GUID: M3rHgruYKF_OclPnI10MTe2AYF1jyPSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE1MyBTYWx0ZWRfXyz/TVkmm4hkU
 46B4uJ067B8QCbkc70RWMOUvVNasrFes351sNoa9vLXeDlgIU/fLPvbfzhqcXyOXY36rHp4R3Zo
 uQcBxG/e3spoIiCEi2+qxhDWXQxRjqLbE38eg6WiPYKDDA4jBjw1KgVhNqgw+/cO9iCGOqTmNh9
 nBihzcZ1EJWxU+gqC0oKLYN/k9Q5wgGJhXLT6x1mCm4jLzdWtHrQb4YwBwCNDZisuybUetqRArN
 IQN2rhWA3sIugxKuaRTUaHISiH9j2h16BRkfJRz5k7BQ6acXoxy1agP0xdDH2cSlcjcqWPMtsPI
 nlbG/mpT8TlplJBSMlZA9SUPXtiqMTRLOIdGaVMdZl7h3usGF6Ghu0hhIEF37L4BTRVXOU7l5v5
 eTH0UiWvh8vB0iDyAw4sVssY13KhpOyGJD7qOB0JVnm3OthMpLsgyohhw6DfsNvZmTJi9mU1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240153
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

On Thu, Jul 24, 2025 at 12:24:29PM -0500, Rob Herring wrote:
> On Thu, Jun 26, 2025 at 4:02 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
> >
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > Add a file that will serve as a single source of truth for UBWC
> > configuration data for various multimedia blocks.
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/Kconfig       |   8 ++
> >  drivers/soc/qcom/Makefile      |   1 +
> >  drivers/soc/qcom/ubwc_config.c | 251 +++++++++++++++++++++++++++++++++++++++++
> >  include/linux/soc/qcom/ubwc.h  |  65 +++++++++++
> >  4 files changed, 325 insertions(+)
> 
> > +static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
> > +       { .compatible = "qcom,apq8096", .data = &msm8998_data },
> > +       { .compatible = "qcom,msm8917", .data = &msm8937_data },
> > +       { .compatible = "qcom,msm8937", .data = &msm8937_data },
> 
> This compatible is not documented.

Oh, fun. We have several qcom,msm8937-foo compatibles, we have support
for display on MSM8937, but not the main platform compatible.

-- 
With best wishes
Dmitry
