Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B45460C406
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150E410E10F;
	Tue, 25 Oct 2022 06:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 510 seconds by postgrey-1.36 at gabe;
 Tue, 25 Oct 2022 06:52:05 UTC
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E174D10E10F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 06:52:05 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20221025064333epoutp016e465344fd43117f79d06d22edf03a5e~hPNLSb4sv0915209152epoutp011
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 06:43:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20221025064333epoutp016e465344fd43117f79d06d22edf03a5e~hPNLSb4sv0915209152epoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1666680213;
 bh=QvdlCHmxLDwLk/YfcGnvZ9WuodpOPFQncDCNAfh4N+c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yx4wvo2VctJlZxRjLjWb+8tSDZpC47bUez02H9LAKCcqb6uXsvQyBwIHCTrL7rsTG
 BkB5fF6fmWYshPDV0d9QIEqLt7sG9vw53ezYHM4TxxksQSGMzMXwd+wIOcxcQAASFL
 3X7bDhPubfqmn/MEIXcyaDrFiolWuLQgrORwj0SQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20221025064332epcas1p3c7eddf0bb91c73ef5b344db936132fa6~hPNKuYDkk1286312863epcas1p3b;
 Tue, 25 Oct 2022 06:43:32 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.38.235]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4MxMpW55xkz4x9Q2; Tue, 25 Oct
 2022 06:43:31 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A7.CF.51827.39587536; Tue, 25 Oct 2022 15:43:31 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20221025064331epcas1p4a323241a653ad0dc9a582ad348a3b831~hPNJYAQ753176631766epcas1p4D;
 Tue, 25 Oct 2022 06:43:31 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221025064331epsmtrp1f39e99f7e37cb7961714e661130eb576~hPNJW1S1G2748727487epsmtrp1L;
 Tue, 25 Oct 2022 06:43:31 +0000 (GMT)
