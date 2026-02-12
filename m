Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AULDAvsjWnG8gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 16:04:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE1D12EC09
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 16:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A160F10E75A;
	Thu, 12 Feb 2026 15:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="GY61PfCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com
 [162.62.57.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8DC10E75A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1770908671;
 bh=69/IEsj8R31gocE8inaSyurdU6qgd06bg5RSPoK31Lo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=GY61PfCsQm6V1r+OgxpkKGyr3VCtvPxjAiyIN8AmdSyugWwk0d4nawXxcUjoDnpXk
 hFQv8lJc2j2R00jrojnht3VKql51ChLkAI0h2I8Q4QGx6gLXbQizJRc5RNV0lCWD9h
 wO7Gn3yjx9ZdvYIXeH3nORkBS9M6D0Y8g033DmlI=
Received: from [127.0.0.1] ([171.223.167.146])
 by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
 id 11C98AB5; Thu, 12 Feb 2026 23:04:28 +0800
X-QQ-mid: xmsmtpt1770908668tc9mvlaqu
Message-ID: <tencent_2AAD56FDA429585DB3A835F1C98CE2566707@qq.com>
X-QQ-XMAILINFO: NwU6Bou9okj/1jn/WsVtrP0vu+h0WQkIEb4jjYwZW38J9AgktKgtZCtfgx+Oyb
 4VtlOLiuS93cYBzZ7C4Zoh6X/uHPwFs1jf4iQ7jOrD1K0N5AftkAeHqVG2KwtX+K/g+fbj7/OyZS
 DiVTbJsU+AmGUywIUjZW2zwUjYO8ppyt3j2Xwqf8AFKApnxBaxkM1pTeu5f1XFttSvZH3k1S2E/C
 fZBVoUqXjx/kg18KhshJOk+0RtU9c7r2/QLJj4oKDY/HnmXLKL9+Ikw+Xa4rPGKiMOWUTTxxHaH/
 0RtlPJUTZ2Jp3LVt/3c7EA9hMk5+5uR3JU2Rqz5dlymOthAAaj3Burpz4ZzVl54Hd1L2DKvGIsdE
 d5rzaXvFkrKtLhG8KCHnKCb4Wqzo3ZfVhPjvwA2w6SoU/SVQ9CoJpPO/d0z6246fhH8C6ZzmM8cr
 q0rUhl5llyORvjBjDUpFyYDCCy5wY3Jo0UK34wnWcB2jc85tyNTH3yLolizX3BUT58Us4ILbhf/X
 2guonx++rjH3yiKd4yosUEn+w/5nr9MC2yz0XI0+0P9UotTUp3Hypnj8BBPmiOShoVnWVj6JPDCQ
 UiXm5rjGK96GIyzYbrTHDrI30jG6RhDYLJxtWCaCbGoc4H1JZvM6yCtPEDCnOCExO81vWmzkNuCh
 wp/kRZxXhbET8RaVDQ/ZFYcimqnPMeX5SdahyfAqWDs91jSmi8lTyiIE/JZmidv1HhXYKQh2ee3D
 vzeFVNEcUvvfUDkkZz6isZhoi1J9GDe7cgrjiuI30j84rZ71H98mHl/+B3pmXg6txE6lFgLW6DoQ
 sksbmuBQ66/fsR7oNKL/nOy9/4QeKh4pSrC59p3Bq3tgvFzEKi1FERXRM0PvQcAIqzMRk8DhJIgL
 QBS4SAGQehnSEjHbJC+DVqllaE2bmigFpWMOblkS42dp5vX6dUtTj6ToDIamdstoYZxg40phkh+a
 AnZA7pfoFir1Ul6RYYe9ksBKo6hcyWWlvlmbZEeXMpaAzqwT3sRUu9q8OH0GyXM1plrnqEm2OWyD
 sz82r6sf38uk/WSeFcavyrFoTPNssRegsHRH1uDn+VXmr9Xrr3MyF2d2hAKGA=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-OQ-MSGID: <e54f1e458c5e4556341ecdfafa79b76895083a14.camel@foxmail.com>
Subject: Re: [PATCH] drm/vkms: fix gamma LUT size check
From: Renjun Wang <renjunw0@foxmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, hamohammed.sa@gmail.com, 
 simona@ffwll.ch, melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 12 Feb 2026 23:04:28 +0800
In-Reply-To: <5ee4e72c-0862-40b3-b47b-70ca5d8f89c1@bootlin.com>
References: <tencent_78CE07AD804905B05466486B299306C51B08@qq.com>
 <5ee4e72c-0862-40b3-b47b-70ca5d8f89c1@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[foxmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[foxmail.com:s=s201512];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[renjunw0@foxmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[foxmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[renjunw0@foxmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[foxmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: DEE1D12EC09
X-Rspamd-Action: no action

Hi Louis,

Actually for a 64-bit machine, the value of sizeof(struct
drm_color_lut) and sizeof(struct drm_color_lut*) is equal. But for
32-bit machine, it is not equal. The definition of struct=C2=A0
drm_color_lut shown as follows:

struct drm_color_lut {
	__u16 red;
	__u16 green;
	__u16 blue;
	__u16 reserved;
}

There is one test case in igt-gpu-tools for gamma, and the 32-bit
machine test results shown as below:

before patch:

# IGT_FORCE_DRIVER=3Dvkms ./kms_color  --run-subtest gamma
[241590.953610] Console: switching to colour dummy device 80x25
[241590.955637] [IGT] kms_color: executing
IGT-Version: 2.3-NO-GIT (riscv32) (Linux: 6.18.7 riscv32)
Using IGT_SRANDOM=3D1770864024 for randomisation
Opened device: /dev/dri/card0
[241590.966858] [IGT] kms_color: starting subtest gamma
Starting subtest: gamma
[241590.968030] [IGT] kms_color: starting dynamic subtest pipe-A-
Virtual-1
Starting dynamic subtest: pipe-A-Virtual-1
(kms_color:235) igt_kms-CRITICAL: Test assertion failure function
igt_pipe_commit, file ../lib/igt_kms.c:4212:
(kms_color:235) igt_kms-CRITICAL: Failed assertion: ret =3D=3D 0
(kms_color:235) igt_kms-CRITICAL: Last errno: 22, Invalid argument
(kms_color:235) igt_kms-CRITICAL: error: -22 !=3D 0
Stack trace: not implemented
Dynamic subtest pipe-A-Virtual-1 failed.

after patch:

# uname -a
Linux buildroot 6.18.7 #2 SMP Mon Feb  9 15:22:27 CST 2026 riscv32
GNU/Linux
# pwd
/usr/libexec/igt-gpu-tools
# lsmod|grep vkms
vkms                   53248  0
drm_shmem_helper       20480  2 vkms
drm_client_lib         12288  1 vkms
drm_kms_helper        122880  3 vkms,drm_shmem_helper,drm_client_lib
drm                   458752  5
vkms,drm_shmem_helper,drm_client_lib,drm_kms_helper
# IGT_FORCE_DRIVER=3Dvkms ./kms_color  --run-subtest gamma
[  111.981381] Console: switching to colour dummy device 80x25
[  111.983078] [IGT] kms_color: executing
IGT-Version: 2.3-NO-GIT (riscv32) (Linux: 6.18.7 riscv32)
Using IGT_SRANDOM=3D1770864535 for randomisation
Opened device: /dev/dri/card0
[  111.992250] [IGT] kms_color: starting subtest gamma
Starting subtest: gamma
[  111.993166] [IGT] kms_color: starting dynamic subtest pipe-A-
Virtual-1
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (7.498s)
[  119.492455] [IGT] kms_color: finished subtest pipe-A-Virtual-1,
SUCCESS
Subtest gamma: SUCCESS (7.501s)
[  119.495286] [IGT] kms_color: finished subtest gamma, SUCCESS
[  119.497233] [IGT] kms_color: exiting, ret=3D0
[  119.517787] Console: switching to colour frame buffer device 128x48

Best Regards,
Renjun Wang


On Fri, 2026-02-06 at 14:53 +0100, Louis Chauvet wrote:
>=20
>=20
> On 2/4/26 15:15, Renjun Wang wrote:
> > vkms_atomic_check() computed the gamma LUT entry count using
> > sizeof(struct drm_color_lut *), which uses pointer size and
> > can incorrectly reject or accept LUT sizes. Use
> > drm_color_lut_size() instead to validate against VKMS_LUT_SIZE.
> >=20
> > Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
>=20
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>=20
> Like for the YUV patch, were you able to reproduce it using a tool?
>=20
> > ---
> > =C2=A0 drivers/gpu/drm/vkms/vkms_drv.c | 4 ++--
> > =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c
> > b/drivers/gpu/drm/vkms/vkms_drv.c
> > index dd1402f43773..a09589949f48 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -17,6 +17,7 @@
> > =C2=A0 #include <drm/drm_gem.h>
> > =C2=A0 #include <drm/drm_atomic.h>
> > =C2=A0 #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_color_mgmt.h>
> > =C2=A0 #include <drm/drm_drv.h>
> > =C2=A0 #include <drm/drm_fbdev_shmem.h>
> > =C2=A0 #include <drm/drm_file.h>
> > @@ -111,8 +112,7 @@ static int vkms_atomic_check(struct drm_device
> > *dev, struct drm_atomic_state *st
> > =C2=A0=C2=A0		if (!new_crtc_state->gamma_lut || !new_crtc_state-
> > >color_mgmt_changed)
> > =C2=A0=C2=A0			continue;
> > =C2=A0=20
> > -		if (new_crtc_state->gamma_lut->length /
> > sizeof(struct drm_color_lut *)
> > -		=C2=A0=C2=A0=C2=A0 > VKMS_LUT_SIZE)
> > +		if (drm_color_lut_size(new_crtc_state->gamma_lut)
> > > VKMS_LUT_SIZE)
> > =C2=A0=C2=A0			return -EINVAL;
> > =C2=A0=C2=A0	}
> > =C2=A0=20

