Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19BA795A0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 21:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9CC10E8C0;
	Wed,  2 Apr 2025 19:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI1od+kH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE8610E8C0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 19:07:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532AgWO7023760
 for <dri-devel@lists.freedesktop.org>; Wed, 2 Apr 2025 19:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LA1WOhQTX5ByQ9v6PfWc2mZW
 1spbBXtueAXo3bqSDbQ=; b=XI1od+kHQtwJiuPa/LY0dHthPp4qR/eoGoTaqKw4
 WV7e5ihx3zU1tau9huE/G5OE2N4tNJEMZ77lAAibREy4/Qmyw6k2H64sOJH1Ri7Z
 47OWt85AvO6qQMOlR6ytfYOE4ZElqCmoPNf2gnLUKBevX22uUulrvrvzC/6SuApw
 fQIiqwJJOpRlahR42Km1d9n9PbvzHAPlxwtv5+mQxGthcGyBKUDdL3oquRkyiw8z
 hf20O2xstFk+v8RH5P/bCuu+9OmShYaZLDwiTKe1ISFxhe78vrigS0inB3s2Fw3A
 msAyJi/TsrE98XWr8EhUAeamWYHDhU5K3ey+hSsEkuwnAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadtt2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 19:07:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c549ea7166so14925085a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 12:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743620869; x=1744225669;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LA1WOhQTX5ByQ9v6PfWc2mZW1spbBXtueAXo3bqSDbQ=;
 b=lNP3XVV3zeiF1iatPLnmWR3/v1tZ8POPNJ3t8iwFIDwCwdAtK1e9E/ib0rF1qKTTEO
 hin8POoeGm1UwW7FWiHSVD1e84fCV9kBhw4Y2UBFwPDazQcfpYU01AXd28TDG7OmPfcF
 g+3Gv40WTyjsiEB0Il6IUXKV3iSOCNGEyAe3dGZd5g4g+ZXCDrlSh6arJMKZpLqdfA7E
 V/KhPXO+Dds5CzJKD+YHaqw11a5vhYaz+41ZMV25+Jv6tIo5OTBlX8yPEBiGMPMTIYNz
 3Ch3vb4i0/7HwhSuNW6ul2TyLF0t/q1wKhT/spjY7suqyaJsIym3XmnYOKjwfKMPXIY7
 431g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdCYnX6706WBJmgzaebVdgZg+yw5NvWJAaygcDWSraUuBYpS22tjR9uiv/jW9aoNYhOwIcQnE/PgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yynurmdyfk+hnXcDwO4/jiDNX2Vxkx7Wch/b7kJXYNPpYQEKpj5
 BP4SiX3zDqJOJgeldl8HfUu/hNa6F1FFEUopJauqD5Hhh1tXfbw7TMmWJ5nRmC+uwj18lm/NemD
 +rXrbCqeRmSHW8jX+ngD0deprSP7Yj8L6w12VXBo1jbfRXf1kCZLhr4Yx5AhfkXyiEOg=
X-Gm-Gg: ASbGncuOZ8PbjHbSjBCT1NM48TaEFItuH1SQzzY/u2NTZmTDMC7HDuLrn7bTSsucz9b
 yO6wqSgxLNmI6f7Wr7DkcLwNJcUf57yeLAySRNCsorLr4Nz0W4kybZGHTgpWOFst5HRAA5iYRip
 ei+/AMyK69i0fR16z86HMtJoTDwUjcAaA42KueB+T+930FAiXcjVV8zGtIXurWzXO7NjaPkLSyc
 +tJ1n75KbRtBOqhrkWbh9T8LRyMTUwk9nw8EePwJqhPg/5UGUfYuNzs4pkAsXRIal1yFworZxID
 vgdCq0pmL/2JxylC4Nm6oOY+ZyyHHuoLH7Fe6oez2eu59oOuSzXNOeG7RQnNBIuhoboo2Q8HxrT
 DKNo=
X-Received: by 2002:a05:620a:1a0e:b0:7c5:94e0:cafb with SMTP id
 af79cd13be357-7c75bc8e3afmr1349612485a.48.1743620869325; 
 Wed, 02 Apr 2025 12:07:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErZZ608u4zqFw2htoAry3TzhWNQ1iLzSerIc8/NM1Iiada2nzhQbeC8aAg15XvOdwOqWacIQ==
X-Received: by 2002:a05:620a:1a0e:b0:7c5:94e0:cafb with SMTP id
 af79cd13be357-7c75bc8e3afmr1349608585a.48.1743620868984; 
 Wed, 02 Apr 2025 12:07:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dda97350fsm18626371fa.107.2025.04.02.12.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 12:07:48 -0700 (PDT)
Date: Wed, 2 Apr 2025 22:07:46 +0300
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
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
Message-ID: <6fxnxcrtihxcpmn3fy2bb3tz5xoeqhxdftvurarlwvto5vyofx@ff2sfftyz5cv>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-2-ff33f4d0020f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-2-ff33f4d0020f@linaro.org>
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67ed8b06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mxXJVTWgdfz31GLmhacA:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ky_tJPtFQj3ynQsN5Ewo8KCGH7XvDZFM
X-Proofpoint-GUID: Ky_tJPtFQj3ynQsN5Ewo8KCGH7XvDZFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=660 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020122
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

On Wed, Apr 02, 2025 at 03:36:33PM +0100, Christopher Obbard wrote:
> The eDP controller has an HPD GPIO. Describe it in the device tree
> for the generic T14s model, as the HPD GPIO is used in both the
> OLED and LCD models which inherit this device tree.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
