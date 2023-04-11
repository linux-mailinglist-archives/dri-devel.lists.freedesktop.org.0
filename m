Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297E6DE251
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 19:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6797710E5D5;
	Tue, 11 Apr 2023 17:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E05410E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 17:18:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33BHCb0u007895; Tue, 11 Apr 2023 17:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DTqMTA4l63+ay4dF0UNz5QG9+cWWZ0myYrvhXpQ/qbU=;
 b=mzWjYOhO42PfaDH7QR+9srFTMJlRnen20o/iuC3t/G5AVzPhOBVfDV4JlZ7G2M88N4do
 Y5k3vdd8jmLkfJbAikk66h7NypPm7cYV9qUNIQmgPnO08C8CUEZ77Rz8OSls/t6H2QDh
 xa2BLSE0Ja9Q4U2ktgzZeSGVFbrplEXhUTyPMnzK7RIpAZQdBt2DTiVn6QomocvW1VKn
 s1/0X+zDGriM2fCJbORHD07cYdmujULjeRSSeX+xxENRXvVlcznhfzQ7//iFYC4c/VIS
 tGUQa8SWO34Cx3nZ23fbipbupYZS4aCCpdQ/m1luuXR+NICuWHxidvqtUD9S9YctGD/O og== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pvnjetw6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 17:18:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33BHIUqG028263
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 17:18:30 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 11 Apr
 2023 10:18:29 -0700
Message-ID: <19e3438f-8e85-9da4-cd9d-8fc19559abd7@quicinc.com>
Date: Tue, 11 Apr 2023 11:18:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: linux-next: build failure after merge of the driver-core tree
Content-Language: en-US
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "Oded
 Gabbay" <ogabbay@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>, Dave Airlie <airlied@redhat.com>
References: <20230411143812.11a4b00d@canb.auug.org.au>
 <ZDUuiB+E1tIJ95LY@phenom.ffwll.local> <2023041123-tractor-quake-c44d@gregkh>
 <ZDV2Nvs57Orx47tj@phenom.ffwll.local>
 <1094266f-d845-9fa4-9f44-85de8352c04f@quicinc.com>
 <2023041131-boxy-excavator-1183@gregkh>
 <04155e87-16f7-9916-6aa8-b4842ef92b83@quicinc.com>
 <3879d287-81e0-5e25-8c58-f9554ce2303b@quicinc.com>
 <ZDWLRxkFjsGZazXD@phenom.ffwll.local>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <ZDWLRxkFjsGZazXD@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: J4BGq_fOZr5rCnAz1oPWu4dahoNj4Tis
X-Proofpoint-GUID: J4BGq_fOZr5rCnAz1oPWu4dahoNj4Tis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_11,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304110158
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

