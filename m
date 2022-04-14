Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC69501C3D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 21:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE3B10E3DD;
	Thu, 14 Apr 2022 19:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1707 seconds by postgrey-1.36 at gabe;
 Thu, 14 Apr 2022 19:54:41 UTC
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B797410E377;
 Thu, 14 Apr 2022 19:54:41 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23EH2Z4V006352; 
 Thu, 14 Apr 2022 19:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=9QA7/sZPD1x5u4bcVPRl5NgznyWuA2fG8lFuCu/FEtA=;
 b=AfLER0iihob19+3yB9NqFupzGeU7vAEsBxp+WPjanryA0nQu2UdRJo3WHerGjRAcwCYC
 oBACFrRb93zIpCw68I6PNxxmcKA2d6Omhv5b/sN0gDP8SfKLYmKCzCsWMvCnL6CrWO87
 rhsQ0W1K0oDFYtzuCww2KlGZFOdTG1Y4bMh99XhTyFRFLIoceVznbYJX/B89mpB2akRE
 JlgHeRxEcngIZ/n6RemGORkwJiuFb8nKAGtaBdQZMhu7LdK9v1deBBFdZDv0Ellh3W4z
 4PbN67PBM+RWjzq8BCALS6DlB8M2Rd8XIKAOyyMvXrGYiViGsSvYF7CL6/gdBDoSqt8B mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fedxsyhxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 19:26:09 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23EJPqbD026151;
 Thu, 14 Apr 2022 19:26:08 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fedxsyhxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 19:26:08 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23EJICiK024955;
 Thu, 14 Apr 2022 19:26:07 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3fb1sabjn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 19:26:07 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23EJQ6av21102856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Apr 2022 19:26:06 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E80AB206E;
 Thu, 14 Apr 2022 19:26:06 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EB21B205F;
 Thu, 14 Apr 2022 19:25:57 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.52.116])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 14 Apr 2022 19:25:57 +0000 (GMT)
Message-ID: <7a43985f1e6190c72278805a780058ea8221a22f.camel@linux.ibm.com>
Subject: Re: [PATCH 2/9] vfio/ccw: Remove mdev from struct channel_program
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@linux.ie>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Harald Freudenberger
 <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti
 Wankhede <kwankhede@nvidia.com>,
 linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Vineeth Vijayan
 <vneethv@linux.ibm.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
Date: Thu, 14 Apr 2022 15:25:56 -0400
In-Reply-To: <2-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
References: <2-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kHKfb5CUbRYLCpE-NdPBaR7AMZBtA2Os
X-Proofpoint-GUID: 47ldbTq4DcE3Hg7_sAry76a0WipCq-YT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_05,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140100
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-04-12 at 12:53 -0300, Jason Gunthorpe wrote:
> The next patch wants the vfio_device instead. There is no reason to
> store
> a pointer here since we can container_of back to the vfio_device.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_cp.c  | 44 +++++++++++++++++++----------
> ----
>  drivers/s390/cio/vfio_ccw_cp.h  |  4 +--
>  drivers/s390/cio/vfio_ccw_fsm.c |  3 +--
>  3 files changed, 28 insertions(+), 23 deletions(-)

