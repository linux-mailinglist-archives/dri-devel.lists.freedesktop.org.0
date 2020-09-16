Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7702526D5C1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1536EB86;
	Thu, 17 Sep 2020 08:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BAA6E09E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 23:58:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4ED4C5C0B76;
 Wed, 16 Sep 2020 19:58:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 16 Sep 2020 19:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=q0+VG4Y58Dg+bou1Q7gilbRnXTD7bBs
 LYleS0tq1RzA=; b=NgphU89hbx2T9ojJnhy+DSZluWnoJjGSf20B5xVeqmgZM8v
 ZCKRdsqVRfYTp4s5aigFaot31X8ssv7OmL6FdxZErWylT7zQ7gg59v1rJ4Qvc1V9
 fSaKXBbVssJzWE6bLW6RCO0hCwfXEydJUXRRvNQMSkria3NEP7zTFTwRkWmXW8/L
 Rv0LcET3O/6gCwlojIA5rlJYMaXM8M459f25Rn/yJjcj0h1dsHCfdiBe6/bfox3V
 pKeqntQMEJNR3b8hnjd9Q0Q2HCibPlHR3b11SUcnjkxRbrG7L/XKoW8IC5he4uLR
 LxaQ3WOD132Y0IESxVz1RmGoUdiblIEBGCQmLQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=q0+VG4
 Y58Dg+bou1Q7gilbRnXTD7bBsLYleS0tq1RzA=; b=X8D90nvr20e1hiKVerT5vY
 iEFBvpDBAgGQaQDymMz8rwWvqdUzHxzNh+0crfHXuakPn3hNnnEB4O0ckIFnpu4/
 J1CZ4m/Y4ryRJGIUAD6RgyuWHizyl1jjyf4beukvi5awxrI/Al7jKwFKnfuxjDB0
 9sqLt2yXEeDsrvAKh9t+7QbvDfdE109rFwrouW2M1UcIW5G/c/pEXyYXZ4RcfTQ9
 1pqkFmgl4lqOU8pYUZgzVw7JmruYYc5RqC1z/WEbyaOaa0yvlwhRst748pEQ4Hw4
 JKE1IzAJ2wM5HklPQprktSfo//SIic2GoEwqaeENSzgEtjaij3degBqwOHMtGGiw
 ==
X-ME-Sender: <xms:iKZiX67BVOuB98faSIAWpFFkbW_aaRNAZBACSOBUBzNIiPmW31PvbQ>
 <xme:iKZiXz7ndhFnER0oGm0hisf1AefxTIHbFm22-7GEEx3gRh8eoRaveMn9wovm1nbTk
 4FBVU5rIprmjOZWKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:iKZiX5eB6iscIriE1LfqjWvJSdgSncpVYjcGvEBD_oTJqeNiQun-fA>
 <xmx:iKZiX3JDXhEx8zQ88FpmYOu_0IrGRazFcTKS-7LEnnXuI5rEJXebvw>
 <xmx:iKZiX-LnFlsRUOigOfQtH4jsI2fFMMz-W3B6TjAlrA7O-DQ9Ii-OkA>
 <xmx:iaZiX60umQ9FszeM3YrDkM6wYJXvG9e37Dz3HyNeqTXcGv3GnlryQw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 64433E00D1; Wed, 16 Sep 2020 19:57:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-324-g0f99587-fm-20200916.004-g0f995879
Mime-Version: 1.0
Message-Id: <1c409963-bba0-42dd-adc7-67c6903204bf@www.fastmail.com>
In-Reply-To: <20200916083413.777307-1-joel@jms.id.au>
References: <20200916083413.777307-1-joel@jms.id.au>
Date: Thu, 17 Sep 2020 09:27:39 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "David Airlie" <airlied@linux.ie>,
 "Daniel Vetter" <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/aspeed: Add sysfs for output settings
