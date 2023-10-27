Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537847D985D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 14:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA07F10E99D;
	Fri, 27 Oct 2023 12:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC52410E987;
 Fri, 27 Oct 2023 11:40:34 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1F9E732F300;
 Fri, 27 Oct 2023 12:40:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1698406833; bh=wG+Or0IrVbr9QrapOKiZLVSdoSVMWbJyfdSVuhCFQbY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HrM0zTQsmTLRjhE27lWTwQPmH3azNrOoSXfVGScQ2okeNUw6lZ6unTDvPHmlPhx2E
 hqqVjXjC3JnUaev3hyTA7eY8fAQPaTFsqnYtFWgj8xnZQq8D7e8z2+x0BwDiv4usvv
 Yf/bhqKzUWHanJeSQj1yjTL9GMaXM9JlvB76j2W+u+t3zQzQimw62gUd6ye5A5lng3
 +RqZke01A5WSwpDsYi32nM/rn7RW/rcCtZzOQfuJ7PNN2NtsbrZM1Yoq48Q6pcW2ao
 D/zN/6r+jH6ms23Xg5jlQY9oh65JNJW/YZXXNRvrWzKy3L8pvDgAQG+V0HQcq42sKu
 j9EHbz/HnqVSg==
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-9bdf5829000so318608366b.0; 
 Fri, 27 Oct 2023 04:40:33 -0700 (PDT)
X-Gm-Message-State: AOJu0YyqX2sp8HpqWbew10Dszzh3Mho1wWznsI+9DUSXioDX29d8aA+c
 lafqfvpNJSy3QaU0VvQCXOUBkU8RTR69IKTlEok=
X-Google-Smtp-Source: AGHT+IFz3s5hJKaoSoreogrWUDJ7A2QUmcjcm75nkMZa6hhDxgeZrXA8GcAtZjqLgWDybU9Qfy32FwhyZMZsSicqiL4=
X-Received: by 2002:a17:907:3da9:b0:9ae:5be8:ff90 with SMTP id
 he41-20020a1709073da900b009ae5be8ff90mr2121007ejc.68.1698406832304; Fri, 27
 Oct 2023 04:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell> <20231026173003.GA319477@toolbox>
 <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
 <34be9d0b-18d7-7568-cf30-b3b1b9f77045@mailbox.org>
 <20231027100132.GA435169@toolbox>
In-Reply-To: <20231027100132.GA435169@toolbox>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Fri, 27 Oct 2023 13:40:20 +0200
X-Gmail-Original-Message-ID: <CAFZQkGwdrqYNR5vE3L_TLN+Eq96sB+HJCDdX-_z-pDzTYwOu2A@mail.gmail.com>
Message-ID: <CAFZQkGwdrqYNR5vE3L_TLN+Eq96sB+HJCDdX-_z-pDzTYwOu2A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: Sebastian Wick <sebastian.wick@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ec78330608b127f3"
X-Mailman-Approved-At: Fri, 27 Oct 2023 12:34:30 +0000
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Shashank Sharma <shashank.sharma@amd.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Victoria Brekenfeld <victoria@system76.com>, dri-devel@lists.freedesktop.org,
 Christopher Braga <quic_cbraga@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, Hector Martin <marcan@marcan.st>,
 wayland-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 Naseer Ahmed <quic_naseer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000ec78330608b127f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Fr., 27. Okt. 2023 um 12:01 Uhr schrieb Sebastian Wick <
sebastian.wick@redhat.com>:

