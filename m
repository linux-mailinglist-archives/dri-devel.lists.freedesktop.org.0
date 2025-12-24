Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF93CCDBC99
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 10:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA42710E9A1;
	Wed, 24 Dec 2025 09:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="job63PWf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOC6WMYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1462910E9A1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO3wcpe3797042
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S2+UgmRyHEzuY5//wHuUkLGw08i4UoAdo8wyqHy3q5o=; b=job63PWfTtQ5McWC
 HEohs2DAU44x4dqyNo8QzarFgReu+4PbIiWqb7M/xf8qjpKs9qY4bIaBTDjvRMdj
 XafvlHrI+lfDixfR55FnPkNlLqXH1rO6wVDOR5zvTsOUR+LI1AQVJAv+d+/vhwjg
 rzo7fbkoULyfLvV5fiU4AsfWlmNvAaqnSLk43T3dYfk7ANMsLUkB2GqWUvCpW/SP
 BsVjzp7a/nyP/uPqItiEj9DCWZMCz4xo/9NVh4RkmQWDysCn1RBk/ZG8UEGQrhhH
 CXJ1UMI9ypv73b5wWvqAxlqUkg/AL/l6kSjGU3NGbhgqdp8q1P/O0kqmGvWzu3UO
 FkKZcQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r68s04-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f1f42515ffso138464381cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766568467; x=1767173267;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2+UgmRyHEzuY5//wHuUkLGw08i4UoAdo8wyqHy3q5o=;
 b=HOC6WMYZY9vICgyPw49XASPugv1CCJhEJmunN2xjty+SQ1sfg/J1fULEmHXxailIxs
 htn430xmgv8kzGu+CsjoP43yZZjKFUDQ/Wsfa0LjDTwy9TTVdjENyGPUK3LeMbuTd8nk
 Ee9nkeOkOBsYvBXqBxRTSCLin1SZV24hzAWnS90PVV15xqgEVC1ZPFB/aGsOJyC+WRKb
 KEGcTI8Y8b4sXhwW22nM9OzjSAg+LQNI7L+SzkInNc8FRq4OTIL8autXKyG0SPqs7NUp
 i9w2XLSjpfJlqMFHMpcIwRj63ti/RiGFnweRxNNNNoUM677aRZuXkHTgvWriiRsI2cFs
 F0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766568467; x=1767173267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S2+UgmRyHEzuY5//wHuUkLGw08i4UoAdo8wyqHy3q5o=;
 b=MvvZyoJXC3FNYFwFAgBobxroZjcgZ8SCabA2uhAnHXMY75ZPKiksUvYUSD8KqWP/Sq
 qV/qWO38in+/27vnx/zEU+doUPxdr1PPgYWAFyckiJ1gI8dCG14hZXPe4gfJ/E2hE/vF
 TcM29wmSKzaETUf2Cv1rH39w7RTuVoIgjrlrp+CJuOZFxYWtGw21tluJ8L6a5sealC73
 bU75vzOz50GSJwekh+Beupem974OfeDORz5nynTRkf9mCphe4/1IDBolpi5i62IOT43r
 U+2CmOUyBmBQmFxJoMDCZtbgEgtBQ9XkU23Egjwh+24b6bV7bRJsrq5+n9G8S31CAyu/
 MHew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJZCxjmIlGS6StOovfDERTItgfXDPbhsh7S84LMoadOVCraedTh+VyEMZGcmDvdL2zzrdpxgSnqiQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIGT5wRNSXneexpiJisk5AJYqwI61g7W12uU3UgjMiK9vB7LC3
 Uta+oN7gJ9EiasmYCJ7JJ+Q7ICFMSE3yRgN8rFzFta2KEyhvIBFU/f1ee22ji98cqiTnSBRvAeJ
 ilmMlD0uqwdpwCWU3dafvGXZUbNNYQpiuoQaduUaUM7DoOlMBR91hnPIqS9w7t2oR2kp6Wq4=
