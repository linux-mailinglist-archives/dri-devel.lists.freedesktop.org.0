Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D0B918739
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE4D89F31;
	Wed, 26 Jun 2024 16:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Oa0dXv8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA02489D39
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719418983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q7qfR7R4wqV/FoH9GarzUSCtfbCbX7/C78uXUxoeHNc=;
 b=Oa0dXv8oOs2nqK2H0xk4A0NSAY8krEdVQlaam++8vm5ql6ViJc1LldBO8aztQ6OTFPFpS2
 e68E0QVfUtkQrYc5Xdm5Jn6mi5xBmY3FMZmyaLcffKSW5VsFdhYM5H6EjgBbsV3GFgOK60
 RpvCf7Vf5R3bqpneGCmz9NMcB95V4fY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-qrB2MesJMLW2_RPRMzZm4g-1; Wed, 26 Jun 2024 12:23:01 -0400
X-MC-Unique: qrB2MesJMLW2_RPRMzZm4g-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6b50a228363so98494926d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719418980; x=1720023780;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JuoTJ79gACgiKUQpe7k7Io37YwVqSEgfRMaeyg7Zvos=;
 b=KTtquOHkfO2r1f1vtiU9fe4S5LDLvngcXE9kXKPPeBK5DYBCqm88sgBG8I6wC+ojje
 MUi4avY+Bs0ioKHYJ7aMmSJu3l5ufDaP/H81MtTkmQ5qq+XnrvpAsYhvpQSF2ylynzH+
 rj4OCi26E9xOG72nUWHXPcuXfZzhGwmO15OKatIWUJZ72CJYYtgz27BCeMuOY6pEZUCs
 VKJk9aiFBw7wYBY77l2fMQ3duNH6LoAaty+8E3YY1Opd0vyeEEWBcMnKplo8i8QbjT4S
 6Iq2bUhP7p/xqGFQdpVUGujABgCEzpE2Uk6n+a2cn+hZlH6WIGR49Oe31+XuncCGUWYZ
 D1vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1P2ybI/56rwRTTCF/hYS2G4UGUXgTv0WoLLguRVTnyzCCSfF4hI7R0j37vU7RPLLXCUt/Goe6L4mKr3YpPOKuxW8T6Lqjl8w1JjSaZKT3
X-Gm-Message-State: AOJu0YxabfXLKkYK8XtAs2v+5TZ7m80VrP2WvsJGb/+e8J7ml3aB2hKB
 8ognJ7bhsCChemthmfPZrdQ85BhNZrsTSBVKn8Pwd+bVMaDc83AmsInTVhrHsk13Q7VIXucRaxk
 LTQ5NbbV+3EV6FeEPDVtS6wGAhf8m0n68oTJP8DAXalZh7vh/QHqMPIYh0IdPWAncR/4B0yqqtg
 ==
X-Received: by 2002:a0c:f64d:0:b0:6b2:a2bb:df2d with SMTP id
 6a1803df08f44-6b58d706835mr1509716d6.48.1719418980500; 
 Wed, 26 Jun 2024 09:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEndPS6fn5RzMS1/6Ml0GKhbz5cKUSuQGVRP877/iF2ldPCLzprf0ZZqKl5nq4TqTtPQjLg/g==
X-Received: by 2002:a0c:f64d:0:b0:6b2:a2bb:df2d with SMTP id
 6a1803df08f44-6b58d706835mr1509486d6.48.1719418980212; 
 Wed, 26 Jun 2024 09:23:00 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c4c:a000::789])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef5c3c1sm55634406d6.120.2024.06.26.09.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:22:59 -0700 (PDT)
Message-ID: <61bab346f145a529a61e5366fb39f424512e5a5c.camel@redhat.com>
Subject: Re: [PATCH 1/3] drm/dp_mst: Fix all mstb marked as not probed after
 suspend/resume
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, daniel@ffwll.ch, 
 Harry.Wentland@amd.com, jerry.zuo@amd.com, Harry Wentland
 <hwentlan@amd.com>,  stable@vger.kernel.org
Date: Wed, 26 Jun 2024 12:22:58 -0400
In-Reply-To: <20240626084825.878565-2-Wayne.Lin@amd.com>
References: <20240626084825.878565-1-Wayne.Lin@amd.com>
 <20240626084825.878565-2-Wayne.Lin@amd.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40)
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

Thanks!

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2024-06-26 at 16:48 +0800, Wayne Lin wrote:
> [Why]
> After supend/resume, with topology unchanged, observe that
> link_address_sent of all mstb are marked as false even the topology
> probing
> is done without any error.
>=20
> It is caused by wrongly also include "ret =3D=3D 0" case as a probing
> failure
> case.
>=20
> [How]
> Remove inappropriate checking conditions.
>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: stable@vger.kernel.org
> Fixes: 37dfdc55ffeb ("drm/dp_mst: Cleanup drm_dp_send_link_address()
> a bit")
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
> =C2=A0drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 7f8e1cfbe19d..68831f4e502a 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -2929,7 +2929,7 @@ static int drm_dp_send_link_address(struct
> drm_dp_mst_topology_mgr *mgr,
> =C2=A0
> =C2=A0=09/* FIXME: Actually do some real error handling here */
> =C2=A0=09ret =3D drm_dp_mst_wait_tx_reply(mstb, txmsg);
> -=09if (ret <=3D 0) {
> +=09if (ret < 0) {
> =C2=A0=09=09drm_err(mgr->dev, "Sending link address failed with
> %d\n", ret);
> =C2=A0=09=09goto out;
> =C2=A0=09}
> @@ -2981,7 +2981,7 @@ static int drm_dp_send_link_address(struct
> drm_dp_mst_topology_mgr *mgr,
> =C2=A0=09mutex_unlock(&mgr->lock);
> =C2=A0
> =C2=A0out:
> -=09if (ret <=3D 0)
> +=09if (ret < 0)
> =C2=A0=09=09mstb->link_address_sent =3D false;
> =C2=A0=09kfree(txmsg);
> =C2=A0=09return ret < 0 ? ret : changed;

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

