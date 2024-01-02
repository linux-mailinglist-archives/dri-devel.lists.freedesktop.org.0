Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499BA821EA7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 16:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E162110E1C8;
	Tue,  2 Jan 2024 15:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B8410E1C8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 15:24:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 402FOd2W026524; Tue, 2 Jan 2024 15:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=znCV/hOQIXm2Tq1dKd06kIRkS9zB+gSlfWugTnieSPM=; b=JW
 vtEVP8UpS4r2RkaQXaDE8WpDkKq0RwSk7XI7zI9ibQh0UL8NJ1t9EKJM5rmhlGMt
 OVw1lLRSKk7sHDDbhMgikWJb9GuiF4xOhpP/py0RsYc32d0Rc0/1XbTDU7aE27dk
 Ryk7GfAtmu6mLlteKE8tP+PBS/sntlwnvu8lwIJmsZTCB1PUKourI31jkDBF1ME4
 SS53N1+xTTB9XeWsAPNhDZ4XZLLq88hpHiVWK4cpwL7K+7jyOTH86cPyKEA011Ts
 KLyjLcnZgrFY6ttfNqssTqyWn1rn/+zaYQTX92qLDPvoLOAOLgJWDPU3jmHFQujC
 IcqqPZddmuLyyg0xMshA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vcg418k1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jan 2024 15:24:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 402FOclH002978
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 Jan 2024 15:24:38 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 2 Jan
 2024 07:24:37 -0800
Message-ID: <bd7ef073-99c3-5d38-ca5b-236ac0415fe3@quicinc.com>
Date: Tue, 2 Jan 2024 08:24:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: linux-next: manual merge of the drm tree with the mm tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>
References: <20240102105223.7634699d@canb.auug.org.au>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240102105223.7634699d@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HG0nRJiN0Ssj6wclFH0SkvqQ7EE_1HUa
X-Proofpoint-ORIG-GUID: HG0nRJiN0Ssj6wclFH0SkvqQ7EE_1HUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020118
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/1/2024 4:52 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drm tree got a conflict in:
> 
>    drivers/accel/qaic/qaic_data.c
> 
> between commit:
> 
>    78f5d33f3dd4 ("mm, treewide: rename MAX_ORDER to MAX_PAGE_ORDER")
> 
> from the mm tree and commit:
> 
>    47fbee5f27ed ("accel/qaic: Update MAX_ORDER use to be inclusive")
> 
> from the drm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks Stephen.  Your fixup is correct.

-Jeff
