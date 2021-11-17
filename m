Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B020345425B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 09:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D27E6E288;
	Wed, 17 Nov 2021 08:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2971689A9B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 04:49:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t30so2004047wra.10
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 20:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SfIdXE0WH+/vIFSkVKDBCLo6eJWcG5HuZohaE9rO5FE=;
 b=Oe+e/sDCKFuptOI1R/2z/UM/mHtttdRGjWwleMKqctj2Wf4SoRKop9H3Mi2Wzl5xbo
 AHNNUcqpPUjyMkApw01c14MFeEREymki1Pk899vBJ5B8B4+FYKrwk6BhOsRGORqo0LnM
 9PjcwiFgoUX9AUpE/a8YEtI91D179FqqrXCqBu3wzQ48tLnznMxjVjUO2/uBeP28fPc1
 1SNqre4QSSBnyPVMSRHz7qEHNdwVmhzDGkekgjsgmOY1vBgq3r5tHrjQOpE1OOnMyG4T
 fxyTUGn8/vMwxFTrFII7tRmzLplhAZZCAzSbAU5nTvORJu/Tq/xmlaPyjc2/6qrUQc+a
 J9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SfIdXE0WH+/vIFSkVKDBCLo6eJWcG5HuZohaE9rO5FE=;
 b=ZizfjU+5o3BfHwGFlUsRs44kR+55P7KTJS5TkjGcuoPbOEukcR34jpkfspAhg4CxqY
 vZ0I9REn+ujy71F9cRVxatxoVNj5jc0uKMnc6WlvhqRlTkuxUTixxgq0bNsEida79WXI
 U4COE75eFQjTBLeQLORap5wJYnAfZaA08vQlkv5AnaKJa+uJYNTNBnjuCq/siEO2O4u7
 HvbV+o6Ty+DuficwiDKbQeG3ax3kT/D4bFNK27eME0ILANgKG6MlJ+2jQNEs/NJHCvEu
 1ZJQlyhQuep6+cUHT7DFO5KGJ/5PFPtx1mWugKL1jn2V3xdUg+I2icIztDlwgTCJXIlS
 bhPQ==
X-Gm-Message-State: AOAM533Y9wK8Lab9UjIknYJgCFSxnFy1H8sirLVSqqOAH8R+mmDL5pOz
 wh878XDjj369tmjZ83TjTyJhB1xIyZux/AVGr6vvXQ==
X-Google-Smtp-Source: ABdhPJxQ3qZAVfu+Dz14uYsbaod77tvxJAf5kFUiRHrgGfeGI1lRy0qeP/GcKrerbX7iPzmGxatZqtj/YmrIWd0onO4=
X-Received: by 2002:adf:e984:: with SMTP id h4mr16600543wrm.149.1637124592648; 
 Tue, 16 Nov 2021 20:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20211117020724.2647769-1-pcc@google.com>
In-Reply-To: <20211117020724.2647769-1-pcc@google.com>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Tue, 16 Nov 2021 22:49:40 -0600
Message-ID: <CA+_AqisE1yMvkPvRtp-8ZxMSpuwmfTrETkomfQHgSM-sEazuaQ@mail.gmail.com>
Subject: Re: [PATCH] lontium-lt9611: check a different register bit for HDMI
 sensing
To: Peter Collingbourne <pcc@google.com>
Content-Type: multipart/alternative; boundary="000000000000cc5a4605d0f4c521"
X-Mailman-Approved-At: Wed, 17 Nov 2021 08:08:06 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000cc5a4605d0f4c521
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry,

May be this is the reason of my HP monitor not working in RB5.

Regards,
Anibal

El mar., 16 de noviembre de 2021 20:07, Peter Collingbourne <pcc@google.com=
>
escribi=C3=B3:

