Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6964CA3CB79
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 22:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBDB10E033;
	Wed, 19 Feb 2025 21:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FWdndWRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C888810E033
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 21:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740000672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6u/f7ETTpzHahitWuvlU8CwIPNEow1YeX4M35Pg/PWE=;
 b=FWdndWRn9NgDYYiD0i/wS/qfyGbgVJA7K3ygipgQmxmu3X8f4TsY0CYAMxjqQB5KKadbbJ
 3+VBVZgnI/TJV3dU33U92OkAiBrht9+5nysoMKKNNKFbhcp0L3NBontaiWrQVk566VdDLE
 5s0hSB5MUj9UZHRDKY9O22kqHzK0pfc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-cRMsf0HXMc27qXVYOI6uSg-1; Wed, 19 Feb 2025 16:31:11 -0500
X-MC-Unique: cRMsf0HXMc27qXVYOI6uSg-1
X-Mimecast-MFC-AGG-ID: cRMsf0HXMc27qXVYOI6uSg_1740000670
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6f2bdb560ecso3420667b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740000670; x=1740605470;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6u/f7ETTpzHahitWuvlU8CwIPNEow1YeX4M35Pg/PWE=;
 b=qgdrjukBfWijeRRtuwRCqRFrbd1vucTORIm8oTERSM6iUaQ5kvFtUIeEs4v1W/JrxU
 Vf9eaD5FdyafgRmR9iW46bbERGHHRAjZ85RWxPKi+hZs0UelpNynoqEoyYIKEznJRAO1
 SYnPy3WT08bgP43lm/BI4dIxHuwuj7QZIUik3pEvUzbIasI/t7OPoTmWUjIMPj7xvhax
 /kWlV96yzw4LS/kzjMk9pTtCVQbbpvAjInvxCSxqh3pjCIsk/+tvUxZajf0P2egf/ukK
 knAcnr4vcPDhMpjQSwZBXDM7pRNXIj5f1CLeycvxz7175wHa56ImWtyGXz+srtd5oqNu
 7rKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHntCtBWn7ahuiEmb1QDTjxulUD61+T/LPpWTKil1DHFGyfuPDXy7NAUzH6FL9QaM0Oq+sCFkHgTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQMNlamTpX8Sr18kVqMdk8i8A2p++0husbaT6gA6RQgHZn6nDP
 Ye/8g2TQXnqwEi0MPbkrkEB1r2/AH7DE83g9GmlbKM90QXSNOxZep5X/LtnrUL5S4H0uHsxegVa
 dAKWXfedTTIDKD1J+FFoxHqR6OlrP0FY7b6I5afdlkeJXXmd2+mpy/GSB0evYuwiTFPflG9bs0M
 VpfEyh0z9sUZ6CjrDWigeDUOHJJhV4SmOxYYEESvbM
X-Gm-Gg: ASbGncvFsyBDviaDyLx4E67aIG9q8VtLJX25E7p3TjnzHyULXcMontqYCfAYMHgjdgu
 BYR/dr4SscmoY9g9NY8739Y34iD8ELaNY+zeEZ6xE/eT4LW8tZGdkaeu3IJty
X-Received: by 2002:a05:690c:7201:b0:6e9:e097:718c with SMTP id
 00721157ae682-6fba5658997mr51241027b3.6.1740000670601; 
 Wed, 19 Feb 2025 13:31:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHH5yWuFWD8HOSOuMjrdhD7+j20Vb3ll45oNTTH25r6fhMYhCz3QnKhSFooL6XRUWyJ4YtyZx5fMZsNNyfBtp4=
X-Received: by 2002:a05:690c:7201:b0:6e9:e097:718c with SMTP id
 00721157ae682-6fba5658997mr51240847b3.6.1740000670330; Wed, 19 Feb 2025
 13:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com>
 <20250218-fabulous-agile-corgi-9a5ee0@houat>
 <ynmxaimdwkwfiryz5le5vpnfh5fzh5se4ebyqzkbnq355me76x@yxtyan3niivb>
 <20250218-primitive-kickass-seagull-008bf2@houat>
 <rg4mctlqofydzexa7uwnmcsv66dhx5u2wrmytslpyltraz6p5q@ohvo7ab2ws7q>
 <20250219-marvellous-calculating-piculet-f6b9ec@houat>
