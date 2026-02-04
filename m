Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIiqF2d6g2kpnwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:57:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6CEEAA24
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C29710E6E5;
	Wed,  4 Feb 2026 16:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="4E9zDR/3";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="kUnfeGhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416FC10E6E5;
 Wed,  4 Feb 2026 16:57:06 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 56E537A00E6;
 Wed,  4 Feb 2026 11:57:04 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Wed, 04 Feb 2026 11:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1770224224;
 x=1770310624; bh=DMO79s1OU3juZ2+ahMo1gfPAr0s4Mn0ZEH9LRYL3vv0=; b=
 4E9zDR/3sr/FZ2Suz9hMpeD0Lnw9/HEY8CCWzuPTFUlCRgk/07X0XK4fG5aGG2li
 0fatEfbpn9z0k5kHRO4s/aH7Pm+5fLGf9Cu5wSPzt2+oFxUejLwYdnAo8+vTTtX0
 ppcuN4ypbdJkwOnXruWUQfw/0GT3rbfK3qQN9Mnf08mCo5AQBaBvPSlPSoRMUoTj
 iOXZEEkeA5xumAOiILKyx2I67bELe3qIddtsmC285w1VcTp+a7ofilThoTsvX+zx
 pO0/xWe8ljTI1odRRCmkzLFYSCFSpo5gzpclcgcbTGb3ljTcYnxK7Y9V/wpzpMyn
 zoAKW1DjfBti4jaWXz/GAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770224224; x=
 1770310624; bh=DMO79s1OU3juZ2+ahMo1gfPAr0s4Mn0ZEH9LRYL3vv0=; b=k
 UnfeGhB0XVIKkpNpr8r70uuFr+yVF4eXt8iIIRXXxj95qP0Utymcq8DPgYCYAIIU
 rEZGNuaB9G2Hn8XWUbdjTJ7y+DRD46zwKbYrPKP6U88INPsxVMbH1degOaxJIodR
 DKEX0B82teBXAIjtNB6G/+CBnk6SMyNskXcPOfYXJ9PCn1LgJrYuY33kwxQBiJSM
 +bxQJpKCVUNBF6ZzDSvQpb+hCK42zD5zrqVNNoIJeD/wSgKP3zU2ZFszbQlu1ELm
 Xs7ysqb+/GUvegntZfforGYZ/CMyDHerVQYaW4NKWptMZ1z+aeAET2E/KP/TYGkf
 KeEnDgEP8FPVgaex9yV8Q==
X-ME-Sender: <xms:X3qDaUU0AqgtEAaCCzgguyzs4VTVV-B9kuHBFv5L_ryHbFAQ9OwzZw>
 <xme:X3qDaaencOx4yFHctpjA0hJGKxhuLLru0_1AbJdrHzSTklmYn0UWK3zvzB6INNMEb
 CDFZESzmQYzf5ASb8dYI7zOBfA7lnegmkzmNWWr00fEDEliSgPN3QI>
X-ME-Received: <xmr:X3qDadCoS01ZWLJgy9mJqR9Qk8BNz9b7GJi9TFpc7v-Xz0c9ZWRayowlhhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvleejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpeetlhgvgicu
 hghilhhlihgrmhhsohhnuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtffrrg
 htthgvrhhnpeeuvdevudfhleehgfffiefggfevkefhfeffheetfeejffekteeffffgffek
 ueeuteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghlvgigsehshhgriigsohhtrdhorhhg
 pdhnsggprhgtphhtthhopeefgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptg
 hhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtoheplhgvohhn
 sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsuhhmihhtrdhsvghmfigrlheslhhinh
 grrhhordhorhhgpdhrtghpthhtoheprghlvgigrghnuggvrhdruggvuhgthhgvrhesrghm
 ugdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpth
 htohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehkrhgrgigvlhesrhgv
 ughhrghtrdgtohhmpdhrtghpthhtohepughmihhtrhihrdhoshhiphgvnhhkohestgholh
 hlrggsohhrrgdrtghomhdprhgtphhtthhopehguhhrtghhvghtrghnshhinhhghhestghh
 rhhomhhiuhhmrdhorhhg
