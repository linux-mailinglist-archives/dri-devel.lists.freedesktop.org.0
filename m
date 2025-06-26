Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5614AEA9E5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 00:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DAF10E913;
	Thu, 26 Jun 2025 22:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmLUJcLS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1D310E921
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 22:47:10 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJdOje013240
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 22:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gmoMifDvBvDGBNVMAClJOdl8gLaZitfPh+a35hkvPHI=; b=DmLUJcLS0w+IF4ju
 mlBGlsPbAW+fReM3XDpVtw5ER/J6uRpK7PbGvyeaQxUPwZtWRpBL/ajsNXUFfbQi
 aYoZmMoQw82RlY1HVAStmFw7q0ob8oNhYGpa+kBc7dayYbG6KO2J+c+n9TNjQ+TT
 5yHJEU5y05QWGaaBLGewI1FdFPDetApInyJuUI7aFmaay4Z/UMsoHU7wkCeT2m7E
 axP5Ju5NOUDA/woLlcrXbIcxSLoH+MqwU98WdW8tCMO+kG4J3LtBOw3Be/AeHSAw
 Bi6P/xeVKyW7CZHVpJFN1kHo/t/cxGuLH9hRUthSRM/KTwcjyiFOc5uI0H/SK+0n
 lWnrTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgmrmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 22:47:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d3cbf784acso361650185a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 15:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750978028; x=1751582828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gmoMifDvBvDGBNVMAClJOdl8gLaZitfPh+a35hkvPHI=;
 b=Jx3VmuKz8L8v8zvXIjWDU5m286tZ80d2pfkUXQdKFeWKhcxGDX0FUhY+N+1jI0dNED
 vKi4+DGQcguU7LP1RxrjlsDgaoqTHR/i4ChkXwBlF0dTj5wcvNc4upgAW7NMW7b4wTW9
 437rw2AiRek/KgcwVFvur1QSM+Kw2CiO6e+4bEHvZZjK6OiZSfI9xW0DLejTQhMCdNNT
 SCB0/fLA3sxShIlgcqEhpBiwaA6nWJZrILEEQbrgxmul6Am01DAeYt+gvXFOMCLmxGkq
 8Ot/MS67vA3Qp8Mm6abG2QNWi+7jj5w/apyAL6xyEb/iVeyNuaP68IP8UF2da5I69RNA
 xo1w==
X-Gm-Message-State: AOJu0Yy78PyVY9PeTZTlR/HzHrmCaRzv5BuGudZWa18tcFx0yIBrd6mu
 8CNmCBMuv/n69SapO/2k0snwhWQOK5qsoBQjp501bqaE8ctnKelp/ZIK4b1YeAmUtB56ZvtYyGe
 4OJlZvnpSQvzc4+Spi6MpRSktmdou+m5RfFwW0q1Yry9bLDpJZsehuxQ0B/PahJ0RFK0XnF0X2l
 Ah3kR1RQ==
X-Gm-Gg: ASbGncseXn6KA/I3EqzlRJ7qLv6Pe5+KlOdCEacImYuUKx9KiSrVpc0QDHy/U7TlJMB
 16MX9Hj2fFHOHtkYkO6SmVqoL5Z9Jvzpj605INjJgXBzEkuRJZ9CPJ52Pw3+VKvL4bVkQjmdWyM
 OwykVg25tOHlusCzMFD91nIsHOzovHY5MWCDue21bs2Cs1+oQ5z2M8m7y+QGxYFWmZe/rKmD8ka
 gim2wJ6A8NFIn/zSMxH4TQB42DzcR8789h+WC1lVUJKIegVSgMf/DlSOvhF9htuHywWdxy6W1Tx
 6rwkIkGCqMVQL1WSIsHhxI7Jcjk/QMd/v6Zk5fk8MI2JmdOE5d3yEshsx9v9mSMwfhbT+67Ktxm
 o5SAiUHNUa+jG2jZQ2pa34r47OOxJEabTWPA=
X-Received: by 2002:ae9:e20e:0:b0:7d4:28d9:efbe with SMTP id
 af79cd13be357-7d443992d51mr155165285a.32.1750978028111; 
 Thu, 26 Jun 2025 15:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7QvvBbuRQht/PX77z92dSw11SIpFRHu9NAfpMGbcKSTVTrTrYOF0CEnsJFm4LXzUIjnqOGg==
X-Received: by 2002:ae9:e20e:0:b0:7d4:28d9:efbe with SMTP id
 af79cd13be357-7d443992d51mr155162685a.32.1750978027682; 
 Thu, 26 Jun 2025 15:47:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b24e4dasm185172e87.73.2025.06.26.15.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 15:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/2] drm/fourcc: Add additional float formats
Date: Fri, 27 Jun 2025 01:47:04 +0300
Message-Id: <175097802066.519545.3760408226884035937.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
References: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uup85PF2q4P1QSRNVO9z9No641WkLh6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5NSBTYWx0ZWRfX1tJaCDdatshH
 3FVzTr1fByMnopskiIyN6yFchQFXbT2F7GtOrNflSjpqWwlIAgp191e5mC8U49wkWZCkc4ePHBP
 pmYEwrPY1V55ZPCrFH53gM4D3fUcPFpCZFY4PU+756hW+Kx96AY9Xa40EhnlOBOt0sksMaOOT8p
 zAHcfbyKMe9/CmVwIYuuK584w/fWDFDhyBEiDyPRV3kvlRR6TNXm7/hL0I9uTIVU/xRs5lWtcN/
 9AVjs0T0bhQkgLhh4QNoSJ3qeKKrYp4VFM/Pvm4aVC+QQvZUjSW9ldkaLQmyn6+ocnqeuOqTk1C
 yyWiulm50vX1JHmTBJh7KVrwm5RmIB0rSCmcu79dhPO9k/pYJLMR8HQUYlZeUgReVLQ+mAhPakx
 i54bzaN5tWGeZukjPkFCUVOvC8LEULsXfPdsgt4Fe97nobySWmHjksYBf7lNlYFaWI9fSR6y
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685dcded cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=yB-vDBVxPvN9sSdsvdIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uup85PF2q4P1QSRNVO9z9No641WkLh6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260195
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

On Wed, 25 Jun 2025 10:37:09 -0700, Rob Clark wrote:
> GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
> fourcc's needed to import/export these formats, and/or create with gbm.
> 
> Rob Clark (2):
>   drm/fourcc: Add missing half-float formats
>   drm/fourcc: Add 32b float formats
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/fourcc: Add missing half-float formats
      commit: e04c3521df073b688b9e9e2213cd3c588e3b6e68
[2/2] drm/fourcc: Add 32b float formats
      commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38

Best regards,
-- 
With best wishes
Dmitry

