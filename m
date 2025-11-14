Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959FBC5D8FB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4358810EA8A;
	Fri, 14 Nov 2025 14:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fkb/SFPp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3LBt18S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E490710E248
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:36 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEDu25g4123672
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=; b=Fkb/SFPpPZe/enQM
 +UGfsfN+YDNnEEJVt/Rlbhe2LTpGowAMyvAb6tal4bo9EH71bFnc3kJK544mQOn5
 gBUcSwooifVSiJGc0aJ1h0kS230Px6rpQM6YFrGPMJRYjU5oT8QMVpmcRbccGIGZ
 UdFIDLE51fM7KBeFURGvm89W1937fgT5kEEMX/9HW0NBMdehTQFTDt6wSQmIqTzG
 HmmCnxzI4Gzebso8HINCkSpju0iVajLm/dcDbjBJEfk55OXFbelD5bax1ZrjpVKU
 wEtXRjxbZGsXk3ZQBvPM3747vcGOhwSEOQ5lHolgUre7Jf4i3jxFTXZRxj+jJtfP
 ZA7C0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae5r7r2w2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e88947a773so73466501cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130395; x=1763735195;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=;
 b=O3LBt18SrGw4lgduu1AWOMCV5bMoRP4N/lyiVDsRUnVP0qvze8dvGWg8+0A7tgqRYH
 089+mbDJIsWE1dHJyldqAU1KJwNcqGJt5hSUePvaqWTlf8oxdhkXu9zFUwgfkk4bUZhw
 ryyuHa/GnLdja0YZQDi9Suj79HVQCN889/y/3zCcyJbwu7uTY6jM8koOB6aUCk6yUX8a
 S5dGM8OZy1Uf64ft+GYRX5cKzYU+8mPVC3Qsq6gq7d8YPVAm5tGs0BrCDeyuxCDUMo79
 q1kLVpetetlUMjVEWmA2tGYbscWEy5H3dDrXE+Z79vrycoMM6MfKBzeaMufaU1SGRUsO
 2LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130395; x=1763735195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=;
 b=SI0tx6904mhnXObb6W93vXetjGxL6LbJUgEFk/xPVAaRtb2e0A7DMNa6LN87EhotQx
 DtAh3JeK/uoCHv8RJPDUoY7YoLf4aunLkRf+xoufn3Yx7DEreKLzi6fojQ7hsUeZsxQY
 nmaKUBRAwcOv6uYcLqkcoT6WUEp+4qupZu3VS7HUx/mWDHaXs6KtjzVYB3+hCpLFuDE9
 HAdO8m4lajfHc9yF3oYSM6aLaZEmyuANFbud/2HffEsNRg64sMySlb3v2ZfO6NvwDxuu
 X2NsTZNkVNOo++2fNMyr7IRpYktze1kWN+M1qSflfNSyDLL6bor5fV850wmhhqnu5ZiJ
 nz9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlUTkK68CnvVrIgaUUBNRxWUaVRaZK5IPyaCOqiJo0sZLGQvp72RupANtha9iH6KIUH0OztilNM9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywkusw99k47xDG9n6c2BKFwZbEagU4emZEqyis7Z1KLRfwCNEeD
 S9ufb/tkm83OHAHMBOURRS8R8YMGihAqfGwK2plQQNLCH80p93/N1mgz2n4dDxwH3fERh70D2b9
 b4w7uLmqMZGde1pVw5usYjHW+2vF1nHxPI5OU5VNME2VWG91yvEzM48TdXHzE0Ceg6LC27QQ=
X-Gm-Gg: ASbGncv2kajo0Q8KWHUAjmAcGBFHGlOYUI4+nn5kXeKOJ/HsSMU3ZhvXNQocwufPPw9
 kHz5NlPMsP+r5w7rRGq+cD9VGp9lX0rL/0LdOp9z/X4aCEGO0ij24DS5SxO5tslQ5AY+rmqcA/B
 bk30mzMrL5RT/QRcCBOO2gYav3YxBB/ikVGUx2G/J0JmqN3ZFj7ki/4evtySPeV0piHztJ5MrNf
 udvW3Aps3do/t4nJsECAfF8AjpwxtZ9b6hdIWeb4TbXfj5o79bZyyNjq/bxF9JdbZ3r12k4a6eS
 0vKREMKERpDGVSm7i1N+yHhqSSuLwPiHSiJiiwq4L7w8xOx71KTrDg5sdlqm+6aF8lqXUbQITpp
 lKOgQOwn3BxHyD1+rTdQuhjx1vCu46Qqn1GbOtnFdXXy+toC1vWdYoQTr9l+Q4oARcaWN7/nA/s
 3owI+EGWIv3tsD
X-Received: by 2002:ac8:59c5:0:b0:4eb:9e22:794f with SMTP id
 d75a77b69052e-4edf2171bfemr44962591cf.82.1763130395492; 
 Fri, 14 Nov 2025 06:26:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4YqVYNVjL/1B7NeGIRe8IGvJOuyU+4Oeto661Y2vEKRPzlrXHYqZMVbHPWOIM+paqpNmJNg==
X-Received: by 2002:ac8:59c5:0:b0:4eb:9e22:794f with SMTP id
 d75a77b69052e-4edf2171bfemr44962121cf.82.1763130394913; 
 Fri, 14 Nov 2025 06:26:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Date: Fri, 14 Nov 2025 16:26:28 +0200
Message-ID: <176312947286.1737000.3509947007748162020.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfXzU+N2olbyRnl
 CwyVm+jdoeWzM3wy+K3VRZ3w/SQzfMgyYmDonlRl0vq4rCaUoFp0BlTc1+hWNy0uTeSpCHzfosv
 IwAZCppLSJV1AN+VdQXaG3PiA5DjyyVj3byOXy5fLkm0Q91w/g7s2iM3RqrcAjPUZewf029UAWv
 D7WiMoFlLLFk3Cb3wos8OArl4j3nvUdzcd+HlkaQifwdIaBn9MBQCsXw7dHUfsObjs06IUuHlnX
 Qd3xYOE1QtRIlAkQC1DWxdP4ELpjYhxYYmI/MzPIJEyWcduZMeLta79BuME1+XnCX5xbff+u13m
 uKlCZoIXQepR+fUSqfZdo0u/NPgNzyDpjE+C13IlUF2tNwZ/wSY0Ruxfh9Tjfmc86M1+gm9CrkK
 PJ2iff4f30/Ais9qGNqcpWFcnn1bgQ==
X-Proofpoint-ORIG-GUID: 7TkSwA0wRRY1dw_hipgaUh9fxvGvDRC_
X-Authority-Analysis: v=2.4 cv=BJO+bVQG c=1 sm=1 tr=0 ts=69173c1c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=UqLjAnsgJHsByH5YNvQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 7TkSwA0wRRY1dw_hipgaUh9fxvGvDRC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140116
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

On Thu, 09 Oct 2025 22:09:32 +0200, Christophe JAILLET wrote:
> 'mixer' is only zeroed and is not use. Remove it.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: Remove dead-code in dpu_encoder_helper_reset_mixers()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/762dd3eb0c0f

Best regards,
-- 
With best wishes
Dmitry


