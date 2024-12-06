Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEAC9E61BC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 01:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD7010EFEA;
	Fri,  6 Dec 2024 00:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Igpg1IWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AEF10EFEA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 00:08:23 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53e1f673ca8so1658798e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 16:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733443702; x=1734048502;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AyWqX2zoZLFRt3ry2g2R9lR3izotXfaeTSy8KYkYq3A=;
 b=Igpg1IWDZc3+s4YMii8+N/4LO+f67yO8DkrVLUV9bvea6cHBkUQbJ9bB+nZZIYUW74
 gMXX4dpXDz8XSV0DHmjsDieZz2TrajAj+zL1wu7tzg81sbc9gSls0scg0d3n3WApy5zU
 V9Ie6HjzrYweCtOEYsYoE3eiDJlAh48OoJ5by4RUiOScKXTOtOx+yqJl0Hz6sc6yJ6Ix
 vIZ6+BW4VxuF62vdKANiAxe0yj1rpRDMf0tYY4G8xDjKW7C7lejW6wAldcelcwc4idTR
 ZY38RwWNQr6/R3jyIcUuGstCuJpMe/VfAca/3O9t9bm/5krwl0pg3Wr0gJjsZPamMg0h
 1qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733443702; x=1734048502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AyWqX2zoZLFRt3ry2g2R9lR3izotXfaeTSy8KYkYq3A=;
 b=YX4kyalBRV9FcC85yRQQgLxk104sylRKJAAfZSm8hPrhxuvqDTzAzY4uXxhWfYt8C8
 pm8Fdc53uhh08RaqmdhQVAx8nI6QsvMp3ecGS4IkyXxt1uJTEXyTAvGXPYU8wdxDkztk
 7eDNsykv052I9A8arQe2nmgIoNdIDtqPod8Lb+718mIKuMmvVlXf7kIIHMDCUA7KQj7i
 t2rZM24DIlAr7wG4UwYLlV6X5BXnJPUp6/MdXQ/wLmpSJ1HHBToeRGMZq9fq58paryBt
 xi1BdRO6hAGQ4V3hYe12MkOdr09wsr3AsRPPgwB8EuOTMNgS/xjkmf3wn+I3Wo1m8cjP
 EUDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgjknEq2VWY/lVqu8UwvsCSMhFBpj2bXt0Lng74iVdurLnrhaIdPv2t8V3a8+QfWJI9B+6D+am3Ss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBoAdzzr8PMRsc6ofDFyLVY84K8DHoRM1xkttbM2j8nxCbGw84
 KDwHVVU9pUQGUpJJA56BwBp/kQNLq6eIUp6tBWAhOSNk2UXPBaoKHs2j82ybf7maLBOlfrW4WV3
 umxn2TgjevBZ9bM57UL+aqw7FxCN/vu1JL4nO
X-Gm-Gg: ASbGnctrjGuhZXZp3EJTz5RtTGiZDI6P1qPy2nUg4GnyByeIqOyF2SOPcOdhD0DUR3c
 P2rzyamJXRNJshJSZ31oPAzSGB9pP7w==
X-Google-Smtp-Source: AGHT+IEl7P8g4C6biT8pMmR7TEmB0gJQnY7JWx1axpsFaCZBcd/5qdwTwlQeic62GJWu2sWz95sDRQrA+1CjugfgIXQ=
X-Received: by 2002:a05:6512:3993:b0:53d:ed68:3cfa with SMTP id
 2adb3069b0e04-53e2c504c30mr241237e87.55.1733443701768; Thu, 05 Dec 2024
 16:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20241204221726.2247988-1-sashal@kernel.org>
 <20241204221726.2247988-8-sashal@kernel.org>
 <CAGETcx8bhzGZKge4qfpNR8FaTWqbo0-5J9c7whc3pn-RECJs3Q@mail.gmail.com>
In-Reply-To: <CAGETcx8bhzGZKge4qfpNR8FaTWqbo0-5J9c7whc3pn-RECJs3Q@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:07:45 -0800
Message-ID: <CAGETcx-6yHV5xr1j7krY8LShCF5JATX0NSwjeRUL9+3TLCMq9w@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.11 08/15] drm: display: Set fwnode for aux bus
 devices
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Thierry Reding <treding@nvidia.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 matthias.bgg@gmail.com, elder@kernel.org, ricardo@marliere.net, 
 sumit.garg@linaro.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Dec 5, 2024 at 4:06=E2=80=AFPM Saravana Kannan <saravanak@google.co=
m> wrote:
>
> On Wed, Dec 4, 2024 at 3:29=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
> >
> > From: Saravana Kannan <saravanak@google.com>
> >
> > [ Upstream commit fe2e59aa5d7077c5c564d55b7e2997e83710c314 ]
> >
> > fwnode needs to be set for a device for fw_devlink to be able to
> > track/enforce its dependencies correctly. Without this, you'll see erro=
r
> > messages like this when the supplier has probed and tries to make sure
> > all its fwnode consumers are linked to it using device links:
> >
> > mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) w=
ith backlight-lcd0
> >
> > Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca459=
8@notapiano/
> > Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
> > Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> > Link: https://lore.kernel.org/r/20241024061347.1771063-2-saravanak@goog=
le.com
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
>
> As mentioned in the original cover letter:
>
> PSA: Do not pull any of these patches into stable kernels. fw_devlink
> had a lot of changes that landed in the last year. It's hard to ensure
> cherry-picks have picked up all the dependencies correctly. If any of
> these really need to get cherry-picked into stable kernels, cc me and
> wait for my explicit Ack.
>
> Is there a pressing need for this in 4.19?

I copy pasted this into several replies. In all those cases I meant
the kernel version mentioned in the subject.

-Saravana

>
> -Saravana
>
> > ---
> >  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm=
/display/drm_dp_aux_bus.c
> > index d810529ebfb6e..ec7eac6b595f7 100644
> > --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> > +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> > @@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
> >         aux_ep->dev.parent =3D aux->dev;
> >         aux_ep->dev.bus =3D &dp_aux_bus_type;
> >         aux_ep->dev.type =3D &dp_aux_device_type_type;
> > -       aux_ep->dev.of_node =3D of_node_get(np);
> > +       device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np))=
);
> >         dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
> >
> >         ret =3D device_register(&aux_ep->dev);
> > --
> > 2.43.0
> >
