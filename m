Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BA78FED5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 16:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50CD10E1B2;
	Fri,  1 Sep 2023 14:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B4A10E1B2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 14:19:20 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 381AbXZR007056; Fri, 1 Sep 2023 14:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CxytiwseYZrp5h6nOP5KI4TjXBA9DhRwaI2vjud3E9M=;
 b=jpbQ7L+XaF3pk5RonDeGZp12m0pR+X/09Lx0UyoZOISVZLR528vt21Xa7UcRTFK/tFDN
 du63muBTU0o+FnkY0jh9Nw0G7S0lPHlAuxudKQFhz0D776jFcBb0wFfGHZWMQGqCIi/9
 eacZNJfwjICSxrQ6xIlFAfkwsA8Mxd2L/OlYIxjrqSU2GdbnBfj0Jc2uLI7LuUM6WkG0
 0cOqJJ279O76OF6fU2EptQ5eH6AFKEFQE+oq9xf+b0tj7sK10xKUd+NrSzU6FsOP8TZm
 i9T9jrGUTe6MCIdVmOXe/ADFWERhBLOJFyy82PEBeZSTofNIRTCna/xusE4kH//fBuWJ 9g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3su89e9e9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 14:19:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381EJ8bo025838
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Sep 2023 14:19:08 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 1 Sep
 2023 07:19:07 -0700
Message-ID: <1900b897-220c-2578-c633-1fb22ee6782c@quicinc.com>
Date: Fri, 1 Sep 2023 08:19:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 02/11] accel/ivpu: Remove duplicated error messages
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
 <20230901094957.168898-3-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230901094957.168898-3-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hBg49m_lIu1H4blFKG3YgBiRQPmRJY14
X-Proofpoint-GUID: hBg49m_lIu1H4blFKG3YgBiRQPmRJY14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_11,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309010134
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/2023 3:49 AM, Stanislaw Gruszka wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> Reduce the number of error messages per single failure in
> ivpu_dev_init() and ivpu_probe().
> 
> Most error messages are already printed by functions called
> from ivpu_dev_init(). Add missed error prints in ivpu_ipc_init()
> and ivpu_mmu_context_init().
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
