Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB187AFCA31
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B255110E18D;
	Tue,  8 Jul 2025 12:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OPAKAxgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6F410E18D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 12:17:55 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-70e4043c5b7so36759167b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751977074; x=1752581874; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5hE4kWt3py0OgNEUZM1YmCNxsnoepHAXEyX5EDYxjiE=;
 b=OPAKAxgVUxj+1Xc3SFIvdOZ79Nm2r0p2xNhXZz090KQsNnXSZjbbU+pTcXSf8rPy4v
 pImnC2wCUK/PHwM7FYxaoTvkdRZTIBOAXo4WUI8sdozm/GUngSPXil/sg0bcU7zAcHis
 YOUl5bK818WKU1UvQ9uQrE4vrw7WD0AiY5EtUJ6EOAgu0NBqtpXuL3pP10oMQKw/HH6M
 GeK+Uw6dXO1KCb7Tli0LDBPHVGGCy9dWo6x7c8sXveFqDcOzZQNgg8jIhDTLKeaBXFcP
 kKsFoKXKZN2Yor3sYW5KrT1mQ2rdqxnSOmdNQVC5MSeOlmyB43kH9W0bolGgOsD1u/lV
 bAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751977074; x=1752581874;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5hE4kWt3py0OgNEUZM1YmCNxsnoepHAXEyX5EDYxjiE=;
 b=dSOluTuHol840jvihlcMLdxrc/nRcMywVdq7BXKHIXOQz/nnbR3wk6G0+5StOu38Uw
 f5id9A/7oqhYUowZafhjOMR1RLqRkU/UuifJ1ykzHLCBNv2jTkT8WOFLUeIECh/1+8g5
 WvIN/e6Rax9zoyBDV/2IGg13vobYDPhmddKrTcNwt4FjmTpuL6UuJTIxqyZt0IRkieSP
 2z5AnWkK/YaXK6I3wmkhOs6qVY8ZPzh5ZIWZrbZ8kgdeYyNKFamNPi98LSsStJY4U3Y2
 +jVK2dg4H5CvTIsCqEsJ6nbt2k+frMiw5hJb39oF74ESPAR/hGc7L0rsl3oEGBgH+0rX
 68Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOXmnCiMWMUJWd3O0qF66ff4zJ1MTW42+fxVJFcYZD5IfXndWXCpZjxWsUEGKTYzu9FBe3o+k6wuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbexp0ZTwBEVtQc+ARgr0kUEt+Ucb5PVhIlvK66AX/YXzUkwaP
 fcbSvbZDeCMbqermbKiWKDkEII+d7I6iTThhvlT/3m+eFi1hNPRyf1Lk5iZLc3P/dTfZg4ZAgMC
 j7tSW3eDMGCPiMbHJAqEPjtGXKNzz+PfrRqYh8G/cKsYdvEoghQJqa3gn4j6IO2D9LnOcWFw=
X-Gm-Gg: ASbGnctkitjnkjC4xkCN+DbH6Pwz+ga0zCIm87jFTqQGNqY7lFN8CX8StOzUju1PQFF
 3GIx/sVY7Xuevg08HHSP7FLAeXXMzbOVQLn9eUFxBwEU69/53TdF4T30otV9R2rMcKqcGj0Zh/+
 Db3Eef7JvroZIn3sc34nSmQmOy+QirC+9heoEeAfOlFA==
X-Google-Smtp-Source: AGHT+IFWsP44QIMC3yeEKx8eLMVbXwub9awhQT4Gc/CLxC58XgRB+rXtY1LIfSy4qC5V5ZOPzdHCADcTEpZhTELxBUpY2WuulyjmL4Rb
X-Received: by 2002:a05:690c:6483:b0:70d:f15d:b18f with SMTP id
 00721157ae682-7166b7ed72bmr205759537b3.26.1751977074276; Tue, 08 Jul 2025
 05:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250707131224.249496-1-tzimmermann@suse.de>
 <a3336964-1b72-421c-b4dc-2ac3f548430b@amd.com>
 <4c1bc40d-6bd4-4102-b12f-fda320216e1d@suse.de>
 <CAFrh3J9uh0M5bWeS3cv_Cb1yFTKhE2+9mSk5hsZTzWW3uYKaWg@mail.gmail.com>
 <a421623f-e93f-4423-bf30-c7388c6a3508@suse.de>
