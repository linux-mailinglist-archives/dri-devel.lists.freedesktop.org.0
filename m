Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0247E50C2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 08:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8527A10E388;
	Wed,  8 Nov 2023 07:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 49661 seconds by postgrey-1.36 at gabe;
 Wed, 08 Nov 2023 07:02:59 UTC
Received: from 6.mo561.mail-out.ovh.net (6.mo561.mail-out.ovh.net
 [188.165.43.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FE810E388
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 07:02:59 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.20.144])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 5D53C285A5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 07:02:58 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-lkwnp (unknown [10.110.115.9])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9A5291FD24;
 Wed,  8 Nov 2023 07:02:57 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
 by ghost-submission-6684bf9d7b-lkwnp with ESMTPSA
 id nOucGqEyS2V5+woArb8c/A
 (envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 08 Nov 2023 07:02:57 +0000
MIME-Version: 1.0
Date: Wed, 08 Nov 2023 09:02:56 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] drm/amd/pm: clean up redundant comparisons with 0
In-Reply-To: <f98d840d-f3ff-47e1-b609-2cfe33c65cb5@roeck-us.net>
References: <20231107082910.92508-1-jose.pekkarinen@foxhound.fi>
 <98e8490e-6608-47a8-890c-f1fe894dac7f@roeck-us.net>
 <65d132b0dbef66039fd6938ecbc2bf68@foxhound.fi>
 <f98d840d-f3ff-47e1-b609-2cfe33c65cb5@roeck-us.net>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <b15e6759f51beed255036b9b3c7c6740@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 192.42.116.216
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3648478649106343617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddukedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpudelvddrgedvrdduudeirddvudeipdduhedurdektddrvdelrddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com,
 linux-kernel-mentees@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-11-07 20:03, Guenter Roeck wrote:
> On 11/7/23 09:26, José Pekkarinen wrote:
>> On 2023-11-07 16:08, Guenter Roeck wrote:
>>> On 11/7/23 00:29, José Pekkarinen wrote:
>>>> There is a couple of function return checks of functions that return
>>>> unsigned values, and local variables to hold them are also unsigned, 
>>>> so
>>>> checking if they are negative will always return false. This patch 
>>>> will
>>>> remove them, as well as the never reached code.
>>>> 
>>>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2801:5-8: WARNING: Unsigned 
>>>> expression compared with zero: val < 0
>>>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2814:5-8: WARNING: Unsigned 
>>>> expression compared with zero: val < 0
>>>> 
>>>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>>>> ---
>>>>   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ----
>>>>   1 file changed, 4 deletions(-)
>>>> 
>>>> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c 
>>>> b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>>>> index 8bb2da13826f..e7bb1d324084 100644
>>>> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>>>> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>>>> @@ -2798,8 +2798,6 @@ static ssize_t 
>>>> amdgpu_hwmon_show_power_avg(struct device *dev,
>>>>       unsigned int val;
>>>>         val = amdgpu_hwmon_get_power(dev, 
>>>> AMDGPU_PP_SENSOR_GPU_AVG_POWER);
>>>> -    if (val < 0)
>>>> -        return val;
>>>> 
>>> 
>>> This is reporting errors returned from amdgpu_hwmon_get_power() as
>>> large integers.
>> 
>>      Alright, that case it is a false positive, thanks for the 
>> comment!
>> 
> 
> 
> No, it isn't a false positive. The fix is wrong. The variable should be 
> declared
> 'int val', not 'unsigned int val'.

     Sorry I may have missunderstood your comment, I certainly can do the
minor fix then.

     Thanks!

     José.
