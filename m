Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A99728C91A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C506E89E;
	Tue, 13 Oct 2020 07:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4236E03C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 10:15:44 +0000 (UTC)
Date: Mon, 12 Oct 2020 12:15:31 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-Id: <V533IQ.G4C1EIUTGQYU3@crapouillou.net>
In-Reply-To: <20201012152452.432c4867@canb.auug.org.au>
References: <20201008140903.12a411b8@canb.auug.org.au>
 <20201008154202.175fbec7@canb.auug.org.au>
 <20201012152452.432c4867@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Oct 2020 07:16:53 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Le lun. 12 oct. 2020 =E0 15:24, Stephen Rothwell <sfr@canb.auug.org.au> =

a =E9crit :
> Hi all,
> =

> On Thu, 8 Oct 2020 15:42:02 +1100 Stephen Rothwell =

> <sfr@canb.auug.org.au> wrote:
>> =

>>  On Thu, 8 Oct 2020 14:09:03 +1100 Stephen Rothwell =

>> <sfr@canb.auug.org.au> wrote:
>>  >
>>  > After merging the drm-misc tree, today's linux-next build (x86_64
>>  > allmodconfig) failed like this:
>> =

>>  In file included from include/linux/clk.h:13,
>>                   from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:10:
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function =

>> 'ingenic_drm_update_palette':
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct =

>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean =

>> 'dma_hwdesc_f0'?
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/kernel.h:47:33: note: in definition of macro =

>> 'ARRAY_SIZE'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + =

>> __must_be_array(arr))
>>        |                                 ^~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct =

>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean =

>> 'dma_hwdesc_f0'?
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/kernel.h:47:48: note: in definition of macro =

>> 'ARRAY_SIZE'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + =

>> __must_be_array(arr))
>>        |                                                ^~~
>>  In file included from include/linux/bits.h:22,
>>                   from include/linux/bitops.h:5,
>>                   from drivers/gpu/drm/ingenic/ingenic-drm.h:10,
>>                   from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:7:
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct =

>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean =

>> 'dma_hwdesc_f0'?
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/build_bug.h:16:62: note: in definition of macro =

>> 'BUILD_BUG_ON_ZERO'
>>     16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { =

>> int:(-!!(e)); })))
>>        |                                                             =

>>  ^
>>  include/linux/compiler.h:224:46: note: in expansion of macro =

>> '__same_type'
>>    224 | #define __must_be_array(a) =

>> BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>>        |                                              ^~~~~~~~~~~
>>  include/linux/kernel.h:47:59: note: in expansion of macro =

>> '__must_be_array'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + =

>> __must_be_array(arr))
>>        |                                                           =

>> ^~~~~~~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in =

>> expansion of macro 'ARRAY_SIZE'
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                  ^~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct =

>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean =

>> 'dma_hwdesc_f0'?
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/build_bug.h:16:62: note: in definition of macro =

>> 'BUILD_BUG_ON_ZERO'
>>     16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { =

>> int:(-!!(e)); })))
>>        |                                                             =

>>  ^
>>  include/linux/compiler.h:224:46: note: in expansion of macro =

>> '__same_type'
>>    224 | #define __must_be_array(a) =

>> BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>>        |                                              ^~~~~~~~~~~
>>  include/linux/kernel.h:47:59: note: in expansion of macro =

>> '__must_be_array'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + =

>> __must_be_array(arr))
>>        |                                                           =

>> ^~~~~~~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in =

>> expansion of macro 'ARRAY_SIZE'
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                  ^~~~~~~~~~
>>  include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' =

>> width not an integer constant
>>     16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { =

>> int:(-!!(e)); })))
>>        |                                                   ^
>>  include/linux/compiler.h:224:28: note: in expansion of macro =

>> 'BUILD_BUG_ON_ZERO'
>>    224 | #define __must_be_array(a) =

>> BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>>        |                            ^~~~~~~~~~~~~~~~~
>>  include/linux/kernel.h:47:59: note: in expansion of macro =

>> '__must_be_array'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + =

>> __must_be_array(arr))
>>        |                                                           =

>> ^~~~~~~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in =

>> expansion of macro 'ARRAY_SIZE'
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                  ^~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:453:9: error: 'struct =

>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean =

>> 'dma_hwdesc_f0'?
>>    453 |   priv->dma_hwdescs->palette[i] =3D color;
>>        |         ^~~~~~~~~~~
>>        |         dma_hwdesc_f0
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function =

>> 'ingenic_drm_plane_atomic_update':
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: error: =

>> 'crtc_state' undeclared (first use in this function); did you mean =

>> 'ctx_state'?
>>    467 |   crtc_state =3D state->crtc->state;
>>        |   ^~~~~~~~~~
>>        |   ctx_state
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: note: each =

>> undeclared identifier is reported only once for each function it =

>> appears in
>>  At top level:
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:443:13: warning: =

>> 'ingenic_drm_update_palette' defined but not used [-Wunused-function]
>>    443 | static void ingenic_drm_update_palette(struct ingenic_drm =

>> *priv,
>>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> =

>>  > I noticed that the ingenic driver revert I had been waiting for =

>> appeared
>>  > in hte drm-misc tree, so I removed the BROKEN dependency for it, =

>> but it
>>  > produced the above errors, so I have marked it BROKEN again.
> =

> Any progress on this?  I am still marking CONFIG_DRM_INGENIC as BROKEN
> in the drm and drm-misc trees.

Ugh, that doesn't look good. I'll send a fix ASAP.

(I was having email problems last week and the original email bounced, =

sorry about that)

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
