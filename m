Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9EABBBAD
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095A710E3D4;
	Mon, 19 May 2025 10:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNGSjDL9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528F010E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:59:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J92AOi025672
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=; b=TNGSjDL9I6qUy5yj
 PILjBTcQS3UphGkH/QHoFaeAmcCcH91T9l/iGOddVRHp7MYwUG2KptKfg2b5qOma
 AzX30jHkwtB5S0vTNH95gt7hwMV3HQtze1b3HnkWj/VYG1IDZQF+RJYMg7U6WHkr
 sav1vZBqsCetCrTTyunwrZVj1Wl/IUD4QrQM/96knE5aKp/C1xh2+1p5HbvSY+yT
 +fuAY0YgjxPd2Uvpn8cAf9uSABbqvwfX4I8PnE6eEaCMhPWkges4EXaWbsp9hlTB
 9OhTmCFMdq8HfcLentyTLjFtdUOnWpanrZkVLKnJ4sePmS+0TS8lY/8o2kqb1/Ys
 Mu6qXg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7c2ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8d0c8e917so10371206d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652338; x=1748257138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=;
 b=ghj5kyZX9fZxnMEjJk2I31Ydh88jy/A4UzyvwaoIT+ZOUzZS8xwNrLJFT1qI/cjjxI
 LajX3MqgbbJpUXYD50G9wyHwO4+KuAL7RGjaE5YgqMuUfHVxDlu7+RdICeft8fEw99Ty
 qxLugru/Fbz8QSAV3a4Tj3aSg2zA5IIcuT/I28km8S/C8k1G3lCDGLygJW0Xek937jw7
 lPN48b4VCMLbXS5ImjZ4a3SkOx4jstuqyTXxJc+SS8tw7G9NPbXTK0ASTiAoB4VVoZ3d
 M1ns3BNmMV0J9TtmMhn57YnGvO7p0nBTF683Lu3j+dUurKjaQiK0Y9Gb4aRt1W4mXnhq
 NqUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8VvZ187GxUIJNDsc4QJqoZGGct4u6k7qMcdoU4MdUpuIqZ+8iOWZh2e2uDG06qm7C0NrJZIz8l/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdqMciSBneqZXSpqkx91pVOq0KyBcAuN9UMvweGdMRzisV5dYM
 uN9xxH7S+zEnXbOV1sHJqOKP7Hhtmx6pWC00CuEohCbCFn22m/F73nDT0nJy5UayEnnxwSL0857
 QzG4NM+gQNygwt84vNUdP3LavrWLlF1osuhEtyn6upEzXJGyR3XRnlt0nEPZUb68tp6zmmuc=
X-Gm-Gg: ASbGncu/yleA9AxIv/YNgl6q/TGKavz73XL4kMsOHFsi9Ly72zWj3Q5BLa29rXHy/Ic
 UpU39OL+AU70OlQml3SLcRipngWGo1REKhdKPEa5k07HnR2Rr/dOjFtuos1NsCG20pQ4hDDbFd3
 mRSJ2Z432Q+TjUM2Jm+H0OX9py8cueA7MqFjcTRjNP2JDaMcbgi80XQDTW3FZEcxTvkKclyEHQ5
 j6b7vrEky94gQF+rlcm9I4u6O4+x4ogqV8IqTcMEREs1bAk059w7YWUyBdkwEL5LBhtoTyRrJcz
 q/T8En3sOo4vJPh1i6+1EL2mk7uzbbjV4K1yMroQ1Hm44Gr9AjFji4ZZNpUPppCxMf0d54MJCx2
 JU+EiWYyuo2rnvkFkqL+dNLci
X-Received: by 2002:ad4:5f0d:0:b0:6e8:ddf6:d136 with SMTP id
 6a1803df08f44-6f8b096db83mr202681126d6.45.1747652338535; 
 Mon, 19 May 2025 03:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9+e0xodbssXAPktkA1sHSaU+L3EdyNKhog5olMLiulrlaQky3UDZDMD0M0rpu0Ed//Cc6bQ==
X-Received: by 2002:ad4:5f0d:0:b0:6e8:ddf6:d136 with SMTP id
 6a1803df08f44-6f8b096db83mr202680816d6.45.1747652338140; 
 Mon, 19 May 2025 03:58:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, lumag@kernel.org,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Date: Mon, 19 May 2025 13:58:40 +0300
Message-Id: <174637445763.1385605.2171270817711925653.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b0ef3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 8_e-02QEPP9BediEIGv9Yhp_usriuAen
X-Proofpoint-GUID: 8_e-02QEPP9BediEIGv9Yhp_usriuAen
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX+VeYGDZc/XRy
 GnlG/hFIgiIMDatScvA53RoOXL9B65B/G5YARv3mUYpow2mxXd6d4zZpqGNylDLg2WqYEhlT6GN
 zhCMRV/EBFTP3gjPOXvVUVKOjVxwmpehi1Rd+5y74ZvZ8pZY0wTN2T+v1XnKQ5Tfnrcbk4XRTf8
 gkFayoO1U5Ktv/Af0n8uR9mmAwDCA+goViriHDkjwH3P3qxKvyDhbFrjYV1duU3LUUHAW218/Oc
 /f4A0OwnT/sRmLhMv3I87qeLlK9eyA6jAFifmMEJJxM5KOjOG2KHHOJrZhVCQvpYbytFEI+rLUT
 bCxEjlIpOrrsKvOeKScDic9RoLYvyIDaQj6n1eekWcGNvLxuZXlv3ctVWKyi/H6LvN6saI1GuSb
 VKqsAfmQn+uFv/YdXRICLTd9Ff2JiGz5Y8aXJLP/0itW+/tcxMRKP8aDJjFNpaQnMK4kJ1zs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=880 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
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


On Thu, 10 Apr 2025 10:52:21 +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Convert comma to semicolon
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5db5401c2455

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
