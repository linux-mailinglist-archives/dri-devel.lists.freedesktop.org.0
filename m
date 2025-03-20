Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAF4A6A0B6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 08:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA4510E5A1;
	Thu, 20 Mar 2025 07:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2P9OlCi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AF610E59F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:49:19 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6YuLF025032
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Y0yS+aQTmw0yZPeMQpU10U+O
 l5ONqbJCFVaNlZvX0Gk=; b=o2P9OlCiXeHE6JsWF/dFuB3V7cPQzgELmd31K2w+
 hmIx26nP5s1F6VyAx4ubc6xddl6g0MaF/B90uDIW88GTHyTIdFBeM0AWDWQNxvld
 F998F7Ocm+DgCTGi3ac3YNUzLypE4t6YhXWVv5GxPMTbs2dnIwJ8sh+i8jwL4xMC
 lDpj21sj1WaXEjpVImH51hwoekyxY+W10Tvbe+Tgjr1USNmhWxFTk6fq21ECzCWj
 OhX2cpP/gqpyFZogTBtZdLmEgvk1EU5vpKSQFP4Tm0Ni8j9424M8OQETh69kQp7g
 qxW7W/0pj2DM/GFpqJkrJ/2AA7CZH0jzrMtQDiFutN9V2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbnggg18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:49:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c09f73873fso97435985a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 00:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742456958; x=1743061758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0yS+aQTmw0yZPeMQpU10U+Ol5ONqbJCFVaNlZvX0Gk=;
 b=jeqLe7Y8rBiEqKa/KfHdLuE3XamDYaCZz++HwRalNxbnKluzIHdiVanxPb4hc1R8dz
 Zjfu+zPYnxWcOhBW6OCLwPhfEKd+4iyr6nZHvEhUYDzua8ECHlqBQGcDTiGl0dNsHJwx
 xLiVbVW1PA+XkDwMA/KZ175+xN6L4gXvAxelSd+owdg7H7BCh8trMImL6otKPYzOu+/b
 DUvYlXvvo4Dw6JWUw1omc+9Apkc2r/1orKwqo9kvmdJdGJ8e1+WTQ6Ry7cTNlToef7TS
 c8T4pxCQ/0FMrvk1prDMzLkB1C4CnDpQuQVyYDW5T6vUD+EvHCbKnOs5pYXoJqVE7DBi
 NG8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+JVdX5AaoK+vGNW7qk5jjaxzRLLU6v7jcSSL43YdxKt2FwVV4mluyIS4k8z+B8gzT9dc25Pf0D3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXDukEtWBYrh+M5PiQtRP30X84H5HZxaYjbKXs92YD6BUlpolR
 cOQ32CiuXDsGhne0U7PEHH3O0kB7qMZT3y7KIRLStE/llCV4ZBWA5TRG5qAXu3JAtRIsr6BNBKq
 vhSw7BO/U2xpDyMFOTjsxDw7YC7MrrgG7nG03hBhQnAbePPwm4RRk1GF+roOwxogu9vM=
X-Gm-Gg: ASbGncsuRgwLzFf0kOKNuFKIf0rCk4CDll+Z9zv6b+7SbLCAAe7d9Wi+WeW9DmJzao6
 XbeOUkZmpViUJcXHsaRlzvVZ/iLte2reQ/9e+p27orA0QP3Cy379N4E3qF0Xwp7LVTriAQImNpF
 5dIR8j5hVZRb/4FbBmPqsTwv8bRCaDduZhW9nmtTriRPKc+IIchgbzFFFZ3PV8HJyY0uIbcnWek
 t1/OrNvUmaeb/uGQmL8q/WoI/sAqm61OUmuvnhOOGBdzfHybDMxk+6ogCXMbidTBQfZrKX5KmQz
 DOoTAzbrCVsjIbG8crCTutnloRoUKTR8BzxqUKbTRxhpYxNvj8Jhbn4kZtYPhkKwzThwsAxvCUD
 i2ZU=
X-Received: by 2002:a05:620a:1a90:b0:7c5:5343:8c2c with SMTP id
 af79cd13be357-7c5a83d1517mr790765585a.27.1742456958024; 
 Thu, 20 Mar 2025 00:49:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Z5BNkfpKh97ly69kY/44WHPpgB2U+BPmvSvPMFr6Be++EdmzzYicH8E8wyVmOTRhm/ENMQ==
X-Received: by 2002:a05:620a:1a90:b0:7c5:5343:8c2c with SMTP id
 af79cd13be357-7c5a83d1517mr790762685a.27.1742456957653; 
 Thu, 20 Mar 2025 00:49:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba8a8bf7sm2122917e87.223.2025.03.20.00.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 00:49:16 -0700 (PDT)
Date: Thu, 20 Mar 2025 09:49:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] misc: fastrpc: add support for gpdsp remoteproc
Message-ID: <3zrwjody6ffirauzrtcmvr4fp6nx5b6eqkt2eyt7nxm4jfwjn4@pceeisasgxqn>
References: <20250320051645.2254904-1-quic_lxu5@quicinc.com>
 <20250320051645.2254904-3-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320051645.2254904-3-quic_lxu5@quicinc.com>
X-Proofpoint-GUID: uROycswF5SKkvQi7ZsuzCKMbpRv0u0i_
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dbc87f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lc4KdpPQecCvDiYUKO0A:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uROycswF5SKkvQi7ZsuzCKMbpRv0u0i_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_02,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=876 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200045
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

On Thu, Mar 20, 2025 at 10:46:45AM +0530, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GPDSP remoteprocs. Add changes to support
> GPDSP remoteprocs.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
