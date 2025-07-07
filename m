Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3CAAFBD74
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 23:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA3410E573;
	Mon,  7 Jul 2025 21:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BnB/NpIO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9E510E322
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:14:57 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e7569ccf04cso2721378276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751904896; x=1752509696; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O2TeZOJwxzH1nOGV5X51rLD2dK5A11alLClunbUH9Cs=;
 b=BnB/NpIOTMAnjeUjmEb4Bjcu7GN70dxNY9qxepQ3hQMeHlN+1+upG26+S/bo6txDhJ
 K3hN3baYcmWIeJPrXaK2aQiGPBJFMjLWqDgvWbfdiyjYAAb/xWMeyPc8fXTtwdmBoThO
 QfX/glvACQE9jxsR8sOSl8XZk8zUMdxXDoTnJpigw+v12lUDF650WG8yvHh3GSz//mM5
 V0LCyx1Raz341vzjCRaFiv9cePYYIju05qtf4TWGoafmn+zFSBqAzvt3cwbVKGfY/+G2
 Tb7r7fS+7jFsoJCYrc/5FaoblWbhiL0kn6Fhov/7fTJQamT/4O7ffSZgyko/pnEQaYVx
 eEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751904896; x=1752509696;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O2TeZOJwxzH1nOGV5X51rLD2dK5A11alLClunbUH9Cs=;
 b=Ei/WaNDohi//IiF/gphfvTgfhx5v+EyyzMHHOxOgjWREZQ/EnODvmHW5ugwhSZ96g7
 eKvsWfPdFIQvTOmwywukuEfSyOM/bRoF72+RNwyfbfE/0xoBu1SFyTwPQG/tUKjgBoq5
 BTEqykHdONBU1v7mJT614YmS/4vBI/tnMJU37JBbSBYZ9wNFYqrx7Q+y8qzzctCWw58N
 GtUNacI7suC/OeJ8TbfDTrpoX/top9V2bi0uVP+DZRlyufG7bWuJMisDKlrPou2B+spg
 QiAWaBi7xM+cmmxXN5Lb0gr5kaSDkMWpF2mYCXqNxRBmCm7KpQ8qQK/VfRNeTJ2UxhXH
 b9/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL8GNV+VjR1htICNjbYAsQFYa/s7fqnjVrq+uv506TlOOGSJD41GaUEi4eg4Qnde9yaiSgB6C0SrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzoma6qi7EQ9L9h2lnEXb4H4mXm8/Ctmf/obAT/Fjv0g6nEY3Vv
 +LwdXVsxeyMDlRt5+i9EiGYUG2Tq+VnYRNcpbufvE4k254wzROCSeUhFOXXceLjZe7IvNoXlxke
 dpDVP0hyZnUSLDxV93MosrAgUTj7Z9G8=
X-Gm-Gg: ASbGnctyrVbg9JDkvcTT8qBE5027fQHMA9hcoBUPGPoYsoXMtc+aoQvKsH3MalfY7pL
 e7hekRwUd2SUckcYuLDnD5ntejKEAW+hWYHvFK9+UJO4hncP4KGa8XMpuB3bwMMA3WkshRXYJDq
 fyPevHHB9Fj16x5vfL/H12m8vBYTw8iwA2lTp/gCavNRSB2l5yaEaHLxjhc7S5Ri2QYLHtx0o=
X-Google-Smtp-Source: AGHT+IEH/sghPyYwQr1ZDp2T9iVXj0TxftbRSFOL1DFWXuN7bcu9C+D6tZZAUivpDYivT67YUyjqdFug6qYsFAlhkFg=
X-Received: by 2002:a05:690c:9511:b0:70e:143:b82f with SMTP id
 00721157ae682-7166b69ebf6mr144614987b3.32.1751904896459; Mon, 07 Jul 2025
 09:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250707131224.249496-1-tzimmermann@suse.de>
 <a3336964-1b72-421c-b4dc-2ac3f548430b@amd.com>
 <4c1bc40d-6bd4-4102-b12f-fda320216e1d@suse.de>