X-ME-Proxy: <xmx:X3qDaR0JC3aeBgGCL3SOTruPcgJhXN56_tA0WN7RgTXmz9g5vEPb9w>
 <xmx:X3qDaelkK6umwX2N7Cdn9igho2SY9UaXjO4UA7aD9BS4Prz5hLK1hg>
 <xmx:X3qDaVHu61HKpx7M9FbvEcxQjBMz7-wYzb44ioDNXWX0Ucq2z4-t9w>
 <xmx:X3qDaY3TnQgDqkgcBOz_No8JKgaBYtcvxf4UXBj0ym1YuPCsROzXHA>
 <xmx:YHqDaYePnLUlo7-KxZzLGmru0GCtmPoyKuPCBDWjbJzvd7OHBc1kp6lU>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 11:57:00 -0500 (EST)
Date: Wed, 4 Feb 2026 09:56:59 -0700
From: Alex Williamson <alex@shazbot.org>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v7 7/8] vfio: Permit VFIO to work with pinned importers
Message-ID: <20260204095659.5a983af2@shazbot.org>
In-Reply-To: <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260131-dmabuf-revoke-v7-7-463d956bd527@nvidia.com>
 <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm2,messagingengine.com:s=fm3];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,messagingengine.com:dkim,shazbot.org:email,shazbot.org:dkim,shazbot.org:mid,amd.com:email,nvidia.com:email,intel.com:email]
X-Rspamd-Queue-Id: 8A6CEEAA24
X-Rspamd-Action: no action

On Wed, 4 Feb 2026 17:21:45 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 1/31/26 06:34, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> >=20
> > Till now VFIO has rejected pinned importers, largely to avoid being used
> > with the RDMA pinned importer that cannot handle a move_notify() to rev=
oke
> > access.
> >=20
> > Using dma_buf_attach_revocable() it can tell the difference between pin=
ned
> > importers that support the flow described in dma_buf_invalidate_mapping=
s()
> > and those that don't.
> >=20
> > Thus permit compatible pinned importers.
> >=20
> > This is one of two items IOMMUFD requires to remove its private interfa=
ce
> > to VFIO's dma-buf.
> >=20
> > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > Reviewed-by: Alex Williamson <alex@shazbot.org>
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_dmabuf.c | 15 +++------------
> >  1 file changed, 3 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio=
_pci_dmabuf.c
> > index 78d47e260f34..a5fb80e068ee 100644
> > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > @@ -22,16 +22,6 @@ struct vfio_pci_dma_buf {
> >  	u8 revoked : 1;
> >  };
> > =20
> > -static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
> > -{
> > -	return -EOPNOTSUPP;
> > -}
> > -
> > -static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachme=
nt)
> > -{
> > -	/* Do nothing */
> > -}
> > - =20
>=20
> This chunk here doesn't want to apply to drm-misc-next, my educated
> guess is that the patch adding those lines is missing in that tree.
>=20
> How should we handle that? Patches 1-3 have already been pushed to
> drm-misc-next and I would rather like to push patches 4-6 through
> that branch as well.
>=20
> I can request a backmerge from the drm-misc-next maintainers, but
> then we clearly don't get that upstream this week.

Hmm, drm-next already has a backmerge up to v6.19-rc7, the patch here is
based on a commit merged in rc8.  The tag for that change was based on
rc6.  It can be found here:

https://github.com/awilliam/linux-vfio.git tags/vfio-v6.19-rc8

As the same tag Linus merged in:

1f97d9dcf536 ("Merge tag 'vfio-v6.19-rc8' of https://github.com/awilliam/li=
nux-vfio")

drm-misc-next only seems to be based on v6.19-rc1 though, so I don't
know that any of that helps.  Thanks,

Alex

> >  static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> >  				   struct dma_buf_attachment
> > *attachment) {
> > @@ -43,6 +33,9 @@ static int vfio_pci_dma_buf_attach(struct dma_buf
> > *dmabuf, if (priv->revoked)
> >  		return -ENODEV;
> > =20
> > +	if (!dma_buf_attach_revocable(attachment))
> > +		return -EOPNOTSUPP;
> > +
> >  	return 0;
> >  }
> > =20
> > @@ -107,8 +100,6 @@ static void vfio_pci_dma_buf_release(struct
> > dma_buf *dmabuf) }
> > =20
> >  static const struct dma_buf_ops vfio_pci_dmabuf_ops =3D {
> > -	.pin =3D vfio_pci_dma_buf_pin,
> > -	.unpin =3D vfio_pci_dma_buf_unpin,
> >  	.attach =3D vfio_pci_dma_buf_attach,
> >  	.map_dma_buf =3D vfio_pci_dma_buf_map,
> >  	.unmap_dma_buf =3D vfio_pci_dma_buf_unmap,
> >  =20
>=20
>=20

