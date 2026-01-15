Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010A6D289FA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 22:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3802810E7D2;
	Thu, 15 Jan 2026 21:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFICF+ga";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASofn81A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7664810E229
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:03 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFY9G72673513
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=; b=lFICF+gaABVgQTny
 N/CiKxWb1HRqPSpBiUY9iRo2lmE6IzZibGEYqfLQNY+mAFZseKhMfediFFwC6x/U
 4ZS5tjZe1iIm0fIkb4VkSczBGG0hNvtOvEKBEgzRsQu1dQVKH7MHhRxMIFBH7Omj
 xBDqgDDnfiChreRxc8NZjeC1HeZA9KtpRaBnZZOVfiZe+xDUCo2kTd+z2WYKnAfG
 fUF6ntjUWGnCHOyuyqO0RANhClTnoNr75JIxSLphHj1a26mm40v1mD+SDkteSMxQ
 7nvyFlwPbe64LQPX5qjG79mtprbsYzIx5QNDM3EpBn9qm5c2cNZ6T9vqOImUKSoP
 Cybj1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpyduhm22-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52bb3ac7bso241582785a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511162; x=1769115962;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=;
 b=ASofn81AoixE7y81dRsK/1rJ3Mq6ia7Peyxn0khpqnbU/vzW1MEsL2gAaDF149vXtB
 /dyHdA2velaMkJe45spNXNvV9969U2YLV2zUqY2GhE+4rgJ9xWn71E2B+YKF+q/H0IqI
 fPuE1+ewEtl6r8SHcaHy1fJMMdqpadutofa42tLt+YlZDsaMUhBsmJJbO1cfgfhA95rT
 AqjisKRmXOJUol+GVdUx/NK2kz/SUAslwZ5TNav3NRksH9dKqSw/fsty9FY9F0QPD7Nd
 s6BTW6SHjWfFovLHvxB/NR/u/WPwoLsXRA0yyfvqG80JYZG/wO6uSg00wO4EQ08oCikV
 Jnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511162; x=1769115962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=;
 b=NHIv+J3qHI9YgPqisXGFmU5rdDDBwWLlOO95ykE2fC/Q0fKTnKoNTQtgSO/n4nCl29
 oten0VKzb3FAMj/iB0rDoyD20utgLumpGclWL8tCkp2K9+cLy3g8ib6cl5KZSl8dyjaA
 0W2YGmf8Tzof1ydstnqr2IrKyxuU2FK7estjgTU/gqUH8lpeH776EQAjpsMy4iJwWDKV
 DmE57HnZSlllIqLS8sh5+OEtWlUJlEuy208Q5j84m2Hi9Cd2SbNrf/zT1QibSly6yoic
 o+85whWTROySC54TBJ4PgUl0TOB0PGSplnMG3fod14ZHfCrps3+zAUg2QX6pD4G7TV+f
 VSYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSfDXwkoeA2WZAs5W99sOocXEjNu31T7b1p0HaEkbLuCTv4qEOXQnRlTwBRVM/vmtQql8Kx/UOe3M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfqDt0dAzMBoJwrnYYiyqf1c1S/0gwDT6JyqagMefkUpBmYAGF
 JYktahH2z8qOynkCH8zlZHXXFPU7rSF90x/lSkEPJHJdwRnkYwYe+4ugLsNyBpmJ1SiXI+ymkuW
 Qhs99j1r0qNRc+lq8JyVi7Qu+buyzUHeW6kx0A8A6CikW+7gg7i7w1w/5U3zb1lzVS0akvWNtzl
 /3CHU=
X-Gm-Gg: AY/fxX5Np+Axl7bzU78YesLObYWRNRx8F6a+WKfyJP3E1VWEjZoAi/s4YE6mhB5iPSJ
 HasJUGzElQobs7nl5NPJ2q60xbRcWLAxKwvhyhT40pqwnJLgqY1GTTEdjXoNXtE3HsIQp3Z26zm
 MrQ+bSd4iiqIEk8XTpSj8mmW7dDkBb11jr0whzCgLfM2CVfYJBy2+vCq6/Mh8GCv8PiJLmSyh5C
 q+JlLfyX+5McM6QGg+bptbwNbrk+1H+ZD7Pc4POdJHj+3mQRslb7adaFijvvMPTteFGNuH0ZYbG
 SuidCy5+uPwMAnEjH/smWcr5r84f0b/BmLY9gEKnK1cZowYVrCZIbQqdWgdqt7HSQ+Fa+hxKhnV
 7Y/ex8so6VNKNR6Tw+yvUT9EUY25V6yj8n6NO9jJPYx6oOW5ioK/89LGt8Oav0MXSqFywWToKTj
 enY2PMQaeFrl9ZAQ1AitpzP4c=
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id
 af79cd13be357-8c6a678e79emr110000985a.55.1768511161638; 
 Thu, 15 Jan 2026 13:06:01 -0800 (PST)
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id
 af79cd13be357-8c6a678e79emr109997185a.55.1768511161128; 
 Thu, 15 Jan 2026 13:06:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: Re: [PATCH v2 0/3] Enable mdss1 Display Port for Qualcomm lemans-ride
 platform
Date: Thu, 15 Jan 2026 23:05:56 +0200
Message-ID: <176851111168.3933955.1978286766565229688.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfXwe5IBfmiYU9d
 zF3R19mfX64VxIwcYcgTBSHr03+Jr++eTPRvikoRiOjPFJMQCkZqB1iXwQ+0ofu9zex1GKzCaFq
 eJ7hqW85gyi99WomQ7CaWlUp9FsZqcmz/z5IjVDFP3oG8zKuF1yvUGukx6Not1Uonh1H/tvo3+1
 ND5U/wqyx9WwTd1ZfafDI2AdT5sjhLPljRNqUS49eW/ELHZJLTsReqlzqj9qB13TieWPxD1Hc1c
 NQrKkvgO8Sg1/5Wm5bH07tdgF/tS9IHK+uebeba6wvCqKRegYnA/HIb3y5BRtZjVg1LEYwB39sL
 GiEIJQw1MrcIubUsAxNnU4tsWR0cc2aDBCuR1DzXL+nUs/7gxtnOQz0ZCRom4wGOmz7C/xZXCq5
 tqXidAog5ClyPvKtZR78zWYH48x74el/JGMCU3deIsQfuYZzkTN/+Yk+w1pf88/klg4rWW/PXFM
 0rArtWvCUCKgib435rA==
X-Proofpoint-ORIG-GUID: DsaNRI_5Hq3np4oHRizAQs2ZwjnDcymb
X-Authority-Analysis: v=2.4 cv=NafrFmD4 c=1 sm=1 tr=0 ts=696956ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=aXzuBbYBWOr-X92n1-oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: DsaNRI_5Hq3np4oHRizAQs2ZwjnDcymb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Tue, 25 Nov 2025 16:26:19 +0530, Mani Chandana Ballary Kuntumalla wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
> lemans-ride platform.
> 

Applied to msm-next, thanks!

[1/3] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1338e8ae4084

Best regards,
-- 
With best wishes
Dmitry


