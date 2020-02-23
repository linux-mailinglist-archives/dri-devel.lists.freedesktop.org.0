Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995AA16A1EA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADF36E264;
	Mon, 24 Feb 2020 09:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB9D6E122
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 04:58:13 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id f3so2936231qkh.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 20:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YnV/FA8HNUkPkZdzB79ppVXlvMtxsbJcmyFz5lyAnbw=;
 b=H+TCmSc+0XQ7bx/9eMHFjbn+3zpW3qH1ZDpzNLLVdFZU25SphBmAfad7nlAEO/gUZ4
 3BtQbMQEO/RReuKh2m9hqGC4fA435nmF53MCcldLh4L2HTNgqh9mpYq6wNlKDo2nZ1xg
 sSeNq6RvODPpjgZ3vEeh0XlyPP8zHxdrzqnsCpBb8NkOHeaR/UKgtDSH5SnpZ+mvfzCO
 drvgt1B5Rme1wgUQ0Jom48w0j37ZJ6JfUo+uT99UT1656lYx4aMz424ZfpYkWl9V9l2k
 VHTJV4xq+1IUUVmaje2VpsnA2fRdFDQvfKFkOhKt5HBjddbsGG2zQvJnhL3594J5yMwT
 r55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YnV/FA8HNUkPkZdzB79ppVXlvMtxsbJcmyFz5lyAnbw=;
 b=stv225T/sA7txCLELn9AgiSoZa2fnX9pETEmzLLzKMQX3U/i05dz1g4j0OUwkdh/ED
 H1rQdcWJ5Pc/FG/qK9WLyCuqYJ++rS5RmGVQTBpFe4Hp3X5z7qNJHH7ZLOArdnK6AGo0
 RnYoeid9/8RYC+YEzW0iBMDxKO/LOBzrNTD7c08Lj4SKOvSEd33k9ocrOMmk6qc+LFeA
 QrPi3dDAfmS4olOxQyNV5KHn2yQMmTpdxO2uBb7AyyWD2qtGBjNsPTBIk5yDjpy1knE7
 nwUXZGREmOPWhJyEaGUaJaBdSdRC3QKwgU61R1Pmtmfiy6iwEbTd3oD3gTg6QcpAFp2q
 KWtw==
X-Gm-Message-State: APjAAAUGSVFm7+BYxAGCmhACTEVnmIBHZ7Co6B1cqqY3GDx8FUywjdmD
 8jqPOIYiZ5uPF5C3lBzl3nW6oa6NYRxaJgovS18=
X-Google-Smtp-Source: APXvYqz6dXpckMWsET0LetyBPrm4C+B8t1ebYGTPQf7zG5zBO2aND1jewBEsg9xJIAxNxWnack1+RRoPwYsIsfRWZTQ=
X-Received: by 2002:a05:620a:b89:: with SMTP id
 k9mr42619934qkh.185.1582433892983; 
 Sat, 22 Feb 2020 20:58:12 -0800 (PST)
MIME-Version: 1.0
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
 <20200221213652.GD3456@ravnborg.org>
 <CAFPSGXacMKTPrxk_FOrwrvH_XfmO3dYCCa_GoPCe_HUfQFPHtw@mail.gmail.com>
 <20200222212713.GA30872@ravnborg.org>
 <CAFPSGXZWC7dASrVP3MTWS+oJjcwQEK0T+BLiwZ-cxk2OyeNZQw@mail.gmail.com>
In-Reply-To: <CAFPSGXZWC7dASrVP3MTWS+oJjcwQEK0T+BLiwZ-cxk2OyeNZQw@mail.gmail.com>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Sun, 23 Feb 2020 12:58:01 +0800
Message-ID: <CAFPSGXZ4pRZ5gbRYyenO6fB1wUm_R043jjtoQzT9zxSG9dyr4w@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1108202466=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1108202466==
Content-Type: multipart/alternative; boundary="0000000000001268f4059f371a51"

--0000000000001268f4059f371a51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2020 at 12:26 PM tang pengchuan <kevin3.tang@gmail.com>
wrote:

