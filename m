Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564D7513822
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 17:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8AE10E107;
	Thu, 28 Apr 2022 15:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390E510E107
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 15:19:54 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id m20so10209285ejj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 08:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qS0RYEubj/WEr+tBfiyT1mscJrdXnWl5GKBmmuMBcCc=;
 b=o7gGmN1K53qTHzZPZiZUP82W+AEVP8i01imwcRltNcX5PTXUy++fSzThNEJUwIWH+t
 nO5IPCD40xJtBMIxfrH0LZ1ToxqMW3mQVx/Wbua1/udsEiyRxifK0A48RSBjZbxGi80y
 TIQ2fWQOMRJV64I0ymp1EzgFylizXkv7TW8c0YINfkY5AW2/57TLmq36GzPLQwgaIFfG
 HbOZ+Jv98cYZ7i7vFBmz/GnzMGfM2LAM7HzBF0Icto7SxE4M8aUaSK2O979dc5A7SqJ+
 dpjmB3V/gQ0YDTonel66eIWmjAUHCPX1UIsljRbkPLqRiyRr85npkuhG0H7jn66uIf9+
 LG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qS0RYEubj/WEr+tBfiyT1mscJrdXnWl5GKBmmuMBcCc=;
 b=2p+k/UC5hUDT+Ol3Pw7Kq/gzZJ2dT9/RNDQP7zUETflrNl5HTmn2zYkU7GuIVXGd6q
 zLgZp7Md7MN8bv7OfFeIgMcdxtQC3hJMM6RLhoJIl24a+WnCTVhdT3eeYrZ5VzIjCmgK
 aCqOTtdulk0Jzs/HEy0MfXc6EOxYgyDU9nLltVisU1+SvMPxbr1pUpKnebVkX0O4p13q
 FHtKgZAxjWbrBXYDzawUUwpV2mhsKXSi4evqbGDO5vANi1x67wdW7E6V/MyTcE+/v5s0
 gIo5EwB+iw3GiwLI8q3NaxjoEmmxk5KdTVFWBE2/TAwBSqL4lQ0/zHj5a1v4fHDfct6U
 PN1g==
X-Gm-Message-State: AOAM530pG0cPCbzdqTJ8v/A+obsnUrXcbCk4j+TqXKfUsJnaG3BlvlFl
 YdNH9p/7lhrt4adFUKKb0qY=
X-Google-Smtp-Source: ABdhPJy107+0PxRUcY57JeQXLnVh3ZgSwQ9hDo5Ig9/OMcKPwYWANWxK0XlKKHqHHr2jEYKdy/mFZw==
X-Received: by 2002:a17:907:6284:b0:6e0:f895:15a with SMTP id
 nd4-20020a170907628400b006e0f895015amr32459790ejc.713.1651159192359; 
 Thu, 28 Apr 2022 08:19:52 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 ao9-20020a170907358900b006f3995f0fe0sm107256ejc.6.2022.04.28.08.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 08:19:51 -0700 (PDT)
Date: Thu, 28 Apr 2022 17:19:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH v2 2/4] drm/nvdla: Add driver support for NVDLA
Message-ID: <YmqwlbLcFgTDUpkX@orome>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <20220426060808.78225-3-cai.huoqing@linux.dev>
 <YmqwNVoTZZFaIM9S@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xJwzd/BOTwcSuCe5"
