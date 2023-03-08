Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE076B02EE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD7E10E5EC;
	Wed,  8 Mar 2023 09:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CC210E5EC;
 Wed,  8 Mar 2023 09:31:03 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a32so15897989ljr.9;
 Wed, 08 Mar 2023 01:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678267862;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0mD9RHfQ+H+/sYvMR53JwuBQ7X7+YVMcCbNjbk0mzJA=;
 b=dGkWisOh8q/0cQQxeZcJFdBShNVbcpexv4htNwzvfC8GER+8V9i6CJOR4vWxFvXUyb
 vZehIUEdsNMcdNcve3TsBSgxTxhTZvhFZ4kH9x+1vJzNFBhblbZQupTOx2CZB0Ur/qy7
 QcXjxFk5nF91tIHl4IE1RO+VDbM1K0Sh57fe8ztZ/iUYNCjna0pzdEDiNMb1J9IyyxR6
 veXqsWChD04TFhoTKcxkSz7bN2QIBrXIy2e/NT3iQBEg3abLhOt2/PPIE/XLPJEHmSA4
 +sstIhjGmqoCDSxTESYatgy5WkKEAff+lHrd3qNHehScDM/YKJ8/a9rKkkCA5EigzETc
 +nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678267862;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0mD9RHfQ+H+/sYvMR53JwuBQ7X7+YVMcCbNjbk0mzJA=;
 b=aR+Ew9i6TV59qab0FfDlj/JQ5UgHWZx4K4TT3wmJarcjBdhhuA6Qm/+X3H0CQ3O5eP
 SrLwK2lGQmvo4qAH5ohJBNg6NJUnAh1CkQ1ph9YoN/i5naqsEjdUgsEIh4+JAFsHuPxY
 XSgEcxWrK6e679ZqkOZ9/m+KMq6E66JxuQyY3vsazzCNEEhSn8HZ3nLCR3Z4ZjeArUQ3
 nEuPPd3oPe93a048VQONg8fi/SIdfjWdOOiYHwoI1XFCYbf9DMKKD40uI62Pi/HwskF5
 y0FCBDtslzjajhNAzcYSQBJsREJGI6q1O1v9U+skq1V2mRRU7usAM52YNid/HmIFKBor
 NSJw==
X-Gm-Message-State: AO0yUKUytYFaZbLzy1he4QbyxPDjasqDcyH5H8g8oBKJ7MMz5Rp9Eold
 5pPFCeb+H92bA/6fXrEIrRU=
X-Google-Smtp-Source: AK7set9rgVW6uHFGKvr0j6R0RF4PF94fVp7oNdl0zlxOXPP/VVTrW9kYLB818L94JcONwCkz1UYiCA==
X-Received: by 2002:a05:651c:318:b0:295:a6cb:f51c with SMTP id
 a24-20020a05651c031800b00295a6cbf51cmr4641293ljp.16.1678267861645; 
 Wed, 08 Mar 2023 01:31:01 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h12-20020a19700c000000b004e7fa99f3f4sm1804141lfc.265.2023.03.08.01.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 01:31:01 -0800 (PST)
Date: Wed, 8 Mar 2023 11:30:57 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 14/17] drm/amd/display: Add debugfs for testing
 output colorspace
Message-ID: <20230308113057.2f76b4b8@eldfell>
In-Reply-To: <20230307151107.49649-15-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-15-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q36b+EZoc9ESYqs5HwM0XuG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Joshua Ashton <joshua@froggi.es>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/q36b+EZoc9ESYqs5HwM0XuG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 10:11:04 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> In order to IGT test colorspace we'll want to print
> the currently enabled colorspace on a stream. We add
> a new debugfs to do so, using the same scheme as
> current bpc reporting.
>=20
> This might also come in handy when debugging display
> issues.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Reviewed-By: Joshua Ashton <joshua@froggi.es>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 4a5dae578d97..f0022c16b708 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -906,6 +906,61 @@ static int amdgpu_current_bpc_show(struct seq_file *=
m, void *data)
>  }
>  DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
> =20
> +/*
> + * Returns the current bpc for the crtc.

Hi,

bpc?

> + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_colo=
rspace
> + */
> +static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)


Thanks,
pq

