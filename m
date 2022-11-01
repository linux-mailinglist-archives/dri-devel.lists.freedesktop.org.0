Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611061423C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 01:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B706910E278;
	Tue,  1 Nov 2022 00:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF6910E277;
 Tue,  1 Nov 2022 00:23:03 +0000 (UTC)
Received: from pps.filterd (m0050095.ppops.net [127.0.0.1])
 by m0050095.ppops.net-00190b01. (8.17.1.19/8.17.1.19) with ESMTP id
 29VNs83P026381; Tue, 1 Nov 2022 00:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=B8wOpCOlz8J319gLooEyxuwl9Pwn+cBCXFgKHrPIsbg=;
 b=Y3LODaevB2XF2vq28AYopLWvvozPndg7Me3VO0VYBIg6AXf1wyX7Wmz3+vHtSUedLs3g
 UFrMqBGJHMlVpxuuDwCvJqhMw7cAiAI3Nr0bQas6RwxBKtkr40ElZM3wHM5dnp/DMeOy
 zOG144b+ijnhJCRZRZwl5xapbx/01ECxnVTjwD84kiUU6VVyOtQKwOKwLIKxyiIggjGG
 1ZNdl5eZVDyRh6QcFzSA2hfgHd4uCfyatG+yW2Aj8LdxHGRExyfDyz8D3gAz0iTN+/dU
 +TLqRFfI25PM56P+NWvKsWfavgOKGl7nUxkBgZh8DBS9xR5yBUAk2gekY+QxCCZ4mahq yw== 
Received: from prod-mail-ppoint3
 (a72-247-45-31.deploy.static.akamaitechnologies.com [72.247.45.31] (may be
 forged))
 by m0050095.ppops.net-00190b01. (PPS) with ESMTPS id 3kjre1rc9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 00:20:56 +0000
Received: from pps.filterd (prod-mail-ppoint3.akamai.com [127.0.0.1])
 by prod-mail-ppoint3.akamai.com (8.17.1.5/8.17.1.5) with ESMTP id
 29VNQrea021982; Mon, 31 Oct 2022 20:20:55 -0400
Received: from prod-mail-relay19.dfw02.corp.akamai.com ([172.27.165.173])
 by prod-mail-ppoint3.akamai.com (PPS) with ESMTP id 3khhpq1bra-1;
 Mon, 31 Oct 2022 20:20:55 -0400
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
 by prod-mail-relay19.dfw02.corp.akamai.com (Postfix) with ESMTP id 92E5C60100; 
 Tue,  1 Nov 2022 00:20:54 +0000 (GMT)
