Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8958FB082F6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 04:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01ACE10E3DE;
	Thu, 17 Jul 2025 02:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XA8hbOiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A1410E3DE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 02:28:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDbVa028060;
 Thu, 17 Jul 2025 02:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MR+6vPYWyjYH6quX5DhPZ8TCLLZmBbWAhKB7215cWiw=; b=XA8hbOiB82Wso2WW
 anox7IoFeZ8quYL1dXXCOWyfvaU4cMijkJtlZNrre7OKgcKMxfoQwGw96alYdMLO
 XBOS8UY/+4Ig5/2lZHkwJHqG/kTCp5V+8xOXdWPuObPPBxLPvbGbNtil6d+sdkL/
 PGmzRA/nUp4XjgX9RfCjrO8+Yp8cGAuzN0gfFTGSxSBioDPdLgQrmfmPwiKCy+6R
 TdnZ3p2iJ8wTPaKz5ABAmzVCfCGqfK8jevFR6BECPveG4DZylFOU2v0B27wOY9Cv
 afkVtJ6WFZ4DosJYLO22lNQt1QUu2pL9rDyIlrFgbbomZgHhOIBgVg+XEB0JhdhA
 74vrgg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5x8hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jul 2025 02:28:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H2SnlU027930
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jul 2025 02:28:49 GMT
Received: from [10.239.29.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Jul
 2025 19:28:46 -0700
Message-ID: <95541f45-141b-49c9-9b87-1339ee4b436b@quicinc.com>
Date: Thu, 17 Jul 2025 10:28:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] misc: fastrpc: add support for gdsp remoteproc
To: Bjorn Andersson <andersson@kernel.org>
CC: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
 <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <quic_kuiw@quicinc.com>,
 <ekansh.gupta@oss.qualcomm.com>, <devicetree@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
 <20250714054133.3769967-5-quic_lxu5@quicinc.com>
 <qg7uvhr2pazrjqrqyraj7pr3hxbzadhenbkps7q4uqhilao2o2@653xyxcx2iak>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <qg7uvhr2pazrjqrqyraj7pr3hxbzadhenbkps7q4uqhilao2o2@653xyxcx2iak>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=68785fe2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=h84wDYtV-xP7E12sg7cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rKSpd3sO7HxdUIC49krv84rhoD7AmRB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAyMSBTYWx0ZWRfX3DYM+ni93c9S
 2UIJe9fSbST2hLJ3LzwYM898NH9kM8yH1AsWnYsaA+E3NQEWMns5Cep88MD/ZeFgVh2CU5JXiS6
 L+B5BSMuPY5mMJxvQdPMna1NYTxLfOxjqWb02K7eXZz1QgYcqRHbfXAD0Z0qBN+6hlnHjH3ZGUl
 zfZ1n223q5YKrE5pxlf34URFlGPWnZ4FAU9AG3kMZt4eaTrM9KyPW1sQRHYTjxCeok1g1E5db6O
 Lsc/H+uHCVwmi37xyk7aBmvtMcfdB6KFlvKYhzquXeVnmC/Gz+xR6GNwRCXIkOY1ic+tbXk7H2K
 xaMjVtyICYUY88ocKMXs0sEwl0TWwe2aB7kLmRhwlONvNcuSQPSBvIjD5BJIN+s08FJ4petyvtA
 oBgqG1zWdVdJcYuDI5fAOXSbqN60PC/DsrcPABcl0fAOGsNP+k/JSx5cCIxstj3346TXCnEF
X-Proofpoint-ORIG-GUID: rKSpd3sO7HxdUIC49krv84rhoD7AmRB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170021
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

在 7/17/2025 3:31 AM, Bjorn Andersson 写道:
> On Mon, Jul 14, 2025 at 11:11:33AM +0530, Ling Xu wrote:
>> Some platforms (like sa8775p) feature one or more GPDSPs (General
>> Purpose DSPs). Similar to other kinds of Hexagon DSPs, they provide
>> a FastRPC implementation, allowing code execution in both signed and
>> unsigned protection domains. Extend the checks to allow domain names
>> starting with "gdsp" (possibly followed by an index).
>>
> 
> This was called cdsp1 before patch 3 where you removed it and now the
> same id is introduced but this time with the name GDSP.
> 
> Iirc there was a cdsp1 in SA8295P/SA8540P, are you silently dropping
> support for that here? Or perhaps just renaming it?
> 
Cdsp1 support is still there. It's instance of cdsp domain, so we merged it
in cdsp logic.

else if (!strncmp(domain, "cdsp", 4))
	return CDSP_DOMAIN_ID;

In fastrpc_get_domain_id, it return CDSP_DOMAIN_ID for cdsp1 because they use
same deamon.
> Regards,
> Bjorn
> 
>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 85b6eb16b616..d05969de406e 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -27,6 +27,7 @@
>>  #define MDSP_DOMAIN_ID (1)
>>  #define SDSP_DOMAIN_ID (2)
>>  #define CDSP_DOMAIN_ID (3)
>> +#define GDSP_DOMAIN_ID (4)
>>  #define FASTRPC_MAX_SESSIONS	14
>>  #define FASTRPC_MAX_VMIDS	16
>>  #define FASTRPC_ALIGN		128
>> @@ -2249,6 +2250,8 @@ static int fastrpc_get_domain_id(const char *domain)
>>  		return MDSP_DOMAIN_ID;
>>  	else if (!strncmp(domain, "sdsp", 4))
>>  		return SDSP_DOMAIN_ID;
>> +	else if (!strncmp(domain, "gdsp", 4))
>> +		return GDSP_DOMAIN_ID;
>>  
>>  	return -EINVAL;
>>  }
>> @@ -2323,13 +2326,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	case ADSP_DOMAIN_ID:
>>  	case MDSP_DOMAIN_ID:
>>  	case SDSP_DOMAIN_ID:
>> -		/* Unsigned PD offloading is only supported on CDSP */
>> +		/* Unsigned PD offloading is only supported on CDSP and GDSP */
>>  		data->unsigned_support = false;
>>  		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>>  		if (err)
>>  			goto err_free_data;
>>  		break;
>>  	case CDSP_DOMAIN_ID:
>> +	case GDSP_DOMAIN_ID:
>>  		data->unsigned_support = true;
>>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>>  		err = fastrpc_device_register(rdev, data, true, domain);
>> -- 
>> 2.34.1
>>

-- 
Thx and BRs,
Ling Xu

