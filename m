Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D77CAC2EEB
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 12:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E50610E002;
	Sat, 24 May 2025 10:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnSmAJoN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257E510E002
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:35:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O9nit7000895
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=s910d4t3uAcCDBtNH1k1u5wo
 FuAjdXlwK36avK/w0QE=; b=SnSmAJoNNsjvO6NakI9HPPKSqEqdridWQV5jIiC2
 ORl5w7Q1iF8vf4CXqpri7jEMa2iXqduQxmH0c4hRVci49LPmSPhWsDQO+qME/EBj
 IoXOuyQiPOZovAGKmeobFqbmHySlpsYdqjiWheCOyMA3wCIc9gbi60rDOeJzH1Xx
 EmtoSbUOJx9gGIErhfnn6AfgnhAXUPVbbzMHjkFNjLAm1Q80BEN8QTay3kHgcV4v
 awXnnKhDVlrtkuOKkRYNJ9Ek50eaJgX7DSqbZTwScIduGHDDqYheiL4n7C9sju4Y
 IULBTLKS2ldAmkYzGnD5+nUhaWhmWOyZBXNp5upfhnGYYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5ggnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:35:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so110361685a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 03:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748082933; x=1748687733;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s910d4t3uAcCDBtNH1k1u5woFuAjdXlwK36avK/w0QE=;
 b=WoOoi4gMs2/x2sqwIFWiVxergkVDPNrxKiT5S2ykHPmOOYMmgrokhPwCO0GCOxev5a
 yp+tp29ravgV/V8JuNhfOA7HumZFc1hZQrHIUZ/LwSdDzbRDuHyA9FyUgBdGWpsyOm8P
 2ZYgE72Lqz454mzXkVcPSgL2dpw4mUfST9SssqHccfws481GYxFW3xSUBYfy8iCwSuEj
 cGmXD7S6EDyNjnrfPTQqgs6q5jGNG7/pyBjvejev4lZSc7/BHh/m8a5joqlgUX7QUw11
 QUvhoOIOxRVV9DZ56Tbs5Qs8DaZFwLQkwx5NcThMkREY3VQCTkjWa+d2YmEwBsINTnv8
 Mt5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPvvyeIu4ZOh8MplQGHlEej2pJtCW6lBPeF8l2HmQk8aJ0JZ37+PMCN/3EnHYutnpqbXgvbtv4OtI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypYrIqjvdWM8SXfk7fYWrFNHByEinhLqNDxWfoD+7Q46TKZQLY
 QIkbFSVu0KV3sCG1Z6YMw3baPQafUEiyJVQxbkDbUds31CHK79YLzyiiFWbqRvPixXM72jKwIYm
 ZSdD7yamXUDAH5JkSkIe5iMaB9ED7SxMA8Ugkf9LlvUSRvZbvxg4cfOckbSvIMxa9DLLx5dM=
X-Gm-Gg: ASbGnctFzKwZhai54J/ykTeHWNzaQ0Fnq14IxbHS0ROsw75Xt1D2yoF6QU0Ea1VA5Gr
 ECCZUS1eYSWb2FdRy3L8fePOXjYPWNLM86HgZXCUdn3RIXgmYowmsA+Baz5ChKeKOamZRizmlkw
 eQNUTBkE7IA1LOLlI/+GEJh/Y8Ni35mENLKiw+2KBJtWisPjHoKyrHB1273TyFY1obdAXRLh+kC
 bRHBlTxh/p599tUUlha9JepjDx85y5bS86myPHuPliGJ7Mg0XZqlKc5Z3VGB28TzwMpOGsldheu
 g9R1nrmm5wqX6E8b31AhQLB6kA057N9BG1IhKz7YV0Cu4TTDafGtqEDGNpI16RtBxaDpStSLew4
 =
X-Received: by 2002:a05:620a:a488:b0:7ce:ed86:3c53 with SMTP id
 af79cd13be357-7ceed863eaemr218619785a.29.1748082933585; 
 Sat, 24 May 2025 03:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF54RXqasfEVT4XH9aPqai1f84axB6EddNRJRvq+B+ZJJBfE+JCiW7NP+emGbbWXvQuq8YXA==
X-Received: by 2002:a05:620a:a488:b0:7ce:ed86:3c53 with SMTP id
 af79cd13be357-7ceed863eaemr218617985a.29.1748082933254; 
 Sat, 24 May 2025 03:35:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f2fbf4sm4280072e87.70.2025.05.24.03.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 03:35:31 -0700 (PDT)
Date: Sat, 24 May 2025 13:35:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
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
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/6] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Message-ID: <5dkielul5ere6rgzog3kch2gtccejrrom5obujnfm7uop3czcz@kyppckmrlqny>
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-4-17e26d935e73@oldschoolsolutions.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v3-4-17e26d935e73@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6831a0f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=GTs9I9JaY0s41QFpxpIA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA5NiBTYWx0ZWRfX5lm9USgp9TP6
 Upq8aHmbcxqqOHX+sz+/P1djmah/F/AJVt71x1ltiafsJdEjOzsRw726tosvU5xr2Fn9o28Eqy6
 nFMwEQUFqzHUMFPDaLn8Jk7mb+7pNGsW7lGm9ASmui3urof0tg+d6VIdjloyQqFazCdHiziiVZK
 q5eRhYnJ6afFoqDVh83rElGTrNKBOIZEOF71njM8I62Wq0YQAlEiQr6sa1L4a/dSuIbLvukXxHz
 cLiJp3+PJUGxljdLDWCfxluAurJUprTvTcGHleFWqUjAXYTBkwUU3VDWB08VcgRi7Frze50cX9a
 7ke7XNWuSwqJmdt+EPWvD63o3Ek33E5LHnZLn5jJNK+6MVvL6xOyioA+2poKzX7xxYH7KozA5e3
 UD6gs8C5gOOQsAQFFBEh64PousWRJ4Kpr9aoAEVRYF9IHpMCFx0LE9Rv5jewph9swOqCd8oR
X-Proofpoint-GUID: ZCk8NFuDGd_SfKkfUszP8Tks78PmoINa
X-Proofpoint-ORIG-GUID: ZCk8NFuDGd_SfKkfUszP8Tks78PmoINa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=919 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240096
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

On Sat, May 24, 2025 at 11:19:11AM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Allow particular machine accessing eg. efivars.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
