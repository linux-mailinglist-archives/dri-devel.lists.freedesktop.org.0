Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0399067D2B1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 18:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92ED610E947;
	Thu, 26 Jan 2023 17:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F4710E947
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 17:08:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30QEH0wu012302; Thu, 26 Jan 2023 17:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5pkjWXKYThDrjNI4lY27ewZna4lzbQVLRf9N6qUrqOk=;
 b=aIJkVnlrd0qO7PwwW0eulhIt2/XJkbIvKGDXw6pcTih+oCzBChAT1EdlHxY5rXJILfkP
 Edho8K2xhPajdVJw64SPdIZvPZ7CoIS1qL5iTAHeIy/rL6P6Zp0t/TQSvrEymBCVaP25
 VFzO9KtG1jUBuDIlt1Jd64/pXJPBKeumcf8a+VXUDZxRhj9Gv+rvUOveqDV8LWtZimgm
 /ZNVibASy4Ap/WnJ3EtY6ukLQDiXBHN1qvMWTA1kF58d40n3xt5n3m6SOPU3QIRONaZz
 eX3FmvTPSq79BZ8VPdjhr4OSKRo3zbyjwO3lzd9uG+SadI6OljcH9Js60+ppj/SDb44M /Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nb0qru3dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 17:08:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30QH8WWc025654
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 17:08:32 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 09:08:31 -0800
Message-ID: <f8e71b4d-fa25-b86c-eee2-c1f16fe01a7c@quicinc.com>
Date: Thu, 26 Jan 2023 10:08:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] accep/ivpu: PM: remove broken ivpu_dbg() statements
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
References: <20230126163804.3648051-1-arnd@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230126163804.3648051-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: I0De6xQnred_GEbgmPktnlaZfK4wPkB2
X-Proofpoint-ORIG-GUID: I0De6xQnred_GEbgmPktnlaZfK4wPkB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_07,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301260165
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
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subject has a typo: "accep" should be "accel"

On 1/26/2023 9:37 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_PM is disabled, the driver fails to build:
> 
> drivers/accel/ivpu/ivpu_pm.c: In function 'ivpu_rpm_get':
> drivers/accel/ivpu/ivpu_pm.c:240:84: error: 'struct dev_pm_info' has no member named 'usage_count'
>    240 |         ivpu_dbg(vdev, RPM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
>        |                                                                                    ^
> include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
>    223 |                 func(&id, ##__VA_ARGS__);                       \
>        |                             ^~~~~~~~~~~
> include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
>    249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
>        |         ^~~~~~~~~~~~~~~~~~~~~~
> include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
>    272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
>        |         ^~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
>    155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>        |         ^~~~~~~~~~~~~~~
> drivers/accel/ivpu/ivpu_drv.h:65:17: note: in expansion of macro 'dev_dbg'
>     65 |                 dev_dbg((vdev)->drm.dev, "[%s] " fmt, #type, ##args);          \
>        |                 ^~~~~~~
> drivers/accel/ivpu/ivpu_pm.c:240:9: note: in expansion of macro 'ivpu_dbg'
>    240 |         ivpu_dbg(vdev, RPM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
>        |         ^~~~~~~~
> 
> It would be possible to rework these statements to only conditionally print
> the reference counter, or to make the driver depend on CONFIG_PM, but my
> impression is that these are not actually needed at all if the driver generally
> works, or they could be put back when required. Just remove all four of these
> to make the driver build in all configurations.
> 
> Fixes: 852be13f3bd3 ("accel/ivpu: Add PM support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/accel/ivpu/ivpu_pm.c | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 553bcbd787b3..a880f1dd857e 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -237,8 +237,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
>   {
>   	int ret;
>   
> -	ivpu_dbg(vdev, RPM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
> -
>   	ret = pm_runtime_resume_and_get(vdev->drm.dev);
>   	if (!drm_WARN_ON(&vdev->drm, ret < 0))
>   		vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
> @@ -248,8 +246,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
>   
>   void ivpu_rpm_put(struct ivpu_device *vdev)
>   {
> -	ivpu_dbg(vdev, RPM, "rpm_put count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
> -
>   	pm_runtime_mark_last_busy(vdev->drm.dev);
>   	pm_runtime_put_autosuspend(vdev->drm.dev);
>   }
> @@ -314,16 +310,10 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
>   	pm_runtime_allow(dev);
>   	pm_runtime_mark_last_busy(dev);
>   	pm_runtime_put_autosuspend(dev);
> -
> -	ivpu_dbg(vdev, RPM, "Enable RPM count %d\n", atomic_read(&dev->power.usage_count));
>   }
>   
>   void ivpu_pm_disable(struct ivpu_device *vdev)
>   {
> -	struct device *dev = vdev->drm.dev;
> -
> -	ivpu_dbg(vdev, RPM, "Disable RPM count %d\n", atomic_read(&dev->power.usage_count));
> -
>   	pm_runtime_get_noresume(vdev->drm.dev);
>   	pm_runtime_forbid(vdev->drm.dev);
>   }