>
>
> On Sun, Feb 23, 2020 at 5:27 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
>> Hi Kevin/tang.
>>
>> Thanks for the quick and detailed feedback.
>> Your questions are addressed below.
>>
>>         Sam
>>
>>
>> > > > +static int sprd_drm_bind(struct device *dev)
>> > > > +{
>> > > > +     struct drm_device *drm;
>> > > > +     struct sprd_drm *sprd;
>> > > > +     int err;
>> > > > +
>> > > > +     drm =3D drm_dev_alloc(&sprd_drm_drv, dev);
>> > > > +     if (IS_ERR(drm))
>> > > > +             return PTR_ERR(drm);
>> > > You should embed drm_device in struct sprd_drm.
>> > > See example code in drm/drm_drv.c
>> > >
>> > > This is what modern drm drivers do.
>> > >
>> > > I *think* you can drop the component framework if you do this.
>> > >
>> > I have read it(drm/drm_drv.c) carefully, if drop the component
>> framework,
>> > the whole our drm driver maybe need to redesign, so i still want to ke=
ep
>> > current design.
>> OK, fine.
>>
>> > > > +     sprd_drm_mode_config_init(drm);
>> > > > +
>> > > > +     /* bind and init sub drivers */
>> > > > +     err =3D component_bind_all(drm->dev, drm);
>> > > > +     if (err) {
>> > > > +             DRM_ERROR("failed to bind all component.\n");
>> > > > +             goto err_dc_cleanup;
>> > > > +     }
>> > > When you have a drm_device - which you do here.
>> > > Then please use drm_err() and friends for error messages.
>> > > Please verify all uses of DRM_XXX
>> > >
>> >   modern drm drivers need drm_xxx to replace DRM_XXX?
>> Yes, use of DRM_XXX is deprecated - when you have a drm_device.
>>
>> > >
>> > > > +     /* with irq_enabled =3D true, we can use the vblank feature.=
 */
>> > > > +     drm->irq_enabled =3D true;
>> > > I cannot see any irq being installed. This looks wrong.
>> > >
>> > Our display controller isr is been register on crtc driver(sprd_dpu.c)=
,
>> not
>> > here.
>>
>> I think you just need to move this to next patch and then it is fine.
>>
> Here is the advice given by Thomas Zimmermann, similar to the advice you
> gave.
> I have given thomas feedback about my questions, maybe thomas didn't see
> my email, so there is no reply.
>
> But I've always been confused, because irq is initialized in drm driver
> for other guys, why not for me?
> Can you help to tell the reason in detail, looking forward to your answer=
s.
>
But I've always been confused, because the irq is initialized in the
sub-device code, but the device state is set by drm_drv.
Everyone else seems to do like this. why can't for me?

Can you help to tell the reason in detail, looking forward to your answers.

BR

>
> Thomas's suggestion=EF=BC=9A
>
> -------------------------------------------------------------------------=
------------------
> This line indicates the problem's design. The irq is initialized in the
> sub-device code, but the device state is set here. Instead both should
> be set in the same place.
>
> > +
> > +     /* reset all the states of crtc/plane/encoder/connector */
> > +     drm_mode_config_reset(drm);
> > +
> > +     /* init kms poll for handling hpd */
> > +     drm_kms_helper_poll_init(drm);
>
> Most of this function's code should be moved into the sub-device bind
> function.
>
> Here, maybe do:
>
>  * allocate device structures
>  * call component_bind_all()
>  * on success, register device
>
> The sub-device function should then do
>
>  * init modesetting, crtc, planes, etc.
>  * do drm_mode_config_reset()
>  * init vblanking
>  * init the irq
>  * do drm_kms_helper_poll_init()
>
> roughtly in that order. It makes sense to call drm_vblank_init() after
> drm_mode_config_reset(), as vblanking uses some of the mode-config fields=
.
>
> -------------------------------------------------------------------------=
-----------------------------
>
>>
>>         Sam
>>
>>

--0000000000001268f4059f371a51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, Feb 23, 2020 at 12:26 PM tang pengchuan &lt;<a href=3D"mailt=
o:kevin3.tang@gmail.com" target=3D"_blank">kevin3.tang@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sun, Feb 23, 2020 at 5:27 AM Sam Ravnborg &lt=
;<a href=3D"mailto:sam@ravnborg.org" target=3D"_blank">sam@ravnborg.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi K=
evin/tang.<br>
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
o tell the reason in detail, looking forward to your answers.<br></div></di=
v></div></blockquote><div>But I&#39;ve always been confused, because the=C2=
=A0irq is initialized in the<br></div><div>sub-device code, but the device =
state is set by drm_drv.</div><div>Everyone else seems to do like this. why=
 can&#39;t for me?</div><div><br></div><div>Can you help to tell the reason=
 in detail, looking forward to your answers.=C2=A0</div><div><br></div><div=
>BR</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_quote"><div></div><div><br></div><div>Thomas&#39;s sug=
gestion=EF=BC=9A<br></div><div>--------------------------------------------=
-----------------------------------------------</div><table cellpadding=3D"=
0" style=3D"border-collapse:collapse;margin-top:0px;width:auto;font-family:=
Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:0.875rem;letter-spa=
cing:0.2px;display:block"></table>This line indicates the problem&#39;s des=
ign. The irq is initialized in the<br>sub-device code, but the device state=
 is set here. Instead both should<br>be set in the same place.<span style=
=3D"color:rgb(80,0,80)"><br><br>&gt; +<br>&gt; +=C2=A0 =C2=A0 =C2=A0/* rese=
t all the states of crtc/plane/encoder/connector */<br>&gt; +=C2=A0 =C2=A0 =
=C2=A0drm_mode_config_reset(drm);<br>&gt; +<br>&gt; +=C2=A0 =C2=A0 =C2=A0/*=
 init kms poll for handling hpd */<br>&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_hel=
per_poll_init(drm);<br><br></span>Most of this function&#39;s code should b=
e moved into the sub-device bind<br>function.<br><br>Here, maybe do:<br><br=
>=C2=A0* allocate device structures<br>=C2=A0* call component_bind_all()<br=
>=C2=A0* on success, register device<br><br>The sub-device function should =
then do<br><br>=C2=A0* init modesetting, crtc, planes, etc.<br>=C2=A0* do d=
rm_mode_config_reset()<br>=C2=A0* init vblanking<br>=C2=A0* init the irq<br=
>=C2=A0* do drm_kms_helper_poll_init()<br><br>roughtly in that order. It ma=
kes sense to call drm_vblank_init() after<br><div>drm_mode_config_reset(), =
as vblanking uses some of the mode-config fields.=C2=A0</div><div>---------=
---------------------------------------------------------------------------=
------------------</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
<br>
</blockquote></div></div>
</blockquote></div></div>
</div>

--0000000000001268f4059f371a51--

--===============1108202466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1108202466==--
