Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E21F6DDFB9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 17:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B6010E260;
	Tue, 11 Apr 2023 15:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BC310E260
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 15:29:54 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33BFCPr7003942; Tue, 11 Apr 2023 15:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NXavlX3EV8sFIR/LzYDmEJH/U5nEoxc0lBizQkprCwE=;
 b=kSCAagRsHx2ajmaK/9UQpiSqm5sllOEyXW/Btur3QH3aUAaEaebPNFSZUirMzP8VVqKp
 EmQdmxdE8yxElStzh9PvclR1dPzws83A7ECwJPAk9M4JGh6H4Dcyk0SXuLFpU4Aju2lx
 5lH7D7n5xQEA1jz/tqcOEfon9YOJKYc3GhTqm4gMvMnTNzoDH1prhoPv7aycpunBerAX
 xdcnDnKl4LdRPlpgnNyBDJTOMfzzDvUeOz350jZD2xDWA/s3IvEKQR47kWCjemtCoiP2
 dXCGGsepYiF87AxgK5aeF5kTwLDng5ZN0boaeczs+a0r2kGFdGAxv+7l56FnV6N8o3It qg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pw3cv8xtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 15:29:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33BFTT7t030331
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 15:29:29 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 11 Apr
 2023 08:29:28 -0700
Message-ID: <3879d287-81e0-5e25-8c58-f9554ce2303b@quicinc.com>
Date: Tue, 11 Apr 2023 09:29:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: linux-next: build failure after merge of the driver-core tree
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: Greg KH <greg@kroah.com>
References: <20230411143812.11a4b00d@canb.auug.org.au>
 <ZDUuiB+E1tIJ95LY@phenom.ffwll.local> <2023041123-tractor-quake-c44d@gregkh>
 <ZDV2Nvs57Orx47tj@phenom.ffwll.local>
 <1094266f-d845-9fa4-9f44-85de8352c04f@quicinc.com>
 <2023041131-boxy-excavator-1183@gregkh>
 <04155e87-16f7-9916-6aa8-b4842ef92b83@quicinc.com>
In-Reply-To: <04155e87-16f7-9916-6aa8-b4842ef92b83@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JJtxyihkfiO8aAl-4pOEOVGV12uRvcQV
X-Proofpoint-ORIG-GUID: JJtxyihkfiO8aAl-4pOEOVGV12uRvcQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_10,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304110142
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, Linux Next
 Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/11/2023 9:26 AM, Jeffrey Hugo wrote:
