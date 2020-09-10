Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A2263970
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 02:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50F189428;
	Thu, 10 Sep 2020 00:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9078B8940F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 00:28:20 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k25so5859784ljg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 17:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xx8WRtl3wcFZUb3ojUwKz4SroDfdBqOj9vcrDYrT33k=;
 b=A1GkPoicASKPnHQ2C5h+wNn3sx+n90p2WA/D1Q3bLVwb8tHd/1zSmOV+Ljhf2JDZAd
 SrZTxFF6pYEMLfwZ2HRLzvgPtsWF6A4DuJUCYFIV8caNpFrML0nCrWTL76/9Ol7QsVgb
 DCXhkb5X3wj7iByaIknAtk0BmaDyCaFrsyB7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xx8WRtl3wcFZUb3ojUwKz4SroDfdBqOj9vcrDYrT33k=;
 b=aGjU7l6izw5/rFWBdG1iawh02tu0XXHejbY8mSJntCTRHTWwZ/8LL63dHTHVN/2iVJ
 PbQM9pb0Wd89zIx0KMGO/3nrcMrLWEWZL+4dHd6/nXVy3qUER25BjvT8cAT1YQMGJq9q
 7Aomo9dhDy9O//4Hn8L05XIOrWFfOH7hbjCdEKbEg2E9Me2TbRhSUT0TwvFasuhQPel5
 VHd6+Ld5rEeC+6hDJSY7IDFP/NRjP4tDTAmnSv57ni131Xqucs4xvkbvXZSe2/DpV/Oy
 KZOruqqlc1+oKEBnW7cUiL1bCNHfB1kBDg/o7bPDctnVOkHrnADP6aakXDZ6P8IpjhzH
 uylw==
X-Gm-Message-State: AOAM530BSu8GIOdXeUqVI3WlBgF8O+djK++xHVXdST2WjOtv+yTcmorR
 UiTvnD5J/qHk/oNqxehD6sfWuopUwhKXdQ==
X-Google-Smtp-Source: ABdhPJz/oxzrGp0gr5CWQeY2+2tLnA5kmI/sDiDnuqjjj09yleEXsa+/CwsNp7anceY8QyI1UuLucA==
X-Received: by 2002:a2e:b386:: with SMTP id f6mr3106169lje.186.1599697698741; 
 Wed, 09 Sep 2020 17:28:18 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id e22sm1113378ljn.73.2020.09.09.17.28.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 17:28:16 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id u27so2572962lfm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 17:28:16 -0700 (PDT)
X-Received: by 2002:a19:c801:: with SMTP id y1mr2938076lff.217.1599697696017; 
 Wed, 09 Sep 2020 17:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-5-gurchetansingh@chromium.org>
 <20200902221514.GE1263242@redhat.com>
 <CAAfnVBnfbwc07au1OMec8g5yHC0D3yXc88nOtTopO4sitYf8ig@mail.gmail.com>
 <20200909070349.uyvg44xakdftibxh@sirius.home.kraxel.org>
 <CAJfpegsMEZoCQe7frsr9Kaq6EZsuRFWP3zs7sgrxnUDLzfcx_w@mail.gmail.com>
 <20200909092646.GA438822@phenom.ffwll.local>
 <CAKMK7uHzES32APTafwYjWc=-hswGe3q7Re4Rw354hKwA+mb0zg@mail.gmail.com>
In-Reply-To: <CAKMK7uHzES32APTafwYjWc=-hswGe3q7Re4Rw354hKwA+mb0zg@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 9 Sep 2020 17:28:04 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkbmxB7jdE3W2x3fjsiQYvJ1nimPNsk7qZnJKQJB7JrKw@mail.gmail.com>
Message-ID: <CAAfnVBkbmxB7jdE3W2x3fjsiQYvJ1nimPNsk7qZnJKQJB7JrKw@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] virtio: Add get_shm_region method
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: virtio-dev@lists.oasis-open.org, Miklos Szeredi <miklos@szeredi.hu>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vivek Goyal <vgoyal@redhat.com>
Content-Type: multipart/mixed; boundary="===============0205598778=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0205598778==
Content-Type: multipart/alternative; boundary="000000000000eb9e8405aeeaa4e2"

