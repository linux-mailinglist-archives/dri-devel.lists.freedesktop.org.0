Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405BE9FB5AB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 21:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED8C10E436;
	Mon, 23 Dec 2024 20:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68B810E5C4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 20:46:10 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH95q4XLzz6K6mm;
 Tue, 24 Dec 2024 04:45:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 228F4140A70;
 Tue, 24 Dec 2024 04:46:09 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 21:46:07 +0100
Date: Mon, 23 Dec 2024 20:46:05 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Zijun Hu <zijun_hu@icloud.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, Thomas =?ISO-8859-1?Q?Wei=DFschu?=
 =?ISO-8859-1?Q?h?= <thomas@t-8ch.de>, <linux-kernel@vger.kernel.org>,
 <nvdimm@lists.linux.dev>, <linux-sound@vger.kernel.org>,
 <sparclinux@vger.kernel.org>, <linux-block@vger.kernel.org>,
 <linux-cxl@vger.kernel.org>, <linux1394-devel@lists.sourceforge.net>,
 <arm-scmi@vger.kernel.org>, <linux-efi@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-hwmon@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <netdev@vger.kernel.org>, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v4 09/11] driver core: Introduce an device matching API
 device_match_type()
Message-ID: <20241223204605.000067e0@huawei.com>
In-Reply-To: <20241211-const_dfc_done-v4-9-583cc60329df@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-9-583cc60329df@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
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

On Wed, 11 Dec 2024 08:08:11 +0800
Zijun Hu <zijun_hu@icloud.com> wrote:

> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Introduce device_match_type() for purposes below:
> 
> - Test if a device matches with a specified device type.
> - As argument of various device finding APIs to find a device with
>   specified type.
> 
> device_find_child() will use it to simplify operations later.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
Seems useful enough to have a generic helper.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/base/core.c        | 6 ++++++
>  include/linux/device/bus.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 289f2dafa8f3831931d0f316d66ee12c2cb8a2e1..8bdbc9e657e832a063542391426f570ccb5c18b9 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -5228,6 +5228,12 @@ int device_match_name(struct device *dev, const void *name)
>  }
>  EXPORT_SYMBOL_GPL(device_match_name);
>  
> +int device_match_type(struct device *dev, const void *type)
> +{
> +	return dev->type == type;
> +}
> +EXPORT_SYMBOL_GPL(device_match_type);
> +
>  int device_match_of_node(struct device *dev, const void *np)
>  {
>  	return dev->of_node == np;
> diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
> index cdc4757217f9bb4b36b5c3b8a48bab45737e44c5..bc3fd74bb763e6d2d862859bd2ec3f0d443f2d7a 100644
> --- a/include/linux/device/bus.h
> +++ b/include/linux/device/bus.h
> @@ -131,6 +131,7 @@ typedef int (*device_match_t)(struct device *dev, const void *data);
>  
>  /* Generic device matching functions that all busses can use to match with */
>  int device_match_name(struct device *dev, const void *name);
> +int device_match_type(struct device *dev, const void *type);
>  int device_match_of_node(struct device *dev, const void *np);
>  int device_match_fwnode(struct device *dev, const void *fwnode);
>  int device_match_devt(struct device *dev, const void *pdevt);
> 

