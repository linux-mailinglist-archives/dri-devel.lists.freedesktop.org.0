Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6496316B4
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 23:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3165E10E114;
	Sun, 20 Nov 2022 22:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C40D10E114
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 22:04:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AKM01Am013125; Sun, 20 Nov 2022 22:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zcD1Fr15cCm7bqKrwrigVvTElDIAFvqUwWsdLIKs55s=;
 b=VF4Ydk427PXnchEVO1MsVWzj/Vo+2bDNE34nViB/cpbEa2CK4NIb15ga9MnZkcjcuZ8z
 KV0uCsdsmkOkq1KnJT2doL6hA7wyYTJova7GzoVojdfznxlY8YrtxL/5Ezg8hdQVOhwS
 04VSXa6HRcsVdN6+Zm9Atq5NBnqliTOg4tKNmn8AG9Irr9IWw5O6lWvAbbycjB7tBWPG
 GxwDZH9UdVqqf93J2yjRiFP7cAbWWC8/6f/rXq1U8P1xVEwX/orG27z3EQjj3GwVIdY5
 dwui3kcQ8/NgmHuSHCYPeVpokT44lpuJZEVL+EDtFe/VuqNCALVaP0vzt0LFdsgGE0+r yg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kxreajvnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 22:04:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AKM46gh030807
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 22:04:06 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 20 Nov
 2022 14:04:05 -0800
Message-ID: <dbc740e5-4f23-a461-bfa0-e0e8859f45ec@quicinc.com>
Date: Sun, 20 Nov 2022 15:04:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20221119204435.97113-1-ogabbay@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20221119204435.97113-1-ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LQblRABNG9Kd4KcRoZTMASNmYxHpup_X
X-Proofpoint-ORIG-GUID: LQblRABNG9Kd4KcRoZTMASNmYxHpup_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211200187
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiho Chu <jiho.chu@samsung.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/19/2022 1:44 PM, Oded Gabbay wrote:
> This is the fourth (and hopefully last) version of the patch-set to add the
> new subsystem for compute accelerators. I removed the RFC headline as
> I believe it is now ready for merging.
> 
> Compare to v3, this patch-set contains one additional patch that adds
> documentation regarding the accel subsystem. I hope it's good enough for
> this stage. In addition, there were few very minor fixes according to
> comments received on v3.
> 
> The patches are in the following repo:
> https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v4
> 
> As in v3, The HEAD of that branch is a commit adding a dummy driver that
> registers an accel device using the new framework. This can be served
> as a simple reference.
> 
> v1 cover letter:
> https://lkml.org/lkml/2022/10/22/544
> 
> v2 cover letter:
> https://lore.kernel.org/lkml/20221102203405.1797491-1-ogabbay@kernel.org/T/
> 
> v3 cover letter:
> https://lore.kernel.org/lkml/20221106210225.2065371-1-ogabbay@kernel.org/T/
> 
> Thanks,
> Oded.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

I have some nits.  Nothing that I think should be a blocker for this series.
