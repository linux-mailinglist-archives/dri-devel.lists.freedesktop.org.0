Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11753B0790D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 17:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDD510E2B6;
	Wed, 16 Jul 2025 15:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RR+mmuEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705E610E2B6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:05:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GDjMUF018109
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=c0YU6WYevdund5tkdGQl5yQ7
 OWFC47cHfSxZE2himRo=; b=RR+mmuEQzniwxLrkWdZWkEJngba+lUUiGn3haPIV
 vTIneCiat6EpBqaSeP4lljKwLY5vu1KLVq1akKgQNUcEnwXzKYSl9zBuVSuwYRzl
 WkOzIxlmjuO8otdIcWnFY9AQbLle9+g/+hhHQtC3zRMCr6Mu508qIbTBhdtRw7gh
 kT+LfEuoI4DHvSHIipdtHRLTuH8+emmgxKu8d0fwk70NZiTRQEyfnFwFuUboC+ag
 4ZwL3G4zompsNNXIL1ehq+uHxO6t1RH3fr4ee5wqvkAXmXke8t2qinDPQs5m/ih0
 U40ReDZ/wRvWrh2ZPW0baojWecqJHaY17YlVOJnV31K1Mw==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug384h31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:05:44 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3df6030ea24so63885775ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752678343; x=1753283143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c0YU6WYevdund5tkdGQl5yQ7OWFC47cHfSxZE2himRo=;
 b=hcjH/84KW5kpQsAhN/9VnscLNxJ9x7m6m++8FQePp4i54sC3tqIXE2X+MxNI/YWjlX
 qkXig7d8lGh/dRhi/7kLxVuuKiwQkTVMrscG9DA0cVMSZmWdn49bEzQyRuMenpS1ZeXG
 evhfzYRhXfL3ukf3QsFzbeXiPQs90gFv+Ds8xuyq3H72o9Rpm5k0KXQfTVumK9NEzXOw
 LnNDOHxjx4tJ3v0qEjWr65I04rO/F2p1hYUk36/UbQN1sc8sBnwduBgOs+cjcGHquKhH
 jx0RGR9QML+cvWtPdKPFtAeKEBkVBSewSSH511esNoNiuxjxjTbDu/jdrr/PTLIah0Pz
 FLZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt/n6LGRHwgFxKvGzuaEX0rKlft0Do64vrGKP3GMFcQoYp9M9o3VveKssseJNS0gGX3tV5DsLHGvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzG86J88W40iPqPSmt8vRV+NhHQ/MgBXmtyLGQHU7pAp27HzXxH
 /PyHRuimghuAnpcfixen2vnOFQl4SKNL8qeIgu7PwRhYFIzrmnR/ASTM3wxuHq42fs4QZV/EVaT
 kGM9QF8x18d3fQMCWo35xezSI+/DN/NI866TolgLVA+980tq190Lyn785g3/O3xNaaFD5DOk=
X-Gm-Gg: ASbGnctXjaj4E4LEEMR5lMUpi3fUZy7KigaRQ9cZFobXWFqh9E8C3H+kLMl7DbuHA9N
 P0m43IWDd36UYpj1Ept8dAXIMPFj/s1GE2Xh6SH+jqzGGfWaEg6N9xSYzavZ0QhpqscjH2TdPNW
 bTPaq1sD0cB/UNL9UBD4clIB0Vf/KMFf9f5Ki8j+oQhwKiHfa87o5Axmiip+RStgbhGG2RoygM7
 3j2JllwNLLiqfiAuMM9DZNyungCFSPG4GZ6e0yYHYaB8yMP6+fV4y5PjPT1OxPWkxotnWKpKFu7
 uHkgPClEpLWGJ3fuJa1t7A7Nn+mgzwetrcB8gFsLflBPfZzHME7erSWFf6sLXM6DduDQ+zVOKMp
 n50yNhJBLE9vnuNel583OcIxXSTFxi5p7VNHiMSYcPu6et8CcLV3l
X-Received: by 2002:a05:6e02:2687:b0:3dc:8423:5440 with SMTP id
 e9e14a558f8ab-3e2821f490amr29394315ab.0.1752678343429; 
 Wed, 16 Jul 2025 08:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiQxVLfGJyjdQolHfpUghz4La4xIzw45yLU/Cq1KVO6NC9WigSlhiSYSteODSSlYkMMHWrdQ==
X-Received: by 2002:a05:6e02:2687:b0:3dc:8423:5440 with SMTP id
 e9e14a558f8ab-3e2821f490amr29393835ab.0.1752678342895; 
 Wed, 16 Jul 2025 08:05:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b60f14sm2710525e87.155.2025.07.16.08.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 08:05:41 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:05:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v9 4/5] misc: fastrpc: Cleanup the domain names
Message-ID: <vvojztwx4bus6tpgcj5s2uzy6pfrmoj6msdjmh2kq3ym57e7pz@nxnob4fffyzk>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-5-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716132836.1008119-5-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNiBTYWx0ZWRfX8IaOYv12upIR
 qdceO8E2aX1Ta3nkMGQMMK9/vqDCDWnvJ5UKu58sqwmQTyD+Twn1z+ezcApk15QHLGl+RgkxVPf
 qbgrHIMOH6XlorgKJroX3I+vp2iibyIfhm6FFM1nx5Mg6MYnAQefVjh87KsZdjTT/WrgbyFCfhX
 s4byWpHJ+IdSfvIlR5JCNbzg81OQstQEvZPy5mh9z7ycGTHRs12lcEH9TQ40dmnVhOLyfKR5Vsr
 3AalCgR/qwoMGGbjgtzK7PSBSQJHXYQ8qf8avaOj4AoEcpeRsrT61jSnhXM9WTiMcaLZeMHNP+W
 kmAjs0pw8KapT3ywLe2/NkX5NxfeFIPFLTyXK2UR+ZL/7zjgVR6whNC9ksjKq2H+LSuFlc9jvui
 +bJPM02Cn4VUOd6fU+TH63fHTaT3chDomT62qymh1mNmBLsWqMeJLRbDkSWHoJ6/v+sZiexk
X-Proofpoint-GUID: TpgkaTOVc2MvscSAWRyBMTZ8DSb_TN6a
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6877bfc8 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=7U_eyDcXjddG1dUirncA:9 a=CjuIK1q_8ugA:10 a=8vIIu0IPYQVSORyX1RVL:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TpgkaTOVc2MvscSAWRyBMTZ8DSb_TN6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160136
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

On Wed, Jul 16, 2025 at 06:58:35PM +0530, Ling Xu wrote:
> Currently the domain ids are added for each instance of domains, this is
> totally not scalable approach. Clean this mess and create domain ids for
> only domains not its instances.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
