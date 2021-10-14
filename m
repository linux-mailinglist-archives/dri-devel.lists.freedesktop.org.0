Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8797642D655
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 11:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A706EC52;
	Thu, 14 Oct 2021 09:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3656EC52
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 09:44:19 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id n8so24247866lfk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=1xVXQN/RVxQgnhosr+Bz1Sj4AsEop0V8tX2Z1lL7Z4k=;
 b=FcOoAhEDog/h77KE3AT5KjDXrz+qqE+GLyZJOFbG11bQQWMsrlQw3FrYyZvXv3ElIF
 Up1yb1Ij5ZJyYAsSbXdwvpZHFnkrBsHmeEWGZQDwhwzGDy+GcPQcp3LzFuB/Qc1oY0mG
 7JkuLEEgK7+MnHZy6JT+TvkNn0zIJ/+bfBHpzSN38Lyrr24ojOtZksa5z1XDPDkLDk1A
 5Z1/3zpq9ggPAH5i4NngWBmI6Pe0VTIqQHlJPdRA3Tgtce4cjaX6SiDz7hDDMfccEKhd
 Cf7MYfG/WFr19p03gcouiWvjVDFTZxZMQd49A1zTYkZZR6JNYikCTz4S3mGmLl8pWw2Z
 UiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=1xVXQN/RVxQgnhosr+Bz1Sj4AsEop0V8tX2Z1lL7Z4k=;
 b=VMrWd2AEC5d1egjjgltqBML6vp6xerHWsOUCyHZtrrctRE70RXxD0J7F/jClUqECSC
 bJWnyJguV033oGtdi0QGIMjLkL9q09bIJwXINdvtR4N2m3OmTEHesJb9J0UHR/G002LE
 VodDVbQZEFMd9RPrl4IIzbIo5IDbTGHIAHMcMjObCXWRf325KHVWY9DArh8c1Fs8qGwG
 D2J0zP8XbhUyVjU0/RZ3RuaStNf/mSIMopwKja9wHLq2ZtY3sIZO7jK2Dk2IpIcIj/a8
 7i0cwOGvWa0fNFB7gzqQCFrrXRt7RM7N0ofCipqf6VLKYRNpI1zuWqcRWf8HSZMEQK09
 8Ztg==
X-Gm-Message-State: AOAM533vxl8FWVIpgYUag5jfyk13Cn0eyK7O++NtuDOTDP/CdmrzlW1+
 spignGApPitFGpa12/YjOJ0=
X-Google-Smtp-Source: ABdhPJwLGszVX1GXB8GIPd/y/4oMIt7BHkFGRSuuDeCE5EQpx2TL1ZzfCgFAUwRUmwffrL/h4K1yIQ==
X-Received: by 2002:a05:6512:12d3:: with SMTP id
 p19mr4116629lfg.328.1634204656915; 
 Thu, 14 Oct 2021 02:44:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h4sm180533lft.184.2021.10.14.02.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 02:44:16 -0700 (PDT)
Date: Thu, 14 Oct 2021 12:44:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [RFC v1 3/6] drm: Add a capability flag to support additional
 flip completion signalling
Message-ID: <20211014124402.46f95ebc@eldfell>
In-Reply-To: <20210913233529.3194401-4-vivek.kasireddy@intel.com>
References: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
 <20210913233529.3194401-4-vivek.kasireddy@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ve50IuPp7X64F4deTt.l.qp";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ve50IuPp7X64F4deTt.l.qp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Sep 2021 16:35:26 -0700
Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:

