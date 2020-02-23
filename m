Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B050E16A1E8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB086E277;
	Mon, 24 Feb 2020 09:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789166E119
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 04:26:49 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id s7so2805509qvn.8
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 20:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R56Rf48q5Cm2K2QbyEehQf7Vk6GOJ+mSqcHJaCfyuxU=;
 b=mAJqnpMliZId5w602WNu9WRoJdIbxj78MvJBEyHyjSQZRGwAdS1BbuBpjlrqXQ3dlO
 gJDVYS+E5pjtsQyzDUJcoZ62nooCAcdMmPoKhXCt+eBv2RuSYXwj+Kjy4e+lVPNgZYx9
 wffZCaiC4H7R13CVtfKGmfclEWSulfxtHany6XrCTjZy4UdhU9suVofsj1wbdBOqWuj4
 O2gFAGw9fSK49LRzfAGQGO7ZT+EHhVFRY4sFVhvPqOlwwAwfJqjRGAlr01odsW2MoXZQ
 x5AoQpVZsiX4+bAZqcONNdSBd6CoDSFn0WSLc345tHvBiV398iOP1enCMi1MpMCcPDIz
 a2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R56Rf48q5Cm2K2QbyEehQf7Vk6GOJ+mSqcHJaCfyuxU=;
 b=CNqi1GF4ifEtNPl60mFwN/OqB0b5K6GhjbIiqRckps5AnGv+pAWSHbqHqDsRVFiaVv
 ozpPS1KghwT2SzvOHiwN5vze1lGnVkbO/bjPAKlzDOV/H6g6i1jx4r/7DT0+cPYPb/ui
 mlcTPld2SUJIw3G6SsbSjnkoNa/8d7FLfmgMpvJnNSM5RGKviK0O/ndfUaPvHswKoShg
 RPzjYqE4NKEQk7wM7kv2Cr0we2tpFXiF9uaZ6b16w6uLirADA7yoJPnqi5/IoEA2ooUF
 gNwIut1W6wFWn7km5c2BuNG3v+ptIzrlQGkwdzB5QQIoKzFDBb0g2r2ZHu8932cCQa0/
 VjFA==
X-Gm-Message-State: APjAAAVIh8Lhn3MIYcwsk30v1KVLr8bfaIENLPYVlVcotMZi9RrmtghJ
 C1PyVJgwVivd9o26rf1D+FwopMs61Q7YauZvbaM=
X-Google-Smtp-Source: APXvYqwSz6jzQ4RBlLxVw6JUaXR/hH59Sl9jpo+NKJUF2963iCbWTkCVjUzFogwLKzjRy23YS+1QPc3ykOqbI5E8Ulk=
X-Received: by 2002:a0c:ee91:: with SMTP id u17mr36138565qvr.22.1582432008417; 
 Sat, 22 Feb 2020 20:26:48 -0800 (PST)
MIME-Version: 1.0
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
 <20200221213652.GD3456@ravnborg.org>
 <CAFPSGXacMKTPrxk_FOrwrvH_XfmO3dYCCa_GoPCe_HUfQFPHtw@mail.gmail.com>
 <20200222212713.GA30872@ravnborg.org>
In-Reply-To: <20200222212713.GA30872@ravnborg.org>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Sun, 23 Feb 2020 12:26:36 +0800
Message-ID: <CAFPSGXZWC7dASrVP3MTWS+oJjcwQEK0T+BLiwZ-cxk2OyeNZQw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/6] drm/sprd: add Unisoc's drm kms master
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: mark.rutland@arm.com, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, robh+dt@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============0821561339=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0821561339==
Content-Type: multipart/alternative; boundary="000000000000be3605059f36a9c2"

