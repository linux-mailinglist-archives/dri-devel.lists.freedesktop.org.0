Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF429F261C
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 21:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7826C10E4EB;
	Sun, 15 Dec 2024 20:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JCruWLFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A6D10E4EB;
 Sun, 15 Dec 2024 20:54:52 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3c0bd1cc4so367925a12.0; 
 Sun, 15 Dec 2024 12:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734296090; x=1734900890; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HaxFwoHaZmIdlaqE8ckrNNtJwriXy3rDjLrIxvAHJ5k=;
 b=JCruWLFwxcPagWfyb5U4DJuLD36fqX89Cn+ELhUt6qtSHa7djxJ3EF45srq6WEm+f/
 DFQWEGOjNBNOcaNbTKp+nMCnoWAAUu9K4KDD56ZpSZeEb8v42vlaDCr0sOxpgvgopxg8
 CzcW4cdCbUmyGH1qw/wg1Yo8RGSyEamR6DYnUZvHxKgIRf3iXgjsy5Vk/tcb4F5F9GQj
 c/+hwKKyuyzctvaNiUnTFYscPMarj9GBGt01cid4KvHxP34b8HiwUmIaHyBXV3tizHow
 8Iq/VzhS91WK2vcgF9UCTT8EMjP7Ys7QLuwOYnbUniHKY5uIP8YkyNxk/8PbS3ZqnvUw
 lABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734296090; x=1734900890;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HaxFwoHaZmIdlaqE8ckrNNtJwriXy3rDjLrIxvAHJ5k=;
 b=eeQXn7TBwqONl/uhv8qLKVcbLTHvrUI8feKSEiHu6WNQp6jk/j6+p0TblOFth3xJe/
 B6Vjv5EY8Byx7Qnnc6Gb3r38PpZenhDTk/aD/SeirPWRzk2139xZzQELv/aa77bXOW0F
 PhZbfx97G765Jzjdljx0yQO+vNx9hyJeL0iI9PvD8MNWX/0jSVCcEazsQFtpdCaibsF1
 svdlfVqr+rI20L8pN4mrSGnGNM5gA20JqCyTzlh4NQVOxdIbKqk5mBuEYePZYHMtKiix
 XoQfTOdeDWVtYIZM6U/zrbGlRde5NC1tcDdESLv648q8PoON10dLZIGIaaMIuBMl+SUX
 4i2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYP7bZ089a9DUPHGuwjymqUB/AfkzA2RBpeBBHPOg3pMEHUk7aGS6dYlvhUHAmVGH86yjYIpzp@lists.freedesktop.org,
 AJvYcCV5ycW/F+5g1/uGMSe58pTsIrlUv1rUOO5feQk61f7ZBRgQNe95TspNFfBqRnGyJJFyWTWwiWlcmb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweofmvRQKWV7+cNXru579Bh1y78jn5ej00kT1t6bO6bGzZsmMr
 OFeUunXJYvxRzH85ZvPkj2je2uoa1lKaMN4fqrZv6Rf8XtivtXaa7nSuiLgd/bUaW23LgxfMsoh
 39BYg4ibAoyfPq87GfACjIVMvTHgNlH5G
X-Gm-Gg: ASbGnctrMROWp7XLGbbSbSn3XaZmkzi25wNVtKsxkW5gY1GtA5BPTQA5NPNU+xnECJs
 sWzVP/guyhPrs0bkqs/oebJsqp+3K1vYp0Cp4y1To
X-Google-Smtp-Source: AGHT+IG8+P2bSNIAyNg4G4SEMx1NP05P1p3onCR8SU48Oh/WCLb6UHnKQhEQ2cDqk1oELph1f9eae/nn6f7TVYuk26Q=
X-Received: by 2002:a05:6402:51cb:b0:5d0:d927:824e with SMTP id
 4fb4d7f45d1cf-5d63c1567aamr3398763a12.0.1734296090306; Sun, 15 Dec 2024
 12:54:50 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