X-AuditID: b6c32a36-17bfa7000000ca73-3a-63578593f457
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 66.55.18644.29587536; Tue, 25 Oct 2022 15:43:31 +0900 (KST)
Received: from jiho-chu04.tn.corp.samsungelectronics.net (unknown
 [10.113.112.236]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221025064330epsmtip16d6321c17f0df26a274de6d1447cc401~hPNI9HtaU1891818918epsmtip1Z;
 Tue, 25 Oct 2022 06:43:30 +0000 (GMT)
Date: Tue, 25 Oct 2022 15:43:30 +0900
From: Jiho Chu <jiho.chu@samsung.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH 3/3] drm: add dedicated minor for accelerator devices
Message-Id: <20221025154330.a3a839357363da6d5de96c89@samsung.com>
In-Reply-To: <20221022214622.18042-4-ogabbay@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.30; i686-pc-mingw32)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHd3t7bwsTclcQzuoWa5kxsBQotHiYYOb7LsOMzSVmJq5r2jtg
 LW1pi9tkMVXkIa3S8lCsSgCRMYYgUMobDVUK6liQbjIjkCg+mLw3dPKQtV6c++/7+53P753D
 RjlZLC47SaWntCqpko97M+2OYIEgP2OvLLzm9HrYc7uMAU/ebcPgUl43Cy7bLSh0ZZzCoGtu
 Cofp52txeMPsRgr6ljD4d70Zh64X7Qise1DGglPGNhQ+z7Ix4EDrWRyWzjQy4eH0QRRmHqvA
 YKdpBoE3S/9BofPFQWgbt7hzPor/MJC8ODOCkRm3lnByYT4PIacGM1hkx9MSJvl4zo6SLdYh
 FtlQGULWVx3DyeLeT8nL56pZ5IjRySCPp0/ipKX9EHnCVoWQDTfS4jn7FDGJlFROaXmUSqaW
 J6kSYvkf75Fsk4ijwoUCYTTcyOeppMlULH97XLxgZ5LSvQg+74BUmep2xUt1On7Y5hitOlVP
 8RLVOn0sn9LIlRqxJlQnTdalqhJCVZT+A2F4eITYDX6lSByu52qurPnO0LjagBQG5CBebECI
 QO6Ty6wcxJvNIZoRUH67GqONWQSYH/zMoI2/EGCtvYS9CvnxWRvDozlEKwImWzbSUDYD9P1x
 HPE8MIn1wJBZ/RLC3fp0UbW7BpvtT7wH+i+IPDxKTONgvK4Q8/j9iE9Aa4fII32ILWDsqtIT
 6UVAMFt2n0GXhWDIVInRyFtgqdnP40aJtaBp4izqyQiIWi9wzWFaaXM7yKvIX4n1A386bSxa
 c8FYbuaKVoCC7DImrTWg71Ej6skPiEjQXyn3SJQIBrWtYTSxDrQsnEPosr5gcs6E0bQPyM7k
 0AgflC86VpIDUFj0dKUBEozcrGHSe2pBwKhxETcjPOvrYaz/G8b6unAJglYhAZRGl5xA6YSa
 iP9OK1Mn1yMvf0RIVDOSNzEd2oUw2EgXAtgo39+HObpHxvGRS78/SGnVEm2qktJ1IWL3XSwo
 d7VM7f5SKr1EKIoOF0VFRIqgMErID/QxFIXIOESCVE8pKEpDaV/FMdheXANDs204pfcoVaB9
 Y7j7+oXlz6Zqmu70nkyaLu0yBY7bC4MOm7OCLG9/ETe4m7vJ3i8xCCpiFi0bLn5dXDFu+qj8
 1ximJveXN2vaxxq8jQNPglts8/YdJ2KqXY7d3x4aSCtZjPUft1WGGc6cMs9uwq935vx+74ij
 Ithx1OWV9bync795wbxOkTGzdsO+CcVPvd9kK4PXIInHd+0NutSzNa78t5SE0TO+tYJQXsnO
 0YdfsuMDO33fXyWNfUcn2LpZkrb/vu5e9OPzD30jndeGBCnzW+bftX/+THy1gTF012j9gX1L
 HHBnVZ3rAHYlZHLHdFN+SRqU63PKO484i5drqrBuo3Oko4HP1CVKhSGoVif9F7FaiaCaBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02RfUzMcRzH+/6eOzv7dUXfaiM3TztEynxt5Zn90pDZMG108nPM3ZU7hWzn
 7FxUHioqtSKFWuuU61HlqU4PelinkIeK0aRJD+QUh84x/nvt/X59PvtsHwYXvSDcmX3Kg7xK
 KZWLKQFRWiOeMu+8fmvogrh6gOqfZmEo+WUliayJtTT6WZqAo3Z9ConaRwYopMsuoFBj/Lhy
 ocVKos/GeAq1/6gC6GZPFo0G4ipxNHqyGENtFekUujJUQqDjug4cRcdcJ9Gd00MANV35iqO6
 H1Go+EPC+M53QctdOcNQN8npH1kp7ttYIuAGOvQ0d/tLJsH1jpTi3K20TporypVwxrwYirvU
 sIm7m5FPc91xdRh3RveR4hKqNNzZ4jzAFTUeDRJtF/jt5uX7InnV/KUhgr1dRvfwex6HtSWT
 tCBpcixwZCDrC3MslVgsEDAithzAM33XCHsBobErB48FzDg7w5oatd2JxmDCswHK5hDsDKiN
 zsdsTI1z6sV82ua7sNOh+ZqvzcfZQQreKUslbbkzuxFW3Pa1oZBdAd+b5LZJRxbB4aw3f064
 BeDbuO+U/QQEO0/nknbfCVrLnW0xzkrg67HnhJ2nwrL+dDweOKX9s9L+s9L+szIBngfc+HC1
 QqZQe4cvVPKHvNRShTpCKfMKDVMYwe//SyTloCpv0KsaYAyoBpDBxS5C4u3mUJFwt/RIFK8K
 26mKkPPqauDBEGJXYWtsw04RK5Me5PfzfDiv+ttijKO7FmusozUXgWxXubT2zYwmU9GsT7Jt
 WO+qxs7LLREhVIzzI3/rseLZVwsDUi6hbsPdwlUm8zKPE8K2dZFti/2erJQZzk91MljqDK6m
 piVB95s9vWfWvNrjv27WOU1LX8EaV/8w31O1N7ZEaWsL5xA5nrkF9OqAJ98De82CHTcpxwVL
 zKXZ2cEZbcuHH943+ORoe7qa15iDByum+CtOTvhGZCp0x1tPeT7NgG5+WwJcLFrPBrRIX9Uf
 emKrxaoZakmkj5XRqXvcnpNzlMlGnnkQQh6Y+KxS7pA7N7n+cNLjQf3XDV1l1IGU9fdGyA4H
 H8vwDVOv1NtLp1k26hC4dtpaHz8xod4r9ZbgKrX0F0/PgZ5uAwAA
