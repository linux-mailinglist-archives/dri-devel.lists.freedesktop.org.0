Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D107D9D9A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA97010EA03;
	Fri, 27 Oct 2023 15:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B84110EA03
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 15:56:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39RF0Ckw018386; Fri, 27 Oct 2023 15:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XxumpuJmRujqyONyQQz5Dd7Hu8NxYtE3hvUKuonnsuA=;
 b=BZ6g3nT5cyQJkxJ1XCCTXgzVP+PtBx5hFe90rKNhhwacRcaeo+pXQDRKoHxlbxMLb13c
 3s8rDJjvGPghqE++D7fzRwXxrYtgGGPQIT+KIBwceBeMPYevKxDJsLGVeaOOtnEGFH9t
 u7d6G2vNStfJ/2Bw0kQPQAufEujM2PEjelLB5cD6GrHBO3ezwNn0jXMBBPwLrllFekwd
 pejeTrFlpZ4OiULPzPIP8V9xLzmTTmFDt5C+4T4/YWK9YGQI5/VkNOCVouY4Fp0Kndsn
 oU5POhwObw837ZcCLz1zdHMYhzf2YghIlftc0geykBjAozj2MGMjwgvhJY4xu21yJMMf Kg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyx4wtfbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 15:56:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RFuInf021361
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 15:56:18 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 27 Oct
 2023 08:56:18 -0700
Message-ID: <ea7f626d-7dbc-c601-6dfd-ae46b1c641ad@quicinc.com>
Date: Fri, 27 Oct 2023 09:56:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/2] accel/qaic: Add support for periodic timesync
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20231016170114.5446-1-quic_jhugo@quicinc.com>
 <20231016170114.5446-2-quic_jhugo@quicinc.com>
 <20231022110656.GB704032@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231022110656.GB704032@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Ay6nz8uyJrTi1vpKLUQ6QGyBp8Cz7R-L
X-Proofpoint-GUID: Ay6nz8uyJrTi1vpKLUQ6QGyBp8Cz7R-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_14,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270137
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
Cc: linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/22/2023 5:06 AM, Stanislaw Gruszka wrote:
> On Mon, Oct 16, 2023 at 11:01:13AM -0600, Jeffrey Hugo wrote:
>> From: Ajit Pal Singh <quic_ajitpals@quicinc.com>
>>
>> Device and Host have a time synchronization mechanism that happens once
>> during boot when device is in SBL mode. After that, in mission-mode there
>> is no timesync. In an experiment after continuous operation, device time
>> drifted w.r.t. host by approximately 3 seconds per day. This drift leads
>> to mismatch in timestamp of device and Host logs. To correct this
>> implement periodic timesync in driver. This timesync is carried out via
>> QAIC_TIMESYNC_PERIODIC MHI channel.
>>
>> Signed-off-by: Ajit Pal Singh <quic_ajitpals@quicinc.com>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
>> @@ -586,8 +587,16 @@ static int __init qaic_init(void)
>>   		goto free_pci;
>>   	}
>>   
>> +	ret = qaic_timesync_init();
>> +	if (ret) {
>> +		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
>> +		goto free_mhi;
> I would print at error level here. Or if timesync is optional do not error exit.

Good point.  timesync is optional so will not do error exit.

> 
>> +#ifdef readq
>> +static u64 read_qtimer(const volatile void __iomem *addr)
>> +{
>> +	return readq(addr);
>> +}
>> +#else
>> +static u64 read_qtimer(const volatile void __iomem *addr)
>> +{
>> +	u64 low, high;
>> +
>> +	low = readl(addr);
>> +	high = readl(addr + sizeof(u32));
>> +	return low | (high << 32);
>> +}
> If that's only for compile on 32-bit PowerPC, I think would be better
> to limit supported architectures on Kconfig.

The issue was flagged on 32-bit PowerPC, but I concluded from a code 
review that the issue exists on any 32-bit architecture.  Given that 
this is an add-on card I'd prefer to support as many architectures as 
possible.

-Jeff

