Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A0DA75B9F
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 20:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC3210E33E;
	Sun, 30 Mar 2025 18:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtphLaGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4B510E33E
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:00:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U7H34f031778
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=24PF3SFV4aF/I5PNNy5sUXlk
 8zbFgRz6F2wRsCqGfKU=; b=LtphLaGgomv71Qud1M0r1gRUMFeNIETUSYHC2fEO
 ugMClcLtJzYVfC8oxCxaBuXAa+/F79TexG9/MbnrbhZYSv82oLMH9jleqUDASwa8
 4du0JCExkXIul95b5LYJ6Miej/x3ISxQulAQ8pjhho8N1eMS/wfmNLj2IJK5SF1k
 FUQ49j7XpurpyF8/ihBpJbgTkX2s70t2Cea7QJwA3jVJRdhgjuA7AsOqWhTwiL+S
 Q0DkyaJuVpCLe4tfsZ42h0oew3svMBrfKoyWHElrqOnQ9etZNf6f2LLmrjeKQcHa
 b3tAPJ10f+txRFE6/Sw+YJAPbK+ObxybrMCKQfxM38nw4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8f1ambc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:00:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5ac559cbaso634471885a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743357607; x=1743962407;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24PF3SFV4aF/I5PNNy5sUXlk8zbFgRz6F2wRsCqGfKU=;
 b=jkIR/rmwU+T4c/j2TlkN81vNcVL+FeENXO9r7A7SfHUey1ILWA8xucDhnzdzB4zuTq
 kVxo+oYRCojILYIxbft8wgD7TQ1bkRTMDyD2qDG34TDZrrJtk4pVl+Lf9+RsT8XnheRJ
 UTHs0K1czlK0FEjswluWquKUAR4vPHtrljhpvaW+eJZBd3zwYrC38mQ1KBlJkwM+orZ5
 UheNTylqErs5ucvqsLAs0EbqkYwprQExtHrCuWP7O1ytvBnmQwfGCt+9bzrTNWESwJy8
 9SZfle5ze5Ybkgo7GM9r6em4uO4yZRwxuI+8Kevnmjm6Q/uYbNPOGNI4QE5ELGerXvmx
 6KYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5o2avYsB5UP0+BnsId9eBzBZulzJslryZjRXgisRqVRP/fp1SbKwDvEpY/TEVX55eoSEOAapKHGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEa2chYPtGqtt3eb10bakw/or58plKb1kNysCTlST7JSJE6UQo
 MbS+X89orcAHiMvLa4Do5uqw0l01dMQRnlh3yhlfEFjQTflMQaednWDZICdEEvwS8CIEW2bdxEW
 vf19xGJ5NyMqW/CEVMkeTc++dPhTWsZSHLndhJOQDmf7QOwvSAyafVfV+9S/dtqiv+4E=
X-Gm-Gg: ASbGncswYeh9+OB413oJ16SgnkrB9+zZDEwS7WOD1rQBWg1blZUrW5eZtoJI/k9z3J3
 HHCOgf3mwofKD3VnBLRf2IoWV7W+rV7beR9i3bECMhoKHC80eXSpr8OoO3ZUjXCEU7y/7kp9Ob3
 wgBcLmvC/JIh6gS5s2ObOJ5Vpp5dZWDz5eId/e8IsRVQoWkf2+zFyDHn9akokmkyLYQW4LyWxPQ
 guNFDZuwTRaRvqpSSak9GFpBMIjtwlyC0E7OkF22PK91vDInGDr8gOgRvpe6u9BOYxWAhJ4wluU
 /fIHE0iLKAvmQUqXlF4YrODtvCiYPZO2VQ7nPyWlUimZllprQoPKUkohlWeRjMm7T/pLwnlyh+E
 IGx8=
X-Received: by 2002:a05:620a:2589:b0:7c5:a25a:f0f3 with SMTP id
 af79cd13be357-7c6862ee9dbmr1121948785a.8.1743357607152; 
 Sun, 30 Mar 2025 11:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtqc6KixdPi8yajOw5HWSKDcoirObGS36mBZyNv/+8GZf2e3lwFx6IqpQQ0J7cxSsk8ShQWA==
X-Received: by 2002:a05:620a:2589:b0:7c5:a25a:f0f3 with SMTP id
 af79cd13be357-7c6862ee9dbmr1121945285a.8.1743357606843; 
 Sun, 30 Mar 2025 11:00:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b094bb32esm945700e87.26.2025.03.30.11.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 11:00:04 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:00:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: dw-hdmi-cec: fix inconsistent indenting
 warning
Message-ID: <bz5ceiwgnmmk6lfj2oy4b6hvgf3rmn5llx55ircwq5ykmcd26r@pbz6bcl73swu>
References: <20250325074654.3669-1-hanchunchao@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325074654.3669-1-hanchunchao@inspur.com>
X-Authority-Analysis: v=2.4 cv=AsDu3P9P c=1 sm=1 tr=0 ts=67e986a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=F_93P0QhAAAA:8 a=EUspDBNiAAAA:8 a=DgU9KTSelz5mwIVLWmMA:9
 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=v2fne3mUlQEKA94IZ0Od:22
X-Proofpoint-GUID: aGfiiPDW68dU7dY-gm68qSHSie2bobij
X-Proofpoint-ORIG-GUID: aGfiiPDW68dU7dY-gm68qSHSie2bobij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=769 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300123
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

On Tue, Mar 25, 2025 at 03:46:54PM +0800, Charles Han wrote:
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c:336 dw_hdmi_cec_suspend() warn: inconsistent indenting
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
