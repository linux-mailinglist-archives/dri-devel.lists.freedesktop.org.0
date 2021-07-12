Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDF93C5E54
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F4989C85;
	Mon, 12 Jul 2021 14:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71D789C88
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:27:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id go30so7890458ejc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J6QOMazbLL+sZyefDGIGQ29I0wy5OiQ7I4C+gCHLm5E=;
 b=oIdMRj1kgkCcPZUywh/wuQ1/j9Dk9rLTKoJEePwB+7oWbOdIpU7mR6yqY7E69LvuOP
 clJqy0Gu2VDyAOCDKMkL6vpK3b9iPeyMbkcjAaQ5Zee9lvo7haRfBPHUo21SAjVMfDu9
 siXvqBdEPsrM6eyNISkXUea6fL/k8zW1PqHUQwuP0GKuhTpb23sLx9p+Zyo2DuSLtCx+
 LrxctCDJEdiM+wYq6kMJD/uBpMWPUW1WtRmjxpLpz/xRYPwN3+Z9x44qYytUT2NnMoxs
 L4gCnoxywGxUum8ofQVJjarubt7GR6cimZDSkxS8c/k47Msr68pyCSgSLBQXw6hOPsYv
 pRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J6QOMazbLL+sZyefDGIGQ29I0wy5OiQ7I4C+gCHLm5E=;
 b=ndXx1llRFSMnLT8GkSEkY0HAaFsh+vbu792DA4bWtTaJEvzy/5sFnfp81UT8UR+2TA
 kCOWirMVIrhJM7opdF8tIuSlkzQj3ciXxflLgDxkRKlCPMszOx0tvHThECzzOf2ivSq0
 LAKejsYGm3i/JcondYZeNWiTEvu8zBFzfQ7vAiKju9cK0SVEdnId6wssIKi1DjVNZ/7t
 7nWSBmUNJmaWajnBSpNZ6AlhREC7RcFX006WS+mOzZdVo9G/7j7Gjf7vZYGyzWtHrEeM
 gDPpXhj+8pnK1Vok9U+wkauid6g3LqRmWOh8CPzny+glJ2iFma5OZ9qVRqf+OziucnOk
 8K8A==
X-Gm-Message-State: AOAM532nMZHUTEctUPwAfCk6WlAxrM0T86K1Bx4498P5CgFfMoV7i69C
 awKCBCMuHFYQRkVVNCHA0zCHfsucA2VPfww+b/0=
X-Google-Smtp-Source: ABdhPJxYQ6dlzwVeSZ18Kxol+r5yDDP0WWZfvN5TtvWUAYuajKfzzmio0znffyd7qwHlbvpdnobP01u74uXR+upQs9Y=
X-Received: by 2002:a17:906:4551:: with SMTP id
 s17mr15281967ejq.26.1626100065368; 
 Mon, 12 Jul 2021 07:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <CACAkLur8SVqZt69CrfN+0rE4AstPBQPHbwJMnBM_TDTBFXVqdA@mail.gmail.com>
 <a8aadd02-b80b-cd55-b2fd-9c8c7c86b334@suse.de>
In-Reply-To: <a8aadd02-b80b-cd55-b2fd-9c8c7c86b334@suse.de>
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Date: Mon, 12 Jul 2021 19:56:40 +0530
Message-ID: <CACAkLuq+GO8S8GKVg1_AOeGAuQUVbYgf4-ni7MayOTmCm=ezEA@mail.gmail.com>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Melissa Wen <melissa.srw@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 6:53 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 12.07.21 um 13:56 schrieb Sumera Priyadarsini:
> > On Mon, Jul 5, 2021 at 1:16 PM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
> >>
> >> Vkms copies each plane's framebuffer into the output buffer; essential=
ly
> >> using a shadow buffer. DRM provides struct drm_shadow_plane_state, whi=
ch
> >> handles the details of mapping/unmapping shadow buffers into memory fo=
r
> >> active planes.
> >>
> >> Convert vkms to the helpers. Makes vkms use shared code and gives more
> >> test exposure to shadow-plane helpers.
> >>
> >> Thomas Zimmermann (4):
> >>    drm/gem: Export implementation of shadow-plane helpers
> >>    drm/vkms: Inherit plane state from struct drm_shadow_plane_state
> >>    drm/vkms: Let shadow-plane helpers prepare the plane's FB
> >>    drm/vkms: Use dma-buf mapping from shadow-plane state for composing
> >>
> >>   drivers/gpu/drm/drm_gem_atomic_helper.c | 55 ++++++++++++++++++++++-=
-
> >>   drivers/gpu/drm/vkms/vkms_composer.c    | 26 ++++++-----
> >>   drivers/gpu/drm/vkms/vkms_drv.h         |  6 ++-
> >>   drivers/gpu/drm/vkms/vkms_plane.c       | 57 ++++++-----------------=
--
> >>   include/drm/drm_gem_atomic_helper.h     |  6 +++
> >>   5 files changed, 86 insertions(+), 64 deletions(-)
> >>
> >>
> >> base-commit: 3d3b5479895dd6dd133571ded4318adf595708ba
> >> --
> >> 2.32.0
> >>
> > Hi,
> >
> > Thanks for the patches. The switch to shadow-plane helpers also solved
> > a bug that was causing a kernel
> > panic during some IGT kms_flip subtests on the vkms virtual hw patch.
>
> Melissa mention something like that as well and I don't really
> understand. Patch 3 removes an error message from the code, but is the
> actual bug also gone?

Yes, I think so. Earlier, while testing the vkms virtual hw patch, the
tests were
not just failing, but the vmap fail also preceeded a page fault which requi=
red a
whole restart. Check these logs around line 303:
https://pastebin.pl/view/03b750be.

I could be wrong but I think if the same bug was still present, then
the kernel panic
would also happen even if the error message was not being returned.

Cheers,
Sumera

>
> There's little difference between vkms' original code and the shared
> helper; except for the order of operations in prepare_fb. The shared
> helper synchronizes fences before mapping; vkms mapped first.
>
> (Maybe the shared helper should warn about failed vmaps as well. But
> that's for another patch.)
>
> Best regards
> Thomas
>
> >
> > Tested-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> >
> > Cheers,
> > Sumera
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>
