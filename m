Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8A1D3B8A5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 21:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51C310E511;
	Mon, 19 Jan 2026 20:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="P1XnC/36";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ub2M62RE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A5A10E511
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:39:41 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 0641114003D8;
 Mon, 19 Jan 2026 15:39:41 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Mon, 19 Jan 2026 15:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1768855181;
 x=1768941581; bh=FBdWTk6CLd7WzHVr+BniKWIMiLwjgEIx9h33mejtkC4=; b=
 P1XnC/36fYykJJ9hnqqSF7UNj0QHCjJgtc8y3GJ6ukEpTAJqf56qB0vn4rQdanq/
 ofjcBtKyivy1Km7zJZYqh9Zp5VXsG1knNw2ILGRIiuKRz4AeO0+i/yIsTJER3fWp
 CjeX4jMzosIIICpTRnolIew+Ew/06hKDsFVgcazeS6/Dl4+bTBfa2hmJyU5Mf9hs
 4THLLOq5lg+WVCwHIdvFK45O+I12DJ4OuSu6kW1nflmCl2ilYHwM7EbQXTYW4gR4
 7p8tefrcMbcrc0YnW8JstgfX9dScl/jwqyi+gKdmsO3L6rnL+A2lgBz0zzG68F4K
 9YcRVwhbBNq76aXa5M6Vkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768855181; x=
 1768941581; bh=FBdWTk6CLd7WzHVr+BniKWIMiLwjgEIx9h33mejtkC4=; b=U
 b2M62REKHprj2NiRN7bNn/j7uYcseRMwk/iE7FqETvSL8QPL8fWor1aqIiZfT0vi
 pkHbIm0ydLrQdMkr7ECyMdeWa/3dNWYklYMAufrzZUzb7w/yxw8AbmN6vu6sGwJ3
 v2eS7eXk+YH8FtTQezbtgvmtwLZzmmZdYN9YbZnME2P0BMa+eo0qTzeEj3ewf9uA
 knfSQtuGOm7SdAK8q70kAmlBcXUE7qyDwgGl1kkGGKb3k3kfZh2VWYZOHHYTLhX3
 d5qUCEmTc3S/Q1Ea8jg1X9nPe4kUuXeBfxUVOm6I0xrHtlLHup9cJOs6QyiVx/7o
 iUphbhdNvvNSmKwmLs75w==
X-ME-Sender: <xms:i5ZuafTUgcayBDnaDZ8yDTipSw_jpQebmpIGZZLmXkFXWppyWBZgdA>
 <xme:i5ZuaVq7XJDTnZZ7v2BbwMlv4oBszoWhusrocVsnkZEFnlg0fdlvesIaiT8mx4lHe
 LsTaqweB6LSC2T2-8GJZzbdpVEhq81yFAlta-SXK4knx-F-gE-MHA>
X-ME-Received: <xmr:i5ZuadbpEr4MLpr4RVFVKR8cig5phbMu9010vXXUbNhDA7uXnG3ujsX4It0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeekheegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpeetlhgvgicu
 hghilhhlihgrmhhsohhnuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtffrrg
 htthgvrhhnpeetuefgleefhfdvueegffdtffevhfffgfffiedutdetgffhheejtdekfeek
 ieehgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghlvgigsehshhgriigsohhtrdhorhhg
 pdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplh
 gvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehv
 ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhish
 htshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnrghrohdqmhhm
 qdhsihhgsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqd
 hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehiohhmmhhu
 sehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepkhhvmhesvhhgvghrrdhkvg
 hrnhgvlhdrohhrghdprhgtphhtthhopehsuhhmihhtrdhsvghmfigrlheslhhinhgrrhho
 rdhorhhgpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtoh
 hm
X-ME-Proxy: <xmx:i5ZuaQQjb-1iZXZxx1XoHH3oBltF_1jZw1Uy74MVDv4Tx3SNVeQk2A>
 <xmx:i5Zuabdni7r3rs7uS6cXUPkdvZDTtpYo7_QmJaG6qi9KXhEi6ZOZ2g>
 <xmx:i5Zuafl8sE7RC1vxkqw9TpG6v9zgIXmZQydq7x8z2MeThz34ntXLeA>
 <xmx:i5ZuaQilZLD1rPx47evUb8GhlOIopeOC1mJTBX-cqbxpd3WFlZEkkA>
 <xmx:jZZuaYE6MQFViaKOq8g2Z3Bl3liKI28dVxcFL6GsTsdDSO9ji5U-6dwm>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jan 2026 15:39:38 -0500 (EST)
