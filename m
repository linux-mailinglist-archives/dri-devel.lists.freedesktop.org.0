Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1739CA73DE5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 19:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648DF10E92D;
	Thu, 27 Mar 2025 18:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8RO0Hro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F302D10E92D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 18:19:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REpio8025679
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 18:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7e+PqLCySKuQUVoMyZ6icZJ9
 lYK/eLks31o5gyEyhW0=; b=S8RO0HroQUXHNwpONBNXSLuOTYfhe90WKTi88lRF
 saGQqmjs4kMuXprRYg/4eBbE/F0n1MNaXIkvfLwtW2ddWT2BpCEpEl12ffBJQbKN
 XgGSHHn1nlx7Z9WhxaBIZEHdi/tcOOCa+KoypeR34UpCJQAUnDo3ywX3pDIyF9x1
 Eeub4XISee94KYhjB3UwwZepNjFIYHLU2WJSLSbv3taNVxQgpnGtxr9ydw69y3CC
 Y7huAaA55fvdqSaO4yD4pNCW96rvkYlWSxwxiuLE1CXHsTRCavbss2kQU65LBipf
 o6rdhYPq+aX+fVX0oM5mFp8upVeSyv6EEqM0yVOXPHD/FQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0nut2cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 18:19:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e90788e2a7so22548986d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 11:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743099564; x=1743704364;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7e+PqLCySKuQUVoMyZ6icZJ9lYK/eLks31o5gyEyhW0=;
 b=HodGHj0qungxVh0m5R0t7XEqGjQatb/TxRP59SsMBDSQFy7iAeGXDn5YIZgCkqyzP8
 rI6sdfjwd/zOsf4Vt6lc8jfZUqMV/PX19Kj7adMoh9y6LVanF1p+6o4EivjVqn4TIuiA
 XrqZOcwwCJBxOt9XA3k4U/XueSRq6cwOFPvs/2JwdlsOkzUJGOdtNeFSsBnzV75wDgRs
 6TYXhaOt7jeh6qMXl9d97L2zcETYKts3MrbYiZCyQ/8m0Iv9HzrpXihDgaRW8hcL2IXf
 vive5cyL2SLZItc2+wTur0Ng2jxGGdHngHyAjvKDZzW4fPqZtVP3Toxoy3dzofvmzprB
 ubbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcN1uwF4rW4hfbj0xac+nNiC27TG73JukWAPGyW3Gyo/oBRfkhMDOPHpDiQkAVXUt+1Bd78ptoh58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6uXJXv7iJxb88UyDPCJTraK6zwNMIKSttsjTR0Vx7Q68uBcVD
 DHHbldqflHLwt0De/y+kKBbZDZTOUuYh8XAyxU55cKGn1+8Yu5KYGJeOiNMpjFxgGxZH6cwqPdO
 wynhK1sgF9VeVIkZCCtpya7lNlRCNWAfqMYJB0PgPfgjHhG8AXBOt/isxnQRcdE9A+EQ=
X-Gm-Gg: ASbGncvMclGkK4FQnPTSfoBtTcIdICFzdcoK5iEe/E9t23MDoydKJLAyq47tWp9a8Ck
 Ac8UbGyP1rAvbrmCg3JJaJPTP2N9egTD/ejQH5P0J0wLC0aVNp3nOB0SbB16twyDvsf3L12AMLR
 r3LJwo93WEc/xOOsenaLl75boaw54CkxTaCnNBL9E/CIL5Hyn9YpbUIA233tGDv1LXyf1A2p0nZ
 UOCMPLzSPF68/Khx5+VKRORJXMgsKFvzxv9/V7/Dlcua/NFspQnIpDtlbyLU+j3YAD7iMJ2fjQ7
 /Ks2QxxdL4mGY+4LMBydzCkThwJ4NXgv1WJhzsF4FKbx/YsXcmPsznPrjT+StJ00RmPUcr3M5IN
 OZkg=
X-Received: by 2002:ad4:4ead:0:b0:6eb:1c42:a14b with SMTP id
 6a1803df08f44-6eec7a1bce5mr17610256d6.1.1743099563961; 
 Thu, 27 Mar 2025 11:19:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn6cXrQgzwmi3/4b/edFvgOGrYx3nHDkqzD1eE1vyYepJ46UWg5mVA0McAf9rHDkpvqtqotA==
X-Received: by 2002:ad4:4ead:0:b0:6eb:1c42:a14b with SMTP id
 6a1803df08f44-6eec7a1bce5mr17609856d6.1.1743099563490; 
 Thu, 27 Mar 2025 11:19:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2ad3cd2sm312861fa.53.2025.03.27.11.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 11:19:21 -0700 (PDT)
Date: Thu, 27 Mar 2025 20:19:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s-oled: add eDP panel
Message-ID: <hcmuxutvxz7q7ad7tuzvrputo7btmnssuqyyqlb3ydrlu5dyy3@oe23sa6wsefy>
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
 <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-2-45d5f2747398@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-2-45d5f2747398@linaro.org>
X-Proofpoint-GUID: 7qa3MxIJbpaI0cJ7hJX_QZ0bm-IuAcjO
X-Authority-Analysis: v=2.4 cv=AcaxH2XG c=1 sm=1 tr=0 ts=67e596ad cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=iSdEqu8mIraFA3EoBIsA:9
 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7qa3MxIJbpaI0cJ7hJX_QZ0bm-IuAcjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_03,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=846
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270125
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

On Thu, Mar 27, 2025 at 04:56:54PM +0000, Christopher Obbard wrote:
> Add the Samsung ATNA40YK20 eDP panel to the device tree for the
> Snapdragon T14s OLED model.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
