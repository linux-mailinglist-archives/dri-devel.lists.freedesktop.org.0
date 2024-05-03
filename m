Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B318BB3A1
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 21:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61D7112937;
	Fri,  3 May 2024 19:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nJwQoM2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8784A10FFF5;
 Fri,  3 May 2024 19:03:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2AB26CE19FE;
 Fri,  3 May 2024 19:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6EDC116B1;
 Fri,  3 May 2024 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714763002;
 bh=pJM8i96ujPL/T4zAJrJuNpEQ+W+V/MxYLMvJEqYmBvg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nJwQoM2R038ROrePBZmLBa9LYRKlWHdPcGcYai07pnFJYM6UTHODQtRliqexPCOgg
 WyQenZ6EGL6INqEuQpZnvuyV5VrXQkVxgu74DZj4mKJs4LRaGTYwzIsNSmCZMTrvwZ
 AUXClks0NGxZ0OY3IItj4fPXk/lqFMVEPDE771iQqnaGMB3uQmEjnOz0KCG/IFR60O
 own53ZbY1D1FjeQObRwkIrGaVe0hJC8+m+TOnlN7L5tjp+ohRqe+SAjcjAt7CrKDh0
 Elyj8osbsh3KXPBnBAL9C3QOyL3fEJVeH9a0hjbk8fgnvV8hCcO7v0AbQ1+m679Nsi
 GrNG8hEtpghEA==
Date: Fri, 3 May 2024 20:03:14 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
 (V4L/DVB)), linux-kernel@vger.kernel.org (open list), Wolfram Sang
 <wsa+renesas@sang-engineering.com>, amd-gfx@lists.freedesktop.org (open
 list:RADEON and AMDGPU DRM DRIVERS), dri-devel@lists.freedesktop.org (open
 list:DRM DRIVERS), intel-gfx@lists.freedesktop.org (open list:INTEL DRM
 DISPLAY FOR XE AND I915 DRIVERS), intel-xe@lists.freedesktop.org (open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM
 HOST DRIVERS), linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: Re: [PATCH v0 04/14] media: au0828: Make I2C terminology more
 inclusive
Message-ID: <20240503200314.51e8439a@sal.lan>
In-Reply-To: <20240329170038.3863998-5-eahariha@linux.microsoft.com>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-5-eahariha@linux.microsoft.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Em Fri, 29 Mar 2024 17:00:28 +0000
Easwar Hariharan <eahariha@linux.microsoft.com> escreveu:

> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
> 
> Compile tested, no functionality changes intended

Current media drivers are perfectly fine with the current terminology. 
None of them implement the above new standards.

Please drop patches for current stuff under drivers/media.

Regards,
Mauro

> 
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  drivers/media/usb/au0828/au0828-i2c.c   | 4 ++--
>  drivers/media/usb/au0828/au0828-input.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/au0828/au0828-i2c.c b/drivers/media/usb/au0828/au0828-i2c.c
> index 749f90d73b5b..3e66d42bf134 100644
> --- a/drivers/media/usb/au0828/au0828-i2c.c
> +++ b/drivers/media/usb/au0828/au0828-i2c.c
> @@ -23,7 +23,7 @@ MODULE_PARM_DESC(i2c_scan, "scan i2c bus at insmod time");
>  #define I2C_WAIT_DELAY 25
>  #define I2C_WAIT_RETRY 1000
>  
> -static inline int i2c_slave_did_read_ack(struct i2c_adapter *i2c_adap)
> +static inline int i2c_client_did_read_ack(struct i2c_adapter *i2c_adap)
>  {
>  	struct au0828_dev *dev = i2c_adap->algo_data;
>  	return au0828_read(dev, AU0828_I2C_STATUS_201) &
> @@ -35,7 +35,7 @@ static int i2c_wait_read_ack(struct i2c_adapter *i2c_adap)
>  	int count;
>  
>  	for (count = 0; count < I2C_WAIT_RETRY; count++) {
> -		if (!i2c_slave_did_read_ack(i2c_adap))
> +		if (!i2c_client_did_read_ack(i2c_adap))
>  			break;
>  		udelay(I2C_WAIT_DELAY);
>  	}
> diff --git a/drivers/media/usb/au0828/au0828-input.c b/drivers/media/usb/au0828/au0828-input.c
> index 3d3368202cd0..98a57b6e02e2 100644
> --- a/drivers/media/usb/au0828/au0828-input.c
> +++ b/drivers/media/usb/au0828/au0828-input.c
> @@ -30,7 +30,7 @@ struct au0828_rc {
>  	int polling;
>  	struct delayed_work work;
>  
> -	/* i2c slave address of external device (if used) */
> +	/* i2c client address of external device (if used) */
>  	u16 i2c_dev_addr;
>  
>  	int  (*get_key_i2c)(struct au0828_rc *ir);
