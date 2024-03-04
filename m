Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB126870AB4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 20:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E0F1124F3;
	Mon,  4 Mar 2024 19:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Agr6VtE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1391124F3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 19:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709580612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8dLd+GZaX5/4cKjDkI57lirpYB8GYRX7nGN2Egm1q9A=;
 b=Agr6VtE4phbzPKZ4D3AVhXWFTUm+CVi+O5OnYj3ssGMEaIVMLq1KUpzxuBv+usO6D3ux9o
 HrAI3OQtWU0Ip6FuXpwp6aBPaL9HmbCWEzRB7lpYZrAa8wIAN6ZhRf2zWKEpd5MKCpu+c3
 7i9867e5Yu5HBdd/Lt8d61jrnhBJLVc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-M_Y1vEb6MF2xR-OxgBFzqg-1; Mon, 04 Mar 2024 14:30:11 -0500
X-MC-Unique: M_Y1vEb6MF2xR-OxgBFzqg-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-68fa064556eso49445696d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 11:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709580610; x=1710185410;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eZiRoNZpJWWKK/cOdoxLY/19xwv2y7y2vYTfMraz1OY=;
 b=rTKL5a1ODs5kRQG4F7dZzJHz1q8WeM/w9SgS6hGlHpqQGzUtQ/NznqbL+IdmOAKrJo
 krUx7QqIbJxpp6x2pyTptUGWjbWzYIwdANXwriCBHObma1nKCnTTA71xcxs05aK8n/5k
 AKM36e0Qm75bLKhgeQ5bykrRIW3RTbw2OZ6xTLmGsEMxkOYn2Vic9Ai3b9qaRlI09f7y
 X73B3CV+jyW2IreN/vAxgweFf7OcUqJmW09y73PA5PGwK4pfuT6gKrdsigb1/x5LsT5G
 8w9Ryo/8jnqXdUH7JTee60xzfktIXdufNPtgA8j3jL6A4eh+BVkY6cM6RgKEitsvxEff
 LbKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPVRaikozce07oU+fV5yy8HNjUuhhr9P/Rl2eESiw2kgXKYEszwPb9tw+3nAH1ZLR4soJCcx6GVP0NDnfTtNnO9UyB8m2TjG/oCghacS08
X-Gm-Message-State: AOJu0YxrrW6j/DPSxydZEC9jXVw+xiwZmLY6CYnswhKDZSkfdX+X01kh
 YfRJi4BMO/sfTW+h9jx9noEuZQxKgcge9ue7KWtSrAcSBdu1JPP0bHEW+fp9udnj7MxjeQ1vshi
 /X7+sWty1K+GXZ9el6kS1nmMMBfRvnHDhruMpZFmAYT/QNn+mCz98lnymDxk39xijww==
X-Received: by 2002:a0c:e6a4:0:b0:690:4724:777c with SMTP id
 j4-20020a0ce6a4000000b006904724777cmr10059767qvn.35.1709580610628; 
 Mon, 04 Mar 2024 11:30:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQoAv9sj9nxd+niUS6DSSnJifmdH5VWrZcwBNdh3HO60CPXPf5TWq0bZW09NJkHf71aBle2Q==
X-Received: by 2002:a0c:e6a4:0:b0:690:4724:777c with SMTP id
 j4-20020a0ce6a4000000b006904724777cmr10059744qvn.35.1709580610325; 
 Mon, 04 Mar 2024 11:30:10 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 qj22-20020a056214321600b0068f73372424sm5418384qvb.90.2024.03.04.11.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 11:30:09 -0800 (PST)
Message-ID: <14f1d3efc0bef057a51748db6fe95fcd22f3b34c.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau: fix stale locked mutex in
 nouveau_gem_ioctl_pushbuf
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Mon, 04 Mar 2024 14:30:08 -0500
In-Reply-To: <20240304183157.1587152-1-kherbst@redhat.com>
References: <20240304183157.1587152-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2024-03-04 at 19:31 +0100, Karol Herbst wrote:
> If VM_BIND is enabled on the client the legacy submission ioctl can't be
> used, however if a client tries to do so regardless it will return an
> error. In this case the clients mutex remained unlocked leading to a
> deadlock inside nouveau_drm_postclose or any other nouveau ioctl call.
>=20
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Cc: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouv=
eau/nouveau_gem.c
> index 49c2bcbef1299..5a887d67dc0e8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -764,7 +764,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, voi=
d *data,
>  =09=09return -ENOMEM;
> =20
>  =09if (unlikely(nouveau_cli_uvmm(cli)))
> -=09=09return -ENOSYS;
> +=09=09return nouveau_abi16_put(abi16, -ENOSYS);
> =20
>  =09list_for_each_entry(temp, &abi16->channels, head) {
>  =09=09if (temp->chan->chid =3D=3D req->channel) {

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

