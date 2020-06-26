Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C63420B4AA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 17:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87D46ECBB;
	Fri, 26 Jun 2020 15:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF81F6ECBA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 15:34:52 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 18so8989078otv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jHbpYQf2tnMD+tb9W4J8yb3qEBBRdsc1Pqznwnd2PP0=;
 b=wWwXA4Z3tk970INvxUAt9ucqnZVvXurigb22u8y1NxhRUTSWk9hyAtvJwRY1F10UbE
 BR4flEoADEzWANEOL5Binrk0BWj1Odizt/0Nbv4gWUexnaz6bKO4Zbt81j8qpbLYxSbI
 i61wrrIM5MMGtm+CqAZBy4sX1DzBinEVnD5IbuEZXUlJ4nkexwdBIlzJNHIpclpfEjTy
 7rS63QlmnJN+LBYPNA0JGRyuDxKg4Qh+msWqF8V2aJXRP8cOjkoNMz+UjOz2qGj2eZhl
 CB+XQG3Q6gi6gHEH3pdGlzcQvtAcEOBsKjMv8wDjsqYUiCaAWfkgKdf9wu/OZ/7yrQQP
 VSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jHbpYQf2tnMD+tb9W4J8yb3qEBBRdsc1Pqznwnd2PP0=;
 b=V+OrHJaETXkPylenkh2BW1meIlx6HKWwUbKwgIuhOP1P53CYUjskvYi5BJKSAlhqYv
 YTCrX5otRbK1s95jMAV2t6UCgx6gxxGF+pRecqYPoR4WZ0ZhrGY+GydqWEKk5L9gsv/h
 WcL3y/loKEtGXEVj4aihUxtD+GVtv+lmTIIdCIVMFMVxdwl3nKm7O/dOqhZIn2KuK/c5
 K8eOkxfzUGN4pEqGUnmrv6OCW6n012YF7sw4SMUiG6nKmySfvaNM6HkGE3P5fIS49kbf
 GjUH4Jv3o5FZaHUEulCuDopX0htlDZyFf0ardMv1NlYySRceA662PmZhxYJlUxgBwUOC
 iodg==
X-Gm-Message-State: AOAM530WScc+UXUuBnrCCpM9cGWq1J9XFvje9jKyIPde0vRGOo5UR0iH
 ZQkbQi9h1HbY6t4euUKyLvfX6veiyvU/vKBgCLGFsQ==
X-Google-Smtp-Source: ABdhPJyGXWusgqUH1G1hiUjJ4BGTP17jaTiCiNerFUczmMAIzgMdM0XlgnP5BFUxzX8v/iS5BoyT83PoWdgjoQJxQBo=
X-Received: by 2002:a05:6830:452:: with SMTP id
 d18mr2837943otc.164.1593185692204; 
 Fri, 26 Jun 2020 08:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
 <CAPM=9txhX5TVUdWibRFc1C+ip5a8-c07jZawds=k5T5pBTPASA@mail.gmail.com>
 <874kqzndxj.fsf@intel.com>
 <CAKMK7uErpxoFrT_K==7-PMGyg_eqF07T50eYfh5BFQLzra7TbQ@mail.gmail.com>
 <CAO_48GEa2ZgMph-1ZdsMcOdomZc4zNuRcNn_DoBZS3sNZa-LTg@mail.gmail.com>
 <b7b1eb80-aa98-2d54-2344-dbc2e4bc0492@amd.com>
 <CAKMK7uE--1E59fOhQPZ3ib4a3bSK1Nf5ikLB_GHf2wRsFTvXhw@mail.gmail.com>
In-Reply-To: <CAKMK7uE--1E59fOhQPZ3ib4a3bSK1Nf5ikLB_GHf2wRsFTvXhw@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 26 Jun 2020 21:04:39 +0530
Message-ID: <CAO_48GFBuO=c=ugenqo=m4_ydTn1s0J67oBCxCvHGkROU=EuGA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] Revert "dma-buf: Report signaled links
 inside dma-fence-chain"
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0237711627=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0237711627==
Content-Type: multipart/alternative; boundary="0000000000003ed85e05a8fe7396"

--0000000000003ed85e05a8fe7396
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Fri, 26 Jun 2020, 18:10 Daniel Vetter, <daniel@ffwll.ch> wrote:

