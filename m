Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C637EA60429
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 23:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C9410E946;
	Thu, 13 Mar 2025 22:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QeQq86AS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6237110E946
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 22:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741904295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rylbSj7LxKwwNlFd2WfD/bX+zVn0DxywNvse8aNjhic=;
 b=QeQq86ASs6HI8XfTqLZwwsmkxhdBz739XQxq+TbODmRFvfBhBGLzviooEx2BuZsZCILHV3
 tcsj1EdBju4ACdtV1lFTi8UlhtwKK3GEwTxBALr8+k5INqB2+dqrKE3gA4vNlgdF4FkMU/
 38svUPv9YN9mHA+l0xBeHL9lXP44GuE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-kutfFvMgMe2EAUqHzPXBjw-1; Thu, 13 Mar 2025 18:18:11 -0400
X-MC-Unique: kutfFvMgMe2EAUqHzPXBjw-1
X-Mimecast-MFC-AGG-ID: kutfFvMgMe2EAUqHzPXBjw_1741904291
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6fef68ecc8eso22127537b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 15:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741904291; x=1742509091;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rylbSj7LxKwwNlFd2WfD/bX+zVn0DxywNvse8aNjhic=;
 b=M9s2gjVtzFfe2KxsvfNoVpcTb6UcVBQkfNI17PAXW/05jf1/dNliIg48r0W6YRI3ST
 q2xEAPmwCyuX2ohXtZgkOQl+KyAiddgITmiWKoEfSMtUSPangiyG9NobRuFUxtA0OS5D
 mjOVOruwBw55cxSrAotSAZ3boifR8wZ19kJ4DktAQLM4j2b3BxE6z8+RGRO5bohw1eta
 3jZzyXCyQs7DiNpEm91WJ8Y6EPjhH3d+phTus8zG0T+dGnrpCZ/XvqgwV0koIMgyE82p
 61a7LAOlUy9xaftDEUjJYLXMuapKXRYyQJJi5uZtt+y18+1pz0F2YylpO/Za8MQ5Y/rB
 LmQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkfNy/8Yr/8cdpCnHT4BuNPnwxKqPGGvDMwXjjIF5nd85xvm5UAcBx/vorw7KCFlOfkU3WTrj2V0g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwykOyfIi8+XOPsigDtVdlP8kVtSqi37nx2kEiOGiwzZuYB6i7G
 YqunJVdyxEbDqn3XaHTHvFLuHDxqUsY3uulrukHuP3sSDzcJDZYHhcag/QDeM9eTiv9rblzHlEX
 3qT1XC800xSPGBiw5B+7DgLxhrB4CDtOtcTHMLTRzXnnQU2uvO7O7LvlvU+k14qhlT5IZwVAK4/
 M3QiGie8oAuNdzPrpK2kfDagyxynGH8ZF7M2nSIXSn
X-Gm-Gg: ASbGncu8LV/lkQr4IrevaEJ6jd4gY/vchLKDA2E1lldurWZo0e3U8zPCdeuY9DJjcuc
 DEVulgRH6ioPyZb/7WAVxnVtPczyB0Xbj6yHGk//vXzEpO44BHG007h8Eg76s6lqe5rApGvI=
X-Received: by 2002:a05:690c:f88:b0:6f9:7f1c:5390 with SMTP id
 00721157ae682-6ff460c16a1mr1395457b3.26.1741904291391; 
 Thu, 13 Mar 2025 15:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEu1/IWbYpigSQ0yzDRY7t2L7I9MR7haOq1Sm1DuTsw5VNZYkkA2cESu0NmyIez3SXcoAS4BZWBPqphFU/LFc=
X-Received: by 2002:a05:690c:f88:b0:6f9:7f1c:5390 with SMTP id
 00721157ae682-6ff460c16a1mr1395207b3.26.1741904291125; Thu, 13 Mar 2025
 15:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
 <20250311-warm-icy-rottweiler-cefcdd@houat>
 <CAN9Xe3Qwu=E=VVZZ_8EHPF7Xsk6Zcbp=R_b=cRgF=9SWCkmsqA@mail.gmail.com>
 <CAD=FV=XdngrNhUn8jQ3FGitkBCkiQO1dXnPhCKj+S5Jo8_WUrQ@mail.gmail.com>
 <CAN9Xe3RQ_L5a+PbXCBbzpn3VxyWEL1_wqA5trY0h=Xj-YMcA1g@mail.gmail.com>
 <CAD=FV=WJDHAdDCD=Mhffawuz8U7=MkzDueXmAvKpJ-o5eOT6DQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WJDHAdDCD=Mhffawuz8U7=MkzDueXmAvKpJ-o5eOT6DQ@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Mar 2025 17:15:39 -0400