Message-ID: <9ff84a99-e500-625e-ba9d-20cd752d7ff4@akamai.com>
Date: Mon, 31 Oct 2022 20:20:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v7 0/9] dyndbg: drm.debug adaptation
To: jim.cromie@gmail.com, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <Yy7/6oTBW2lqVSK1@kroah.com> <Y1Fyuh12g/gt3Izn@intel.com>
 <87a65pfsbq.fsf@intel.com> <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
 <CAJfuBxxWVBxL29sXS3XoE5Es9HTbVyFUi9bQFYNupJAERffAew@mail.gmail.com>
 <Y1qqurH/lG0u+3ky@intel.com>
 <CAJfuBxzpG+C1ARLs3c_znXECEU7Ldg8RhruLMUXA67w+DwcrOQ@mail.gmail.com>
 <Y1rllFeOnT9/PQVA@intel.com>
 <CAJfuBxw_YFvCtHMwVE0K0fa5GJbrZy4hTOSS9FebeDs6fxUUCA@mail.gmail.com>
 <Y1/In+ZBzNguVNoy@intel.com>
 <CAJfuBxxHNXHEWCEPXnPTh64dq4igaddnrU27NT=OHASmnxgudA@mail.gmail.com>
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <CAJfuBxxHNXHEWCEPXnPTh64dq4igaddnrU27NT=OHASmnxgudA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_22,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010000
X-Proofpoint-GUID: y_KSexqckM-XmzcrBUvcjuPdvx5Z5-nD
X-Proofpoint-ORIG-GUID: y_KSexqckM-XmzcrBUvcjuPdvx5Z5-nD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_22,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211010000
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
Cc: dri-devel@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/31/22 6:11 PM, jim.cromie@gmail.com wrote:
> On Mon, Oct 31, 2022 at 7:07 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
>> On Sun, Oct 30, 2022 at 08:42:52AM -0600, jim.cromie@gmail.com wrote:
>>> On Thu, Oct 27, 2022 at 2:10 PM Ville Syrjälä
>>> <ville.syrjala@linux.intel.com> wrote:
>>>> On Thu, Oct 27, 2022 at 01:55:39PM -0600, jim.cromie@gmail.com wrote:
>>>>> On Thu, Oct 27, 2022 at 9:59 AM Ville Syrjälä
>>>>> <ville.syrjala@linux.intel.com> wrote:
>>>>>> On Thu, Oct 27, 2022 at 09:37:52AM -0600, jim.cromie@gmail.com wrote:
>>>>>>> On Thu, Oct 27, 2022 at 9:08 AM Jason Baron <jbaron@akamai.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 10/21/22 05:18, Jani Nikula wrote:
>>>>>>>>> On Thu, 20 Oct 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>>>>>>>>>> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
>>>>>>>>>>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
>>>>>>>>>>>> hi Greg, Dan, Jason, DRM-folk,
>>>>>>>>>>>>
>>>>>>>>>>>> heres follow-up to V6:
>>>>>>>>>>>>    rebased on driver-core/driver-core-next for -v6 applied bits (thanks)
>>>>>>>>>>>>    rework drm_debug_enabled{_raw,_instrumented,} per Dan.
>>>>>>>>>>>>
>>>>>>>>>>>> It excludes:
>>>>>>>>>>>>    nouveau parts (immature)
>>>>>>>>>>>>    tracefs parts (I missed --to=Steve on v6)
>>>>>>>>>>>>    split _ddebug_site and de-duplicate experiment (way unready)
>>>>>>>>>>>>
>>>>>>>>>>>> IOW, its the remaining commits of V6 on which Dan gave his Reviewed-by.
>>>>>>>>>>>>
>>>>>>>>>>>> If these are good to apply, I'll rebase and repost the rest separately.
>>>>>>>>>>> All now queued up, thanks.
>>>>>>>>>> This stuff broke i915 debugs. When I first load i915 no debug prints are
>>>>>>>>>> produced. If I then go fiddle around in /sys/module/drm/parameters/debug
>>>>>>>>>> the debug prints start to suddenly work.
>>>>>>>>> Wait what? I always assumed the default behaviour would stay the same,
>>>>>>>>> which is usually how we roll. It's a regression in my books. We've got a
>>>>>>>>> CI farm that's not very helpful in terms of dmesg logging right now
>>>>>>>>> because of this.
>>>>>>>>>
>>>>>>>>> BR,
>>>>>>>>> Jani.
>>>>>>>>>
>>>>>>>>>
>>>>>>>> That doesn't sound good - so you are saying that prior to this change some
>>>>>>>> of the drm debugs were default enabled. But now you have to manually enable
>>>>>>>> them?
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>> -Jason
>>>>>>>
>>>>>>> Im just seeing this now.
>>>>>>> Any new details ?
>>>>>> No. We just disabled it as BROKEN for now. I was just today thinking
>>>>>> about sending that patch out if no solutin is forthcoming soon since
>>>>>> we need this working before 6.1 is released.
>>>>>>
>>>>>> Pretty sure you should see the problem immediately with any driver
>>>>>> (at least if it's built as a module, didn't try builtin). Or at least
>>>>>> can't think what would make i915 any more special.
>>>>>>
>>>>> So, I should note -
>>>>> 99% of my time & energy on this dyndbg + drm patchset
>>>>> has been done using virtme,
>>>>> so my world-view (and dev-hack-test env) has been smaller, simpler
>>>>> maybe its been fatally simplistic.
>>>>>
>>>>> ive just rebuilt v6.0  (before the trouble)
>>>>> and run it thru my virtual home box,
>>>>> I didnt see any unfamiliar drm-debug output
>>>>> that I might have inadvertently altered somehow
>>>>>
>>>>> I have some real HW I can put a reference kernel on,0
>>>>> to look for the missing output, but its all gonna take some time,
>>>>> esp to tighten up my dev-test-env
>>>>>
>>>>> in the meantime, there is:
>>>>>
>>>>> config DRM_USE_DYNAMIC_DEBUG
>>>>> bool "use dynamic debug to implement drm.debug"
>>>>> default y
>>>>> depends on DRM
>>>>> depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
>>>>> depends on JUMP_LABEL
>>>>> help
>>>>>    Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
>>>>>    Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
>>>>>    bytes per callsite, the .data costs can be substantial, and
>>>>>    are therefore configurable.
>>>>>
>>>>> Does changing the default fix things for i915 dmesg ?
>>>> I think we want to mark it BROKEN in addition to make sure no one
>>> Ok, I get the distinction now.
>>> youre spelling that
>>>    depends on BROKEN
>>>
>>> I have a notional explanation, and a conflating commit:
>>>
>>> can you eliminate
>>> git log -p ccc2b496324c13e917ef05f563626f4e7826bef1
>>>
>>> as the cause ?
>> Reverting that doesn't help.
>>
> thanks for eliminating it.
>
>>> I do need to clarify, I dont know exactly what debug/logging output
>>> is missing such that CI is failing
>> CI isn't failing. But any logs it produces are 100% useless,
>> as are any user reported logs.
>>
>> The debugs that are missing are anything not coming directly
>> from drm.ko.
>>
>> The stuff that I see being printed by i915.ko are drm_info()
>> and the drm_printer stuff from i915_welcome_messages(). That
>> also implies that drm_debug_enabled(DRM_UT_DRIVER) does at
>> least still work correctly.
>>
>> I suspect that the problem is just that the debug calls
>> aren't getting patched in when a module loads. And fiddling
>> with the modparam after the fact does trigger that somehow.
>>
> ok, heres the 'tape' of a virtme boot,
> then modprobe going wrong.
>
> [    1.785873] dyndbg:   2 debug prints in module intel_rapl_msr
> [    2.040598] virtme-init: udev is done
> virtme-init: console is ttyS0
>
>> load drm driver
> bash-5.2# modprobe i915
>
>> drm module is loaded 1st
> [    6.549451] dyndbg: add-module: drm.302 sites
> [    6.549991] dyndbg: class[0]: module:drm base:0 len:10 ty:0
> [    6.550647] dyndbg:  0: 0 DRM_UT_CORE
> [    6.551097] dyndbg:  1: 1 DRM_UT_DRIVER
> [    6.551531] dyndbg:  2: 2 DRM_UT_KMS
> [    6.551931] dyndbg:  3: 3 DRM_UT_PRIME
> [    6.552402] dyndbg:  4: 4 DRM_UT_ATOMIC
> [    6.552799] dyndbg:  5: 5 DRM_UT_VBL
> [    6.553270] dyndbg:  6: 6 DRM_UT_STATE
> [    6.553634] dyndbg:  7: 7 DRM_UT_LEASE
> [    6.554043] dyndbg:  8: 8 DRM_UT_DP
> [    6.554392] dyndbg:  9: 9 DRM_UT_DRMRES
> [    6.554776] dyndbg: module:drm attached 1 classes
> [    6.555241] dyndbg: 302 debug prints in module drm
>
>> here modprobe reads /etc/modprobe.d/drm-test.conf:
> options drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_DRIVER +p"
> and dyndbg applies it

