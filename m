Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91601ABA4D5
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 22:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E8210EB8D;
	Fri, 16 May 2025 20:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SzRsmzTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F24A10EB8D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 20:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747428400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/d2H/dJ+ueHGN57q+kr0/dTSql3iOudtgpvop490dy0=;
 b=SzRsmzTuf0aU9zoQcJKqUTY9LcjJTBto3Cz+vQKv5MJE6/GMd7/Cze5KCiHxoL3L/xmJJV
 5+eAJoZ37ioHji4Rm7uAekcE8hzbqIWusqNPz7WNEfqvqW4fRYihU9Ab5EzehFjsAPzWXu
 0LEIb8Nx3ymcD5D01SY5WGZyjqdfspM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-E1uaqHgWPbeJtKQ0PEUeDQ-1; Fri, 16 May 2025 16:46:38 -0400
X-MC-Unique: E1uaqHgWPbeJtKQ0PEUeDQ-1
X-Mimecast-MFC-AGG-ID: E1uaqHgWPbeJtKQ0PEUeDQ_1747428398
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-e7b5b9174d2so3173402276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 13:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747428398; x=1748033198;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/d2H/dJ+ueHGN57q+kr0/dTSql3iOudtgpvop490dy0=;
 b=VzJNnhVed3gHddL7+fcTUNl1xiPjoSdTM01tSrdsC+hjlF9hFzllECWymnHIbGH0ld
 UkAmpIQRq26rLaatUBwRvyV/AtPJLcPDyHHXsoWG/CDEhyUfaelAkOril0ZAtoIUyBzd
 dPJ1XmqtX4GHASc8eZuNtJzqYHYCRuloi63CasDGi+DuMrRjwH0YrLSz2UNygYfXQ62T
 +EL2qf8chz3AL9s1n2rGYYrz1pyZc+hbitU+ApkUsWr6c0Pnt54Pji4CbzPy4+tr7E3k
 2/dZa9DWwxyooUQFlDKkfHrW8Q0hS37OgmKLtLPWMT+Gnd2yb/Jymb06mnCnMB7Et907
 T0Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJoSfQTHvRTs1G5IoVF2/MlDzZudn5uMjyxoASUyN1fxWG4ggP/9SJpcMziDDri0l/q19bp4GGtP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBmb78FZJiKn0vqT1K3aqsTRzarsgRNBKlxjz8KRfNHvjEwgIL
 y4wNmdqxMtKWj/NiRxPvKk/Y3jeAXB0rTfinCo7b2/jmV4SeCJy3teXPYYPqtS2PqPVcq8yYZi8
 DenLz+/wsWW15I7uKV95A+RUyq0caYjmla+Tu9dXBN1lc4s3QqS4d1sEbpFsNTfEvtcfHxC+vPt
 OVmNFWxyORHaaLQye+rkkvqC55SyhxH5ecUlTakULrclB6
X-Gm-Gg: ASbGncsrMoYV/+BtJ6CqXZctlf8cx5TuhlQQR12dGbEF+WY5h7A6sHAX+R2ykAKERLh
 rUOBJGJgtB6ONEuiwxnyaXxMaQgdwwL75hYNGV77VhcMhSRlnfCYIRu21Y2TLTAVhSdY=
X-Received: by 2002:a05:6902:990:b0:e75:b6c9:fc2c with SMTP id
 3f1490d57ef6-e7b69d546eemr7092184276.8.1747428398168; 
 Fri, 16 May 2025 13:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4gNvjNDTzMJO7YNUxc1L5p7z3ng2k7lx6Vn/OJ3/oi8DTA+Q1nD5K3QvExW4Yxww+vk7Cq2ZxGo7HtzXL6PU=
X-Received: by 2002:a05:6902:990:b0:e75:b6c9:fc2c with SMTP id
 3f1490d57ef6-e7b69d546eemr7092162276.8.1747428397889; Fri, 16 May 2025
 13:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com> <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com> <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com>
In-Reply-To: <875xi3im1r.fsf@intel.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 16 May 2025 15:43:10 -0400
X-Gm-Features: AX0GCFtr0WkuOHdpE1CNg84eR4hlSm7n8yb0dbHhxcO2BOYdxEs1te_AN3GgLks
Message-ID: <CAN9Xe3QHqPDPUQ7gsf278Nj0GC1fO-sGxoW3Ln4=h52QUM804g@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 "uma.shankar@intel.com" <uma.shankar@intel.com>, ville.syrjala@linux.intel.com
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YqjcRsuw_lzAur85r4FVU-3hUBcf0_R6a_uMdk3yh20_1747428398
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ed51cd063546e05e"
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