There's opportunity for simplification here, but I'll handle that when
I get to some other work in this space. For this series, this is fine.

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> 
> diff --git a/drivers/s390/cio/vfio_ccw_cp.c
> b/drivers/s390/cio/vfio_ccw_cp.c
> index 8d1b2771c1aa02..af5048a1ba8894 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.c
> +++ b/drivers/s390/cio/vfio_ccw_cp.c
> @@ -16,6 +16,7 @@
>  #include <asm/idals.h>
>  
>  #include "vfio_ccw_cp.h"
> +#include "vfio_ccw_private.h"
>  
>  struct pfn_array {
>  	/* Starting guest physical I/O address. */
> @@ -98,17 +99,17 @@ static int pfn_array_alloc(struct pfn_array *pa,
> u64 iova, unsigned int len)
>   * If the pin request partially succeeds, or fails completely,
>   * all pages are left unpinned and a negative error value is
> returned.
>   */
> -static int pfn_array_pin(struct pfn_array *pa, struct device *mdev)
> +static int pfn_array_pin(struct pfn_array *pa, struct vfio_device
> *vdev)
>  {
>  	int ret = 0;
>  
> -	ret = vfio_pin_pages(mdev, pa->pa_iova_pfn, pa->pa_nr,
> +	ret = vfio_pin_pages(vdev->dev, pa->pa_iova_pfn, pa->pa_nr,
>  			     IOMMU_READ | IOMMU_WRITE, pa->pa_pfn);
>  
>  	if (ret < 0) {
>  		goto err_out;
>  	} else if (ret > 0 && ret != pa->pa_nr) {
> -		vfio_unpin_pages(mdev, pa->pa_iova_pfn, ret);
> +		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, ret);
>  		ret = -EINVAL;
>  		goto err_out;
>  	}
> @@ -122,11 +123,11 @@ static int pfn_array_pin(struct pfn_array *pa,
> struct device *mdev)
>  }
>  
>  /* Unpin the pages before releasing the memory. */
> -static void pfn_array_unpin_free(struct pfn_array *pa, struct device
> *mdev)
> +static void pfn_array_unpin_free(struct pfn_array *pa, struct
> vfio_device *vdev)
>  {
>  	/* Only unpin if any pages were pinned to begin with */
>  	if (pa->pa_nr)
> -		vfio_unpin_pages(mdev, pa->pa_iova_pfn, pa->pa_nr);
> +		vfio_unpin_pages(vdev->dev, pa->pa_iova_pfn, pa-
> >pa_nr);
>  	pa->pa_nr = 0;
>  	kfree(pa->pa_iova_pfn);
>  }
> @@ -190,7 +191,7 @@ static void convert_ccw0_to_ccw1(struct ccw1
> *source, unsigned long len)
>   * Within the domain (@mdev), copy @n bytes from a guest physical
>   * address (@iova) to a host physical address (@to).
>   */
> -static long copy_from_iova(struct device *mdev,
> +static long copy_from_iova(struct vfio_device *vdev,
>  			   void *to, u64 iova,
>  			   unsigned long n)
>  {
> @@ -203,9 +204,9 @@ static long copy_from_iova(struct device *mdev,
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = pfn_array_pin(&pa, mdev);
> +	ret = pfn_array_pin(&pa, vdev);
>  	if (ret < 0) {
> -		pfn_array_unpin_free(&pa, mdev);
> +		pfn_array_unpin_free(&pa, vdev);
>  		return ret;
>  	}
>  
> @@ -226,7 +227,7 @@ static long copy_from_iova(struct device *mdev,
>  			break;
>  	}
>  
> -	pfn_array_unpin_free(&pa, mdev);
> +	pfn_array_unpin_free(&pa, vdev);
>  
>  	return l;
>  }
> @@ -423,11 +424,13 @@ static int ccwchain_loop_tic(struct ccwchain
> *chain,
>  
>  static int ccwchain_handle_ccw(u32 cda, struct channel_program *cp)
>  {
> +	struct vfio_device *vdev =
> +		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
>  	struct ccwchain *chain;
>  	int len, ret;
>  
>  	/* Copy 2K (the most we support today) of possible CCWs */
> -	len = copy_from_iova(cp->mdev, cp->guest_cp, cda,
> +	len = copy_from_iova(vdev, cp->guest_cp, cda,
>  			     CCWCHAIN_LEN_MAX * sizeof(struct ccw1));
>  	if (len)
>  		return len;
> @@ -508,6 +511,8 @@ static int ccwchain_fetch_direct(struct ccwchain
> *chain,
>  				 int idx,
>  				 struct channel_program *cp)
>  {
> +	struct vfio_device *vdev =
> +		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
>  	struct ccw1 *ccw;
>  	struct pfn_array *pa;
>  	u64 iova;
> @@ -526,7 +531,7 @@ static int ccwchain_fetch_direct(struct ccwchain
> *chain,
>  	if (ccw_is_idal(ccw)) {
>  		/* Read first IDAW to see if it's 4K-aligned or not. */
>  		/* All subsequent IDAws will be 4K-aligned. */
> -		ret = copy_from_iova(cp->mdev, &iova, ccw->cda,
> sizeof(iova));
> +		ret = copy_from_iova(vdev, &iova, ccw->cda,
> sizeof(iova));
>  		if (ret)
>  			return ret;
>  	} else {
> @@ -555,7 +560,7 @@ static int ccwchain_fetch_direct(struct ccwchain
> *chain,
>  
>  	if (ccw_is_idal(ccw)) {
>  		/* Copy guest IDAL into host IDAL */
> -		ret = copy_from_iova(cp->mdev, idaws, ccw->cda,
> idal_len);
> +		ret = copy_from_iova(vdev, idaws, ccw->cda, idal_len);
>  		if (ret)
>  			goto out_unpin;
>  
> @@ -574,7 +579,7 @@ static int ccwchain_fetch_direct(struct ccwchain
> *chain,
>  	}
>  
>  	if (ccw_does_data_transfer(ccw)) {
> -		ret = pfn_array_pin(pa, cp->mdev);
> +		ret = pfn_array_pin(pa, vdev);
>  		if (ret < 0)
>  			goto out_unpin;
>  	} else {
> @@ -590,7 +595,7 @@ static int ccwchain_fetch_direct(struct ccwchain
> *chain,
>  	return 0;
>  
>  out_unpin:
> -	pfn_array_unpin_free(pa, cp->mdev);
> +	pfn_array_unpin_free(pa, vdev);
>  out_free_idaws:
>  	kfree(idaws);
>  out_init:
> @@ -632,8 +637,10 @@ static int ccwchain_fetch_one(struct ccwchain
> *chain,
>   * Returns:
>   *   %0 on success and a negative error value on failure.
>   */
> -int cp_init(struct channel_program *cp, struct device *mdev, union
> orb *orb)
> +int cp_init(struct channel_program *cp, union orb *orb)
>  {
> +	struct vfio_device *vdev =
> +		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
>  	/* custom ratelimit used to avoid flood during guest IPL */
>  	static DEFINE_RATELIMIT_STATE(ratelimit_state, 5 * HZ, 1);
>  	int ret;
> @@ -650,11 +657,10 @@ int cp_init(struct channel_program *cp, struct
> device *mdev, union orb *orb)
>  	 * the problem if something does break.
>  	 */
>  	if (!orb->cmd.pfch && __ratelimit(&ratelimit_state))
> -		dev_warn(mdev, "Prefetching channel program even though
> prefetch not specified in ORB");
> +		dev_warn(vdev->dev, "Prefetching channel program even
> though prefetch not specified in ORB");
>  
>  	INIT_LIST_HEAD(&cp->ccwchain_list);
>  	memcpy(&cp->orb, orb, sizeof(*orb));
> -	cp->mdev = mdev;
>  
>  	/* Build a ccwchain for the first CCW segment */
>  	ret = ccwchain_handle_ccw(orb->cmd.cpa, cp);
> @@ -682,6 +688,8 @@ int cp_init(struct channel_program *cp, struct
> device *mdev, union orb *orb)
>   */
>  void cp_free(struct channel_program *cp)
>  {
> +	struct vfio_device *vdev =
> +		&container_of(cp, struct vfio_ccw_private, cp)->vdev;
>  	struct ccwchain *chain, *temp;
>  	int i;
>  
> @@ -691,7 +699,7 @@ void cp_free(struct channel_program *cp)
>  	cp->initialized = false;
>  	list_for_each_entry_safe(chain, temp, &cp->ccwchain_list, next)
> {
>  		for (i = 0; i < chain->ch_len; i++) {
> -			pfn_array_unpin_free(chain->ch_pa + i, cp-
> >mdev);
> +			pfn_array_unpin_free(chain->ch_pa + i, vdev);
>  			ccwchain_cda_free(chain, i);
>  		}
>  		ccwchain_free(chain);
> diff --git a/drivers/s390/cio/vfio_ccw_cp.h
> b/drivers/s390/cio/vfio_ccw_cp.h
> index ba31240ce96594..e4c436199b4cda 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.h
> +++ b/drivers/s390/cio/vfio_ccw_cp.h
> @@ -37,13 +37,11 @@
>  struct channel_program {
>  	struct list_head ccwchain_list;
>  	union orb orb;
> -	struct device *mdev;
>  	bool initialized;
>  	struct ccw1 *guest_cp;
>  };
>  
> -extern int cp_init(struct channel_program *cp, struct device *mdev,
> -		   union orb *orb);
> +extern int cp_init(struct channel_program *cp, union orb *orb);
>  extern void cp_free(struct channel_program *cp);
>  extern int cp_prefetch(struct channel_program *cp);
>  extern union orb *cp_get_orb(struct channel_program *cp, u32
> intparm, u8 lpm);
> diff --git a/drivers/s390/cio/vfio_ccw_fsm.c
> b/drivers/s390/cio/vfio_ccw_fsm.c
> index e435a9cd92dacf..8483a266051c21 100644
> --- a/drivers/s390/cio/vfio_ccw_fsm.c
> +++ b/drivers/s390/cio/vfio_ccw_fsm.c
> @@ -262,8 +262,7 @@ static void fsm_io_request(struct
> vfio_ccw_private *private,
>  			errstr = "transport mode";
>  			goto err_out;
>  		}
> -		io_region->ret_code = cp_init(&private->cp,
> mdev_dev(mdev),
> -					      orb);
> +		io_region->ret_code = cp_init(&private->cp, orb);
>  		if (io_region->ret_code) {
>  			VFIO_CCW_MSG_EVENT(2,
>  					   "%pUl (%x.%x.%04x):
> cp_init=%d\n",

