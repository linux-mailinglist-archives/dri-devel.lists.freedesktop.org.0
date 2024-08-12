Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E89C94E4A7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB8D10E02A;
	Mon, 12 Aug 2024 02:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8493310E02A;
 Mon, 12 Aug 2024 02:10:58 +0000 (UTC)
X-UUID: 18d457e0585011efa216b1d71e6e1362-20240812
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B,
 HR_CTT_TXT
 HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
 HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
 HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
 HR_TO_NO_NAME, DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED
 SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
 CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_C_CI
 GTI_FG_IT, GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD
 AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:f93671f1-782a-41d9-a075-1c7bdd1183e2, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:0
X-CID-INFO: VERSION:1.1.38, REQID:f93671f1-782a-41d9-a075-1c7bdd1183e2, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:5d12632787912ff532a446efa28b4cb1,
 BulkI
 D:240802173947ECFW744W,BulkQuantity:5,Recheck:0,SF:64|66|25|17|19|45|102,T
 C:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,
 COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS, TF_CID_SPAM_SNR, TF_CID_SPAM_FAS,
 TF_CID_SPAM_FSD, TF_CID_SPAM_FSI
X-UUID: 18d457e0585011efa216b1d71e6e1362-20240812
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(111.48.58.10)] by mailgw.kylinos.cn
 (envelope-from <yaolu@kylinos.cn>) (Generic MTA)
 with ESMTP id 394466382; Mon, 12 Aug 2024 10:10:50 +0800
From: Lu Yao <yaolu@kylinos.cn>
To: alexdeucher@gmail.com
Cc: Xinhui.Pan@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 ckoenig.leichtzumerken@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, jfalempe@redhat.com,
 linux-kernel@vger.kernel.org, srinivasan.shanmugam@amd.com,
 sunil.khatri@amd.com, yaolu@kylinos.cn
Subject: Re: [PATCH] drm/amdgpu: add dce6 drm_panic support
Date: Mon, 12 Aug 2024 10:10:45 +0800
Message-Id: <20240812021045.36009-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CADnq5_PDBZ9APfCpSMOSMPQWzcOeLqw_LngE2BBSOxv__7miGA@mail.gmail.com>
References: <CADnq5_PDBZ9APfCpSMOSMPQWzcOeLqw_LngE2BBSOxv__7miGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On Thu, Aug 8, 2024 at 13:24 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Aug 8, 2024 at 12:43 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Thu, Aug 8, 2024 at 2:35 AM Lu Yao <yaolu@kylinos.cn> wrote:
> > >
> > > On 2024/8/5 17:25, Jocelyn Falempe wrote:
> > > >
> > > >
> > > > On 02/08/2024 11:39, Christian König wrote:
> > > >> Am 02.08.24 um 09:17 schrieb Lu Yao:
> > > >>> Add support for the drm_panic module, which displays a pretty user
> > > >>> friendly message on the screen when a Linux kernel panic occurs.
> > > >>>
> > > >>> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> > > >>> ---
> > > >>>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 32
> > > >>> +++++++++++++++++++++++++++
> > > >>>   1 file changed, 32 insertions(+)
> > > >>>
> > > >>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > > >>> b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > > >>> index 05c0df97f01d..12c3801c264a 100644
> > > >>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > > >>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > > >>> @@ -28,6 +28,8 @@
> > > >>>   #include <drm/drm_modeset_helper.h>
> > > >>>   #include <drm/drm_modeset_helper_vtables.h>
> > > >>>   #include <drm/drm_vblank.h>
> > > >>> +#include <drm/drm_panic.h>
> > > >>
> > > >>> +#include "../../drm_internal.h"
> > > >>
> > > >> Well that this file is named "internal" and not in a common include
> > > >> directory is a strong indicator that you should absolutely *not*
> > > >> include it in a driver.
> > > >>
> > > >>>   #include "amdgpu.h"
> > > >>>   #include "amdgpu_pm.h"
> > > >>> @@ -2600,6 +2602,35 @@ static const struct drm_crtc_helper_funcs
> > > >>> dce_v6_0_crtc_helper_funcs = {
> > > >>>       .get_scanout_position = amdgpu_crtc_get_scanout_position,
> > > >>>   };
> > > >>> +static int dce_v6_0_drm_primary_plane_get_scanout_buffer(struct
> > > >>> drm_plane *plane,
> > > >>> +                             struct drm_scanout_buffer *sb)
> > > >>> +{
> > > >>> +    struct drm_framebuffer *fb;
> > > >>> +    struct drm_gem_object *obj;
> > > >>> +    struct amdgpu_bo *abo;
> > > >>> +    int ret = 0;
> > > >>> +
> > > >>> +    if (!plane->fb || plane->fb->modifier != DRM_FORMAT_MOD_LINEAR)
> > > >>> +        return -ENODEV;
> > > >>> +
> > > >>> +    fb = plane->fb;
> > > >>> +    sb->width = fb->width;
> > > >>> +    sb->height = fb->height;
> > > >>> +    sb->format = fb->format;
> > > >>> +    sb->pitch[0] = fb->pitches[0];
> > > >>> +
> > > >>> +    obj = fb->obj[0];
> > > >>> +    abo = gem_to_amdgpu_bo(obj);
> > > >>> +    if (!abo || abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
> > > >>> +        return -EINVAL;
> > > >>> +
> > > >>> +    return drm_gem_vmap(obj, &sb->map[0]);
> > > >>
> > > >> Yeah that will almost always not work. Most display buffers are
> > > >> tilled and not CPU accessible.
> > > >
> > > > For the CPU accessible issue, Christian mentioned there was a debug
> > > > interface on AMD GPU that can be used, to work around this:
> > > >
> > > > https://lore.kernel.org/dri-devel/0baabe1f-8924-2c9a-5cd4-59084a37dbb2@gmail.com/
> > > > and
> > > > https://lore.kernel.org/dri-devel/d233c376-ed07-2127-6084-8292d313dac7@amd.com/
> > > >
> > > > And you will need to use the scanout_buffer->set_pixel() callback to
> > > > write the pixels one by one, similar to what I've tried for nouveau with
> > > > https://patchwork.freedesktop.org/series/133963/
> > > >
> > > > For the tiling format, the problem is that it is internal to the GPU,
> > > > and currently the driver don't know which tiling format is being used.
> > > >
> > > > It might be possible to disable tiling and compression, but it
> > > > requires some internal DC knowledge:
> > > > https://lore.kernel.org/dri-devel/f76a3297-7d63-8615-45c5-47f02b64a1d5@amd.com/
> > > >
> > > >
> > > > Best regards,
> > >
> > > From the discussion provided, it is difficult to implement this feature without the relevant data book and knowledge.(Whether how tiled memory storage, or how to disable tiling of DC)
> >
> > For DCE 6, the GRPH_ARRAY_MODE field in mmGRPH_CONTROL controls the
> > display tiling.  Set that field to GRPH_ARRAY_LINEAR_GENERAL (0) to
> > disable tiling.
> 
> For clarity that register is instanced so use mmGRPH_CONTROL +
> amdgpu_crtc->crtc_offset to get the right instance.
> 

It works, I'll submit a new patch soon.

Thanks,
Lu Yao

> Alex

