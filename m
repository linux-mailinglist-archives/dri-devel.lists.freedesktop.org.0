Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAAB18872D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928C56E1E8;
	Tue, 17 Mar 2020 14:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3F56E125
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 13:25:59 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id q73so1373349qvq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=149vrDC6Ny5kXlZ3c9yb3Ff3i3SdoOBmg7pfld3LKGI=;
 b=MGDRAHHwM4nroOOuiUdxwzeDLPsUSxkKGB1ZBFk85k2dwJdJTHMO8PEvHSg2fVErKC
 xbyOzKDkvp5ST2WwzC+GHN4a0yqFAY4pquPxURWoEm5babHrmv41sG04VZtMii9smFBi
 npONJDDXJCv1pMi4ZyGmSrpR4itL6lpn//Whw93FEmcsdwIhQaGMygrv0IxYCF/CIf6e
 A5KYy2R78gVt9xaczD36OBsEfKo76u/YveXPSIXg1stdm9llUXaTvmmz7+djHoeqj25m
 k6WX9vZgfDVYYUp8MszMkTZpAxuWbQ5QLXn6OJXFdneBqng5r8BZ7FIMyRYxs+n/udis
 UKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=149vrDC6Ny5kXlZ3c9yb3Ff3i3SdoOBmg7pfld3LKGI=;
 b=MmGpV6BwziJsaxCu6u11x9rG5O9IcninvEMvaoGdM6lr2SDPfdQ/Jnw0w0TbC7a/8H
 YsKM/qFZF2O9jUUn3+S0T9+Srp++G23SKtQvurkdUgHmZWv8zuUojb1gek9lxAzE2F5r
 kS8dMZa45Uc3+V3+RSUYF6JKrGUIuMd8xrlL+Z9MQzpgBW5wJv9VgCFSri5QLPPmiedm
 +gzRszLToGNJv7r6xW23qdVGcYzZ+VnMTpOqmhWqMI1iDf5b/HrXY1KRimnpE8MAGHnh
 EFaquYCvPLQ0+qEQnYp9bE49vpDKFvvr/Ld7V/WHMJRNa/EQdtAQZf190YZBQCXNr0VJ
 ZZsw==
X-Gm-Message-State: ANhLgQ2xuEmpbY0xVeFa81gAtcOnkgC3jdhKoZrkEr4zJQtArCZm4gFz
 ge4KjbiXWOLFE32WAuhzU0PlGg==
X-Google-Smtp-Source: ADFU+vud8ckGfbpq7RFxGRUQtjLFosMM5WbNx995vqc+P+Orw+3LIFDIv/yLP5SnzTRZvkDSJttSbw==
X-Received: by 2002:a0c:bf46:: with SMTP id b6mr4911822qvj.47.1584451558143;
 Tue, 17 Mar 2020 06:25:58 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id u77sm1882170qka.134.2020.03.17.06.25.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Mar 2020 06:25:57 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jECEH-00027w-2X; Tue, 17 Mar 2020 10:25:57 -0300
Date: Tue, 17 Mar 2020 10:25:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 08/12] docs: fix broken references to text files
Message-ID: <20200317132557.GS20941@ziepe.ca>
References: <cover.1584450500.git.mchehab+huawei@kernel.org>
 <35dcbefd50875b92aaf5b7671d4c57c50b4274fe.1584450500.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35dcbefd50875b92aaf5b7671d4c57c50b4274fe.1584450500.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Akira Yokosawa <akiyks@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-unionfs@vger.kernel.org,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
 Harry Wei <harryxiyou@gmail.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 kvm-ppc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Doug Ledford <dledford@redhat.com>, Alan Stern <stern@rowland.harvard.edu>,
 linux-arm-kernel@lists.infradead.org, Federico Vaga <federico.vaga@vaga.pv.it>,
 Jade Alglave <j.alglave@ucl.ac.uk>, Daniel Lustig <dlustig@nvidia.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Mike Leach <mike.leach@linaro.org>, Andrea Parri <parri.andrea@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Luc Maranget <luc.maranget@inria.fr>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 David Howells <dhowells@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Morse <james.morse@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Marc Zyngier <maz@kernel.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 02:10:47PM +0100, Mauro Carvalho Chehab wrote:
> Several references got broken due to txt to ReST conversion.
> 
> Several of them can be automatically fixed with:
> 
> 	scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>  Documentation/admin-guide/kernel-parameters.txt      |  2 +-
>  Documentation/memory-barriers.txt                    |  2 +-
>  Documentation/process/submit-checklist.rst           |  2 +-
>  .../translations/it_IT/process/submit-checklist.rst  |  2 +-
>  Documentation/translations/ko_KR/memory-barriers.txt |  2 +-
>  .../translations/zh_CN/filesystems/sysfs.txt         |  2 +-
>  .../translations/zh_CN/process/submit-checklist.rst  |  2 +-
>  Documentation/virt/kvm/arm/pvtime.rst                |  2 +-
>  Documentation/virt/kvm/devices/vcpu.rst              |  2 +-
>  Documentation/virt/kvm/hypercalls.rst                |  4 ++--
>  arch/powerpc/include/uapi/asm/kvm_para.h             |  2 +-
>  drivers/gpu/drm/Kconfig                              |  2 +-
>  drivers/gpu/drm/drm_ioctl.c                          |  2 +-
>  drivers/hwtracing/coresight/Kconfig                  |  2 +-
>  fs/fat/Kconfig                                       |  8 ++++----
>  fs/fuse/Kconfig                                      |  2 +-
>  fs/fuse/dev.c                                        |  2 +-
>  fs/overlayfs/Kconfig                                 |  6 +++---
>  include/linux/mm.h                                   |  4 ++--
>  include/uapi/linux/ethtool_netlink.h                 |  2 +-
>  include/uapi/rdma/rdma_user_ioctl_cmds.h             |  2 +-

For the rdma files

Acked-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
