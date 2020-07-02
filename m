Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB47D212E90
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 23:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2EE6E255;
	Thu,  2 Jul 2020 21:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6C36E255
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 21:13:58 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efe4e090000>; Thu, 02 Jul 2020 14:13:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 02 Jul 2020 14:13:57 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 02 Jul 2020 14:13:57 -0700
Received: from [172.20.40.54] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 21:13:57 +0000
Subject: Re: [git pull] drm for 5.8-rc1
To: Daniel Stone <daniel@fooishbar.org>
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <20200701075719.p7h5zypdtlhqxtgv@box> <20200701075902.hhmaskxtjsm4bcx7@box>
 <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
 <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
From: James Jones <jajones@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <5ffa32db-4383-80f6-c0cf-a9bb12e729aa@nvidia.com>
Date: Thu, 2 Jul 2020 14:14:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593724425; bh=zRMa3tFNrvFTLZm34tiIHjXWilkhurLRyVAaSrk7gpA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=I2TRX/YhTsv5dRWqwj55ta7jfuKrhC1JoW5WY9R1KTJwKq/Z7wvNDiwSSdxmCW/6I
 5LB9AYm0riLqoyvcjb9lyuzYVFWeB3TxVLYIXgJVuVgQPlcm/YwnBVAiP1I5cfTVpj
 SX8p0hRHKK+W25AcxLKruGCZme1pgqOoiwZokoaYtf0bD/H+iqgXrMVLmPxgRtFqKQ
 FheB1hMO/Z3tykZcV2X2AxnxMJIv8bAowB0BaL3/L7ATH8VjNsWAn6V8OJSsBbk73a
 SN1eOsGGPOZZ0U39bdFcp3fsXtvow3dSzeDgbtJ+lvc3G9AAsafW8pUDqRgTWuO9v1
 f8Jhj0cECSkIw==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/2/20 1:22 AM, Daniel Stone wrote:
> Hi,
> 
> On Wed, 1 Jul 2020 at 20:45, James Jones <jajones@nvidia.com> wrote:
>> OK, I think I see what's going on.  In the Xorg modesetting driver, the
>> logic is basically:
>>
>> if (gbm_has_modifiers && DRM_CAP_ADDFB2_MODIFIERS != 0) {
>>     drmModeAddFB2WithModifiers(..., gbm_bo_get_modifier(bo->gbm));
>> } else {
>>     drmModeAddFB(...);
>> }
> 
> I read this thread expecting to explain the correct behaviour we
> implement in Weston and how modesetting needs to be fixed, but ...
> that seems OK to me? As long as `gbm_has_modifiers` is a proxy for 'we
> used gbm_(bo|surface)_create_with_modifiers to allocate the buffer'.

Yes, the hazards of reporting findings before verifying.  I now see 
modesetting does query the DRM-KMS modifiers and attempt to allocate 
with them if it found any.  However, I still see a lot of ways things 
can go wrong, but I'm not going to share my speculation again until I've 
actually verified it, which is taking a frustratingly long time.  The 
modesetting driver is not my friend right now.

>> There's no attempt to verify the DRM-KMS device supports the modifier,
>> but then, why would there be?  GBM presumably chose a supported modifier
>> at buffer creation time, and we don't know which plane the FB is going
>> to be used with yet.  GBM doesn't actually ask the kernel which
>> modifiers it supports here either though.
> 
> Right, it doesn't ask, because userspace tells it which modifiers to
> use. The correct behaviour is to take the list from the KMS
> `IN_FORMATS` property and then pass that to
> `gbm_(bo|surface)_create_with_modifiers`; GBM must then select from
> that list and only that list. If that call does not succeed and Xorg
> falls back to `gbm_surface_create`, then it must not call
> `gbm_bo_get_modifier` - so that would be a modesetting bug. If that
> call does succeed and `gbm_bo_get_modifier` subsequently reports a
> modifier which was not in the list, that's a Mesa driver bug.
> 
>> It just goes into Mesa via
>> DRI and reports the modifier (unpatched) Mesa chose on its own.  Mesa
>> just hard-codes the modifiers in its driver backends since its thinking
>> in terms of a device's 3D engine, not display.  In theory, Mesa's DRI
>> drivers could query KMS for supported modifiers if allocating from GBM
>> using the non-modifiers path and the SCANOUT flag is set (perhaps some
>> drivers do this or its equivalent?  Haven't checked.), but that seems
>> pretty gnarly and doesn't fix the modifier-based GBM allocation path
>> AFAIK.  Bit of a mess.
> 
> Two options for GBM users:
> * call gbm_*_create_with_modifiers, it succeeds, call
> gbm_bo_get_modifier, pass modifier into AddFB
> * call gbm_*_create (without modifiers), it succeeds, do not call
> gbm_bo_get_modifier, do not pass a modifier into AddFB
> 
> Anything else is a bug in the user. Note that falling back from 1 to 2
> is fine: if `gbm_*_create_with_modifiers()` fails, you can fall back
> to the non-modifier path, provided you don't later try to get a
> modifier back out.
>
>> For a quick userspace fix that could probably be pushed out everywhere
>> (Only affects Xorg server 1.20+ AFAIK), just retrying
>> drmModeAddFB2WithModifiers() without the DRM_MODE_FB_MODIFIERS flag on
>> failure should be sufficient.
> 
> This would break other drivers.

I think this could be done in a way that wouldn't, though it wouldn't be 
quite as simple.  Let's see what the true root cause is first though.

>> Still need to verify as I'm having
>> trouble wrangling my Xorg build at the moment and I'm pressed for time.
>> A more complete fix would be quite involved, as modesetting isn't really
>> properly plumbed to validate GBM's modifiers against KMS planes, and it
>> doesn't seem like GBM/Mesa/DRI should be responsible for this as noted
>> above given the general modifier workflow/design.
>>
>> Most importantly, options I've considered for fixing from the kernel side:
>>
>> -Accept "legacy" modifiers in nouveau in addition to the new modifiers,
>> though avoid reporting them to userspace as supported to avoid further
>> proliferation.  This is pretty straightforward.  I'll need to modify
>> both the AddFB2 handler (nouveau_validate_decode_mod) and the mode set
>> plane validation logic (nv50_plane_format_mod_supported), but it should
>> end up just being a few lines of code.
> 
> I do think that they should also be reported to userspace if they are
> accepted. Other users can and do look at the modifier list to see if
> the buffer is acceptable for a given plane, so the consistency is good
> here. Of course, in Mesa you would want to prioritise the new
> modifiers over the legacy ones, and not allocate or return the legacy
> ones unless that was all you were asked for. This would involve
> tracking the used modifier explicitly through Mesa, rather than
> throwing it away at alloc time and then later divining it from the
> tiling mode.

Reporting them as supported is equivalent to reporting support for a 
memory layout the chips don't actually support (It corresponds to a 
valid layout on Tegra chips, but not on discrete NV chips).  This is 
what the new modifiers are trying to avoid in the first place: Implying 
buffers can be shared between these Tegra chips and discrete NV GPUs.

Thanks,
-James

> Cheers,
> Daniel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
