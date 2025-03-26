Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226DAA71CDE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 18:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E0410E057;
	Wed, 26 Mar 2025 17:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkaRsmdO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2AC10E057
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 17:17:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QA1ill025349
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 17:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=57VyLFaymf8F9QU36mtSjFzj
 QMz+UO59TFULkEduc7g=; b=WkaRsmdOaVzXTCXblrwhQ7etqbA9GJ8a7O3AI+A9
 N0aYAr1dPUV3QNo7t/pkbcW+NO+iEvGg/FhM9wvxzlzKbVGoaLdaOWu7Lus9tdWK
 eeWnWdgTGREkjZkoH5mPlJs1uDrUOyPamsEQE1mLHUM0OzXHwjCbcktrPOpLn0KI
 FSSHkY/5RPHbY9o1KMFMG19zZmEHRmsbOXHQbdQ0KJoxLe9vNpN/+/7n7qRP9ra+
 CfXNNIR7+oMYjE8KbVScA1tOl8++kb1GHuf//T2T3RnP/3cSkNmNum80TBXHlhqa
 FjGMwnYhOGsU9+vVp1znwKEYZ0IKzEzlto7Kl3IB4VCVRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffch7u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 17:17:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c3c8f8ab79so15608985a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743009427; x=1743614227;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57VyLFaymf8F9QU36mtSjFzjQMz+UO59TFULkEduc7g=;
 b=uKEIgr/PIr89ocShNgb5g7+EtgWTW93BH3Ibtni/Byunf/I5Q20Ruh1Jlm2tecyK+Z
 Bnnbc/9qRNDk9909MREqVY9jrjvLEP7YOJwI+RONeRdKlUTZ3qos7907kWJiICyPpGrl
 dMw0tr67jw60lZkkpMX86Q5xepfAxHy3Z0+4XF8NQtne3kdcWUxm6T5C3kWMck7P0WoK
 WHVExcdg+XwOAiinW5MBz/Z3Dq398S9Q0XiRuXlgfPnYlkXuqI2f3D7xGwnBejpxbodD
 zrDEfVqY5IsIOl+3GjpNDSfy3W0bUWMQbmRiooosDfMtoM6AYUuX/B0fGnnCt7Gpq2oX
 P9Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD6Dip7eSNqBEMXbkzT0fZJemtgWvQrj3qDHC5CQWUwSwjU2uEMFPNUCdA0r831SMaHmWrj3kMScE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlJcWfC0Jsfsod3mAS6uAsL3IPiaPb3XGj+wovtYTEQo5GBoE7
 zC0gOhP/EctMCQw7jHzv5p/HID2uf+TLfGhSi1jSy/xCtH8vnIeqEJnrqaFxjKn5Yqx7dbicVdh
 PlZRu4RYBYgbA0jAWQdG4sw54oqicKEXljsVAmNwQg4vRoZIubAx7oUnV6GQImFC3+5o=
X-Gm-Gg: ASbGncuUdFsMHLfr+Rp8yho15M657+cG4+GueYbZs7u8XyshxVuc5dPSoW8UNEeoj8l
 Cx3Z0LirxB9JuPF/8PVDktTGBsWp3pAeIJO1LktZ86KxyDAdoAYS2VTvlj6q1CXP75Zbjta7GDC
 53VRM+FHaVIK/rtQC9JruWcMla2YqArAVEeE5ZoAGM7Y9SNdHr0LWfefQuDI5mVExkqj5APp9ls
 090eeneJCA6RJvPWqYqrHNAqruF85BNrCHpK5To+CqzaZkGrN3xUqH+16McnEFclmo76mUUQUZy
 WnA8/7CT/igqEJz6HBKqvB9MBfq80gZLg2g+EbffWLouUbUHEGLFYNzpjPc/4YWOYUK3p3/WxDi
 UwRk=
X-Received: by 2002:a05:620a:2483:b0:7c5:df79:f2f with SMTP id
 af79cd13be357-7c5ed9f2cd8mr77469185a.18.1743009426613; 
 Wed, 26 Mar 2025 10:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZVayB4qjwN0UyX1tnhJiLkSyjaqLbzhmrB0L0YbneGkZGXSc7GvgkWAaXLuLzkuqSASIp2Q==
X-Received: by 2002:a05:620a:2483:b0:7c5:df79:f2f with SMTP id
 af79cd13be357-7c5ed9f2cd8mr77462885a.18.1743009426112; 
 Wed, 26 Mar 2025 10:17:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30d7d8f4280sm21672611fa.73.2025.03.26.10.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 10:17:05 -0700 (PDT)
Date: Wed, 26 Mar 2025 19:17:03 +0200
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
Subject: Re: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is
 zero
Message-ID: <jbowz36pz7es7koc3abi3maw6ytz4auuobhkmkqelvwavilqkr@gxgsdhao3skr>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
 <2cfdf7f3-56a6-495e-83cf-1921a2e0ef8d@oss.qualcomm.com>
 <CACr-zFBFpqgHVRiH37ooeVJ4Jk1UA4AhP5J5L5yV8_CHBTG07g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACr-zFBFpqgHVRiH37ooeVJ4Jk1UA4AhP5J5L5yV8_CHBTG07g@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e43693 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=cpwuP4bK5o1WZ1zuufgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8ryGgfS69xteaAVgeVvUB2qcwJklMspA
X-Proofpoint-ORIG-GUID: 8ryGgfS69xteaAVgeVvUB2qcwJklMspA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260106
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

On Wed, Mar 26, 2025 at 03:08:30PM +0000, Christopher Obbard wrote:
> Hi Dmitry,
> 
> On Tue, 25 Mar 2025 at 22:53, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On 25/03/2025 21:21, Christopher Obbard wrote:
> > > Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
> > > valid non-zero MIN and MAX values. This patch reworks the logic to
> > > fallback to the max value in such cases, ensuring correct backlight PWM
> > > configuration even when the bit count value is not explicitly set.
> >
> > I don't think this matches the eDP standard. It tells to use MIN if
> > BIT_COUNT is less than MIN, if I understand it correctly.
> 
> Thanks for your comment; that's a good point.
> 
> I need to re-read this section of the spec; but at least on this
> hardware I printed the values of the registers and it seems like
> MIN and MAX are the same, so I could switch the patch around to use
> MIN in the next version.

SGTM.

-- 
With best wishes
Dmitry
