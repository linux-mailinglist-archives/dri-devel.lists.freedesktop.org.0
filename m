Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282F45A6557
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 15:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F09910E0E1;
	Tue, 30 Aug 2022 13:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879CD10E0E1;
 Tue, 30 Aug 2022 13:43:00 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UDcdj5018226;
 Tue, 30 Aug 2022 13:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dLMj4scT81hn+piIbAARyqrM8RYZW+n5ahtgpt1B8BU=;
 b=E+EFWoEUKDGLYpQzvmjFv2E6WiW7Cltu3RhfxFO0GXgKUCXxQX4SYSLYLZzRm/rnfkkf
 y97miLE5w/iSJSfToy9BFgMSRwN89Oii8exSmy4HNWiqBNIPMSKoRM6E9yDYoM0N6xOf
 mib2DWDNDHc/W1Pas4JbC1WZQsRKrkTo5brV4kGCq+p84yGmKFwN23qsGfS6hYPQ7+ZH
 xvDYqFi+/EOEOCg21StOIJem5F/0A18c5pQsK9GUOuQaOWlwSfhEdkzP7Ob0ZrCprWI2
 Nhb6PMQynXz+8hrKS00En035zgneTS4Eake6oYMBecxF/8AueHGwvRMIbg24VtxTpOVC +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9k439dkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 13:42:48 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27UDckmC018907;
 Tue, 30 Aug 2022 13:42:47 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9k439dk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 13:42:47 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27UDaSft028999;
 Tue, 30 Aug 2022 13:42:45 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 3j7aw9c0jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 13:42:45 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27UDgjo9197318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Aug 2022 13:42:45 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DFB52805C;
 Tue, 30 Aug 2022 13:42:45 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 369D528058;
 Tue, 30 Aug 2022 13:42:43 +0000 (GMT)
Received: from [9.160.64.167] (unknown [9.160.64.167])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Aug 2022 13:42:43 +0000 (GMT)
Message-ID: <907c54c6-7f5b-77f3-c284-45604c60c12e@linux.ibm.com>
Date: Tue, 30 Aug 2022 09:42:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Content-Language: en-US
To: Kevin Tian <kevin.tian@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Longfang Liu <liulongfang@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Abhishek Sahu <abhsahu@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-2-kevin.tian@intel.com>
From: Anthony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <20220827171037.30297-2-kevin.tian@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UInNfzO6UhsQq9SoGPUVlLqjbU3nCkc-
X-Proofpoint-ORIG-GUID: RsKFVoA40hj8rxhPhQ80Xt5teHYxtGki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_08,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 clxscore=1011 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208300067
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
Cc: Yi Liu <yi.l.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Tony Krowiak <akrowiak@linux.ibm.com>

I have a couple of review comments, but nothing critical that would 
prevent my r-b.

