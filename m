Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D18756C149
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC2010E7F1;
	Fri,  8 Jul 2022 20:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E9A10E7C5;
 Fri,  8 Jul 2022 20:29:55 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268KSKMB010818;
 Fri, 8 Jul 2022 20:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=lW46W2PRaahzaHdVp3IUZrPef4tdvBdHN8TfIRlEvoU=;
 b=gNLcrSJq5UCS1zDQr+MOb68VUgdu3S+axwVn/WRu6R2iHj5bXah3Q3Lgtw2xcZY/s50M
 mca46WsPNcSU60s3gXM9jTHEq+GYy7RkfLlNZf02BnTOTB7877S/LwkmsClERYmCF7u/
 aCcQ7ybEbIY9/4fY6ORei8v0wAV3ffhTJw9u47seoAb5AEIatYykx1emRX5Ybsg/CwLs
 mWx9t6xKBpYgHZoqTxDQVQ21rUsnN/P0WMY0Ns0ljyGHMq94NwZFA2ikXDXC/on+dfrq
 XLZ4UpccyX8Senq4D62iX0S0Vw94ayEUA8n/mxpvMsZSrpJCSteSSykJanni8wlN6+6u xA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6q9upmkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:29:50 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 268KTnxi022806;
 Fri, 8 Jul 2022 20:29:49 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6q9upmk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:29:49 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 268KKgHs030808;
 Fri, 8 Jul 2022 20:29:48 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3h4uqyjeya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jul 2022 20:29:48 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 268KTl4a23396858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Jul 2022 20:29:47 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41CC02805A;
 Fri,  8 Jul 2022 20:29:47 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0AC228060;
 Fri,  8 Jul 2022 20:29:41 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.38.121])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  8 Jul 2022 20:29:41 +0000 (GMT)
Message-ID: <9c3c741dce95939c7387544ef82e5d88a669d7de.camel@linux.ibm.com>
Subject: Re: [RFT][PATCH v2 9/9] vfio: Replace phys_pfn with pages for
 vfio_pin_pages()
From: Eric Farman <farman@linux.ibm.com>
To: Nicolin Chen <nicolinc@nvidia.com>, kwankhede@nvidia.com, corbet@lwn.net, 
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com,
 zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, daniel@ffwll.ch, mjrosato@linux.ibm.com,
 pasic@linux.ibm.com, vneethv@linux.ibm.com, oberpar@linux.ibm.com,
 freude@linux.ibm.com, akrowiak@linux.ibm.com, jjherne@linux.ibm.com,
 alex.williamson@redhat.com, cohuck@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, hch@infradead.org
Date: Fri, 08 Jul 2022 16:29:33 -0400
In-Reply-To: <20220706062759.24946-10-nicolinc@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-10-nicolinc@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kAnPOqi2It6gZoZCc-BmkGAJ481v1aBZ
X-Proofpoint-ORIG-GUID: P-shucxCf2MvGWFFm5x4MncNo5LC8u5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_17,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207080079
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, jchrist@linux.ibm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-07-05 at 23:27 -0700, Nicolin Chen wrote:
> Most of the callers of vfio_pin_pages() want "struct page *" and the
> low-level mm code to pin pages returns a list of "struct page *" too.
> So there's no gain in converting "struct page *" to PFN in between.
> 
> Replace the output parameter "phys_pfn" list with a "pages" list, to
> simplify callers. This also allows us to replace the vfio_iommu_type1
> implementation with a more efficient one.
> 
> For now, also update vfio_iommu_type1 to fit this new parameter too.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../driver-api/vfio-mediated-device.rst       |  2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              | 19 ++++++-----------
> --
>  drivers/s390/cio/vfio_ccw_cp.c                | 19 +++++++++------
> ----

Acked-by: Eric Farman <farman@linux.ibm.com>

