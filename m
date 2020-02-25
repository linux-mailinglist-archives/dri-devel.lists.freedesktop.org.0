Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EED16F8FB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244AD6E157;
	Wed, 26 Feb 2020 08:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AC16E3FB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:46:04 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id n17so8639750qtv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 01:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+ZOYTl1ogNLtu9r2ky+pCwTpSLJ8EddWUUdTKyOqiY=;
 b=TooGsvLjn83PWL2lz7NOlirgouznieinqb4Im7pfgccHb+0nWz4wWvNqMlIAYh4feA
 38xyFocMUd8cbJhQ9zDRCCoUH2e577o5qntr5ctxoMW5rGK8/eWJwk3j5ntUrriiCL/F
 YR9CVIT50ltwn+dNZ9ZVrHwy96TsqheKoQm6d4QGRsRXnV8Eu4x+wnrJAwrIGZDdAlPA
 nagCa/5y70ByNDXevkU1Hg4bkp2qou3QdUnKv8OP6f+iT0XgudqflWDACQ3/4TV46T7y
 l/NfTPd7oI66eLOvote1XRy8c1JKsAwumK0QGOtDc9zanlaMVRDVnefydzTDXquZI6Hn
 Jsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+ZOYTl1ogNLtu9r2ky+pCwTpSLJ8EddWUUdTKyOqiY=;
 b=Gj2D8iU9AJL+cPoEPQyJ8xBRJzgBIUjOA8jZtjDYN1oBCwG/lC1G9cUA8+KPlzyu9b
 jcoxlcj8IXZTMF9ZfYU/ECU7rIPLkWIZYlpCvNBFwzmrlSDeBm8JIRL+gC4R9Mw8xdsN
 iDRUZutZ8NeC+WA7ykDofB55zq9Mbj9TPINt34QV8Tlx/Fz8CoLpFNHEFRebMjXy2LGO
 ZStJefqDueBCxejqWKlY4R+13FiXM2awwJZnnXlhWxkJUr2rvSBu6pVHaYpIwz+V/tpV
 Hzh3n/sghFtKbpd4DA3Yul+TolVkHgiSrRXmx+qWGCohzq7mK3sghNa+/DrFuCaAUNFT
 hVCQ==
X-Gm-Message-State: APjAAAVzPOAgCLQqku/WMQR93xace+0ZIw9n9wIkne9+ojgGszX5Q07R
 6lKvhjF/x1jlq40L4Xk7n1Dk3YypKduBxhUA9QU=
X-Google-Smtp-Source: APXvYqz38EQpsmdUVhc39ucTNO0IHRTedizpCAHCL1cZYKLnhMJXPhx5hmeSOhFN4vwLMf2rVXSy11F8OaMUQzGMpU8=
X-Received: by 2002:ac8:488b:: with SMTP id i11mr52105080qtq.209.1582623963553; 
 Tue, 25 Feb 2020 01:46:03 -0800 (PST)
MIME-Version: 1.0
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
 <20200221213652.GD3456@ravnborg.org>
 <CAFPSGXacMKTPrxk_FOrwrvH_XfmO3dYCCa_GoPCe_HUfQFPHtw@mail.gmail.com>
 <20200222212713.GA30872@ravnborg.org>
 <CAFPSGXZWC7dASrVP3MTWS+oJjcwQEK0T+BLiwZ-cxk2OyeNZQw@mail.gmail.com>
 <3acf15ff-6a41-ca13-e219-301fcef983fa@suse.de>
In-Reply-To: <3acf15ff-6a41-ca13-e219-301fcef983fa@suse.de>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Tue, 25 Feb 2020 17:45:51 +0800
Message-ID: <CAFPSGXaTgV4WSp_Ag40rbseL3mi6qmdpvTax76fO8qCT0EVK4Q@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/6] drm/sprd: add Unisoc's drm kms master
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1027276541=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1027276541==
Content-Type: multipart/alternative; boundary="0000000000002923c1059f635bbe"

--0000000000002923c1059f635bbe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 3:38 PM Thomas Zimmermann <tzimmermann@suse.de>
wrote:

