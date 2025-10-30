Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8194EC1E22F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 03:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71F910E815;
	Thu, 30 Oct 2025 02:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqLa576G";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRsMrKea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AF910E230
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:33:27 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U0iKRL1994518
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ntHK9vxhminoglXJfxZX7o01
 Uc8LpengHLNaWyUigT0=; b=KqLa576GQs2Sl92ylUs7z3iLC7DxRQ83BJQ3wO5T
 CMRGAlL/E5pXBXJdFvDZ61vloRvIKLWoOomhGALMgT4ibA/PZP43eStYj9YqYmct
 cqpesaP4pBoc574NM8I/JNjaSbFm/DTRTWJjCpcM9ZkGVyEN2+H5EpV6CAuVJSHT
 kfDI+XI7Fh5iqsP8AVgRuZKoCJr84QjeI1YPWqTPCeHvjcDCCtkmoYE8H4zWFsKS
 U4vIEB3hqq6TUgP3pyXnigJ8NyJPfV+wvMO42Jj3gkAgAG3i/pkj8EPue2KKwKxv
 aK5e6s2znwbo0VsbvyarSvbk7BYiRK9H4KDCtpFr7Xrc0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr707r9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:33:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e8b33c1d8eso11680951cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761791606; x=1762396406;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ntHK9vxhminoglXJfxZX7o01Uc8LpengHLNaWyUigT0=;
 b=IRsMrKeaM64fcehsbLTavCQR27qAfAlNigAmJAYofdA0qEFsVJwAJ6q/ldbhhLoZZA
 s4rrSiDoeupjT6Zcl2cZukZOLpVq20XsaN/exl1yY8ZpN+b3m7AHXcMZLBgGXQ46Ffwu
 0SF4pV8coORzivkSDG3bIZjmvZnJG4kAU781d3th1JI2c/9hBKebN/3RL9dvd7HEh8Qr
 IasjVgqpFWRRbIKVNzpS3le0G/qv9pdPevhxqM60Ov80ST+D2ziifUNH1YuevSB9UNJf
 Kz/QXE61msCoDJLGjgyTTk6hR825Ej9EGpgIyJT6tBQ9jJyFUfe5dQZ1t9GtCue01Hot
 3wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761791606; x=1762396406;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ntHK9vxhminoglXJfxZX7o01Uc8LpengHLNaWyUigT0=;
 b=vvx2rUZwqsV2bKH0Ns+2MSbY3U9zX1DKxvxhTT5+kWkuTp+RIQFOB99oUf8gzylND3
 nm4z5nOQyHvN/ANd2G8xLgiW2nrgcYALfYoSFpIQRQrlH5Chl5ydtRN2AO7dfVN3KVhm
 7QSKsTpP3kWw3PynmQpnznGhf6J9Jxm6A0UH5ENnQkpbxEEmXns7FPYSsJFZgwWfDyMA
 ARZ47OufAtljSv1GU2ayAAZJF48RCrOz3FfSlHznTQPe1NqI/75E9rBMh42Rwgakg4Mc
 j9gMYCEAJj7Lbzq1E3TbdrE7zmVlmbmXTlbgMQwnZZgqc+NnUJmXA8+0d9Mpiap2DwpO
 XKew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTNx5oSXTZe+WC7CClw+qycgalhYYlb2PkDVRbjekOb9pH1qa7sXg6Syp9+Em8/Tetr/z3oD9VPS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeV2GqmOO53a37v2Fw6U20FZWzV56zGbk9XRQ3Ao5TXWU7AqAW
 QHEz2rKWaX6Hy9hS2GpBmGLH00xK7RZTQ6Gfql+b2Rf/aknbP8uQ16AlJKwvBLHMz5E5kx9ZVbq
 DVpnQDVPNHKMMCGreWHdLgMvLTUJDbIqY9Rmbe84yb7mzKjBhrM1okZfpgVcHwWoWpElKLqQ=
