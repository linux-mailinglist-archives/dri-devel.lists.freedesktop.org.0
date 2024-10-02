Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BAF98EA72
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B0C10E7BA;
	Thu,  3 Oct 2024 07:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; secure) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="cti754Bi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 484 seconds by postgrey-1.36 at gabe;
 Wed, 02 Oct 2024 20:08:15 UTC
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id B873B10E788
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1727899210; bh=6jXGqPA9icQON+2qUMEIWGFMY1G1Nce2lQUI+V7Tc68=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cti754BiNGiqPmmDLcm859T4xFOaF/geEYlROxC+xmyZdrXOzgOv5aCphQqn6KKnD
 5nY2VNvHQon7P/zDCZyp5He4U0U7iUd2h9mf82wp+OenhqudI2QcHKwDJVg3veNW4z
 TiEIrMjlmfjrtOzk8VdD3Jg88/12sPqkbgb3YMTcrcV3ZLH4J6C3q0HrEwb3yDgXZi
 0BswYasw6Dh2/szYUORkMbGqKj4KiagtFbu+xAoPrsVf4Nkzq3g60/dqW5wp1f4eVG
 pYFxtOpzNbQmZduxqQlrtXKTNkAgD2EfoXcx03wHh9GTsC0/qFPlH+mUU/d8bJRT+l
 Ln8dPpCoFA9c342cJfrzcJTlR6jhOGFj3eJ/Jya0BMhASrp998ksLZdGXwZQZjJVlY
 IEaE75b83EJV/kth2Q/djn9mvSg30iNebnMJQZpzZOM/AYMlNT9yz20jid7l4V6wL6
 39sw/ygQcm+3iHr9qF1bctrcSW+punIKK2rLVVX9myN9uiKyMRqkOKUGidc69fBXoJ
 Bw7eZKac7/uMHmtUsLpY5Rtb/tHmq456Gx36FPTXMCjheavgDOtml6xez8nCRCiXvQ
 KRpSHIyHwp81zVKIPp6wxah1UHKWP+p+cNaYABqeD0pDKFm9JLe1na0ftpCl8wlEWm
 WyDhrzLxx5jhlIRjQgIizmMg=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl
 [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
 by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 8146918D877;
 Wed,  2 Oct 2024 22:00:10 +0200 (CEST)
Message-ID: <8c5bfc12-cbcc-4102-9826-494060df4179@ijzerbout.nl>
Date: Wed, 2 Oct 2024 22:00:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,06/10] drm/bochs: Allocate DRM device in struct bochs_device
To: Thomas Zimmermann <tzimmermann@suse.de>, kraxel@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
References: <20240902105546.792625-7-tzimmermann@suse.de>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20240902105546.792625-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 03 Oct 2024 07:37:11 +0000
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

Op 02-09-2024 om 12:53 schreef Thomas Zimmermann:
> Allocate an instance of struct drm_device in struct bochs_device. Also
> remove all uses of dev_private from bochs and upcast from the embedded
> instance if necessary.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   drivers/gpu/drm/tiny/bochs.c | 52 +++++++++++++++++-------------------
>   1 file changed, 25 insertions(+), 27 deletions(-)
>
> [...]
> @@ -606,6 +602,7 @@ static const struct dev_pm_ops bochs_pm_ops = {
>   
>   static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   {
> +	struct bochs_device *bochs;
>   	struct drm_device *dev;
>   	unsigned long fbsize;
>   	int ret;
> @@ -620,9 +617,10 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
>   	if (ret)
>   		return ret;
>   
> -	dev = drm_dev_alloc(&bochs_driver, &pdev->dev);
> -	if (IS_ERR(dev))
> +	bochs = devm_drm_dev_alloc(&pdev->dev, &bochs_driver, struct bochs_device, dev);
> +	if (IS_ERR(bochs))
>   		return PTR_ERR(dev);
> +	dev = &bochs->dev;
The assignment of dev comes after potential use of dev in PTR_ERR(dev).
Did you perhaps meant to have PTR_ERR(&pdev->dev) ?
>   
>   	ret = pcim_enable_device(pdev);
>   	if (ret)
> @@ -630,7 +628,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
>   
>   	pci_set_drvdata(pdev, dev);
>   
> -	ret = bochs_load(dev);
> +	ret = bochs_load(bochs);
>   	if (ret)
>   		goto err_free_dev;
>   

