Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B7755B07E
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 11:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB97F14A043;
	Sun, 26 Jun 2022 09:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A2411A3F8
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656234028;
 bh=4JTTJ+kbaPqKPFOgbEGARfy7j/B90YHYQ2E3XLiro7g=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=eLzPO6mjr2W69HThQGfzblMdaxAtk6d0mMrHZ2+KWMP9rIQT52gMMrEnRkn/3mQla
 5/JJeG6wZD+6ILMe24y8XxzFfL74Tc4MUZ1IlWdKMOQBryIf3I/xHfq8IevBr2oehC
 NFjsbofAlU2FUXrnOREu84loTny13R4mTLI1t5mI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.135.166]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgvrB-1nR8Qj09xl-00hKCG; Sun, 26
 Jun 2022 11:00:28 +0200
Message-ID: <cc01521c-dc55-4aa1-290a-ab10c217e905@gmx.de>
Date: Sun, 26 Jun 2022 11:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/4] fbmem: Check screen resolution change against font
 size
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220625220630.333705-1-deller@gmx.de>
 <20220625220630.333705-4-deller@gmx.de> <YreNUfv8d9QeJT8C@phenom.ffwll.local>
 <YreODaSXhAhipJKa@phenom.ffwll.local>
 <5e03d6c5-e254-f5f6-9e02-bc996d41718d@gmx.de>
 <92f2ca1e-20f7-c456-0cd2-609202e337a2@gmx.de>
 <YrgdkWEvxrh5Wam9@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YrgdkWEvxrh5Wam9@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lLaCPB8AKVwj5u1k794LpjrG+kIJTzWh4Jk/PPWGWDkkvPnO9Fo
 JOceBVBHRFqAdMzLUdi9GkDE7m8yqm3vkUsK3/piCtlP3qzU/sRs16fvGN7s6++1Us5GjeF
 q2GsOGDAEiVb5wm8qVpl4FA4ZuDM6zcjz6vVTfcMkW3thmwRxLhn27ERLzR2fu/gKplN9ww
 gKp7tX8nqVKhOZLjosjtw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uRe4d/QE9IE=:88DI7FSHG0x5IS5yY9Uy9Y
 rX/8s4OOXrAbpXIfD0JklIjN0c18FS2Mws2h0CSKndQcZm+r+uBhtiJbTZ507+thrnvJjE4kQ
 wU0MKxCx36Co/Xm6nYVH7J494jU5fZi36QPX8I6PsCYcnUgz4TYaW9hmPfWLt3mya6C2GHIaN
 f4wWQ5+ZfXyQ8u2yrjgfDItQJ9bzV0/+2S9RTBKr+uMBNcc0H6axTQMMe2U0wtNEecCrPTc9c
 W7Rt9n2Of6tMenpjN+WBwp0oUTMBEmeVVUrvoqXFrgBA4+X7ETmC5Kp83P54XsdKM3l/6VvtQ
 DpYJ9yFNGlgGZICkIblqb1gndvEjvOZwVlmvbHK6XI6jfJhzAT64cx25YDEDkaLswn3Sq2UCV
 q+43+56eLfDGwew4MzJue1OxwHeog5waYZ2XkNYSNaEpKF9NnvFembhcE2IZ+6IrSbuwnUM1i
 B+wAl23jXxr590tqfgAw1ohuWVCz84HhMbjHrE+lcAYyeHm0KIFz29UeY9I2LrkUnhrkzlr06
 Jaie53jqxUfSWSvciXtxm4kgD47PbO0VxKSDjFwq5cfD12qT7KKWieN55mU7ZZRMJ9HvwPhAd
 4mxnPf0H/YC26v9nW7xHgdozJcbBrhLNggR2W5GcIKAeBgtGJjM9A8PnKo06VsQlO8l4yO/W6
 Bs0dFU5aLhyNHr0tc+eTwoF8VNXYGYFDcbIHU3v28T8+GqqGRsJUUMvAkPOhvH75+7kwFMHyh
 626vIUPxNb0G0Pu8jW2dYvSE37duEWUKpnL5L1cT9CCVzNXmBnfX7VcxRVjj7iZr9j5Klbhwg
 dOFqF0/JLKOWvLhdWQ+t3/5fb/s22b1hOpuQNLcrSE/o0KJFOfdlqQJ3DWFZFN5rtOPgfYdC0
 B9YZLmumLEIMbNo2RwSf62cJ3Xvd+QpcKgLQ5NtjxnRhrfKxUOAdpi91OO8pYzq557HN6W4g6
 rq8kobBYIustCQITNa4e4McnrFpRj5jTguo6HceEALUvzxAXOSpb7rhZXjN1uF9+wJkaKUBsI
 T8rSsy/TiAnItRex4+qXSpcmg4poILqF6vgdcBm2lJCtXNcRSiHG22jMLS2isnRkT5LlMDh0L
 JWGN9trmRvbS4yEULHfGQ68NdzwfB18B5SKsZ546rq/y7okRbgOyWAH/Q==
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/26/22 10:49, Daniel Vetter wrote:
> On Sun, Jun 26, 2022 at 01:56:18AM +0200, Helge Deller wrote:
>> On 6/26/22 01:12, Helge Deller wrote:
>>> On 6/26/22 00:37, Daniel Vetter wrote:
>>>> On Sun, Jun 26, 2022 at 12:33:53AM +0200, Daniel Vetter wrote:
>>>>> On Sun, Jun 26, 2022 at 12:06:29AM +0200, Helge Deller wrote:
>>>>>> Enhance the check in the FBIOPUT_VSCREENINFO ioctl handler to verif=
y if the
>>>>>> user-provided new screen size is bigger than the current font size.
>>>>>>
>>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>>> Cc: stable@vger.kernel.org # v5.4+
>>>>>
>>>>> Please squash with previous patch. You might also want to add a note=
 there