> +{
> +	struct drm_crtc *crtc =3D m->private;
> +	struct drm_device *dev =3D crtc->dev;
> +	struct dm_crtc_state *dm_crtc_state =3D NULL;
> +	int res =3D -ENODEV;
> +
> +	mutex_lock(&dev->mode_config.mutex);
> +	drm_modeset_lock(&crtc->mutex, NULL);
> +	if (crtc->state =3D=3D NULL)
> +		goto unlock;
> +
> +	dm_crtc_state =3D to_dm_crtc_state(crtc->state);
> +	if (dm_crtc_state->stream =3D=3D NULL)
> +		goto unlock;
> +
> +	switch (dm_crtc_state->stream->output_color_space) {
> +	case COLOR_SPACE_SRGB:
> +		seq_printf(m, "RGB");
> +		break;
> +	case COLOR_SPACE_YCBCR601:
> +	case COLOR_SPACE_YCBCR601_LIMITED:
> +		seq_printf(m, "BT601_YCC");
> +		break;
> +	case COLOR_SPACE_YCBCR709:
> +	case COLOR_SPACE_YCBCR709_LIMITED:
> +		seq_printf(m, "BT709_YCC");
> +		break;
> +	case COLOR_SPACE_ADOBERGB:
> +		seq_printf(m, "opRGB");
> +		break;
> +	case COLOR_SPACE_2020_RGB_FULLRANGE:
> +		seq_printf(m, "BT2020_RGB");
> +		break;
> +	case COLOR_SPACE_2020_YCBCR:
> +		seq_printf(m, "BT2020_YCC");
> +		break;
> +	default:
> +		goto unlock;
> +	}
> +	res =3D 0;
> +
> +unlock:
> +	drm_modeset_unlock(&crtc->mutex);
> +	mutex_unlock(&dev->mode_config.mutex);
> +
> +	return res;
> +}
> +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
> +
> +
>  /*
>   * Example usage:
>   * Disable dsc passthrough, i.e.,: have dsc decoding at converver, not e=
xternal RX
> @@ -3235,6 +3290,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
>  #endif
>  	debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
>  			    crtc, &amdgpu_current_bpc_fops);
> +	debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_en=
try,
> +			    crtc, &amdgpu_current_colorspace_fops);
>  }
> =20
>  /*


--Sig_/q36b+EZoc9ESYqs5HwM0XuG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQIVdEACgkQI1/ltBGq
qqen7g/+Pxg86h53kREDIW/OWHS6AH6oSz0nRy6H61njyfg8Y2dRhy6xaX7TSkdK
lUa33/p8K/XU/igQ8pqKXkni68fqUT08KUSKcpoM+Iu8NvTYdSERSUvJeQqKElAp
5jlY/szB7FIkvwkrArjEGHER7frc4ft3z6Wq7+vIqzqj5IoaLRkJ/0Fx0KQMJIyU
5w2QVFmIX9s3An8Ueg32s6xn53VZABZmdlXHlXvPGvSyAPgDPnLSj8i89p1mwjZo
n08Ck6FLLXiRb3w6yHObleeKXM87kFEXSIYFMmEHdU/VGpJBtRajLNPALvczVKoD
xBrDPF1wzj8btQn5dnmeGJuNfeD6ySRtOvS17kOTIM68U970M//b2K9v7gjmN0Y7
+lBi8CqhNSKHlNsHOizYUyBDimI4jOCOl4M+w6C3+eqo+jgyTx0mThAJBTF7B8s6
hC3FidSHj9k96DOwhi45OVArPyJF1KYp1ssebc71iCOJUA3tn5w/93ekyu9KLH/P
Y8a5lyrbiNSuL0Ryd+LXUmZip7RXtfMYbHdffg8vnARRRFc4FANZ5n0tqwjHPywe
yc/2vxPPNMotfCjrIHtPdq6bKTTUDA3qSbAs3iq+HEPSLt5v5ZAgXS/km8USZ2A3
zeylUi45+S4DzFBxrFzR4G10dYi1NwNHOe6iNKj1R0GiMo1NQFU=
=OG8k
-----END PGP SIGNATURE-----

--Sig_/q36b+EZoc9ESYqs5HwM0XuG--
