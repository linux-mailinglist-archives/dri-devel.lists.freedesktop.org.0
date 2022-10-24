Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0360AE97
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16DC10E257;
	Mon, 24 Oct 2022 15:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3BA10E257
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:09:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29OF0fcr031720;
 Mon, 24 Oct 2022 15:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pqq6g8ciTR5QW5YOUa+7JCIfpE1AbJcmclYuS620PKk=;
 b=DB1IYbwWR8Bjur2BBEqkToNs4cXx5yvr7qmatPZIHdmIRdzyUnWKlyJ842lbXC91jjmO
 OvmneaDGc8hdHt05YXjohtUEsjmSPt71W0smFUTuFNwzM03mdSr/HD8iYwFP5c8w/qF6
 4XIy0JUHpnjLxFk25oXuI3pI7QeBmsjGHrVa8+MCsLX2RH88QdUjw3Fpl87c63aMxnwa
 T3L/xqzq4s19q6FxvYpS1DLwAJJ2V8u2POZyxM5DjE50QbyEWqZI8e/8eRoI/LS+6NJL
 Qj4iM/uEoCK5c45wXchcNmztb/OIaCxPBf76Mz3VEoC1pEZq76+kNqRQQyQ9YGGRiIK3 QA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kc67pmhq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 15:08:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29OF8tY4002803
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 15:08:55 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 24 Oct
 2022 08:08:54 -0700
Message-ID: <8b0dca0f-8444-92d7-38c9-06bc7503d874@quicinc.com>
Date: Mon, 24 Oct 2022 09:08:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH 2/3] drm: define new accel major and register it
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, Oded Gabbay <ogabbay@kernel.org>
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <20221022214622.18042-3-ogabbay@kernel.org> <Y1U2K+fAnGbYug/+@kroah.com>
 <CAFCwf11PxtcRZegVBxYfJQFpYO0AipobJXWWp4ch+7mMKRLuKg@mail.gmail.com>
 <CAPM=9txP8N2kzeDHEbSbiO-oAy5cemJ_Ag4WqeCNzdx6b3quBA@mail.gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CAPM=9txP8N2kzeDHEbSbiO-oAy5cemJ_Ag4WqeCNzdx6b3quBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wYnH4maOaRyiYeLY0MmKIxjF-hAHq86o
X-Proofpoint-ORIG-GUID: wYnH4maOaRyiYeLY0MmKIxjF-hAHq86o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210240093
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
 Jiho Chu <jiho.chu@samsung.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/24/2022 1:52 AM, Dave Airlie wrote:
> On Mon, 24 Oct 2022 at 17:23, Oded Gabbay <ogabbay@kernel.org> wrote:
>>
>> On Sun, Oct 23, 2022 at 3:40 PM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>>
>>> On Sun, Oct 23, 2022 at 12:46:21AM +0300, Oded Gabbay wrote:
>>>> The accelerator devices will be exposed to the user space with a new,
>>>> dedicated major number - 261.
>>>>
>>>> The drm core registers the new major number as a char device and create
>>>> corresponding sysfs and debugfs root entries, same as for the drm major.
>>>>
>>>> In case CONFIG_ACCEL is not selected, this code is not compiled in.
>>>>
>>>> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
>>>> ---
>>>>   Documentation/admin-guide/devices.txt |  5 +++
>>>>   drivers/gpu/drm/drm_drv.c             | 45 +++++++++++++++++++++++
>>>>   drivers/gpu/drm/drm_internal.h        |  3 ++
>>>>   drivers/gpu/drm/drm_sysfs.c           | 52 +++++++++++++++++++++++++++
>>>>   include/drm/drm_ioctl.h               |  1 +
>>>>   5 files changed, 106 insertions(+)
>>>>
>>>> diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
>>>> index 9764d6edb189..06c525e01ea5 100644
>>>> --- a/Documentation/admin-guide/devices.txt
>>>> +++ b/Documentation/admin-guide/devices.txt
>>>> @@ -3080,6 +3080,11 @@
>>>>                  ...
>>>>                  255 = /dev/osd255     256th OSD Device
>>>>
>>>> + 261 char    Compute Acceleration Devices
>>>> +               0 = /dev/accel/accel0 First acceleration device
>>>> +               1 = /dev/accel/accel1 Second acceleration device
>>>> +                 ...
>>>> +
>>>>    384-511 char        RESERVED FOR DYNAMIC ASSIGNMENT
>>>>                Character devices that request a dynamic allocation of major
>>>>                number will take numbers starting from 511 and downward,
>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>> index 8214a0b1ab7f..b58ffb1433d6 100644
>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>> @@ -67,6 +67,10 @@ static bool drm_core_init_complete;
>>>>
>>>>   static struct dentry *drm_debugfs_root;
>>>>
>>>> +#ifdef CONFIG_ACCEL
>>>> +static struct dentry *accel_debugfs_root;
>>>> +#endif
>>>> +
>>>>   DEFINE_STATIC_SRCU(drm_unplug_srcu);
>>>>
>>>>   /*
>>>> @@ -1031,9 +1035,19 @@ static const struct file_operations drm_stub_fops = {
>>>>        .llseek = noop_llseek,
>>>>   };
>>>>
>>>> +static void accel_core_exit(void)
>>>> +{
>>>> +#ifdef CONFIG_ACCEL
>>>> +     unregister_chrdev(ACCEL_MAJOR, "accel");
>>>> +     debugfs_remove(accel_debugfs_root);
>>>> +     accel_sysfs_destroy();
>>>> +#endif
>>>> +}
>>>
>>> Why is all of this in drm_drv.c?
>>>
>>> Why not put it in drm/accel/accel.c or something like that?  Then put
>>> the proper stuff into a .h file and then you have no #ifdef in the .c
>>> files.
>> I thought about that, adding an accel.c in drivers/accel/ and putting
>> this code there.
>> Eventually I thought that for two functions it's not worth it, but I
>> guess that in addition to the reason you gave, one can argue that
>> there will probably be more code in that file anyway, so why not open
>> it now.
>> I'll change this if no one else thinks otherwise.
> 
> Seems like a good idea to start doing it now, might make things easier
> to keep separated.

I agree.  I was a bit confused going through this patch, and envisioning 
how an accel driver would use the interface.  I think an 
accel_internal.h would be clearer.

-Jeff