In-Reply-To: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Sun, 15 Dec 2024 15:54:13 -0500
Message-ID: <CAAxE2A77j94VNp33VhO97n3db_fZz1zUpM_VUPfkt96_Dzu9Bg@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="00000000000065f0f50629554669"
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

--00000000000065f0f50629554669
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Missed 2 lines from the diff:

+#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_128B fourcc_mod_code(NONE, 2)
+#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_256B fourcc_mod_code(NONE, 3)

Marek

On Sun, Dec 15, 2024 at 3:53=E2=80=AFPM Marek Ol=C5=A1=C3=A1k <maraeo@gmail=
.com> wrote:

> The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
>
> Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index 78abd819fd62e..8ec4163429014 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -484,9 +484,27 @@ extern "C" {
>   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2
> ioctl),
>   * which tells the driver to also take driver-internal information into
> account
>   * and so might actually result in a tiled framebuffer.
> + *
> + * WARNING:
> + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but on=
ly
> + * support a certain pitch alignment and can't import images with this
> modifier
> + * if the pitch alignment isn't exactly the one supported. They can
> however
> + * allocate images with this modifier and other drivers can import them
> only
> + * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LINEAR
> is
> + * fundamentically incompatible across devices and is the only modifier
> that
> + * has a chance of not working. The PITCH_ALIGN modifiers should be used
> + * instead.
>   */
>  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
>
> +/* Linear layout modifiers with an explicit pitch alignment in bytes.
> + * Exposing this modifier requires that the pitch alignment is exactly
> + * the number in the definition.
> + */
> +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)
>

--00000000000065f0f50629554669
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Missed 2 lines from the diff:</div><div><br></div><di=
v>+#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_128B fourcc_mod_code(NONE, 2)<=
br>+#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_256B fourcc_mod_code(NONE, 3)=
</div><div><br></div><div>Marek<br></div></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec =
15, 2024 at 3:53=E2=80=AFPM Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:mar=
aeo@gmail.com">maraeo@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">The comment explains the =
problem with DRM_FORMAT_MOD_LINEAR.<br>=C2=A0 =C2=A0 <br>Signed-off-by: Mar=
ek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak@amd.com" target=3D"_bl=
ank">marek.olsak@amd.com</a>&gt;<br><br>diff --git a/include/uapi/drm/drm_f=
ourcc.h b/include/uapi/drm/drm_fourcc.h<br>index 78abd819fd62e..8ec41634290=
14 100644<br>--- a/include/uapi/drm/drm_fourcc.h<br>+++ b/include/uapi/drm/=
drm_fourcc.h<br>@@ -484,9 +484,27 @@ extern &quot;C&quot; {<br>=C2=A0 * mod=
ifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2 ioctl),<br>=
=C2=A0 * which tells the driver to also take driver-internal information in=
to account<br>=C2=A0 * and so might actually result in a tiled framebuffer.=
<br>+ *<br>+ * WARNING:<br>+ * There are drivers out there that expose DRM_=
FORMAT_MOD_LINEAR, but only<br>+ * support a certain pitch alignment and ca=
n&#39;t import images with this modifier<br>+ * if the pitch alignment isn&=
#39;t exactly the one supported. They can however<br>+ * allocate images wi=
th this modifier and other drivers can import them only<br>+ * if they supp=
ort the same pitch alignment. Thus, DRM_FORMAT_MOD_LINEAR is<br>+ * fundame=
ntically incompatible across devices and is the only modifier that<br>+ * h=
as a chance of not working. The PITCH_ALIGN modifiers should be used<br>+ *=
 instead.<br>=C2=A0 */<br>=C2=A0#define DRM_FORMAT_MOD_LINEAR =C2=A0fourcc_=
mod_code(NONE, 0)<br>=C2=A0<br>+/* Linear layout modifiers with an explicit=
 pitch alignment in bytes.<br>+ * Exposing this modifier requires that the =
pitch alignment is exactly<br>+ * the number in the definition.<br>+ */<br>=
+#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)<br>=
</div>
</blockquote></div>

--00000000000065f0f50629554669--
