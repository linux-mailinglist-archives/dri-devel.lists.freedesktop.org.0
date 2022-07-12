Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C33571C91
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 16:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A47D94BA0;
	Tue, 12 Jul 2022 14:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F5E94BA2;
 Tue, 12 Jul 2022 14:29:58 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CDJ0E9006969;
 Tue, 12 Jul 2022 14:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OdfZSqJJ97Yxoj48Ckzbfof+fH1pBkaPsxXBN/SYXLE=;
 b=Z6qbMB5EQ1l9GEjAMFA0+VqVwNQeTeZOV4j5siWedAhE/e2Y2RsPEEOv5Fh3PvTNj8LE
 TeF0tdX3uOYk9Bz/aRuLGA/iGcUWqmhttyD+QVV+tupAa80MK5uxK0OjhHRfNuHxB6Kn
 ATZ5Hvs2I0YnXd855Vj0v+dmU2J2/3MALf4BsO+xyvX5kaBLmyK+nIixS5G4YQLuXTUk
 ilhEat3gC72UvqtbsLG/v2w2FQuW3ZUzlR+789ppxo+ocVhwBNY0KS6pXLLjgqx0PcZn
 +vzKNg4KKzga1J1eNPR+lREpgvx8vySKhroScgURLQ48TTojjEIwBDg8RDReCXPJkl7f zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h99r01xrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 14:28:53 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26CDKOsM014679;
 Tue, 12 Jul 2022 14:28:53 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h99r01xq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 14:28:52 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26CEL4gs032549;
 Tue, 12 Jul 2022 14:28:51 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3h71a9e87y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 14:28:51 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26CESo4225100754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 14:28:50 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FA8E28058;
 Tue, 12 Jul 2022 14:28:50 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8FBC28059;
 Tue, 12 Jul 2022 14:28:48 +0000 (GMT)
Received: from [9.65.200.23] (unknown [9.65.200.23])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jul 2022 14:28:48 +0000 (GMT)
Message-ID: <c1662fda-c87c-e204-dddd-e6159c8aa104@linux.ibm.com>
Date: Tue, 12 Jul 2022 10:28:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 06/10] vfio/ap: Change saved_pfn to saved_iova
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, kwankhede@nvidia.com, corbet@lwn.net, 
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com,
 zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, daniel@ffwll.ch, farman@linux.ibm.com,
 mjrosato@linux.ibm.com, pasic@linux.ibm.com, vneethv@linux.ibm.com,
 oberpar@linux.ibm.com, freude@linux.ibm.com, jjherne@linux.ibm.com,
 alex.williamson@redhat.com, cohuck@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, hch@infradead.org
References: <20220708224427.1245-1-nicolinc@nvidia.com>
 <20220708224427.1245-7-nicolinc@nvidia.com>
From: Anthony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <20220708224427.1245-7-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _j6ePaBx9pKp0DXjWFutlwf2W9WPoPd7
X-Proofpoint-ORIG-GUID: Z2Erh4ovuh4-1QaA8MtuoCaVso489d7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_08,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207120055
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

Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>

