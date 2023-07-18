Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43E775841D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 20:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8DB10E3B2;
	Tue, 18 Jul 2023 18:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D881310E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 18:06:32 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b9e9765f2cso35777905ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1689703591; x=1692295591;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nXz9xDxwT7BaavIhnCmafXwp3/aDUnwPYqui5jTbzSQ=;
 b=groKThLKhcGdvS7VGO7C4SDS0MFs8h/VRyqV+OQecO/1MgBAs/ZfpPKMHdEDFc18U6
 lL6E01mKA8UE5kLtpd7OED7gt7ztbJ5zG6ZR10SH2TRXOQQY1VxzoLfjSQ8X+8hvr7zc
 87zzsMTMDmeVha3PmXm/KENBZCBJR0whtZvmDjcbID28N6ghyDcrk5tXGBvdZgk2kE89
 c/ehnZ5oymDKSDagYvboYUn0sxTqAeqXz24JaL1wf81rDQDv/hEv3XN80y+jSOV2M/0E
 6T7xuWgJpH1NmtIjdE8p3/Mzy7HrBdkuTncvzIqpvybXisn6eFXd5MAeGA3KsBbF/NVQ
 x6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689703591; x=1692295591;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXz9xDxwT7BaavIhnCmafXwp3/aDUnwPYqui5jTbzSQ=;
 b=ggfMJJTr3yV/2sNDyaJQNYb807Vjbdi73GzrgL+JfaC5nDrBal+87GDYoOOHwOxS+w
 z6mBjZZxOrj8JxfwGyEAReoCC7xqE2NpyAoxgqtyqMruRncJgfTG9/qZQzgCJEoQ1V8f
 kODfkygCj+74lZJBmAz8Mj9VBv05Rnc7pSGiHU6OTaRK+ILeYnTOFWaOc9A0EhaJ8Hr2
 x8MXTaz1+MpH1ENrR5WWCN24L2uwYVSXKZs+tslgmU5q96FIBgOvP2LYZnsBgQBtzqWV
 BfxgHTBVRNDynEcCrXwsM7aoawlW2D2EWr/TwGwQ76QFEyqyL9APzdUKjIkuOkLccdqy
 MrzQ==
X-Gm-Message-State: ABy/qLaPum1d4BOf1mA2w/ZZJcyNPHzo6XQnN9WvNVVt1+ZGODwMt4PS
 Z4Y/u6gAss5B8THJ/GmFqwhlNg==
X-Google-Smtp-Source: APBJJlF7FlQJHF3FMLrPPssG4qg4BrXeUhwWshlLKfnw7NuTDc181VYHZRzG6vsaH9PJ4JGKGoGO3g==
X-Received: by 2002:a17:902:c406:b0:1b9:e9b2:1288 with SMTP id
 k6-20020a170902c40600b001b9e9b21288mr530425plk.38.1689703591309; 
 Tue, 18 Jul 2023 11:06:31 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26]) by smtp.gmail.com with ESMTPSA id
 z10-20020a1709028f8a00b001b89c313185sm2171634plo.205.2023.07.18.11.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 11:06:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1qLp5h-002aj7-9n;
 Tue, 18 Jul 2023 15:06:29 -0300
Date: Tue, 18 Jul 2023 15:06:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH 00/10] Device Memory TCP
Message-ID: <ZLbUpdNYvyvkD27P@ziepe.ca>
References: <20230710223304.1174642-1-almasrymina@google.com>
 <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
 <CAHS8izNPTwtk+zN7XYt-+ycpT+47LMcRrYXYh=suTXCZQ6-rVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS8izNPTwtk+zN7XYt-+ycpT+47LMcRrYXYh=suTXCZQ6-rVQ@mail.gmail.com>
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
Cc: linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 linux-kselftest@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Eric Dumazet <edumazet@google.com>,
 Andy Lutomirski <luto@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 10:36:52AM -0700, Mina Almasry wrote:

> That is specific to this proposal, and will likely be very different
> in future ones. I thought the dma-buf pages approach was extensible
> and the uapi belonged somewhere in dma-buf. Clearly not. The next
> proposal, I think, will program the rxq via some net uapi and will
> take the dma-buf as input. Probably some netlink api (not sure if
> ethtool family or otherwise). I'm working out details of this
> non-paged networking first.

In practice you want the application to startup, get itself some 3/5
tuples and then request the kernel to setup the flow steering and
provision the NIC queues.

This is the right moment for the application to provide the backing
for the rx queue memory via a DMABUF handle.

Ideally this would all be accessible to non-priv applications as well,
so I think you'd want some kind of system call that sets all this up
and takes in a FD for the 3/5-tuple socket (to prove ownership over
the steering) and the DMABUF FD.

The queues and steering should exist only as long as the application
is still running (whatever that means). Otherwise you have a big mess
to clean up whenever anything crashes.

netlink feels like a weird API choice for that, in particular it would
be really wrong to somehow bind the lifecycle of a netlink object to a
process.

Further, if you are going to all the trouble of doing this, it seems
to me you should make it work with any kind of memory, including CPU
memory. Get a consistent approach to zero-copy TCP RX. So also allow a
memfd or similar to be passed in as the backing storage.

Jason
