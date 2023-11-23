Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD217F5543
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 01:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6915610E6BC;
	Thu, 23 Nov 2023 00:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661D810E004;
 Thu, 23 Nov 2023 00:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700699164; x=1732235164;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=kMJqNQrPFkouBUmP1tIxtozSsYheDkR/LnL4F11wiis=;
 b=a0RMRtdr45SnsHLYk3kiLIfZs2Z292eQtCjDOGkSajq4kJgqoPyPz1Z8
 xhWoNH51ino8oe9+Nmimsn7SFdTQgw8cA/qSM06asNrV9XlVmhWFA6efE
 bx/KJxGEkz9CgKaAcRip2AVvQj244oSCMbQ2SV3R4DIR0CTNKXPPkI00S
 8UPzwDbKGWrNEIvyOLU2GF23JoceIic+G88FMkrhNsWS/7MACg0sIjNMf
 ijDW0ytrIcjGYvd6MSyu2liYjeaUIruC6bgfya5Y7v4Nc28NcFQbnBBQQ
 f0zW1UCdi/Sb7g9NYp8o9b8iKurHqbTYEdk8doLf35VPgtN8OmhSA3u25 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389323007"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
 d="asc'?scan'208";a="389323007"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 16:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="716903060"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
 d="asc'?scan'208";a="716903060"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by orsmga003.jf.intel.com with ESMTP; 22 Nov 2023 16:25:45 -0800
Date: Thu, 23 Nov 2023 08:24:24 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v2 1/4] i915: make inject_virtual_interrupt() void
Message-ID: <ZV6buHrQy2+CJ7xX@debian-scheme>
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
 <20231122-vfs-eventfd-signal-v2-1-bd549b14ce0c@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ehCOKC0wDaVXxQlM"
Content-Disposition: inline
In-Reply-To: <20231122-vfs-eventfd-signal-v2-1-bd549b14ce0c@kernel.org>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: linux-aio@kvack.org, linux-s390@vger.kernel.org, linux-usb@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>,
 netdev@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>, Fei Li <fei1.li@intel.com>,
 x86@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Shakeel Butt <shakeelb@google.com>, Heiko Carstens <hca@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Borislav Petkov <bp@alien8.de>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Moritz Fischer <mdf@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ehCOKC0wDaVXxQlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.11.22 13:48:22 +0100, Christian Brauner wrote:
> The single caller of inject_virtual_interrupt() ignores the return value
> anyway. This allows us to simplify eventfd_signal() in follow-up
> patches.
>=20
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> ---
>  drivers/gpu/drm/i915/gvt/interrupt.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/=
gvt/interrupt.c
> index de3f5903d1a7..9665876b4b13 100644
> --- a/drivers/gpu/drm/i915/gvt/interrupt.c
> +++ b/drivers/gpu/drm/i915/gvt/interrupt.c
> @@ -422,7 +422,7 @@ static void init_irq_map(struct intel_gvt_irq *irq)
>  #define MSI_CAP_DATA(offset) (offset + 8)
>  #define MSI_CAP_EN 0x1
> =20
> -static int inject_virtual_interrupt(struct intel_vgpu *vgpu)
> +static void inject_virtual_interrupt(struct intel_vgpu *vgpu)
>  {
>  	unsigned long offset =3D vgpu->gvt->device_info.msi_cap_offset;
>  	u16 control, data;
> @@ -434,10 +434,10 @@ static int inject_virtual_interrupt(struct intel_vg=
pu *vgpu)
> =20
>  	/* Do not generate MSI if MSIEN is disabled */
>  	if (!(control & MSI_CAP_EN))
> -		return 0;
> +		return;
> =20
>  	if (WARN(control & GENMASK(15, 1), "only support one MSI format\n"))
> -		return -EINVAL;
> +		return;
> =20
>  	trace_inject_msi(vgpu->id, addr, data);
> =20
> @@ -451,10 +451,10 @@ static int inject_virtual_interrupt(struct intel_vg=
pu *vgpu)
>  	 * returned and don't inject interrupt into guest.
>  	 */
>  	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
> -		return -ESRCH;
> -	if (vgpu->msi_trigger && eventfd_signal(vgpu->msi_trigger, 1) !=3D 1)
> -		return -EFAULT;
> -	return 0;
> +		return;
> +	if (!vgpu->msi_trigger)
> +		return;
> +	eventfd_signal(vgpu->msi_trigger, 1);
>  }

I think it's a little simpler to write as
    if (vgpu->msi_trigger)
            eventfd_signal(vgpu->msi_trigger, 1);

Looks fine with me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

> =20
>  static void propagate_event(struct intel_gvt_irq *irq,
>=20
> --=20
> 2.42.0
>=20

--ehCOKC0wDaVXxQlM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZV6bswAKCRCxBBozTXgY
JySHAJ4qE2jv0i0ZauQv+Bv/bGwHt0ZrbACeJadIIL6gQC6kmoICLhyqplCwOeo=
=1+t0
-----END PGP SIGNATURE-----

--ehCOKC0wDaVXxQlM--
