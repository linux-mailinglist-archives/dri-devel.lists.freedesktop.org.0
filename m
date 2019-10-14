Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBDCD7000
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF4B6E622;
	Tue, 15 Oct 2019 07:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC406E58A;
 Mon, 14 Oct 2019 17:49:50 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r3so20741269wrj.6;
 Mon, 14 Oct 2019 10:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XXUMrGZIb6oF2ZXlkY6NvVGKtm0a8dgxsmrS0PyzrVM=;
 b=VG24+MqlJmNN+FUwQIeQU9LoNGV9W0ZVFyk0DaIph23u7BEsgGUwPF4x8Y7vc0LOjc
 wwBoZ5Rps/ti9faDZo/tjrzqFLiFPSWQmg0GtLiiAaINlAMX911MZCzuNGjQf7++TF8P
 lpjrp8OwSTyNq/H97dhPD161+q+ojuPxb5ptOG4Fl5CWRFk6UpZk3my5cFfn/9tzc66V
 hkzYPRSTZwHLGv0/QRZuFS1yKsDvHYHDz7ZwBXInjsIXSZdKnwWdYYUPl1vhB7YG1KWJ
 w0xWfZcRaVtx/AFdyQW/J1H4qwVLhsrC3/S29eFiKgc//1Qo4TQWar0v1Oc98aiHE9MB
 LeSQ==
X-Gm-Message-State: APjAAAWbtAtC7LmfmXqeNiKV1ifgYN6rMMRVdLHWlWadF7U9gAcO9fq4
 yRicunqjKoldIf1GNjUlu9Z1eYQ63SAVcQ==
X-Google-Smtp-Source: APXvYqy78vv8xomOjJzk/rQmkBz13qhvU+ercRByH/EBEIZm2MrjAU0AN+KF4wDSX2QXx60c7i4efw==
X-Received: by 2002:adf:fa92:: with SMTP id h18mr26866005wrr.220.1571075388812; 
 Mon, 14 Oct 2019 10:49:48 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id o70sm26093856wme.29.2019.10.14.10.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:49:48 -0700 (PDT)
Date: Mon, 14 Oct 2019 18:49:46 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 0/7] mdev based hardware virtio offloading support
Message-ID: <20191014174946.GC5359@stefanha-x1.localdomain>
References: <20191011081557.28302-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191011081557.28302-1-jasowang@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XXUMrGZIb6oF2ZXlkY6NvVGKtm0a8dgxsmrS0PyzrVM=;
 b=I/j8jtNurZb03wO5OtpFMwdIEKSI/vQc1BpvLpGl7ryBO321tGoGGD/dOPskkClYgw
 od4t5zjq2+ndwxdNXh+zb0qgGfEDiYNC8CJI5nF9z0sOJtW/AfXcRs9u9iWNzfztTASm
 zRmpLe4p98ADBn7rdM7pjSDzk7VKVIejQmclv2xjvGruv1pY+/Z3iKi3Ri2jzo/vZXKZ
 U1CtlK0iIYAuWGsQk/PJUF6nLEzNapqKj/Nhjmq1INYWCFMOd1+W22by2mHCL9aIRP7o
 dRogtOEYzA8TV/asYmxRHwEpPsFleBrtG5/5o48RbATHAQ6SxNYlqC7Ip8//tVEgp69R
 zJfA==
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
Content-Type: multipart/mixed; boundary="===============2032389193=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2032389193==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2019 at 04:15:50PM +0800, Jason Wang wrote:
> There are hardware that can do virtio datapath offloading while having
> its own control path. This path tries to implement a mdev based
> unified API to support using kernel virtio driver to drive those
> devices. This is done by introducing a new mdev transport for virtio
> (virtio_mdev) and register itself as a new kind of mdev driver. Then
> it provides a unified way for kernel virtio driver to talk with mdev
> device implementation.
>=20
> Though the series only contains kernel driver support, the goal is to
> make the transport generic enough to support userspace drivers. This
> means vhost-mdev[1] could be built on top as well by resuing the
> transport.
>=20
> A sample driver is also implemented which simulate a virito-net
> loopback ethernet device on top of vringh + workqueue. This could be
> used as a reference implementation for real hardware driver.
>=20
> Consider mdev framework only support VFIO device and driver right now,
> this series also extend it to support other types. This is done
> through introducing class id to the device and pairing it with
> id_talbe claimed by the driver. On top, this seris also decouple
> device specific parents ops out of the common ones.

I was curious so I took a quick look and posted comments.

I guess this driver runs inside the guest since it registers virtio
devices?

If this is used with physical PCI devices that support datapath
offloading then how are physical devices presented to the guest without
SR-IOV?

Stefan

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2ktToACgkQnKSrs4Gr
c8jgRgf/WWO5uJxyZLwosUbr+PGHcqci4COe1VGy3Aveab34yl0NQekiPT6CEG5k
PLqiRN9UlPXnMq5H6tsIptfG1mBTxJpF0H7FVRGvwKnV+NizCllURp1Eb1y6ucTd
j3Rg8JZAwDCdJsZ8d2o4JXQKv9CIavomjp0ZQNIdRiKJ8gOueiWydBgCOSO/l0dh
t/YI7ENprVpSg56pZba9Y3eueA6Gt4oSfHZbgtQWXBueHkyN90em9JoDAktAOu1m
PZAQykFnCUGV7RwfK2jUW+WIgh8mSrhu36zoyl9OAASnmHeiMBCTqpvHTKzRH180
fEnf2WwIaOxFvEnbfxu/3ljKyhjEaA==
=X6sM
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--

--===============2032389193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2032389193==--
