Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F85AB8DE8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 11:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1292F6FC59;
	Fri, 20 Sep 2019 09:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526206FC59;
 Fri, 20 Sep 2019 09:38:16 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 921C92086A;
 Fri, 20 Sep 2019 09:38:09 +0000 (UTC)
Date: Fri, 20 Sep 2019 10:38:06 +0100
From: Will Deacon <will@kernel.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH -next] treewide: remove unused argument in lock_release()
Message-ID: <20190920093700.7nfaghxdrmubp2do@willie-the-truck>
References: <1568909380-32199-1-git-send-email-cai@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568909380-32199-1-git-send-email-cai@lca.pw>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568972296;
 bh=tGK4is/D5yjSmtKMNJsAOY7JysJV6v3B5d+jHSPQihw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pin0EAM6iDgkBVW67KjzDhHgn5lVksFzTRsfquXbR3bJHYdq/O5aV471P+JzSmcS6
 YHKtvlpkzAdl1VYGzcfByN4VuQ4TGD3IU+uGOYlo8hc9sDRuxSD05aPMHw1eu/wEnh
 h/JzstVetnB6YPglx4zQBqM6UU+z/+zyzbI85BIc=
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
Cc: juri.lelli@redhat.com, peterz@infradead.org,
 dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 alexander.levin@microsoft.com, joseph.qi@linux.alibaba.com,
 netdev@vger.kernel.org, duyuyang@gmail.com, vincent.guittot@linaro.org,
 daniel@iogearbox.net, mark@fasheh.com, airlied@linux.ie, mingo@redhat.com,
 vdavydov.dev@gmail.com, jslaby@suse.com, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, jack@suse.com, mripard@kernel.org,
 tj@kernel.org, viro@zeniv.linux.org.uk, rodrigo.vivi@intel.com,
 cgroups@vger.kernel.org, sean@poorly.run, bpf@vger.kernel.org, tytso@mit.edu,
 linux-mm@kvack.org, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 hannes@cmpxchg.org, jlbec@evilplan.or, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, davem@davemloft.net,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMTI6MDk6NDBQTSAtMDQwMCwgUWlhbiBDYWkgd3JvdGU6
Cj4gU2luY2UgdGhlIGNvbW1pdCBiNGFkZmU4ZTA1ZjEgKCJsb2NraW5nL2xvY2tkZXA6IFJlbW92
ZSB1bnVzZWQgYXJndW1lbnQKPiBpbiBfX2xvY2tfcmVsZWFzZSIpLCBAbmVzdGVkIGlzIG5vIGxv
bmdlciB1c2VkIGluIGxvY2tfcmVsZWFzZSgpLCBzbwo+IHJlbW92ZSBpdCBmcm9tIGFsbCBsb2Nr
X3JlbGVhc2UoKSBjYWxscyBhbmQgZnJpZW5kcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBRaWFuIENh
aSA8Y2FpQGxjYS5wdz4KPiAtLS0KCkFsdGhvdWdoIHRoaXMgbG9va3MgZmluZSB0byBtZSBhdCBh
IGZpcnN0IGdsYW5jZSwgaXQgbWlnaHQgYmUgc2xpZ2h0bHkKZWFzaWVyIHRvIG1hbmFnZSBpZiB5
b3UgaGl0IHtzcGluLHJ3bG9jayxzZXFjb3VudCxtdXRleCxyd3NlbX1fcmVsZWFzZSgpCmZpcnN0
IHdpdGggY29jY2luZWxsZSBzY3JpcHRzLCBhbmQgdGhlbiBoYWNrIGxvY2tfcmVsZWFzZSgpIGFz
IGEgZmluYWwKcGF0Y2guIFRoYXQgd2F5IGl0J3MgZWFzeSB0byByZWdlbmVyYXRlIHRoaW5ncyBp
ZiBuZWVkZWQuCgpDaGVlcnMsCgpXaWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
