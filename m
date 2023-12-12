Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2680F652
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 20:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCD810E20E;
	Tue, 12 Dec 2023 19:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5D410E20E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 19:14:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9975261005;
 Tue, 12 Dec 2023 19:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B19FC433C7;
 Tue, 12 Dec 2023 19:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702408452;
 bh=jfJ0OG1jhC1TwOyrhyKpWYMGrNHXhy6qAspQp8BrzWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u9gl44nTCJgaqnzRkDIohjT3NlWPJJa/xDes26AfFQfmtNc2cfCuCd70WURIpsEls
 vTZdu0MOZxt7XB2RoDt3NiKq0uZ0e5XZ9uNAJvt20SeYNL3Xnev1VOWhSDgT1cLHKO
 UzAbw2cpbggtF8AKB+xIzHnQW+N3E8y0VN03Sx8xuf6xSXbWBlqTx0DkvlJGiyTCHv
 Pn9XBi+4REFO/1aggIX1ADNZxAcOPZjzUtdYPvmGKd9kwXCW92/oirZULVxo77Eat3
 6uRKCSS5S1kMdmbIvOp4MFWEThbL6iJKtUsHbQc5uHQLX7S+inbhcpAYL5tX1R7y0R
 68pLVmdZZ2tDg==
Date: Tue, 12 Dec 2023 19:14:04 +0000
From: Simon Horman <horms@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [net-next v1 15/16] net: add devmem TCP documentation
Message-ID: <20231212191404.GC5817@kernel.org>
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-16-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208005250.2910004-16-almasrymina@google.com>
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 04:52:46PM -0800, Mina Almasry wrote:
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  Documentation/networking/devmem.rst | 270 ++++++++++++++++++++++++++++
>  1 file changed, 270 insertions(+)
>  create mode 100644 Documentation/networking/devmem.rst
> 
> diff --git a/Documentation/networking/devmem.rst b/Documentation/networking/devmem.rst
> new file mode 100644
> index 000000000000..ed0d9c88b708
> --- /dev/null
> +++ b/Documentation/networking/devmem.rst
> @@ -0,0 +1,270 @@

Hi Mina,

Please consider adding an SPDX header here.

And please consider adding devmem to index.rxt,
as make htmldocs currently warns:

  .../devmem.rst: WARNING: document isn't included in any toctree

....