> Hi
>
> Am 23.02.20 um 05:26 schrieb tang pengchuan:
> >
> >
> > On Sun, Feb 23, 2020 at 5:27 AM Sam Ravnborg <sam@ravnborg.org
> > <mailto:sam@ravnborg.org>> wrote:
> >
> >     Hi Kevin/tang.
> >
> >     Thanks for the quick and detailed feedback.
> >     Your questions are addressed below.
> >
> >             Sam
> >
> >
> >     > > > +static int sprd_drm_bind(struct device *dev)
> >     > > > +{
> >     > > > +     struct drm_device *drm;
> >     > > > +     struct sprd_drm *sprd;
> >     > > > +     int err;
> >     > > > +
> >     > > > +     drm =3D drm_dev_alloc(&sprd_drm_drv, dev);
> >     > > > +     if (IS_ERR(drm))
> >     > > > +             return PTR_ERR(drm);
> >     > > You should embed drm_device in struct sprd_drm.
> >     > > See example code in drm/drm_drv.c
> >     > >
> >     > > This is what modern drm drivers do.
> >     > >
> >     > > I *think* you can drop the component framework if you do this.
> >     > >
> >     > I have read it(drm/drm_drv.c) carefully, if drop the component
> >     framework,
> >     > the whole our drm driver maybe need to redesign, so i still want
> >     to keep
> >     > current design.
> >     OK, fine.
> >
> >     > > > +     sprd_drm_mode_config_init(drm);
> >     > > > +
> >     > > > +     /* bind and init sub drivers */
> >     > > > +     err =3D component_bind_all(drm->dev, drm);
> >     > > > +     if (err) {
> >     > > > +             DRM_ERROR("failed to bind all component.\n");
> >     > > > +             goto err_dc_cleanup;
> >     > > > +     }
> >     > > When you have a drm_device - which you do here.
> >     > > Then please use drm_err() and friends for error messages.
> >     > > Please verify all uses of DRM_XXX
> >     > >
> >     >   modern drm drivers need drm_xxx to replace DRM_XXX?
> >     Yes, use of DRM_XXX is deprecated - when you have a drm_device.
> >
> >     > >
> >     > > > +     /* with irq_enabled =3D true, we can use the vblank
> >     feature. */
> >     > > > +     drm->irq_enabled =3D true;
> >     > > I cannot see any irq being installed. This looks wrong.
> >     > >
> >     > Our display controller isr is been register on crtc
> >     driver(sprd_dpu.c), not
> >     > here.
> >
> >     I think you just need to move this to next patch and then it is fin=
e.
> >
> > Here is the advice given by Thomas Zimmermann, similar to the advice yo=
u
> > gave.
> > I have given thomas feedback about my questions, maybe thomas didn't se=
e
> > my email, so there is no reply.
>
> I have been busy last week. Sorry for not getting back to you.
>
> >
> > But I've always been confused, because irq is initialized in drm driver
> > for other guys, why not for me?
>
> Do you have an example?
>
Hi Thomas,
The the irq is initialized in the sub-device code, but the device state is
set on kms driver.
E.g
Here is the device state set on kms driver:

206  <http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drive=
rs/gpu/drm/mediatek/mtk_drm_drv.c#206>
*static* *int* mtk_drm_kms_init
<http://10.0.1.79:8081/s?refs=3Dmtk_drm_kms_init&project=3Dsprdroidr_trunk>=
(*struct*
drm_device <http://10.0.1.79:8081/s?defs=3Ddrm_device&project=3Dsprdroidr_t=
runk>
*drm <http://10.0.1.79:8081/s?refs=3Ddrm&project=3Dsprdroidr_trunk>)
......

298  <http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drive=
rs/gpu/drm/mediatek/mtk_drm_drv.c#298>
	/*299  <http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/dr=
ivers/gpu/drm/mediatek/mtk_drm_drv.c#299>
	 * We don't use the drm_irq_install() helpers provided by the DRM300
<http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gp=
u/drm/mediatek/mtk_drm_drv.c#300>
	 * core, so we need to set this manually in order to allow the301
<http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gp=
u/drm/mediatek/mtk_drm_drv.c#301>
	 * DRM_IOCTL_WAIT_VBLANK to operate correctly.302
<http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gp=
u/drm/mediatek/mtk_drm_drv.c#302>
	 */303  <http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/d=
rivers/gpu/drm/mediatek/mtk_drm_drv.c#303>
	drm <http://10.0.1.79:8081/s?defs=3Ddrm&project=3Dsprdroidr_trunk>->irq_en=
abled
<http://10.0.1.79:8081/s?defs=3Dirq_enabled&project=3Dsprdroidr_trunk> =3D
*true*;

Here is irq install on subdev:
265  <http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drive=
rs/gpu/drm/mediatek/mtk_disp_rdma.c#265>
*static* *int* mtk_disp_rdma_probe
<http://10.0.1.79:8081/s?refs=3Dmtk_disp_rdma_probe&project=3Dsprdroidr_tru=
nk>(*struct*
platform_device
<http://10.0.1.79:8081/s?defs=3Dplatform_device&project=3Dsprdroidr_trunk>
*pdev <http://10.0.1.79:8081/s?refs=3Dpdev&project=3Dsprdroidr_trunk>)
......
298  <http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drive=
rs/gpu/drm/mediatek/mtk_disp_rdma.c#298>
	ret <http://10.0.1.79:8081/s?defs=3Dret&project=3Dsprdroidr_trunk> =3D
devm_request_irq
<http://10.0.1.79:8081/s?defs=3Ddevm_request_irq&project=3Dsprdroidr_trunk>=
(dev
<http://10.0.1.79:8081/s?defs=3Ddev&project=3Dsprdroidr_trunk>, irq
<http://10.0.1.79:8081/s?defs=3Dirq&project=3Dsprdroidr_trunk>,
mtk_disp_rdma_irq_handler
<http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gp=
u/drm/mediatek/mtk_disp_rdma.c#mtk_disp_rdma_irq_handler>,299
 <http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/g=
pu/drm/mediatek/mtk_disp_rdma.c#299>
			       IRQF_TRIGGER_NONE
<http://10.0.1.79:8081/s?defs=3DIRQF_TRIGGER_NONE&project=3Dsprdroidr_trunk=
>,
dev_name <http://10.0.1.79:8081/s?defs=3Ddev_name&project=3Dsprdroidr_trunk=
>(dev
<http://10.0.1.79:8081/s?defs=3Ddev&project=3Dsprdroidr_trunk>), priv
<http://10.0.1.79:8081/s?defs=3Dpriv&project=3Dsprdroidr_trunk>);

I'm not sure if my understanding is wrong...


> Best regards
> Thomas
>
> > Can you help to tell the reason in detail, looking forward to your
> answers.
> >
> > Thomas's suggestion=EF=BC=9A
> >
> -------------------------------------------------------------------------=
------------------
> >
> > This line indicates the problem's design. The irq is initialized in the
> > sub-device code, but the device state is set here. Instead both should
> > be set in the same place.
> >
> >> +
> >> +     /* reset all the states of crtc/plane/encoder/connector */
> >> +     drm_mode_config_reset(drm);
> >> +
> >> +     /* init kms poll for handling hpd */
> >> +     drm_kms_helper_poll_init(drm);
> >
> > Most of this function's code should be moved into the sub-device bind
> > function.
> >
> > Here, maybe do:
> >
> >  * allocate device structures
> >  * call component_bind_all()
> >  * on success, register device
> >
> > The sub-device function should then do
> >
> >  * init modesetting, crtc, planes, etc.
> >  * do drm_mode_config_reset()
> >  * init vblanking
> >  * init the irq
> >  * do drm_kms_helper_poll_init()
> >
> > roughtly in that order. It makes sense to call drm_vblank_init() after
> > drm_mode_config_reset(), as vblanking uses some of the mode-config
> fields.
> >
> -------------------------------------------------------------------------=
-----------------------------
> >
> >
> >             Sam
> >
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>
>

--0000000000002923c1059f635bbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 25, 2020 at 3:38 PM Thoma=
s Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de">tzimmermann@suse.de=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi<br>
<br>
Am 23.02.20 um 05:26 schrieb tang pengchuan:<br>
&gt; <br>
&gt; <br>
&gt; On Sun, Feb 23, 2020 at 5:27 AM Sam Ravnborg &lt;<a href=3D"mailto:sam=
@ravnborg.org" target=3D"_blank">sam@ravnborg.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:sam@ravnborg.org" target=3D"_blank">sam@r=
avnborg.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Kevin/tang.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks for the quick and detailed feedback.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Your questions are addressed below.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +static int sprd_drm_bind(struct dev=
ice *dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct drm_devi=
ce *drm;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_drm=
 *sprd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0drm =3D drm_dev=
_alloc(&amp;sprd_drm_drv, dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(drm)=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return PTR_ERR(drm);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; You should embed drm_device in struct spr=
d_drm.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; See example code in drm/drm_drv.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; This is what modern drm drivers do.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; I *think* you can drop the component fram=
ework if you do this.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I have read it(drm/drm_drv.c) carefully, if dr=
op the component<br>
&gt;=C2=A0 =C2=A0 =C2=A0framework,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the whole our drm driver maybe need to redesig=
n, so i still want<br>
&gt;=C2=A0 =C2=A0 =C2=A0to keep<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; current design.<br>
&gt;=C2=A0 =C2=A0 =C2=A0OK, fine.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0sprd_drm_mode_c=
onfig_init(drm);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* bind and ini=
t sub drivers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0err =3D compone=
nt_bind_all(drm-&gt;dev, drm);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0DRM_ERROR(&quot;failed to bind all component.\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0goto err_dc_cleanup;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; When you have a drm_device - which you do=
 here.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Then please use drm_err() and friends for=
 error messages.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Please verify all uses of DRM_XXX<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0modern drm drivers need drm_xxx to=
 replace DRM_XXX?<br>
&gt;=C2=A0 =C2=A0 =C2=A0Yes, use of DRM_XXX is deprecated - when you have a=
 drm_device.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* with irq_ena=
bled =3D true, we can use the vblank<br>
&gt;=C2=A0 =C2=A0 =C2=A0feature. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0drm-&gt;irq_ena=
bled =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; I cannot see any irq being installed. Thi=
s looks wrong.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Our display controller isr is been register on=
 crtc<br>
&gt;=C2=A0 =C2=A0 =C2=A0driver(sprd_dpu.c), not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; here.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I think you just need to move this to next patch an=
d then it is fine.<br>
&gt; <br>
&gt; Here is the advice given by Thomas Zimmermann, similar to the advice y=
ou<br>
&gt; gave.<br>
&gt; I have given thomas feedback about my questions, maybe thomas didn&#39=
;t see<br>
&gt; my email, so there is no reply.<br>
<br>
I have been busy last week. Sorry for not getting back to you.<br>
<br>
&gt; <br>
&gt; But I&#39;ve always been confused, because irq is initialized in drm d=
river<br>
&gt; for other guys, why not for me?<br>
<br>
Do you have an example?<br></blockquote><div>Hi Thomas,</div><div><div>The =
the=C2=A0irq is initialized in the sub-device code, but the device state is=
 set on kms driver.</div><div><span class=3D"gmail-tlid-translation gmail-t=
ranslation" lang=3D"en"><span title=3D"" class=3D"gmail-"><span class=3D"gm=
ail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=
=3D"gmail-">E.g<br></span></span></span></span></div><div><span class=3D"gm=
ail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=
=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-translation" lang=
=3D"en"><span title=3D"" class=3D"gmail-">Here is the device state set on k=
ms driver:<br></span></span></span></span></div><div><pre><span id=3D"gmail=
-scope_id_c6d1be76" class=3D"gmail-scope-head"><a class=3D"gmail-l gmail-se=
lected" name=3D"206" href=3D"http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp=
/kernel/kernel5.4/drivers/gpu/drm/mediatek/mtk_drm_drv.c#206">206 </a><a st=
yle=3D"cursor: pointer;" id=3D"gmail-scope_id_c6d1be76_fold_icon"><span cla=
ss=3D"gmail-fold-icon">=C2=A0</span></a><b>static</b> <b>int</b> <a class=
=3D"gmail-xf" name=3D"mtk_drm_kms_init"></a><a href=3D"http://10.0.1.79:808=
1/s?refs=3Dmtk_drm_kms_init&amp;project=3Dsprdroidr_trunk" class=3D"gmail-x=
f gmail-intelliWindow-symbol">mtk_drm_kms_init</a>(<b>struct</b> <a href=3D=
"http://10.0.1.79:8081/s?defs=3Ddrm_device&amp;project=3Dsprdroidr_trunk" c=
lass=3D"gmail-intelliWindow-symbol">drm_device</a> *<a class=3D"gmail-xa" n=
ame=3D"drm"></a><a href=3D"http://10.0.1.79:8081/s?refs=3Ddrm&amp;project=
=3Dsprdroidr_trunk" class=3D"gmail-xa gmail-intelliWindow-symbol">drm</a>)<=
br>......<br></span></pre><span class=3D"gmail-tlid-translation gmail-trans=
lation" lang=3D"en"><span title=3D"" class=3D"gmail-"><span class=3D"gmail-=
tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=3D"g=
mail-"></span></span></span></span></div><div><pre><span id=3D"gmail-scope_=
id_c6d1be76_fold" class=3D"gmail-scope-body"><a class=3D"gmail-l gmail-sele=
cted" name=3D"298" href=3D"http://10.0.1.79:8081/xref/sprdroidr_trunk/bsp/k=
ernel/kernel5.4/drivers/gpu/drm/mediatek/mtk_drm_drv.c#298">298 </a><span c=
lass=3D"gmail-fold-space">=C2=A0</span>	<span class=3D"gmail-c">/*
<a class=3D"gmail-l gmail-selected" name=3D"299" href=3D"http://10.0.1.79:8=
081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gpu/drm/mediatek/mtk_=
drm_drv.c#299">299 </a><span class=3D"gmail-fold-space">=C2=A0</span>	 * We=
 don&#39;t use the drm_irq_install() helpers provided by the DRM
<a class=3D"gmail-hl gmail-selected" name=3D"300" href=3D"http://10.0.1.79:=
8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gpu/drm/mediatek/mtk=
_drm_drv.c#300">300 </a><span class=3D"gmail-fold-space">=C2=A0</span>	 * c=
ore, so we need to set this manually in order to allow the
<a class=3D"gmail-l gmail-selected" name=3D"301" href=3D"http://10.0.1.79:8=
081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gpu/drm/mediatek/mtk_=
drm_drv.c#301">301 </a><span class=3D"gmail-fold-space">=C2=A0</span>	 * DR=
M_IOCTL_WAIT_VBLANK to operate correctly.
<a class=3D"gmail-l gmail-selected" name=3D"302" href=3D"http://10.0.1.79:8=
081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gpu/drm/mediatek/mtk_=
drm_drv.c#302">302 </a><span class=3D"gmail-fold-space">=C2=A0</span>	 */</=
span>
<a class=3D"gmail-l gmail-selected" name=3D"303" href=3D"http://10.0.1.79:8=
081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gpu/drm/mediatek/mtk_=
drm_drv.c#303">303 </a><span class=3D"gmail-fold-space">=C2=A0</span>	<a hr=
ef=3D"http://10.0.1.79:8081/s?defs=3Ddrm&amp;project=3Dsprdroidr_trunk" cla=
ss=3D"gmail-intelliWindow-symbol">drm</a>-&gt;<a href=3D"http://10.0.1.79:8=
081/s?defs=3Dirq_enabled&amp;project=3Dsprdroidr_trunk" class=3D"gmail-inte=
lliWindow-symbol">irq_enabled</a> =3D <b>true</b>;<br><br>Here is irq insta=
ll on subdev:<br><span id=3D"gmail-scope_id_b3948385" class=3D"gmail-scope-=
head"><a class=3D"gmail-l gmail-selected" name=3D"265" href=3D"http://10.0.=
1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gpu/drm/mediate=
k/mtk_disp_rdma.c#265">265 </a><a style=3D"cursor: pointer;" id=3D"gmail-sc=
ope_id_b3948385_fold_icon"><span class=3D"gmail-fold-icon">=C2=A0</span></a=
><b>static</b> <b>int</b> <a class=3D"gmail-xf" name=3D"mtk_disp_rdma_probe=
"></a><a href=3D"http://10.0.1.79:8081/s?refs=3Dmtk_disp_rdma_probe&amp;pro=
ject=3Dsprdroidr_trunk" class=3D"gmail-xf gmail-intelliWindow-symbol">mtk_d=
isp_rdma_probe</a>(<b>struct</b> <a href=3D"http://10.0.1.79:8081/s?defs=3D=
platform_device&amp;project=3Dsprdroidr_trunk" class=3D"gmail-intelliWindow=
-symbol">platform_device</a> *<a class=3D"gmail-xa" name=3D"pdev"></a><a hr=
ef=3D"http://10.0.1.79:8081/s?refs=3Dpdev&amp;project=3Dsprdroidr_trunk" cl=
ass=3D"gmail-xa gmail-intelliWindow-symbol">pdev</a>)<br>......<br></span><=
span id=3D"gmail-scope_id_b3948385_fold" class=3D"gmail-scope-body"><a clas=
s=3D"gmail-l gmail-target gmail-selected" name=3D"298" href=3D"http://10.0.=
1.79:8081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gpu/drm/mediate=
k/mtk_disp_rdma.c#298">298 </a><span class=3D"gmail-fold-space">=C2=A0</spa=
n>	<a href=3D"http://10.0.1.79:8081/s?defs=3Dret&amp;project=3Dsprdroidr_tr=
unk" class=3D"gmail-intelliWindow-symbol">ret</a> =3D <a href=3D"http://10.=
0.1.79:8081/s?defs=3Ddevm_request_irq&amp;project=3Dsprdroidr_trunk" class=
=3D"gmail-intelliWindow-symbol">devm_request_irq</a>(<a href=3D"http://10.0=
.1.79:8081/s?defs=3Ddev&amp;project=3Dsprdroidr_trunk" class=3D"gmail-intel=
liWindow-symbol">dev</a>, <a href=3D"http://10.0.1.79:8081/s?defs=3Dirq&amp=
;project=3Dsprdroidr_trunk" class=3D"gmail-intelliWindow-symbol">irq</a>, <=
a class=3D"gmail-d gmail-intelliWindow-symbol" href=3D"http://10.0.1.79:808=
1/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gpu/drm/mediatek/mtk_di=
sp_rdma.c#mtk_disp_rdma_irq_handler">mtk_disp_rdma_irq_handler</a>,
<a class=3D"gmail-l gmail-selected" name=3D"299" href=3D"http://10.0.1.79:8=
081/xref/sprdroidr_trunk/bsp/kernel/kernel5.4/drivers/gpu/drm/mediatek/mtk_=
disp_rdma.c#299">299 </a><span class=3D"gmail-fold-space">=C2=A0</span>			 =
      <a href=3D"http://10.0.1.79:8081/s?defs=3DIRQF_TRIGGER_NONE&amp;proje=
ct=3Dsprdroidr_trunk" class=3D"gmail-intelliWindow-symbol">IRQF_TRIGGER_NON=
E</a>, <a href=3D"http://10.0.1.79:8081/s?defs=3Ddev_name&amp;project=3Dspr=
droidr_trunk" class=3D"gmail-intelliWindow-symbol">dev_name</a>(<a href=3D"=
http://10.0.1.79:8081/s?defs=3Ddev&amp;project=3Dsprdroidr_trunk" class=3D"=
gmail-intelliWindow-symbol">dev</a>), <a href=3D"http://10.0.1.79:8081/s?de=
fs=3Dpriv&amp;project=3Dsprdroidr_trunk" class=3D"gmail-intelliWindow-symbo=
l">priv</a>);<br><br><span class=3D"gmail-tlid-translation gmail-translatio=
n" lang=3D"en"><span title=3D"" class=3D"gmail-">I&#39;m not sure if my und=
erstanding is wrong...</span></span></span></span></pre><span class=3D"gmai=
l-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=3D=
"gmail-"><span class=3D"gmail-tlid-translation gmail-translation" lang=3D"e=
n"><span title=3D"" class=3D"gmail-"></span></span></span></span></div> </d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards<br>
Thomas<br>
<br>
&gt; Can you help to tell the reason in detail, looking forward to your ans=
wers.<br>
&gt; <br>
&gt; Thomas&#39;s suggestion=EF=BC=9A<br>
&gt; ----------------------------------------------------------------------=
---------------------<br>
&gt; <br>
&gt; This line indicates the problem&#39;s design. The irq is initialized i=
n the<br>
&gt; sub-device code, but the device state is set here. Instead both should=
<br>
&gt; be set in the same place.<br>
&gt; <br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0/* reset all the states of crtc/plane/encoder=
/connector */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_config_reset(drm);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0/* init kms poll for handling hpd */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_init(drm);<br>
&gt; <br>
&gt; Most of this function&#39;s code should be moved into the sub-device b=
ind<br>
&gt; function.<br>
&gt; <br>
&gt; Here, maybe do:<br>
&gt; <br>
&gt; =C2=A0* allocate device structures<br>
&gt; =C2=A0* call component_bind_all()<br>
&gt; =C2=A0* on success, register device<br>
&gt; <br>
&gt; The sub-device function should then do<br>
&gt; <br>
&gt; =C2=A0* init modesetting, crtc, planes, etc.<br>
&gt; =C2=A0* do drm_mode_config_reset()<br>
&gt; =C2=A0* init vblanking<br>
&gt; =C2=A0* init the irq<br>
&gt; =C2=A0* do drm_kms_helper_poll_init()<br>
&gt; <br>
&gt; roughtly in that order. It makes sense to call drm_vblank_init() after=
<br>
&gt; drm_mode_config_reset(), as vblanking uses some of the mode-config fie=
lds.=C2=A0<br>
&gt; ----------------------------------------------------------------------=
--------------------------------<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
&gt; <br>
<br>
-- <br>
Thomas Zimmermann<br>
Graphics Driver Developer<br>
SUSE Software Solutions Germany GmbH<br>
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany<br>
(HRB 36809, AG N=C3=BCrnberg)<br>
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer<br>
<br>
</blockquote></div></div>

--0000000000002923c1059f635bbe--

--===============1027276541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1027276541==--
