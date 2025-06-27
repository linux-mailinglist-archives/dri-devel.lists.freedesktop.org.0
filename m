Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0773BAEB79E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 14:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8C410E325;
	Fri, 27 Jun 2025 12:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJ+fTgri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A4C10E325
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:24:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBxm4T001166
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s359VO2c+0FspQeUv43Wc4q+xg59EC18GooK4d2/yKI=; b=JJ+fTgriwz0VWkD4
 TGhjLeT5Fj0T/hdUlqKJxpqS93Kdt55rHzNGtr1voxPIiE+NS/2Jk+ucHeKGkAP0
 jJtSB/OHtE5OoGPDcmPMaE0s+htPTehJNfUutP4vX36IXg4j+fN5Sp1j55bm5ZTy
 hiRkGkaRVkst5tCRpHlTtAr2jQ9P0GlL/XePwNrMohPpxYiJ47bFUD/p19Vf472l
 kv9u5u/ZRnLl0wfeH5W7BxsWO3O/3S38jmVUWbQn0k2p36dq/50+/BXHyBj5OSOo
 Rw8+vMrIqEbYO1skNEx0pso9FKTsKWrTLvnN5EjFzllpKzBjgw4L9kJgUON//uQb
 xOTWCw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdgta5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:24:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fabbaa1937so5129526d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 05:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751027075; x=1751631875;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s359VO2c+0FspQeUv43Wc4q+xg59EC18GooK4d2/yKI=;
 b=nwOlOndbFj7H/hx7zBSyQdDOSDLLfaDmiDQ1mTe3VTovPg+xQ4m4EyQMIonbhdSdb5
 2ysRVjObnHdRje0JF3OqMmw8p+Gg2e3rWklS+dgtbU/g+/FN8Fr+cS45PAIlNRLnvY7J
 UxUjBt4XyzJt0KooevCrENIxZ03Dn0BgnX6q4bOD7X7jUbcbQ4w8veXZfT4cqvhGJB4a
 jezydKax6swM/l9fQ27Dk2lfHwVCbrQtylprk9l4tSf8bNKsxj+2qvPLlfPDbcBwE5rk
 x2Jot2+G843CiGRsIn1z5g6AcRwuWyREmXZU8gb9aOFkDvfQs6CRCzuB8u8+cgeacVBL
 aeRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBucvZ6VqcoAH/50WGE7NeBqZfvGLhN2h8T1Ka6qoeBj22yVSvjwSb/XKt+rkRXa5Apf3TMBSajBI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvZlN4I9AUMEkmhOvDDkNyVhB7Y9amKqi5JgKWPPoK+UbXR5ap
 eZB44MKAiGYBxrJW5M7PYHy06bvf1Eg7brcIqn1SbAlGY/6UQAXsiGZhNNq1o10HP8deyOL9ALj
 20Zd0wrSgZB6Xjn0GFP1NN1JkbjPx2C2FsiT8bB65W/5cgKtTn9beSHG+2Xa9txqTeCEgpt8=
X-Gm-Gg: ASbGnctsLVsYqsxZ2wuICfkL7/QnasGKK3dK/a9tdAyey+vCYrQnENslME6vNOFmUEN
 Cb9f3TYzgULnDORBCVf7Dmodvf84a9En6tRdD0hs9fjHQj3zhcvbvmmsSO0EbEIhFkX5Ho/ufM0
 7YuyoB5+opPQkgRRR5WluihN9w63eUUBTvIKVFrqaHrf8QNg1CMOJ7+Z/lnGov2rFIfklVhZaeI
 xRWQyDB5dysTvLdtMxizwXdQ9qokLkVtKJEM6wGMQcEq1iIkVG82WRb8UxMQr4eX2fXLj3cfAKg
 1Mh8Jdt8t69Ir6BEt9nV6JkQ9P5MYkB6V3hwqPX/BsdYGOdX1brU/HVNUkOUdeMla05l67tkIeC
 Hrto=
X-Received: by 2002:a05:620a:4246:b0:7c7:5384:fa53 with SMTP id
 af79cd13be357-7d44390b20emr177134685a.6.1751027075597; 
 Fri, 27 Jun 2025 05:24:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsSUCqkTzzrlWtIzSdcUw7WLmyPY4ovmdYHMj3uG1ti1i0AkcXeiJFafPFnHDPYcpyfxkN5g==
X-Received: by 2002:a05:620a:4246:b0:7c7:5384:fa53 with SMTP id
 af79cd13be357-7d44390b20emr177132285a.6.1751027074979; 
 Fri, 27 Jun 2025 05:24:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c6bfa4sm114300466b.139.2025.06.27.05.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 05:24:34 -0700 (PDT)
Message-ID: <b67baa5a-dab5-4fd4-b789-b1294abcf4bf@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] misc: fastrpc: add support for gdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-5-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627103319.2883613-5-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685e8d84 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=z5t9ctGjsfNMbOfKQ0kA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMiBTYWx0ZWRfX0m9S4u6tp1TC
 LXUIDDrJwwce3NqRsUUGsslEXyuLM+H3H1pMzRlRPRZkzSTTcIsXQg/rkP0rPPTrKiiTKP0Y6v3
 4szI1Nb3H+B/cxez/ftTbCsz8L4lBHGjN121/VgfYBUKJFLQ17MJju3+IV9r/15EpIzMW+N5JdG
 smdFNTaDQEjTrDMHZWB3lWhXxqQUIJIjcJQZiZCKLYhSe6TIa63mbNoe9NSnab77LW7fS1QhwnJ
 ehPiJxLbcPNf2lQRXCum1Z/azbumCGlQsUW09lpex+J76+7/3pb5b+6uFkrE04L7dl8W1lAcIO3
 qnsIImFr+jho+58Toc4TS0bADGrazLsvhC4cAOr5tv/C9oiVPc4xN69gl0wUrbaCjfCasJx+8MD
 lP/E5CQydw0DE/g6b99ziZ/X/YBBXi3jfj3tL2yNJobpCig1tlv+JPS2a9GzV0SnHWsVWj/Y
X-Proofpoint-GUID: 7Nug16uq3_8aGb9PAa5p-177cNsPMb6o
X-Proofpoint-ORIG-GUID: 7Nug16uq3_8aGb9PAa5p-177cNsPMb6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270102
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

On 6/27/25 12:33 PM, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. GDSP is General Purpose
> DSP where tasks can be offloaded. This patch extends the driver to
> support GDSP remoteprocs.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 5 ++++-
>  include/uapi/misc/fastrpc.h | 3 ++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index cb9f4be286af..d3d9b9fdbf4c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2245,6 +2245,8 @@ static int fastrpc_get_domain_id(const char *domain)
>  		return MDSP_DOMAIN_ID;
>  	else if (!strncmp(domain, "sdsp", 4))
>  		return SDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "gdsp", 4))
> +		return GDSP_DOMAIN_ID;
>  
>  	return -EINVAL;
>  }
> @@ -2319,13 +2321,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> -		/* Unsigned PD offloading is only supported on CDSP*/
> +		/* Unsigned PD offloading is only supported on CDSP and GDSP*/

missing space ^

Konrad
