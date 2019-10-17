Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24047DCE35
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153A06EBAC;
	Fri, 18 Oct 2019 18:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A8B6EA2D;
 Thu, 17 Oct 2019 09:43:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id i16so1836278wmd.3;
 Thu, 17 Oct 2019 02:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j33Q+AxJlhfJ2zQyBdLBD2zOlPBTBa+TDiJdmF/d4B0=;
 b=I/Z3+JT/xLYZrguo80fjCE59CpRolyJWt/lJQvJACPa1/DdQ0pbqIt2ye0yusuO8lD
 sRxQua9KR24rbX1Sqj9CRfu5SFwHyvUpCxXN3yam93r3kYYOzFli+YnXazdRE18yup4U
 zvbzH+MXS+I3iDPUCN/ZYhIzvEyATwdUkUT4Igwy8gWvaGaL3l64dkF0eccn5g6bIMze
 TW3A3kYxfcmN+YeIuFWY3l+URDZO+Bfd3HkBI4tU0sOJZrpG2BJLuY6VapijsXmEA064
 HSDDmFdeGH1btQ/6QhwUoV42oninUx8uytee14tGOHIhQXZYsvSa0Y+8PwN30YQE9w2C
 aOkg==
X-Gm-Message-State: APjAAAUO9AtvXDp6kvBmRWZGZOKSoU+GfeLPl3crSJmO7cBPRNNswpvL
 035PW4JQSl3oyobcQHVIHgk=
X-Google-Smtp-Source: APXvYqxHJt9ec/ig4bgPywnDn38DGreAT5nDreVbx5QqzUYuzF0nTYOT9L67QUVhr9q6+o+HntA0Mw==
X-Received: by 2002:a05:600c:21d2:: with SMTP id
 x18mr2121283wmj.146.1571305423433; 
 Thu, 17 Oct 2019 02:43:43 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id l6sm2029963wmg.2.2019.10.17.02.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 02:43:42 -0700 (PDT)
Date: Thu, 17 Oct 2019 10:43:41 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 0/7] mdev based hardware virtio offloading support
Message-ID: <20191017094341.GF23557@stefanha-x1.localdomain>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191014174946.GC5359@stefanha-x1.localdomain>
 <6d12ad8f-8137-e07d-d735-da59a326e8ed@redhat.com>
 <20191015143720.GA13108@stefanha-x1.localdomain>
 <ba81e603-cb7d-b152-8fae-97f070a7e460@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ba81e603-cb7d-b152-8fae-97f070a7e460@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j33Q+AxJlhfJ2zQyBdLBD2zOlPBTBa+TDiJdmF/d4B0=;
 b=PBJfc4iKYLoGVwZHVtTO0lO3ez5BpGeXPZAlj4Qxx0c4NWNvQiQJdK1Zm22yFqjtaV
 XO4FHG92jwHETc95eBaAqW8My3/55VjWzgdzO1Z7VFGBKZ6/SSKp6CTcrfC3PtlNKUqL
 Gz5RKw3w65f80M9hxVCyoUP5nbQbEGYqA7zONJtbqiZZSQ4kJoIXDkriUorZx149Ov6V
 hp2VI/XVNAKT6jIOvk6lx29b+UyYLiw1dTHMppE7KWb8k9vetl5lYmF5oE0pBsoCnQOR
 RSu0PTM8fVta3TCkFFq1fEmhNZJQ4CHICquFivetIufuHrOzmlAiCgVnt5JDfNQxaSMU
 /cUg==
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
Content-Type: multipart/mixed; boundary="===============0419971690=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0419971690==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pql/uPZNXIm1JCle"
Content-Disposition: inline


