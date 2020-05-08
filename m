Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0661CA82A
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F228989DEA;
	Fri,  8 May 2020 10:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F158589DEA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:17:56 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id h30so749789vsr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c+oVneanRtOVOwahLtnIHX/mAnyDloy4XQ+Mg+DsNW4=;
 b=Ud1+0AABfpM17kB9qkF13dBQ98jq4V72r9WR1ZhL25B+jC2+f7Ok2DSLnywyoe8hHj
 WVMfwAjoKMwyx8HeKrxxbRXp0xkyAZnzlJK2CQ9chfY/njCHQ6StesKswThn/hgnQJ8Q
 y8dQGplIuM+PrGefkmNu07UVvXVklLeTkp/vmrY7tSrtP2yOFvWwzI0XxzbGhP5XtL5F
 n94h0ee8FuhuO7sqqIAlw6sBbELTzjIqNgT1YYn0VOSl7YBH2wjF4qgCEhy8TF0UU+QG
 OYfXd8D2B6+jIf5ptWLHJRNcPjAS4/KBaQPmgBtZ8bLvV6lrG/pURyl5YIAyTTrk5psY
 qFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c+oVneanRtOVOwahLtnIHX/mAnyDloy4XQ+Mg+DsNW4=;
 b=iy7g96tKQy+gr2aTAZBGQSV68UH4ix9s/k3DVi1XTOjrL488FM5pQ3exXOGNKJSrGY
 DxDduEB2gU+i1Y8/iC4SrdaOvy3Cvh77ty4Tokqeu95YyoTVNlDj79aI3gu2CBwa61HE
 VB+sKyYjaf9Zzz41I5eRjaBJ5JHmR0MGw2ragn9OF9h+NaK7wgbdjhfpqhv47baDZ0ta
 /tJCSCkrOoQYvFkKln3RpTCHnClUn3n8gd76VayIEcsHUWCO39pRS3G6yq53ecAC6Kr2
 pcPEE10xK1Wz3/ZPghwYz9EDXH+j88/2U5WAS+S1ZZXIPTh0Hl/CZ4QWUuYnx+E38p+5
 31aA==
X-Gm-Message-State: AGi0PuaiqXQcy7O5Ce2h9gksCg/ncVMR+ivcIIHG5HePkIauMIZq3YwQ
 8/6yjFpMXXY0Be7c6m72WjjN2eVkI+fZBvHnIk8=
X-Google-Smtp-Source: APiQypIiZTm+kyhnvz6JwCmtT8wi79Otwoqr4MvRO/womDVZTCchC3D10/gba7Kosfqks/3ZQFvP0KASlxs2zeWJTHY=
X-Received: by 2002:a67:c482:: with SMTP id d2mr1295294vsk.37.1588933076074;
 Fri, 08 May 2020 03:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-37-emil.l.velikov@gmail.com>
 <20200507181413.GD13247@ravnborg.org>
In-Reply-To: <20200507181413.GD13247@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 May 2020 11:15:24 +0100
Message-ID: <CACvgo52pq=of3NTAte5anuYGfXRiGXY7PL6b9gp7SWGpOZSw+w@mail.gmail.com>
Subject: Re: [PATCH 36/36] drm/gem: remove _unlocked suffix in
 drm_object_put_unlocked
To: Sam Ravnborg <sam@ravnborg.org>
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 May 2020 at 19:14, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Emil.
>
> On Thu, May 07, 2020 at 04:08:22PM +0100, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > Spelling out _unlocked for each and every driver is a annoying.
> > Especially if we consider how many drivers, do not know (or need to)
> > about the horror stories involving struct_mutex.
> >
> > Just drop the suffix. It makes the API cleaner.
> >
> > Done via the following script:
> >
> > __from=drm_gem_object_put_unlocked
> > __to=drm_gem_object_put
> > for __file in $(git grep --name-only $__from); do
> >   sed -i  "s/$__from/$__to/g" $__file;
> > done
> >
> > With this patch, the _unlocked define is no longer needed - remove it.
> >
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
>
> I had prefeered this was spilt in three patches:
> 1) drm_gem*
> 2) drm_client, drm_prime, drm-mm
> 3) Removal of the define
>
> Maybe just squash 1) and 2) in the above, but I like it spelled out that
> the backward compatible define is dropped.
>
Think that we can combine your and Thomas' suggestions:
- fold all of drm in once patch - move it all to patch 11
- keep the #define removal as separate patch

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
