Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA96397D96
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 02:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432A06E2A3;
	Wed,  2 Jun 2021 00:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1815D6EB3E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 00:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622592634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g6XERwupFZipcAmg6D1I1zxjEbLYz5zppsdgraxGF7Q=;
 b=ZCSLw/lyvlQACVz8Hr6sOBefF39Tz+PZebRYr8i/WAZZWDD8I3teL6OusznVFkOpZHBQ/G
 ybbXxN/4GM1J7G0t4CKVj5rrEIta/fUyne3LLgZ5lhKPz/WLVaYukAqnm2PNJOIJ99QfhF
 S9aFIWzskRlJziD74aL8Q7G1HBE67dw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-f-9waTJINKC-iPzDIt5ewA-1; Tue, 01 Jun 2021 20:10:31 -0400
X-MC-Unique: f-9waTJINKC-iPzDIt5ewA-1
Received: by mail-wr1-f70.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso210104wre.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 17:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g6XERwupFZipcAmg6D1I1zxjEbLYz5zppsdgraxGF7Q=;
 b=IcPYCUnSk2MJJoxwxTBeMwFSIZiXkt+twVxwEEDcCvwnJ384nu8S+4gJDyZGP294HN
 0vlqhi6bi6bx8sP55Jzo2DS84Lfu9JbskbIPM635wZm2eqYuxbwbijEM8ScgffR817KI
 bgoniwxJgrQRxWeCdQbykX5HzMGNhHVyXpsZG3AEo1Vhe0JlPYs8uFTCkUye25Kiqwaa
 HuqlDaV265zn8uhCMx46JtjXs0w6Ts+Y9nTTct+x6eN+bTQU9nJnBxWncerkxMvH1oH1
 3Gcau8BYqXpDeyk90koC2OzDxNtMunL3qEESfgZDJtTxnqoQObQEJxzk+zQF16uqiqEX
 eLbA==
X-Gm-Message-State: AOAM530fm9VWM2npQUA8n+izDbMbkz12k+Onviyl6lnVGYOUS/axZUJT
 YVjrztJTVLt0q3nttnhuGXNavyrK61qnJz0G76QgMXdSNYnqPZqtRimq38iLgQ3LeHpIMc9QyBc
 S27bmgeMWtuiYoqEp2l4Fz33jLZnzfuTiZJlS5ghP6AhX
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr8763245wrm.177.1622592629526; 
 Tue, 01 Jun 2021 17:10:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+7ytifh8Tq7X7nnucf7aYm2Vw3csWvxa0+c2QJbbdpuaVNF93Pvls4Lv1rmxm1PeJU5y+Ay/NirV8hdJrDSY=
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr8763219wrm.177.1622592629297; 
 Tue, 01 Jun 2021 17:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210305095657.GA142006@embeddedor>
 <79ff569a-5828-ef21-538b-12d07d34a4ff@embeddedor.com>
 <1ec627af-514e-b24a-da88-13eb561ccb15@embeddedor.com>
In-Reply-To: <1ec627af-514e-b24a-da88-13eb561ccb15@embeddedor.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 2 Jun 2021 02:10:18 +0200
Message-ID: <CACO55tv3o72GwG8ORcUYQ-nXFDi1Qo0uKG5T_4iVmuhdDxPdqg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH RESEND][next] drm/nouveau: Fix fall-through
 warnings for Clang
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

all three nouveau patches are

Reviewed-by: Karol Herbst <kherbst@redhat.com>

and I don't think anybody would mind if those get into through other
trees, but maybe drm-mist would be a good place for it if other
patches involve other drm drivers?

On Wed, Jun 2, 2021 at 1:16 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> Hi,
>
> Friendly second ping: who can take this?
>
> I can add this to my -next branch for 5.14 if you don't mind.
>
> JFYI: We had thousands of these sorts of warnings and now we are down
> to just 23 in linux-next. This is one of those last remaining warnings.
>
> Thanks
> --
> Gustavo
>
> On 4/20/21 15:13, Gustavo A. R. Silva wrote:
> > Hi all,
> >
> > Friendly ping: who can take this, please?
> >
> > Thanks
> > --
> > Gustavo
> >
> > On 3/5/21 03:56, Gustavo A. R. Silva wrote:
> >> In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
> >> of warnings by explicitly adding a couple of break statements instead
> >> of letting the code fall through to the next case.
> >>
> >> Link: https://github.com/KSPP/linux/issues/115
> >> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> >> ---
> >>  drivers/gpu/drm/nouveau/nouveau_bo.c        | 1 +
> >>  drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
> >>  2 files changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> index 2375711877cf..62903c3b368d 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> @@ -443,6 +443,7 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
> >>                      break;
> >>              case TTM_PL_TT:
> >>                      error |= !(domain & NOUVEAU_GEM_DOMAIN_GART);
> >> +                    break;
> >>              default:
> >>                      break;
> >>              }
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> >> index 61e6d7412505..eb844cdcaec2 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> >> @@ -157,6 +157,7 @@ nouveau_conn_atomic_set_property(struct drm_connector *connector,
> >>                      default:
> >>                              break;
> >>                      }
> >> +                    break;
> >>              case DRM_MODE_SCALE_FULLSCREEN:
> >>              case DRM_MODE_SCALE_CENTER:
> >>              case DRM_MODE_SCALE_ASPECT:
> >>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

