Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440F9A76F13
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 22:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289C710E494;
	Mon, 31 Mar 2025 20:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBJvjflR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A8410E494
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 20:23:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCtOB026701
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 20:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/XDH4np/11kTXmxJhc43+oag
 MOQJnczYYqLJy3cdvic=; b=KBJvjflRmuDdRLdfTA89gJtezMY912+9wModq5w/
 +b0yGderQ9faUPoMJV2sKTHYL4gSGLcqrYRh6xrv3PLUwKaIul+sImZLawy4kuBX
 VaFpGrf3iF7lyRsdu5sGrPPMhf+OIZrfB5oGD8AgUgHcCh9q+ZToHxWLUylbxWF6
 s162OJMAzC0ZaFGCLXGX0zVzdWC3l0XWsIUcPlcAl+jnknWcX8DUXjTSndZOH0/U
 V1jfeblkBKAnySt94ZD0n91novqsa60pAFsVMZz8VSuIcUbNcRQnAKpkHZZyOGeS
 875ke73XIJcta+bOQUZjfHerJjFpmmMtADNhhkTIpmawzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v8dn8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 20:23:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so453757385a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 13:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743452586; x=1744057386;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/XDH4np/11kTXmxJhc43+oagMOQJnczYYqLJy3cdvic=;
 b=FkiKLuHticrp0EG+iDZswXPTrjA4VkbJfayHMpAyZ1buvB6A2qHEZZ6oGn8twXkntu
 AIxXtsCI5wPu+CZAQJlDiOMm5BraYp1/8AiaSbrcav3/yRcHgrDcUGXrs7VG7m0f3Lrm
 5jqO7Utfo2VzahSAuksELcqxJR2pk/pEVgR5nRLhWjVMlKcF7BKd00h/VoQdXUdchxIk
 xORGvpfp53d7T8A4iky+oGUcpMc3mVvTa+ABs2gV5qAnHpB8piNS4dSjeePJfl3L4X0i
 wJGZaSPdM43Z0LIh0oAesHXGqoGuaT87LywHXF9X+iWKtiEC+pKKodb/HP1K1j8I0zQM
 FP5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVanH8oy0Ybm8KAtNOzVkuNlpyXT4EqP1VrbXMIpmXrpjxysApGJYouCXX/AmTK7AS+Hhz0FyTV8VY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMtEZwByW7oVS8TlY9cOsrVmBzsrDBOb14lAm0mXXpOaJl7JHH
 Pht+Fo8OleDVpaRb3ipU0nVlYmibdRI+tHFhPEz3wD556dXzIpjmfmNvjHQgmb1Hru/rzJynxWS
 7K9o54Fmal3r8HaN9kH4/WT4ceuRP2wHEhMOtx6F4MS6TE0FlHWeFAG4xWxAbVcr2yP4=
X-Gm-Gg: ASbGncvmh08N3k/nsBHH+Nxs6/X7STNlxhY8H+94scu0Y+DDWLTZx9swWhgshfWkM3Y
 y45IQNBYJ22aZKFd8MWDkD5IWoDhiRSZKSHNkbekteizyj3lZYzaoR6FbOmHcElHDspFvOBOqq9
 GyJEpYGskjWgh1s50z77nRBp/Wzu9RvQLa8/7prYG+84OvGqrPDvH4fAPJpYP7DgRO6GaPOEc/3
 gHjsbuavMvhK0Vli2KY+V1Xzq2ENHy7mRB88ADjgmy9i2eJIMvuk7zA/1IFJbxxOnQAyHGGUR8e
 yRzr06GL74UBjA5G1nW9WDDWdvfDLsjzdAlGD25dX1HtoHsXp4nLH0/meFp66yyOX5yD8uiRMqs
 8UCE=
X-Received: by 2002:a05:620a:2a03:b0:7c5:6375:144c with SMTP id
 af79cd13be357-7c69071e2cbmr1183407085a.23.1743452586465; 
 Mon, 31 Mar 2025 13:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYPejo3kER5dNDXDvNgrSMesprgR2DDS2npUVvqdvd1MymJqIcUXKNSnahqXjg6Ltaa4Rclg==
X-Received: by 2002:a05:620a:2a03:b0:7c5:6375:144c with SMTP id
 af79cd13be357-7c69071e2cbmr1183404185a.23.1743452586084; 
 Mon, 31 Mar 2025 13:23:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b094c1ab6sm1203757e87.97.2025.03.31.13.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 13:23:03 -0700 (PDT)
Date: Mon, 31 Mar 2025 23:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: pm8941: Add NULL check in wled_configure()
Message-ID: <rub2lfc27qef33iziydwd4qoaxia3ycs4iq7o7hujfaccznma7@hyavk23v7rbh>
References: <20250331141654.12624-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331141654.12624-1-bsdhenrymartin@gmail.com>
X-Proofpoint-ORIG-GUID: LQVmWJw7zWrjNCEkiSb118ZAdVRO5zSr
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67eaf9ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cQ1TuvgcctVPKzGXpFYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LQVmWJw7zWrjNCEkiSb118ZAdVRO5zSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310140
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

On Mon, Mar 31, 2025 at 10:16:54PM +0800, Henry Martin wrote:
> devm_kasprintf() return NULL if memory allocation fails. Currently,
> wled_configure() does not check for this case, leading to a possible NULL
> pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
> characters.
> 
>  drivers/video/backlight/qcom-wled.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
