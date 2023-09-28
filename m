Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E237B2106
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6529210E67C;
	Thu, 28 Sep 2023 15:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602C610E679;
 Thu, 28 Sep 2023 15:21:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C8DF761CFD;
 Thu, 28 Sep 2023 15:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796BBC433C7;
 Thu, 28 Sep 2023 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695914468;
 bh=5QGsjlLA6+fSdsYbT2wgVXCyV5RBnz+gCDO8qtKxudM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gY6bnbm4Br2Su1APlGkn1sEu4r+c6sdQLDsonp71NsJQbUQraKl8xXh9rGZORDHDX
 1QshNOkVFu0tNkDMf36lbn30zkyYzhLTGnPTXNjw1k+PIvKKZGUYxKQ7wvRHp1f4Yx
 zc21t6uxwYapN/InHw4nKU1MlE+GefjFMudIrCx51jeRHViIFjwTYbeCQ0LaQLHNDy
 K6pRADykVVDDE9WhFVGCoH8yaA4fYcRbfTjd6dVfgkxkaTlBtpIRkVKRbieDzAxAlu
 +hjpSkHGs3H12owDA6PgfqSF8KGYMJHSlAYsT2GtXigCu2wgFul2znYOe2oL1/yATw
 HlBza/JCHsDzg==
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3247d69ed2cso2542717f8f.0; 
 Thu, 28 Sep 2023 08:21:08 -0700 (PDT)
X-Gm-Message-State: AOJu0YzUQPGTq8hRxDQar/GW2RpiHTNToAco3gp+m37J20SiP8ous2td
 wzLAwPaCCn6IZFKNOQ9FDiRVUQY4QBwD8V7u/Wo=
X-Google-Smtp-Source: AGHT+IFGxnL1jLxRJ82JHSkotXT+AJQbGwcj+NsBF8Wdz/LihQ1gwaw7yDfPbhv4CL9qBIGKh5TUPhf228x9wFIkjTk=
X-Received: by 2002:a05:6512:1595:b0:500:b828:7a04 with SMTP id
 bp21-20020a056512159500b00500b8287a04mr1542995lfb.18.1695914446757; Thu, 28
 Sep 2023 08:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
 <65157da7.5d0a0220.13b5e.9e95SMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <65157da7.5d0a0220.13b5e.9e95SMTPIN_ADDED_BROKEN@mx.google.com>
From: Song Liu <song@kernel.org>
Date: Thu, 28 Sep 2023 08:20:34 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6WRen7Udqc+O+haAH8PZXH2jYdpUj1X7UCuQYngVWxoA@mail.gmail.com>
Message-ID: <CAPhsuW6WRen7Udqc+O+haAH8PZXH2jYdpUj1X7UCuQYngVWxoA@mail.gmail.com>
Subject: Re: [PATCH 13/15] raid: Remove now superfluous sentinel element from
 ctl_table array
To: j.granados@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Jiri Slaby <jirislaby@kernel.org>, Russ Weight <russell.h.weight@intel.com>,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Corey Minyard <minyard@acm.org>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, willy@infradead.org,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org,
 Doug Gilbert <dgilbert@interlog.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, josh@joshtriplett.org,
 linux-raid@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net,
 Juergen Gross <jgross@suse.com>,
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

On Thu, Sep 28, 2023 at 6:20=E2=80=AFAM Joel Granados via B4 Relay
<devnull+j.granados.samsung.com@kernel.org> wrote:
>
> From: Joel Granados <j.granados@samsung.com>
>
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
>
> Remove sentinel from raid_table
>
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  drivers/md/md.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index a104a025084d..3866d8f754a0 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -304,8 +304,7 @@ static struct ctl_table raid_table[] =3D {
>                 .maxlen         =3D sizeof(int),
>                 .mode           =3D S_IRUGO|S_IWUSR,
>                 .proc_handler   =3D proc_dointvec,
> -       },
> -       { }
> +       }
>  };

Please keep "}," as Greg suggested. Otherwise,

Acked-by: Song Liu <song@kernel.org>

Thanks,
Song
