Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8547F6BD223
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 15:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F6910E234;
	Thu, 16 Mar 2023 14:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92D810E234;
 Thu, 16 Mar 2023 14:15:38 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32G8uHbK002278; Thu, 16 Mar 2023 14:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oqd8FrrHSyNUSMz5fCbezyg4g9mGSzCYI38EiSw4gnE=;
 b=fLGEp8OGPxI1nbVMDmBZZ68m0doX22Uqski+cQqK9qxHONX+zQpZ76wEPh+QgVDDP0La
 0k9MIyYuYZGCxKscnnvmwbvKbUsh8QcrL2r2zrMOH93j0bG5dwHsem62i909ym8rhxSi
 XBZGrTaj/csNoponkuxI+/jb6/sxiqZpSW6sXsVJW3tSlEwH2GuP5UyFhDkwkmb4awo2
 jdZWALwYZU2q4QoR1ck6PjLby/yjrC8lV7BtMRvNdUeVmnnrz+GksfHs+43R4cAQPhfh
 7E/PKYz4vbAuj6GbmDpB+RcjHXyno5EZ65kfEQYFMIMXz3kcUPVMJB1MsKXgbOXOizlp cA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpxsj34x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 14:15:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32GEF8LV022132
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 14:15:08 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 16 Mar
 2023 07:15:07 -0700
Message-ID: <a30944b2-7ef5-fa2e-f941-2e0cd8933770@quicinc.com>
Date: Thu, 16 Mar 2023 08:15:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/7] drm: remove drm_dev_set_unique
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <mcanal@igalia.com>, <stanislaw.gruszka@linux.intel.com>,
 <ogabbay@kernel.org>, <daniel@ffwll.ch>, <jani.nikula@linux.intel.com>,
 <mwen@igalia.com>, <maxime@cerno.tech>, <wambui.karugax@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20230316082035.567520-1-christian.koenig@amd.com>
 <20230316082035.567520-2-christian.koenig@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230316082035.567520-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _fHcG6y06KejZVc0n2sFrkiiBkmEGrWu
X-Proofpoint-ORIG-GUID: _fHcG6y06KejZVc0n2sFrkiiBkmEGrWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxscore=0 mlxlogscore=990 suspectscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160116
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

On 3/16/2023 2:20 AM, Christian König wrote:
> Not used by any drivers any more, the only use case in drm_dev_init()
> can be inlined now.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
