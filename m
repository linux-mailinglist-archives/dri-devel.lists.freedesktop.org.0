Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751CD8CB34C
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 20:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B6010ED63;
	Tue, 21 May 2024 18:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HnHygO65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BD110E71B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 18:07:41 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-575070cff74so1396403a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 11:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716314860; x=1716919660; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HSHHqF9+86a45LMERrG9B7L07T4eSiePeVoVM2YlIps=;
 b=HnHygO659wdg//IZRDPq47Z3URB2kLMpXc0faGePmTUg53WSrJMGhQFUb+F8gWGdCS
 z5Wu/QiozuBQvvrv1W6yZ6yPLE7nB2slXVYlOtAwl8y8TdsbCYi3RVxmJZINNCTIeciY
 XLMg8lUUAkA4728pZZOCT7V/+cT1hZsTc7+aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716314860; x=1716919660;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HSHHqF9+86a45LMERrG9B7L07T4eSiePeVoVM2YlIps=;
 b=sVjxGBq5kN3bKoyyxzdOjVuJVF27EABnZmx2R2tqIQ7ZC7XigdkWrwCh+SzmbwXkJH
 yveIzU/z4CGtmE5T075rKf/rMfM1dm8r+K4BGUjLquyYiodvU3sgVzAnMZfcXzg0/+Af
 fma6Q5phKEk9fEZPHtOwSu06FLyowiyf8B5Bz0VQTyy+Kxn4eKnPbOt2zLWalrlEjrJp
 uiU469qzIdf18CIWhdji4WeS+Wy1cpeFlvewjdgLiYitcaySDWKT7Cdc+2QeQsg655GI
 Mfzir8hOLjQrCc4dACxgNuSSsKyDGstDRWCKH848+vW8BfltIBEp8V/t1SzaULPTwl4N
 Fwkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVmOJWzo+//NGuqkoNaWqB9AEw/ti7pVM+bosP4ENXPWZRB+PlmEY7Igs1CKyrvYV20PvO5mLPalk1o9juR42W7iXD2bty8CWXgPtapIYS
X-Gm-Message-State: AOJu0Yz7aqLPApO9N8Es2iPkUYzFX5VPOfxZS6GejaNwGklX9j9XXb7+
 MlAbQYkDuQfkmFEhwY7jHg4eR2WfLn0nU3RJ0ymZqvIm/FwucNyJ5vvZVIZNKgk=
X-Google-Smtp-Source: AGHT+IFRKXct57H1SoEiiz3mRXHTN9XDhZ0JE7tJW8JJy+JXMmTBDEISGYZ5N+PBopuxsq318R4L+g==
X-Received: by 2002:aa7:ce06:0:b0:575:96a:5ccc with SMTP id
 4fb4d7f45d1cf-575096a5d0emr10470410a12.3.1716314859880; 
 Tue, 21 May 2024 11:07:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea6586sm17028153a12.14.2024.05.21.11.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 11:07:39 -0700 (PDT)
Date: Tue, 21 May 2024 20:07:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Jason Gunthorpe <jgg@nvidia.com>, Ofir Bitton <obitton@habana.ai>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Change habanalabs maintainer and git
 repo path
Message-ID: <Zkzi6WS90yHna7Lk@phenom.ffwll.local>
Mail-Followup-To: Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Jason Gunthorpe <jgg@nvidia.com>, Ofir Bitton <obitton@habana.ai>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
References: <20240515162222.12958-1-ogabbay@kernel.org>
 <20240515162222.12958-2-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515162222.12958-2-ogabbay@kernel.org>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Wed, May 15, 2024 at 07:22:21PM +0300, Oded Gabbay wrote:
> Because I left habana, Ofir Bitton is now the habanalabs driver
> maintainer.
> 
> The git repo also changed location to the Habana GitHub website.
> 
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'm assuming Ofir will include this in the first pr for drm.git.
-Sima

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index abd4dbe2c653..5bd45a919aff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9431,11 +9431,11 @@ S:	Maintained
>  F:	block/partitions/efi.*
>  
>  HABANALABS PCI DRIVER
> -M:	Oded Gabbay <ogabbay@kernel.org>
> +M:	Ofir Bitton <obitton@habana.ai>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  C:	irc://irc.oftc.net/dri-devel
> -T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git
> +T:	git https://github.com/HabanaAI/drivers.accel.habanalabs.kernel.git
>  F:	Documentation/ABI/testing/debugfs-driver-habanalabs
>  F:	Documentation/ABI/testing/sysfs-driver-habanalabs
>  F:	drivers/accel/habanalabs/
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