Date: Mon, 19 Jan 2026 13:38:38 -0700
From: Alex Williamson <alex@shazbot.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian
 <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Yishai Hadas
 <yishaih@nvidia.com>, Shameer Kolothum <skolothumtho@nvidia.com>, Ankit
 Agrawal <ankita@nvidia.com>, Matthew Wilcox <willy@infradead.org>, Jens
 Axboe <axboe@kernel.dk>
Subject: Re: types: reuse common phys_vec type instead of DMABUF
 =?UTF-8?B?b3BlbuKAkWNvZGVk?= variant
Message-ID: <20260119133838.66203b01@shazbot.org>
In-Reply-To: <20260107-convert-to-pvec-v1-1-6e3ab8079708@nvidia.com>
References: <20260107-convert-to-pvec-v1-1-6e3ab8079708@nvidia.com>
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

On Wed,  7 Jan 2026 11:14:14 +0200
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
>=20
> After commit fcf463b92a08 ("types: move phys_vec definition to common hea=
der"),
> we can use the shared phys_vec type instead of the DMABUF=E2=80=91specific
> dma_buf_phys_vec, which duplicated the same structure and semantics.
>=20
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
> Alex,
>=20
> According to diffstat, VFIO is the subsystem with the largest set of chan=
ges,
> so it would be great if you could take it through your tree.
>=20
> The series is based on the for-7.0/blk-pvec shared branch from Jens:
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=3D=
for-7.0/blk-pvec

Applied to vfio next branch for v6.20/7.0 and pushed tag
common_phys_vec_via_vfio including this commit and dependency.
Thanks,

Alex


> ---
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-kernel@vger.kernel.org
> Cc: iommu@lists.linux.dev
> Cc: kvm@vger.kernel.org
> To: Sumit Semwal <sumit.semwal@linaro.org>
> To: Christian K=C3=B6nig <christian.koenig@amd.com>
> To: Jason Gunthorpe <jgg@ziepe.ca>
> To: Kevin Tian <kevin.tian@intel.com>
> To: Joerg Roedel <joro@8bytes.org>
> To: Will Deacon <will@kernel.org>
> To: Robin Murphy <robin.murphy@arm.com>
> To: Yishai Hadas <yishaih@nvidia.com>
> To: Shameer Kolothum <skolothumtho@nvidia.com>
> To: Ankit Agrawal <ankita@nvidia.com>
> To: Alex Williamson <alex@shazbot.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Jens Axboe <axboe@kernel.dk>
> ---
>  drivers/dma-buf/dma-buf-mapping.c       |  6 +++---
>  drivers/iommu/iommufd/io_pagetable.h    |  2 +-
>  drivers/iommu/iommufd/iommufd_private.h |  5 ++---
>  drivers/iommu/iommufd/pages.c           |  4 ++--
>  drivers/iommu/iommufd/selftest.c        |  2 +-
>  drivers/vfio/pci/nvgrace-gpu/main.c     |  2 +-
>  drivers/vfio/pci/vfio_pci_dmabuf.c      |  8 ++++----
>  include/linux/dma-buf-mapping.h         |  2 +-
>  include/linux/dma-buf.h                 | 10 ----------
>  include/linux/vfio_pci_core.h           | 13 ++++++-------
>  10 files changed, 21 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-=
mapping.c
> index b7352e609fbd..174677faa577 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -33,8 +33,8 @@ static struct scatterlist *fill_sg_entry(struct scatter=
list *sgl, size_t length,
>  }
> =20
>  static unsigned int calc_sg_nents(struct dma_iova_state *state,
> -				  struct dma_buf_phys_vec *phys_vec,
> -				  size_t nr_ranges, size_t size)
> +				  struct phys_vec *phys_vec, size_t nr_ranges,
> +				  size_t size)
>  {
>  	unsigned int nents =3D 0;
>  	size_t i;
> @@ -91,7 +91,7 @@ struct dma_buf_dma {
>   */
>  struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *atta=
ch,
>  					 struct p2pdma_provider *provider,
> -					 struct dma_buf_phys_vec *phys_vec,
> +					 struct phys_vec *phys_vec,
>  					 size_t nr_ranges, size_t size,
>  					 enum dma_data_direction dir)
>  {
> diff --git a/drivers/iommu/iommufd/io_pagetable.h b/drivers/iommu/iommufd=
/io_pagetable.h
> index 14cd052fd320..27e3e311d395 100644
> --- a/drivers/iommu/iommufd/io_pagetable.h
> +++ b/drivers/iommu/iommufd/io_pagetable.h
> @@ -202,7 +202,7 @@ struct iopt_pages_dmabuf_track {
> =20
>  struct iopt_pages_dmabuf {
>  	struct dma_buf_attachment *attach;
> -	struct dma_buf_phys_vec phys;
> +	struct phys_vec phys;
>  	/* Always PAGE_SIZE aligned */
>  	unsigned long start;
>  	struct list_head tracker;
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iomm=
ufd/iommufd_private.h
> index eb6d1a70f673..6ac1965199e9 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -20,7 +20,6 @@ struct iommu_group;
>  struct iommu_option;
>  struct iommufd_device;
>  struct dma_buf_attachment;
> -struct dma_buf_phys_vec;
> =20
>  struct iommufd_sw_msi_map {
>  	struct list_head sw_msi_item;
> @@ -718,7 +717,7 @@ int __init iommufd_test_init(void);
>  void iommufd_test_exit(void);
>  bool iommufd_selftest_is_mock_dev(struct device *dev);
>  int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachme=
nt,
> -				     struct dma_buf_phys_vec *phys);
> +				     struct phys_vec *phys);
>  #else
>  static inline void iommufd_test_syz_conv_iova_id(struct iommufd_ucmd *uc=
md,
>  						 unsigned int ioas_id,
> @@ -742,7 +741,7 @@ static inline bool iommufd_selftest_is_mock_dev(struc=
t device *dev)
>  }
>  static inline int
>  iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
> -				 struct dma_buf_phys_vec *phys)
> +				 struct phys_vec *phys)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
> index dbe51ecb9a20..bababd564cf9 100644
> --- a/drivers/iommu/iommufd/pages.c
> +++ b/drivers/iommu/iommufd/pages.c
> @@ -1077,7 +1077,7 @@ static int pfn_reader_user_update_pinned(struct pfn=
_reader_user *user,
>  }
> =20
>  struct pfn_reader_dmabuf {
> -	struct dma_buf_phys_vec phys;
> +	struct phys_vec phys;
>  	unsigned long start_offset;
>  };
> =20
> @@ -1460,7 +1460,7 @@ static struct dma_buf_attach_ops iopt_dmabuf_attach=
_revoke_ops =3D {
>   */
>  static int
>  sym_vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
> -				 struct dma_buf_phys_vec *phys)
> +				 struct phys_vec *phys)
>  {
>  	typeof(&vfio_pci_dma_buf_iommufd_map) fn;
>  	int rc;
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/sel=
ftest.c
> index 550ff36dec3a..989d8c4c60a7 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -2002,7 +2002,7 @@ static const struct dma_buf_ops iommufd_test_dmabuf=
_ops =3D {
>  };
> =20
>  int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachme=
nt,
> -				     struct dma_buf_phys_vec *phys)
> +				     struct phys_vec *phys)
>  {
>  	struct iommufd_test_dma_buf *priv =3D attachment->dmabuf->priv;
> =20
> diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgra=
ce-gpu/main.c
> index 84d142a47ec6..a0f4edd6a30b 100644
> --- a/drivers/vfio/pci/nvgrace-gpu/main.c
> +++ b/drivers/vfio/pci/nvgrace-gpu/main.c
> @@ -784,7 +784,7 @@ nvgrace_gpu_write(struct vfio_device *core_vdev,
>  static int nvgrace_get_dmabuf_phys(struct vfio_pci_core_device *core_vde=
v,
>  				   struct p2pdma_provider **provider,
>  				   unsigned int region_index,
> -				   struct dma_buf_phys_vec *phys_vec,
> +				   struct phys_vec *phys_vec,
>  				   struct vfio_region_dma_range *dma_ranges,
>  				   size_t nr_ranges)
>  {
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_p=
ci_dmabuf.c
> index d4d0f7d08c53..9a84c238c013 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -14,7 +14,7 @@ struct vfio_pci_dma_buf {
>  	struct vfio_pci_core_device *vdev;
>  	struct list_head dmabufs_elm;
>  	size_t size;
> -	struct dma_buf_phys_vec *phys_vec;
> +	struct phys_vec *phys_vec;
>  	struct p2pdma_provider *provider;
>  	u32 nr_ranges;
>  	u8 revoked : 1;
> @@ -94,7 +94,7 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops =3D=
 {
>   *    will fail if it is currently revoked
>   */
>  int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
> -				 struct dma_buf_phys_vec *phys)
> +				 struct phys_vec *phys)
>  {
>  	struct vfio_pci_dma_buf *priv;
> =20
> @@ -116,7 +116,7 @@ int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attac=
hment *attachment,
>  }
>  EXPORT_SYMBOL_FOR_MODULES(vfio_pci_dma_buf_iommufd_map, "iommufd");
> =20
> -int vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
> +int vfio_pci_core_fill_phys_vec(struct phys_vec *phys_vec,
>  				struct vfio_region_dma_range *dma_ranges,
>  				size_t nr_ranges, phys_addr_t start,
>  				phys_addr_t len)
> @@ -148,7 +148,7 @@ EXPORT_SYMBOL_GPL(vfio_pci_core_fill_phys_vec);
>  int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
>  				  struct p2pdma_provider **provider,
>  				  unsigned int region_index,
> -				  struct dma_buf_phys_vec *phys_vec,
> +				  struct phys_vec *phys_vec,
>  				  struct vfio_region_dma_range *dma_ranges,
>  				  size_t nr_ranges)
>  {
> diff --git a/include/linux/dma-buf-mapping.h b/include/linux/dma-buf-mapp=
ing.h
> index a3c0ce2d3a42..09bde3f748e4 100644
> --- a/include/linux/dma-buf-mapping.h
> +++ b/include/linux/dma-buf-mapping.h
> @@ -9,7 +9,7 @@
> =20
>  struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *atta=
ch,
>  					 struct p2pdma_provider *provider,
> -					 struct dma_buf_phys_vec *phys_vec,
> +					 struct phys_vec *phys_vec,
>  					 size_t nr_ranges, size_t size,
>  					 enum dma_data_direction dir);
>  void dma_buf_free_sgt(struct dma_buf_attachment *attach, struct sg_table=
 *sgt,
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 0bc492090237..400a5311368e 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -531,16 +531,6 @@ struct dma_buf_export_info {
>  	void *priv;
>  };
> =20
> -/**
> - * struct dma_buf_phys_vec - describe continuous chunk of memory
> - * @paddr:   physical address of that chunk
> - * @len:     Length of this chunk
> - */
> -struct dma_buf_phys_vec {
> -	phys_addr_t paddr;
> -	size_t len;
> -};
> -
>  /**
>   * DEFINE_DMA_BUF_EXPORT_INFO - helper macro for exporters
>   * @name: export-info name
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> index 706877f998ff..2ac288bb2c60 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -28,7 +28,6 @@
>  struct vfio_pci_core_device;
>  struct vfio_pci_region;
>  struct p2pdma_provider;
> -struct dma_buf_phys_vec;
>  struct dma_buf_attachment;
> =20
>  struct vfio_pci_eventfd {
> @@ -62,25 +61,25 @@ struct vfio_pci_device_ops {
>  	int (*get_dmabuf_phys)(struct vfio_pci_core_device *vdev,
>  			       struct p2pdma_provider **provider,
>  			       unsigned int region_index,
> -			       struct dma_buf_phys_vec *phys_vec,
> +			       struct phys_vec *phys_vec,
>  			       struct vfio_region_dma_range *dma_ranges,
>  			       size_t nr_ranges);
>  };
> =20
>  #if IS_ENABLED(CONFIG_VFIO_PCI_DMABUF)
> -int vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
> +int vfio_pci_core_fill_phys_vec(struct phys_vec *phys_vec,
>  				struct vfio_region_dma_range *dma_ranges,
>  				size_t nr_ranges, phys_addr_t start,
>  				phys_addr_t len);
>  int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
>  				  struct p2pdma_provider **provider,
>  				  unsigned int region_index,
> -				  struct dma_buf_phys_vec *phys_vec,
> +				  struct phys_vec *phys_vec,
>  				  struct vfio_region_dma_range *dma_ranges,
>  				  size_t nr_ranges);
>  #else
>  static inline int
> -vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
> +vfio_pci_core_fill_phys_vec(struct phys_vec *phys_vec,
>  			    struct vfio_region_dma_range *dma_ranges,
>  			    size_t nr_ranges, phys_addr_t start,
>  			    phys_addr_t len)
> @@ -89,7 +88,7 @@ vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *ph=
ys_vec,
>  }
>  static inline int vfio_pci_core_get_dmabuf_phys(
>  	struct vfio_pci_core_device *vdev, struct p2pdma_provider **provider,
> -	unsigned int region_index, struct dma_buf_phys_vec *phys_vec,
> +	unsigned int region_index, struct phys_vec *phys_vec,
>  	struct vfio_region_dma_range *dma_ranges, size_t nr_ranges)
>  {
>  	return -EOPNOTSUPP;
> @@ -228,6 +227,6 @@ static inline bool is_aligned_for_order(struct vm_are=
a_struct *vma,
>  }
> =20
>  int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
> -				 struct dma_buf_phys_vec *phys);
> +				 struct phys_vec *phys);
> =20
>  #endif /* VFIO_PCI_CORE_H */
>=20
> ---
> base-commit: fcf463b92a08686d1aeb1e66674a72eb7a8bfb9b
> change-id: 20260107-convert-to-pvec-bf04dfcf3d12
>=20
> Best regards,
> -- =20
> Leon Romanovsky <leonro@nvidia.com>
>=20
>=20