> On Fri, Oct 27, 2023 at 10:59:25AM +0200, Michel D=C3=A4nzer wrote:
> > On 10/26/23 21:25, Alex Goins wrote:
> > > On Thu, 26 Oct 2023, Sebastian Wick wrote:
> > >> On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote:
> > >>> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
> > >>> Alex Goins <agoins@nvidia.com> wrote:
> > >>>
> > >>>> Despite being programmable, the LUTs are updated in a manner that
> is less
> > >>>> efficient as compared to e.g. the non-static "degamma" LUT. Would
> it be helpful
> > >>>> if there was some way to tag operations according to their
> performance,
> > >>>> for example so that clients can prefer a high performance one when
> they
> > >>>> intend to do an animated transition? I recall from the XDC HDR
> workshop
> > >>>> that this is also an issue with AMD's 3DLUT, where updates can be
> too
> > >>>> slow to animate.
> > >>>
> > >>> I can certainly see such information being useful, but then we need
> to
> > >>> somehow quantize the performance.
> > >
> > > Right, which wouldn't even necessarily be universal, could depend on
> the given
> > > host, GPU, etc. It could just be a relative performance indication, t=
o
> give an
> > > order of preference. That wouldn't tell you if it can or can't be
> animated, but
> > > when choosing between two LUTs to animate you could prefer the higher
> > > performance one.
> > >
> > >>>
> > >>> What I was left puzzled about after the XDC workshop is that is it
> > >>> possible to pre-load configurations in the background (slow), and
> then
> > >>> quickly switch between them? Hardware-wise I mean.
> > >
> > > This works fine for our "fast" LUTs, you just point them to a surface
> in video
> > > memory and they flip to it. You could keep multiple surfaces around
> and flip
> > > between them without having to reprogram them in software. We can
> easily do that
> > > with enumerated curves, populating them when the driver initializes
> instead of
> > > waiting for the client to request them. You can even point multiple
> hardware
> > > LUTs to the same video memory surface, if they need the same curve.
> > >
> > >>
> > >> We could define that pipelines with a lower ID are to be preferred
> over
> > >> higher IDs.
> > >
> > > Sure, but this isn't just an issue with a pipeline as a whole, but th=
e
> > > individual elements within it and how to use them in a given context.
> > >
> > >>
> > >> The issue is that if programming a pipeline becomes too slow to be
> > >> useful it probably should just not be made available to user space.
> > >
> > > It's not that programming the pipeline is overall too slow. The LUTs
> we have
> > > that are relatively slow to program are meant to be set infrequently,
> or even
> > > just once, to allow the scaler and tone mapping operator to operate i=
n
> fixed
> > > point PQ space. You might still want the tone mapper, so you would
> choose a
> > > pipeline that includes them, but when it comes to e.g. animating a
> night light,
> > > you would want to choose a different LUT for that purpose.
> > >
> > >>
> > >> The prepare-commit idea for blob properties would help to make the
> > >> pipelines usable again, but until then it's probably a good idea to
> just
> > >> not expose those pipelines.
> > >
> > > The prepare-commit idea actually wouldn't work for these LUTs, becaus=
e
> they are
> > > programmed using methods instead of pointing them to a surface. I'm
> actually not
> > > sure how slow it actually is, would need to benchmark it. I think not
> exposing
> > > them at all would be overkill, since it would mean you can't use the
> preblending
> > > scaler or tonemapper, and animation isn't necessary for that.
> > >
> > > The AMD 3DLUT is another example of a LUT that is slow to update, and
> it would
> > > obviously be a major loss if that wasn't exposed. There just needs to
> be some
> > > way for clients to know if they are going to kill performance by
> trying to
> > > change it every frame.
> >
> > Might a first step be to require the ALLOW_MODESET flag to be set when
> changing the values for a colorop which is too slow to be updated per
> refresh cycle?
> >
> > This would tell the compositor: You can use this colorop, but you can't
> change its values on the fly.
>
> I argued before that changing any color op to passthrough should never
> require ALLOW_MODESET and while this is really hard to guarantee from a
> driver perspective I still believe that it's better to not expose any
> feature requiring ALLOW_MODESET or taking too long to program to be
> useful for per-frame changes.
>
> When user space has ways to figure out if going back to a specific state
> (in this case setting everything to bypass) without ALLOW_MODESET we can
> revisit this decision, but until then, let's keep things simple and only
> expose things that work reliably without ALLOW_MODESET and fast enough
> to work for per-frame changes.
>

Knowing an operation is fast enough for "per-frame" changes is by far not
enough. If programming a 3D lut takes 4 milliseconds for example, that
requires very different scheduling for atomic commits to hit the vblank
deadline from when programming a 1D lut takes 100 microseconds. It's also
dependent on the refresh rate - that 4ms example would be per-frame on a
60Hz display, but not on a 300Hz display.