In-Reply-To: <20250219-marvellous-calculating-piculet-f6b9ec@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 19 Feb 2025 16:30:59 -0500
X-Gm-Features: AWEUYZn00Bx46yvwWZG-BPnDfva1hO1anEUn300eOj0eAM6tGwpHYKK9xw_rxS4
Message-ID: <CAN9Xe3QtCwWLKSxV_rK3AmaChbuZ+z9snKVYYsGCL9fvvSryTg@mail.gmail.com>
Subject: Re: [PATCH 00/20] drm/panel: Move to using mipi_dsi_*_multi()
 variants when available
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Doug Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joel Selvaraj <jo@jsfamily.in>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>,
 Jianhua Lu <lujianhua000@gmail.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Artur Weber <aweber.kernel@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Tejas Vipin <tejasvipin76@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aX5J695TxAn2GO6_y8muiI14EC1eDJtNdRo_eNuLzDs_1740000670
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000dd4437062e857993"
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

--000000000000dd4437062e857993
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 8:35=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:

> On Wed, Feb 19, 2025 at 11:11:33AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 18, 2025 at 04:52:53PM +0100, Maxime Ripard wrote:
> > > On Tue, Feb 18, 2025 at 02:14:43PM +0200, Dmitry Baryshkov wrote:
> > > > On Tue, Feb 18, 2025 at 10:55:49AM +0100, Maxime Ripard wrote:
> > > > > On Fri, Feb 14, 2025 at 08:26:02AM -0800, Doug Anderson wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Thu, Feb 13, 2025 at 12:44=E2=80=AFPM Anusha Srivatsa <
> asrivats@redhat.com> wrote:
> > > > > > >
> > > > > > > A lot of mipi API are deprecated and have a _multi() variant
> > > > > > > which is the preferred way forward. This covers  TODO in the
> > > > > > > gpu Documentation:[1]
> > > > > > >
> > > > > > > An incomplete effort was made in the previous version
> > > > > > > to address this[2]. It removed on the mipi_dsi_dcs_write_seq(=
)
> > > > > > > and mipi_dsi_generic_write_seq_multi() with the respective
> > > > > > > replacemts and not the rest of the API.
> > > > > >
> > > > > > You didn't seem to take most of the suggestions I gave in
> response to
> > > > > > your v1 [3]. Specifically:
> > > > > >
> > > > > > a) I asked that you CC Tejas. I've added him again.
> > > > > >
> > > > > > b) I asked that you CC me on the whole patch series, which you
> didn't
> > > > > > do. I can find them, but I'd find it convenient in this case fo=
r
> them
> > > > > > to be in my Inbox.
> > > > > >
> > > > > > The first patch conflicts with what Tejas already landed in
> > > > > > drm-misc-next. See commit 8025f23728e9 ("drm/panel:
> > > > > > xinpeng-xpp055c272: transition to mipi_dsi wrapped functions").
> The
> > > > > > second patch _also_ conflicts with what Tejas already landed. S=
ee
> > > > > > commit f4dd4cb79f9e ("drm/panel: visionox-r66451: transition to
> > > > > > mipi_dsi wrapped functions"). Later patches also also conflict.
> See
> > > > > > commit 0d6c9edf9e5b ("drm/panel: ebbg-ft8719: transition to
> mipi_dsi
> > > > > > wrapped functions"), commit ce8c69ec90ca ("drm/panel:
> > > > > > samsung-s6e88a0-ams452ef01: transition to mipi_dsi wrapped
> > > > > > functions"), and commit 7e3bf00047cd ("drm/panel:
> sharp-ls060t1sx01:
> > > > > > transition to mipi_dsi wrapped functions"). Maybe you should
> sync up
> > > > > > with drm-misc-next before submitting.
> > > > >
> > > > > Yes, you should definitely work from drm-misc-next there, and syn=
c
> with
> > > > > Tejas.
> > > > >
> > > > > > I also questioned whether this really made sense to try to do
> with a
> > > > > > Coccinelle script and I still don't think so. It looks like
> Dmitry has
> > > > > > already reviewed the first few of your patches and has repeated
> my
> > > > > > advice. If you want to help with the effort of addressing this
> TODO
> > > > > > item then that's great, but I'll stop reviewing (and start
> silently
> > > > > > deleting) any future submissions of yours that say that they're
> done
> > > > > > entirely with a Coccinelle script unless you address this point
> and
> > > > > > convince me that your Coccinelle script is really smart enough =
to
> > > > > > handle all the corner cases. I'll also assert that you should
> review
> > > > > > Tejas's submissions to see how these conversions are expected t=
o
> go.
> > > > >
> > > > > I couldn't find that in your first answer though. What corner
> cases do
> > > > > you have in mind, and why do you think coccinelle can't handle
> them?
> > > >
> > > > As can be seen from the reviews:
> > > >
> > > > - sleeps between DSI calls
> > > > - properly propagating the error at the end of the function
> > >
> > > These two are legitimate feedback, but I don't see how coccinelle
> cannot
> > > deal with them.
> >
> > Maybe it can. both issues were pointed out during review of the first
> > series, there was no improvement here. I'd really ask to perform
> > conversion of a single driver, so that the script (or post-script
> > fixups) can be improved. I'd still expect that Anusha actually reviews
> > the changed driver before posting it and verifies that there is no
> > regression in the logic / error reporting.
>
> Yeah, it makes sense, thanks!
>

Dmitry, Doug,

Sorry for the late response, I was out. A lot of the confusion and effort
could have been saved had I worked on the -misc branch. My bad.  WIll keep
the rest of the feedback in mind and address one driver at a time to avoid
an overhaul of changes. Thanks for taking time out to guide me in the right
direction!

Anusha

> Maxime
>

--000000000000dd4437062e857993
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 19,=
 2025 at 8:35=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel=
.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Wed, Feb 19, 2025 at 11:11:33AM +0200, Dmitry Ba=
ryshkov wrote:<br>
&gt; On Tue, Feb 18, 2025 at 04:52:53PM +0100, Maxime Ripard wrote:<br>
&gt; &gt; On Tue, Feb 18, 2025 at 02:14:43PM +0200, Dmitry Baryshkov wrote:=
<br>
&gt; &gt; &gt; On Tue, Feb 18, 2025 at 10:55:49AM +0100, Maxime Ripard wrot=
e:<br>
&gt; &gt; &gt; &gt; On Fri, Feb 14, 2025 at 08:26:02AM -0800, Doug Anderson=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; On Thu, Feb 13, 2025 at 12:44=E2=80=AFPM Anusha Sr=
ivatsa &lt;<a href=3D"mailto:asrivats@redhat.com" target=3D"_blank">asrivat=
s@redhat.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; A lot of mipi API are deprecated and have a _=
multi() variant<br>
&gt; &gt; &gt; &gt; &gt; &gt; which is the preferred way forward. This cove=
rs=C2=A0 TODO in the<br>
&gt; &gt; &gt; &gt; &gt; &gt; gpu Documentation:[1]<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; An incomplete effort was made in the previous=
 version<br>
&gt; &gt; &gt; &gt; &gt; &gt; to address this[2]. It removed on the mipi_ds=
i_dcs_write_seq()<br>
&gt; &gt; &gt; &gt; &gt; &gt; and mipi_dsi_generic_write_seq_multi() with t=
he respective<br>
&gt; &gt; &gt; &gt; &gt; &gt; replacemts and not the rest of the API.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; You didn&#39;t seem to take most of the suggestion=
s I gave in response to<br>
&gt; &gt; &gt; &gt; &gt; your v1 [3]. Specifically:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; a) I asked that you CC Tejas. I&#39;ve added him a=
gain.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; b) I asked that you CC me on the whole patch serie=
s, which you didn&#39;t<br>
&gt; &gt; &gt; &gt; &gt; do. I can find them, but I&#39;d find it convenien=
t in this case for them<br>
&gt; &gt; &gt; &gt; &gt; to be in my Inbox.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; The first patch conflicts with what Tejas already =
landed in<br>
&gt; &gt; &gt; &gt; &gt; drm-misc-next. See commit 8025f23728e9 (&quot;drm/=
panel:<br>
&gt; &gt; &gt; &gt; &gt; xinpeng-xpp055c272: transition to mipi_dsi wrapped=
 functions&quot;). The<br>
&gt; &gt; &gt; &gt; &gt; second patch _also_ conflicts with what Tejas alre=
ady landed. See<br>
&gt; &gt; &gt; &gt; &gt; commit f4dd4cb79f9e (&quot;drm/panel: visionox-r66=
451: transition to<br>
&gt; &gt; &gt; &gt; &gt; mipi_dsi wrapped functions&quot;). Later patches a=
lso also conflict. See<br>
&gt; &gt; &gt; &gt; &gt; commit 0d6c9edf9e5b (&quot;drm/panel: ebbg-ft8719:=
 transition to mipi_dsi<br>
&gt; &gt; &gt; &gt; &gt; wrapped functions&quot;), commit ce8c69ec90ca (&qu=
ot;drm/panel:<br>
&gt; &gt; &gt; &gt; &gt; samsung-s6e88a0-ams452ef01: transition to mipi_dsi=
 wrapped<br>
&gt; &gt; &gt; &gt; &gt; functions&quot;), and commit 7e3bf00047cd (&quot;d=
rm/panel: sharp-ls060t1sx01:<br>
&gt; &gt; &gt; &gt; &gt; transition to mipi_dsi wrapped functions&quot;). M=
aybe you should sync up<br>
&gt; &gt; &gt; &gt; &gt; with drm-misc-next before submitting.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Yes, you should definitely work from drm-misc-next ther=
e, and sync with<br>
&gt; &gt; &gt; &gt; Tejas.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; I also questioned whether this really made sense t=
o try to do with a<br>
&gt; &gt; &gt; &gt; &gt; Coccinelle script and I still don&#39;t think so. =
It looks like Dmitry has<br>
&gt; &gt; &gt; &gt; &gt; already reviewed the first few of your patches and=
 has repeated my<br>
&gt; &gt; &gt; &gt; &gt; advice. If you want to help with the effort of add=
ressing this TODO<br>
&gt; &gt; &gt; &gt; &gt; item then that&#39;s great, but I&#39;ll stop revi=
ewing (and start silently<br>
&gt; &gt; &gt; &gt; &gt; deleting) any future submissions of yours that say=
 that they&#39;re done<br>
&gt; &gt; &gt; &gt; &gt; entirely with a Coccinelle script unless you addre=
ss this point and<br>
&gt; &gt; &gt; &gt; &gt; convince me that your Coccinelle script is really =
smart enough to<br>
&gt; &gt; &gt; &gt; &gt; handle all the corner cases. I&#39;ll also assert =
that you should review<br>
&gt; &gt; &gt; &gt; &gt; Tejas&#39;s submissions to see how these conversio=
ns are expected to go.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I couldn&#39;t find that in your first answer though. W=
hat corner cases do<br>
&gt; &gt; &gt; &gt; you have in mind, and why do you think coccinelle can&#=
39;t handle them?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; As can be seen from the reviews:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; - sleeps between DSI calls<br>
&gt; &gt; &gt; - properly propagating the error at the end of the function<=
br>
&gt; &gt; <br>
&gt; &gt; These two are legitimate feedback, but I don&#39;t see how coccin=
elle cannot<br>
&gt; &gt; deal with them.<br>
&gt; <br>
&gt; Maybe it can. both issues were pointed out during review of the first<=
br>
&gt; series, there was no improvement here. I&#39;d really ask to perform<b=
r>
&gt; conversion of a single driver, so that the script (or post-script<br>
&gt; fixups) can be improved. I&#39;d still expect that Anusha actually rev=
iews<br>
&gt; the changed driver before posting it and verifies that there is no<br>
&gt; regression in the logic / error reporting.<br>
<br>
Yeah, it makes sense, thanks!<br></blockquote><div><br></div><div>Dmitry, D=
oug,</div><div><br></div><div>Sorry for the late response, I was out. A lot=
 of the confusion and effort=C2=A0 could have been saved had I worked on th=
e -misc branch. My bad.=C2=A0 WIll keep the rest of the feedback in mind an=
d address one driver at a time to avoid an overhaul of changes. Thanks for =
taking time out to guide me in the right direction!=C2=A0 <br></div><div><b=
r></div><div>Anusha<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
Maxime<br>
</blockquote></div></div>

--000000000000dd4437062e857993--

