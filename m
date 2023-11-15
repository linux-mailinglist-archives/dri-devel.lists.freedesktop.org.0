Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55D7ECA3C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 19:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E283610E11E;
	Wed, 15 Nov 2023 18:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE71B10E11D;
 Wed, 15 Nov 2023 18:06:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFHK1Lj009307; Wed, 15 Nov 2023 18:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=S456DIdiCxNIzgFZZHqEiiB7zYGKq4moNB/BFR0ew/0=;
 b=Tx36VVTEpg6BnSTV9ttCOVrO00weIg6c5BKYP2dlWr/2SXU+givoU95fYR41qCjmWDTV
 +aqVqlo1gzT4lToOG9vO6CjaFsIhdYjXPv3IhIFX3mk9dcO5QwTETcqL7k/g6KScDyLt
 SPRvGU6qRB6063Zm6Xaj1izajFnv8jmBt8+ulGq8cboVE0M0SwVwLjsPhCPx9yl22wFI
 nPeyLMrF2p9//Gku+D2TWXsC1PYzAjcOe1Aud0kJ33RzIcbyHIymanNd7ABDgX3fzKwx
 mNXwjZJdysI/uogb4RlY3plg1Zb3y4C+JWnhkPzAeGVOASkuAyoEB0bfQc1Wxnp+OP93 AQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucg2uak73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 18:06:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AFI6QSF000930
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 18:06:26 GMT
Received: from [10.110.71.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 10:06:26 -0800
Message-ID: <a35623df-6a8e-b398-a0b2-7f11b9ec4e5d@quicinc.com>
Date: Wed, 15 Nov 2023 10:06:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] drm/msm/dp: attach the DP subconnector property
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
 <20231025092711.851168-3-dmitry.baryshkov@linaro.org>
 <ZVR8Flrjxy-wgqgJ@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZVR8Flrjxy-wgqgJ@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: L5Iv8SQPLsOJUHk-WpdGem-q6Lbq-7eH
X-Proofpoint-GUID: L5Iv8SQPLsOJUHk-WpdGem-q6Lbq-7eH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_17,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311150141
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/15/2023 12:06 AM, Johan Hovold wrote:
> On Wed, Oct 25, 2023 at 12:23:10PM +0300, Dmitry Baryshkov wrote:
>> While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
>> support setting the DP subconnector type") I had the patch [1] in my
>> tree. I haven't noticed that it was a dependency for the commit in
>> question. Mea culpa.
> 
> This also broke boot on the Lenovo ThinkPad X13s.
> 
> Would be nice to get this fixed ASAP so that further people don't have
> to debug this known regression.
>   

I will queue this patch for -fixes rightaway.

>> Since the patch has not landed yet (and even was not reviewed)
>> and since one of the bridges erroneously uses USB connector type instead
>> of DP, attach the property directly from the MSM DP driver.
>>
>> This fixes the following oops on DP HPD event:
>>
>>   drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
>>   dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
>>   dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
>>   hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
>>   kthread (kernel/kthread.c:388)
>>   ret_from_fork (arch/arm64/kernel/entry.S:858)
> 
> This only says where the oops happened, it doesn't necessarily in itself
> indicate an oops at all or that in this case it's a NULL pointer
> dereference.
> 
> On the X13s I'm seeing the NULL deref in a different path during boot,
> and when this happens after a deferred probe (due to the panel lookup
> mess) it hangs the machine, which makes it a bit of a pain to debug:
> 
>     Unable to handle kernel NULL pointer dereference at virtual address 0000000000000060
>     ...
>     CPU: 4 PID: 57 Comm: kworker/u16:1 Not tainted 6.7.0-rc1 #4
>     Hardware name: Qualcomm QRD, BIOS 6.0.220110.BOOT.MXF.1.1-00470-MAKENA-1 01/10/2022
>     ...
>     Call trace:
>      drm_object_property_set_value+0x0/0x88 [drm]
>      dp_display_process_hpd_high+0xa0/0x14c [msm]
>      dp_hpd_plug_handle.constprop.0.isra.0+0x90/0x110 [msm]
>      dp_bridge_atomic_enable+0x184/0x21c [msm]
>      edp_bridge_atomic_enable+0x60/0x94 [msm]
>      drm_atomic_bridge_chain_enable+0x54/0xc8 [drm]
>      drm_atomic_helper_commit_modeset_enables+0x194/0x26c [drm_kms_helper]
>      msm_atomic_commit_tail+0x204/0x804 [msm]
>      commit_tail+0xa4/0x18c [drm_kms_helper]
>      drm_atomic_helper_commit+0x19c/0x1b0 [drm_kms_helper]
>      drm_atomic_commit+0xa4/0x104 [drm]
>      drm_client_modeset_commit_atomic+0x22c/0x298 [drm]
>      drm_client_modeset_commit_locked+0x60/0x1c0 [drm]
>      drm_client_modeset_commit+0x30/0x58 [drm]
>      __drm_fb_helper_restore_fbdev_mode_unlocked+0xbc/0xfc [drm_kms_helper]
>      drm_fb_helper_set_par+0x30/0x4c [drm_kms_helper]
>      fbcon_init+0x224/0x49c
>      visual_init+0xb0/0x108
>      do_bind_con_driver.isra.0+0x19c/0x38c
>      do_take_over_console+0x140/0x1ec
>      do_fbcon_takeover+0x6c/0xe4
>      fbcon_fb_registered+0x180/0x1f0
>      register_framebuffer+0x19c/0x228
>      __drm_fb_helper_initial_config_and_unlock+0x2e8/0x4e8 [drm_kms_helper]
>      drm_fb_helper_initial_config+0x3c/0x4c [drm_kms_helper]
>      msm_fbdev_client_hotplug+0x84/0xcc [msm]
>      drm_client_register+0x5c/0xa0 [drm]
>      msm_fbdev_setup+0x94/0x148 [msm]
>      msm_drm_bind+0x3d0/0x42c [msm]
>      try_to_bring_up_aggregate_device+0x1ec/0x2f4
>      __component_add+0xa8/0x194
>      component_add+0x14/0x20
>      dp_display_probe+0x278/0x41c [msm]
> 
>> [1] https://patchwork.freedesktop.org/patch/555530/
>>
>> Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 

Thanks !

> Johan