Content-Disposition: inline
In-Reply-To: <YmqwNVoTZZFaIM9S@orome>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xJwzd/BOTwcSuCe5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2022 at 05:18:13PM +0200, Thierry Reding wrote:
> On Tue, Apr 26, 2022 at 02:07:59PM +0800, Cai Huoqing wrote:
> [...]
> > diff --git a/drivers/gpu/drm/nvdla/nvdla_drv.c b/drivers/gpu/drm/nvdla/=
nvdla_drv.c
>=20
> I'll look at this from an architectural level and leave it to other
> experts to review the more technical things.
>=20
> [...]
> > +static struct nvdla_config nvdla_config_os_initial =3D {
> > +	.atom_size =3D 32,
> > +	.bdma_enable =3D true,
> > +	.rubik_enable =3D true,
> > +	.weight_compress_support =3D true,
> > +};
> > +
> > +static struct nvdla_config nvdla_config_small =3D {
> > +	//.atom_size =3D 8,
> > +	.atom_size =3D 32,  // nv_large config
> > +	.bdma_enable =3D false,
> > +	.rubik_enable =3D false,
> > +	.weight_compress_support =3D false,
> > +};
> > +
> [...]
> > +static union nvdla_operation_container operation_desc[NVDLA_OP_NUM][NV=
DLA_NUM_GROUPS];
> > +static union nvdla_surface_container surface_desc[NVDLA_OP_NUM][NVDLA_=
NUM_GROUPS];
> > +
> > +static struct nvdla_task_desc global_task;
> > +
> > +static struct nvdla_engine engine =3D {
> > +	.processors[NVDLA_OP_BDMA] =3D {
> > +		.name =3D "BDMA",
> > +		.op_type =3D NVDLA_OP_BDMA,
> > +		.program =3D nvdla_bdma_program,
> > +		.enable =3D nvdla_bdma_enable,
> > +		.set_producer =3D nvdla_bdma_set_producer,
> > +		.is_ready =3D nvdla_bdma_is_ready,
> > +		.dump_config =3D nvdla_bdma_dump_config,
> > +		.rdma_check =3D nvdla_bdma_rdma_check,
> > +		.consumer_ptr =3D 0,
> > +		.roi_index =3D 0,
> > +		.group_status =3D 0,
> > +		.rdma_status =3D 0,
> > +		.last_group =3D 1,
> > +		.groups[0] =3D {
> > +			.id =3D 0,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_BDMA][0],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_BDMA][0],
> > +		},
> > +		.groups[1] =3D {
> > +			.id =3D 1,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_BDMA][1],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_BDMA][1],
> > +		},
> > +	},
> > +	.processors[NVDLA_OP_CONV] =3D {
> > +		.name =3D "Convolution",
> > +		.op_type =3D NVDLA_OP_CONV,
> > +		.program =3D nvdla_conv_program,
> > +		.enable =3D nvdla_conv_enable,
> > +		.set_producer =3D nvdla_conv_set_producer,
> > +		.is_ready =3D nvdla_conv_is_ready,
> > +		.dump_config =3D nvdla_conv_dump_config,
> > +		.rdma_check =3D nvdla_conv_rdma_check,
> > +		.consumer_ptr =3D 0,
> > +		.roi_index =3D 0,
> > +		.group_status =3D 0,
> > +		.rdma_status =3D 0,
> > +		.last_group =3D 1,
> > +		.groups[0] =3D {
> > +			.id =3D 0,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_CONV][0],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_CONV][0],
> > +		},
> > +		.groups[1] =3D {
> > +			.id =3D 1,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_CONV][1],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_CONV][1],
> > +		},
> > +	},
> > +	.processors[NVDLA_OP_SDP] =3D {
> > +		.name =3D "SDP",
> > +		.op_type =3D NVDLA_OP_SDP,
> > +		.program =3D nvdla_sdp_program,
> > +		.enable =3D nvdla_sdp_enable,
> > +		.set_producer =3D nvdla_sdp_set_producer,
> > +		.is_ready =3D nvdla_sdp_is_ready,
> > +		.dump_config =3D nvdla_sdp_dump_config,
> > +		.rdma_check =3D nvdla_sdp_rdma_check,
> > +		.consumer_ptr =3D 0,
> > +		.roi_index =3D 0,
> > +		.group_status =3D 0,
> > +		.rdma_status =3D 0,
> > +		.last_group =3D 1,
> > +		.groups[0] =3D {
> > +			.id =3D 0,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_SDP][0],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_SDP][0],
> > +		},
> > +		.groups[1] =3D {
> > +			.id =3D 1,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_SDP][1],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_SDP][1],
> > +		},
> > +	},
> > +	.processors[NVDLA_OP_PDP] =3D {
> > +		.name =3D "PDP",
> > +		.op_type =3D NVDLA_OP_PDP,
> > +		.program =3D nvdla_pdp_program,
> > +		.enable =3D nvdla_pdp_enable,
> > +		.set_producer =3D nvdla_pdp_set_producer,
> > +		.is_ready =3D nvdla_pdp_is_ready,
> > +		.dump_config =3D nvdla_pdp_dump_config,
> > +		.rdma_check =3D nvdla_pdp_rdma_check,
> > +		.consumer_ptr =3D 0,
> > +		.roi_index =3D 0,
> > +		.group_status =3D 0,
> > +		.rdma_status =3D 0,
> > +		.last_group =3D 1,
> > +		.groups[0] =3D {
> > +			.id =3D 0,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_PDP][0],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_PDP][0],
> > +		},
> > +		.groups[1] =3D {
> > +			.id =3D 1,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_PDP][1],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_PDP][1],
> > +		},
> > +	},
> > +	.processors[NVDLA_OP_CDP] =3D {
> > +		.name =3D "CDP",
> > +		.op_type =3D NVDLA_OP_CDP,
> > +		.program =3D nvdla_cdp_program,
> > +		.enable =3D nvdla_cdp_enable,
> > +		.set_producer =3D nvdla_cdp_set_producer,
> > +		.is_ready =3D nvdla_cdp_is_ready,
> > +		.dump_config =3D nvdla_cdp_dump_config,
> > +		.rdma_check =3D nvdla_cdp_rdma_check,
> > +		.consumer_ptr =3D 0,
> > +		.roi_index =3D 0,
> > +		.group_status =3D 0,
> > +		.rdma_status =3D 0,
> > +		.last_group =3D 1,
> > +		.groups[0] =3D {
> > +			.id =3D 0,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_CDP][0],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_CDP][0],
> > +		},
> > +		.groups[1] =3D {
> > +			.id =3D 1,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_CDP][1],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_CDP][1],
> > +		},
> > +	},
> > +
> > +	.processors[NVDLA_OP_RUBIK] =3D {
> > +		.name =3D "RUBIK",
> > +		.op_type =3D NVDLA_OP_RUBIK,
> > +		.program =3D nvdla_rubik_program,
> > +		.enable =3D nvdla_rubik_enable,
> > +		.set_producer =3D nvdla_rubik_set_producer,
> > +		.is_ready =3D nvdla_rubik_is_ready,
> > +		.dump_config =3D nvdla_rubik_dump_config,
> > +		.rdma_check =3D nvdla_rubik_rdma_check,
> > +		.consumer_ptr =3D 0,
> > +		.roi_index =3D 0,
> > +		.group_status =3D 0,
> > +		.rdma_status =3D 0,
> > +		.last_group =3D 1,
> > +		.groups[0] =3D {
> > +			.id =3D 0,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_RUBIK][0],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_RUBIK][0],
> > +		},
> > +		.groups[1] =3D {
> > +			.id =3D 1,
> > +			.rdma_id =3D 0,
> > +			.active =3D 0,
> > +			.events =3D 0,
> > +			.roi_index =3D 0,
> > +			.is_rdma_needed =3D 0,
> > +			.lut_index =3D -1,
> > +			.operation_desc =3D &operation_desc[NVDLA_OP_RUBIK][1],
> > +			.surface_desc =3D &surface_desc[NVDLA_OP_RUBIK][1],
> > +		},
> > +	},
> > +
> > +};
>=20
> These global variables aren't going to work because Tegra234 (Tegra194's
> successor) has two instances of NVDLA.

