Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DB91E890C
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 22:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB63B6E96D;
	Fri, 29 May 2020 20:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB03C6E96D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 20:44:06 +0000 (UTC)
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MXp1O-1jUkvY3UwG-00Y9t7 for <dri-devel@lists.freedesktop.org>; Fri, 29
 May 2020 22:44:05 +0200
Received: by mail-qk1-f176.google.com with SMTP id s1so3509022qkf.9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 13:44:04 -0700 (PDT)
X-Gm-Message-State: AOAM531wWLmUd+daRPAN3d+CYltALiwK5f71wNqlr/shWXkQc1t8Ypvh
 zHwQScBnwOGes34Qx9UNiQYFjrAHPZ6a7wfzhXs=
X-Google-Smtp-Source: ABdhPJy4XjbWlTPZywTBf4Zz+9suY2E0IsBRaLVguOG3M7o7RdiKyno+D+pnl29iBPte8PkOa4Og3isluOwrykMCmrg=
X-Received: by 2002:ae9:de85:: with SMTP id s127mr8835256qkf.352.1590785043709; 
 Fri, 29 May 2020 13:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200529201534.474853-1-arnd@arndb.de>
 <159078398171.4326.11332427648947797488@build.alporthouse.com>
In-Reply-To: <159078398171.4326.11332427648947797488@build.alporthouse.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 29 May 2020 22:43:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3hrOTvTP6fOBLM8RF4fH4XRTPV54enk1Gd4uTSQvW2wQ@mail.gmail.com>
Message-ID: <CAK8P3a3hrOTvTP6fOBLM8RF4fH4XRTPV54enk1Gd4uTSQvW2wQ@mail.gmail.com>
Subject: Re: [PATCH] drm/selftests/mm: reduce per-function stack usage
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Provags-ID: V03:K1:AdvDpSQ99AlOwi2a7PIWA+U3AhLaAC7lxm+P7cQ0BtwmvS+0em4
 LBqNtbRsetJZgBVXvQdp9AjonLG2HE3rDOO/qLamHR6DsCBc5/CRbmIx4XZNeCHh+HpVVWa
 dC3JGjm+8PrhEeMNSPlD5ZlbG0dGsruDWsUBDzMKMMXvNKtsWqEbV3SbolKlkDA3RYiBAl3
 6OIiGh/zO/AH1GQDZJOYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E09cRfjY24U=:u1Ws7ldZSqe8mVyXVerLuL
 Wxmu/C7F2U6proay7unfRvkhYcyAg97cyzOnwQiD4Vo3VuYwAk7gOi6/Y2BrSQqu3MWX6+d3g
 SUR/sCAtkpC25t7uBBXkH4pEx6a2nlqN1A6ckiXcwRGm0Bg+Ssj02f9zjx7y25lRlNX6VVXsa
 WmbZE/CoAN+fnyO/XibcaOP6HIPD5W7dGXIzZIaCqrlCSOdBIa8A/juu19Ce4526Pthn/KZgq
 LywPjhFXzR+mMDYP2Q7XbBIbfrPzw49os7x15cw1xuLsHCEWk0/82gRUwDaEYc7H5Aie+T8Zv
 DLW573/edl5F2i0QRBXZUX/BfVqDr9D0aox7Mf4qJnkCUaQZBfjmSxbPypjVYmk4q6ZqyrfOq
 iggq/z/tK4r6KMDRToEsyzv05aTy4TZxExaPOV+Lo3PbslJRC+INS8seActeGUZ8yzrmekuOz
 bcW25kqQl09ULsdKarvpG9Xqa+5F5G28nQDpjNHT54AZ+m8XpywhHFe4O1NXo8PtYRfr8fRIL
 nwb9x9ZW+tA1ZNGalVTce7A+qmY6z7v11SaV4Gvo47TDAYY1IYfaJRnJx6HTjpcNKHKIKr17b
 ZYhX70ykKAYbXnC+3NdDnoh25B1oGFNzHafyqtFJI92x0paOPzQpHwd59nYV+UcW5GZgbUON0
 EifRHySDAl8zyS4FXZSxIsLZ3T1lwm4jMwP6HwsHYXR/ysVx3AsSZ+ZwgGQGWlKaS8fQhkKGt
 nFGu0gbyWZJkQfju6SOFfy5LkQXbuuHtzNPlzu9Ox0F+J+jVL0J8d4nKAyhuXpBq1OnZYKzr5
 qt8uKwmgKnlo5HbG7/YdTYkJEf4sPhyMXMVZcwrokK+2ChuLvc=
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
Cc: kbuild test robot <lkp@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 10:26 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Arnd Bergmann (2020-05-29 21:15:26)

> >
> > diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
> > index 9aabe82dcd3a..30108c330db8 100644
> > --- a/drivers/gpu/drm/selftests/test-drm_mm.c
> > +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
> > @@ -323,9 +323,8 @@ static bool expect_reserve_fail(struct drm_mm *mm, struct drm_mm_node *node)
> >         return false;
> >  }
> >
> > -static bool check_reserve_boundaries(struct drm_mm *mm,
> > -                                    unsigned int count,
> > -                                    u64 size)
> > +static noinline_for_stack bool
> > +check_reserve_boundaries(struct drm_mm *mm, unsigned int count, u64 size)
> >  {
> >         const struct boundary {
>
> It's this const [] right? Hmm, if we felt adventurous that could be a
> small set of multiplication factors (0, -1, 1, count, count+1, ...) and
> made static.

That was my first thought, but I couldn't figure out whether 'count'
could be replaced by any compile-time constant.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
