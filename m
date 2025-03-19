Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20044A695AC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 18:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D1810E559;
	Wed, 19 Mar 2025 17:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G+sLdWIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB3E10E559
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 17:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742403667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XCYXGFlfW82RY/yK+n4SHADTQq97d8z1fImEw741L+I=;
 b=G+sLdWIlokyXbe4sOb+QLxi+SXI5fGujJSniEPnrhU33P99gIPag7jvZD6pAkxuvB4OzHg
 XpqMgBB4WG8rv5q4MNlvyrgI9KCoIs8nh3cK8ooWdmQDN1mmoO1spluih08sbXzEpCTkNG
 sTEBnJ0ubcbmhdr/Z33qenjgTQ3TVq8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-oe4kxZ5fOtyVCAprA7ua9Q-1; Wed, 19 Mar 2025 13:01:05 -0400
X-MC-Unique: oe4kxZ5fOtyVCAprA7ua9Q-1
X-Mimecast-MFC-AGG-ID: oe4kxZ5fOtyVCAprA7ua9Q_1742403665
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6ff4d1b7490so71453507b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 10:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742403665; x=1743008465;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XCYXGFlfW82RY/yK+n4SHADTQq97d8z1fImEw741L+I=;
 b=JCLzE/bniNgARzCm9qbgvEVZynu46DsZzuC0nK9LR43JAOtYp4tQffefRV5CXR3EsJ
 yN4aDS3wwt10wUu0xKO7CzZIglkZFdQbJh4halgSAVfrgFk2iXGslZmpf7z4ZMgm4kuy
 c4mqwu+KDUE0utZuDjean9wtEZqkM1Jiex9fYMRMwhL9WJOkhF7YvFVu2/4xKc2IrN/2
 DnDLtpR8DD8pIUaeCY8a6blcqXZoD6RN6Pz9RWE9uEhWFrI5Vci88y1OSwl5XyAx6zLX
 zypX9UF5u6dtINB/deii96nFeP2RNOawXcJlrB2eRiQjVgr/s+3BTuPetlY6m0ugIRHC
 0Gnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmzHoPAPZpMcDhjFEPjZmWvXrSYZUs3GmspfIP0X3YZtJ3JT7rxW9QbtCPXcmJwL4SkFwmLXARDDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvM5IewjlriBBogbd5OtMxFbjUF2aj95Evjd3Bq1BNKoV8OumO
 ewIIDgMLlnR4EesP+TV1wNU9f2/FFAsc04Vu2zlMfv9S6yEGEkENk6Bjg2OGLQGbYEdYKgpUKMO
 mVZQZXvegagjCS5Qt/hcr9T/9fvEDT0iptxOrGVS6o8p8UXrU2mHtJWm9yBY9haCnUWkpOafiFp
 gOJgG2PC+Rv/tffLV3eY2HeVY1NNWoew5mQ3yLArkT
X-Gm-Gg: ASbGnctW9znn2vaI+2xNpie9bOhqFb9eW/rRuZF2pamsP7C/GDA5t6kwLhKFU7tI1v5
 R2toaUkBZSYWLDETaULZ+OuxeSFQp0VNCfdI2gX7dVFjUJi+y1w0Nt4Lo/A7f/wMbpWCxm8Q=
X-Received: by 2002:a05:690c:4881:b0:6ff:1fac:c4f4 with SMTP id
 00721157ae682-7009c02def3mr52783237b3.29.1742403665058; 
 Wed, 19 Mar 2025 10:01:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRU4RiWdoSeQTJMKqKxma6ZcEpDivMCu64ph0emNpLvqAUvrEKdqvUdsWEAot/avmQ9XXdPapW0vGAKk+aS90=
X-Received: by 2002:a05:690c:4881:b0:6ff:1fac:c4f4 with SMTP id
 00721157ae682-7009c02def3mr52782877b3.29.1742403664672; Wed, 19 Mar 2025
 10:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba0@redhat.com>
 <zs4tt57ur6hbesipab3kuiost4gokfu6tmfsicfwtdwri2wwli@fylnnpu3xoen>
 <CAN9Xe3SkXCK3FJx6c=EDigBxdXeGh9NYEf-wcR0_jFwraFGeDg@mail.gmail.com>
 <CAO9ioeXyJKGxXXanFHraspvquwWmMEKUdw_eN=wjV81VeMo43w@mail.gmail.com>
In-Reply-To: <CAO9ioeXyJKGxXXanFHraspvquwWmMEKUdw_eN=wjV81VeMo43w@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 19 Mar 2025 12:00:54 -0500
X-Gm-Features: AQ5f1Jro8YdkF4qFYC5HfuMXnCHLqJa-Ymxox1KXT2XW1rdNAVsRy-yHomFCpUk
Message-ID: <CAN9Xe3QHwbVvAKm62A=kre_y39nzo6ZqpDmLbk5O_Zb_2Y5wqg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/sharp-ls043t1le01: Use _multi variants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>, 
 Doug Anderson <dianders@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RYXaPuaa8xaUkpsmNHCHrNh6Z9Y3wPDAbYuDGJuA2WU_1742403665
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007d0acf0630b4f7b7"
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