X-Mailman-Approved-At: Thu, 17 Sep 2020 08:08:02 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Wed, 16 Sep 2020, at 18:04, Joel Stanley wrote:
> These settings are used by an ASPEED BMC to determine when the host is
> trying to drive the display over PCIe (vga_pw) and to switch the
> output between PCIe and the internal graphics device (dac_mux).
> 
> The valid values for the dac mux are:
> 
>  00: VGA mode (default, aka PCIe)
>  01: Graphics CRT (aka BMC internal graphics, this driver)
>  10: Pass through mode from video input port A
>  11: Pass through mode from video input port B
> 
> Values for the read-only vga password register are:
> 
>  1: Host driving the display
>  0: Host not driving the display
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 71 +++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c 
> b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 903f4f304647..9e06a3683f8a 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -205,6 +205,69 @@ static const struct of_device_id 
> aspeed_gfx_match[] = {
>  	{ }
>  };
>  
> +#define ASPEED_SCU_VGA0		0x50
> +#define ASPEED_SCU_MISC_CTRL	0x2c
> +
> +static ssize_t dac_mux_store(struct device *dev, struct 
> device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct aspeed_gfx *priv = dev_get_drvdata(dev);
> +	u32 val;
> +	int rc;
> +
> +	rc = kstrtou32(buf, 0, &val);
> +	if (rc)
> +		return rc;
> +
> +	if (val < 0 || val > 3)

val is unsigned so can't be less than zero.

Otherwise,

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> +		return -EINVAL;
> +
> +	rc = regmap_update_bits(priv->scu, ASPEED_SCU_MISC_CTRL, 0x30000, val 
> << 16);
> +	if (rc < 0)
> +		return 0;
> +
> +	return count;
> +}
> +
> +static ssize_t dac_mux_show(struct device *dev, struct 
> device_attribute *attr, char *buf)
> +{
> +	struct aspeed_gfx *priv = dev_get_drvdata(dev);
> +	u32 reg;
> +	int rc;
> +
> +	rc = regmap_read(priv->scu, ASPEED_SCU_MISC_CTRL, &reg);
> +	if (rc)
> +		return rc;
> +
> +	return sprintf(buf, "%u\n", (reg >> 16) & 0x3);
> +}
> +static DEVICE_ATTR_RW(dac_mux);
> +
> +static ssize_t
> +vga_pw_show(struct device *dev, struct device_attribute *attr, char 
> *buf)
> +{
> +	struct aspeed_gfx *priv = dev_get_drvdata(dev);
> +	u32 reg;
> +	int rc;
> +
> +	rc = regmap_read(priv->scu, ASPEED_SCU_VGA0, &reg);
> +	if (rc)
> +		return rc;
> +
> +	return sprintf(buf, "%u\n", reg & 1);
> +}
> +static DEVICE_ATTR_RO(vga_pw);
> +
> +static struct attribute *aspeed_sysfs_entries[] = {
> +	&dev_attr_vga_pw.attr,
> +	&dev_attr_dac_mux.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group aspeed_sysfs_attr_group = {
> +	.attrs = aspeed_sysfs_entries,
> +};
> +
>  static int aspeed_gfx_probe(struct platform_device *pdev)
>  {
>  	struct aspeed_gfx *priv;
> @@ -219,6 +282,12 @@ static int aspeed_gfx_probe(struct platform_device 
> *pdev)
>  	if (ret)
>  		return ret;
>  
> +	dev_set_drvdata(&pdev->dev, priv);
> +
> +	ret = sysfs_create_group(&pdev->dev.kobj, &aspeed_sysfs_attr_group);
> +	if (ret)
> +		return ret;
> +
>  	ret = drm_dev_register(&priv->drm, 0);
>  	if (ret)
>  		goto err_unload;
> @@ -227,6 +296,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_unload:
> +	sysfs_remove_group(&pdev->dev.kobj, &aspeed_sysfs_attr_group);
>  	aspeed_gfx_unload(&priv->drm);
>  
>  	return ret;
> @@ -236,6 +306,7 @@ static int aspeed_gfx_remove(struct platform_device *pdev)
>  {
>  	struct drm_device *drm = platform_get_drvdata(pdev);
>  
> +	sysfs_remove_group(&pdev->dev.kobj, &aspeed_sysfs_attr_group);
>  	drm_dev_unregister(drm);
>  	aspeed_gfx_unload(drm);
>  
> -- 
> 2.28.0
> 
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