--000000000000be3605059f36a9c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2020 at 5:27 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Kevin/tang.
>
> Thanks for the quick and detailed feedback.
> Your questions are addressed below.
>
>         Sam
>
>
> > > > +static int sprd_drm_bind(struct device *dev)
> > > > +{
> > > > +     struct drm_device *drm;
> > > > +     struct sprd_drm *sprd;
> > > > +     int err;
> > > > +
> > > > +     drm =3D drm_dev_alloc(&sprd_drm_drv, dev);
> > > > +     if (IS_ERR(drm))
> > > > +             return PTR_ERR(drm);
> > > You should embed drm_device in struct sprd_drm.
> > > See example code in drm/drm_drv.c
> > >
> > > This is what modern drm drivers do.
> > >
> > > I *think* you can drop the component framework if you do this.
> > >
> > I have read it(drm/drm_drv.c) carefully, if drop the component framewor=
k,
> > the whole our drm driver maybe need to redesign, so i still want to kee=
p
> > current design.
> OK, fine.
>
> > > > +     sprd_drm_mode_config_init(drm);
> > > > +
> > > > +     /* bind and init sub drivers */
> > > > +     err =3D component_bind_all(drm->dev, drm);
> > > > +     if (err) {
> > > > +             DRM_ERROR("failed to bind all component.\n");
> > > > +             goto err_dc_cleanup;
> > > > +     }
> > > When you have a drm_device - which you do here.
> > > Then please use drm_err() and friends for error messages.
> > > Please verify all uses of DRM_XXX
> > >
> >   modern drm drivers need drm_xxx to replace DRM_XXX?
> Yes, use of DRM_XXX is deprecated - when you have a drm_device.
>
> > >
> > > > +     /* with irq_enabled =3D true, we can use the vblank feature. =
*/
> > > > +     drm->irq_enabled =3D true;
> > > I cannot see any irq being installed. This looks wrong.
> > >
> > Our display controller isr is been register on crtc driver(sprd_dpu.c),
> not
> > here.
>
> I think you just need to move this to next patch and then it is fine.
>
Here is the advice given by Thomas Zimmermann, similar to the advice you
gave.
I have given thomas feedback about my questions, maybe thomas didn't see my
email, so there is no reply.

But I've always been confused, because irq is initialized in drm driver for
other guys, why not for me?
Can you help to tell the reason in detail, looking forward to your answers.

Thomas's suggestion=EF=BC=9A
---------------------------------------------------------------------------=
----------------
This line indicates the problem's design. The irq is initialized in the
sub-device code, but the device state is set here. Instead both should
be set in the same place.

> +
> +     /* reset all the states of crtc/plane/encoder/connector */
> +     drm_mode_config_reset(drm);
> +
> +     /* init kms poll for handling hpd */
> +     drm_kms_helper_poll_init(drm);

Most of this function's code should be moved into the sub-device bind
function.

Here, maybe do:

 * allocate device structures
 * call component_bind_all()
 * on success, register device

The sub-device function should then do

 * init modesetting, crtc, planes, etc.
 * do drm_mode_config_reset()
 * init vblanking
 * init the irq
 * do drm_kms_helper_poll_init()

roughtly in that order. It makes sense to call drm_vblank_init() after
drm_mode_config_reset(), as vblanking uses some of the mode-config fields.
---------------------------------------------------------------------------=
---------------------------

>
>         Sam
>
>

--000000000000be3605059f36a9c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 23, 2020 at 5:27 AM Sam R=
avnborg &lt;<a href=3D"mailto:sam@ravnborg.org" target=3D"_blank">sam@ravnb=
org.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hi Kevin/tang.<br>
<br>
Thanks for the quick and detailed feedback.<br>
Your questions are addressed below.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
<br>
<br>
&gt; &gt; &gt; +static int sprd_drm_bind(struct device *dev)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_drm *sprd;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0drm =3D drm_dev_alloc(&amp;sprd_drm_drv=
, dev);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(drm))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_=
ERR(drm);<br>
&gt; &gt; You should embed drm_device in struct sprd_drm.<br>
&gt; &gt; See example code in drm/drm_drv.c<br>
&gt; &gt;<br>
&gt; &gt; This is what modern drm drivers do.<br>
&gt; &gt;<br>
&gt; &gt; I *think* you can drop the component framework if you do this.<br=
>
&gt; &gt;<br>
&gt; I have read it(drm/drm_drv.c) carefully, if drop the component framewo=
rk,<br>
&gt; the whole our drm driver maybe need to redesign, so i still want to ke=
ep<br>
&gt; current design.<br>
OK, fine.<br>
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0sprd_drm_mode_config_init(drm);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* bind and init sub drivers */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0err =3D component_bind_all(drm-&gt;dev,=
 drm);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&=
