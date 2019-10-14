Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D114ED6FF2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2DE6E60E;
	Tue, 15 Oct 2019 07:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6731F6E0EC;
 Mon, 14 Oct 2019 17:39:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id b24so17575136wmj.5;
 Mon, 14 Oct 2019 10:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lNZVpaEdmaJY1w+xpL+K9ZqQ92uD6Jfe5E6lniBjnvM=;
 b=bOGgmG6+MRM12ZM/OQFBfro5Rtm8HINi02/EkiIAmLQcw64J3BJT2IHdFKZNcLe9j4
 EUSY8tm2R1ACbgOaj0NSGqP4FbL56VoYTyW1sYridK96Fjhvi/Yf1TArdeJOBymqptba
 pwMdJkyo0PXI3lDqEiczhvSW7np2uyJ+v7UVNNYTwi120D87eVRe2w5aNWG+0ZtR44EF
 e1f2knAY9TsDkk8No4bGS7pRYiUme0JFWICGpoLOXM3EVNK3LqGOOPsrzjGb5cjky3/Y
 dB7ZyBYR1494YJ7VCL2nDkqxtMQD/nXHvTMQRtVfcx7ZC44cHyPS6tuIvxp6Mh+v7zI8
 VWIg==
X-Gm-Message-State: APjAAAXlGrbwj/oWKK5330T7bdOIy2QrdFvzKfKLou1bEM+0CdT8rpTi
 3ccJ9KPVKU7kLDQMbeYshSI=
X-Google-Smtp-Source: APXvYqxufY2enniRnRIxytq9WOwNI0dKAeSWrxef8cqdYzIseEmMuayKHSwg/1yhpjk+WboQkw4UeQ==
X-Received: by 2002:a1c:bc07:: with SMTP id m7mr16018252wmf.117.1571074784999; 
 Mon, 14 Oct 2019 10:39:44 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id p5sm25687450wmi.4.2019.10.14.10.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:39:44 -0700 (PDT)
Date: Mon, 14 Oct 2019 18:39:42 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 6/7] virtio: introduce a mdev based transport
Message-ID: <20191014173942.GB5359@stefanha-x1.localdomain>
References: <20191011081557.28302-1-jasowang@redhat.com>
 <20191011081557.28302-7-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191011081557.28302-7-jasowang@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lNZVpaEdmaJY1w+xpL+K9ZqQ92uD6Jfe5E6lniBjnvM=;
 b=oY+W6FwfNZXtwQq+WhORdLOdfo+f4fhwM0p+Ers5h6CPfgtbEn9ww93kXBSsw2v60b
 SMIu2UNR6PLQJQdTuB5CZKPD7tjM5zgAWc2F3LP1dYBp/mIWLyzvE+gzbroEFBRI7Dst
 6kA8qKfdBDN33wxGZAOv+JGy3RovTItDZE4cjypr4TRa0AKUIYcxwviSXAuFpdNyQ3Ic
 P5h5NDYnWvzIBkjBiYMxqf/jo1ONlCR+e27uF8WQwLTB2ZtajymWafYs1NlkszKw2+og
 TjPkHU05jpgk0QnsRcXQ7aScuZgRRwSgOc6g7Xs1OdMStDrlfb3Y5KlSoZ09BW/JEGMk
 I4Vw==
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
Content-Type: multipart/mixed; boundary="===============1235304826=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1235304826==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 11, 2019 at 04:15:56PM +0800, Jason Wang wrote:
> +struct virtio_mdev_device {
> +	struct virtio_device vdev;
> +	struct mdev_device *mdev;
> +	unsigned long version;
> +
> +	struct virtqueue **vqs;
> +	/* The lock to protect virtqueue list */
> +	spinlock_t lock;
> +	struct list_head virtqueues;

Is this a list of struct virtio_mdev_vq_info?  Please document the
actual type in a comment.

> +static int virtio_mdev_find_vqs(struct virtio_device *vdev, unsigned nvqs,
> +				struct virtqueue *vqs[],
> +				vq_callback_t *callbacks[],
> +				const char * const names[],
> +				const bool *ctx,
> +				struct irq_affinity *desc)
> +{
> +	struct virtio_mdev_device *vm_dev = to_virtio_mdev_device(vdev);
> +	struct mdev_device *mdev = vm_get_mdev(vdev);
> +	const struct virtio_mdev_device_ops *ops = mdev_get_dev_ops(mdev);
> +	struct virtio_mdev_callback cb;
> +	int i, err, queue_idx = 0;
> +
> +	vm_dev->vqs = kmalloc_array(queue_idx, sizeof(*vm_dev->vqs),
> +				    GFP_KERNEL);

kmalloc_array(0, ...)?  I would have expected nvqs instead of queue_idx
(0).

What is this the purpose of vm_dev->vqs and does anything ever access it?

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2kst4ACgkQnKSrs4Gr
c8hQqggAsLqAScuEZRHgMYUxIlc4Hpdh283rOQFgRgPfZqq3hQ/nzKTqbn1k7DnZ
MaXQk/GXc1/mFzEwjGVoMOJ+NiZKpj5xuVN9HqKEuDuBooykO5wKnbwkm6kAs/gG
/10A4I5fkyOUHB+xRkaM/3g9UJgo/yB/oI7yQonKFI3VNQc/Q0vcAWUkUbyoZyZA
WO5IJoOR9nF7g6kkYLT0ik26WZFVsBruKTsifLsCJTCQMWo8dJpvgJpGvo/k07YZ
kWYC8J+K/SRA9gpvDBCfkPRQGMgq7CiE0C+VfoGVo11TuFd6FlkjjYmBIPXYek98
rK1ONn6f4qY+67eRJ77oiNeFsj4eYw==
=7Qm5
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--

--===============1235304826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1235304826==--
