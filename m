Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EDDA6A3B0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367F310E5D6;
	Thu, 20 Mar 2025 10:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6P5GH3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17B310E5CE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:31:17 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z72O014612
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 36UzwJlY8WygcJ7OC9rF2JL2H8lu5cJBcRlW3DTYlSk=; b=L6P5GH3qx3tT+NHD
 TiiNMbptXd57D0t0G3YIsUuDIonwQJmJCwX0aNydR8tE4PWbCwlcoBrkfozHHCk4
 dYb2ZMwkyq+SSSNYhV443jbyavl1C7XV7eiyXxPCq1TSQj4w4A6SSdvIz3g8sQX+
 D2wTR0YMVhkkU5Y6G/aZhT3IdY92iyFXGxsn2wTAtULWC/aTkP7RQ6iZbfgZx5x6
 tt7AvDOt7BtfWYKR71Lw0lVF4L42nFhfywWuZdgiE1YIE5CiLFwroj47Y9t7C+0A
 r7jUZNqqP7yLmZlJexJO24nL8GoLwD5IbX7C3TfdIww9saMdEs9NB1jXiEpEFrQT
 P7MLeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtrr6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:31:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-476786e50d9so1892331cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 03:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742466676; x=1743071476;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=36UzwJlY8WygcJ7OC9rF2JL2H8lu5cJBcRlW3DTYlSk=;
 b=wky5g1G47VJVwD0+3iAvrL+S2QntNP1Gg3RQExKruWEtTVi1hscQtBmj6k/gsc5efa
 P2qrdNWepHbz8TPBdpQTFD+Fv87dLajJrdg0KXrxCeS4YffQO0Z2gba7Au5NJyMcf8EL
 lIy/67inxYCt5Po3e7SkFDh/gA6+wY44CopD22UjIlZEGvaI3yjjRiRveh1sitjedcrx
 mTBAbtd8qwahxFCjwwLPHvoBToEMOsIrd5xpbofP9Il78Jzu/7pSNwUBdPwNc/mcVRyc
 84s8xyM6wXsWTjOpJrDVGneipiMixZju5kDATasIdRFXYoJCI0DUxHNU52OAitkcwtdu
 c4cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOwCw5OKc9MYOS6XPa0+Y15vHncUXq4kvDvnfntdAcNG91vSjiYf/MnniXkm6HJlJjcnlC/jwoj1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx18QUIHqxQ/OGPS7sRwK5tfMvBhfKtyFGwLjaRSr9HKLVDRrwo
 vs05CXzIi71K2kWXOPKhGK0K+Hj2dinYWD3SCNQBn6OrbVYcKOEMR8kCyJdwgiln7Mmsv6XWw8p
 kMCUiy0pSV3BpSMXMBSrRavkwxYUbH/Cpb9erB4sYhjQrRrjTmHXO7WcYYI11cOLGjQI=
X-Gm-Gg: ASbGnct/YVti+tGuDtSvAiycc8vMywXtpzkJfj0hk60D/xkIMEvTDHBvho6kRUgTtCg
 wBaUkDje15JQxqQhD3PKPlTI9tyHt8w1Bmixzgh+hKKmxMvJrZAhmIlhMP5oPycDwUZANBBNYnm
 FX22RaPXYVP2PHuX7OOu3nEk3lgBgFNIMYTPH7L3xQ0zR2tDf3p8dkgbB7o2c29uBng0K3nxsMb
 XSeEtKwPcOGBFP86dYpls6INABOeJlb/oTa/PIOVqJ9T2xf09BsIul1/22y/6rLi4U/HfJlGFEL
 UeaCwfL4PK6f1TPwOKQZ1rhlOXlUjtn7jxnZT+OZ+UTa9zo41yFkJgQBOuXRQQNgwWof8Q==
X-Received: by 2002:a05:622a:609:b0:473:88e7:e434 with SMTP id
 d75a77b69052e-47708385019mr33204131cf.14.1742466676086; 
 Thu, 20 Mar 2025 03:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIovFeuj/9Kdw2uplzLYek5LaMRqzFe5uQVLzBQNPcEO5ZEu7AMi81ywbHwodwhn2RNco2Ew==
X-Received: by 2002:a05:622a:609:b0:473:88e7:e434 with SMTP id
 d75a77b69052e-47708385019mr33204031cf.14.1742466675771; 
 Thu, 20 Mar 2025 03:31:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e8169b1602sm10459819a12.42.2025.03.20.03.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:31:15 -0700 (PDT)
Message-ID: <f8d12312-dfb7-481c-a025-dd4c6d3aa268@oss.qualcomm.com>
Date: Thu, 20 Mar 2025 11:30:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
 amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250320091446.3647918-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4a-gTqhB7vBbfxNS2ormXYIX-mxeCU5b
X-Proofpoint-ORIG-GUID: 4a-gTqhB7vBbfxNS2ormXYIX-mxeCU5b
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67dbee75 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=98RdHtkJ8WjIMYe7nFEA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200064
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

On 3/20/25 10:14 AM, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GPDSP remoteprocs. Add changes to support
> GPDSP remoteprocs.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..80aa554b3042 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -28,7 +28,9 @@
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
>  #define CDSP1_DOMAIN_ID (4)
> -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> +#define GDSP0_DOMAIN_ID (5)
> +#define GDSP1_DOMAIN_ID (6)
> +#define FASTRPC_DEV_MAX		7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
>  #define FASTRPC_MAX_SESSIONS	14
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
> @@ -107,7 +109,9 @@
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> -						"sdsp", "cdsp", "cdsp1" };
> +						"sdsp", "cdsp",
> +						"cdsp1", "gdsp0",
> +						"gdsp1" };
>  struct fastrpc_phy_page {
>  	u64 addr;		/* physical address */
>  	u64 size;		/* size of contiguous region */
> @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		break;
>  	case CDSP_DOMAIN_ID:
>  	case CDSP1_DOMAIN_ID:
> +	case GDSP0_DOMAIN_ID:
> +	case GDSP1_DOMAIN_ID:
>  		data->unsigned_support = true;

There's a comment above this hunk that is no longer valid:

'/* Unsigned PD offloading is only supported on CDSP and CDSP1 */'

I would say it can be removed altogether

I would also support renaming "unsigned_support" which is very generic to
something like allow_unsigned_pds

Konrad
