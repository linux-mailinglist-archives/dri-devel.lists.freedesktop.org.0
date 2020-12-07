Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D6B2D2600
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F686E973;
	Tue,  8 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CB689E69
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 10:00:47 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id q16so13020225edv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 02:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zO7Ax1jgHZYaDs2E69N0Y7MBi62MDVos43cVVQ3OWZc=;
 b=X6mT0Tiq8rN9MmKmzC/L9NiUtBlEbaQl+/pktaCIH9nccXpYrpBIPiDgoyXDHGRVni
 WZFnuNwRj71DzE0CerY+EPg7o5aA4iPfJbYsPAahcMo5Pq482XGzRNsLpqYVFqFOctJ2
 NrIo9TdaNJeu8Zwqe7MEdoXDkDgRql/s184//xLd0/DSY45R97kdJEV8jg47GnWW5K+U
 GyNd15PO0MkKyF5PVPllj4oAjAk1WlyKtip9R4Wq3CNWm0hAvLPwHRPHxQXhR8oVtvmO
 /PONjSFq5yIPg3Yl0akHAZY1NOIsTbsC+ZvoeTZiKBB9oY9xofBuPX0jO8O60ReE2BvI
 6iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zO7Ax1jgHZYaDs2E69N0Y7MBi62MDVos43cVVQ3OWZc=;
 b=mcx4eX6HKRAMYt0dVQQXhWY52fdgEw45deN+6/YwUe2Gm1rY5LAMycgrE+u9O8tvbI
 e0wTexIFm9DXP396Qcvv1An+CNCHqfCdmdP55UX79DxOElk6tfXjJO3NONa6ZyqN7ZNS
 VaN41CxMY6admeiuVwSoFDXmyrqdRp0bqF10uucMUtWwzSEry8K0ct5bU3ZE9ismoHyL
 zJ/cnDEx1KGs/ymg4EWj31c9+b8EUiwSEy6oCCpMsNOZheYKQvTFqYvdYNds48AMTvh9
 wkuD31EOrh5bB+1kGMYg2SfZLm9Ooqu79BtfGeJW6gweTf6YsP/Otp31ZHQUK5ktPMDB
 UOBw==
X-Gm-Message-State: AOAM532EC651yOgsfJlxDlCaXSZs/Lm/SbCkz3SlBMAIsmgdtR1azJBV
 AE1EjMzkR5CmA56EZSyxHFkVFa4T329uR5RRkzQKcw==
X-Google-Smtp-Source: ABdhPJy7RFjqxvUPmHhLOAuKHkiHH/2rwqmBQdE2i1He9R00g6KB4aao4TogpZ6X6hFRJRpWZK2BXbSipzELj0tW0Gs=
X-Received: by 2002:a50:d2c8:: with SMTP id q8mr18282665edg.375.1607335245974; 
 Mon, 07 Dec 2020 02:00:45 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <c68d121c-ead2-dbe9-cb26-8b18ccb86011@daenzer.net>
 <CAKMK7uHZGAT6qUc1AbOHar0h=q0uJKOHuNL_HdiOgLx+iiy-kg@mail.gmail.com>
 <CABjik9dFoGSaxOouXsMdNgeFK57-RP28dhrPi4EXX81OswgeSw@mail.gmail.com>
 <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <20201204101151.55f487b8@eldfell>
 <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
 <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <AycyJAPt8CKsoAYi4sBlgIeDydMx1kGHulk0qEtAG7WbEfqkdYuc8FCmn5a7qu8YFjG3MfEYn-SZaA52PBy-75aBFZOcAkP1ld5V6LVD7GI=@emersion.fr>
In-Reply-To: <AycyJAPt8CKsoAYi4sBlgIeDydMx1kGHulk0qEtAG7WbEfqkdYuc8FCmn5a7qu8YFjG3MfEYn-SZaA52PBy-75aBFZOcAkP1ld5V6LVD7GI=@emersion.fr>
From: James Park <james.park@lagfreegames.com>
Date: Mon, 7 Dec 2020 02:00:32 -0800
Message-ID: <CABjik9ctkMs4b5M+EaAFnr7byqn_UvRUpgh8-ZbCGHO58pE0aA@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: Simon Ser <contact@emersion.fr>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 James Park <jpark37@lagfreegames.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1394977299=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1394977299==
Content-Type: multipart/alternative; boundary="0000000000005f23fc05b5dce6da"

--0000000000005f23fc05b5dce6da
Content-Type: text/plain; charset="UTF-8"

Not to make too big a deal of it, but the idea was that if you went out of
your way to define DRM_FOURCC_STANDALONE in your code base, that you would
also go through the pain of removing drm.h includes elsewhere. It's too
annoying of an implication to document/communicate, so I'm happier with the
other DRM_FOURCC_STANDALONE solution that pulls the basic types into a
common header.

Thanks,
James

On Mon, Dec 7, 2020 at 1:49 AM Simon Ser <contact@emersion.fr> wrote:

> On Monday, December 7th, 2020 at 9:57 AM, James Park <
> james.park@lagfreegames.com> wrote:
>
> > I could adjust the block to look like this:
> >
> > #ifdef DRM_FOURCC_STANDALONE
> > #if defined(__linux__)
> > #include <linux/types.h>
> > #else
> > #include <stdint.h>
> > typedef uint32_t __u32;
> > typedef uint64_t __u64;
> > #endif
> > #else
> > #include "drm.h"
> > #endif
>
> This approach still breaks on BSDs when DRM_FOURCC_STANDALONE is defined
> and
> drm.h is included afterwards.
>

--0000000000005f23fc05b5dce6da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not to make too big a deal of it, but the idea was that if=
 you went out of your way to define DRM_FOURCC_STANDALONE in your code base=
, that you would also go through the pain of removing drm.h includes elsewh=
ere. It&#39;s too annoying of an implication to document/communicate, so I&=
#39;m happier with the other=C2=A0DRM_FOURCC_STANDALONE solution that pulls=
 the basic types into a common header.<div><br></div><div>Thanks,</div><div=
>James</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, Dec 7, 2020 at 1:49 AM Simon Ser &lt;<a href=3D"mailto:=
contact@emersion.fr">contact@emersion.fr</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Monday, December 7th, 2020 at 9:=
57 AM, James Park &lt;<a href=3D"mailto:james.park@lagfreegames.com" target=
=3D"_blank">james.park@lagfreegames.com</a>&gt; wrote:<br>
<br>
&gt; I could adjust the block to look like this:<br>
&gt;<br>
&gt; #ifdef DRM_FOURCC_STANDALONE<br>
&gt; #if defined(__linux__)<br>
&gt; #include &lt;linux/types.h&gt;<br>
&gt; #else<br>
&gt; #include &lt;stdint.h&gt;<br>
&gt; typedef uint32_t __u32;<br>
&gt; typedef uint64_t __u64;<br>
&gt; #endif<br>
&gt; #else<br>
&gt; #include &quot;drm.h&quot;<br>
&gt; #endif<br>
<br>
This approach still breaks on BSDs when DRM_FOURCC_STANDALONE is defined an=
d<br>
drm.h is included afterwards.<br>
</blockquote></div>

--0000000000005f23fc05b5dce6da--

--===============1394977299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1394977299==--