X-Gm-Gg: ASbGncuL9uRtB+Q8TWAatqr+a8obDFW1SoCq7MH/oQEAP+8IM98uzp8oMouXKy+HiD+
 mFzHH86Dicr7wZwjHFKArndbC6/wU8sKWP2fOgISGQIm10jaeVK5bku4bv054yuVWWMXOh/EJcu
 hi2DrG2UwHYFWxh2Dromg25pUNOLkZgAtN2hM7P5y1lEJ9HxGyXbGEKGdjBDM0ExyH7nuodPnhr
 BIt3KfcB5dHKyTVYIJZIj2S7fn9sjre48T4iuzQXJvYlKCg8WXeDNuwoVF1nWE5l4iIvpipuSpx
 GztYDnHstJQtXBXV+x0ufL+Muu1naVTDnDtblniqWLcTC0tNlyrH8uuieLzUOz55b3YJHfJrVri
 CPTj8f5mjEg2SJUEhacySIbkFvFrlAnwtInpHFPQqEatNB554PaynOAFJ7H94
X-Received: by 2002:ac8:5acc:0:b0:4ec:f9a1:17bc with SMTP id
 d75a77b69052e-4ed15bb1f61mr53768221cf.5.1761791605770; 
 Wed, 29 Oct 2025 19:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH62Xw8UczlTHR5mIibSKtnyEtT1gApL84hMtZ++sQ4IY5il5n+hfMOijT0cJsyTI5gYuh+Ew==
X-Received: by 2002:ac8:5acc:0:b0:4ec:f9a1:17bc with SMTP id
 d75a77b69052e-4ed15bb1f61mr53767891cf.5.1761791605240; 
 Wed, 29 Oct 2025 19:33:25 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4eba37b51c6sm103962621cf.5.2025.10.29.19.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 19:33:24 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:33:12 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAxOSBTYWx0ZWRfX5qBF6CcqiRCy
 xsPs+dHdf4rDINVPdKdTBXpv8bcPWkvFQxXM/Dzj2k/rsJCJMHDoyrymghW0yWl/5z7um8z4sDW
 dmTfx61ZhH9IXlbpwDLct/Ra9oGo8xscfCR2IX7k86OB+ULoKlF7IZvvTWg03HAtnqmwPJWIYq8
 JWYCROcs5NF3pk5Eh1ofLYUWejj/MpKUCl3VKXovvZA+dcQ4SNJ9SSeIFOcqzvONcphQ7cJZA4C
 jvD1cgS3c527ZfThEKn/d8pLWCCpHKSA5Pqq1VdDXxULJLepYYCmlxCz24oPESMZ0x3kDvQSxZn
 CgHAx8wLIIkoNF8P4J4n9ljWYh7U0O4xD9DhPsymFVf84nV9wSAHI24z4YXi8nS3C6bMl1DLk+n
 KE+/XYJjPm5lJ6xHVBLa3t9TAJf5Cw==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=6902ce76 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n00Os9SHjSpe-nC2C8wA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: srHeP_GMj8RXHkBCAWqnVVDyOpm6V6dm
X-Proofpoint-GUID: srHeP_GMj8RXHkBCAWqnVVDyOpm6V6dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300019
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

On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> On 29/10/2025 03:37, yuanjiey wrote:
> > On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> >> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> >>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>
> >>> Build the NT37801 DSI panel driver as module.
> >>>
> >>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>
> >> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> >> provided certificate of origin, then you provide certificate of origin
> >> and send it to list?
> >>
> >> Please correct.
> > 
> > All the display patches were jointly developed by Yongxing and me.
> > So every patch 
> 
> 
> So two people were working on this absolutely trivial defconfig change?
> I have troubles believing this.
I want to say these patches I am first author and yongxing give me support, so
I think yongxing is second author.

I want to express my gratitude for Yongxing's support in every patch, so I included
both our names in the sign-off for each one.

However, if my intention causes any trouble for maintainer, I can remove Yongxing's
sign-off from this patch.
 
Thanks,
Yuanjie

> Best regards,
> Krzysztof