--000000000000ed51cd063546e05e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 5:22=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com>
wrote:

> On Tue, 13 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > Is it really surprising you get some pushback when you are using a
> > design that is the complete opposite to what every user of it for the
> > last decade has been doing?
>
> The opposite is also true.
>
> If you create a design that does not cleanly fit the model of the
> biggest drivers in the subsystem, and expect massive refactors just for
> the sake of conforming to the design to be able to use any of it, you'll
> also get pushback.
>
> > This one is usable, but you rule out the way you could use it.
>
> I think you're off-hand and completely dismissing the amount of work it
> would be. And still I'm not even ruling it out, but there has to be a
> way to start off in small incremental steps, and use the parts that
> work. And it's not like we're averse to refactoring in the least,
> everyone knows that.
>
> > I guess it's clear now that you won't consider anything else. I wonder
> > why you started that discussion in the first place if you already have
> > a clear mind on how to get things moving forward.
>
> I pointed out what I think is a bug in drm_panel, with nothing but good
> intentions, and everything snowballed from there.
>
> There has to be a middle ground instead of absolutes. Otherwise we'll
> just end up in deeper silos. And more arguments.
>
> BR,
> Jani.
>
>
Jani, Maxime,

Thinking out loud of different solutions we can have to make sure we take
this forward.

Is it possible to have a variant of drm_panel_follower for the non ARM
devices? That way if at any point in
the future, the drm_panel_follower infrastructure has to be used, the
refcounting allocation can be bypassed?

Adding Uma and VIlle to the thread here.

Thanks!
Anusha


> --
> Jani Nikula, Intel
>
>

--000000000000ed51cd063546e05e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 14,=
 2025 at 5:22=E2=80=AFAM Jani Nikula &lt;<a href=3D"mailto:jani.nikula@linu=
x.intel.com">jani.nikula@linux.intel.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Tue, 13 May 2025, Maxime Ripard =
&lt;<a href=3D"mailto:mripard@kernel.org" target=3D"_blank">mripard@kernel.=
org</a>&gt; wrote:<br>
&gt; Is it really surprising you get some pushback when you are using a<br>
&gt; design that is the complete opposite to what every user of it for the<=
br>
&gt; last decade has been doing?<br>
<br>
The opposite is also true.<br>
<br>
If you create a design that does not cleanly fit the model of the<br>
biggest drivers in the subsystem, and expect massive refactors just for<br>
the sake of conforming to the design to be able to use any of it, you&#39;l=
l<br>
also get pushback.<br>
<br>
&gt; This one is usable, but you rule out the way you could use it.<br>
<br>
I think you&#39;re off-hand and completely dismissing the amount of work it=
<br>
would be. And still I&#39;m not even ruling it out, but there has to be a<b=
r>
way to start off in small incremental steps, and use the parts that<br>
work. And it&#39;s not like we&#39;re averse to refactoring in the least,<b=
r>
everyone knows that.<br>
<br>
&gt; I guess it&#39;s clear now that you won&#39;t consider anything else. =
I wonder<br>
&gt; why you started that discussion in the first place if you already have=
<br>
&gt; a clear mind on how to get things moving forward.<br>
<br>
I pointed out what I think is a bug in drm_panel, with nothing but good<br>
intentions, and everything snowballed from there.<br>
<br>
There has to be a middle ground instead of absolutes. Otherwise we&#39;ll<b=
r>
just end up in deeper silos. And more arguments.<br>
<br>
BR,<br>
Jani.<br>
<br></blockquote><div><br></div><div>Jani, Maxime,</div><div><br></div><div=
>Thinking out loud of different solutions we can have to make sure we take =
this forward.</div><div><br></div><div>Is it possible to have a variant of =
drm_panel_follower for the non ARM devices? That way if at any point in</di=
v><div>the future, the drm_panel_follower infrastructure has to be used, th=
e refcounting allocation can be bypassed?</div><div><br></div><div>Adding U=
ma and VIlle to the thread here.</div><div><br></div><div>Thanks!</div><div=
>Anusha</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
-- <br>
Jani Nikula, Intel<br>
<br>
</blockquote></div></div>

--000000000000ed51cd063546e05e--