X-CMS-MailID: 20221025064331epcas1p4a323241a653ad0dc9a582ad348a3b831
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221022214657epcas1p18a2625c84cd6470b5404cb71f9836cc8
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <CGME20221022214657epcas1p18a2625c84cd6470b5404cb71f9836cc8@epcas1p1.samsung.com>
 <20221022214622.18042-4-ogabbay@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 23 Oct 2022 00:46:22 +0300
Oded Gabbay <ogabbay@kernel.org> wrote:

> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index b58ffb1433d6..c13701a8d4be 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -56,6 +56,9 @@ MODULE_LICENSE("GPL and additional rights");
>  static DEFINE_SPINLOCK(drm_minor_lock);
>  static struct idr drm_minors_idr;
>  
> +static DEFINE_SPINLOCK(accel_minor_lock);
> +static struct idr accel_minors_idr;
> +
>  /*
>   * If the drm core fails to init for whatever reason,
>   * we should prevent any drivers from registering with it.
> @@ -94,6 +97,8 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
>  		return &dev->primary;
>  	case DRM_MINOR_RENDER:
>  		return &dev->render;
> +	case DRM_MINOR_ACCEL:
> +		return &dev->accel;
>  	default:
>  		BUG();
>  	}
> @@ -108,9 +113,15 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
>  
>  	put_device(minor->kdev);
>  
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	idr_remove(&drm_minors_idr, minor->index);
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> +	if (minor->type == DRM_MINOR_ACCEL) {
> +		spin_lock_irqsave(&accel_minor_lock, flags);
> +		idr_remove(&accel_minors_idr, minor->index);
> +		spin_unlock_irqrestore(&accel_minor_lock, flags);
> +	} else {
> +		spin_lock_irqsave(&drm_minor_lock, flags);
> +		idr_remove(&drm_minors_idr, minor->index);
> +		spin_unlock_irqrestore(&drm_minor_lock, flags);
> +	}
>  }
>  
>  static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> @@ -127,13 +138,23 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
>  	minor->dev = dev;
>  
>  	idr_preload(GFP_KERNEL);
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	r = idr_alloc(&drm_minors_idr,
> -		      NULL,
> -		      64 * type,
> -		      64 * (type + 1),
> -		      GFP_NOWAIT);
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> +	if (type == DRM_MINOR_ACCEL) {
> +		spin_lock_irqsave(&accel_minor_lock, flags);
> +		r = idr_alloc(&accel_minors_idr,
> +			NULL,
> +			64 * (type - DRM_MINOR_ACCEL),
> +			64 * (type - DRM_MINOR_ACCEL + 1),
> +			GFP_NOWAIT);
> +		spin_unlock_irqrestore(&accel_minor_lock, flags);
> +	} else {
> +		spin_lock_irqsave(&drm_minor_lock, flags);
> +		r = idr_alloc(&drm_minors_idr,
> +			NULL,
> +			64 * type,
> +			64 * (type + 1),
> +			GFP_NOWAIT);
> +		spin_unlock_irqrestore(&drm_minor_lock, flags);
> +	}

Hi,
There are many functions which checks drm type and decides its behaviors. It's good to
re-use exiting codes, but accel devices use totally different major/minor, and so it needs to be moved to 
/drvier/accel/ (maybe later..). How about seperating functions for alloc/release minor (accel_minor_alloc..)? 
also, for others which have drm type related codes.




> @@ -607,6 +652,14 @@ static int drm_dev_init(struct drm_device *dev,
>  	/* no per-device feature limits by default */
>  	dev->driver_features = ~0u;
>  
> +	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) &&
> +				(drm_core_check_feature(dev, DRIVER_RENDER) ||
> +				drm_core_check_feature(dev, DRIVER_MODESET))) {
> +
> +		DRM_ERROR("DRM driver can't be both a compute acceleration and graphics driver\n");
> +		return -EINVAL;
> +	}
> +

It's fine for the device only for acceleration, but can't graphic devices have acceleration feature?


Thanks,
Jiho Chu
