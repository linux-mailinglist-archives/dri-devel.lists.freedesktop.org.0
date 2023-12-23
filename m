Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE981D2A5
	for <lists+dri-devel@lfdr.de>; Sat, 23 Dec 2023 07:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1745110E086;
	Sat, 23 Dec 2023 06:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085CC10E086;
 Sat, 23 Dec 2023 06:20:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 230AD608C1;
 Sat, 23 Dec 2023 06:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8566C433C8;
 Sat, 23 Dec 2023 06:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703312417;
 bh=reDZvGjlO+iBGplMJj/6eDRmk8mNnCJLmcblb0YbRNk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VVsnJWq3GsE8C+0DblkEoGqENVkAUl2oKSs1mgU7Hq2DSwstrzLI4mYOUFF7vtLh5
 IX3qrwIq+A84/Y9ubgRZQDDNssGVvWbDjKWaY87YOFez6XjkgrpPYcS3f7kj+CNtlI
 S/jwAmsb0oAeAwUBJPNIK6zDrkVKUlTkZboM4yCbcptRNUNbqRbPVPQm8tOYW+Z18n
 RR5PmtiEGRbq/QypQGMFkfjr65SLnXoyIdlNE9UdRCfSO1WqvHVOT5anmbuoJ1uW6H
 isFh+u49qvd34tTk0C+vTuedmgmW/4iW9khfv93oQtLUoAb95ABFjtf2LDKGeaT8vd
 f/is2IWAx1zHw==
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a23566e91d5so293889466b.0; 
 Fri, 22 Dec 2023 22:20:17 -0800 (PST)
X-Gm-Message-State: AOJu0YwaGg0mdn3AsiLlMeFHMAiDsOlRcoky45ATVVB5dG3L4/bDkSd4
 czfGBzSp+C36FNpqt0XjJtgdeVR4EPmRBI8Xc/A=
X-Google-Smtp-Source: AGHT+IEAV5HXB0+Ozv/qhH3l6SMNoZhPYWpbngaP3jDI2sLK/C0GvBIiZ8md3Y4DfBubMJyhqh2cPhSRTB0DLPh0x9Y=
X-Received: by 2002:a17:906:3659:b0:a23:6215:47a with SMTP id
 r25-20020a170906365900b00a236215047amr942739ejb.60.1703312416436; Fri, 22 Dec
 2023 22:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20231222043308.3090089-1-airlied@gmail.com>
 <20231222043308.3090089-8-airlied@gmail.com>
In-Reply-To: <20231222043308.3090089-8-airlied@gmail.com>
From: Timur Tabi <timur@kernel.org>
Date: Sat, 23 Dec 2023 00:20:03 -0600
X-Gmail-Original-Message-ID: <CAOZdJXU+aj1YhfGDqHh2Gqd=Rktn_biM6uTGNvvwDg_zz6s+eA@mail.gmail.com>
Message-ID: <CAOZdJXU+aj1YhfGDqHh2Gqd=Rktn_biM6uTGNvvwDg_zz6s+eA@mail.gmail.com>
Subject: Re: [PATCH 07/11] nouveau/gsp: convert gsp errors to generic errors
To: Dave Airlie <airlied@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000085f96b060d27539b"
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000085f96b060d27539b
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 21, 2023, 10:33 PM Dave Airlie <airlied@gmail.com> wrote:

> This should let the upper layers retry as needed on EAGAIN.
>
> There may be other values we will care about in the future, but
> this covers our present needs.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
>
> +static int
> +r535_rpc_status_to_errno(uint32_t rpc_status)
> +{
> +       switch (rpc_status) {
> +       case 0x55: /* NV_ERR_NOT_READY */
> +       case 0x66: /* NV_ERR_TIMEOUT_RETRY */
> +              return -EAGAIN;
> +       case 0x51: /* NV_ERR_NO_MEMORY */
> +               return -ENOMEM;
> +       default:
> +               return -EINVAL;
> +       }
>

Shouldn't you also have this:

case 0:
    return 0;

--00000000000085f96b060d27539b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Dec 21, 2023, 10:33 PM Dave Airlie &lt;<a href=
=3D"mailto:airlied@gmail.com">airlied@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">This should let the upper layers retry as neede=
d on EAGAIN.<br>
<br>
There may be other values we will care about in the future, but<br>
this covers our present needs.<br>
<br>
Signed-off-by: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">airlied@redhat.com</a>&gt;<br><br>
+static int<br>
+r535_rpc_status_to_errno(uint32_t rpc_status)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (rpc_status) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x55: /* NV_ERR_NOT_READY */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x66: /* NV_ERR_TIMEOUT_RETRY */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EAGAIN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x51: /* NV_ERR_NO_MEMORY */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Shouldn&#39;t you also have this:</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">case 0:</div><div dir=3D"auto">=C2=
=A0 =C2=A0 return 0;</div></div>

--00000000000085f96b060d27539b--
