Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C873754E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 21:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610DE10E382;
	Tue, 20 Jun 2023 19:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E9310E382
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687290512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98xuXuVLn9XybwOpWpTJYa1/rj85cDhPpkAJrZt6IOU=;
 b=eH4I0SH4C/4RIlMIYz0hGt8+zFEGOcLLTWlZzruT1hBocrXcZNgdX+F2okI2/aWPYyMcpw
 SpBB/in481sHqHpfqXcFgxjZwKjwL1Id867dLsHKiRGD2mgjY74qpo6/MHrczlRcSVGn9n
 X4AcsdDhJ661f8MDaKYfRYwZE1KV+qg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-f7k85dBcPqykNZpwsKjlVA-1; Tue, 20 Jun 2023 15:48:30 -0400
X-MC-Unique: f7k85dBcPqykNZpwsKjlVA-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3fde993d00cso44758591cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 12:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687290507; x=1689882507;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7pbs/drRG44RLScvDGDXcKRWX9zC+yqJe8PG2S8eHDE=;
 b=j5cJQtu6pW2bkC0qMViDE4u4sZhxXzwIZ/U2XgML3qJBzlF2so1q/Hxmy5DBmVUNAt
 0jnbovgdDQe3ytAH38mAqE7uviPMciPcPsnJsyBeMxFKrWFnzx13FDFvKVwJJeht9mb9
 vVpnR8NPuKHOE/qMQNF7KrARKt2ryXINzzRFHEs2oHOpUHn7LyPqOkywXepLRbgQ3uT6
 cCVonJHSxSaqayA8MByS4Lgi/zFeBUUr82pvzNvJo2RJ+GJuiHWe3W+ubOv5JoOo2Krl
 u4BdgntZY1/Lum+DEhc4eHaTOPUNV8djHMPwliTYYUItD7uKq0wTUjj7AGC2yB+EgEqC
 dDfQ==
X-Gm-Message-State: AC+VfDyjHFSSXV4gNhnW4RRj67N+yKPl7+MYnZYy17IK1Gdzyh106R5x
 18OgvG5vEUkqV9jh8WQWq0AV2dMQlEqfVylVe7vzvdaReJL2RnM8WbJ0LuRC0YOLqhJAnue8G0J
 UrupL4L7Ioyu4T0VcvhXlY2USvk0A
X-Received: by 2002:a05:622a:20d:b0:3f1:f14f:9fd2 with SMTP id
 b13-20020a05622a020d00b003f1f14f9fd2mr18898895qtx.48.1687290506991; 
 Tue, 20 Jun 2023 12:48:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4jeBZTU0kuiEsqkwtXQwJW6Ls0KhS80FffxQr7jYvYxqdSCiAQi086/7Hz51hwkvfeeU6I9A==
X-Received: by 2002:a05:622a:20d:b0:3f1:f14f:9fd2 with SMTP id
 b13-20020a05622a020d00b003f1f14f9fd2mr18898879qtx.48.1687290506768; 
 Tue, 20 Jun 2023 12:48:26 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 ew4-20020a05622a514400b003fddfbc6e06sm1445151qtb.96.2023.06.20.12.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 12:48:26 -0700 (PDT)
Message-ID: <b441d8e53c9b5e95da447b3681bb9143448388fc.camel@redhat.com>
Subject: Re: [PATCH] drm/display/dp_mst: Fix missing check for return value
 of drm_atomic_get_mst_payload_state()
From: Lyude Paul <lyude@redhat.com>
To: Chenyuan Mi <cymi20@fudan.edu.cn>, airlied@gmail.com
Date: Tue, 20 Jun 2023 15:48:25 -0400
In-Reply-To: <20230614160911.121716-1-cymi20@fudan.edu.cn>
References: <20230614160911.121716-1-cymi20@fudan.edu.cn>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
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
Cc: jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wayne.Lin@amd.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hm, I suppose it's not -impossible- for this to return NULL, but if it does
return NULL that absolutely means something broke well before this point in
the code. More comments below:

On Wed, 2023-06-14 at 09:09 -0700, Chenyuan Mi wrote:
> The drm_atomic_get_mst_payload_state() function may
> return NULL, which may cause null pointer deference,
> and most other callsites of drm_atomic_get_mst_payload_state()
> do Null check. Add Null check for return value of
> drm_atomic_get_mst_payload_state().
>=20
> Found by our static analysis tool.
>=20
> Signed-off-by: Chenyuan Mi <cymi20@fudan.edu.cn>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 38dab76ae69e..27f4bcf409ea 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4434,6 +4434,8 @@ void drm_dp_mst_atomic_wait_for_dependencies(struct=
 drm_atomic_state *state)
> =20
>  =09=09=09new_payload =3D drm_atomic_get_mst_payload_state(new_mst_state,
>  =09=09=09=09=09=09=09=09       old_payload->port);
> +=09=09=09if (!new_payload)
> +=09=09=09=09continue;

Could you change this check to:

=09if (drm_WARN_ON(state->dev, !new_payload))

>  =09=09=09new_payload->vc_start_slot =3D old_payload->vc_start_slot;
>  =09=09}
>  =09}

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

