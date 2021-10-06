Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92434245DD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 20:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9156EDEA;
	Wed,  6 Oct 2021 18:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7865A6EDEA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 18:18:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r18so11474567wrg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 11:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oDP7jTYuA5SF9diOwBdY6+tSepj5gMgYgTWP+RWqpss=;
 b=Z88yjkwLxJhi4jPN3L8nrmqCuWATdtqp6ag+2f5iQ1aWTz/xdFuO5AK/1zPtilYK8b
 6J+ywg/RAX7mv8Cz3LsQf2ATmk+aR6d29DnprN779O1NFbSWwg+rrB8GwFoOq6WWFxEG
 dPHwv1lr+Gtq2vlIOnVfX1iKkdUmQ1WzbPaSGegmaLP+EHocSM6BG50cmqbnyAp1NeFg
 N86DS3b3xh8Cp0nNT3RrNDaTTRQr5VBoWptlsalQ4XYFbsp5m5HSOQzUnpHNpHC2CxIa
 Ol33EYXHN34OOMGiSJYVxZKLtsd4D5vwfVQw2nmbu9wmXg1zn6xiR3jgq5vr+eysjT9H
 bO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oDP7jTYuA5SF9diOwBdY6+tSepj5gMgYgTWP+RWqpss=;
 b=Bw98yXSeDPCfYF6K+1Jkf23abZkp82+hvFix2bpdeI1lmB3s9jfVoLC+kCgjOWcZGS
 RGYqame9COzU9IaGEkoGdbbtORJWmCwxVJrlACTu+jKH901ZTX5+qxu4qkOWJDKSeEQ+
 34RX6/iL3sUc0zsPN13qd0oTiDW+B782Np8AS7Yta04W6IoJFmjQ0/VSUOWBAuLF8Qtq
 yeREAIQEOr3lm3trLSrIBmgzAJ0icyBivPSyDITBWOu7ah2W5tGeCQgPjJCgl+yVSOV4
 JBAiFbCcHzuMmnynXTPjDHdYQy5ZguIBwKx9A+pNosS9NeOBrU2B3XZ/ZtqxB/LYgSQv
 fTzA==
X-Gm-Message-State: AOAM5339dEw7N/XhmMUHWOnYhjh/gk8voEAsrO16CLm5EOen4xqLhxIV
 KcLJBQMty/MU8eZcj1YbFVA=
X-Google-Smtp-Source: ABdhPJwgAiaOc+z5VM7NwqYGU1fNLuKMvJ12gNib7RFqeksvuaWphcb4ZDcI/x41TOiSF0No7pqgIQ==
X-Received: by 2002:a05:600c:201:: with SMTP id 1mr9975949wmi.61.1633544283815; 
 Wed, 06 Oct 2021 11:18:03 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id x15sm12777309wrl.74.2021.10.06.11.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 11:18:02 -0700 (PDT)
Date: Wed, 6 Oct 2021 20:18:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: Add YAML bindings for NVDEC
Message-ID: <YV3oWd9nvB0HKpUI@orome.fritz.box>
References: <20210916145517.2047351-1-mperttunen@nvidia.com>
 <20210916145517.2047351-2-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4M/TBxqKDEWOjiPU"
Content-Disposition: inline
In-Reply-To: <20210916145517.2047351-2-mperttunen@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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


--4M/TBxqKDEWOjiPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 05:55:15PM +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v6:
> * Elaborated description for nvidia,host1x-class.
> * Added default value for nvidia,host1x-class.
> v5:
> * Changed from nvidia,instance to nvidia,host1x-class optional
>   property.
> * Added dma-coherent
> v4:
> * Fix incorrect compatibility string in 'if' condition
> v3:
> * Drop host1x bindings
> * Change read2 to read-1 in interconnect names
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 108 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,t=
egra210-nvdec.yaml

Applied with the yamllint warning fixed.

Thanks,
Thierry

--4M/TBxqKDEWOjiPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFd6FkACgkQ3SOs138+
s6EbLw/+OeVa3jPnk6EEgo3cQ8Qf2k9HHTHFMbNZ1BjSPbOQTB0EB2twJb/1Alix
98dAZbYJwl++MZimApEzY1FKj4z8cvVMOyvREf5KqmgHZJKzU4HeUJo3PmC3fN2o
MhKOgNZIRRu4M7Lym4o9d3Zwp13fmAfoYsPVXQnP/DntVuPTg8OAmlcVFTGXRslj
cZPJwUidair5PvjDyE5XHnnopOOT4amekBx4iEPlNtLYF/+VeZz0eZXur44OJaLS
CloArrHdc882hQLQuRJaykcNrk/1g6+2OZ6gdyDlp+uVPKNwU94vIq8+l6gmjTR9
Sod+K1Z6Fnv6cU0vG15+Z6TZjRkCe3I7Sv1wwJ313fQH8OZpm1tDXkxMFKOTv63r
/CRVLIzVZtnKkLKtUbWZrIhuD1TEMPIN5gr6hXuYSLKeseP4ezudJMV1zjP9kocB
H0eJ1SZMb39Bkv+nP37a5t78nlkJAizXAeXGHcTJplvdhvN+0OY6MJjFDjs1rPuI
9PhT/lKSHJYG8eEx+Ynjn8+4Ae8gZOtd2PU5RwCtj4sMq+NZOI9UhlJ1mGhge3em
nMAkPe8NWhYD0Ufz49OFRfkPnhDY5JZ2jnQE0/qj3BOw/ycD1YlGKzYOF6sgjiEM
oHg1vZPsdRCT83vvCbE3aNN+/bKhAuohlHBJ+zPoA57hO6YDcN8=
=1ZBB
-----END PGP SIGNATURE-----

--4M/TBxqKDEWOjiPU--
