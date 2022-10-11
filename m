Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7CC5FACC8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 08:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EC810E7B9;
	Tue, 11 Oct 2022 06:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A67C10E7B6;
 Tue, 11 Oct 2022 06:27:24 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id bp11so7243806wrb.9;
 Mon, 10 Oct 2022 23:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:cc:to:subject:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0w8KGzGuvSzltAZdX8cl8yXaNHAwAsGs64+X1MnyKz4=;
 b=nt2Bk2i0Wvg9Z1K5eWtXLPYJmF2uh8X3u4KhfczGQTpC8cwAJ1t4w+ekvZeahuAKre
 ErRt/lZKKAul+u0js1JZVzcMsLneJuQm+cjqkQ8fM3gbsXxkziRbyIS7cJxFeyHb1fDP
 N/uTIXtU6+t3LA5n7lPKczHtBOzixdZkEIiU2/+dlE/dPKpCkxPE3fbWRtbJauP/twsR
 xMlIbknGTtXp8N3Laj9ZYhGHGqc3MRB9LiASlzkPp8ZqHafIRcEDT7sFdgbBv2n9W/yo
 /kzoN8TTBBX8WqOUp2wWTM056TUP0ngGL/MlGJVKFxg9ssduT88BNGYAygJYEMhxiv0T
 Pseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:cc:to:subject:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0w8KGzGuvSzltAZdX8cl8yXaNHAwAsGs64+X1MnyKz4=;
 b=J/XOyWxSCyxLRtr4aAUOk/KRHxgLke1OLWeTUelSBM2sCTQPRskWX8fsFouJEZzs7A
 7ZSzCuEO4ZFcJrNNsduQ/D73l4g1lEqjEIE5w20Kw2rLp5Kjezx/yXqlhqmei4AqGR2b
 HhgZmKklGLR09RAXo5llJz0+1UPvrCr8Z8L8dxrjaUdSYoNI5aAiKxq0ZWjlCrnHErOI
 /gDX1otQ09q59lhnkZaHYw3frbS7ygr4HGc4+BzZEym+fmutTimzEGGI55Gcsb+11Q4j
 oxmllEIqNPvEzIHdlIMLcIPIi9UN49JFiKfYFEZpw7CHd1nXinG+NQ7PhNvN1L+Y/69p
 ms4w==
X-Gm-Message-State: ACrzQf0wvyygoqiyGuc4drGK/8pCRWlXFil13tso8kI6bFyZazsK2uQX
 pxD0i+sLmlUFEhQkuFKym18=
X-Google-Smtp-Source: AMsMyM6aCAPv7AgDk7ukmpHffbaN2G+tUhMBQ0pSjLlhdBalKzMELngowvczKh5sW/+QYTd+LSfdoA==
X-Received: by 2002:a5d:4a01:0:b0:21d:8ce1:8b6d with SMTP id
 m1-20020a5d4a01000000b0021d8ce18b6dmr13751400wrq.718.1665469642666; 
 Mon, 10 Oct 2022 23:27:22 -0700 (PDT)
Received: from matebook-d-15 ([2a01:e0a:1d2:1f90:be95:f3a2:4d99:a3b3])
 by smtp.gmail.com with ESMTPSA id
 r16-20020adff710000000b0022afbd02c69sm10268120wrp.56.2022.10.10.23.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 23:27:22 -0700 (PDT)
Date: Tue, 11 Oct 2022 08:27:16 +0200
From: Matthieu CHARETTE <matthieu.charette@gmail.com>
Subject: Re: [PATCH] drm/edid/firmware: stop using throwaway platform device
To: Jani Nikula <jani.nikula@intel.com>
Message-Id: <GLSKJR.CU4DWLJQSTHT2@gmail.com>
In-Reply-To: <20221006222146.2375217-1-jani.nikula@intel.com>
References: <20221006222146.2375217-1-jani.nikula@intel.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It should fix the issue. Meanwhile, the system will still crash if a=20
new monitor is plugged while the machine is suspended. We might need to=20
precache the EDID to prevent that.

Matthieu

On Fri, Oct 7 2022 at 01:21:46 AM +0300, Jani Nikula=20
<jani.nikula@intel.com> wrote:
> We've used a temporary platform device for firmware EDID loading since
> it was introduced in commit da0df92b5731 ("drm: allow loading an EDID=20
> as
> firmware to override broken monitor"), but there's no explanation why.
>=20
> Do we need to?
>=20
> Maybe this fixes the suspend/resume issue?
>=20
> (Yes, I'll rewrite the commit message if this is the way to go ;)
>=20
> References:=20
> https://lore.kernel.org/r/20220727074152.43059-1-matthieu.charette@gmail.=
com
> Cc: Matthieu CHARETTE <matthieu.charette@gmail.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid_load.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_edid_load.c=20
> b/drivers/gpu/drm/drm_edid_load.c
> index 37d8ba3ddb46..fbae12130234 100644
> --- a/drivers/gpu/drm/drm_edid_load.c
> +++ b/drivers/gpu/drm/drm_edid_load.c
> @@ -182,18 +182,9 @@ static void *edid_load(struct drm_connector=20
> *connector, const char *name,
>  		fwdata =3D generic_edid[builtin];
>  		fwsize =3D sizeof(generic_edid[builtin]);
>  	} else {
> -		struct platform_device *pdev;
>  		int err;
>=20
> -		pdev =3D platform_device_register_simple(connector_name, -1, NULL,=20
> 0);
> -		if (IS_ERR(pdev)) {
> -			DRM_ERROR("Failed to register EDID firmware platform device "
> -				  "for connector \"%s\"\n", connector_name);
> -			return ERR_CAST(pdev);
> -		}
> -
> -		err =3D request_firmware(&fw, name, &pdev->dev);
> -		platform_device_unregister(pdev);
> +		err =3D request_firmware(&fw, name, connector->dev->dev);
>  		if (err) {
>  			DRM_ERROR("Requesting EDID firmware \"%s\" failed (err=3D%d)\n",
>  				  name, err);
> --
> 2.34.1
>=20