X-Gm-Gg: AY/fxX754ae1nv1tEI+B4p/LQJ2VTGtVryvxC7xNa8dhabuKAqev5NEghG0Z20k+FtU
 yuFJIGaHDDXSxNOp4bV/0NaIYjWhI9TNZK4obiqDhzpJ7tFWI1SeQIhRLEXfiJ80IDqNqdS5Ku7
 hg7gkqeWvvVRdGfHzCEnuKuql3G6Xp9/DGPi2Vu4UQ7/dMKuqklU+8hk26uSn1kI9W2vX8yHbEc
 /q+1vCQK9a7lARDmId5Cd+sauYRiiGms0ZLSeZQ7L4tkV1+IBUoQ6syAoRrn4YvrR1wdaQCuds8
 PsWNi5wo9kUfpQPHbl8RT/HBOnZsIVgFTm48J9SndxFPYZltdaK1Q+zsX0njd4hR66MDYMmsMJL
 dG1TRkzUan8APXWTlacVQFN+PyzjwIhjA4Pk+2WC5XrlWEyFNHzjOP8IqPNecHOwwzdRiN4c4YD
 O1baBF3dMTSQHWBqVPXiu0UuA=
X-Received: by 2002:a05:622a:1e19:b0:4f1:b93e:d4d8 with SMTP id
 d75a77b69052e-4f4abdb52a7mr242652121cf.71.1766568467399; 
 Wed, 24 Dec 2025 01:27:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIKNXajyePpJU7X8UHXbYrzTli0bpeChd2Z0MIo3yKFTwjZi7V2JxmdWBUX5NTuC3RQJFXcQ==
X-Received: by 2002:a05:622a:1e19:b0:4f1:b93e:d4d8 with SMTP id
 d75a77b69052e-4f4abdb52a7mr242651861cf.71.1766568466930; 
 Wed, 24 Dec 2025 01:27:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 01:27:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/msm/dpu: Revert broken parts of the quad pipe
 support
Date: Wed, 24 Dec 2025 11:27:43 +0200
Message-ID: <176656845705.3796981.11555430286508569316.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xzcLekeWH8pUkkK1H83ZayW7NLDsrhQi
X-Proofpoint-ORIG-GUID: xzcLekeWH8pUkkK1H83ZayW7NLDsrhQi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfX0pUEDq7bCCMP
 vx9jHCIWoiPHKQG0ysQimKqD13cB4NkCwlWnGne1JE3RsO2y0Fwth9EckmAfaqGkbh6MK1uqOgB
 30EebN++I4ZfX2fDz7K6W1tQmSomUsO7cTqOlL5JoFmhCSZSdMo1rgiTg2/tqeptHlptTTct4sH
 iLA72+EIjEJUgo/R84I+nANsySui87wAeZztsF14jRTPrgi8nMqjIlZAI1yR1EkZHiO5M/N1DHE
 eXGvs+XkIXIrVyZu71zz7AifTVjyplk+17K2pblUmqhbxq0w5LAlff3fnu4nLWlWQn7GdwOMCba
 ZN2SAcgln2rwndxvNWoX2wRJEnoOECUlZjHANBnk/GQBPN7rg7mmSZKTzJgcji12owmYJRczWiu
 abVVfnDQZ0+jPnDiEZ5igoWztGp5T/gN//NYlv5DUAfOs2EYtgBvDkWsqh57Oof9fuhtpNxy9gl
 5ml3GgyFMqLH/Ny04Sw==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694bb214 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=97QjG1G37Icci1zzKCoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240080
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

On Fri, 19 Dec 2025 12:39:00 +0200, Abel Vesa wrote:
> There are quite a few reports off-list that, at least on Hamoa based
> devices, there are some IOMMU faults and some abnormal artifacts on eDP.
> These have been traced to the quad pipe support introduced in 6.19-rc1.
> 
> Meanwhile, Marijn reported some issues in some dual-DSI dual-DSC scenario.
> 
> Off-list discussion concluded into reverting these two commits to avoid
> the described issues.
> 
> [...]

Applied to msm-fixes, thanks!

[1/2] Revert "drm/msm/dpu: support plane splitting in quad-pipe case"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/35ab5123bd24
[2/2] Revert "drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/da9168d8ef1c

Best regards,
-- 
With best wishes
Dmitry


