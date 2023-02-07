Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD1E68DD3E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 16:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D5B10E539;
	Tue,  7 Feb 2023 15:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4516D10E557
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 15:43:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317DqSEg025525; Tue, 7 Feb 2023 15:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fR/vJHnTo2BMM+5zA7+57+7nL22FEeEaG8T2Ckc3RuM=;
 b=lUeU6mySn0ShRX0XIPSleaD689B2+e0HoIFTy83UsbLQJ2rDmBcwrDKDqhCNFTilmd6q
 oBePjA2F/zFYS3jKK8DowAWOmaXD1pBxRAy+xO+PnqlqOOsLlTtWtlgWpZv06bOEy07h
 7/Ge7fcfPSim2Na8bScOJqDGBSgKplewddek+ClUuSoZlcMrYC+euWNwPR01WmYPKrjO
 rmSf8hz+H6L0uRahQGro7sIK1prf9kc9cGEDgcTy/lswANpTr6o1vmt7PQQU6Jbwh+k6
 /KP6OuO8rTPFiHogpdBg/HoQV/SLU9qG4tCgYyYKC//IXFtJAxDvK1GXZQbp913IacRT zA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkga2sbsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 15:43:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 317Fh7WP009984
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Feb 2023 15:43:07 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 07:43:06 -0800
Message-ID: <5651b98b-ace8-5009-409f-d6032cb5374d@quicinc.com>
Date: Tue, 7 Feb 2023 08:43:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: DRM accel and debugfs/sysfs
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20230201152003.GA2623449@linux.intel.com>
 <5dfdf605-55a2-28d3-aecf-713a632b2431@igalia.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <5dfdf605-55a2-28d3-aecf-713a632b2431@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TQnCKIuqsi62OOhBFRvzOZM-ITxjJ_wX
X-Proofpoint-ORIG-GUID: TQnCKIuqsi62OOhBFRvzOZM-ITxjJ_wX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070139
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/7/2023 4:31 AM, Maíra Canal wrote:
> Hi Stanislaw,
> 
> On 2/1/23 12:20, Stanislaw Gruszka wrote:
>> Hi
>>
>> I was about to send debugfs support for ivpu and noticed that there
>> are current changes that deprecate drm_devel->debugfs_init callback.
>>
>> Further I looked at this commit [1], that stated we should not
>> use drm_minor for debugfs and sysfs. What is quite contrary to
>> what drm accel framework did in the first place.
>>
>> So my question is how we should use debugfs/sysfs in accel?
>> Use it with old fashioned minor-centric way or change
>> the framework somehow ?
> 
> As we are trying to replace drm_debugfs_create_files() [1], it would
> be nice to see the accel debugfs support use the new debugfs API. This
> would mean using the debugfs_list from the drm_device, deprecating
> the debugfs_init callback, and adding the a similar code snippet to
> accel_debugfs_init:
> 
> list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>      debugfs_create_file(entry->file.name, 0444,
>                  minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>      list_del(&entry->list);
> 
> Maybe Daniel has some more thoughts on this matter, but I guess it
> would be better to drop the use of the old-fashioned minor-centric
> implementation in accel.
> 
> [1] 
> https://cgit.freedesktop.org/drm/drm-misc/tree/Documentation/gpu/todo.rst#n511 
> 
> 
> Best Regards,
> - Maíra Canal

Thank you for the details Maira.  It helps to explain what the todo is 
suggesting.  Is there an example of a driver/drm_device that uses 
debugfs_list which you can easily point to?

-Jeff

> 
>>
>> [1] 
>> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=99845faae7099cd704ebf67514c1157c26960a26 
>>
>>
>> Regards
>> Stanislaw
>>

