Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271DB03B56
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46A010E441;
	Mon, 14 Jul 2025 09:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3B50jnC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF0310E441
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:51:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9POnH022449
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zDAy+8JMXnCcqEc5qlHAUScV
 Nrras9+1OoX2usFWe5A=; b=H3B50jnCqK8QLLJLJVMXL6ZuFgcTTQX1Fi8K50w2
 azX3au9Qgv8MnqYGs6H367PGBzIVsbppwVjCy70j/thcmif5S3YHFHJMu5jikwWl
 wYuLBgFxnnxQ7rBAT5wekaDhGOyHDnximS4OJPDDlFKNyeWAamHWl3nWisHvHwGr
 i/lzIIr8EGqhb3sxmwtHK3yiMZt7FEmpvj1310xZ7WYQ0Ac80xy97oPvZp7ijTZT
 uc7neMDNg0iuqwBRWmbg8OYFBkqYma8gaZcOLFS/iiUwk+6PxSwFbT6G/1nBq2aw
 OuEr9Rxa4ID+YXYd370CiuGy/0wdhxvgZCC2OVQnxcts/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47v56a2mxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:51:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c955be751aso677061785a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 02:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752486677; x=1753091477;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDAy+8JMXnCcqEc5qlHAUScVNrras9+1OoX2usFWe5A=;
 b=ivIoduJxz5ToIpSPtMvC+3wMEMqVQkuiLR+IeKuF3/EEJWyY2+4RK1g8e910DK4HlG
 5+oNy4bzsIc9+3sE2ZWFWlI+Kcx8nYylYv8uPQFBJtGEnsfQk+2V0zpH/bVAGb/urOlw
 HGWODmtktNQ8dNY+6W7ZsqVKMlXt4tVtubgJ2PdpxQMVOk4prDn0oPoiBPLVad+G1i4R
 +0NYM10inJoQwwG4+DYqdjWZid/FSTSjdeCDmacq0byaO7fEOLQmzpbvtMqImLd+45sp
 5whI2dmfnHiyVheeudZZCkttymkwKxwI3bfQYf2HZtDEv0d6ypttMwkWgpJNQkUyqbFU
 A2IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQK9MRJifxJafNwQvSuyFPf/MJWOzkeSzCJnVw1mKbtjTQDs1GVZEoVSt4kHJciF3/HWE9kI7up+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKzNBskWfhhBDebmiVN0Ahr9D9+OJXGsCkcOXP1BTZFsObbgtx
 EPdyUleZ7IueszmJTgbVW8halVr6srOcaGN9cwnu/FBnifbeK96mDl5rhSC8jInmuZVgrT8/eXd
 1t2RojcAKB2Ead9XxvorK3+1tQ6+bx5ziBBiNtWjBu69f4MuE3IcRA4zyEwK70J4pEvXgIDM=
X-Gm-Gg: ASbGncsMBas8rQr/VmIEYDbYUDN8oCsmySJ5ibU716fYOlp8uTa717pxd53Xyh7VfrL
 pgVqixxoYBF4Q7R12Z4rzWsc35HgnHKSzR3KMmI9IDQznWOjWrEesaqtY/EGVDTs5Ank4FJQqYC
 197/BT2iQpM6HXKMXGp4vf5tDAUGIgWj2yYTLxvH9bfeDh5HOKJQd6lJYQ7AxZy5rvojdoH3nDV
 G3ZVkt+1X3OpE+EzsstGGl4K4PEGsa8+HMcdKWB5NgSDdD0JDl9EGh1LK+ErjNJOFRZKyNrDRS+
 WSyju8ODGzuWGf0BnFVJLQahYKI+KLmZ8+NkKvXaa2SmWZp5gl6ZYhlX7t8exocjVoZyTgypT2W
 jl7nlQNET0bjVVnpQwCNum64pT7pPT8kaQKQ6N7/VY/7FIijAhe/u
X-Received: by 2002:a05:620a:284e:b0:7e2:971e:2d4 with SMTP id
 af79cd13be357-7e2971e054emr438467185a.52.1752486676758; 
 Mon, 14 Jul 2025 02:51:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHthfPAqTZotjtRDXjX6wM2Y7J98pizOgCzVKNQFLOI4EXwa/DmQvYD7qXZd4s2ubpszugA7Q==
X-Received: by 2002:a05:620a:284e:b0:7e2:971e:2d4 with SMTP id
 af79cd13be357-7e2971e054emr438464585a.52.1752486676122; 
 Mon, 14 Jul 2025 02:51:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b6077bsm1892665e87.152.2025.07.14.02.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 02:51:15 -0700 (PDT)
Date: Mon, 14 Jul 2025 12:51:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v7 3/4] misc: fastrpc: Cleanup the domain names
Message-ID: <ocmh535z7oaew6wkyeukadwlu5ublwixfbl6ljxtbdtwn7om5l@jeysqqphcm2w>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
 <20250714054133.3769967-4-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714054133.3769967-4-quic_lxu5@quicinc.com>
X-Proofpoint-ORIG-GUID: KwXhhZm8Tm9L-zKZ8YdvdlGT5uppIsxs
X-Authority-Analysis: v=2.4 cv=X7BSKHTe c=1 sm=1 tr=0 ts=6874d316 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=YNof3K1rMo2TS1Uk_EMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KwXhhZm8Tm9L-zKZ8YdvdlGT5uppIsxs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1NyBTYWx0ZWRfX4sdZ2u5uMoSd
 DphRn9+9jAAicyH5JXOvth8g7FWCbDGhi87PHrFRJpqvCDVTSNMqGGSKrbdkjirnbtCAGBBZP7e
 209RwzIr+UnFSttG4Uo/wdmjqyXmTbJ5uL3EAs8Gaq5oZLeFk73lvcLfWSHVVAQvD+pCsEGeXLv
 KTSTTFujeR5Q9j+TDj4hzsy3T4fsSeN2zlTHHRMTBfET8memYPGOeQkzMjjoDATlMpJ7dTAlOWJ
 NskLdQle6y56STAF3ueQsMNymKy83ze+Om859Zn2k1SAWuj/jyQXDaW3N6nzNV+bZ1WECm01zkO
 HNVQ305MDjEMnugkIZaBCFqlW4hlUpbR9eJh8x+b045ujPUUrCxw4dbKedclbC8if/2GfcMITqn
 13B6nTonMh0yJJApxj6nUQMg2UntX63pwm6V5YCe/DUYGVt9YGRnh7pWUXq1WbFB9rJPZeh2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140057
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

On Mon, Jul 14, 2025 at 11:11:32AM +0530, Ling Xu wrote:
> Currently the domain ids are added for each instance of domains, this is
> totally not scalable approach. Clean this mess and create domain ids for
> only domains not its instances.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 50 ++++++++++++++++---------------------
>  include/uapi/misc/fastrpc.h |  2 +-
>  2 files changed, 22 insertions(+), 30 deletions(-)

Please separate uAPI+fastrpc_get_dsp_info() changes to a separate patch.

-- 
With best wishes
Dmitry