>>>>> that on older kernels backporters need to open-code
>>>>> fbcon_info_from_console instead, since it only exists since
>>>>> 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_info lookup"=
)
>>>>
>>>> Maybe easier would be to include that patch in the backports instead =
of
>>>> open coding.
>>>
>>> I was afraid that WARN_CONSOLE_UNLOCKED() hadn't been backported.
>>> But it seems it's in v4.19+ (from patch 56e6c104e4f15), so that's ok.
>>>
>>> So, yes, it seems pushing 409d6c95f9c6 backwards is probably best.
>>
>> It would be the best solution, but sadly 409d6c95f9c6 can't easily be b=
ackported.
>> So, probably my other approach (fix up afterwards with extra patch) is
>> the way to go.
>
> Ah right there's some conflicts with the restoration/removal of scroll
> accel.
>
>> What's your thought on this ?
>
> I guess just open code in a separate backport is simplest.

I think my just-sent series is somewhat smarter... use old open-coding
in patch which goes backwards, and then just fix up in v5.19 (where
commit 409d6c95f9c6 was added).

Helge



> -Daniel
>
>>
>> Helge
>>
>>
>>
>>> Will try that approach now.
>>>
>>> Helge
>>>
>>>  I think that's what Greg generally prefers at least, less
>>>> divergence between stable kernels.
>>>> -Daniel
>>>>
>>>>>
>>>>> With these two nits: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll=
.ch>
>>>>>
>>>>>> ---
>>>>>>  drivers/video/fbdev/core/fbmem.c | 4 +++-
>>>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev=
/core/fbmem.c
>>>>>> index afa2863670f3..160389365a36 100644
>>>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>>>> @@ -1106,7 +1106,9 @@ static long do_fb_ioctl(struct fb_info *info,=
 unsigned int cmd,
>>>>>>  			return -EFAULT;
>>>>>>  		console_lock();
>>>>>>  		lock_fb_info(info);
>>>>>> -		ret =3D fb_set_var(info, &var);
>>>>>> +		ret =3D fbcon_modechange_possible(info, &var);
>>>>>> +		if (!ret)
>>>>>> +			ret =3D fb_set_var(info, &var);
>>>>>>  		if (!ret)
>>>>>>  			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>>>>>>  		unlock_fb_info(info);
>>>>>> --
>>>>>> 2.35.3
>>>>>>
>>>>>
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> http://blog.ffwll.ch
>>>>
>>>
>>
>

