Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC3777D7E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100DC10E58A;
	Thu, 10 Aug 2023 16:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BDC10E5B6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 16:06:59 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bc6535027aso9490355ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1691683619; x=1692288419;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bkl7A8nIZ4dLxOcY6GpHpFtX+viPmkaZX3wq6XxPfxg=;
 b=JL9PB5YetmewwFt4dDybaPdzwmRNljhoEiaIvSyobmvxBnbUSrib0/OLZrInyO+/1c
 WxEb27kvGab0U19ny3qjovhvp4KPMhmrM2Jqtl/Sybe5g/zIKFpOOF62rMgIkHHf4UbB
 VKhhEHQLs4ges87nYRT9ch0zp7xExv1gT874o21HXlD6fq1w4HfWb5w6aIB4k6n17BS6
 sHwCkyxjqIF/8NI5kQBcfC3SRO7xYSESm9CyKct1e2y0kTPD1OEFcZVOieF6bi0mgKVN
 nkDDYLgPl8A0tzyRQn+5DPmETmTTMEvWVvuuyb3zFt2rluHyUxJ0uPc6WGGARgxW4JyZ
 JPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691683619; x=1692288419;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bkl7A8nIZ4dLxOcY6GpHpFtX+viPmkaZX3wq6XxPfxg=;
 b=ZfOOQOtH2LJ+UXXkyPsHvl3LzQ2wk3XgtqRhp9DD5frWv0QTZjZrvkshLPJGeIwGk7
 YflqmXCC7SKA05ubt5T72tFGPxMoHMB/8JQr6pOa3Ce2eYFHBk2yeVyQw1drBinGT+bx
 0v8pJ7JNXngCm90OAWE9oHEyn/1aZVTzjb1AIiD/anbIzNJOcNtfiScfUApEPL/5YtPY
 76UU6E8KylUAcUnyfjNBs/cDg0GXE9Z9Q43sjzU4q2fn1adXyHkDHs23deCWC8+L/hEM
 Hf0bNhI7uzHVqVHl4ruD4srOpWRpevS2wK7XTA8S9VRrMekDGlG+Ay5KLBaKX45/vz8r
 p9CA==
X-Gm-Message-State: AOJu0YzKGmWDn5f/6vF3VH1SRIdIkqEtPr5X0zbXCvMEQ3vi0zchNS1P
 RZzGVYaELwXYKBg0VaRfrwYRgQ==
X-Google-Smtp-Source: AGHT+IF4hyqWBe3EdaSGly2P8UCzQ7nDhJe1xj0NdzWbJpW3WsvHw4tGYB8oXfKwdLOgDTGQE6RMzw==
X-Received: by 2002:a17:903:182:b0:1bb:ed65:5e0d with SMTP id
 z2-20020a170903018200b001bbed655e0dmr3656999plg.56.1691683619216; 
 Thu, 10 Aug 2023 09:06:59 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26]) by smtp.gmail.com with ESMTPSA id
 j16-20020a170902da9000b001b8a1a25e6asm1955107plx.128.2023.08.10.09.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 09:06:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1qU8Bc-005Glp-95;
 Thu, 10 Aug 2023 13:06:56 -0300
Date: Thu, 10 Aug 2023 13:06:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
Message-ID: <ZNULIDzuVVyfyMq2@ziepe.ca>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com>
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
Cc: Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 12:29:08PM +0200, Christian König wrote:
> Am 10.08.23 um 03:57 schrieb Mina Almasry:
> > Changes in RFC v2:
> > ------------------
> > 
> > The sticking point in RFC v1[1] was the dma-buf pages approach we used to
> > deliver the device memory to the TCP stack. RFC v2 is a proof-of-concept
> > that attempts to resolve this by implementing scatterlist support in the
> > networking stack, such that we can import the dma-buf scatterlist
> > directly.
> 
> Impressive work, I didn't thought that this would be possible that "easily".
> 
> Please note that we have considered replacing scatterlists with simple
> arrays of DMA-addresses in the DMA-buf framework to avoid people trying to
> access the struct page inside the scatterlist.
> 
> It might be a good idea to push for that first before this here is finally
> implemented.
> 
> GPU drivers already convert the scatterlist used to arrays of DMA-addresses
> as soon as they get them. This leaves RDMA and V4L as the other two main
> users which would need to be converted.

Oh that would be a nightmare for RDMA.

We need a standard based way to have scalable lists of DMA addresses :(

> > 2. Netlink API (Patch 1 & 2).
> 
> How does netlink manage the lifetime of objects?

And access control..

Jason