> On Fri, Jun 26, 2020 at 9:03 AM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 26.06.20 um 06:43 schrieb Sumit Semwal:
> > > On Fri, 26 Jun 2020 at 01:24, Daniel Vetter <daniel@ffwll.ch> wrote:
> > >> Ignoring everything else ...
> > >>
> > >> On Thu, Jun 25, 2020 at 9:28 PM Jani Nikula <
> jani.nikula@linux.intel.com> wrote:
> > >>> As a side note, there seem to be extra checks in place for acks whe=
n
> > >>> applying non-i915 patches to drm-intel; there are no such checks fo=
r
> > >>> drm-misc.
> > >> One option to generalize that that I pondered is to consult
> > >> get_maintainers.pl asking for git repo link, and if that returns
> > >> something else, then insist that there's an ack from a relevant
> > >> maintainer. It's a bit of typing, but I think the bigger problem is
> > >> that there's a ton of false positives.
> > > Right; for the particular patch, I wasn't even in the to: or cc: fiel=
d
> > > and that made it slip from my radar. I would definitely ask any one
> > > sending patches for dma-buf directory to follow the get_maintainers.p=
l
> > > religiously.
> > >> But maybe that's a good thing, would give some motivation to keep
> > >> MAINTAINERS updated.
> >
> > Should I maybe add myself as maintainer as well? I've written enough
> > stuff in there to know the code quite a bit.
>
> I think that makes lots of sense, since defacto you already are :-)
>
> If you feel like bikeshed, get_maintainers.pl also supports R: for
> reviewer, but given that you also push patches to drm-misc M: for
> maintainer feels more accurate.
>

I think given you've been reviewing and changing most of the code around
dma-fences, it should be ok to add you as the maintainer for those bits?

-Daniel
>

Best,
Sumit.

--0000000000003ed85e05a8fe7396
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Christian,<br><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, 26 Jun 2020, 18:10 Daniel Vetter,=
 &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Fri, Jun 26, 2020 at 9:03 AM Christi=
an K=C3=B6nig<br>
&lt;<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blank" rel=3D"no=
referrer">christian.koenig@amd.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Am 26.06.20 um 06:43 schrieb Sumit Semwal:<br>
&gt; &gt; On Fri, 26 Jun 2020 at 01:24, Daniel Vetter &lt;<a href=3D"mailto=
:daniel@ffwll.ch" target=3D"_blank" rel=3D"noreferrer">daniel@ffwll.ch</a>&=
gt; wrote:<br>
&gt; &gt;&gt; Ignoring everything else ...<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Thu, Jun 25, 2020 at 9:28 PM Jani Nikula &lt;<a href=3D"ma=
ilto:jani.nikula@linux.intel.com" target=3D"_blank" rel=3D"noreferrer">jani=
.nikula@linux.intel.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt; As a side note, there seem to be extra checks in place fo=
r acks when<br>
&gt; &gt;&gt;&gt; applying non-i915 patches to drm-intel; there are no such=
 checks for<br>
&gt; &gt;&gt;&gt; drm-misc.<br>
&gt; &gt;&gt; One option to generalize that that I pondered is to consult<b=
r>
&gt; &gt;&gt; <a href=3D"http://get_maintainers.pl" rel=3D"noreferrer noref=
errer" target=3D"_blank">get_maintainers.pl</a> asking for git repo link, a=
nd if that returns<br>
&gt; &gt;&gt; something else, then insist that there&#39;s an ack from a re=
levant<br>
&gt; &gt;&gt; maintainer. It&#39;s a bit of typing, but I think the bigger =
problem is<br>
&gt; &gt;&gt; that there&#39;s a ton of false positives.<br>
&gt; &gt; Right; for the particular patch, I wasn&#39;t even in the to: or =
cc: field<br>
&gt; &gt; and that made it slip from my radar. I would definitely ask any o=
ne<br>
&gt; &gt; sending patches for dma-buf directory to follow the <a href=3D"ht=
tp://get_maintainers.pl" rel=3D"noreferrer noreferrer" target=3D"_blank">ge=
t_maintainers.pl</a><br>
&gt; &gt; religiously.<br>
&gt; &gt;&gt; But maybe that&#39;s a good thing, would give some motivation=
 to keep<br>
&gt; &gt;&gt; MAINTAINERS updated.<br>
&gt;<br>
&gt; Should I maybe add myself as maintainer as well? I&#39;ve written enou=
gh<br>
&gt; stuff in there to know the code quite a bit.<br>
<br>
I think that makes lots of sense, since defacto you already are :-)<br>
<br>
If you feel like bikeshed, <a href=3D"http://get_maintainers.pl" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">get_maintainers.pl</a> also supports =
R: for<br>
reviewer, but given that you also push patches to drm-misc M: for<br>
maintainer feels more accurate.<br></blockquote></div></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I think given you&#39;ve been reviewing and =
changing most of the code around dma-fences, it should be ok to add you as =
the maintainer for those bits?</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
-Daniel<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Best,</div><div dir=3D"auto">Sumit.</div></div>

--0000000000003ed85e05a8fe7396--

--===============0237711627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0237711627==--
