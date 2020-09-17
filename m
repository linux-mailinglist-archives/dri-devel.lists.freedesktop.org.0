Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7105226D9AE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 12:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19946EBAC;
	Thu, 17 Sep 2020 10:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5366EBA8;
 Thu, 17 Sep 2020 10:56:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z4so1565185wrr.4;
 Thu, 17 Sep 2020 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T7o1O276VNvFCMXreEbeFlPYMFMj08O5QtDTtLf9+io=;
 b=QB6L5K889Bo72oCmXlPEd6RO0QFJaiOuUuQYNXSbkbKHLE0z4jthWl14REa3WCR0Bt
 7IHiIFNeD/Ta+yo/4I3eoGqh6G9kDPeQAYogqalpiHtq8aE0N2vVL/nLfC8G7fyUISnI
 HqZvSuiNmgZzkTOCBFRSXTB+sPRscquK8BzaCBsBZW04/6qzVITT/XTRzNX58D5ubsqj
 EBCDdFzw/4/+qKJ5jqHMFDrIQ6SPZ7RFWRnZTqbCA2A8CuvrZLIiZY8CyMBMGu+cZPGz
 +Xk5dHOFs8kS9Gn7mKXA7wGo6jD27ynEwYEI2R76ZDPCy8bCgvVnpggr26rleQIwiHel
 X5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T7o1O276VNvFCMXreEbeFlPYMFMj08O5QtDTtLf9+io=;
 b=ludas7inWT5XonVRCOouClOZ7pdfDexkwaa4X9hnqWUimtkKW0XEVzA9a3CKrvOPO0
 xJPn2a7AOugCyJ+TaJPSWVGoDRga/qGZ7CwfqlvOvRNK2S+r4Hm5xdtle0LWtFs2mFAP
 gXAZVKQqWwroEHTY//DjwGDLC0Vtdc9sWlKRbIDqfShzDrAxu9pBkC1NbbfUuTZB3MV/
 WcLTDnW/2RlqDWLYm7LDLLGR5OC4pJrjqxyHU+NSznG1TJy0cgyWHbfEc5sVKJk6zAHz
 2Zvrd546nTtW8J9EWAaP2KGeft7zPPSxVBDGonFaukvKdpF2Myo66E2HQihfalrxYgHf
 JWlQ==
X-Gm-Message-State: AOAM532md0XZrUrrWmVgpQORMW7LzRcdczuaN25b0AJGBBGbhuAMNDQx
 v3lbiDtfhBSjaXhmR6hET78=
X-Google-Smtp-Source: ABdhPJwg7nkwQTaRBQuWwl0RcZSkUXHrdUc9WYlLoauvclz9jtCse6f5SG7t61si5y3RH63KecEA/w==
X-Received: by 2002:adf:e711:: with SMTP id c17mr32158269wrm.359.1600340183749; 
 Thu, 17 Sep 2020 03:56:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id d83sm10820463wmf.23.2020.09.17.03.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 03:56:22 -0700 (PDT)
Date: Thu, 17 Sep 2020 12:56:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 14/21] drm/tegra: Introduce GEM object functions
Message-ID: <20200917105620.GK3515672@ulmo>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-15-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200915145958.19993-15-tzimmermann@suse.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com, nirmoy.das@amd.com,
 krzk@kernel.org, sam@ravnborg.org, emil.velikov@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 oleksandr_andrushchenko@epam.com, tomi.valkeinen@ti.com,
 linux-tegra@vger.kernel.org, linux@armlinux.org.uk, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, chunkuang.hu@kernel.org, andi.shyti@intel.com,
 linux-arm-msm@vger.kernel.org, marek.olsak@amd.com, tianci.yin@amd.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
 matthias.bgg@gmail.com, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 hyun.kwon@xilinx.com, rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, chris@chris-wilson.co.uk, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0698950265=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0698950265==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NqNl6FRZtoRUn5bW"
Content-Disposition: inline


--NqNl6FRZtoRUn5bW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 04:59:51PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in tegra.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tegra/drm.c | 4 ----
>  drivers/gpu/drm/tegra/gem.c | 8 ++++++++
>  2 files changed, 8 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--NqNl6FRZtoRUn5bW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jQNQACgkQ3SOs138+
s6HfWQ//YmrWsVV1CJUAgb5t2QX4pCrujVRekVE/g1njlA/b4hb8UrTwixaZox4k
Y6ALc4RAngHpnPoebK9HTtI7eQ6gV3NzTvOZN432iqInp8UuFdrqwY9hkRcS5ak9
gNSHqMgl0BAkIdZ7VM5EWvVcbSkWsGbOR2uTx45m3hieqf80Jlyto/yqcH8yHm0Y
dNhlRIxSS23lHF4c79jOtCPyJjF2DaErfz+qFiFLmdV60AjeCfl6LZZSuSNSbSNv
Ht8OICXXHv9dKx6IbgyAAJIf77DsMDyXHzNC6YxoBH1c1X3JgEinuNaj8h+ZXxrT
klWtayTZ15xforiBumJH+Zi23DA+95v6eigfHDVje5APtRHxDgdnNOhW6zRF049I
powiLvCaS10xJVB7+4DlXmvdJTRaw8jNMcOYR0Yyg5fwrbkjkHyFsi2iQyzclBEJ
KM5kjLzpgBQpaEgpsCqxY0TJ0/bU/VdL532UpAyCK7D9RxN8sdhfU7A4xuwwAeNP
t63YCPEKs9kd0rKW4W6tUOEm9IeNiHL0CL55oYNDUNk0ddTtmdlQkFKSOfDbGBwe
X3RtJeu0oG5S40RXucqy2J4BJO5tKcymjFb3xqjaCP8nDF3ozvgmq/Hu4+MWkeL7
b/rNCCE8o02rDlLqOHqxccc+bQXs6tQBkwI0mESWxpdRfBPoyt8=
=1YYz
-----END PGP SIGNATURE-----

--NqNl6FRZtoRUn5bW--

--===============0698950265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0698950265==--
