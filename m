Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CFD2743DA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FD3892F3;
	Tue, 22 Sep 2020 14:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D275893C0;
 Tue, 22 Sep 2020 14:07:05 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id n22so16314215edt.4;
 Tue, 22 Sep 2020 07:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yuRvT+8VMs24ohys+Hv94DiikG3p/AUnLWP5R4G2/5k=;
 b=jtmQWadefd34Xb7mtqWLQ/qkVA6fSC4GYgoUmvaNVV/JR7REzF6gQRCGDDD26kMOak
 lKKKPQe0p89JHkNJwpkJp8T8K4O2Pggx2oKby3UtByuIveJPajzV9H22+guVoyByvIR3
 9mAqYsabPANi3xUYPUCM7VUXw95bSrca9oCZjYkk0Sb5KAUoxV/B19hhS5g2ma6ZaAcb
 wCYytfG/2dA9YPEfw2yDDayiHkd5zOvvVmd/C3SI2VQskVQ6unflhEbT1Cs8AjO65txS
 WPi+JHbjFRAmHNrsbaVr6sJxZ7xBUtwvYDFo1ugVmWSo6ZwBbc0l3bSsPjEtL+WFLOCf
 c5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yuRvT+8VMs24ohys+Hv94DiikG3p/AUnLWP5R4G2/5k=;
 b=EvoXJQngTCXv/fbXPmp8L1KB2yIXn04J1d8W6MjPXoh7oLZp8eDVeAVElmdP9aqK/i
 MJBR2Ivzw4dIw39ImVPdh39gKlJFzz6e8csJdiBlroJhd+CcYIKWmL2xYogcHvf8dTBR
 qXvA6mIbhbjfs54zmLkjyqlOkx6N6xSmoQKR59FiD9DNTRj+JsQnQu7WP2i0DeZrFxzy
 Gfs0QJyb9TwnnrlDCVVmlyLiz6VO/C/tD4QnvQfiqq3QTZpFIPIis80+AliWcOEKnQVk
 vcQ8ujXofjGltMU/lxhWJnEibIG2eFw+u8M51BUU3FtXJ7cqJZYGUDJY7trmp8tClChl
 fWpg==
X-Gm-Message-State: AOAM5303nVres4dnpu4XnrqeYRpbOaATE1qhhc9B2zVuof+3J0fDrgo8
 l6iQa3Kxau9ugzFiwv2C3pHMI4cNqZ9BvalNVEA=
X-Google-Smtp-Source: ABdhPJymaKkQlxcyNPW6zOeC4TD5X2V7fhc83Rnpp845ZGIIwgeCaeoHiOV0CUEgagYSg+zmGmJdgbiXneZ27e5rGqQ=
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr4223867eds.366.1600783624124; 
 Tue, 22 Sep 2020 07:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <1600773099-32693-1-git-send-email-wangqing@vivo.com>
In-Reply-To: <1600773099-32693-1-git-send-email-wangqing@vivo.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Tue, 22 Sep 2020 16:06:52 +0200
Message-ID: <CAD=4a=URYhNswOBfBj39b00HWR3vWeHF9ntP-n_SPa94YJZbTg@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/radeon: fix spellint typo in comments
To: Wang Qing <wangqing@vivo.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============2068324449=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2068324449==
Content-Type: multipart/alternative; boundary="000000000000473cc505afe77b46"

--000000000000473cc505afe77b46
Content-Type: text/plain; charset="UTF-8"

There is a typo in your patch subject. ;-)

Regards
//Ernst

Den tis 22 sep. 2020 kl 15:11 skrev Wang Qing <wangqing@vivo.com>:

> Modify the comment typo: "definately" -> "definitely".
>
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/gpu/drm/radeon/radeon_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_vm.c
> b/drivers/gpu/drm/radeon/radeon_vm.c
> index f60fae0..3d6e2cd
> --- a/drivers/gpu/drm/radeon/radeon_vm.c
> +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> @@ -188,7 +188,7 @@ struct radeon_fence *radeon_vm_grab_id(struct
> radeon_device *rdev,
>             vm_id->last_id_use == rdev->vm_manager.active[vm_id->id])
>                 return NULL;
>
> -       /* we definately need to flush */
> +       /* we definitely need to flush */
>         vm_id->pd_gpu_addr = ~0ll;
>
>         /* skip over VMID 0, since it is the system VM */
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>

--000000000000473cc505afe77b46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">There is a typo in your patch subject. ;-)</div><div cl=
ass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br>=
</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,san=
s-serif">Regards</div><div class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif">//Ernst<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Den tis 22 sep. 2020 kl 15:11 skr=
ev Wang Qing &lt;<a href=3D"mailto:wangqing@vivo.com">wangqing@vivo.com</a>=
&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Modify the=
 comment typo: &quot;definately&quot; -&gt; &quot;definitely&quot;.<br>
<br>
Signed-off-by: Wang Qing &lt;<a href=3D"mailto:wangqing@vivo.com" target=3D=
"_blank">wangqing@vivo.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/radeon/radeon_vm.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/ra=
deon_vm.c<br>
index f60fae0..3d6e2cd<br>
--- a/drivers/gpu/drm/radeon/radeon_vm.c<br>
+++ b/drivers/gpu/drm/radeon/radeon_vm.c<br>
@@ -188,7 +188,7 @@ struct radeon_fence *radeon_vm_grab_id(struct radeon_de=
vice *rdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_id-&gt;last_id_use =3D=3D rdev=
-&gt;vm_manager.active[vm_id-&gt;id])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* we definately need to flush */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* we definitely need to flush */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm_id-&gt;pd_gpu_addr =3D ~0ll;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* skip over VMID 0, since it is the system VM =
*/<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/amd-gfx</a><br>
</blockquote></div>

--000000000000473cc505afe77b46--

--===============2068324449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2068324449==--