On 4/11/2023 10:31 AM, Daniel Vetter wrote:
> On Tue, Apr 11, 2023 at 09:29:27AM -0600, Jeffrey Hugo wrote:
>> On 4/11/2023 9:26 AM, Jeffrey Hugo wrote:
>>> On 4/11/2023 9:13 AM, Greg KH wrote:
>>>> On Tue, Apr 11, 2023 at 09:08:39AM -0600, Jeffrey Hugo wrote:
>>>>> On 4/11/2023 9:01 AM, Daniel Vetter wrote:
>>>>>> On Tue, Apr 11, 2023 at 12:40:28PM +0200, Greg KH wrote:
>>>>>>> On Tue, Apr 11, 2023 at 11:55:20AM +0200, Daniel Vetter wrote:
>>>>>>>> On Tue, Apr 11, 2023 at 02:38:12PM +1000, Stephen Rothwell wrote:
>>>>>>>>> Hi all,
>>>>>>>>>
>>>>>>>>> After merging the driver-core tree, today's linux-next build (x86_64
>>>>>>>>> allmodconfig) failed like this:
>>>>>>>>>
>>>>>>>>> In file included from include/linux/linkage.h:7,
>>>>>>>>>                     from include/linux/kernel.h:17,
>>>>>>>>>                     from drivers/accel/qaic/mhi_qaic_ctrl.c:4:
>>>>>>>>> drivers/accel/qaic/mhi_qaic_ctrl.c: In function
>>>>>>>>> 'mhi_qaic_ctrl_init':
>>>>>>>>> include/linux/export.h:27:22: error: passing
>>>>>>>>> argument 1 of 'class_create' from incompatible
>>>>>>>>> pointer type
>>>>>>>>> [-Werror=incompatible-pointer-types]
>>>>>>>>>       27 | #define THIS_MODULE (&__this_module)
>>>>>>>>>          |                     ~^~~~~~~~~~~~~~~
>>>>>>>>>          |                      |
>>>>>>>>>          |                      struct module *
>>>>>>>>> drivers/accel/qaic/mhi_qaic_ctrl.c:544:38: note:
>>>>>>>>> in expansion of macro 'THIS_MODULE'
>>>>>>>>>      544 |         mqc_dev_class =
>>>>>>>>> class_create(THIS_MODULE,
>>>>>>>>> MHI_QAIC_CTRL_DRIVER_NAME);
>>>>>>>>>          |                                      ^~~~~~~~~~~
>>>>>>>>> In file included from include/linux/device.h:31,
>>>>>>>>>                     from include/linux/mhi.h:9,
>>>>>>>>>                     from drivers/accel/qaic/mhi_qaic_ctrl.c:5:
>>>>>>>>> include/linux/device/class.h:229:54: note:
>>>>>>>>> expected 'const char *' but argument is of type
>>>>>>>>> 'struct module *'
>>>>>>>>>      229 | struct class * __must_check
>>>>>>>>> class_create(const char *name);
>>>>>>>>>          |                                          ~~~~~~~~~~~~^~~~
>>>>>>>>> drivers/accel/qaic/mhi_qaic_ctrl.c:544:25:
>>>>>>>>> error: too many arguments to function
>>>>>>>>> 'class_create'
>>>>>>>>>      544 |         mqc_dev_class =
>>>>>>>>> class_create(THIS_MODULE,
>>>>>>>>> MHI_QAIC_CTRL_DRIVER_NAME);
>>>>>>>>>          |                         ^~~~~~~~~~~~
>>>>>>>>> include/linux/device/class.h:229:29: note: declared here
>>>>>>>>>      229 | struct class * __must_check
>>>>>>>>> class_create(const char *name);
>>>>>>>>>          |                             ^~~~~~~~~~~~
>>>>>>>>>
>>>>>>>>> Caused by commit
>>>>>>>>>
>>>>>>>>>      1aaba11da9aa ("driver core: class: remove
>>>>>>>>> module * from class_create()")
>>>>>>>>>
>>>>>>>>> interacting with commit
>>>>>>>>>
>>>>>>>>>      566fc96198b4 ("accel/qaic: Add mhi_qaic_cntl")
>>>>>>>>>
>>>>>>>>> from the drm tree.
>>>>>>>>>
>>>>>>>>> I have applied the following merge fix patch for today.
>>>>>>>>>
>>>>>>>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>>>>>>>> Date: Tue, 11 Apr 2023 14:16:57 +1000
>>>>>>>>> Subject: [PATCH] fixup for "driver core: class:
>>>>>>>>> remove module * from class_create()"
>>>>>>>>>
>>>>>>>>> interacting with "accel/qaic: Add mhi_qaic_cntl"
>>>>>>>>>
>>>>>>>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>>>>>>
>>>>>>>> Thanks for the fixup. Since Dave is out I've made a
>>>>>>>> note about this in my
>>>>>>>> handover mail so it won't get lost in the drm-next
>>>>>>>> merge window pull. I
>>>>>>>> don't think we need any other coordination than
>>>>>>>> mention it in each pull to
>>>>>>>> Linus, topic tree seems overkill for this. Plus there's no way I can
>>>>>>>> untangle the drm tree anyway :-).
>>>>>>>
>>>>>>> Want me to submit a patch for the drm tree that moves this to use
>>>>>>> class_register() instead, which will make the
>>>>>>> merge/build issue go away
>>>>>>> for you?  That's my long-term goal here anyway, so converting this new
>>>>>>> code to this api today would be something I have to do eventually :)
>>>>>>
>>>>>> We kinda closed drm-next for feature work mostly already (just pulling
>>>>>> stuff in from subtrees), so won't really help for this merge window.
>>>>>>
>>>>>> For everything else I think this is up to Oded, I had no
>>>>>> idea qaic needed
>>>>>> it's entire own dev class and I don't want to dig into this
>>>>>> for the risk I
>>>>>> might freak out :-)
>>>>>>
>>>>>> Adding Oded.
>>>>>>
>>>>>> Cheers, Daniel
>>>>>
>>>>> Sorry for the mess.
>>>>>
>>>>> I made a note to update to class_register() once my drm-misc access is
>>>>> sorted out.  Looks like we'll address the conflict in the merge
>>>>> window, and
>>>>> catch the update to the new API in the following release.
>>>>
>>>> Wait, I think the large question is, "why does this need a separate
>>>> class"?  Why are you not using the accel char device and class?  That is
>>>> what everything under accel/ should be using, otherwise why put it in
>>>> there?
>>>>
>>>> And what exactly are you using that class for?  Just device nodes?  If
>>>> so, how many?
>>>>
>>>> thanks,
>>>>
>>>> greg k-h
>>>
>>>
>>> Remember MHI_UCI that then evolved into the WWAN subsystem?  I pointed
>>> out at the time that AIC100/QAIC would need the same functionality.
>>> You/Jakub told myself/Mani/Loic that a combined implementation is not
>>> acceptable, and every area needs to implement their own version of
>>> MHI_UCI.
>>>
>>> We took the WWAN subsystem and simplified it to meet our needs.
>>>
>>> The functionality is QAIC specific, so wedging it into the Accel node
>>> seems to be a poor fit as it would subject Habana and iVPU to the same.
>>
>> Also, I forgot to mention.  QAIC is sharing userspace components with WWAN,
>> so we really cannot diverge from what WWAN has done and define a new API
>> through the Accel node.
> 
> So there is an accel/drm_device in the qaic driver, but there's also this
> different class thing, which I don't get.
> 
> And yeah if that's an entirely orthogonal thing then I guess that should
> be in a different driver/subsystem, all supported with the aux bus to
> multiplex the underlying device.
> 
> I haven't found any explanation for what MHI is (or any of the other
> acrynoms), so I'm entirely lost.

