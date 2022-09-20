Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301C75BDABB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 05:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A02E10E254;
	Tue, 20 Sep 2022 03:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net
 [150.101.137.141])
 by gabe.freedesktop.org (Postfix) with ESMTP id 833FD10E254;
 Tue, 20 Sep 2022 03:14:46 +0000 (UTC)
X-SMTP-MATCH: 1
IronPort-Data: =?us-ascii?q?A9a23=3AfFSx46iTVFuokU3YwQikc0bKX161nBEKZh0uj?=
 =?us-ascii?q?C45NGQN5FlHY01jehtvDGyOaKvbYmT3fNAiaI+wpx5UvcLRx4NiQQZqqno8R?=
 =?us-ascii?q?CkU8cSfX4iVJE6uNnmfIJyZQhxu5p4VYYXMcZhpFiTVqz6gY+PrxZVe/fjYH?=
 =?us-ascii?q?uCmVIYoGczQqTeJ+07NsDo78wIEqtcAbeaRU1vlVeza+6UzCHf9s9JFGjp8B?=
 =?us-ascii?q?5Cr8XuDj9yq0N8shWHSUNgQ1LPoe9j5O7pETU25ByOQroC5hYdWTc6bpF2y1?=
 =?us-ascii?q?juxExvAlrqYfrjHnk0iGtY+PCC90yAJHfDk2l4bk0Te0I5icqNANgEG0nPQw?=
 =?us-ascii?q?IoZJNZl7PRcTS8gJLHMhf5bVhBCCCFWPKta9aXBJnSy98uViUvLbxMAxt00X?=
 =?us-ascii?q?BhubNJCqr8f7WZmr6dGcFjhdCurjua70L62V+Jsi94LI8ziPYdZsXZlpRnpD?=
 =?us-ascii?q?PAmXJGFe6zMzdZd0HE7gcUmNf/ffc4YZDZHaBXGfg0JO1p/IJs6kfehgHXya?=
 =?us-ascii?q?XtUpU+epacty2HWwEp6172FGNPQdpmFS9V9mkeDunmA8X70Dx0XL9+DziLD9?=
 =?us-ascii?q?Wij7sfGgDnyUoMUGLr+7v9uhFSS7mUWBFsdUl7TifK5kE+lR9NWLQoX/Scor?=
 =?us-ascii?q?Kca/UmnCNL6WnWQrGSF+xIRRddUO+k78x2WjKTO7guVC3MHUjlZLts8u6ceS?=
 =?us-ascii?q?iYn21mHmNTBGG019rCIIVqS67yUsDX0MigYK0cLYCNCRgwAi/HjqYQhh1TKR?=
 =?us-ascii?q?9ZtF6mnptTwFXf7xDXihCw/gagDyM0GzaO2+XjZjD+24JvEVAg44kPQRG3Nx?=
 =?us-ascii?q?hh0bYi9bpGswVPb9/FFLZucCF6bsxA5d2K2+LhbSMjV0nSZGbBVWum9vaPdd?=
 =?us-ascii?q?myD2gV7RMx5sWm5pCubd4REuWkrfAMxJq7oYhewJhaP5kUAvdkKYyHCUEO+W?=
 =?us-ascii?q?KrpY+xC8EQqPY2NuijoU+dz?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A50ELeaAJr/gAkfjlHemg55DYdb4zR+YMi2?=
 =?us-ascii?q?TC1yhKJSC9Ffbo8/xG/c5rsCMc5wx7ZJhNo7q90ey7IE80lqQFg7X5X43SPz?=
 =?us-ascii?q?UO0VHARL2Kr7GD/9SKIULDH4BmuJuIP5IRNOHN?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CaAQCULyljAKxbkwENTYEJCYFGhH2?=
 =?us-ascii?q?EToJijjWLKpF6gWgLAVMEAQGFBQKEayY3Bg4BAgQVAQEGAQEBAQEHBBABOVK?=
 =?us-ascii?q?MOAEBAQMjVhALDQcEAgImAgIhNgYOBYJ9gm4Dq2l6gTEaZ4cpDWeBZYERLYF?=
 =?us-ascii?q?lhRmEaYQ8N4FVRIEVJw8Ngmc+giCCAgEBBxmDVjiCLgSEBZR3OAMaKx1BAwt?=
 =?us-ascii?q?CNBgDFAMFJAcDGQ8jDQ0EFgcMAwMFJQMCAhsHAgIDAgYTBQICTTgIBAgEKyQ?=
 =?us-ascii?q?PBQIHLwUELwIeBAUGEQgCFgIGBAQEBBUCEAgCCCYXBxMYGxkBBVkQCSEcDho?=
 =?us-ascii?q?NBQYTAwoWbwUKOw8oMmsrHRsKgQwqKBUDBAQDAgYTAwMiAhAqMRQEKRMSLQc?=
 =?us-ascii?q?rcwkCAyIEYwUDAwQoLAMJQAcoJjwHWDoBBAMDECI9BgMJAwIkWnk3ExUFAw0?=
 =?us-ascii?q?ZJggFIxYdBAg8AgUGmiSBFYE+BJQjCpBhnW86NAeDWYFBBgyYW4YJIwuDdox?=
 =?us-ascii?q?QhksDjAGFb5Q0glaEA40cmD2BfzMaLm8BgjxRnShlAjkCBgsBAQMJin0BAQ?=