On 7/8/22 6:44 PM, Nicolin Chen wrote:
> The vfio_ap_ops code maintains both nib address and its PFN, which
> is redundant, merely because vfio_pin/unpin_pages API wanted pfn.
> Since vfio_pin/unpin_pages() now accept "iova", change "saved_pfn"
> to "saved_iova" and remove pfn in the vfio_ap_validate_nib().
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Eric Farman <farman@linux.ibm.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/s390/crypto/vfio_ap_ops.c     | 42 +++++++++++----------------
>   drivers/s390/crypto/vfio_ap_private.h |  4 +--
>   2 files changed, 19 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index 8a2018ab3cf0..e8856a7e151c 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -112,7 +112,7 @@ static void vfio_ap_wait_for_irqclear(int apqn)
>    *
>    * Unregisters the ISC in the GIB when the saved ISC not invalid.
>    * Unpins the guest's page holding the NIB when it exists.
> - * Resets the saved_pfn and saved_isc to invalid values.
> + * Resets the saved_iova and saved_isc to invalid values.
>    */
>   static void vfio_ap_free_aqic_resources(struct vfio_ap_queue *q)
>   {
> @@ -123,9 +123,9 @@ static void vfio_ap_free_aqic_resources(struct vfio_ap_queue *q)
>   		kvm_s390_gisc_unregister(q->matrix_mdev->kvm, q->saved_isc);
>   		q->saved_isc = VFIO_AP_ISC_INVALID;
>   	}
> -	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
> -		vfio_unpin_pages(&q->matrix_mdev->vdev, q->saved_pfn << PAGE_SHIFT, 1);
> -		q->saved_pfn = 0;
> +	if (q->saved_iova && !WARN_ON(!q->matrix_mdev)) {
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, q->saved_iova, 1);
> +		q->saved_iova = 0;
>   	}
>   }
>   
> @@ -189,27 +189,19 @@ static struct ap_queue_status vfio_ap_irq_disable(struct vfio_ap_queue *q)
>    *
>    * @vcpu: the object representing the vcpu executing the PQAP(AQIC) instruction.
>    * @nib: the location for storing the nib address.
> - * @g_pfn: the location for storing the page frame number of the page containing
> - *	   the nib.
>    *
>    * When the PQAP(AQIC) instruction is executed, general register 2 contains the
>    * address of the notification indicator byte (nib) used for IRQ notification.
> - * This function parses the nib from gr2 and calculates the page frame
> - * number for the guest of the page containing the nib. The values are
> - * stored in @nib and @g_pfn respectively.
> - *
> - * The g_pfn of the nib is then validated to ensure the nib address is valid.
> + * This function parses and validates the nib from gr2.
>    *
>    * Return: returns zero if the nib address is a valid; otherwise, returns
>    *	   -EINVAL.
>    */
> -static int vfio_ap_validate_nib(struct kvm_vcpu *vcpu, unsigned long *nib,
> -				unsigned long *g_pfn)
> +static int vfio_ap_validate_nib(struct kvm_vcpu *vcpu, dma_addr_t *nib)
>   {
>   	*nib = vcpu->run->s.regs.gprs[2];
> -	*g_pfn = *nib >> PAGE_SHIFT;
>   
> -	if (kvm_is_error_hva(gfn_to_hva(vcpu->kvm, *g_pfn)))
> +	if (kvm_is_error_hva(gfn_to_hva(vcpu->kvm, *nib >> PAGE_SHIFT)))
>   		return -EINVAL;
>   
>   	return 0;
> @@ -239,34 +231,34 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
>   						 int isc,
>   						 struct kvm_vcpu *vcpu)
>   {
> -	unsigned long nib;
>   	struct ap_qirq_ctrl aqic_gisa = {};
>   	struct ap_queue_status status = {};
>   	struct kvm_s390_gisa *gisa;
>   	int nisc;
>   	struct kvm *kvm;
> -	unsigned long g_pfn, h_pfn;
> +	unsigned long h_pfn;
>   	phys_addr_t h_nib;
> +	dma_addr_t nib;
>   	int ret;
>   
>   	/* Verify that the notification indicator byte address is valid */
> -	if (vfio_ap_validate_nib(vcpu, &nib, &g_pfn)) {
> -		VFIO_AP_DBF_WARN("%s: invalid NIB address: nib=%#lx, g_pfn=%#lx, apqn=%#04x\n",
> -				 __func__, nib, g_pfn, q->apqn);
> +	if (vfio_ap_validate_nib(vcpu, &nib)) {
> +		VFIO_AP_DBF_WARN("%s: invalid NIB address: nib=%pad, apqn=%#04x\n",
> +				 __func__, &nib, q->apqn);
>   
>   		status.response_code = AP_RESPONSE_INVALID_ADDRESS;
>   		return status;
>   	}
>   
> -	ret = vfio_pin_pages(&q->matrix_mdev->vdev, g_pfn << PAGE_SHIFT, 1,
> +	ret = vfio_pin_pages(&q->matrix_mdev->vdev, nib, 1,
>   			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
>   	switch (ret) {
>   	case 1:
>   		break;
>   	default:
>   		VFIO_AP_DBF_WARN("%s: vfio_pin_pages failed: rc=%d,"
> -				 "nib=%#lx, g_pfn=%#lx, apqn=%#04x\n",
> -				 __func__, ret, nib, g_pfn, q->apqn);
> +				 "nib=%pad, apqn=%#04x\n",
> +				 __func__, ret, &nib, q->apqn);
>   
>   		status.response_code = AP_RESPONSE_INVALID_ADDRESS;
>   		return status;
> @@ -296,12 +288,12 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
>   	case AP_RESPONSE_NORMAL:
>   		/* See if we did clear older IRQ configuration */
>   		vfio_ap_free_aqic_resources(q);
> -		q->saved_pfn = g_pfn;
> +		q->saved_iova = nib;
>   		q->saved_isc = isc;
>   		break;
>   	case AP_RESPONSE_OTHERWISE_CHANGED:
>   		/* We could not modify IRQ setings: clear new configuration */
> -		vfio_unpin_pages(&q->matrix_mdev->vdev, g_pfn << PAGE_SHIFT, 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, nib, 1);
>   		kvm_s390_gisc_unregister(kvm, isc);
>   		break;
>   	default:
> diff --git a/drivers/s390/crypto/vfio_ap_private.h b/drivers/s390/crypto/vfio_ap_private.h
> index a26efd804d0d..479b205179bd 100644
> --- a/drivers/s390/crypto/vfio_ap_private.h
> +++ b/drivers/s390/crypto/vfio_ap_private.h
> @@ -102,13 +102,13 @@ struct ap_matrix_mdev {
>    * struct vfio_ap_queue - contains the data associated with a queue bound to the
>    *			  vfio_ap device driver
>    * @matrix_mdev: the matrix mediated device
> - * @saved_pfn: the guest PFN pinned for the guest
> + * @saved_iova: the notification indicator byte (nib) address
>    * @apqn: the APQN of the AP queue device
>    * @saved_isc: the guest ISC registered with the GIB interface
>    */
>   struct vfio_ap_queue {
>   	struct ap_matrix_mdev *matrix_mdev;
> -	unsigned long saved_pfn;
> +	dma_addr_t saved_iova;
>   	int	apqn;
>   #define VFIO_AP_ISC_INVALID 0xff
>   	unsigned char saved_isc;
