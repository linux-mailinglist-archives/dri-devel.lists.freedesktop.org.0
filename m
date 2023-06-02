Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2573372084C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 19:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1507D10E209;
	Fri,  2 Jun 2023 17:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220A010E209
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 17:22:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352Fjp6X020574; Fri, 2 Jun 2023 17:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CV/zv2rEx6HI1bxvAwZy7pg+66Syy5hdPrY4LUHd8WY=;
 b=LoKJ0jB8rEZZywhEr9O+n/hjBsinX6Z3vr8N/tkk6AXYqZS/xKFlTvj9JntjUSMYROo6
 7m4Xrr/SHZrUnnSTfppwESX/+wu/QcXTktuzIrQyfMKuAM4YYlA1vQIQHeO1etRLJtCj
 SKUBqgOBZ0YCPhcAx0oKf/Jkz6lgGKMJm1l/xbIKxOV+QmdKED9hmy3kRTPI97Usel9R
 S4WuZBkg62KQz7BS6Nss7AxnH/zrcXQbgLNUgH2WuZArygO2SY4kYAe5SbFW0LUmtMjE
 sUscWNLSXyGr08a1lc/Yj/XaLOJpMNIrQlz0cM5cg5z2BuDpsZCWXU3z386Mk+Yb63+u fA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qycwe95rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jun 2023 17:21:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352HLsEF001287
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jun 2023 17:21:54 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 2 Jun 2023
 10:21:53 -0700
Message-ID: <bbf3e219-eae4-0b50-d552-23b60d83d3f0@quicinc.com>
Date: Fri, 2 Jun 2023 11:21:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/ivpu: ivpu_ipc needs GENERIC_ALLOCATOR
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230526044519.13441-1-rdunlap@infradead.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230526044519.13441-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gkOGvE_uJrjby2pbGcuIuov8leJcUUYg
X-Proofpoint-GUID: gkOGvE_uJrjby2pbGcuIuov8leJcUUYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_13,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=857
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020132
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 kernel test robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/25/2023 10:45 PM, Randy Dunlap wrote:
> Drivers that use the gen_pool*() family of functions should
> select GENERIC_ALLOCATOR to prevent build errors like these:
> 
> ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_free':
> include/linux/genalloc.h:172: undefined reference to `gen_pool_free_owner'
> ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_alloc_algo':
> include/linux/genalloc.h:138: undefined reference to `gen_pool_alloc_algo_owner'
> ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_free':
> include/linux/genalloc.h:172: undefined reference to `gen_pool_free_owner'
> ld: drivers/accel/ivpu/ivpu_ipc.o: in function `ivpu_ipc_init':
> drivers/accel/ivpu/ivpu_ipc.c:441: undefined reference to `devm_gen_pool_create'
> ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_add_virt':
> include/linux/genalloc.h:104: undefined reference to `gen_pool_add_owner'
> 
> Fixes: 5d7422cfb498 ("accel/ivpu: Add IPC driver and JSM messages")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/all/202305221206.1TaugDKP-lkp@intel.com/
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
