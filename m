Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B632C1C11
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 09:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4449389D44;
	Mon, 30 Sep 2019 07:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E9789C55;
 Mon, 30 Sep 2019 07:30:06 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEq7r-00013E-Gb; Mon, 30 Sep 2019 07:29:43 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E24CE301B59;
 Mon, 30 Sep 2019 09:28:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A0F3F2651BB8E; Mon, 30 Sep 2019 09:29:38 +0200 (CEST)
Date: Mon, 30 Sep 2019 09:29:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH -next] treewide: remove unused argument in lock_release()
Message-ID: <20190930072938.GK4553@hirez.programming.kicks-ass.net>
References: <1568909380-32199-1-git-send-email-cai@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568909380-32199-1-git-send-email-cai@lca.pw>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+RxVhfg/XqKkmLaVbtiYHGOh1FSjmgcY7SoSeeOxLws=; b=RIUESRFxLtDN6yOAeQnqRT2Tl
 imOaYQBEHlXioRQUhAXw+pEyGz4F5u2Xd9pigFxiSivWCGTMUCoGIYzxyVeMIWpaOQZVML65ZJb6C
 ZwefEhmPzjdTla9bwPzNMaDGwktKVErqLCxH1FeWc7vaqZ8Lq2LUsEl4RexprH62pddRzCo6Uv4Hu
 jelEw3faOMfP7i+paWjjWyDnS4IZbf9PHyDhKlqDWzt4zbyzUVAplr6d5tcGTWahipCOzg7QcxRBe
 c984nCz/UvNNxmzCNIkhw3HPOV+VVaGduUTWtfqTOkd+Lu2L75NBXHYFvOO4lOAfqyP5IGXyJuJdW
 jDMQWAJTg==;
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
Cc: juri.lelli@redhat.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 mhocko@kernel.org, alexander.levin@microsoft.com, joseph.qi@linux.alibaba.com,
 netdev@vger.kernel.org, st@kernel.org, will@kernel.org, duyuyang@gmail.com,
 vincent.guittot@linaro.org, daniel@iogearbox.net, mark@fasheh.com,
 mingo@redhat.com, vdavydov.dev@gmail.com, jslaby@suse.com,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org, jack@suse.com,
 mripard@kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk,
 rodrigo.vivi@intel.com, cgroups@vger.kernel.org, sean@poorly.run,
 bpf@vger.kernel.org, tytso@mit.edu, linux-mm@kvack.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, hannes@cmpxchg.org,
 jlbec@evilplan.or, gregkh@linuxfoundation.org, tj@kernel.org,
 akpm@linux-foundation.org, davem@davemloft.net, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMTI6MDk6NDBQTSAtMDQwMCwgUWlhbiBDYWkgd3JvdGU6
Cj4gU2luY2UgdGhlIGNvbW1pdCBiNGFkZmU4ZTA1ZjEgKCJsb2NraW5nL2xvY2tkZXA6IFJlbW92
ZSB1bnVzZWQgYXJndW1lbnQKPiBpbiBfX2xvY2tfcmVsZWFzZSIpLCBAbmVzdGVkIGlzIG5vIGxv
bmdlciB1c2VkIGluIGxvY2tfcmVsZWFzZSgpLCBzbwo+IHJlbW92ZSBpdCBmcm9tIGFsbCBsb2Nr
X3JlbGVhc2UoKSBjYWxscyBhbmQgZnJpZW5kcy4KClJpZ2h0OyBJIG5ldmVyIGRpZCB0aGlzIGNs
ZWFudXAgZm9yIG5vdCB3YW50aW5nIHRoZSBjaHVybiwgYnV0IGFzIGxvbmcKYXMgaXQgYXBwbGll
cyBJJ2xsIHRha2UgaXQuCgo+IFNpZ25lZC1vZmYtYnk6IFFpYW4gQ2FpIDxjYWlAbGNhLnB3Pgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgICAgICAgICAgICAgfCAg
MiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2hyaW5rZXIuYyAgfCAg
NiArKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX3BtLmMgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZXF1ZXN0LmMgICAgICAgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy90dHkvdHR5X2xkc2VtLmMgICAgICAgICAgICAgICAgICAgICAg
IHwgIDggKysrKy0tLS0KPiAgZnMvZGNhY2hlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KPiAgZnMvamJkMi90cmFuc2FjdGlvbi5jICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDQgKystLQo+ICBmcy9rZXJuZnMvZGlyLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNCArKy0tCj4gIGZzL29jZnMyL2RsbWdsdWUuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gIGluY2x1ZGUvbGludXgvamJkMi5oICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gIGluY2x1ZGUvbGludXgvbG9ja2RlcC5oICAgICAgICAgICAg
ICAgICAgICAgICB8IDIxICsrKysrKysrKystLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L3Bl
cmNwdS1yd3NlbS5oICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGluY2x1ZGUvbGludXgv
cmN1cGRhdGUuaCAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGluY2x1ZGUvbGludXgv
cndsb2NrX2FwaV9zbXAuaCAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0KPiAg
aW5jbHVkZS9saW51eC9zZXFsb2NrLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+
ICBpbmNsdWRlL2xpbnV4L3NwaW5sb2NrX2FwaV9zbXAuaCAgICAgICAgICAgICAgfCAgOCArKysr
LS0tLQo+ICBpbmNsdWRlL2xpbnV4L3d3X211dGV4LmggICAgICAgICAgICAgICAgICAgICAgfCAg
MiArLQo+ICBpbmNsdWRlL25ldC9zb2NrLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MiArLQo+ICBrZXJuZWwvYnBmL3N0YWNrbWFwLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MiArLQo+ICBrZXJuZWwvY3B1LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MiArLQo+ICBrZXJuZWwvbG9ja2luZy9sb2NrZGVwLmMgICAgICAgICAgICAgICAgICAgICAgfCAg
MyArLS0KPiAga2VybmVsL2xvY2tpbmcvbXV0ZXguYyAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDQgKystLQo+ICBrZXJuZWwvbG9ja2luZy9ydG11dGV4LmMgICAgICAgICAgICAgICAgICAgICAg
fCAgNiArKystLS0KPiAga2VybmVsL2xvY2tpbmcvcndzZW0uYyAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTAgKysrKystLS0tLQo+ICBrZXJuZWwvcHJpbnRrL3ByaW50ay5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCj4gIGtlcm5lbC9zY2hlZC9jb3JlLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGxpYi9sb2NraW5nLXNlbGZ0ZXN0LmMgICAg
ICAgICAgICAgICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICBtbS9t
ZW1jb250cm9sLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBuZXQv
Y29yZS9zb2NrLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICB0b29s
cy9saWIvbG9ja2RlcC9pbmNsdWRlL2xpYmxvY2tkZXAvY29tbW9uLmggfCAgMyArLS0KPiAgdG9v
bHMvbGliL2xvY2tkZXAvaW5jbHVkZS9saWJsb2NrZGVwL211dGV4LmggIHwgIDIgKy0KPiAgdG9v
bHMvbGliL2xvY2tkZXAvaW5jbHVkZS9saWJsb2NrZGVwL3J3bG9jay5oIHwgIDIgKy0KPiAgdG9v
bHMvbGliL2xvY2tkZXAvcHJlbG9hZC5jICAgICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKyst
LS0tLS0tLQo+ICAzMyBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCA5MyBkZWxldGlv
bnMoLSkKClRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
