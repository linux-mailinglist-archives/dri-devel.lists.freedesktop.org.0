Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527472113CA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 21:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6639F6E453;
	Wed,  1 Jul 2020 19:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639966E453
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 19:45:46 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efce7850000>; Wed, 01 Jul 2020 12:44:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 01 Jul 2020 12:45:45 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 01 Jul 2020 12:45:45 -0700
Received: from [172.20.40.59] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Jul
 2020 19:45:44 +0000
Subject: Re: [git pull] drm for 5.8-rc1
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <20200701075719.p7h5zypdtlhqxtgv@box> <20200701075902.hhmaskxtjsm4bcx7@box>
From: James Jones <jajones@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
Date: Wed, 1 Jul 2020 12:45:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701075902.hhmaskxtjsm4bcx7@box>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593632645; bh=ghM4qShwWSbYqJQbyb2hcO/I2/1p5a/toFeW9Xfiywg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=KOrYrvDE+eExwZMFKeEx2yKVJyEp8eUWywvw+jVwmh/J89sJzy4/FBd3p0i8e268p
 z1zAur/c8IlgOtyAU4+DMU/tT73C/5jEmkyDbMdDpp0Jbe5QlD3bkdMOihu6d2zWJB
 99Nts+Ik4mcDdHYuZuGBwCSdKP4RiZ1WJnq6UWabVt8ZhBFM9UgXtK8qYzkDMC2BpI
 sBVZpRyd/mPhr5moqCHcD5JQ6qUQT8bg4Dg4EepsbiI95qMZP9wVxHA0bGKsFqLJpU
 927qNXMaHVqYFsbW96lT0JiHH7vUCxNEEe+nvkkIAtLNrNPqE8S/DOUxu3OzKAtEV+
 AqFT4M5p4g49g==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OK, I think I see what's going on.  In the Xorg modesetting driver, the 
logic is basically:

if (gbm_has_modifiers && DRM_CAP_ADDFB2_MODIFIERS != 0) {
   drmModeAddFB2WithModifiers(..., gbm_bo_get_modifier(bo->gbm));
} else {
   drmModeAddFB(...);
}

There's no attempt to verify the DRM-KMS device supports the modifier, 
but then, why would there be?  GBM presumably chose a supported modifier 
at buffer creation time, and we don't know which plane the FB is going 
to be used with yet.  GBM doesn't actually ask the kernel which 
modifiers it supports here either though.  It just goes into Mesa via 
DRI and reports the modifier (unpatched) Mesa chose on its own.  Mesa 
just hard-codes the modifiers in its driver backends since its thinking 
in terms of a device's 3D engine, not display.  In theory, Mesa's DRI 
drivers could query KMS for supported modifiers if allocating from GBM 
using the non-modifiers path and the SCANOUT flag is set (perhaps some 
drivers do this or its equivalent?  Haven't checked.), but that seems 
pretty gnarly and doesn't fix the modifier-based GBM allocation path 
AFAIK.  Bit of a mess.

For a quick userspace fix that could probably be pushed out everywhere 
(Only affects Xorg server 1.20+ AFAIK), just retrying 
drmModeAddFB2WithModifiers() without the DRM_MODE_FB_MODIFIERS flag on 
failure should be sufficient.  Still need to verify as I'm having 
trouble wrangling my Xorg build at the moment and I'm pressed for time. 
A more complete fix would be quite involved, as modesetting isn't really 
properly plumbed to validate GBM's modifiers against KMS planes, and it 
doesn't seem like GBM/Mesa/DRI should be responsible for this as noted 
above given the general modifier workflow/design.

Most importantly, options I've considered for fixing from the kernel side:

-Accept "legacy" modifiers in nouveau in addition to the new modifiers, 
though avoid reporting them to userspace as supported to avoid further 
proliferation.  This is pretty straightforward.  I'll need to modify 
both the AddFB2 handler (nouveau_validate_decode_mod) and the mode set 
plane validation logic (nv50_plane_format_mod_supported), but it should 
end up just being a few lines of code.

-Don't validate modifiers in AddFB.  This doesn't really gain anything 
because it just pushes the failure down to mode set time, so it's not 
that useful, so I don't plan on pursuing this.

As noted, need to run just now, but I should have a kernel patch to test 
out either tonight or tomorrow.

If anyone's curious, the reason my testing missed this was I did most of 
my verification of "old" code against the Xorg 1.19 build included with 
my distro.  I did hack up a Xorg 1.20-ish build to test as well that 
would have included this path, but I must not have properly configured 
it with GBM modifier support somehow.  I was pretty focused on just 
testing the forcibly-disabled atomic path in the modesetting driver in 
this build, so I didn't look too closely at things beyond that.

Thanks,
-James

On 7/1/20 12:59 AM, Kirill A. Shutemov wrote:
> On Wed, Jul 01, 2020 at 10:57:19AM +0300, Kirill A. Shutemov wrote:
>> On Tue, Jun 30, 2020 at 09:40:19PM -0700, James Jones wrote:
>>> This implies something is trying to use one of the old
>>> DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK format modifiers with DRM-KMS without
>>> first checking whether it is supported by the kernel.  I had tried to force
>>> an Xorg+Mesa stack without my userspace patches to hit this error when
>>> testing, but must have missed some permutation.  If the stalled Mesa patches
>>> go in, this would stop happening of course, but those were held up for a
>>> long time in review, and are now waiting on me to make some modifications.
>>>
>>> Are you using the modesetting driver in X? If so, with glamor I presume?
>>
>> Yes and yes. I attached Xorg.log.
> 
> Attached now.
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
