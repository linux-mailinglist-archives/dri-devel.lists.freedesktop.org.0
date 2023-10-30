Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A677DBC2B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 15:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DBC88E26;
	Mon, 30 Oct 2023 14:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58B988E26
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 14:56:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39UEj2Dg032506; Mon, 30 Oct 2023 14:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1WsgcitIU7hN1N68z2wtHDfPqnREcDZYerwEy1dem18=;
 b=Jl9jX3xUAdI8raIdk/fS82WEJcdV/x7Hfn8WmcmpaNtmNKUPDoQYDFUgw6Az3PrR/Bld
 PkuRYGXgSsklrQG2XI+CkDNlT62j+Rf8n4N+N6ByeAMQoBlhnuyEJNlSezIKrItziI7J
 yemR5gJujVntSNHyKlB1JQ0HhdnrY4abR8VWkeJvwFqRwk1FSO/KLJcFqU92q+k+5xE/
 aCiVDnSYOBEoOZsNa5ScCI1Ir3Kuu3uY9QaCAxLprKajjq+kFkSudv5YTchdnrMXaMsM
 X40C6Pd5PGEHK0IWBGpT9jrNvecArvoXrun/n7wPNl8EaoYaAhtAxxpiuyEVoG5M6Ufw ag== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2egsr0xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 14:56:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UEuCkD031827
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 14:56:12 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 07:56:11 -0700
Message-ID: <39e0b937-75d0-4bdf-4250-349e96e5c92b@quicinc.com>
Date: Mon, 30 Oct 2023 08:56:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/8] accel/ivpu/40xx: Allow to change profiling frequency
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
 <20231028155936.1183342-2-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231028155936.1183342-2-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Buqkc6lh-xCIlXG_K-EaYkl-i8rs9bmA
X-Proofpoint-GUID: Buqkc6lh-xCIlXG_K-EaYkl-i8rs9bmA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_10,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310300114
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
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/28/2023 9:59 AM, Stanislaw Gruszka wrote:
> From: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> 
> Profiling freq is a debug firmware feature. It switches default clock
> to higher resolution for fine-grained and more accurate firmware task
> profiling. We already configure it during boot up of VPU4.
> 
> Add debugfs knob and helpers per HW generation that allow to change it.
> For vpu37xx the implementation is empty as profiling frequency can only
> be changed on VPU4 or newer.
> 
> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
