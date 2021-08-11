Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C883E8B4D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 09:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664F989E06;
	Wed, 11 Aug 2021 07:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BC589850;
 Wed, 11 Aug 2021 07:55:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gs8so2448437ejc.13;
 Wed, 11 Aug 2021 00:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=loPuaqyNsLcxxc3Ke/D9j6Wkh/qqT0W3O2ToAt4oP6s=;
 b=CaK4JtB9UGJUKcvtS9puwSssUL+xW/IBLxEywmNoQJVdL/fVvB+iKz6eHzgktV40ip
 pNrJE7J1Xd1/f2lD1t63QSwUB4LTXqugKsDa4CSols8y/ISw9W7fHxnoo/eHjSbP+Uze
 3nhlH0gYWyRM73Gj70bk3H/1/qesDF+RC63//SPwxsscK4MtV+9gHbe5FoNQRgCKufl2
 wvQz31xkvhKEYRc5vmsjtur2V07ZGcolGRj6mNM4jJIp+IRaAgeGTiZbn/Qezfo4gKy1
 Lw2+2Ci58TJ8EaH+aD8LqDVhmGTq69JMp81no+Rc8f7AKacmWCbjwSHhIRM4Vei0XOLI
 3NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=loPuaqyNsLcxxc3Ke/D9j6Wkh/qqT0W3O2ToAt4oP6s=;
 b=QN9F/9AXOVAVffNhe92L6/WjFy0nY+YRzjEJHvsny+WQFZmQpWIiJc2DU9ZRd3BD1b
 IufblsI0ny1/Uz8kBinydK6looV4x/HQnkP6t/WRhy0GUeNIZ3ewBgdoIadmQgWCe1rm
 ch2QDGZJ9+BGOEPgfA1Kk9Pr2M6IifybOie9AQFkntmRP6RfqYgo00tUR6XBcEo00ejh
 LDjxz3eeMT8dhqKR2dkGifS5ZWJeMHSo7CUVZUFHMBbbo9faXQqZfokg48gSKV2DC/gc
 OhD+uz06gdLI1gMh52TxZRljUdOSj3t8c+S8YSPCG7RZobq5olCBWkfJfX90FVsWXt8/
 fouA==
X-Gm-Message-State: AOAM531FWDL2bCcOv1QqUi05dZ5ORHO6j9Bn4ZSO62qDpAZ2mOA0a3rp
 pE7enF/BYGxmjFCVITtDiquaolzyND/S3MNVt3I=
X-Google-Smtp-Source: ABdhPJwVObjdej4P1Itn2r39c+kEd+/Q3ApbO0PCpoSl7bCIBUm60UX7BDj45wnm5uhO0/ltdDxw1vJppiI6LuiYL7g=
X-Received: by 2002:a17:906:3693:: with SMTP id
 a19mr2477552ejc.237.1628668532936; 
 Wed, 11 Aug 2021 00:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyT17Qbd0b46Xap=vGhiicTKko7qCEsFJwOBVsb=_2axA@mail.gmail.com>
 <162866195438.4169.13003970815194920952@jlahtine-mobl.ger.corp.intel.com>
 <877dgso3qx.fsf@intel.com>
In-Reply-To: <877dgso3qx.fsf@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 11 Aug 2021 17:55:22 +1000
Message-ID: <CAPM=9tyVa4S++5r3XU8M=MTqEVUBJ2bf6EnrTVNQwSFJT22XZg@mail.gmail.com>
Subject: Re: missing signoff on drm-intel-gt-next pull
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Aug 2021 at 17:11, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Wed, 11 Aug 2021, Joonas Lahtinen <joonas.lahtinen@linux.intel.com> wrote:
> > Quoting Dave Airlie (2021-08-11 06:48:39)
> >> dim: db47fe727e1f ("drm/i915/step:
> >> s/<platform>_revid_tbl/<platform>_revids"): committer Signed-off-by
> >> missing.
> >>
> >> I'm not sure how much pain it is to fix that up, but
> >> commit db47fe727e1fc516cf60fc9ab8299605ef3c2d54
> >> Author: Anusha Srivatsa <anusha.srivatsa@intel.com>
> >> Commit: Matt Roper <matthew.d.roper@intel.com>
> >>
> >>     drm/i915/step: s/<platform>_revid_tbl/<platform>_revids
> >>
> >>     Simplify the stepping info array name.
> >>
> >>     Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >>     Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> >>     Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> >>     Link: https://patchwork.freedesktop.org/patch/msgid/20210713193635.3390052-2-matthew.d.roper@intel.com
> >>
> >> It's definitely missing an S-o-b by anyone who handled the patch.
> >>
> >> Let me know if it's insanely painful to fix that.
> >
> > Added you to the earlier mail thread that discussed the incident.
> >
> > There are now 277 patches on top of that patch, so means rebasing all of
> > those and changing the hashes and trying to fixup all the Fixes:.
> >
> > So it's painful but not insanely so. Let me know if you want the tree
> > rebased.
> >
> > Regards, Joonas
>
> The commit came in via a topic branch also to drm-intel-next, so that's
> another 168 commits to rebase. There's a lot of people working on top of
> those trees, so I'm leaning on the very painful side.

Okay I think we can let that one slide. Having an S-o-b by someone in
the org on it is also technically enough for legal purposes anyways.

I'll finish the pulls from both trees tomorrow.

Thanks,
Dave.
