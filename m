Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFDED014C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 21:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60966E16B;
	Tue,  8 Oct 2019 19:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1307 seconds by postgrey-1.36 at gabe;
 Tue, 08 Oct 2019 19:41:11 UTC
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421D66E16B;
 Tue,  8 Oct 2019 19:41:11 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHv0B-0005Vw-5M; Tue, 08 Oct 2019 19:18:31 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5DDCD305EE1;
 Tue,  8 Oct 2019 21:17:34 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 876CE202448A4; Tue,  8 Oct 2019 21:18:25 +0200 (CEST)
Date: Tue, 8 Oct 2019 21:18:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Qian Cai <cai@lca.pw>, akpm@linux-foundation.org, mingo@redhat.com,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 jslaby@suse.com, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org,
 tytso@mit.edu, jack@suse.com, linux-ext4@vger.kernel.org,
 tj@kernel.org, mark@fasheh.com, jlbec@evilplan.or,
 joseph.qi@linux.alibaba.com, ocfs2-devel@oss.oracle.com,
 davem@davemloft.net, st@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, bpf@vger.kernel.org, duyuyang@gmail.com,
 juri.lelli@redhat.com, vincent.guittot@linaro.org,
 hannes@cmpxchg.org, mhocko@kernel.org, vdavydov.dev@gmail.com,
 cgroups@vger.kernel.org, linux-mm@kvack.org, alexander.levin@microsoft.com
Subject: Re: [PATCH -next] treewide: remove unused argument in lock_release()
Message-ID: <20191008191825.GH2328@hirez.programming.kicks-ass.net>
References: <1568909380-32199-1-git-send-email-cai@lca.pw>
 <20191008163351.GR16989@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008163351.GR16989@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nx1tfnzncNr1/2YEe91mPr6s9qQb805exoxZT/kE+5Y=; b=j7TTiFOjt+1RkFZcxcir9K79v
 ZPi31CptFJa+ykSk5Z+i5oziljqs8kVg1nPlVm+qbBJFrD7o6IIEEsZQ846CG5HsDnSZmvG+89G2r
 oc2zghrxJEsFKl6qIc4A+oKr3OHRvirmk6PB6iWnregY3vI5UUiMcdToXZQN6biyWfRBsOvjdb3xE
 vfgA+nwWKe+50/+B34tlL7g3aXyfewvRAw9dI0yNHqRBGSbBXWaAgnpWqXiPpsCrdZhrLPzNDnmrW
 6hVi5ESd2k1ui1G1zQoJ7/kcjloHIWCL6wSZGKB/SK/i0nNVSchQ7K7fNquDuo+Dw7VIpR2sMG1rp
 VXOfdODOQ==;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDY6MzM6NTFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIFNlcCAxOSwgMjAxOSBhdCAxMjowOTo0MFBNIC0wNDAwLCBRaWFuIENh
aSB3cm90ZToKPiA+IFNpbmNlIHRoZSBjb21taXQgYjRhZGZlOGUwNWYxICgibG9ja2luZy9sb2Nr
ZGVwOiBSZW1vdmUgdW51c2VkIGFyZ3VtZW50Cj4gPiBpbiBfX2xvY2tfcmVsZWFzZSIpLCBAbmVz
dGVkIGlzIG5vIGxvbmdlciB1c2VkIGluIGxvY2tfcmVsZWFzZSgpLCBzbwo+ID4gcmVtb3ZlIGl0
IGZyb20gYWxsIGxvY2tfcmVsZWFzZSgpIGNhbGxzIGFuZCBmcmllbmRzLgo+ID4gCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4KPiAKPiBBY2sgb24gdGhlIGNvbmNlcHQg
YW5kIGZvciB0aGUgZHJtIHBhcnRzIChhbmQgZmVlbCBmcmVlIHRvIGtlZXAgdGhlIGFjayBpZgo+
IHlvdSBpbmV2aXRhYmx5IGhhdmUgdG8gcmVzcGluIHRoaXMgbGF0ZXIgb24pLiBNaWdodCByZXN1
bHQgaW4gc29tZQo+IGNvbmZsaWN0cywgYnV0IHdlbHAgd2UgbmVlZCB0byBrZWVwIExpbnVzIGJ1
c3kgOi0pCj4gCj4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+CgpUaGFua3MgRGFuaWVsIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