--000000000000eb9e8405aeeaa4e2
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 9, 2020 at 2:28 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Wed, Sep 9, 2020 at 11:27 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Sep 09, 2020 at 09:13:11AM +0200, Miklos Szeredi wrote:
> > > On Wed, Sep 9, 2020 at 9:04 AM Gerd Hoffmann <kraxel@redhat.com>
> wrote:
> > > >
> > > > On Wed, Sep 02, 2020 at 05:00:25PM -0700, Gurchetan Singh wrote:
> > > > > On Wed, Sep 2, 2020 at 3:15 PM Vivek Goyal <vgoyal@redhat.com>
> wrote:
> > > > >
> > > > > > Hi Gurchetan,
> > > > > >
> > > > > > Now Miklos has queued, these tree virtio patches for shared
> memory
> > > > > > region in his tree as part of virtiofs dax patch series.
> > > > > >
> > > > > > I am hoping this will get merged in 5.10 through his tree.
> > > > > >
> > > > > >
> > > > > >
> https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=dax
> > > > >
> > > > >
> > > > > Terrific ... !  Maybe we can queue the version Miklos has in
> drm-misc-next
> > > > > to avoid merge conflicts ?!?
> > > >
> > > > I guess it would either be merging the fuse tree into drm-misc-next,
> > > > or cherry-picking the three virtio shm patches from the fuse tree.
> > >
> > > Maybe cleanest if we'd do a separate branch for the virtio patches and
> > > pull that into both the fuse-next and the drm-misc-next trees?
> >
> > +1
> >
> > If the trees are more closely related (e.g. drm and v4l or so) then
> > occasionally we just merge patches into one tree with acks from all the
> > other maintainers. But topic branch for the common bits feels better
> here.
> >
> > Please send the topic pull request to drm-misc maintainers (Maarten,
> > Maxime, Thomas) so they can pull it in.
>

That sounds like an excellent plan !

I will send out blob v3 (incorporating kraxel@'s feedback) once the topic
pull request (it seems Miklos will do this?) for the shm region patches has
been merged into drm-misc-next.


>
> Works better when I add them :-)
> -Daniel
>
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000eb9e8405aeeaa4e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 9, 2020 at 2:28 AM Daniel=
 Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch">daniel.vetter@ffwll.c=
h</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Wed, Sep 9, 2020 at 11:27 AM Daniel Vetter &lt;<a href=3D"mailto:daniel=
@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Sep 09, 2020 at 09:13:11AM +0200, Miklos Szeredi wrote:<br>
&gt; &gt; On Wed, Sep 9, 2020 at 9:04 AM Gerd Hoffmann &lt;<a href=3D"mailt=
o:kraxel@redhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Sep 02, 2020 at 05:00:25PM -0700, Gurchetan Singh wr=
ote:<br>
&gt; &gt; &gt; &gt; On Wed, Sep 2, 2020 at 3:15 PM Vivek Goyal &lt;<a href=
=3D"mailto:vgoyal@redhat.com" target=3D"_blank">vgoyal@redhat.com</a>&gt; w=
rote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Hi Gurchetan,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Now Miklos has queued, these tree virtio patches f=
or shared memory<br>
&gt; &gt; &gt; &gt; &gt; region in his tree as part of virtiofs dax patch s=
eries.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I am hoping this will get merged in 5.10 through h=
is tree.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/ke=
rnel/git/mszeredi/fuse.git/log/?h=3Ddax" rel=3D"noreferrer" target=3D"_blan=
k">https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=
=3Ddax</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Terrific ... !=C2=A0 Maybe we can queue the version Mik=
los has in drm-misc-next<br>
&gt; &gt; &gt; &gt; to avoid merge conflicts ?!?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I guess it would either be merging the fuse tree into drm-mi=
sc-next,<br>
&gt; &gt; &gt; or cherry-picking the three virtio shm patches from the fuse=
 tree.<br>
&gt; &gt;<br>
&gt; &gt; Maybe cleanest if we&#39;d do a separate branch for the virtio pa=
tches and<br>
&gt; &gt; pull that into both the fuse-next and the drm-misc-next trees?<br=
>
&gt;<br>
&gt; +1<br>
&gt;<br>
&gt; If the trees are more closely related (e.g. drm and v4l or so) then<br=
>
&gt; occasionally we just merge patches into one tree with acks from all th=
e<br>
&gt; other maintainers. But topic branch for the common bits feels better h=
ere.<br>
&gt;<br>
&gt; Please send the topic pull request to drm-misc maintainers (Maarten,<b=
r>
&gt; Maxime, Thomas) so they can pull it in.<br></blockquote><div><br></div=
><div><div>That sounds like an excellent plan !</div><div><br></div><div>I =
will send out blob v3 (incorporating kraxel@&#39;s feedback) once the topic=
 pull request (it seems Miklos will do this?) for the shm region patches ha=
s been merged into drm-misc-next.</div></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Works better when I add them :-)<br>
-Daniel<br>
<br>
&gt; --<br>
&gt; Daniel Vetter<br>
&gt; Software Engineer, Intel Corporation<br>
&gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">=
http://blog.ffwll.ch</a><br>
<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--000000000000eb9e8405aeeaa4e2--

--===============0205598778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0205598778==--
