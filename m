Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60D6886AB6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 11:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B28E10F48C;
	Fri, 22 Mar 2024 10:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0rcFl2ka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D201310F153
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 09:24:51 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-430bf84977dso13716631cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 02:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711099490; x=1711704290;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lL/EBlH5Jh63aoKeHGLKMjIzRRSVjMHfesQNBO1Iucg=;
 b=0rcFl2kaOYm3zwPO6xkKaLbRtN03EG2PB+z6XIT7nEi3YGXfdobWSbTyUSYokLrfS9
 4oWru96YbxsoAjQKm8A7ghXq4GkwXOOH/h/Xi7fTtBCsKEQzP7nRjIiUdVjNLyMcEgqD
 ocmEjSahNFrmg/ey0Sl7NYw0Ezmq5WpPsvDci+/YqS7E6uEMVKA12T9jmuggwEeccyxd
 RB5R4YpsPbXDrA+umVwN3sHbImHnvOJ4twZ5jMi3wzenEDXcUmNk7GXGJvDj+8zQofVR
 iJEW57RUj0PtEs96rv/KPxE08hux4I25M+EIjAFFRprrvmYPd4H2S+j0szG8nRejqF5A
 UK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711099490; x=1711704290;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lL/EBlH5Jh63aoKeHGLKMjIzRRSVjMHfesQNBO1Iucg=;
 b=GQIX+ypboTbJRNnkD7uFrTWH5vCyQ4OpQxPjFCtadcGYEpA4MbAixAteXyYmEc2UwB
 iQDFy0P/7eCPO6R77WvxL8Yonwhb7zr50zvq/sbv8ilOJmwBa1MSBkSNvUgLT9+Ates1
 KYE5HU4rSFVXE1BUptvZl/QLUpwP0qSH6edACx7sLUfXEOqnKlO2MBP4Udgy7TgBPphv
 PtDhSr5eo50V7EQCirYAYCyNBuGJ8mhTImaxSYqdC2yMczCBKZ+2JxxdjDVycXhDmy6d
 uqfRN4prWIWTFRYw4PkfV3RQI45/8QSBL5M5YHr5IrKPei0K0IEYpWOU6n1wVdBHpf3z
 fIHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBdX07HJY9cH+ZVBsP89jh9/tAREvbTSn2fSUYMmC3XJiZxjMsBH0z3Fm65ca8/+M6cEf57zOhyCRMZ0bYlVbJnE0qp/FPPbydbjWzyQ6l
X-Gm-Message-State: AOJu0Yx+FsnUYkwQ6U/sPdClOdLFWVnJSuvMDjhr2o3QuadGJCj67f9u
 Pr+f3vWeAj6NtwTjjtWWFmz8R8SWF8zOS293wKfhb6HxYKHIAdFdMepKzt8W4jGh/Qi8C1c50/j
 vsN2FVJJzEt4wUxFAvE08FPtKHIjh9Aj6LeVhwTMbdkOPTjn0TR8=
X-Google-Smtp-Source: AGHT+IEY92qP9G2H9FhWdtgw9h1AbFV0mni/Os36S1+lGAL+B/YuwuWA4opCScQ9HWTHVUBAJMFEiqb3y9Ydd7bmajU=
X-Received: by 2002:a05:6a20:dd87:b0:1a3:4e17:ff8f with SMTP id
 kw7-20020a056a20dd8700b001a34e17ff8fmr1974300pzb.57.1711099026866; Fri, 22
 Mar 2024 02:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240322012808.26234-1-shawn.sung@mediatek.com>
 <20240322012808.26234-4-shawn.sung@mediatek.com>
 <e1d5d349-c9e3-4af9-a9b6-d563027a5974@collabora.com>
In-Reply-To: <e1d5d349-c9e3-4af9-a9b6-d563027a5974@collabora.com>
From: Shawn Sung <shawn.sung@mediatek.corp-partner.google.com>
Date: Fri, 22 Mar 2024 17:16:55 +0800
Message-ID: <CAJRMJYGyTvKnAnj2Uag01GZsVNiAj_qT==G9wrCwj776CLg_Jw@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] drm/mediatek: Rename "mtk_drm_plane" to
 "mtk_plane"
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: multipart/alternative; boundary="000000000000ac1c0106143c49af"
X-Mailman-Approved-At: Fri, 22 Mar 2024 10:51:27 +0000
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

--000000000000ac1c0106143c49af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Fri, Mar 22, 2024 at 4:46=E2=80=AFPM AngeloGioacchino Del Regno <
angelogioacchino.delregno@collabora.com> wrote:

> Il 22/03/24 02:27, Shawn Sung ha scritto:
> > From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> >
> > Rename all "mtk_drm_plane" to "mtk_plane":
> > - To align the naming rule
> > - To reduce the code size
> >
> > Reviewed-by: AngeloGiaocchino Del Regno <
> angelogioacchino.delregno@collabora.com>
>
> Shawn - please - can you fix my typo'ed name also here and on all of the
> patches of this series?
>
>
Submitted a new version to fix the typo.
Thank you for the reminder.

Regards,
Shawn

--000000000000ac1c0106143c49af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Angelo,</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 22, 2024 at 4:46=E2=
=80=AFPM AngeloGioacchino Del Regno &lt;<a href=3D"mailto:angelogioacchino.=
delregno@collabora.com">angelogioacchino.delregno@collabora.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Il 22/03/24 =
02:27, Shawn Sung ha scritto:<br>
&gt; From: Hsiao Chien Sung &lt;<a href=3D"mailto:shawn.sung@mediatek.corp-=
partner.google.com" target=3D"_blank">shawn.sung@mediatek.corp-partner.goog=
le.com</a>&gt;<br>
&gt; <br>
&gt; Rename all &quot;mtk_drm_plane&quot; to &quot;mtk_plane&quot;:<br>
&gt; - To align the naming rule<br>
&gt; - To reduce the code size<br>
&gt; <br>
&gt; Reviewed-by: AngeloGiaocchino Del Regno &lt;<a href=3D"mailto:angelogi=
oacchino.delregno@collabora.com" target=3D"_blank">angelogioacchino.delregn=
o@collabora.com</a>&gt;<br>
<br>
Shawn - please - can you fix my typo&#39;ed name also here and on all of th=
e<br>
patches of this series?<br><br></blockquote><div><br></div><div>Submitted a=
 new version to fix the typo.</div><div>Thank you for the reminder.</div><d=
iv><br></div><div>Regards,</div><div>Shawn</div></div></div>

--000000000000ac1c0106143c49af--
