Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594C8762D94
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C2C10E41E;
	Wed, 26 Jul 2023 07:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C3A10E152
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 16:03:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36PBT4fa008504; Tue, 25 Jul 2023 16:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Kp0a7lNAXCXaM8NaCeuOTfXgKtq0h3njcXHRACkc6RA=;
 b=pVeOUDSNgLJjyyxwjIZh/WhGaMLec4TRU8/x/Whd5Ua08QMVlZ8amakEE4KsX4KqUusS
 eQhWd9Hz6++7ew8S7MDwaMvGwceV52GeNDNDDjkpPKctB7jROXmM64XBse22V7Y36PVz
 QZk0/s8yok98T+ISn1xkORO/8fhekpSU3x+PNjsZXUQQtBFjda7abKNFqcZT25E/1Tua
 hcqy7lGUewx1CwqxGfWgsFkQdEfCwkxK14Oc/blRFNJ0nbYtgriyzHj+hI//Vl0Y8EXw
 Z0jqF6A+2coI6/+0pvXIc+PfcM/n3UlMIrk3AHCD5t3qkE+cTl21OE+DCehQpc0WWwmv mA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s29j5ha4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jul 2023 16:03:35 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36PG3X9c012883
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jul 2023 16:03:33 GMT
Received: from [10.110.68.194] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 09:03:32 -0700
Message-ID: <1276e614-0c2a-f8a6-d7a0-1fa228eea476@quicinc.com>
Date: Tue, 25 Jul 2023 09:03:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] accel/qaic: remove redundant assignment to pointer
 pexec
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Pranjal Ramajor Asha Kanojiya
 <quic_pkanojiy@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <20230725114037.36806-1-colin.i.king@gmail.com>
From: Carl Vanderlip <quic_carlv@quicinc.com>
In-Reply-To: <20230725114037.36806-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: yn6pno17VELBkxADUY_tmokJEazIHOMG
X-Proofpoint-GUID: yn6pno17VELBkxADUY_tmokJEazIHOMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_08,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=692 phishscore=0 clxscore=1011
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250140
X-Mailman-Approved-At: Wed, 26 Jul 2023 07:30:32 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/25/2023 4:40 AM, Colin Ian King wrote:
> Pointer pexec is being assigned a value however it is never read. The
> assignment is redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