> It has been observed that with certain monitors such as the HP Z27n,
> the register 0x825e reads a value of 0x79 when the HDMI cable is
> connected and 0x78 when it is disconnected, i.e. bit 0 appears
> to correspond to the HDMI connection status and bit 2 is never
> set. Therefore, change the driver to check bit 0 instead of bit 2.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> Link:
> https://linux-review.googlesource.com/id/I7e76411127e1ce4988a3f6d0c8ba5f1=
c3d880c23
> ---
> N.B. I don't currently have easy access to a monitor that works
> with the existing driver, so it would be great if people with
> monitors that currently work could test this patch to make sure
> that it doesn't introduce any regressions. Otherwise I will change
> it to check both bits.
>
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c
> b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 29b1ce2140ab..71f1db802916 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -586,7 +586,7 @@ lt9611_connector_detect(struct drm_connector
> *connector, bool force)
>         int connected =3D 0;
>
>         regmap_read(lt9611->regmap, 0x825e, &reg_val);
> -       connected  =3D (reg_val & BIT(2));
> +       connected  =3D (reg_val & BIT(0));
>
>         lt9611->status =3D connected ?  connector_status_connected :
>                                 connector_status_disconnected;
> @@ -926,7 +926,7 @@ static enum drm_connector_status
> lt9611_bridge_detect(struct drm_bridge *bridge)
>         int connected;
>
>         regmap_read(lt9611->regmap, 0x825e, &reg_val);
> -       connected  =3D reg_val & BIT(2);
> +       connected  =3D reg_val & BIT(0);
>
>         lt9611->status =3D connected ?  connector_status_connected :
>                                 connector_status_disconnected;
> --
> 2.34.0.rc1.387.gb447b232ab-goog
>
>

--000000000000cc5a4605d0f4c521
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Dmitry,</div><div dir=3D"auto"><br></di=
v>May be this is the reason of my HP monitor not working in RB5.<div dir=3D=
"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto">Anibal</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">El mar., 16 de noviembre de 2021 20:07, Peter Collingbourne &lt;<a href=
=3D"mailto:pcc@google.com">pcc@google.com</a>&gt; escribi=C3=B3:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">It has been observed that with certain monito=
rs such as the HP Z27n,<br>
the register 0x825e reads a value of 0x79 when the HDMI cable is<br>
connected and 0x78 when it is disconnected, i.e. bit 0 appears<br>
to correspond to the HDMI connection status and bit 2 is never<br>
set. Therefore, change the driver to check bit 0 instead of bit 2.<br>
<br>
Signed-off-by: Peter Collingbourne &lt;<a href=3D"mailto:pcc@google.com" ta=
rget=3D"_blank" rel=3D"noreferrer">pcc@google.com</a>&gt;<br>
Link: <a href=3D"https://linux-review.googlesource.com/id/I7e76411127e1ce49=
88a3f6d0c8ba5f1c3d880c23" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://linux-review.googlesource.com/id/I7e76411127e1ce4988a3f6d0c8ba5f1c3d=
880c23</a><br>
---<br>
N.B. I don&#39;t currently have easy access to a monitor that works<br>
with the existing driver, so it would be great if people with<br>
monitors that currently work could test this patch to make sure<br>
that it doesn&#39;t introduce any regressions. Otherwise I will change<br>
it to check both bits.<br>
<br>
=C2=A0drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/brid=
ge/lontium-lt9611.c<br>
index 29b1ce2140ab..71f1db802916 100644<br>
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c<br>
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c<br>
@@ -586,7 +586,7 @@ lt9611_connector_detect(struct drm_connector *connector=
, bool force)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int connected =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_read(lt9611-&gt;regmap, 0x825e, &amp;reg=
_val);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0connected=C2=A0 =3D (reg_val &amp; BIT(2));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0connected=C2=A0 =3D (reg_val &amp; BIT(0));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt9611-&gt;status =3D connected ?=C2=A0 connect=
or_status_connected :<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connector_status_disconnected;<br>
@@ -926,7 +926,7 @@ static enum drm_connector_status lt9611_bridge_detect(s=
truct drm_bridge *bridge)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int connected;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_read(lt9611-&gt;regmap, 0x825e, &amp;reg=
_val);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0connected=C2=A0 =3D reg_val &amp; BIT(2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0connected=C2=A0 =3D reg_val &amp; BIT(0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt9611-&gt;status =3D connected ?=C2=A0 connect=
or_status_connected :<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connector_status_disconnected;<br>
-- <br>
2.34.0.rc1.387.gb447b232ab-goog<br>
<br>
</blockquote></div>

--000000000000cc5a4605d0f4c521--
