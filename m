Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4BDBE5527
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8FE10E112;
	Thu, 16 Oct 2025 20:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRoQMH21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BED10E112
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:08:53 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GE7vmp024947
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XW25WTUPjM0HYbFzO4qQOv0a
 rYQaTxvpGuWa+PN/BYQ=; b=GRoQMH214l9ZktR6yEwxRJNDcIkLrBGBary+WEiB
 gk568wNkQnbNtkD+GEL1hRkPTWZ/2dm4uFYIutRag5FBldkDVnAWfyXdr2+zYpbr
 qx1FYrJ4jOq3ppXR/hcqkq+JfOaBuHUAjRUToTk4TAHCykw8Euz4m9BqNQLBh/tG
 /g5mHJuHsoxuQNOvChjTXEy+l54mJM6APFKcXFcIFrSTuiTrba9o4mvG+mIGXyuR
 LU0RrLb5OVeep+Z9OjfIyzsNzYaiNpJxTeb7ZsQFfDHKXvliCzJjZw5In9jH7VFU
 hQTKA2+A3pLHJkUm1BXyp/86N9+KDx5TaelhK3jit4MsSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff11mky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:08:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-871614ad3efso390288085a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 13:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760645332; x=1761250132;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XW25WTUPjM0HYbFzO4qQOv0arYQaTxvpGuWa+PN/BYQ=;
 b=ChcSfKe1L/AEegaj04EtnvIMf4qehkT8O9HLKZskN4ya5zRWqs3l6DxpEtBxhBAb7Z
 wEjcigdYP+Ihi2Mx+bjsXHjLfqoHv2GE36wXX7r0DjvaXOPCLMbEq9MV0b/K/mNMyqTr
 UVUToARlpKPdxzkDVk3ZJMFpisvnbv3GUmoGiJcUF7qa5DMI/wyUm8gD9P0vy12H9qui
 V6yVv8BzgEPnE7bsvueXrgT6vUvlp43xE410M5gQ5uGFyKI+xeTxc7H1v+AapKapNMK4
 gSMN939ueNmP7e/NEdzM7POOvN+PGiJIQ2MyW3sO4ZP3vw2F+8t0yqLSyyeCs6CGflPy
 7VAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGJTG1bJUrhStyj+bkjj930VjEzsKh0Hl1gV6kY5b++dnoShrJ3O8HL/Cqp6xGQQc88SGpw0EWbFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJp032G2sDA+8CBt62Y4XcaB+Hupm/hCPc5dAMbehMhgMOYg/J
 KckixiRsxjT/6vyRR4G6oYelDVBoTs4EBferIPC07khmQS5HMVSQE5KVFLGdOPVzoMA6T7eVFUp
 WLk4vTq4WNU2IfJK7zu8Dt9A3VOeIH5B9bJH0hF26FmoKTV0YsBSomp59kiloZNg502pLH3M=
X-Gm-Gg: ASbGncty6baLNXxtZlvni67v72yNKO8NgH3CtDox2pOZ4p6YIAdR6acxAi2fWjLYylG
 1/EUPhFVqgH0FhMSc+5QQVyxlsuEpibTu4K3ifxeNe6vWEjgfIq5LXPwJ/3qGH1pqrI74mOlJBK
 yLCT4677T72dnz+xeWEXVx6GJPxHStToUkBlRFVSd14BqzS1B2irC/+2Gdv2LbU2pqlHzzBoqU8
 7U1F2MFH6KTrOkyU4WbRsOcAJ4WV8EStDh1YixPCj4qRvlwFL/rogpuvFE7J9MqdSCEDbUf4YfK
 fV9Msb3omIcCt8AeUHe62UArEZ7/Nwp24KweXuF1CHD84hCLRqreGbfNOeMoilO1ZsgSBNs0h/8
 8UNK0xLzSRv5LRKjdz4LxCgaD7bKe0LJJIw2HKZlAYtNksIev1+AwFZb3wUcIrcp+saiHAk69lG
 vj0CVhqtkGAdI=
X-Received: by 2002:ac8:5fc9:0:b0:4b4:8ee1:7d98 with SMTP id
 d75a77b69052e-4e89d21c3d6mr24692961cf.8.1760645331610; 
 Thu, 16 Oct 2025 13:08:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELwSY0pYfGnC1kz4S53qSyk4kBH14qSenJ7X/Cza61k+EVAgrYsjLisx7xZsfpWVeiZg6fEg==
X-Received: by 2002:ac8:5fc9:0:b0:4b4:8ee1:7d98 with SMTP id
 d75a77b69052e-4e89d21c3d6mr24692431cf.8.1760645331106; 
 Thu, 16 Oct 2025 13:08:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881fe5besm7293872e87.50.2025.10.16.13.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 13:08:50 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:08:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: sdm845-oneplus: Describe panel
 vci and poc supplies
Message-ID: <62iuzoisxavlgadhz3gfrlwxqu6vl4gtlyrarjkmwihepjr4hf@nuzpsaj6jcg3>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-2-ce0f3566b903@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-2-ce0f3566b903@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3KJom3UfWT53
 17xOUB2VNB4cSVrkl5SOe/ZkwzcswhAexy8Mcopc/aRRU6LEHeVswoNE9728u+FLjaRA5iZifEU
 GhjJqzzYHpyqW8Ey/z9nsvsxjnKoNtYhXOva55rzoltKofIRq/8iaaDw+o5hEWCVUlXPdT307Nf
 6DSvNWyvYdiehiq/vsA/NSJ0TZNtdLJGZyuMPPvcIzC9wNx30Y+H2xVXzaMDB8JeRDXIkZyJuu3
 d5nria69FkT7B5KJic2m+cgJ04zcHQKP4bAokU8ZP+VTaFD/hHZ21I0/irc7XUujWq034SpJYdw
 4fHJwxSjdx8rzeF51lHcwAWxIvcbiI8dMDdKV3DxA==
X-Proofpoint-GUID: RTUh6NFSX4DeENNtXTGCOSxY7s560q0S
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f150d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=CJSKMeR5ttdQttduZpoA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RTUh6NFSX4DeENNtXTGCOSxY7s560q0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Thu, Oct 16, 2025 at 06:16:57PM +0200, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> There are two additional supplies used by the panel, both are GPIO
> controlled and are left enabled by the bootloader for continuous splash.
> 
> Previously these were (incorrectly) modelled as pinctrl. Describe them
> properly so that the panel can control them.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