> On 4/11/2023 9:13 AM, Greg KH wrote:
>> On Tue, Apr 11, 2023 at 09:08:39AM -0600, Jeffrey Hugo wrote:
>>> On 4/11/2023 9:01 AM, Daniel Vetter wrote:
>>>> On Tue, Apr 11, 2023 at 12:40:28PM +0200, Greg KH wrote:
>>>>> On Tue, Apr 11, 2023 at 11:55:20AM +0200, Daniel Vetter wrote:
>>>>>> On Tue, Apr 11, 2023 at 02:38:12PM +1000, Stephen Rothwell wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> After merging the driver-core tree, today's linux-next build (x86_64
>>>>>>> allmodconfig) failed like this:
>>>>>>>
>>>>>>> In file included from include/linux/linkage.h:7,
>>>>>>>                    from include/linux/kernel.h:17,
>>>>>>>                    from drivers/accel/qaic/mhi_qaic_ctrl.c:4:
>>>>>>> drivers/accel/qaic/mhi_qaic_ctrl.c: In function 
>>>>>>> 'mhi_qaic_ctrl_init':
>>>>>>> include/linux/export.h:27:22: error: passing argument 1 of 
>>>>>>> 'class_create' from incompatible pointer type 
>>>>>>> [-Werror=incompatible-pointer-types]
>>>>>>>      27 | #define THIS_MODULE (&__this_module)
>>>>>>>         |                     ~^~~~~~~~~~~~~~~
>>>>>>>         |                      |
>>>>>>>         |                      struct module *
>>>>>>> drivers/accel/qaic/mhi_qaic_ctrl.c:544:38: note: in expansion of 
>>>>>>> macro 'THIS_MODULE'
>>>>>>>     544 |         mqc_dev_class = class_create(THIS_MODULE, 
>>>>>>> MHI_QAIC_CTRL_DRIVER_NAME);
>>>>>>>         |                                      ^~~~~~~~~~~
>>>>>>> In file included from include/linux/device.h:31,
>>>>>>>                    from include/linux/mhi.h:9,
>>>>>>>                    from drivers/accel/qaic/mhi_qaic_ctrl.c:5:
>>>>>>> include/linux/device/class.h:229:54: note: expected 'const char 
>>>>>>> *' but argument is of type 'struct module *'
>>>>>>>     229 | struct class * __must_check class_create(const char 
>>>>>>> *name);
>>>>>>>         |                                          ~~~~~~~~~~~~^~~~
>>>>>>> drivers/accel/qaic/mhi_qaic_ctrl.c:544:25: error: too many 
>>>>>>> arguments to function 'class_create'
>>>>>>>     544 |         mqc_dev_class = class_create(THIS_MODULE, 
>>>>>>> MHI_QAIC_CTRL_DRIVER_NAME);
>>>>>>>         |                         ^~~~~~~~~~~~
>>>>>>> include/linux/device/class.h:229:29: note: declared here
>>>>>>>     229 | struct class * __must_check class_create(const char 
>>>>>>> *name);
>>>>>>>         |                             ^~~~~~~~~~~~
>>>>>>>
>>>>>>> Caused by commit
>>>>>>>
>>>>>>>     1aaba11da9aa ("driver core: class: remove module * from 
>>>>>>> class_create()")
>>>>>>>
>>>>>>> interacting with commit
>>>>>>>
>>>>>>>     566fc96198b4 ("accel/qaic: Add mhi_qaic_cntl")
>>>>>>>
>>>>>>> from the drm tree.
>>>>>>>
>>>>>>> I have applied the following merge fix patch for today.
>>>>>>>
>>>>>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>>>>>> Date: Tue, 11 Apr 2023 14:16:57 +1000
>>>>>>> Subject: [PATCH] fixup for "driver core: class: remove module * 
>>>>>>> from class_create()"
>>>>>>>
>>>>>>> interacting with "accel/qaic: Add mhi_qaic_cntl"
>>>>>>>
>>>>>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>>>>
>>>>>> Thanks for the fixup. Since Dave is out I've made a note about 
>>>>>> this in my
>>>>>> handover mail so it won't get lost in the drm-next merge window 
>>>>>> pull. I
>>>>>> don't think we need any other coordination than mention it in each 
>>>>>> pull to
>>>>>> Linus, topic tree seems overkill for this. Plus there's no way I can
>>>>>> untangle the drm tree anyway :-).
>>>>>
>>>>> Want me to submit a patch for the drm tree that moves this to use
>>>>> class_register() instead, which will make the merge/build issue go 
>>>>> away
>>>>> for you?  That's my long-term goal here anyway, so converting this new
>>>>> code to this api today would be something I have to do eventually :)
>>>>
>>>> We kinda closed drm-next for feature work mostly already (just pulling
>>>> stuff in from subtrees), so won't really help for this merge window.
>>>>
>>>> For everything else I think this is up to Oded, I had no idea qaic 
>>>> needed
>>>> it's entire own dev class and I don't want to dig into this for the 
>>>> risk I
>>>> might freak out :-)
>>>>
>>>> Adding Oded.
>>>>
>>>> Cheers, Daniel
>>>
>>> Sorry for the mess.
>>>
>>> I made a note to update to class_register() once my drm-misc access is
>>> sorted out.  Looks like we'll address the conflict in the merge 
>>> window, and
>>> catch the update to the new API in the following release.
>>
>> Wait, I think the large question is, "why does this need a separate
>> class"?  Why are you not using the accel char device and class?  That is
>> what everything under accel/ should be using, otherwise why put it in
>> there?
>>
>> And what exactly are you using that class for?  Just device nodes?  If
>> so, how many?
>>
>> thanks,
>>
>> greg k-h
> 
> 
> Remember MHI_UCI that then evolved into the WWAN subsystem?  I pointed 
> out at the time that AIC100/QAIC would need the same functionality. 
> You/Jakub told myself/Mani/Loic that a combined implementation is not 
> acceptable, and every area needs to implement their own version of MHI_UCI.
> 
> We took the WWAN subsystem and simplified it to meet our needs.
> 
> The functionality is QAIC specific, so wedging it into the Accel node 
> seems to be a poor fit as it would subject Habana and iVPU to the same.

Also, I forgot to mention.  QAIC is sharing userspace components with 
WWAN, so we really cannot diverge from what WWAN has done and define a 
new API through the Accel node.

> 
> We need (eventually) 128 device nodes.  We have systems with 32 QAIC 
> devices, and each QAIC device uses 4 device nodes (32 * 4 = 128).  WWAN 
> subsystem would be similar.  Looks like each 5G modem is 6 nodes per 
> device, so if you had 22 5G modems on a system, you'd have 132 device 
> nodes.  I'm not aware of any such system, but it could exist.
> 
> -Jeff

