Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A2DABB2BD
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 03:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BA310E214;
	Mon, 19 May 2025 01:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctYcmrJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E3310E208
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:02:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IMgWaD022938
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8STRhgSicOn7j6XQwcVTZU7Y
 AVnVtOQI5907glRUH58=; b=ctYcmrJv9TFKbLahfFb6pG/57Y+XEF4KgOcCtgjQ
 eN68rz9yCh5qYim7QDWN4fsOAoi6p8QKNREIYbsQVjUnn0v/jqI8gT1nAKVtYE/+
 3rlsQpTi95yrgVhAb+tHfILZjwfKwbl9lGPucJwmuoPncbRZpa+NauvM+s6z5WqM
 A/ND0PGtCS3mzkr2i7o21LnB9zVedFBGUOt6SFpATKsBBbsk+102khI4iTLBMwTJ
 mtc/O/mAnBZj4jYf2NGoxszSN/xDlFYHcGPRmuEXyof3Dm5WJK6oKjRQCxVoR20d
 i5/3qlUDyn8dG/ClsGkZCyYOmObZoyzMWjaKmF9uVoB9ug==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g2mj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:02:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8c2ad9cf2so35236126d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 18:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747616538; x=1748221338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8STRhgSicOn7j6XQwcVTZU7YAVnVtOQI5907glRUH58=;
 b=T+MTb9PeK0ka6g1l8d7x+QEYZVqudP/F9yYuCN3sZ8hUZo9Jx1clIHD4ISVrBQqKwP
 prY5einXcVyaKRIsCWqw0UoOOjSoFL4/xTMyWgvmvt12UJTf8HKxeUVVENBM6JumMU63
 1WIxkXdfLEUjB8n1+7fit01sBZp96gTE+wXKFBAWTH2wWdpGepJcPdXO7N3Oo/toI4/M
 3o3Pz3SSBkzuDryMgKx6oXf0jQ47t6eLy4yrQzd286XBmsGogm/kqUQ9WkRWRwFRnNYd
 F6UP315lbm5LHbaP5CxPPuu3R3yas54h24MNM9eLwoOp99e9mzjHW+5By7EFO6V1wCAU
 ETiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEBtm32Wht/1oPcaqm0XIntYcTKx8kintmSm5XXjXxLaNREBKlAWMwa/00p2Iq9O9oDZnU2JNLwfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhjEDSzQjNmIog6srB/GVOXWs6+Ank3prXgWGBxZZ5PCZmwwTi
 2D74JIdkJcqfljOdXHbVXKkEKFhTZor5zeHGNQySos45l3AKQl3vt6dTj/5sAU3wuoBufCvhRZP
 BXDVkNdPc0kGovTEb/4Zy9NhOtYCObV2sTwHkqpkqnfpPxAkIeE8rzWQ49hLUceAfpL8/k2A=
X-Gm-Gg: ASbGnctwtSeHYxZK7ouFqSPygZ1ikCrBKf+CZf/SQw5xm8B9/hlU5jJvdWLc9c8TTrQ
 SHOYExBM/YO2lx5AQYOeLFxVxs4Wg2dcC8oXsZDprJ0yDXBYsqbynL7+V0AbJFKMAMGu+nI//8L
 HpRbLcDG+kBreSEn8djQZhCrTItg8sufmvs6GwQO0vXw0n+TisjQlrnB/INw2BYpGdfTbu3woO8
 vk6ql+P+FgYAOdVUz2sfd/7ETwotjHMKMtQnM0qDjmSwuWrn8KqSEonTqSJo7XTjpxlq+Llokt0
 UdweTnzbtzR6203pSK41ziBp9AWVWbhOzWwhi6AxBC66MxNp+kwDJVh/2UaYWwoinTPZs98Pa+w
 =
X-Received: by 2002:ad4:5f8e:0:b0:6e6:5e15:d94f with SMTP id
 6a1803df08f44-6f8b2d4fa1dmr164141486d6.27.1747616538224; 
 Sun, 18 May 2025 18:02:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSWo18mdSvwfxieffjfuvn66T/nACsrj+CCnE08zCXT0yroo0DlXEmo/fJG3GV1JDhV9D6gg==
X-Received: by 2002:ad4:5f8e:0:b0:6e6:5e15:d94f with SMTP id
 6a1803df08f44-6f8b2d4fa1dmr164141186d6.27.1747616537857; 
 Sun, 18 May 2025 18:02:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70404desm1625222e87.252.2025.05.18.18.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 18:02:16 -0700 (PDT)
Date: Mon, 19 May 2025 04:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
 robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <mlxlmh5zswt2n7jcmqvyvgiif5c2ch5gb6yq7ethh52aluo74t@ruxhcdvwhxbc>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-3-amakhija@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513102611.1456868-3-amakhija@qti.qualcomm.com>
X-Proofpoint-ORIG-GUID: dBOtKKTWXVZM2akJVUD5tnOxBnFyp8cI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAwNyBTYWx0ZWRfXyapL11Oy0pF1
 LbukveNdd9CRUFThK2g1jP5Nz/FINKZ0axX4X4WN6Wazw69f6YzoWy1CcDX1dQoCbvxcCXdk3uo
 WQDtaUdc26DCxqjQHYlaItPQE+ycWMFYe9ofkeua/gQgjIxsYbpYEvd+xElZaJR89XDfF9fe2vi
 cgN0lWdZa1jkhzpMih7WTqfXtyjxRBuak7g+h+4ddZ+8Dw0qI7d1GD7HpRhLX15CspYqkiOmEFX
 XzsRKxEdiGq3ZN28zhkZuFPqHGsO+W+v43VoL9dttB6uI8c/JJLrYxO31Bq/v9BXPWLpmWwb8Dr
 CCQZr34KY/qvO4y9nPPkrKgR4bDODk/jgozkDl+Og9aAABqeIhg9lVMcClfRcOb6Xc2JXMm4+4J
 tQ6LfAHDpxvk1qbzNXKKdrlw/q28M9UQqdSjyxWJ8ww7vpokPxfRCd0C666idddBG9HlGvIj
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=682a831b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=STMA3DZVbMtk4X8eXj0A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dBOtKKTWXVZM2akJVUD5tnOxBnFyp8cI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_12,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=843 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190007
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

On Tue, May 13, 2025 at 03:56:11PM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 232 +++++++++++++++++++++
>  1 file changed, 232 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