Small correction: I just recalled that even Tegra194 has two DLA
instances, so if we want both supported we'll need to get rid of those
global variables for that chip already.

Thierry

--xJwzd/BOTwcSuCe5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJqsJUACgkQ3SOs138+
s6Gpgg/9H+U035AscZ+rM3Mw++AKhE951GQ8tIbJxV6LwTW1JahCazVsrOZ/fTPL
GHMAq5XhOcoyQuolcfAyMu4F9Rb+5TiVVJTfHq0TuA3rVdYeP8czuiY6Bsch0HHM
ZU4TjTyZL2VMvECeXZfRHWQvU7FCMQ+ms8uKs6cWs5CQNSFF10Ve/FjpistPRv82
VBDJzD2UUfPA7D41OdMuaQy8z0MrTnksI+H3v50AS8PBaenF7yk0BmK5/km88X+b
dXrElDAJ1ntH8HrQyntNq+fBPoWiExdz8gXiM0PWMnW1UZRoFKraLrW3FCzl28Uy
SK5ezIatixWLdpdWfA49LxpBlKPGLoWzHGyQCrTdpFxP8rfRIpuMUtbvFfhYEkNU
N94Pb28CKyG7eWo+pg5Umc3AlWjsg8LtgC44zDYLnXymVicKHzKFs/RP0Mo6Fj6m
z+pAYZtgQnSjLqAeIUVTdrJUYgnpQ00MA3Zl1U2nJjBHZgWGyXj71fBOf4v6Ar/c
o/WoMwSbME87hEtyFzEmQGk95ed2ZlCeNACykyF9ZEPBDv1CprEzZQeDg21tM3Z1
HaZrHL1U0VFJwLnIkyFYp023OwCPQqQoXgHd3zCyOL4gp1boROMmCQYzxHxBGxeH
KJ519K56LvO/S0VRWiASqmAK2kDkfWZ15M/tR0BtDImCz4lDJ7Q=
=KfCd
-----END PGP SIGNATURE-----

--xJwzd/BOTwcSuCe5--