The only thing that would be useful for me is to get an upper bound on how
long programming a color pipeline and/or the individual elements takes
(exposed in the API, or at the very least documented). Without something
like that I would only ever program the pipelines on modesets because
there's no strict timing requirements there.


>
> Harry, Pekka: Should we document this? It obviously restricts what can
> be exposed but exposing things that can't be used by user space isn't
> useful.
>
> >
> > --
> > Earthling Michel D=C3=A4nzer            |                  https://redh=
at.com
> > Libre software enthusiast          |         Mesa and Xwayland develope=
r
> >
>
>

--000000000000ec78330608b127f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">Am Fr., 27. Okt. 2023 um 12:01=C2=A0Uhr schrieb Sebastian Wick &=
lt;<a href=3D"mailto:sebastian.wick@redhat.com">sebastian.wick@redhat.com</=
a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, =
Oct 27, 2023 at 10:59:25AM +0200, Michel D=C3=A4nzer wrote:<br>
&gt; On 10/26/23 21:25, Alex Goins wrote:<br>
&gt; &gt; On Thu, 26 Oct 2023, Sebastian Wick wrote:<br>
&gt; &gt;&gt; On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrot=
e:<br>
&gt; &gt;&gt;&gt; On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)<br>
&gt; &gt;&gt;&gt; Alex Goins &lt;<a href=3D"mailto:agoins@nvidia.com" targe=
t=3D"_blank">agoins@nvidia.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Despite being programmable, the LUTs are updated in a=
 manner that is less<br>
&gt; &gt;&gt;&gt;&gt; efficient as compared to e.g. the non-static &quot;de=
gamma&quot; LUT. Would it be helpful<br>
&gt; &gt;&gt;&gt;&gt; if there was some way to tag operations according to =
their performance,<br>
&gt; &gt;&gt;&gt;&gt; for example so that clients can prefer a high perform=
ance one when they<br>
&gt; &gt;&gt;&gt;&gt; intend to do an animated transition? I recall from th=
e XDC HDR workshop<br>
&gt; &gt;&gt;&gt;&gt; that this is also an issue with AMD&#39;s 3DLUT, wher=
e updates can be too<br>
&gt; &gt;&gt;&gt;&gt; slow to animate.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I can certainly see such information being useful, but th=
en we need to<br>
&gt; &gt;&gt;&gt; somehow quantize the performance.<br>
&gt; &gt; <br>
&gt; &gt; Right, which wouldn&#39;t even necessarily be universal, could de=
pend on the given<br>
&gt; &gt; host, GPU, etc. It could just be a relative performance indicatio=
n, to give an<br>
&gt; &gt; order of preference. That wouldn&#39;t tell you if it can or can&=
#39;t be animated, but<br>
&gt; &gt; when choosing between two LUTs to animate you could prefer the hi=
gher<br>
&gt; &gt; performance one.<br>
&gt; &gt; <br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; What I was left puzzled about after the XDC workshop is t=
hat is it<br>
&gt; &gt;&gt;&gt; possible to pre-load configurations in the background (sl=
ow), and then<br>
&gt; &gt;&gt;&gt; quickly switch between them? Hardware-wise I mean.<br>
&gt; &gt; <br>
&gt; &gt; This works fine for our &quot;fast&quot; LUTs, you just point the=
m to a surface in video<br>
&gt; &gt; memory and they flip to it. You could keep multiple surfaces arou=
nd and flip<br>
&gt; &gt; between them without having to reprogram them in software. We can=
 easily do that<br>
