Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FA267D2C8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 18:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A742210E94E;
	Thu, 26 Jan 2023 17:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B9610E94E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 17:11:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30QGKf98022520; Thu, 26 Jan 2023 17:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Ue5nedVG+ZwPsesNF+mzA1wfOXo2KzJqL4Dx8/Vbpac=;
 b=Pvafthe6nkiP7IoySDnjiJ6Tq5NT4kFD++8dCbnmyNXwebt52mEMqz793Bvsjj0blYBy
 Wjpyxtzr9vKioBJn3icUoUya1Nuf3d/xufCj3JWqTdi0/GBki3O6lL2uGSYmNO+OOMuV
 +uGJq70pyz2KShNWfJyla+HICrcCz0DF4NwRaL1WJUzRN6RD1kBDYA7W5DcSPz6jt1yD
 CB5AZB78nYbsfTHuffxWGy3ElmJwMFrnUoKe9UlCuNEnyKRrevQ/FVXummXayfG5n2AD
 Zm31e49qKzQRrst2/bwW8zA1cM1iDDZ+d+2p/eIO/DoCb7zRbO84+m34e2++n3G1R0O6 RQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nb5ynak34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 17:10:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30QHArEu011509
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 17:10:53 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 09:10:52 -0800
Message-ID: <75aaf08f-4ebc-5734-037c-9a8e18e3343a@quicinc.com>
Date: Thu, 26 Jan 2023 10:10:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] accel/ivpu: avoid duplciate assignment
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>
References: <20230126163804.3648051-1-arnd@kernel.org>
 <20230126163804.3648051-2-arnd@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230126163804.3648051-2-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pDh9V16vwcl3ujLbRdIYTOW5r_29Xx31
X-Proofpoint-GUID: pDh9V16vwcl3ujLbRdIYTOW5r_29Xx31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_07,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260165
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

duplciate -> duplicate

On 1/26/2023 9:37 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With extra warnings enabled, gcc warns about two assignments
> of the same .mmap callback:
> 
> In file included from drivers/accel/ivpu/ivpu_drv.c:10:
> include/drm/drm_accel.h:31:27: error: initialized field overwritten [-Werror=override-init]
>     31 |         .mmap           = drm_gem_mmap
>        |                           ^~~~~~~~~~~~
> drivers/accel/ivpu/ivpu_drv.c:360:9: note: in expansion of macro 'DRM_ACCEL_FOPS'
>    360 |         DRM_ACCEL_FOPS,
>        |         ^~~~~~~~~~~~~~
> 
> Remove the unused local assignment.
> 
> Fixes: 20709aa9435b ("accel: Add .mmap to DRM_ACCEL_FOPS")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Yep, two things in flight at the same time.  Thanks for getting to the 
cleanup before I did.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>


