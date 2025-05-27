Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B9AAC59FC
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 20:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C07B10E15F;
	Tue, 27 May 2025 18:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDO+A9d8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EB310E15F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 18:18:16 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAl3El015467
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 18:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TJK/No0r5bmIrq7qKNYSje+ho/5oIJXFTmaB6JBNteM=; b=oDO+A9d8kppoieny
 ZhcsGWMELZvAJW90tQ1UmkksiU65hFPRSg4HWllxPz4rTTi5OdO89rKMzy6cq4Mp
 CMevBZ23UqM59R86BC25+r2+K6452YHByy0u6lBEaWNlY3y2qK3/D4RywTY+qzfz
 xBBVS6EWCPQHIGw11lHDHDRR2Y/NPBkFjUDuCx82kDKqR/cX3QtpvpIirImn58V8
 O8gFoEUesFa0g6WuYgPcJKMfxnR/nZtXiLUTb7trtDQFxSiO45TTxwfruIOxSva2
 HyKW8VA/Xr4Ua5YXqtnQGES2eJ3A1nCIrIRBltbGLaPnkdWHylYfNFV70wJKeVpy
 Hi/rbw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcv8r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 18:18:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6faac45f582so31855586d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 11:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748369893; x=1748974693;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TJK/No0r5bmIrq7qKNYSje+ho/5oIJXFTmaB6JBNteM=;
 b=dlV0g1jYuftAe2JfSyXk531WVyKbA+oKx67YAmFvpJsXw+ICOoj1Qv1PVcGNwSV0n8
 eTH88jBbZzxwhJAMTHqk2X9pmVqwe1ncmStDTOcNZCLoS2khUYB5PiJ+NufuBmQSrcs1
 X3aSz0oHMpfj1jCYOQBeuP3zlIHVghrChc1Emgk8UWOOuGvrDo19QuZkGaWKZgz5nMmv
 AhFpJYiMFgAh7S5RPdYVOt7E7ZApdipfBUEEQHdnWKOEwT5JkrXCdQmy6c1mIgF4CP7v
 TvxORV8/NPsxwzQwCE+AMR5cTd/yiNczgAXJnkB2+VAadQ4unQLvP+aWkEubXwdR8n7E
 KIYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjyNr+9LfqP74GB/tY6LqdtPVFqgobOAfffxQGT+NhpHnh3HO2DL8l7kAhAknrJ1Zsv0VdoiqJ8Z0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbY1Q8IQtPQJdT59JCTVJ/PX8o/JxoUe34VwX40WDOwwRgzkzk
 Riy7uTR2H2A26jaWHQjlNlVMxkSxIF3B80ptIOJVxzuWeruK18iuqJGnjCRB/IT7ojNWC1bNjhM
 b8ehppfdQnmafgJuYttLOxLDyDhiEXcFkZz30aDfDK5Zv5dbhcL2KX8mQgwHFctfpwMp5Wxw=
X-Gm-Gg: ASbGnctNFSNgOPXuzmEc/LoaJ8S/1jcLVbixDbKygVdpzs4ss0GMgn6a/OnvcVH4v4u
 PMNIwIb16K6L3yyNi8lL6eOyMyiu49zMwAx4UbeaYg/ss1S6OrpT5xUCmmuIBP4L1fUuK7uCfKo
 vqZfQaQSn8swBCYdNwLd96hKIgmJDzCiNQaCYVQr8NO4IyWaFjdAggMwKudYahrciaRdpbZCwyr
 ui9ZD5m4tdMjkJP4IgcmHJaW/sCKxua13hrOVa0UMqFFkDDLW9u6X9gtW9/rzt/s45aLstTZ547
 OA9JwZoFQ46EK+I9gHuafHlBlhK7iGam3HHEnaKWim8jOPmPafVNmTIN8g3TrU5xOD+y3Ntp3tY
 =
X-Received: by 2002:a05:6214:2482:b0:6f4:c15a:6215 with SMTP id
 6a1803df08f44-6fa9d296321mr220834946d6.39.1748369893356; 
 Tue, 27 May 2025 11:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAS6tHMfJZsNl49VnqIOuplxsXW0akPiMhw3zGTdfBngOLfU+1DjVOHBRktmQQvvZoL0P2nA==
X-Received: by 2002:a05:6214:2482:b0:6f4:c15a:6215 with SMTP id
 6a1803df08f44-6fa9d296321mr220834346d6.39.1748369892842; 
 Tue, 27 May 2025 11:18:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532c01542esm239678e87.255.2025.05.27.11.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 11:18:11 -0700 (PDT)
Date: Tue, 27 May 2025 21:18:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 jens.glathe@oldschoolsolutions.biz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
Message-ID: <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dQJNPPmgt4qqTytszerdu3QANmAjfajF
X-Proofpoint-GUID: dQJNPPmgt4qqTytszerdu3QANmAjfajF
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=683601e6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=J3uWmJ2zRmaukYy432YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE1MiBTYWx0ZWRfX0m7MyQb/QlVu
 TtPV3f7R+HB7+pkUfq94X3wzaaGoSDWQ1u8KiEnrvEGLJUd5X+3DSCjozPK31Cf83WJBymaYD90
 3fjHzRqCKO3Ti45xsTy6zKtA6tV2ZBGD7opBNjpdZeTXcjJgu6SNmgBrDrQVEHCCZ7uW9j5/lgo
 5M+0tASg8npKvR45rpdzTWQnaBqBqTluSDh2+vV5gMMtYebbrURyV5dar9Vp8KFXSc+9k8JhPlW
 so+pHW+RT6aIc62n7pMd5ZHMjGfgna+qYpe2gOM2rPvLwi6o7suwUFvddg7dMcHEGHF8TV64a5d
 x+YPspF9U1bGl3KUYm/mAtf4EsiXPriD1fRm9nbgF1gqMOHO51E32Gfb3/+aW4FGGvlwjROe1XI
 k1qAP0AV/m6yMopvweWEfsO3ycbN9RFeHIVGJGdBljc4odn9AlsMJZry96EIbNIU/abU1IRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=885 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270152
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

On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
> On 5/26/25 5:28 PM, Rob Clark wrote:
> > On Mon, May 26, 2025 at 1:36 AM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
> >>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
> >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>
> 
> [...]
> 
> >> Yes, please. Don't set okay status for the GPU until it gets enabled.
> > 
> > Drive-by: Shouldn't the dtb describe the hw and not the state of the
> > linux kernel's support for the hw?  Ie. if bad things happen if we
> > describe hw which is missing driver support, shouldn't we fix that in
> > the driver.
> > 
> > (In the case of the GPU there is the slight wrinkle that we don't have
> > a gpu-id yet so there is no compatible in the dtb yet.)
> 
> My two cents are that it's okay to enable it, at least in this case..

That would most likely make display unavailable as DPU driver uses GPU
as one of the components.

-- 
With best wishes
Dmitry