On 8/27/22 1:10 PM, Kevin Tian wrote:
> The idea is to let vfio core manage the vfio_device life cycle instead
> of duplicating the logic cross drivers. This is also a preparatory
> step for adding struct device into vfio_device.
>
> New pair of helpers together with a kref in vfio_device:
>
>   - vfio_alloc_device()
>   - vfio_put_device()
>
> Drivers can register @init/@release callbacks to manage any private
> state wrapping the vfio_device.
>
> However vfio-ccw doesn't fit this model due to a life cycle mess
> that its private structure mixes both parent and mdev info hence must
> be allocated/free'ed outside of the life cycle of vfio device.
>
> Per prior discussions this won't be fixed in short term by IBM folks.
>
> Instead of waiting introduce another helper vfio_init_device() so ccw
> can call it to initialize a pre-allocated vfio_device.
>
> Further implication of the ccw trick is that vfio_device cannot be
> free'ed uniformly in vfio core. Instead, require *EVERY* driver to
> implement @release and free vfio_device inside. Then ccw can choose
> to delay the free at its own discretion.
>
> Another trick down the road is that kvzalloc() is used to accommodate
> the need of gvt which uses vzalloc() while all others use kzalloc().
> So drivers should call a helper vfio_free_device() to free the
> vfio_device instead of assuming that kfree() or vfree() is appliable.
>
> Later once the ccw mess is fixed we can remove those tricks and
> fully handle structure alloc/free in vfio core.
>
> Existing vfio_{un}init_group_dev() will be deprecated after all
> existing usages are converted to the new model.
>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Co-developed-by: Yi Liu <yi.l.liu@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> ---
>   drivers/vfio/vfio_main.c | 92 ++++++++++++++++++++++++++++++++++++++++
>   include/linux/vfio.h     | 25 ++++++++++-
>   2 files changed, 116 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 7cb56c382c97..af8aad116f2b 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -496,6 +496,98 @@ void vfio_uninit_group_dev(struct vfio_device *device)
>   }
>   EXPORT_SYMBOL_GPL(vfio_uninit_group_dev);
>   
> +/*
> + * Alloc and initialize vfio_device so it can be registered to vfio
> + * core.
> + *
> + * Drivers should use the wrapper vfio_alloc_device() for allocation.
> + * @size is the size of the structure to be allocated, including any
> + * private data used by the driver.


It seems the purpose of the wrapper is to ensure that the object being 
allocated has as its first field a struct vfio_device object and to 
return its container. Why not just make that a requirement for this 
function - which I would rename vfio_alloc_device - and document it in 
the prologue? The caller can then cast the return pointer or use 
container_of.


> + *
> + * Driver may provide an @init callback to cover device private data.
> + *
> + * Use vfio_put_device() to release the structure after success return.
> + */
> +struct vfio_device *_vfio_alloc_device(size_t size, struct device *dev,
> +		const struct vfio_device_ops *ops)
> +{
> +	struct vfio_device *device;
> +	int ret;
> +
> +	if (WARN_ON(size < sizeof(struct vfio_device)))
> +		return ERR_PTR(-EINVAL);
> +
> +	device = kvzalloc(size, GFP_KERNEL);
> +	if (!device)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = vfio_init_device(device, dev, ops);
> +	if (ret)
> +		goto out_free;
> +	return device;
> +
> +out_free:
> +	kvfree(device);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(_vfio_alloc_device);
> +
> +/*
> + * Initialize a vfio_device so it can be registered to vfio core.
> + *
> + * Only vfio-ccw driver should call this interface.
> + */
> +int vfio_init_device(struct vfio_device *device, struct device *dev,
> +		     const struct vfio_device_ops *ops)
> +{
> +	int ret;
> +
> +	vfio_init_group_dev(device, dev, ops);
> +
> +	if (ops->init) {
> +		ret = ops->init(device);
> +		if (ret)
> +			goto out_uninit;
> +	}
> +
> +	kref_init(&device->kref);
> +	return 0;
> +
> +out_uninit:
> +	vfio_uninit_group_dev(device);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(vfio_init_device);
> +
> +/*
> + * The helper called by driver @release callback to free the device
> + * structure. Drivers which don't have private data to clean can
> + * simply use this helper as its @release.
> + */
> +void vfio_free_device(struct vfio_device *device)
> +{
> +	kvfree(device);
> +}
> +EXPORT_SYMBOL_GPL(vfio_free_device);
> +
> +/* Release helper called by vfio_put_device() */
> +void vfio_device_release(struct kref *kref)
> +{
> +	struct vfio_device *device =
> +			container_of(kref, struct vfio_device, kref);
> +
> +	vfio_uninit_group_dev(device);
> +
> +	/*
> +	 * kvfree() cannot be done here due to a life cycle mess in
> +	 * vfio-ccw. Before the ccw part is fixed all drivers are
> +	 * required to support @release and call vfio_free_device()
> +	 * from there.
> +	 */
> +	device->ops->release(device);
> +}
> +EXPORT_SYMBOL_GPL(vfio_device_release);
> +
>   static struct vfio_group *vfio_noiommu_group_alloc(struct device *dev,
>   		enum vfio_group_type type)
>   {
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index e05ddc6fe6a5..e1e9e8352903 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -45,7 +45,8 @@ struct vfio_device {
>   	struct kvm *kvm;
>   
>   	/* Members below here are private, not for driver use */
> -	refcount_t refcount;
> +	struct kref kref;	/* object life cycle */
> +	refcount_t refcount;	/* user count on registered device*/
>   	unsigned int open_count;
>   	struct completion comp;
>   	struct list_head group_next;
> @@ -55,6 +56,8 @@ struct vfio_device {
>   /**
>    * struct vfio_device_ops - VFIO bus driver device callbacks
>    *
> + * @init: initialize private fields in device structure
> + * @release: Reclaim private fields in device structure
>    * @open_device: Called when the first file descriptor is opened for this device
>    * @close_device: Opposite of open_device
>    * @read: Perform read(2) on device file descriptor
> @@ -72,6 +75,8 @@ struct vfio_device {
>    */
>   struct vfio_device_ops {
>   	char	*name;
> +	int	(*init)(struct vfio_device *vdev);
> +	void	(*release)(struct vfio_device *vdev);
>   	int	(*open_device)(struct vfio_device *vdev);
>   	void	(*close_device)(struct vfio_device *vdev);
>   	ssize_t	(*read)(struct vfio_device *vdev, char __user *buf,
> @@ -137,6 +142,24 @@ static inline int vfio_check_feature(u32 flags, size_t argsz, u32 supported_ops,
>   	return 1;
>   }
>   
> +struct vfio_device *_vfio_alloc_device(size_t size, struct device *dev,
> +				       const struct vfio_device_ops *ops);
> +#define vfio_alloc_device(dev_struct, member, dev, ops)				\
> +	container_of(_vfio_alloc_device(sizeof(struct dev_struct) +		\
> +					BUILD_BUG_ON_ZERO(offsetof(		\
> +						struct dev_struct, member)),	\
> +					dev, ops),				\
> +		     struct dev_struct, member)


I found the use of this macro confusing and unnecessary. I'd prefer 
vfio_alloc_device be a function (see my comments above).


> +
> +int vfio_init_device(struct vfio_device *device, struct device *dev,
> +		     const struct vfio_device_ops *ops);
> +void vfio_free_device(struct vfio_device *device);
> +void vfio_device_release(struct kref *kref);
> +static inline void vfio_put_device(struct vfio_device *device)
> +{
> +	kref_put(&device->kref, vfio_device_release);
> +}
> +
>   void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
>   			 const struct vfio_device_ops *ops);
>   void vfio_uninit_group_dev(struct vfio_device *device);
