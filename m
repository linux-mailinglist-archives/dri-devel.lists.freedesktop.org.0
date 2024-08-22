Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E3695AF56
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 09:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0FE10E046;
	Thu, 22 Aug 2024 07:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8898C10E046;
 Thu, 22 Aug 2024 07:32:28 +0000 (UTC)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by APP-05 (Coremail) with SMTP id zQCowADHcEB06cZm0tnuCA--.25308S2;
 Thu, 22 Aug 2024 15:32:17 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: alexdeucher@gmail.com
Cc: HaoPing.Liu@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 akpm@linux-foundation.org, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 hamza.mahfooz@amd.com, joshua@froggi.es, linux-kernel@vger.kernel.org,
 make24@iscas.ac.cn, marek.olsak@amd.com, mwen@igalia.com,
 stable@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/amd/display: avoid using null object of
 framebuffer
Date: Thu, 22 Aug 2024 15:32:04 +0800
Message-Id: <20240822073204.1618876-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CADnq5_OzY97etD0LW5Tw-xCnnTYonGkvxA875xdAfMgxAtu_DQ@mail.gmail.com>
References: <CADnq5_OzY97etD0LW5Tw-xCnnTYonGkvxA875xdAfMgxAtu_DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: zQCowADHcEB06cZm0tnuCA--.25308S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW5ur13tr4DKr4DGrW3Wrg_yoW8CFyDpa
 n3AFyUAr4DZFy2y347CF109FW5KayfKF1xKFWDuw10vw15trnrJrnxGrs7uFs7uFW29w4S
 qFZrZFWS9F1qvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRKCJmDUUUU
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
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

Alex Deucher<alexdeucher@gmail.com> wrote:=0D
> On Wed, Aug 21, 2024 at 3:45=E2=80=AFAM Ma Ke <make24@iscas.ac.cn> wrote:=
=0D
> >=0D
> > Instead of using state->fb->obj[0] directly, get object from framebuffe=
r=0D
> > by calling drm_gem_fb_get_obj() and return error code when object is=0D
> > null to avoid using null object of framebuffer.=0D
> >=0D
> > Cc: stable@vger.kernel.org=0D
> > Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to plane=
s")=0D
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>=0D
> > ---=0D
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 9 +++++++--=
=0D
> >  1 file changed, 7 insertions(+), 2 deletions(-)=0D
> >=0D
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c=0D
> > index a83bd0331c3b..5cb11cc2d063 100644=0D
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c=0D
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c=0D
> > @@ -28,6 +28,7 @@=0D
> >  #include <drm/drm_blend.h>=0D
> >  #include <drm/drm_gem_atomic_helper.h>=0D
> >  #include <drm/drm_plane_helper.h>=0D
> > +#include <drm/drm_gem_framebuffer_helper.h>=0D
> >  #include <drm/drm_fourcc.h>=0D
> >=0D
> >  #include "amdgpu.h"=0D
> > @@ -935,10 +936,14 @@ static int amdgpu_dm_plane_helper_prepare_fb(stru=
ct drm_plane *plane,=0D
> >         }=0D
> >=0D
> >         afb =3D to_amdgpu_framebuffer(new_state->fb);=0D
> > -       obj =3D new_state->fb->obj[0];=0D
> > +       obj =3D drm_gem_fb_get_obj(new_state->fb, 0);=0D
> =0D
> Is it possible for obj to be NULL here?=0D
> =0D
> Alex=0D
Thank you for your response to the vulnerability I submitted. Yes, we =0D
believe there is a similar issue. As described in CVE-2024-41093, the obj =
=0D
will return as NULL and lead to a dereferencing problem, and a similar =0D
issue exists in this code. The discovery of this problem was confirmed =0D
through manual review of the code and compilation testing.=0D
--=0D
Regards,=0D
=0D
Ma Ke=