--Pql/uPZNXIm1JCle
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 09:42:53AM +0800, Jason Wang wrote:
>=20
> On 2019/10/15 =E4=B8=8B=E5=8D=8810:37, Stefan Hajnoczi wrote:
> > On Tue, Oct 15, 2019 at 11:37:17AM +0800, Jason Wang wrote:
> > > On 2019/10/15 =E4=B8=8A=E5=8D=881:49, Stefan Hajnoczi wrote:
> > > > On Fri, Oct 11, 2019 at 04:15:50PM +0800, Jason Wang wrote:
> > > > > There are hardware that can do virtio datapath offloading while h=
aving
> > > > > its own control path. This path tries to implement a mdev based
> > > > > unified API to support using kernel virtio driver to drive those
> > > > > devices. This is done by introducing a new mdev transport for vir=
tio
> > > > > (virtio_mdev) and register itself as a new kind of mdev driver. T=
hen
> > > > > it provides a unified way for kernel virtio driver to talk with m=
dev
> > > > > device implementation.
> > > > >=20
> > > > > Though the series only contains kernel driver support, the goal i=
s to
> > > > > make the transport generic enough to support userspace drivers. T=
his
> > > > > means vhost-mdev[1] could be built on top as well by resuing the
> > > > > transport.
> > > > >=20
> > > > > A sample driver is also implemented which simulate a virito-net
> > > > > loopback ethernet device on top of vringh + workqueue. This could=
 be
> > > > > used as a reference implementation for real hardware driver.
> > > > >=20
> > > > > Consider mdev framework only support VFIO device and driver right=
 now,
> > > > > this series also extend it to support other types. This is done
> > > > > through introducing class id to the device and pairing it with
> > > > > id_talbe claimed by the driver. On top, this seris also decouple
> > > > > device specific parents ops out of the common ones.
> > > > I was curious so I took a quick look and posted comments.
> > > >=20
> > > > I guess this driver runs inside the guest since it registers virtio
> > > > devices?
> > >=20
> > > It could run in either guest or host. But the main focus is to run in=
 the
> > > host then we can use virtio drivers in containers.
> > >=20
> > >=20
> > > > If this is used with physical PCI devices that support datapath
> > > > offloading then how are physical devices presented to the guest wit=
hout
> > > > SR-IOV?
> > >=20
> > > We will do control path meditation through vhost-mdev[1] and vhost-vf=
io[2].
> > > Then we will present a full virtio compatible ethernet device for gue=
st.
> > >=20
> > > SR-IOV is not a must, any mdev device that implements the API defined=
 in
> > > patch 5 can be used by this framework.
> > What I'm trying to understand is: if you want to present a virtio-pci
> > device to the guest (e.g. using vhost-mdev or vhost-vfio), then how is
> > that related to this patch series?
>=20
>=20
> This series introduce some infrastructure that would be used by vhost-mde=
v:
>=20
> 1) allow new type of mdev devices/drivers other than vfio (through class_=
id
> and device ops)
>=20
> 2) a set of virtio specific callbacks that will be used by both vhost-mdev
> and virtio-mdev defined in patch 5
>=20
> Then vhost-mdev can be implemented on top: a new mdev class id but reuse =
the
> callback defined in 2. Through this way the parent can provides a single =
set
> of callbacks (device ops) for both kernel virtio driver (through
> virtio-mdev) or userspace virtio driver (through vhost-mdev).

Okay, thanks for explaining!

Stefan

--Pql/uPZNXIm1JCle
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2oN8wACgkQnKSrs4Gr
c8gqswf/fQBq+qX21L3QGLUXUsf7OZ9kLP3ksR+9RYfGDJaFva/fV/aULknTmAiO
OA0s+Eiw7K5Hy2ooKGPQXPYgAJhgnHqmhKgOEdsOGDWyCilYAiJzk/YXkpPvaCTp
ovWC5Fz/shXyY3m2YGPXuwnWjbCam7cqMCRVPrmzJWoS6kdvsYsPxBVnhGFOm0Ms
gbll/8mZQDQWsOZ8ZFeXLXCcHifXaiLa+yiGcZfxtV37oHsSapT+MOXEstGy4jEe
uvos/V8tSLLMOJ+zgMYGOI0oOJIejMOrLU2zxPlktTbBVcM1RQtpJL69F30gi89K
qCue5w57Z1UNfPVbXLiobIkPcZBGVw==
=EXDt
-----END PGP SIGNATURE-----

--Pql/uPZNXIm1JCle--

--===============0419971690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0419971690==--