In-Reply-To: <4c1bc40d-6bd4-4102-b12f-fda320216e1d@suse.de>
From: Satadru Pramanik <satadru@gmail.com>
Date: Mon, 7 Jul 2025 12:14:45 -0400
X-Gm-Features: Ac12FXwLW-kzgBGBX2BN7ywRqUGvq6k9Zgs39ChwD4snb-Za0Q20DQC9JARQFNc
Message-ID: <CAFrh3J9uh0M5bWeS3cv_Cb1yFTKhE2+9mSk5hsZTzWW3uYKaWg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/framebuffer: Acquire internal references on GEM
 handles
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 asrivats@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, jean-christophe@guillain.net, 
 superm1@kernel.org, bp@alien8.de, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bert Karwatzki <spasswolf@web.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000008a81c0639592506"
X-Mailman-Approved-At: Mon, 07 Jul 2025 21:23:55 +0000
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

--00000000000008a81c0639592506
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applying this patch to 6.16-rc5 resolves the sleep issue regression from
6.16-rc4 I was having on my MacBookPro11,3 (Mid-2014 15" MacBookPro), which
has the NVIDIA GK107M GPU enabled via the Nouveau driver.

Many thanks,

Satadru

On Mon, Jul 7, 2025 at 9:33=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de>
wrote:

> Hi
>
> Am 07.07.25 um 15:21 schrieb Christian K=C3=B6nig:
>
> >>
> >> +#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i)  BIT(0u + (_i))
> > Why the "0u + (_i)" here? An macro trick?
>
> You mean why not just BIT(_i)? internal_flags could possibly contain
> additional flags. Just using BIT(_i) would make it look as if it's only
> for those handle refs.
>
> Best regards
> Thomas
>
> >
> > Regards,
> > Christian.
> >
> >> +
> >>   /**
> >>    * struct drm_framebuffer - frame buffer object
> >>    *
> >> @@ -188,6 +191,10 @@ struct drm_framebuffer {
> >>       * DRM_MODE_FB_MODIFIERS.
> >>       */
> >>      int flags;
> >> +    /**
> >> +     * @internal_flags: Framebuffer flags like
> DRM_FRAMEBUFFER_HAS_HANDLE_REF.
> >> +     */
> >> +    unsigned int internal_flags;
> >>      /**
> >>       * @filp_head: Placed on &drm_file.fbs, protected by
> &drm_file.fbs_lock.
> >>       */
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

--00000000000008a81c0639592506
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Applying this patch to 6.16-rc5 resolves the sleep is=
sue regression from 6.16-rc4 I was having on my=C2=A0MacBookPro11,3 (Mid-20=
14 15&quot; MacBookPro), which has the=C2=A0NVIDIA GK107M GPU enabled via t=
he Nouveau driver.</div><div><br></div><div>Many thanks,</div><div><br></di=
v><div>Satadru</div></div><br><div class=3D"gmail_quote gmail_quote_contain=
er"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 7, 2025 at 9:33=E2=80=
=AFAM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de">tzimmerm=
ann@suse.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi<br>
<br>
Am 07.07.25 um 15:21 schrieb Christian K=C3=B6nig:<br>
<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt; +#define DRM_FRAMEBUFFER_HAS_HANDLE_REF(_i)=C2=A0 BIT(0u + (_i))<b=
r>
&gt; Why the &quot;0u + (_i)&quot; here? An macro trick?<br>
<br>
You mean why not just BIT(_i)? internal_flags could possibly contain <br>
additional flags. Just using BIT(_i) would make it look as if it&#39;s only=
 <br>
for those handle refs.<br>
<br>
Best regards<br>
Thomas<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Christian.<br>
&gt;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0/**<br>
&gt;&gt;=C2=A0 =C2=A0 * struct drm_framebuffer - frame buffer object<br>
&gt;&gt;=C2=A0 =C2=A0 *<br>
&gt;&gt; @@ -188,6 +191,10 @@ struct drm_framebuffer {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* DRM_MODE_FB_MODIFIERS.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int flags;<br>
&gt;&gt; +=C2=A0 =C2=A0 /**<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* @internal_flags: Framebuffer flags like DRM=
_FRAMEBUFFER_HAS_HANDLE_REF.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 unsigned int internal_flags;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /**<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* @filp_head: Placed on &amp;drm_file.fb=
s, protected by &amp;drm_file.fbs_lock.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
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

--00000000000008a81c0639592506--
