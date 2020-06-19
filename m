Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C9620301E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECB56E1BC;
	Mon, 22 Jun 2020 07:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4146E3DB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 17:23:10 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id e11so397129qkm.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rta7XgSy0ckbOhf+G5R08zHN2raoo0kZf2xw2Sh0l/k=;
 b=jQ8P3pnIGa3vZkblMbXH41QZ61fe/Sb9vA5uPOR3SMNdZKsu0blkPtrxpS3aWVoNKr
 DxLMI5S5juOldxRe7+RlT3GajySSEpNFCHak6ENUR11aQ3nJENjJ+AjGwVIg3GcU1gtL
 AFg4tJnhN/LzdKUCOPE+zScs2pSCySWCm6gLf1r8dvVDgTF8uLAu4b0cSB8SVQcBr9IO
 hvo365OipT4dztwxdexoBi2dZXF91j/xcy5DKKz/ErbusQM/iZVWPTDKzHQRUnZ5G+PQ
 1Vw552gg3QCopo/fc6PBC9ArUokmC/IBfhMuddzwZFS3/FrWylp92kucX6mn/XCcEkQF
 2/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rta7XgSy0ckbOhf+G5R08zHN2raoo0kZf2xw2Sh0l/k=;
 b=f0AsDmVc8LVTlGZtkY9I3jcTQ1M5IZobMm+iHBBB8nq1dUkY4ZOHUGarUAxszVt0Lh
 TAHMA66y4hBySBAMAqnX1dfDkv6Y0nT7C9zfE2ceIpTmTm4Xv50I9+Tbo0htMXhyiFdI
 4djvc6CcOMp1zQtj3pf1+qNMV/HN2VImI6jtCH0Cn2npZ/87gCVDyyr1x8Limw8Xx3u5
 XhI1np3zkIjfmTaE35aIxRPbfjryZykjjPsDz9kWR73U4YhiQ4TApDtGDm3Bu4lveSvN
 dF7HwQw+PsC73yPEetffQlndZR+IAYFJuexdmdiqIUKNT8dePfn6NDYmSIt4QUPrb3zu
 6/yA==
X-Gm-Message-State: AOAM531w/86vBoRZ2GuUhfMsQywt91eFjZEpowoRNJVHEZXPmqrSouX7
 M/mY3kxtfG4Pa9x4GrDrTJKaIw==
X-Google-Smtp-Source: ABdhPJzDMW9WT5FfWlenUCjhHpgpjiA2TJ2PiIGS5w9RkI8RANL7HnmArRn+HLKwhDBh+PaKr6DrLw==
X-Received: by 2002:ae9:ed0d:: with SMTP id c13mr4076677qkg.181.1592587389664; 
 Fri, 19 Jun 2020 10:23:09 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id z77sm7263705qka.59.2020.06.19.10.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 10:23:08 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jmKjM-00ArZ4-2Z; Fri, 19 Jun 2020 14:23:08 -0300
Date: Fri, 19 Jun 2020 14:23:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200619172308.GQ6578@ziepe.ca>
References: <20200616120719.GL20149@phenom.ffwll.local>
 <CAKMK7uE7DKUo9Z+yCpY+mW5gmKet8ugbF3yZNyHGqsJ=e-g_hA@mail.gmail.com>
 <20200617152835.GF6578@ziepe.ca>
 <20200618150051.GS20149@phenom.ffwll.local>
 <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 19, 2020 at 06:19:41PM +0200, Daniel Vetter wrote:

> The madness is only that device B's mmu notifier might need to wait
> for fence_B so that the dma operation finishes. Which in turn has to
> wait for device A to finish first.

So, it sound, fundamentally you've got this graph of operations across
an unknown set of drivers and the kernel cannot insert itself in
dma_fence hand offs to re-validate any of the buffers involved?
Buffers which by definition cannot be touched by the hardware yet.

That really is a pretty horrible place to end up..

Pinning really is right answer for this kind of work flow. I think
converting pinning to notifers should not be done unless notifier
invalidation is relatively bounded. 

I know people like notifiers because they give a bit nicer performance
in some happy cases, but this cripples all the bad cases..

If pinning doesn't work for some reason maybe we should address that?

> Full disclosure: We are aware that we've designed ourselves into an
> impressive corner here, and there's lots of talks going on about
> untangling the dma synchronization from the memory management
> completely. But

I think the documenting is really important: only GPU should be using
this stuff and driving notifiers this way. Complete NO for any
totally-not-a-GPU things in drivers/accel for sure.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
