Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490F05BE956
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 16:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD8A10E6E5;
	Tue, 20 Sep 2022 14:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B30C10E6E5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 14:49:33 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id a67so3748020ybb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=/jfklkoctrVdBBmmBFR/USMfX8ttKeII2gIf7E4N0oY=;
 b=mqOGrQThTGlnIzWTiVsNRnYGhTTs2cOeC7w11jRDF6feVKWYRw9ZAxkVymJPy8SttP
 crc5AkNluk09VJ6cYwFnOw4KjBwYGwzl7zZBEDINmI/194PijlhXnQf0oEnOPPbY8Nn1
 Qa11CKJ/tRT1lpCiHxrq/dbAxyUoK6jTDgEBcA5aZVfht6TT7a9vHFo7v0jYm+S62/oG
 MFZBRk6A3ME9yHWqv+O4EYK2w2UG9HuwNx03uLs8kkqt5s/mLPZLQsInJR535ysH80ht
 iY9yKmhuF/eSn+d8fIJ0N8IP0h0xyAqTO+yjhnEJ1mvwKN7YkRJF4dm/rxV7Xpu7Cg+s
 SCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=/jfklkoctrVdBBmmBFR/USMfX8ttKeII2gIf7E4N0oY=;
 b=e1fN9K+PKAPvlAvnqesMxfTIau8XCyU8IFKh+7+YWAykh8S2lo6M//3BynFeE0pL74
 TSCXQ/j5fbFFocD8Q0X2piy7g+FGp29+H4I79RhCXhMGYLORmcFfzLP+hHTiRL8z5l+M
 QGh5aTUpdyu+nEXDln92HX6jPFTO0YABSPYP2Zkc8dSiTEwDeMrg3uE/DWmY8adUFuHr
 M60cwYDHHvUtMGvslUHuxC7rtgFhZoRPpR1U74TmXC6iF4Q+EVK/K2NbrAOA0qC/UHWc
 eN0p7Ome6c9AuwBFMZUf4dSX4iTarwdqtIz2DwkHR9uD3n+580XtsaJ0B5HHPMVvlmaX
 QmzQ==
X-Gm-Message-State: ACrzQf0VkAHL5H7wkd5cZhRdTy3t0Ff0+rsIiQMbauInA/L6v8QZgbSx
 tmzvKjY1GnXUJ2+WCfvOlYy1swx+8nzbhTJP6aU3mg==
X-Google-Smtp-Source: AMsMyM65FB2cq8LJsyfRc7x4VDliBjDWy1mIkXgnA/O4xpnhwchzn4ylfuVgMAEQdcZGWI/6iFD5lauet7j/UGTc9EM=
X-Received: by 2002:a25:ef4f:0:b0:6ae:f5ce:91e8 with SMTP id
 w15-20020a25ef4f000000b006aef5ce91e8mr19851950ybm.280.1663685372083; Tue, 20
 Sep 2022 07:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de>
 <YynOvpMGbVKWiO8p@intel.com>
In-Reply-To: <YynOvpMGbVKWiO8p@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Sep 2022 15:47:39 +0100
Message-ID: <CAPj87rNi0iFuG10qFMc5g=XB94G99aCyOP+D_rJpOMOWrK_QKQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000009f15e905e91cef0c"
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
Cc: airlied@linux.ie, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000009f15e905e91cef0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 20 Sept 2022 at 15:31, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux=
.intel.com>
wrote:

> On Tue, Sep 20, 2022 at 03:56:18PM +0200, Thomas Zimmermann wrote:
> > Set partial updates on a plane if the framebuffer has not been changed
> > on an atomic commit. If such a plane has damage clips, the driver will
> > use them; otherwise the update is effectively empty. Planes that change
> > their framebuffer still perform a full update.
>
> I have a feeling you're sort of papering over some inefficient
> userspace that's asking updates on planes that don't actually
> need them. I'm not sure adding more code for that is a particularly
> great idea. Wouldn't it be better to just fix the userspace code?
>

