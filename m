Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4EA91174
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA1E6EA35;
	Sat, 17 Aug 2019 15:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19846E98E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 13:04:16 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id w18so1024353qki.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 06:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+sQD+zsr7vGI2rnBo9g+oJW06UyfnJhHIGQAqNbFxW4=;
 b=BIDojJ4pT7QfU38831CUt41IjI4QDKtUsr6CShkecxuyeHDONECQpapoYRA1L7yEyJ
 JXTt7UU1DsIgDG0fUzzB+cFRxhSmwcb9cq5M2u9BGJMt0ysKVQbvMzw6AWWmxRzl7Rma
 6fM+L4zmjDST3q4ToceB7ZghVPOTO/YK0k0v6vSsoGW319bRMVyP2I/2SLNcJC5mE0ye
 fAMB6sAPGBAys2HpfnwBRvwnNHrw01gt4PP2KzY2RnB75SLMZp775rpNV1szA/+GT6x5
 2qe9EJ7eCbG5jT/Z9ocIWirGTXyTd0RogNSkIn5mcJW5uPq7nJknreK7qEGGIoIyVhQE
 g6Gw==
X-Gm-Message-State: APjAAAUTaj3fD6RRwX5mIVyPV4wh8sKzeo4qhb20gj2z+5TWuTg1HFSa
 fJrn0G95fDVdmer+oUU02YMPvw==
X-Google-Smtp-Source: APXvYqxbHXTewYAACJxzRXNX2TlZ2cOD0GDfUS0iL50gokJ8s5uWAlQ8FDekdfBBzYw8ePlgf2CSQA==
X-Received: by 2002:a05:620a:52e:: with SMTP id
 h14mr4017748qkh.358.1565874256038; 
 Thu, 15 Aug 2019 06:04:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id z7sm1468623qki.88.2019.08.15.06.04.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Aug 2019 06:04:15 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hyFQN-0004HN-58; Thu, 15 Aug 2019 10:04:15 -0300
Date: Thu, 15 Aug 2019 10:04:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190815130415.GD21596@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815084429.GE9477@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+sQD+zsr7vGI2rnBo9g+oJW06UyfnJhHIGQAqNbFxW4=;
 b=IuZwSs1/sg2gs7X8/HMGOKYXzgvI7hKzDGdggZttJSURMRYxJVZftP0NCXoTx9kR26
 O/sfZwzz3+w3TlMh5kO0BfG0INa47kk9US5Bl/a8MKcvzoVehrnJPWGzU7V9y+o2d5Nk
 Kju7MceUpwoVwA5wyNNFaVyXu7PG6ntN3MFy/C4bxnPqmzJLs9UnB1hl3gHgOa65jxUB
 Hvu5s57zRVawIe+YlelM+eNZ9DvN83kuurmv37XNGarrXfBulYC73YTxo9UVkxrcQTnK
 C9zb4BzCqLARK8nWnPlz/aG4w3K7tBt1aXiP8Ag8AjtMBvt7ltpyGMaiGvt2NqgiRt4O
 TqYQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6NDQ6MjlBTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgoKPiBBcyB0aGUgb29tIHJlYXBlciBpcyB0aGUgcHJpbWFyeSBndWFyYW50ZWUgb2YgdGhl
IG9vbSBoYW5kbGluZyBmb3J3YXJkCj4gcHJvZ3Jlc3MgaXQgY2Fubm90IGJlIGJsb2NrZWQgb24g
YW55dGhpbmcgdGhhdCBtaWdodCBkZXBlbmQgb24gYmxvY2thYmxlCj4gbWVtb3J5IGFsbG9jYXRp
b25zLiBUaGVzZSBhcmUgbm90IHJlYWxseSBlYXN5IHRvIHRyYWNrIGJlY2F1c2UgdGhleQo+IG1p
Z2h0IGJlIGluZGlyZWN0IC0gZS5nLiBub3RpZmllciBibG9ja3Mgb24gYSBsb2NrIHdoaWNoIG90
aGVyIGNvbnRleHQKPiBob2xkcyB3aGlsZSBhbGxvY2F0aW5nIG1lbW9yeSBvciB3YWl0aW5nIGZv
ciBhIGZsdXNoZXIgdGhhdCBuZWVkcyBtZW1vcnkKPiB0byBwZXJmb3JtIGl0cyB3b3JrLgoKQnV0
IGxvY2tkZXAgKmRvZXMqIHRyYWNrIGFsbCB0aGlzIGFuZCBmc19yZWNsYWltX2FjcXVpcmUoKSB3
YXMgY3JlYXRlZAp0byBzb2x2ZSBleGFjdGx5IHRoaXMgcHJvYmxlbS4KCmZzX3JlY2xhaW0gaXMg
YSBsb2NrIGFuZCBpdCBmbG93cyB0aHJvdWdoIGFsbCB0aGUgdXN1YWwgbG9ja2RlcApzY2hlbWVz
IGxpa2UgYW55IG90aGVyIGxvY2suIEFueSB0aW1lIHRoZSBwYWdlIGFsbG9jYXRvciB3YW50cyB0
byBkbwpzb21ldGhpbmcgdGhlIHdvdWxkIGRlYWRsb2NrIHdpdGggcmVjbGFpbSBpdCB0YWtlcyB0
aGUgbG9jay4KCkZhaWx1cmUgaXMgZXhwcmVzc2VkIGJ5IGEgZGVhZGxvY2sgY3ljbGUgaW4gdGhl
IGxvY2tkZXAgbWFwLCBhbmQKbG9ja2RlcCBjYW4gaGFuZGxlIGFyYml0YXJ5IGNvbXBsZXhpdHkg
dGhyb3VnaCBsYXllcnMgb2YgbG9ja3MsIHdvcmsKcXVldWVzLCB0aHJlYWRzLCBldGMuCgpXaGF0
IGlzIG1pc3Npbmc/CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