&gt; &gt; with enumerated curves, populating them when the driver initializ=
es instead of<br>
&gt; &gt; waiting for the client to request them. You can even point multip=
le hardware<br>
&gt; &gt; LUTs to the same video memory surface, if they need the same curv=
e.<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; We could define that pipelines with a lower ID are to be pref=
erred over<br>
&gt; &gt;&gt; higher IDs.<br>
&gt; &gt; <br>
&gt; &gt; Sure, but this isn&#39;t just an issue with a pipeline as a whole=
, but the<br>
&gt; &gt; individual elements within it and how to use them in a given cont=
ext.<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The issue is that if programming a pipeline becomes too slow =
to be<br>
&gt; &gt;&gt; useful it probably should just not be made available to user =
space.<br>
&gt; &gt; <br>
&gt; &gt; It&#39;s not that programming the pipeline is overall too slow. T=
he LUTs we have<br>
&gt; &gt; that are relatively slow to program are meant to be set infrequen=
tly, or even<br>
&gt; &gt; just once, to allow the scaler and tone mapping operator to opera=
te in fixed<br>
&gt; &gt; point PQ space. You might still want the tone mapper, so you woul=
d choose a<br>
&gt; &gt; pipeline that includes them, but when it comes to e.g. animating =
a night light,<br>
&gt; &gt; you would want to choose a different LUT for that purpose.<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The prepare-commit idea for blob properties would help to mak=
e the<br>
&gt; &gt;&gt; pipelines usable again, but until then it&#39;s probably a go=
od idea to just<br>
&gt; &gt;&gt; not expose those pipelines.<br>
&gt; &gt; <br>
&gt; &gt; The prepare-commit idea actually wouldn&#39;t work for these LUTs=
, because they are<br>
&gt; &gt; programmed using methods instead of pointing them to a surface. I=
&#39;m actually not<br>
&gt; &gt; sure how slow it actually is, would need to benchmark it. I think=
 not exposing<br>
&gt; &gt; them at all would be overkill, since it would mean you can&#39;t =
use the preblending<br>
&gt; &gt; scaler or tonemapper, and animation isn&#39;t necessary for that.=
<br>
&gt; &gt; <br>
&gt; &gt; The AMD 3DLUT is another example of a LUT that is slow to update,=
 and it would<br>
&gt; &gt; obviously be a major loss if that wasn&#39;t exposed. There just =
needs to be some<br>
&gt; &gt; way for clients to know if they are going to kill performance by =
trying to<br>
&gt; &gt; change it every frame.<br>
&gt; <br>
&gt; Might a first step be to require the ALLOW_MODESET flag to be set when=
 changing the values for a colorop which is too slow to be updated per refr=
esh cycle?<br>
&gt; <br>
&gt; This would tell the compositor: You can use this colorop, but you can&=
#39;t change its values on the fly.<br>
<br>
I argued before that changing any color op to passthrough should never<br>
require ALLOW_MODESET and while this is really hard to guarantee from a<br>
driver perspective I still believe that it&#39;s better to not expose any<b=
r>
feature requiring ALLOW_MODESET or taking too long to program to be<br>
useful for per-frame changes.<br>
<br>
When user space has ways to figure out if going back to a specific state<br=
>
(in this case setting everything to bypass) without ALLOW_MODESET we can<br=
>
revisit this decision, but until then, let&#39;s keep things simple and onl=
y<br>
expose things that work reliably without ALLOW_MODESET and fast enough<br>
to work for per-frame changes.<br></blockquote><div><br></div><div>Knowing =
an operation is fast enough for &quot;per-frame&quot; changes is by far not=
 enough. If programming a 3D lut takes 4 milliseconds for example, that req=
uires very different scheduling for atomic commits to hit the vblank deadli=
ne from when programming a 1D lut takes 100 microseconds. It&#39;s also dep=
endent on the refresh rate - that 4ms example would be per-frame on a 60Hz =
display, but not on a 300Hz display.</div><div><br></div><div>The only thin=
g that would be useful for me is to get an upper bound on how long programm=
ing a color pipeline and/or the individual elements takes (exposed in the A=
PI, or at the very least documented). Without something like that I would o=
nly ever program the pipelines on modesets because there&#39;s no strict ti=
ming requirements there.<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Harry, Pekka: Should we document this? It obviously restricts what can<br>
be exposed but exposing things that can&#39;t be used by user space isn&#39=
;t<br>
useful.<br>
<br>
&gt; <br>
&gt; -- <br>
&gt; Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"=
https://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redhat.com=
</a><br>
&gt; Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and Xwayland developer<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000ec78330608b127f3--
