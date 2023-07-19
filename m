Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED275A2CA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 01:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FE910E52A;
	Wed, 19 Jul 2023 23:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9FD10E52A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 23:24:54 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6687446eaccso125900b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 16:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1689809094; x=1690413894;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QMBXWfDTfMeBEXpKpdrCux7UOxDUWWDJl0r9KLthi7I=;
 b=RitoPG5vg2KH92ckG+V7d8L8L9W7M1MBD8JemTd7YYR3fTJrTOVFYtqqXzUnBKMuir
 5mWALTL5KmWaQJU0sCdTf1pDvm6hLmYvUeYrkwPsO1SZCFet8sGivcjzWo2/jJSQ+69r
 tWFF5/07XRl/q/8uN+rCYjwQhkZBkDDkJmR7gbwa/MDL9f0w0sZGSvooJmm5Ax+0ioy1
 H/sOq8DkuI4B9Gm5OL3DqroseeCwVW7yCWj9quaQcgXz/+7NKt05sQF+GJ9/12jWPXZ6
 8j+EKQKrYcWo0PuWQibJD8tsH5yifa7BtFwNC8Ufe7awQAN0xt48aMlwNrlWN/lcUSoO
 93QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689809094; x=1690413894;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMBXWfDTfMeBEXpKpdrCux7UOxDUWWDJl0r9KLthi7I=;
 b=DF/l7orc490/fhrKs3jJIgwCgccIYCj4nCT8Vqbk6p1mzfewdQ9Db9SOypYWtzD0+S
 2aTfWKYjiSlrXafNVqZj3AwtzAYEzW5+bTlq8Af3zIkNkBULWL6N6XM17/wUF4NkGdKw
 PBS4FFOeEnKCV3oK/Eglfmhn8jyoZ0o0bh/srS6RqDXwdZBb9AYHU3ydYE3M3tFiaAFH
 nAC+OGxuC0P30ZyKgxoPvZcmBFy+Hfn6RxnRTDyaoWe0vP6qg7XyPwx4hJr5hAjLEvCL
 0lOcG/ZyxQdqJB40jJ9GTzrumGcviTpsyU9m6kOk4va5lAqvLURjxGjRIJ6t/esG21YZ
 8xWw==
X-Gm-Message-State: ABy/qLZ0drI6kwV5UkkUZlXKEaqGU0D5asWJWcF8H60eHYQbPoJ4DaMP
 p+U3yuws0kU4s6BgYz7yGCJHcA==
X-Google-Smtp-Source: APBJJlF1RVY7gVrV+x6J0pGqg/vEpRGAJ3WpkIaplw7rwOALVicAHlHdlSUsDv1w5+4aog7vtr7zhQ==
X-Received: by 2002:a05:6a20:840b:b0:126:a80d:4960 with SMTP id
 c11-20020a056a20840b00b00126a80d4960mr28216893pzd.30.1689809094040; 
 Wed, 19 Jul 2023 16:24:54 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26]) by smtp.gmail.com with ESMTPSA id
 g23-20020aa78757000000b0067a1f4f4f7dsm3780558pfo.169.2023.07.19.16.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 16:24:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1qMGXL-002tBd-Tt;
 Wed, 19 Jul 2023 20:24:51 -0300
Date: Wed, 19 Jul 2023 20:24:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [RFC PATCH 00/10] Device Memory TCP
Message-ID: <ZLhww+P+7zhTTUk7@ziepe.ca>
References: <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
 <CAHS8izNPTwtk+zN7XYt-+ycpT+47LMcRrYXYh=suTXCZQ6-rVQ@mail.gmail.com>
 <ZLbUpdNYvyvkD27P@ziepe.ca> <20230718111508.6f0b9a83@kernel.org>
 <35f3ec37-11fe-19c8-9d6f-ae5a789843cb@kernel.org>
 <20230718112940.2c126677@kernel.org>
 <eb34f812-a866-a1a3-9f9b-7d5054d17609@kernel.org>
 <20230718154503.0421b4cd@kernel.org>
 <CAHS8izPORN=r2-hzYSgN4s_Aoo2dnwoJXrU5Hu=43sb8zsWyhQ@mail.gmail.com>
 <20230719105711.448f8cad@hermes.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719105711.448f8cad@hermes.local>
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
Cc: Mina Almasry <almasrymina@google.com>, linux-arch@vger.kernel.org,
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

On Wed, Jul 19, 2023 at 10:57:11AM -0700, Stephen Hemminger wrote:

> Naive idea.
> Would it be possible for process to use mmap() on the GPU memory and then
> do zero copy TCP receive some how? Or is this what is being proposed.

It could be possible, but currently there is no API to recover the
underlying dmabuf from the VMA backing the mmap.

Also you can't just take arbitary struct pages from any old VMA and
make them "netmem"

Jason
