Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA85122CC4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 14:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF3E89A0E;
	Tue, 17 Dec 2019 13:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D6B89A0E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 13:19:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b19so2896726wmj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 05:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H37dVUR9kItBvLUhcmZ+2qSu16q4UES9ihUAcWiQsd4=;
 b=lWK6Tmlb4CiC9XzLfvUIj8N5I8DLeA+H1Y7mjuOk755VqB9iDzMMLxdGwdLFY85lVw
 4sqlcrnt3Az8PoDhFaiD36oyNuhg5c54qQM3qcCNlFI3OkXedhTO/ufNX/oRgkPlyvFo
 PqZBPbGE42+XNecHMEWm3VvJY/RrrIL0uLgko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=H37dVUR9kItBvLUhcmZ+2qSu16q4UES9ihUAcWiQsd4=;
 b=cIeE6vWP9DXOFFXaqiY19piQQupO9emUDDMgtmM+tcc/sd3mJkUWZxKTptJURAUH04
 DvAEjlfIATMmBs5LYOkhph35LfpiLiJDnKTuHyZjuadg/EiGlgRlquzJsN6Re06fIZPu
 7VWlxxytHcFvuYzhOp1tOp5ECogDe1kCUjKrba3rgl2c6SvfHMqefQ7ASzeJm/45F5tp
 NvM7bWZlEKSqg+xeKyjb86dNtHtxCBieLEA7xcyo/w2IhEzux5spUf1KCjSlE3ofZet8
 I87ODAYkE7WQyz/Lmgg4om6lQzH7q9MR7pLZ19f0cvlgd3L1Yh5CpLD8DdUC6+0lawor
 BacQ==
X-Gm-Message-State: APjAAAUAFjhxQ8NaE+p0MmBDc1iTZoUOq7F04DZbYEvtkIPI5Bhq0JP9
 aioZ2KGk2cpkMf/QZG0PdoPUiJhoTHs=
X-Google-Smtp-Source: APXvYqzliw8g7eRzBJ1o76RhQOcEfDchV4RUR+NMlKni9Ot6SqnYzUe0jGJN/na2F7kQol/nHxfaqw==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr5421444wml.103.1576588780369; 
 Tue, 17 Dec 2019 05:19:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id f1sm25264661wru.6.2019.12.17.05.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 05:19:39 -0800 (PST)
Date: Tue, 17 Dec 2019 14:19:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20191217131937.GZ624164@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Icenowy Zheng <icenowy@aosc.io>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@the-dreams.de>
References: <20191216122331.43c766f1@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216122331.43c766f1@canb.auug.org.au>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Wolfram Sang <wsa@the-dreams.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 12:23:31PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/bridge/analogix/analogix-anx6345.c: In function 'anx6345_i2c_probe':
> drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:30: error: implicit declaration of function 'i2c_new_dummy' [-Werror=implicit-function-declaration]
>   738 |    anx6345->i2c_clients[i] = i2c_new_dummy(client->adapter,
>       |                              ^~~~~~~~~~~~~
> drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:28: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   738 |    anx6345->i2c_clients[i] = i2c_new_dummy(client->adapter,
>       |                            ^
> 
> Caused by commit
> 
>   6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> 
> interacting with commit
> 
>   2c2f00ab1641 ("i2c: remove i2c_new_dummy() API")
> 
> From Linus' tree.
> 
> I have applied the following fix up patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 16 Dec 2019 12:11:19 +1100
> Subject: [PATCH] drm/bridge: fix up for removal of i2c_new_dummy()
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks pulled into drm-next since I just processed the first drm-misc-next
pull.
-Daniel

> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index 9917ce0d86a0..56f55c53abfd 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -735,13 +735,13 @@ static int anx6345_i2c_probe(struct i2c_client *client,
>  	/* Map slave addresses of ANX6345 */
>  	for (i = 0; i < I2C_NUM_ADDRESSES; i++) {
>  		if (anx6345_i2c_addresses[i] >> 1 != client->addr)
> -			anx6345->i2c_clients[i] = i2c_new_dummy(client->adapter,
> +			anx6345->i2c_clients[i] = i2c_new_dummy_device(client->adapter,
>  						anx6345_i2c_addresses[i] >> 1);
>  		else
>  			anx6345->i2c_clients[i] = client;
>  
> -		if (!anx6345->i2c_clients[i]) {
> -			err = -ENOMEM;
> +		if (IS_ERR(anx6345->i2c_clients[i])) {
> +			err = PTR_ERR(anx6345->i2c_clients[i]);
>  			DRM_ERROR("Failed to reserve I2C bus %02x\n",
>  				  anx6345_i2c_addresses[i]);
>  			goto err_unregister_i2c;
> -- 
> 2.24.0
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