>  drivers/s390/crypto/vfio_ap_ops.c             |  6 +++---
>  drivers/vfio/vfio.c                           |  8 ++++----
>  drivers/vfio/vfio.h                           |  2 +-
>  drivers/vfio/vfio_iommu_type1.c               | 19 +++++++++++----
> ----
>  include/linux/vfio.h                          |  2 +-
>  8 files changed, 36 insertions(+), 41 deletions(-)
> 
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst
> b/Documentation/driver-api/vfio-mediated-device.rst
> index ea32a0f13ddb..ba5fefcdae1a 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -263,7 +263,7 @@ The following APIs are provided for translating
> user pfn to host pfn in a VFIO
>  driver::
>  
>  	int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
> -				  int npage, int prot, unsigned long
> *phys_pfn);
> +				  int npage, int prot, struct page
> **pages);
>  
>  	void vfio_unpin_pages(struct vfio_device *device, dma_addr_t
> iova,
>  				    int npage);
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c
> b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index ea6041fa48ac..3a49471dcc16 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -239,7 +239,7 @@ static void gvt_unpin_guest_page(struct
> intel_vgpu *vgpu, unsigned long gfn,
>  static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long
> gfn,
>  		unsigned long size, struct page **page)
>  {
> -	unsigned long base_pfn = 0;
> +	struct page *base_page = NULL;
>  	int total_pages;
>  	int npage;
>  	int ret;
> @@ -251,26 +251,19 @@ static int gvt_pin_guest_page(struct intel_vgpu
> *vgpu, unsigned long gfn,
>  	 */
>  	for (npage = 0; npage < total_pages; npage++) {
>  		dma_addr_t cur_iova = (gfn + npage) << PAGE_SHIFT;
> -		unsigned long pfn;
> +		struct page *cur_page;
>  
>  		ret = vfio_pin_pages(&vgpu->vfio_device, cur_iova, 1,
> -				     IOMMU_READ | IOMMU_WRITE, &pfn);
> +				     IOMMU_READ | IOMMU_WRITE,
> &cur_page);
>  		if (ret != 1) {
>  			gvt_vgpu_err("vfio_pin_pages failed for iova
> %pad, ret %d\n",
>  				     &cur_iova, ret);
>  			goto err;
>  		}
>  
> -		if (!pfn_valid(pfn)) {
> -			gvt_vgpu_err("pfn 0x%lx is not mem backed\n",
> pfn);
> -			npage++;
> -			ret = -EFAULT;
> -			goto err;
> -		}
> -
>  		if (npage == 0)
> -			base_pfn = pfn;
> -		else if (base_pfn + npage != pfn) {
> +			base_page = cur_page;
> +		else if (base_page + npage != cur_page) {
>  			gvt_vgpu_err("The pages are not continuous\n");
>  			ret = -EINVAL;
>  			npage++;
> @@ -278,7 +271,7 @@ static int gvt_pin_guest_page(struct intel_vgpu
> *vgpu, unsigned long gfn,
>  		}
>  	}
>  
> -	*page = pfn_to_page(base_pfn);
> +	*page = base_page;
>  	return 0;
>  err:
>  	gvt_unpin_guest_page(vgpu, gfn, npage * PAGE_SIZE);
> diff --git a/drivers/s390/cio/vfio_ccw_cp.c
> b/drivers/s390/cio/vfio_ccw_cp.c
> index cd4ec4f6d6ff..8963f452f963 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.c
> +++ b/drivers/s390/cio/vfio_ccw_cp.c
> @@ -22,8 +22,8 @@
>  struct page_array {
>  	/* Array that stores pages need to pin. */
>  	dma_addr_t		*pa_iova;
> -	/* Array that receives PFNs of the pages pinned. */
> -	unsigned long		*pa_pfn;
> +	/* Array that receives the pinned pages. */
> +	struct page		**pa_page;
>  	/* Number of pages pinned from @pa_iova. */
>  	int			pa_nr;
>  };
> @@ -68,19 +68,19 @@ static int page_array_alloc(struct page_array
> *pa, u64 iova, unsigned int len)
>  		return -EINVAL;
>  
>  	pa->pa_iova = kcalloc(pa->pa_nr,
> -			      sizeof(*pa->pa_iova) + sizeof(*pa-
> >pa_pfn),
> +			      sizeof(*pa->pa_iova) + sizeof(*pa-
> >pa_page),
>  			      GFP_KERNEL);
>  	if (unlikely(!pa->pa_iova)) {
>  		pa->pa_nr = 0;
>  		return -ENOMEM;
>  	}
> -	pa->pa_pfn = (unsigned long *)&pa->pa_iova[pa->pa_nr];
> +	pa->pa_page = (struct page **)&pa->pa_iova[pa->pa_nr];
>  
>  	pa->pa_iova[0] = iova;
> -	pa->pa_pfn[0] = -1ULL;
> +	pa->pa_page[0] = NULL;
>  	for (i = 1; i < pa->pa_nr; i++) {
>  		pa->pa_iova[i] = pa->pa_iova[i - 1] + PAGE_SIZE;
> -		pa->pa_pfn[i] = -1ULL;
> +		pa->pa_page[i] = NULL;
>  	}
>  
>  	return 0;
> @@ -144,7 +144,7 @@ static int page_array_pin(struct page_array *pa,
> struct vfio_device *vdev)
>  
>  		ret = vfio_pin_pages(vdev, *first, npage,
>  				     IOMMU_READ | IOMMU_WRITE,
> -				     &pa->pa_pfn[pinned]);
> +				     &pa->pa_page[pinned]);
>  		if (ret < 0) {
>  			goto err_out;
>  		} else if (ret > 0 && ret != npage) {
> @@ -195,7 +195,7 @@ static inline void
> page_array_idal_create_words(struct page_array *pa,
>  	 */
>  
>  	for (i = 0; i < pa->pa_nr; i++)
> -		idaws[i] = pa->pa_pfn[i] << PAGE_SHIFT;
> +		idaws[i] = page_to_phys(pa->pa_page[i]);
>  
>  	/* Adjust the first IDAW, since it may not start on a page
> boundary */
>  	idaws[0] += pa->pa_iova[0] & (PAGE_SIZE - 1);
> @@ -246,8 +246,7 @@ static long copy_from_iova(struct vfio_device
> *vdev, void *to, u64 iova,
>  
>  	l = n;
>  	for (i = 0; i < pa.pa_nr; i++) {
> -		struct page *page = pfn_to_page(pa.pa_pfn[i]);
> -		void *from = kmap_local_page(page);
> +		void *from = kmap_local_page(pa.pa_page[i]);
>  
>  		m = PAGE_SIZE;
>  		if (i == 0) {
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c
> b/drivers/s390/crypto/vfio_ap_ops.c
> index 6945e0ddc08c..b0972ca0dfa3 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -234,9 +234,9 @@ static struct ap_queue_status
> vfio_ap_irq_enable(struct vfio_ap_queue *q,
>  	struct ap_qirq_ctrl aqic_gisa = {};
>  	struct ap_queue_status status = {};
>  	struct kvm_s390_gisa *gisa;
> +	struct page *h_page;
>  	int nisc;
>  	struct kvm *kvm;
> -	unsigned long h_pfn;
>  	phys_addr_t h_nib;
>  	dma_addr_t nib;
>  	int ret;
> @@ -251,7 +251,7 @@ static struct ap_queue_status
> vfio_ap_irq_enable(struct vfio_ap_queue *q,
>  	}
>  
>  	ret = vfio_pin_pages(&q->matrix_mdev->vdev, nib, 1,
> -			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
> +			     IOMMU_READ | IOMMU_WRITE, &h_page);
>  	switch (ret) {
>  	case 1:
>  		break;
> @@ -267,7 +267,7 @@ static struct ap_queue_status
> vfio_ap_irq_enable(struct vfio_ap_queue *q,
>  	kvm = q->matrix_mdev->kvm;
>  	gisa = kvm->arch.gisa_int.origin;
>  
> -	h_nib = (h_pfn << PAGE_SHIFT) | (nib & ~PAGE_MASK);
> +	h_nib = page_to_phys(h_page) | (nib & ~PAGE_MASK);
>  	aqic_gisa.gisc = isc;
>  
>  	nisc = kvm_s390_gisc_register(kvm, isc);
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index b95ec2d78966..96b758e06c4a 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1917,18 +1917,18 @@
> EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
>   * @npage [in]   : count of pages to be pinned.  This count should
> not
>   *		   be greater VFIO_PIN_PAGES_MAX_ENTRIES.
>   * @prot [in]    : protection flags
> - * @phys_pfn[out]: array of host PFNs
> + * @pages[out]   : array of host pages
>   * Return error or number of pages pinned.
>   */
>  int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
> -		   int npage, int prot, unsigned long *phys_pfn)
> +		   int npage, int prot, struct page **pages)
>  {
>  	struct vfio_container *container;
>  	struct vfio_group *group = device->group;
>  	struct vfio_iommu_driver *driver;
>  	int ret;
>  
> -	if (!phys_pfn || !npage || !vfio_assert_device_open(device))
> +	if (!pages || !npage || !vfio_assert_device_open(device))
>  		return -EINVAL;
>  
>  	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
> @@ -1943,7 +1943,7 @@ int vfio_pin_pages(struct vfio_device *device,
> dma_addr_t iova,
>  	if (likely(driver && driver->ops->pin_pages))
>  		ret = driver->ops->pin_pages(container->iommu_data,
>  					     group->iommu_group, iova,
> -					     npage, prot, phys_pfn);
> +					     npage, prot, pages);
>  	else
>  		ret = -ENOTTY;
>  
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index dbcd0e8c031b..dbfad8e20581 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -52,7 +52,7 @@ struct vfio_iommu_driver_ops {
>  				     struct iommu_group *group,
>  				     dma_addr_t user_iova,
>  				     int npage, int prot,
> -				     unsigned long *phys_pfn);
> +				     struct page **pages);
>  	void		(*unpin_pages)(void *iommu_data,
>  				       dma_addr_t user_iova, int
> npage);
>  	int		(*register_notifier)(void *iommu_data,
> diff --git a/drivers/vfio/vfio_iommu_type1.c
> b/drivers/vfio/vfio_iommu_type1.c
> index f10d0c4b1f26..de342d82b154 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -830,7 +830,7 @@ static int vfio_iommu_type1_pin_pages(void
> *iommu_data,
>  				      struct iommu_group *iommu_group,
>  				      dma_addr_t user_iova,
>  				      int npage, int prot,
> -				      unsigned long *phys_pfn)
> +				      struct page **pages)
>  {
>  	struct vfio_iommu *iommu = iommu_data;
>  	struct vfio_iommu_group *group;
> @@ -840,7 +840,7 @@ static int vfio_iommu_type1_pin_pages(void
> *iommu_data,
>  	bool do_accounting;
>  	dma_addr_t iova;
>  
> -	if (!iommu || !phys_pfn)
> +	if (!iommu || !pages)
>  		return -EINVAL;
>  
>  	/* Supported for v2 version only */
> @@ -879,6 +879,7 @@ static int vfio_iommu_type1_pin_pages(void
> *iommu_data,
>  	do_accounting = list_empty(&iommu->domain_list);
>  
>  	for (i = 0; i < npage; i++) {
> +		unsigned long phys_pfn;
>  		struct vfio_pfn *vpfn;
>  
>  		iova = user_iova + PAGE_SIZE * i;
> @@ -895,23 +896,25 @@ static int vfio_iommu_type1_pin_pages(void
> *iommu_data,
>  
>  		vpfn = vfio_iova_get_vfio_pfn(dma, iova);
>  		if (vpfn) {
> -			phys_pfn[i] = vpfn->pfn;
> +			pages[i] = pfn_to_page(vpfn->pfn);
>  			continue;
>  		}
>  
>  		remote_vaddr = dma->vaddr + (iova - dma->iova);
> -		ret = vfio_pin_page_external(dma, remote_vaddr,
> &phys_pfn[i],
> +		ret = vfio_pin_page_external(dma, remote_vaddr,
> &phys_pfn,
>  					     do_accounting);
>  		if (ret)
>  			goto pin_unwind;
>  
> -		ret = vfio_add_to_pfn_list(dma, iova, phys_pfn[i]);
> +		ret = vfio_add_to_pfn_list(dma, iova, phys_pfn);
>  		if (ret) {
> -			if (put_pfn(phys_pfn[i], dma->prot) &&
> do_accounting)
> +			if (put_pfn(phys_pfn, dma->prot) &&
> do_accounting)
>  				vfio_lock_acct(dma, -1, true);
>  			goto pin_unwind;
>  		}
>  
> +		pages[i] = pfn_to_page(phys_pfn);
> +
>  		if (iommu->dirty_page_tracking) {
>  			unsigned long pgshift = __ffs(iommu-
> >pgsize_bitmap);
>  
> @@ -934,14 +937,14 @@ static int vfio_iommu_type1_pin_pages(void
> *iommu_data,
>  	goto pin_done;
>  
>  pin_unwind:
> -	phys_pfn[i] = 0;
> +	pages[i] = NULL;
>  	for (j = 0; j < i; j++) {
>  		dma_addr_t iova;
>  
>  		iova = user_iova + PAGE_SIZE * j;
>  		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
>  		vfio_unpin_page_external(dma, iova, do_accounting);
> -		phys_pfn[j] = 0;
> +		pages[j] = NULL;
>  	}
>  pin_done:
>  	mutex_unlock(&iommu->lock);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 9108de34a79b..c76a2c492bbd 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -148,7 +148,7 @@ bool vfio_file_has_dev(struct file *file, struct
> vfio_device *device);
>  #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned
> long))
>  
>  int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
> -		   int npage, int prot, unsigned long *phys_pfn);
> +		   int npage, int prot, struct page **pages);
>  void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
> int npage);
>  int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova,
>  		void *data, size_t len, bool write);