X-Gm-Features: AQ5f1JrZwGw8GJsC7mStUHLXBjUK6fDoIVEQ2lWzmEBxE2gcs3XE3x9ejl5auuw
Message-ID: <CAN9Xe3QRnNXqL+4RyZTXyiSxjVf7B3LT5KjiyUFB0xeBX2EQhQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/synaptics-r63353: Use _multi variants
To: Doug Anderson <dianders@chromium.org>
Cc: Maxime Ripard <mripard@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Michael Trimarchi <michael@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QN4c79FKxCfhY5uDJd0awebgvKajVLXYuaW4hOppu6U_1741904291
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000817813063040b25d"
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

--000000000000817813063040b25d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 8:22=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:

> Hi,
>
> On Wed, Mar 12, 2025 at 5:00=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.=
com>
> wrote:
> >
> >
> >
> > On Wed, Mar 12, 2025 at 11:48=E2=80=AFAM Doug Anderson <dianders@chromi=
um.org>
> wrote:
> >>
> >> Hi,
> >>
> >> On Wed, Mar 12, 2025 at 8:06=E2=80=AFAM Anusha Srivatsa <asrivats@redh=
at.com>
> wrote:
> >> >
> >> >> > @@ -106,53 +107,46 @@ static int r63353_panel_power_off(struct
> r63353_panel *rpanel)
> >> >> >  static int r63353_panel_activate(struct r63353_panel *rpanel)
> >> >> >  {
> >> >> >       struct mipi_dsi_device *dsi =3D rpanel->dsi;
> >> >> > -     struct device *dev =3D &dsi->dev;
> >> >> > -     int i, ret;
> >> >> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> >> >> > +     int i;
> >> >> >
> >> >> > -     ret =3D mipi_dsi_dcs_soft_reset(dsi);
> >> >> > -     if (ret < 0) {
> >> >> > -             dev_err(dev, "Failed to do Software Reset (%d)\n",
> ret);
> >> >> > +     mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
> >> >> > +     if (dsi_ctx.accum_err)
> >> >> >               goto fail;
> >> >> > -     }
> >> >>
> >> >> This changes was definitely not what the script is doing.
> >> >
> >> >
> >> > It isnt. Using coccinelle for the major part of pattern matching and
> replacing the newer _multi variant API. Some handling (including a newlin=
e
> that it introduces) and  the returns depend on a case by case basis, whic=
h
> had to be done manually.
> >>
> >> ...and now you're getting to see why I didn't think a coccinelle
> >> script could fully handle this task. ;-) IMO instead of trying to get
> >> a coccinelle script to do the full conversion, the right approach
> >> would be to use a coccinelle script (or equivalent) to get the basics
> >> done (just so you don't make any typos) and then cleanup the result
> >> manually. Spending more time on the coccinelle script than it would
> >> take to do the conversion manually is probably not the right approach.
> >>
> >> If your patch wasn't fully generated by a coccinelle script you should
> >> document that in the commit message. Something like "Initial patch was
> >> generated by a coccinelle script and the result was cleaned up
> >> manually." If the script is too long to fit in the commit message,
> >> it's fine to put it somewhere online and provide a link. "Somewhere
> >> online" could easily be a mailing list post.
> >>
> >
> > You know I have been thinking if it makes sense to have this script
> merged to coccinelle project and add those details in the commit log....
> Was having an offline discussion with  @Maxime Ripard today and he rightl=
y
> pointed out that since it is too specific, once all the conversions are
> done , the script  would not be further useable....
> > About having the script online and providing a link, something link a
> github link?
>
> That feels overkill. It seems like you could just send an email to
> LKML or dri-devel and then link it that way. It could be in reply to
> this thread or a totally separate email. lore.kernel.org links are
> great.
>
> I have been going back and forth on this for quite some time :(I have the
latest v3 on a branch with the changes and I used coccinelle for most of
it. I had to manually fix an extra newline that it introduced and manually
handle the reset before returning, rest all was script. That makes me want
to add it in the commit log unless it won't be accepted because it's too
long....

Anusha

Anusha

> -Doug
>
>

--000000000000817813063040b25d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 12,=
 2025 at 8:22=E2=80=AFPM Doug Anderson &lt;<a href=3D"mailto:dianders@chrom=
ium.org">dianders@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi,<br>
<br>
On Wed, Mar 12, 2025 at 5:00=E2=80=AFPM Anusha Srivatsa &lt;<a href=3D"mail=
to:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Mar 12, 2025 at 11:48=E2=80=AFAM Doug Anderson &lt;<a href=3D"=
mailto:dianders@chromium.org" target=3D"_blank">dianders@chromium.org</a>&g=
t; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Mar 12, 2025 at 8:06=E2=80=AFAM Anusha Srivatsa &lt;<a hre=
f=3D"mailto:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&=
gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; @@ -106,53 +107,46 @@ static int r63353_panel_power_=
off(struct r63353_panel *rpanel)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 static int r63353_panel_activate(struct r63353=
_panel *rpanel)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *ds=
i =3D rpanel-&gt;dsi;<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;dsi=
-&gt;dev;<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0int i, ret;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_multi_context d=
si_ctx =3D { .dsi =3D dsi };<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_soft_reset=
(dsi);<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev=
_err(dev, &quot;Failed to do Software Reset (%d)\n&quot;, ret);<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_soft_reset_multi(&=
amp;dsi_ctx);<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (dsi_ctx.accum_err)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0goto fail;<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; This changes was definitely not what the script is doing.=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It isnt. Using coccinelle for the major part of pattern match=
ing and replacing the newer _multi variant API. Some handling (including a =
newline that it introduces) and=C2=A0 the returns depend on a case by case =
basis, which had to be done manually.<br>
&gt;&gt;<br>
&gt;&gt; ...and now you&#39;re getting to see why I didn&#39;t think a cocc=
inelle<br>
&gt;&gt; script could fully handle this task. ;-) IMO instead of trying to =
get<br>
&gt;&gt; a coccinelle script to do the full conversion, the right approach<=
br>
&gt;&gt; would be to use a coccinelle script (or equivalent) to get the bas=
ics<br>
&gt;&gt; done (just so you don&#39;t make any typos) and then cleanup the r=
esult<br>
&gt;&gt; manually. Spending more time on the coccinelle script than it woul=
d<br>
&gt;&gt; take to do the conversion manually is probably not the right appro=
ach.<br>
&gt;&gt;<br>
&gt;&gt; If your patch wasn&#39;t fully generated by a coccinelle script yo=
u should<br>
&gt;&gt; document that in the commit message. Something like &quot;Initial =
patch was<br>
&gt;&gt; generated by a coccinelle script and the result was cleaned up<br>
&gt;&gt; manually.&quot; If the script is too long to fit in the commit mes=
sage,<br>
&gt;&gt; it&#39;s fine to put it somewhere online and provide a link. &quot=
;Somewhere<br>
&gt;&gt; online&quot; could easily be a mailing list post.<br>
&gt;&gt;<br>
&gt;<br>
&gt; You know I have been thinking if it makes sense to have this script me=
rged to coccinelle project and add those details in the commit log.... Was =
having an offline discussion with=C2=A0 @Maxime Ripard today and he rightly=
 pointed out that since it is too specific, once all the conversions are do=
ne , the script=C2=A0 would not be further useable....<br>
&gt; About having the script online and providing a link, something link a =
github link?<br>
<br>
That feels overkill. It seems like you could just send an email to<br>
LKML or dri-devel and then link it that way. It could be in reply to<br>
this thread or a totally separate email. <a href=3D"http://lore.kernel.org"=
 rel=3D"noreferrer" target=3D"_blank">lore.kernel.org</a> links are<br>
great.<br>
<br></blockquote><div>I have been going back and forth on this for quite so=
me time=C2=A0:(I have the latest v3 on a branch with the changes and I used=
 coccinelle for most of it. I had to manually fix an extra newline that it =
introduced and manually handle the reset before returning, rest all was scr=
ipt. That makes me want to add it in the commit log unless it won&#39;t be =
accepted because it&#39;s too long....=C2=A0</div><div><br></div><div>Anush=
a</div><div><br></div><div>Anusha</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
-Doug<br>
<br>
</blockquote></div></div>

--000000000000817813063040b25d--

