Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C194DB691
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 17:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE0810E855;
	Wed, 16 Mar 2022 16:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91ECF10E855
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 16:46:02 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id g19so4460177pfc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q3ohNli6ucU6PfwcYf9qsmSVyAcD8SKpTy1bggnb9qw=;
 b=UVEXCpKa7MtCQR0Tm9cthe0ZzW8igf/oPIOZdbDxd/SlxvP9zHc0A0AZba3iPW2/7r
 BtwEWN9Zt+spXoudA8qLyC1JrTrmTxTe5nqpZKJ+o9ce/vxNs5kpHts/PAZGGq0OHSbP
 0wy8DtyKddqidM3vgsdn+klqr357Ah1zVfZpBgFXuBxBmTtGyyRpMptcm5KBZy13UUge
 +eZ8BTltxXRVwgAWunFo6iTUVP55KfNDxGRMV35MQkH/98/Wv297DfqW0EELeI5FA9jr
 TqiY5mCetDBFGkzz/B2PrAC/NMs1sGHcJ5wwsj24qSPbpyZydbT7+RR2yrhF6VTcUMvr
 8/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q3ohNli6ucU6PfwcYf9qsmSVyAcD8SKpTy1bggnb9qw=;
 b=mNU0OqW5HE0fN3z7JEjdiYYhS7xmRjzTfEWx1L4+PAUxH2ffWHPlqIZLgrY+4QFAsc
 qhWn5CT3RZVIp+uxKmigMI89sLTXFk4+kxCosLnYUvSz6w4V9hcdS8kS0z8eF2wnjieB
 /+YsekpOCnzXqEfp8EGhhaKmO1V3WgXGriMSLWSYrz3Ot9CcG1s4Lz2T7h23usxYHH7W
 CxCGhv9kiHlPBDVlahGYBWcLJepldVjEFFQ/Uci/OdDJe4R4jhG2ZTgZG9k4fVIW5WzV
 zHLUFkItZi5YrwrjX5MV8t+rpzsEyaCD5a/LvUEVJUb2plGcstMulHxZw60QYu4mpREP
 zssA==
X-Gm-Message-State: AOAM531G6arbVaDWwx/nEvJ4VPASZQBZbv/omP22aKEZyGBMWMiOCwbz
 EdVGPTOXTv38Dd50LlHpC4huXC2oQGWy1EY/Qj0=
X-Google-Smtp-Source: ABdhPJwrMcLRyNMpVlLtW71I4r0zOihpC6izpar7SqPzaN8/nrdfiw4JvgLFPUgeBV1fFJ0fxJkNs7Wdts7HoLK65V8=
X-Received: by 2002:a05:6a00:1991:b0:4f7:1322:ca04 with SMTP id
 d17-20020a056a00199100b004f71322ca04mr495949pfl.85.1647449161935; Wed, 16 Mar
 2022 09:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220308195222.13471-1-tzimmermann@suse.de>
In-Reply-To: <20220308195222.13471-1-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 16 Mar 2022 17:45:50 +0100
Message-ID: <CAMeQTsY0sYP6wXCGrw+ruqKAEB1U82r6gwNfY1ebp9a1ejbe=Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] drm/gma500: Various cleanups to GEM code
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 8:52 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Refactor and simplify various parts of the memory management. This
> includes locking, initialization and finalizer functions, and code
> organization.
>
> Tested on Atom N2800 hardware.
>
> v2:
>         * put common code in psb_gtt_{init,fini,resume}() into
>           helpers (Sam, Patrik)
>

The series is pushed to drm-misc-next

Thanks
Patrik

> Thomas Zimmermann (12):
>   drm/gma500: Remove struct psb_gem_object.npage
>   drm/gma500: Acquire reservation lock for GEM objects
>   drm/gma500: Move GTT locking into GTT helpers
>   drm/gma500: Remove struct psb_gtt.sem sempahore
>   drm/gma500: Move GTT setup and restoration into helper funtions
>   drm/gma500: Move GTT resume logic out of psb_gtt_init()
>   drm/gma500: Cleanup GTT uninit and error handling
>   drm/gma500: Split GTT init/resume/fini into GTT and GEM functions
>   drm/gma500: Inline psb_gtt_restore()
>   drm/gma500: Move GEM memory management functions to gem.c
>   drm/gma500: Move GTT enable and disable code into helpers
>   drm/gma500: Move GTT memory-range setup into helper
>
>  drivers/gpu/drm/gma500/gem.c         | 161 ++++++++++++++-
>  drivers/gpu/drm/gma500/gem.h         |  13 +-
>  drivers/gpu/drm/gma500/gma_display.c |   8 +-
>  drivers/gpu/drm/gma500/gtt.c         | 295 +++++++++++++--------------
>  drivers/gpu/drm/gma500/gtt.h         |   8 +-
>  drivers/gpu/drm/gma500/power.c       |   5 +-
>  drivers/gpu/drm/gma500/psb_drv.c     |  13 +-
>  drivers/gpu/drm/gma500/psb_drv.h     |   1 -
>  8 files changed, 317 insertions(+), 187 deletions(-)
>
>
> base-commit: 710a019ad85e96e66f7d75ee7f4733cdd8a2b0d0
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: 6e1032c6302461624f33194c8b8f37103a3fa6ef
> --
> 2.35.1
>
