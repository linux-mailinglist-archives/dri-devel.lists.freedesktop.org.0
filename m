Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925BA43C97
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703B310E188;
	Tue, 25 Feb 2025 11:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jgD6pvzD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E3A10E4A9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:02:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F86A4429D;
 Tue, 25 Feb 2025 11:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740481323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5TI9s/8JITyCqntz+W74RFEmqgjquDUzIpco5EoxFs=;
 b=jgD6pvzDiOOuRwmedCPoMhwDWvhp/fTY8m/Sq+9fItwjiiUVXpaggznJixyZR0KK+13yGE
 k7S9SOQHOSUkrYbvLx/2p7Ln7rLbqdQZYiIhZ6GyvpeT7F9n27e6ikTDS+inApLGlEy9H9
 JZXV2LU4aj+T4wb+Bfyq8yoYM85s3WaFyh2Qw8/vabFzbAcWaVejDHMj7gpSoxP3euees4
 CQTNVoGesMFs+VPpEOO3Ph9v9i1ssYsGK667/juNxucmdjbaZww8RESwg5+V26LhtFfxF2
 UI6s1Z24uzKlrvGrIoRZa+wyc27NJs1uOK+HvI1KTvg2Cyh3L9kGhb85CjwWmw==
Date: Tue, 25 Feb 2025 12:02:01 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/16] drm/vkms: Allow to configure CRTC writeback
 support via configfs
Message-ID: <Z72jKZ4SDJYmcFf2@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
 <20250218170808.9507-7-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218170808.9507-7-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfejveetkedvleetudeuudegfeejheeujeefkefgtdeugfetfeeutdevieekvdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrs
 hhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 18/02/25 - 18:07, José Expósito wrote:
> When a CRTC is created, add a `writeback` file to allow to enable or
> disable writeback connector support
> 
> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  Documentation/gpu/vkms.rst           |  4 +++
>  drivers/gpu/drm/vkms/vkms_configfs.c | 47 ++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index da5157adfd79..4e87d8a81844 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -93,6 +93,10 @@ Continue by creating one or more CRTCs::
>  
>    sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
>  
> +CRTCs have 1 configurable attribute:
> +
> +- writeback: Enable or disable writeback connector support

Can we add: "by writing 1 or 0"?

> +
>  Once you are done configuring the VKMS instance, enable it::
>  
>    echo "1" | sudo tee /config/vkms/my-vkms/enabled
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 52205a8a9cb4..88037a57a138 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -73,6 +73,52 @@ struct vkms_configfs_crtc {
>  #define crtc_item_to_vkms_configfs_crtc(item) \
>  	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
>  
> +static ssize_t crtc_writeback_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_crtc *crtc;
> +	bool writeback;
> +
> +	crtc = crtc_item_to_vkms_configfs_crtc(item);
> +
> +	mutex_lock(&crtc->dev->lock);
> +	writeback = vkms_config_crtc_get_writeback(crtc->config);
> +	mutex_unlock(&crtc->dev->lock);
> +
> +	return sprintf(page, "%d\n", writeback);
> +}
> +
> +static ssize_t crtc_writeback_store(struct config_item *item, const char *page,
> +				    size_t count)
> +{
> +	struct vkms_configfs_crtc *crtc;
> +	bool writeback;
> +
> +	crtc = crtc_item_to_vkms_configfs_crtc(item);
> +
> +	if (kstrtobool(page, &writeback))
> +		return -EINVAL;
> +
> +	mutex_lock(&crtc->dev->lock);
> +
> +	if (crtc->dev->enabled) {
> +		mutex_unlock(&crtc->dev->lock);
> +		return -EPERM;
> +	}
> +
> +	vkms_config_crtc_set_writeback(crtc->config, writeback);
> +
> +	mutex_unlock(&crtc->dev->lock);
> +
> +	return (ssize_t)count;
> +}
> +
> +CONFIGFS_ATTR(crtc_, writeback);
> +
> +static struct configfs_attribute *crtc_item_attrs[] = {
> +	&crtc_attr_writeback,
> +	NULL,
> +};
> +
>  static void crtc_release(struct config_item *item)
>  {
>  	struct vkms_configfs_crtc *crtc;
> @@ -92,6 +138,7 @@ static struct configfs_item_operations crtc_item_operations = {
>  };
>  
>  static const struct config_item_type crtc_item_type = {
> +	.ct_attrs	= crtc_item_attrs,
>  	.ct_item_ops	= &crtc_item_operations,
>  	.ct_owner	= THIS_MODULE,
>  };
> -- 
> 2.48.1
> 