> If a driver supports this capability, it means that there would be an
> additional signalling mechanism for a page flip completion in addition
> to out_fence or DRM_MODE_PAGE_FLIP_EVENT.
>=20
> This capability may only be relevant for Virtual KMS drivers and is curre=
ntly
> used only by virtio-gpu. Also, it can provide a potential solution for:
> https://gitlab.freedesktop.org/wayland/weston/-/issues/514
>=20
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/drm_ioctl.c   | 3 +++
>  include/drm/drm_mode_config.h | 8 ++++++++
>  include/uapi/drm/drm.h        | 1 +
>  3 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 8b8744dcf691..8a420844f8bc 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -302,6 +302,9 @@ static int drm_getcap(struct drm_device *dev, void *d=
ata, struct drm_file *file_
>  	case DRM_CAP_CRTC_IN_VBLANK_EVENT:
>  		req->value =3D 1;
>  		break;
> +	case DRM_CAP_RELEASE_FENCE:
> +		req->value =3D dev->mode_config.release_fence;
> +		break;

Hi Vivek,

is this actually necessary?

I would think that userspace figures out the existence of the release
fence capability by seeing that the KMS property "RELEASE_FENCE_PTR"
either exists or not.

However, would we not need a client cap instead?

If a KMS driver knows that userspace is aware of "RELEASE_FENCE_PTR"
and will use it when necessary, then the KMS driver can send the
pageflip completion without waiting for the host OS to signal the old
buffer as free for re-use.

If the KMS driver does not know that userspace can handle pageflip
completing "too early", then it has no choice but to wait until the old
buffer is really free before signalling pageflip completion.

Wouldn't that make sense?


Otherwise, this proposal sounds fine to me.


Thanks,
pq


>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 12b964540069..944bebf359d7 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -935,6 +935,14 @@ struct drm_mode_config {
>  	 */
>  	bool normalize_zpos;
> =20
> +	/**
> +	 * @release_fence:
> +	 *
> +	 * If this option is set, it means there would be an additional signall=
ing
> +	 * mechanism for a page flip completion.
> +	 */
> +	bool release_fence;
> +
>  	/**
>  	 * @modifiers_property: Plane property to list support modifier/format
>  	 * combination.
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 3b810b53ba8b..8b8985f65581 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -767,6 +767,7 @@ struct drm_gem_open {
>   * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
>   */
>  #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
> +#define DRM_CAP_RELEASE_FENCE		0x15
> =20
>  /* DRM_IOCTL_GET_CAP ioctl argument type */
>  struct drm_get_cap {


--Sig_/ve50IuPp7X64F4deTt.l.qp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFn++IACgkQI1/ltBGq
qqe+IhAAn323p1bFACp7gEEk+1sogHuerdQyE1xLVD9sf0BsS9q1+rD72/jY4ltb
O3zqoocDh2heY01Ie9LUPCNfkZXdCIMWFc6r3b+XxytI6efz3yETaLoqxF+EgilR
cXnMu9UfMs8IsM2efVyAbTph27VxXobuMisaTHAdFAFLr6iSEEm9KqGT1QWn6l5h
sC+FZFxWtwBTI7Emxni68YvQWWBu0Kx3kXyQKDI7ZwcjrBIq3uCmEpn05CZz/enF
Xfx11IXyvAtAzfZMskmnlI9y8RP7LaK2NLpkBQKjgIE2KFOIRmOGh5H4DPOX/lxy
pjXnomuHvDKN3qDTyRPFTJgnTXE6IUdQSnFoC3X7H9amGfv9rGxzaJMvs5jb6G5e
21aPZD3j4FjmjFYM8etNEFjfGlUkA4ehl33WpKhJ7WLZFRKCMpdHhDhd2C7RKh7I
YIxL3jxn/yDF7V1aEmYK3nEBwqy3e+cAF+xvC0eGwmKN9APPGTEWdjcSTtL6/eaH
7Adar59LW5R9dUF6Zs2YACWn2R/uL6P/4bG8JBNw6/padoNP35S6vMblY9lczEKY
qwL3JQIO1Mc5XDSWVz+JjjeV2x3oF6nitwRoxLXXrkaNgsducqEKgBnzf5fM0ueH
039C8pgE1cECf+0AeCWp4iCmiL0uyBIq1a03LXiWkgnS6Ndc24w=
=iIpO
-----END PGP SIGNATURE-----

--Sig_/ve50IuPp7X64F4deTt.l.qp--