quot;failed to bind all component.\n&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_dc=
_cleanup;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; When you have a drm_device - which you do here.<br>
&gt; &gt; Then please use drm_err() and friends for error messages.<br>
&gt; &gt; Please verify all uses of DRM_XXX<br>
&gt; &gt;<br>
&gt;=C2=A0 =C2=A0modern drm drivers need drm_xxx to replace DRM_XXX?<br>
Yes, use of DRM_XXX is deprecated - when you have a drm_device.<br>
<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* with irq_enabled =3D true, we can us=
e the vblank feature. */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;irq_enabled =3D true;<br>
&gt; &gt; I cannot see any irq being installed. This looks wrong.<br>
&gt; &gt;<br>
&gt; Our display controller isr is been register on crtc driver(sprd_dpu.c)=
, not<br>
&gt; here.<br>
<br>
I think you just need to move this to next patch and then it is fine.<br></=
blockquote><div>Here is the advice given by Thomas Zimmermann, similar to t=
he advice you gave.</div><div>I have given thomas feedback about my questio=
ns, maybe thomas didn&#39;t see my email, so there is no reply.<br></div><d=
iv><br></div><div>But I&#39;ve always been confused, because irq is initial=
ized

 in drm driver for other guys, why not for me?<br></div><div>Can you help t=
o tell the reason in detail, looking forward to your answers.<br></div><div=
><br></div><div>Thomas&#39;s suggestion=EF=BC=9A<br></div><div>------------=
---------------------------------------------------------------------------=
----</div><table cellpadding=3D"0" class=3D"gmail-cf gmail-gJ" style=3D"bor=
der-collapse:collapse;margin-top:0px;width:auto;font-family:Roboto,RobotoDr=
aft,Helvetica,Arial,sans-serif;font-size:0.875rem;letter-spacing:0.2px;disp=
lay:block"></table>This line indicates the problem&#39;s design. The irq is=
 initialized in the<br>sub-device code, but the device state is set here. I=
nstead both should<br>be set in the same place.<span style=3D"color:rgb(80,=
0,80)"><br><br>&gt; +<br>&gt; +=C2=A0 =C2=A0 =C2=A0/* reset all the states =
of crtc/plane/encoder/connector */<br>&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_co=
nfig_reset(drm);<br>&gt; +<br>&gt; +=C2=A0 =C2=A0 =C2=A0/* init kms poll fo=
r handling hpd */<br>&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_init(drm=
);<br><br></span>Most of this function&#39;s code should be moved into the =
sub-device bind<br>function.<br><br>Here, maybe do:<br><br>=C2=A0* allocate=
 device structures<br>=C2=A0* call component_bind_all()<br>=C2=A0* on succe=
ss, register device<br><br>The sub-device function should then do<br><br>=
=C2=A0* init modesetting, crtc, planes, etc.<br>=C2=A0* do drm_mode_config_=
reset()<br>=C2=A0* init vblanking<br>=C2=A0* init the irq<br>=C2=A0* do drm=
_kms_helper_poll_init()<br><br>roughtly in that order. It makes sense to ca=
ll drm_vblank_init() after<br><div>drm_mode_config_reset(), as vblanking us=
es some of the mode-config fields.=C2=A0</div><div>------------------------=
---------------------------------------------------------------------------=
---</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
<br>
</blockquote></div></div>

--000000000000be3605059f36a9c2--

--===============0821561339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0821561339==--
