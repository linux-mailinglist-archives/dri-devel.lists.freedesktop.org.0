Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CB35F6789
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 15:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E5F10E532;
	Thu,  6 Oct 2022 13:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5137D10E3DB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 13:15:38 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id y20so916388qtv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 06:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=GSOPunDdTF0UIVvBpION9xBpexDiGo+rjOxipFbXtOA=;
 b=j4TXfdYhCC5IuPEKT7c142DGOyyUICiYEJ2rQ5pM4q0yiZx4WA0kHStxgeCysxKdIn
 TuxQmiKuGnCh2iLv5lCSAeVvdfZCgr0gslAO6C/wmbiJpJE+HGv9p0BlGAp2YHTd7MAZ
 JFShEKjZddNRI3EB69zxWrjNCIn5FEtT938q5Kh600byBOTgEAyr3Cw5BxKLykg6qGKZ
 putHsZDuOr6KOj1BUasiDhf52tRH/Ed62HmMrAEpEsYDeTWjqgqViGX5p251folDWhG6
 /9qz6hzxVHLZMa8vddlM+hc6XFLs5D7qWuuoVr7OgpiuiN/JdE0keFKPOZzvhwuMVbjX
 g/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=GSOPunDdTF0UIVvBpION9xBpexDiGo+rjOxipFbXtOA=;
 b=I1HK4O9eTw0SEBVZallr+EosYKoR9jn5uuTucMcTK+38+B7DHgNdvocmhOpSkFbi5W
 2EEE1V3mzUePkiP1dlQNp9P4UJAgZbPpft4NGBoA6AQXwr4FBWOypMmrgwZERfSbUyCg
 NCGHMMXN+FvrZGCOhl3sdE1YjPfT72iPgRb+MWRo1jbU1lmV1rMdcdM05HPWqbNXWloB
 48mMUrLa+lxzbK7/aIcBvYOFbAfkQdpxM0ISOhD4Rb5DYqyCnJ87O8gLRCKXRpeAS1dP
 ThAhNPDa7lyuf2Qe/qEkJahng87vuuJWC06WQKAamq5rh9sx4ySclxbne1JTSKtev9ua
 +2EA==
X-Gm-Message-State: ACrzQf0ebCr4ZnCudtUoMBaRALxn3dE6h3nZZQc8M36D7EXK2iffsQQw
 ZsPfGZTy12kr+9Il1IxSRVaGJQ==
X-Google-Smtp-Source: AMsMyM4GpHypPhwf4qnIOCDMCCPPCaDHHZXra2UnB6U4hePjwcf7/TKsWZTRJwrBHYFFgt7B+K7zfA==
X-Received: by 2002:ac8:5703:0:b0:35c:c3f6:5991 with SMTP id
 3-20020ac85703000000b0035cc3f65991mr3383265qtw.185.1665062137334; 
 Thu, 06 Oct 2022 06:15:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05620a0b8b00b006cbc6e1478csm18686320qkh.57.2022.10.06.06.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 06:15:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ogQit-00A1hY-6O;
 Thu, 06 Oct 2022 10:15:35 -0300
Date: Thu, 6 Oct 2022 10:15:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v1 3/5] treewide: use get_random_u32() when possible
Message-ID: <Yz7U99PPl8uHCLFY@ziepe.ca>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-4-Jason@zx2c4.com> <Yz7OdfKZeGkpZSKb@ziepe.ca>
 <CAHmME9r_vNRFFjUvqx8QkBddg_kQU=FMgpk9TqOVZdvX6zXHNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9r_vNRFFjUvqx8QkBddg_kQU=FMgpk9TqOVZdvX6zXHNg@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 drbd-dev@lists.linbit.com, dev@openvswitch.org, rds-devel@oss.oracle.com,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org,
 SHA-cyfmac-dev-list@infineon.com, coreteam@netfilter.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, cake@lists.bufferbloat.net,
 brcm80211-dev-list.pdl@broadcom.com, linux-raid@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 06, 2022 at 07:05:48AM -0600, Jason A. Donenfeld wrote:

> > > diff --git a/drivers/infiniband/ulp/ipoib/ipoib_cm.c b/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> > > index fd9d7f2c4d64..a605cf66b83e 100644
> > > --- a/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> > > +++ b/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> > > @@ -465,7 +465,7 @@ static int ipoib_cm_req_handler(struct ib_cm_id *cm_id,
> > >               goto err_qp;
> > >       }
> > >
> > > -     psn = prandom_u32() & 0xffffff;
> > > +     psn = get_random_u32() & 0xffffff;
> >
> >  prandom_max(0xffffff + 1)
> 
> That'd work, but again it's not more clear. Authors here are going for
> a 24-bit number, and masking seems like a clear way to express that.

vs just asking directly for a 24 bit number?

Jason