Received: from unknown (HELO [127.0.0.1]) ([1.147.91.172])
 by ipmail03.adl2.internode.on.net with ESMTP; 20 Sep 2022 12:44:42 +0930
Date: Tue, 20 Sep 2022 12:44:25 +0930
From: Arthur Marsh <arthur.marsh@internode.on.net>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use dirty framebuffer helper
User-Agent: K-9 Mail for Android
In-Reply-To: <CADnq5_Py+dgAxa5Y1tzbWx6xRt1g2LQ1JsiJD6ewYYTzjjaPcw@mail.gmail.com>
References: <CADnq5_O0W-ipCCy3hsub5GwirjDTM76Xn3kAxgyZT5V+vDguSA@mail.gmail.com>
 <20220918120926.10322-1-user@am64>
 <CADnq5_Py+dgAxa5Y1tzbWx6xRt1g2LQ1JsiJD6ewYYTzjjaPcw@mail.gmail.com>
Message-ID: <EB4E527C-84AA-464D-9B14-CA8D9E116750@internode.on.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: guchun.chen@amd.com, airlied@linux.ie, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 aurabindo.pillai@amd.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, greenfoo@u92.eu, hamza.mahfooz@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, the patch applied against 6=2E0-rc6 kernel worked and the amdgpu mo=
dule loaded and works on my Radeon R7 250 (Cape Verde) GPU=2E

Arthur Marsh=2E=20

On 20 September 2022 2:03:54 am ACST, Alex Deucher <alexdeucher@gmail=2Eco=
m> wrote:
>On Sun, Sep 18, 2022 at 8:09 AM root <arthur=2Emarsh@internode=2Eon=2Enet=
> wrote:
>>
>> Hi, I recently experienced lock-ups that only responded to magic sysreq
>> reboots when the amdgpu module was loading on my pc (Athlon II X4 640 C=
PU,
>> with Radeon R7 250 - Cape Verde)=2E
>>
>> =2Econfig has:
>>
>> CONFIG_DRM_AMDGPU=3Dm
>> CONFIG_DRM_AMDGPU_SI=3Dy
>> # CONFIG_DRM_AMDGPU_CIK is not set
>> # CONFIG_DRM_AMDGPU_USERPTR is not set
>>
>> kernel command line has:
>>
>> amdgpu=2Eaudio=3D1 amdgpu=2Esi_support=3D1 radeon=2Esi_support=3D0 page=
_owner=3Don \
>> amdgpu=2Egpu_recovery=3D1
>>
>> Bisecting lead to:
>>
>> commit 66f99628eb24409cb8feb5061f78283c8b65f820
>> Author: Hamza Mahfooz <hamza=2Emahfooz@amd=2Ecom>
>> Date:   Tue Sep 6 15:01:49 2022 -0400
>>
>>     drm/amdgpu: use dirty framebuffer helper
>>
>>     Currently, we aren't handling DRM_IOCTL_MODE_DIRTYFB=2E So, use
>>     drm_atomic_helper_dirtyfb() as the dirty callback in the amdgpu_fb_=
funcs
>>     struct=2E
>>
>>     Signed-off-by: Hamza Mahfooz <hamza=2Emahfooz@amd=2Ecom>
>>     Acked-by: Alex Deucher <alexander=2Edeucher@amd=2Ecom>
>>     Signed-off-by: Alex Deucher <alexander=2Edeucher@amd=2Ecom>
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display=2Ec b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_display=2Ec
>> index c20922a5af9f=2E=2E5b09c8f4fe95 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display=2Ec
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display=2Ec
>> @@ -38,6 +38,7 @@
>>  #include <linux/pci=2Eh>
>>  #include <linux/pm_runtime=2Eh>
>>  #include <drm/drm_crtc_helper=2Eh>
>> +#include <drm/drm_damage_helper=2Eh>
>>  #include <drm/drm_edid=2Eh>
>>  #include <drm/drm_gem_framebuffer_helper=2Eh>
>>  #include <drm/drm_fb_helper=2Eh>
>> @@ -496,6 +497,7 @@ bool amdgpu_display_ddc_probe(struct amdgpu_connect=
or *amdgpu_connector,
>>  static const struct drm_framebuffer_funcs amdgpu_fb_funcs =3D {
>>         =2Edestroy =3D drm_gem_fb_destroy,
>>         =2Ecreate_handle =3D drm_gem_fb_create_handle,
>> +       =2Edirty =3D drm_atomic_helper_dirtyfb,
>>  };
>>
>>  uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>>
>> After doing a git bisect reset, git pull and reverting the patch above,=
 I
>> rebuilt the kernel and am successfully running with the amdgpu module l=
oaded
>> and using the Radeon R7 250 GPU=2E
>>
>> I am happy to supply any further configuration details=2E
>
>Does the attached patch help?
>
>Alex
>
>
>>
>> Arthur Marsh=2E

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
