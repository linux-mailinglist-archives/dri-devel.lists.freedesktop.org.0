Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97647B4261
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 18:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C94510E047;
	Sat, 30 Sep 2023 16:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C1410E047
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 16:52:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3231df68584so10961688f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 09:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1696092741;
 x=1696697541; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TP49E0lt1lRfwVwEUZNQYaCBfTY4UGz9ptrNHBZhxcM=;
 b=O2nqIdXg3TdpRzKs5kRGC/9SFOJx06XZXwFUUBMUsj3IIqyTw9Gx1lNrL+L52HDXZr
 ay50+9YqTAIJs2iR1GI0I1TtI+WhrV30g2n+Dhi8isY1VzTh3dmqHBYEN0KO309S48hI
 QmmwtmjKkiHqhkp+w9owJ5OY3Zivlu3WuV48k7/bWhNcMLHI7jppawD+k2RqQ80EO/gs
 ozsBsfMv04H4gUbO+Qy1P9CPejHmN7g2R4QTnalrhLif56LJMELsku52Fc9ryqNP6lgR
 ODrFIy2Rxqpt6pP69SPckaxyqx/dKTNwD3918B3erffvd1rAHKJCr+LOLRdyxNFS6J02
 VMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696092741; x=1696697541;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TP49E0lt1lRfwVwEUZNQYaCBfTY4UGz9ptrNHBZhxcM=;
 b=Sr/Jzd+aWNbJpLzx3rmU68TGBqToVDdtjTZGk1ff/eRSJvlBvB7zi/5OkQiP+YbGyU
 XwSKPEljPd3Uc4sePCu4wJpe7rkCsSaBiwh6Ca4hQraRmz4KThifsoio3vhOqk+MwRlT
 na78b4MBrntxtEGR3VX/eou6W+ToTb3rzR4uzV48IyhE/LSR3f5CxLgw5bqdIg3dXJ3e
 Kw2k8Sx710N3PKUMQwxqNRUTvFW6m4L0DKXqfbRjiYMLvQLAwBmvOMmCd1qWdOZ4SWs2
 tC9i13NHwt9FMw/kwCh82zgv+UrKVQkYwbW20IE7mcL9NHvW7lbrIBtQNn82AMNdR7ku
 cP4A==
X-Gm-Message-State: AOJu0Yww6o6Y5oz7wJ9cluS6HqHjzL4qXf1uTERs4lLdy5Tg2TmetcXp
 WteEmBBz8Ngjn942Clbse97BEw==
X-Google-Smtp-Source: AGHT+IFufhUosQmDbdYYO0lgqH5WgmabRsKPy1NuiT6FdEpd1klh9Lx806UT3kRvn4yTyQ0Y4WLs9Q==
X-Received: by 2002:adf:cf0a:0:b0:323:1689:6607 with SMTP id
 o10-20020adfcf0a000000b0032316896607mr6789063wrj.5.1696092741022; 
 Sat, 30 Sep 2023 09:52:21 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2]) by smtp.gmail.com with ESMTPSA id
 u1-20020adfed41000000b003247d3e5d99sm4921066wro.55.2023.09.30.09.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 09:52:20 -0700 (PDT)
Date: Sat, 30 Sep 2023 17:52:17 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Joel Granados <j.granados@samsung.com>
Subject: Re: [PATCH 01/15] cdrom: Remove now superfluous sentinel element
 from ctl_table array
Message-ID: <ZRhSQaNDJih5xABq@equinox>
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
 <20230928-jag-sysctl_remove_empty_elem_drivers-v1-1-e59120fca9f9@samsung.com>
 <CGME20230928133705eucas1p182bd81a8e6aff530e43f9b0746a24eaa@eucas1p1.samsung.com>
 <2023092855-cultivate-earthy-4d25@gregkh>
 <20230929121730.bwzhrpaptf45smfy@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929121730.bwzhrpaptf45smfy@localhost>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
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
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, josh@joshtriplett.org,
 linux-raid@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net,
 Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Robin Holt <robinmholt@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 02:17:30PM +0200, Joel Granados wrote:
> On Thu, Sep 28, 2023 at 03:36:55PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Sep 28, 2023 at 03:21:26PM +0200, Joel Granados via B4 Relay wrote:
> > > From: Joel Granados <j.granados@samsung.com>
> > > 
> > > This commit comes at the tail end of a greater effort to remove the
> > > empty elements at the end of the ctl_table arrays (sentinels) which
> > > will reduce the overall build time size of the kernel and run time
> > > memory bloat by ~64 bytes per sentinel (further information Link :
> > > https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> > > 
> > > Remove sentinel element from cdrom_table
> > > 
> > > Signed-off-by: Joel Granados <j.granados@samsung.com>
> > > ---
> > >  drivers/cdrom/cdrom.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> > > index cc2839805983..451907ade389 100644
> > > --- a/drivers/cdrom/cdrom.c
> > > +++ b/drivers/cdrom/cdrom.c
> > > @@ -3654,8 +3654,7 @@ static struct ctl_table cdrom_table[] = {
> > >  		.maxlen		= sizeof(int),
> > >  		.mode		= 0644,
> > >  		.proc_handler	= cdrom_sysctl_handler
> > > -	},
> > > -	{ }
> > > +	}
> > 
> > You should have the final entry as "}," so as to make any future
> > additions to the list to only contain that entry, that's long been the
> > kernel style for lists like this.
> Will send a V2 with this included. Thx.
> 
> > 
> > So your patches will just remove one line, not 2 and add 1, making it a
> > smaller diff.
> indeed.
> 
> > 
> > thanks,
> > 
> > greg k-h
> 
> -- 
> 
> Joel Granados

Hi Joel,

Thank you for your patch. I look forward to seeing V2, and will be happy
to review it.

Regards,
Phil