In-Reply-To: <a421623f-e93f-4423-bf30-c7388c6a3508@suse.de>
From: Satadru Pramanik <satadru@gmail.com>
Date: Tue, 8 Jul 2025 08:17:44 -0400
X-Gm-Features: Ac12FXxEEETCRLR4QfMXK6ulZObVpKk2VQ9Pa3e9I-WAcOK7ulMfBtdMZkR9Ri4
Message-ID: <CAFrh3J8bWznU50oZCNfhUDUmbMAYKZytAZgfoP6s+8tFzsfW5g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/framebuffer: Acquire internal references on GEM
 handles
To: tzimmermann@suse.de
Cc: christian.koenig@amd.com, asrivats@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, jean-christophe@guillain.net, superm1@kernel.org, 
 bp@alien8.de, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 spasswolf@web.de, sumit.semwal@linaro.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000002abc9a063969f339"
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

--0000000000002abc9a063969f339
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=F0=9F=99=8F

Satadru reacted via Gmail
<https://www.google.com/gmail/about/?utm_source=3Dgmail-in-product&utm_medi=
um=3Det&utm_campaign=3Demojireactionemail#app>

On Tue, Jul 8, 2025, 03:38 Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>
> Am 07.07.25 um 18:14 schrieb Satadru Pramanik:
> > Applying this patch to 6.16-rc5 resolves the sleep issue regression
> > from 6.16-rc4 I was having on my MacBookPro11,3 (Mid-2014 15"
> > MacBookPro), which has the NVIDIA GK107M GPU enabled via the Nouveau
> > driver.
>
> Thanks for testing. I think the sleep regression was just a side effect
> of the broken reference counting.
>
> Best regards
> Thomas
>
> >
> > Many thanks,
> >
> > Satadru
> >
> > On Mon, Jul 7, 2025 at 9:33=E2=80=AFAM Thomas Zimmermann <tzimmermann@s=
use.de>
> > wrote:
> >
> >     Hi
> >
> >     Am 07.07.25 um 15:21 schrieb Christian K=C3=B6nig:
> >
> >     >>
> >     >> +#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i)  BIT(0u + (_i))
> >     > Why the "0u + (_i)" here? An macro trick?
> >
> >     You mean why not just BIT(_i)? internal_flags could possibly contai=
n
> >     additional flags. Just using BIT(_i) would make it look as if it's
> >     only
> >     for those handle refs.
> >
> >     Best regards
> >     Thomas
> >
> >     >
> >     > Regards,
> >     > Christian.
> >     >
> >     >> +
> >     >>   /**
> >     >>    * struct drm_framebuffer - frame buffer object
> >     >>    *
> >     >> @@ -188,6 +191,10 @@ struct drm_framebuffer {
> >     >>       * DRM_MODE_FB_MODIFIERS.
> >     >>       */
> >     >>      int flags;
> >     >> +    /**
> >     >> +     * @internal_flags: Framebuffer flags like
> >     DRM_FRAMEBUFFER_HAS_HANDLE_REF.
> >     >> +     */
> >     >> +    unsigned int internal_flags;
> >     >>      /**
> >     >>       * @filp_head: Placed on &drm_file.fbs, protected by
> >     &drm_file.fbs_lock.
> >     >>       */
> >
> >     --
> >     --
> >     Thomas Zimmermann
> >     Graphics Driver Developer
> >     SUSE Software Solutions Germany GmbH
> >     Frankenstrasse 146, 90461 Nuernberg, Germany
> >     GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> >     HRB 36809 (AG Nuernberg)
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
>

--0000000000002abc9a063969f339
Content-Type: text/vnd.google.email-reaction+json; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

