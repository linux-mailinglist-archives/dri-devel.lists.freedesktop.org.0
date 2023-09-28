Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF8A7B212D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F5D10E67E;
	Thu, 28 Sep 2023 15:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29E110E679;
 Thu, 28 Sep 2023 15:26:19 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6c4b9e09521so6745763a34.3; 
 Thu, 28 Sep 2023 08:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695914779; x=1696519579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYPUiAEm0lZNQbU6hKmoJKqPGRAnrTCwSSHfRdZ7LfA=;
 b=mZGs+uP75rxdCz786xMOdcN1qcoKvoGejIAbLwg+cfLcQ5RGOk3kRofHACmnGntFuM
 MF0WNvhT8sqiHCSnq78fhznXT/BJW//J71vL4F6iOT08BoUHuWArQMADV0Ztasj1pqRh
 xNqlPga3BxkupmgPkp0Mm2uAgLpXht9Wk5tIEVvOAB71Blr52ni0lcYDX4TAwxSNWcWN
 rTzTZWOnFFrPz0MkHaquKyz/PGYr4rn8KJXuyXNwxXelcGXUSpNXn3DeKIGlE+a0MNX9
 9s7qTVN1yFXJXRb736p8CiVtQDz61aciFKIqugSTaTGH2WRZ11LdN9mxc6BwuBMREzbq
 PAcw==
X-Gm-Message-State: AOJu0YzgC4WXemjcwQykB+NyWp0iA8b2HPBR/of9qlsRkk5CpJ/QOs1F
 4XPbjQ8S/rhN4+OXVqa4r6U=
X-Google-Smtp-Source: AGHT+IEkFDTusLpYox11EoA1Tl2MJIdC5Ad7Ua286wH6ql8JYqDg2cQ1Wc6Zlzvv071aY+VufA88gQ==
X-Received: by 2002:a9d:73d5:0:b0:6c4:b339:2528 with SMTP id
 m21-20020a9d73d5000000b006c4b3392528mr1632381otk.16.1695914778722; 
 Thu, 28 Sep 2023 08:26:18 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa78dce000000b006906aaf1e4dsm13514673pfr.150.2023.09.28.08.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 08:26:18 -0700 (PDT)
Date: Thu, 28 Sep 2023 15:26:16 +0000
From: Wei Liu <wei.liu@kernel.org>
To: j.granados@samsung.com
Subject: Re: [PATCH 14/15] hyper-v/azure: Remove now superfluous sentinel
 element from ctl_table array
Message-ID: <ZRWbGDlXCS4t8tMf@liuwe-devbox-debian-v2>
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
 <65157da8.050a0220.fb263.fdb1SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65157da8.050a0220.fb263.fdb1SMTPIN_ADDED_BROKEN@mx.google.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Steve Wahl <steve.wahl@hpe.com>,
 Clemens Ladisch <clemens@ladisch.de>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>,
 Russ Weight <russell.h.weight@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 willy@infradead.org, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-serial@vger.kernel.org, Doug Gilbert <dgilbert@interlog.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 josh@joshtriplett.org, linux-raid@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, xen-devel@lists.xenproject.org,
 openipmi-developer@lists.sourceforge.net, Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Ahern <dsahern@kernel.org>, Robin Holt <robinmholt@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Luis Chamberlain <mcgrof@kernel.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please change the prefix to "Drivers: hv:" in the subject line in the
two patches.

On Thu, Sep 28, 2023 at 03:21:39PM +0200, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove sentinel from hv_ctl_table
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  drivers/hv/hv_common.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> index ccad7bca3fd3..bc7d678030aa 100644
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -147,8 +147,7 @@ static struct ctl_table hv_ctl_table[] = {
>  		.proc_handler	= proc_dointvec_minmax,
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= SYSCTL_ONE
> -	},
> -	{}
> +	}

Please keep the comma at the end.

>  };
>  
>  static int hv_die_panic_notify_crash(struct notifier_block *self,
> 
> -- 
> 2.30.2
> 