Hi,

I'm a bit confused with this. My understanding is that there
is a 'regression' here from how this used to work. But the
'class' keyword is new - are we sure this is the command-line
we are trying to fix?

>
> [    6.564284] dyndbg: module: drm dyndbg="class DRM_UT_CORE +p; class
> DRM_UT_DRIVER +p"
> [    6.564957] dyndbg: query 0: "class DRM_UT_CORE +p" mod:drm
> [    6.565348] dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
> [    6.565836] dyndbg: op='+'
> [    6.566059] dyndbg: flags=0x1
> [    6.566321] dyndbg: *flagsp=0x1 *maskp=0xffffffff
> [    6.566875] dyndbg: parsed: func="" file="" module="drm" format=""
> lineno=0-0 class=DRM_UT_CORE
> [    6.568753] dyndbg: applied: func="" file="" module="drm" format=""
> lineno=0-0 class=DRM_UT_CORE
> [    6.569473] dyndbg: query 1: "class DRM_UT_DRIVER +p" mod:drm
> [    6.570139] dyndbg: split into words: "class" "DRM_UT_DRIVER" "+p"
> [    6.570522] dyndbg: op='+'
> [    6.570699] dyndbg: flags=0x1
> [    6.570893] dyndbg: *flagsp=0x1 *maskp=0xffffffff
> [    6.571200] dyndbg: parsed: func="" file="" module="drm" format=""
> lineno=0-0 class=DRM_UT_DRIVER
> [    6.571778] dyndbg: no matches for query
> [    6.572031] dyndbg: no-match: func="" file="" module="drm"
> format="" lineno=0-0 class=DRM_UT_DRIVER
> [    6.572615] dyndbg: processed 2 queries, with 61 matches, 0 errs
> [    6.573286] ACPI: bus type drm_connector registered
>
> next required module is loaded, but drm.debug isnt propagated.
>
> [    6.578645] dyndbg: add-module: drm_kms_helper.94 sites
> [    6.579487] dyndbg: class[0]: module:drm_kms_helper base:0 len:10 ty:0
> [    6.580639] dyndbg:  0: 0 DRM_UT_CORE
> [    6.581135] dyndbg:  1: 1 DRM_UT_DRIVER
> [    6.581651] dyndbg:  2: 2 DRM_UT_KMS
> [    6.582178] dyndbg:  3: 3 DRM_UT_PRIME
> [    6.582927] dyndbg:  4: 4 DRM_UT_ATOMIC
> [    6.583627] dyndbg:  5: 5 DRM_UT_VBL
> [    6.584350] dyndbg:  6: 6 DRM_UT_STATE
> [    6.584999] dyndbg:  7: 7 DRM_UT_LEASE
> [    6.585699] dyndbg:  8: 8 DRM_UT_DP
> [    6.586354] dyndbg:  9: 9 DRM_UT_DRMRES
> [    6.587040] dyndbg: module:drm_kms_helper attached 1 classes
> [    6.588103] dyndbg:  94 debug prints in module drm_kms_helper
>
> and so on
>
> [    6.595628] dyndbg: add-module: drm_display_helper.150 sites
> [    6.596442] dyndbg: class[0]: module:drm_display_helper base:0 len:10 ty:0
> [    6.597453] dyndbg:  0: 0 DRM_UT_CORE
> ...
> [    6.601678] dyndbg: module:drm_display_helper attached 1 classes
> [    6.602335] dyndbg: 150 debug prints in module drm_display_helper
>
> [    6.692760] dyndbg: add-module: i915.1657 sites
> [    6.693023] dyndbg: class[0]: module:i915 base:0 len:10 ty:0
> [    6.693323] dyndbg:  0: 0 DRM_UT_CORE
> ....
> [    6.695220] dyndbg: module:i915 attached 1 classes
> [    6.695463] dyndbg: 1657 debug prints in module i915
> bash-5.2#
> bash-5.2#
>
>
> So, what I think I need to add:
>
> ddebug_add_module()  scans the module being loaded,
> looking for a param thats wired to dyndbg's modparam callback.
> Then it calls that callback, with the val of the sysfs-node
> (drm.debug in this case), and the module (i915)

Ok, I thought the sysfs callbacks only happen when
the sysfs file is written? And thus this works once
when the sysfs file is explicitly written by the user
after boot but not before then?

Thanks,

-Jason

>
> the callback will then run the query to enable callsites per drm.debug.
>
> I'll guess the kparams I need to find are in a section somewhere
> Anyone want to toss a lawn-dart at the code I need to look at, copy ?
>
>> --
>> Ville Syrjälä
>> Intel
> thanks again
> Jim