I'm not sure why it would need to be 'fixed', when it's never been a
property of the atomic API that you must minimise updates. Weston does this
(dumps the full state in every time), and I know we're not the only ones.

'Fixing' it would require doing a bunch of diffing in userspace, because
maintaining a delta and trying to unwind that delta across multiple
TEST_ONLY runs, isn't much fun. It's certainly a far bigger diff than this
patch.


> Any property change on the plane could need a full plane
> update as well (eg. some color mangement stuff etc.). So you'd
> have to keep adding exceptions to that list whenever new
> properties are added.
>

Eh, it's just a blob ID comparison.


> And I think the semantics of the ioctl(s) has so far been that
> basically any page flip (whether or not it actually changes
> the fb) still ends up doing whatever flushing is needed to
> guarantee the fb contents are up to date on the screen (if
> someone sneaked in some front buffer rendering in between).
> Ie. you could even use basically a nop page flip in place
> of dirtyfb.
>
> Another thing the ioctls have always done is actually perform
> the commit whether anything changed or nor. That is, they
> still do all the same the same vblanky stuff and the commit
> takes the same amount of time. Not sure if your idea is
> to potentially short circuit the entire thing and make it
> take no time at all?
>

I would expect it to always perform a commit, though.

Cheers,
Daniel

--0000000000009f15e905e91cef0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, 20 Sept 2022 at 15:31, Ville S=
yrj=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.intel.com">ville=
.syrjala@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, Sep 20, 2022 at 03:56:18PM +0200, Thomas Zi=
mmermann wrote:<br>
&gt; Set partial updates on a plane if the framebuffer has not been changed=
<br>
&gt; on an atomic commit. If such a plane has damage clips, the driver will=
<br>
&gt; use them; otherwise the update is effectively empty. Planes that chang=
e<br>
&gt; their framebuffer still perform a full update.<br>
<br>
I have a feeling you&#39;re sort of papering over some inefficient<br>
userspace that&#39;s asking updates on planes that don&#39;t actually<br>
need them. I&#39;m not sure adding more code for that is a particularly<br>
great idea. Wouldn&#39;t it be better to just fix the userspace code?<br></=
blockquote><div><br></div><div>I&#39;m not sure why it would need to be &#3=
9;fixed&#39;, when it&#39;s never been a property of the atomic API that yo=
u must minimise updates. Weston does this (dumps the full state in every ti=
me), and I know we&#39;re not the only ones.</div><div><br></div><div>&#39;=
Fixing&#39; it would require doing a bunch of diffing in userspace, because=
 maintaining a delta and trying to unwind that delta across multiple TEST_O=
NLY runs, isn&#39;t much fun. It&#39;s certainly a far bigger diff than thi=
s patch.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
Any property change on the plane could need a full plane<br>
update as well (eg. some color mangement stuff etc.). So you&#39;d<br>
have to keep adding exceptions to that list whenever new<br>
properties are added.<br></blockquote><div><br></div><div>Eh, it&#39;s just=
 a blob ID comparison.</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
And I think the semantics of the ioctl(s) has so far been that<br>
basically any page flip (whether or not it actually changes<br>
the fb) still ends up doing whatever flushing is needed to<br>
guarantee the fb contents are up to date on the screen (if<br>
someone sneaked in some front buffer rendering in between).<br>
Ie. you could even use basically a nop page flip in place <br>
of dirtyfb.<br>
<br>
Another thing the ioctls have always done is actually perform<br>
the commit whether anything changed or nor. That is, they<br>
still do all the same the same vblanky stuff and the commit<br>
takes the same amount of time. Not sure if your idea is<br>
to potentially short circuit the entire thing and make it <br>
take no time at all?<br></blockquote><div><br></div><div>I would expect it =
to always perform a commit, though.</div><div><br></div><div>Cheers,</div><=
div>Daniel=C2=A0</div></div></div>

--0000000000009f15e905e91cef0c--