--0000000000007d0acf0630b4f7b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Mar 2025 at 12:00=E2=80=AFPM, Dmitry Baryshkov <
dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Tue, 18 Mar 2025 at 18:55, Anusha Srivatsa <asrivats@redhat.com> wrote=
:
> >
> > On Sun, Mar 16, 2025 at 7:32=E2=80=AFPM Dmitry Baryshkov <
> dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sun, Mar 16, 2025 at 02:58:22PM -0400, Anusha Srivatsa wrote:
>
> >> > ---
> >> >  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 36
> ++++++++++---------------
> >> >  1 file changed, 14 insertions(+), 22 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> >> > index
> 729cbb0d8403ff7c0c4b9d21774909cc298904a2..9803eaf18e95d70742ece88e8293275=
1476fdda8
> 100644
> >> > --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> >> > +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> >> > @@ -36,15 +36,14 @@ static inline struct sharp_nt_panel
> *to_sharp_nt_panel(struct drm_panel *panel)
> >> >  static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)
> >> >  {
> >> >       struct mipi_dsi_device *dsi =3D sharp_nt->dsi;
> >> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> >> >       int ret;
> >> >
> >> >       dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> >> >
> >> > -     ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> >> > -     if (ret < 0)
> >> > -             return ret;
> >> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> >> >
> >> > -     msleep(120);
> >> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> >> >
> >> >       /* Novatek two-lane operation */
> >> >       ret =3D mipi_dsi_dcs_write(dsi, 0xae, (u8[]){ 0x03 }, 1);
> >>
> >> Anusha. Please. Start reviewing your patches before you send them. Thi=
s
> >> is a MIPI DSI call. And it wasn't switched to _multi / context. You
> >> should have cought this. I don't know why you didn't. Please review an=
d
> >> check your code before sending it upstream.
> >
> >
> > Actually , mipi_dsi_dcs_write() doesnt have a _multi() variant. There
> are _multi() variants for other writes: mipi_dsi_dcs_write_buffer() has
> mipi_dsi_dcs_write_buffer_multi(), mipi_dsi_generic_write() has
> mipi_dsi_generic_write_multi() but not the one used above.
>
> That doesn't mean that it can be left unconverted. You can use
> mipi_dsi_dcs_write_buffer_multi().
>

Ah got it . Makes sense.

>
> P.S. Please wrap your replies ont some useful boundary (72-75 chars is
> the recommended value).
>

Sure.

Anusha

>
> --
> With best wishes
> Dmitry
>
>

--0000000000007d0acf0630b4f7b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 18 Mar 2025 at 12:00=E2=80=AFPM, Dmitry Barysh=
kov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm.com">dmitry.baryshk=
ov@oss.qualcomm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On Tue, 18 Mar 2025 at 18:55, Anusha Srivatsa &lt;<a href=3D"mailto:asrivat=
s@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, Mar 16, 2025 at 7:32=E2=80=AFPM Dmitry Baryshkov &lt;<a href=
=3D"mailto:dmitry.baryshkov@oss.qualcomm.com" target=3D"_blank">dmitry.bary=
shkov@oss.qualcomm.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sun, Mar 16, 2025 at 02:58:22PM -0400, Anusha Srivatsa wrote:<b=
r>
<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 36 ++=
++++++++---------------<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 14 insertions(+), 22 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c =
b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c<br>
&gt;&gt; &gt; index 729cbb0d8403ff7c0c4b9d21774909cc298904a2..9803eaf18e95d=
70742ece88e82932751476fdda8 100644<br>
&gt;&gt; &gt; --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c<br>
&gt;&gt; &gt; +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c<br>
&gt;&gt; &gt; @@ -36,15 +36,14 @@ static inline struct sharp_nt_panel *to_s=
harp_nt_panel(struct drm_panel *panel)<br>
&gt;&gt; &gt;=C2=A0 static int sharp_nt_panel_init(struct sharp_nt_panel *s=
harp_nt)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D sha=
rp_nt-&gt;dsi;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_multi_context dsi_ctx =
=3D { .dsi =3D dsi };<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags |=3D MIPI_DSI_MO=
DE_LPM;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi=
);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_exit_sleep_mode_multi(&amp;=
dsi_ctx);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0msleep(120);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0mipi_dsi_msleep(&amp;dsi_ctx, 120);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Novatek two-lane operation */<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_write(dsi, 0xa=
e, (u8[]){ 0x03 }, 1);<br>
&gt;&gt;<br>
&gt;&gt; Anusha. Please. Start reviewing your patches before you send them.=
 This<br>
&gt;&gt; is a MIPI DSI call. And it wasn&#39;t switched to _multi / context=
. You<br>
&gt;&gt; should have cought this. I don&#39;t know why you didn&#39;t. Plea=
se review and<br>
&gt;&gt; check your code before sending it upstream.<br>
&gt;<br>
&gt;<br>
&gt; Actually , mipi_dsi_dcs_write() doesnt have a _multi() variant. There =
are _multi() variants for other writes: mipi_dsi_dcs_write_buffer() has mip=
i_dsi_dcs_write_buffer_multi(), mipi_dsi_generic_write() has mipi_dsi_gener=
ic_write_multi() but not the one used above.<br>
<br>
That doesn&#39;t mean that it can be left unconverted. You can use<br>
mipi_dsi_dcs_write_buffer_multi().<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ah got it . Make=
s sense.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br>
P.S. Please wrap your replies ont some useful boundary (72-75 chars is<br>
the recommended value).<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Sure.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Anusha=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
-- <br>
With best wishes<br>
Dmitry<br>
<br>
</blockquote></div></div>

--0000000000007d0acf0630b4f7b7--