MHI is documented at Documentation/mhi/
It is also referenced in the QAIC documentation - Documentation/accel/qaic/

It stands for "Modem Host Interface" (arguably a bad name now, but you 
can guess where it came from).  It is a Qualcomm hardware block and 
associated software protocol that provides logical channels over a 
hardware link.  Most commonly used for PCIe.

Pretty much any modern Qualcomm PCIe device implements it.  4G modems, 
5G modems, Wifi adapters, AIC100, etc.  Instead of talking "PCIe", the 
host talks "MHI" to the devices in most cases.

The core implementation for MHI exists in drivers/bus/mhi

MHI_UCI is the MHI Userspace Character Interface.  It looked like most 
buses (eg USB) provide some direct device access to userspace.  MHI_UCI 
was formulated along those same lines - provide direct userspace access 
to a whitelist of channels.  Qualcomm provides some fairly extensive 
userspace utilities, and various communities have developed open source 
alternatives using this mechanism.

MHI_UCI was proposed to the community as the common driver (misc device) 
for all of the MHI devices.  The Net folks came along, saw that it was 
used for 4G/5G modems (Wireless Wide Area Network devices or WWAN) and 
decided that they would not tolerate a common implementation.  They 
NACK'd MHI_UCI and required that a WWAN specific subsystem be developed 
which would only service WWAN devices.  The Net folks decreed that other 
subsystems which needed the same functionality need to have their own 
copy of the implementation.

QAIC devices expose Sahara (a boot time protocol) which has an existing 
userspace that is also used with Modems, although it looks like WWAN 
doesn't currently support those generations of products today.  QAIC 
devices also support DIAG, which is currently supported in WWAN.  The 
intent was to add the QAIC support for DIAG at a later time since it is 
not required for the bare minimum viable driver.

So, QAIC devices support the same services, would use the same 
userspace, but can't use a common implementation because Jakub(net) 
doesn't want to share and convinced Greg to go along.  I'm not 
interested in pushing a cross tree fight (arguably already did that with 
MHI_UCI).  If neither Greg nor Net will accept a common implementation 
that accelerators can use (QAIC), then the only place I can fit this is 
in the Accel area.

Using aux bus seems to make little difference if QAIC is the only 
consumer of this.  I'm willing to refactor the implementation with some 
feedback and guidence, but the uAPI seems set in stone due to the 
existing userspace and WWAN (char devs with open/close/read/write/poll).

What would make you less unhappy?

> -Daniel
> 
>>
>>>
>>> We need (eventually) 128 device nodes.  We have systems with 32 QAIC
>>> devices, and each QAIC device uses 4 device nodes (32 * 4 = 128).  WWAN
>>> subsystem would be similar.  Looks like each 5G modem is 6 nodes per
>>> device, so if you had 22 5G modems on a system, you'd have 132 device
>>> nodes.  I'm not aware of any such system, but it could exist.
>>>
>>> -Jeff
>>
> 