{
  "emoji": "=F0=9F=99=8F",
  "version": 1
}
--0000000000002abc9a063969f339
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><p style=3D"font-size:50px;margin-top:0;margin-bottom:0">=F0=9F=99=8F<=
/p><p style=3D"margin-top:10px;margin-bottom:0">Satadru reacted via <a styl=
e=3D"color:unset;text-decoration:underline" href=3D"https://www.google.com/=
gmail/about/?utm_source=3Dgmail-in-product&amp;utm_medium=3Det&amp;utm_camp=
aign=3Demojireactionemail#app">Gmail</a></p></div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, J=
ul 8, 2025, 03:38 Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.=
de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hi<br>
<br>
Am 07.07.25 um 18:14 schrieb Satadru Pramanik:<br>
&gt; Applying this patch to 6.16-rc5 resolves the sleep issue regression <b=
r>
&gt; from 6.16-rc4 I was having on my=C2=A0MacBookPro11,3 (Mid-2014 15&quot=
; <br>
&gt; MacBookPro), which has the=C2=A0NVIDIA GK107M GPU enabled via the Nouv=
eau <br>
&gt; driver.<br>
<br>
Thanks for testing. I think the sleep regression was just a side effect <br=
>
of the broken reference counting.<br>
<br>
Best regards<br>
Thomas<br>
<br>
&gt;<br>
&gt; Many thanks,<br>
&gt;<br>
&gt; Satadru<br>
&gt;<br>
&gt; On Mon, Jul 7, 2025 at 9:33=E2=80=AFAM Thomas Zimmermann &lt;<a href=
=3D"mailto:tzimmermann@suse.de" target=3D"_blank" rel=3D"noreferrer">tzimme=
rmann@suse.de</a>&gt; <br>
&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Am 07.07.25 um 15:21 schrieb Christian K=C3=B6nig:<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i=
)=C2=A0 BIT(0u + (_i))<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Why the &quot;0u + (_i)&quot; here? An macro t=
rick?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0You mean why not just BIT(_i)? internal_flags could=
 possibly contain<br>
&gt;=C2=A0 =C2=A0 =C2=A0additional flags. Just using BIT(_i) would make it =
look as if it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0only<br>
&gt;=C2=A0 =C2=A0 =C2=A0for those handle refs.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thomas<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Christian.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 * struct drm_framebuffer - fr=
ame buffer object<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; @@ -188,6 +191,10 @@ struct drm_framebuffe=
r {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* DRM_MODE_FB_MO=
DIFIERS.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +=C2=A0 =C2=A0 /**<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* @internal_flags: Fr=
amebuffer flags like<br>
&gt;=C2=A0 =C2=A0 =C2=A0DRM_FRAMEBUFFER_HAS_HANDLE_REF.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +=C2=A0 =C2=A0 unsigned int internal_flags=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /**<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* @filp_head: Pl=
aced on &amp;drm_file.fbs, protected by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&amp;drm_file.fbs_lock.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thomas Zimmermann<br>
&gt;=C2=A0 =C2=A0 =C2=A0Graphics Driver Developer<br>
&gt;=C2=A0 =C2=A0 =C2=A0SUSE Software Solutions Germany GmbH<br>
&gt;=C2=A0 =C2=A0 =C2=A0Frankenstrasse 146, 90461 Nuernberg, Germany<br>
&gt;=C2=A0 =C2=A0 =C2=A0GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudi=
en Moerman<br>
&gt;=C2=A0 =C2=A0 =C2=A0HRB 36809 (AG Nuernberg)<br>
&gt;<br>
<br>
-- <br>
--<br>
Thomas Zimmermann<br>
Graphics Driver Developer<br>
SUSE Software Solutions Germany GmbH<br>
Frankenstrasse 146, 90461 Nuernberg, Germany<br>
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman<br>
HRB 36809 (AG Nuernberg)<br>
<br>
</blockquote></div>

--0000000000002abc9a063969f339--
