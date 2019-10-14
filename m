Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EA2D6FE8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ED86E5FC;
	Tue, 15 Oct 2019 07:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856DF6E575;
 Mon, 14 Oct 2019 17:23:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o18so20597545wrv.13;
 Mon, 14 Oct 2019 10:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EGGdaz7JChYl4JPWAU70Za+RRAZ6S/LKBm6uuB4+/Xc=;
 b=CdaAu9lopaNSMPiIgUlg3MBaaa6nXDxNKcFBvV3bDWP1pA4di5/sLuQjVSEzVkUB25
 TL4xI2Sg7LdpxoORxGHC4yY5TKwhoR8Pqf1/Nlan9/cLVjpUA0UGKQGmfQaYC0LL0A5d
 qzvbCIzrHaydN7REe+86/CoRVgQ648qL4B7vlcmWAgTI37mRGPsIlpO0+U134NbKJin2
 maK6SOZtK16rF165LVX+xk7N3ztM6ER8pdKt2nmI8qB+GX6QtOUGzrp8pKcUKEpbzhty
 bhD9iToccKpI3D/oyOwRs/WXI2hLYiHXVYk8dz/CIYLtXFTBrUEvoRn9mE26VIQFIHqm
 f15Q==
X-Gm-Message-State: APjAAAVTNIYXeu1bBgxftHFPEEP857o6E7y3F/cSOpwoUbm8fvt4Ck3j
 nCM+bE1RQBnPfMDo/d38s4Q=
X-Google-Smtp-Source: APXvYqwzHqNY1eXa8Wf7T+/uPb0SEQxKfUwA6RcA+GYW/wDuACvWvp5czJ0hnFuczXqrqbCUluKYlA==
X-Received: by 2002:adf:e403:: with SMTP id g3mr24811494wrm.294.1571073784104; 
 Mon, 14 Oct 2019 10:23:04 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id u11sm17480327wmd.32.2019.10.14.10.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:23:02 -0700 (PDT)
Date: Mon, 14 Oct 2019 18:23:01 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 5/7] mdev: introduce virtio device and its device ops
Message-ID: <20191014172301.GA5359@stefanha-x1.localdomain>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-6-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191011081557.28302-6-jasowang@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EGGdaz7JChYl4JPWAU70Za+RRAZ6S/LKBm6uuB4+/Xc=;
 b=RRPJF2yb4XFeB7uEMgAAHug959rwOOi8I/aMvVs+16qpBMg/xi88CdeE9Z0H9RouJ+
 fuML1Z9e9rjBfDAPLO3vADPa3LKcP9qnEf/xpsiWQnNh+luQFiGV3tK5aWSEkUPYzdfA
 KpZpZ+iy0Yoy/NcKo/yZtrnc6V+97GtwBpJroCZjdetayH+gySMvQCYQhbhgEwH6uh48
 WPbN59RIfr0Ttxd+BL05PY62ls2843A5TDjRJu5P2+VWH3gHHPu5bJlTNgtK5BrOavSZ
 bJycA88kKLnGA677mFQ8W/bpEIMLoXR5m1yU1geUzd8TFe+sPFHy6SrFhwmpW0BGfxq4
 DNXg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
 airlied@linux.ie, heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 alex.williamson@redhat.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 parav@mellanox.com, zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: multipart/mixed; boundary="===============1674448050=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1674448050==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 11, 2019 at 04:15:55PM +0800, Jason Wang wrote:
> + * @set_vq_cb:			Set the interrut calback function for

s/interrut/interrupt/

s/calback/callback/

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2krvUACgkQnKSrs4Gr
c8hIpQgArOf5wNMCOOx9mrAoFEfDyFDnQGYWa6Ce2/25rBYZVN1BIaLrZLwRk4Za
aM65SiUsAMIh+UTdezqEPyUZCoRZbcxFRWUtyQZqHLCVg3yrwM++9xtTFclrIY0p
hP+v2ZVAMUT/1BQiaAo3+qlItEYbUDwtSl+wsSwzlvu9nFRlHjjdbUZAJmU78zv0
Y50LNaXQf3+E9GqPDj6nJEUSxpww44C1FOgxh9SErmqG8j7ReyAfng0loRKNdZbv
6g7U1I0J+vNgzcCxTSipVRS8EH0bOEY07w3OggpIoIRnOx6voaXYz8SMEQZ8tiRu
k0SSOtAyZ48s1BaOt3vREX8uYFlt0A==
=/ZZN
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

--===============1674448050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1674448050==--
