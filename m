Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F9499F5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7E46E0DF;
	Tue, 18 Jun 2019 07:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.daemonic.se (mail.daemonic.se [IPv6:2607:f740:d:20::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E9C890B6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 09:20:46 +0000 (UTC)
Received: from cid.daemonic.se (localhost [IPv6:::1])
 by mail.daemonic.se (Postfix) with ESMTP id 45S5Km67m1z3kkc;
 Mon, 17 Jun 2019 09:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at daemonic.se
Received: from mail.daemonic.se ([IPv6:::1]) (using TLS with cipher
 ECDHE-RSA-AES128-GCM-SHA256)
 by cid.daemonic.se (mailscanner.daemonic.se [IPv6:::1]) (amavisd-new,
 port 10587)
 with ESMTPS id kL_ElVJ9-usL; Mon, 17 Jun 2019 09:20:43 +0000 (UTC)
Received: from garnet.daemonic.se (host-90-236-237-150.mobileonline.telia.com
 [90.236.237.150])
 by mail.daemonic.se (Postfix) with ESMTPSA id 45S5Kl2Jp2z3c7W;
 Mon, 17 Jun 2019 09:20:43 +0000 (UTC)
Subject: Re: [PATCH libdrm v2 4/4] meson.build: Fix meson script on FreeBSD
To: Eric Engestrom <eric.engestrom@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20190616132343.26370-1-emil.l.velikov@gmail.com>
 <20190616132343.26370-4-emil.l.velikov@gmail.com>
 <20190617091435.35ftj5twdxpspxnr@intel.com>
From: Niclas Zeising <zeising@daemonic.se>
Message-ID: <ca1171ab-ebbe-23f2-15c7-552bbf6aaf38@daemonic.se>
Date: Mon, 17 Jun 2019 11:20:43 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617091435.35ftj5twdxpspxnr@intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=daemonic.se; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received; s=20151023; t=1560763243; bh=MI+rbqmS0ph6IQJMNG1AUsGd
 HYlDFDutxQCHJ3eX0Uc=; b=DQ1xeVa0sXBAtFTOsjRVMpu1RKQDBH0eFNvFJ2wh
 Rt44/2cCb13NRxyCzeVq+KVwfpzG3yiXrMC5Wec78gOaReLcXqLvQAvBHK4nGoQS
 8XpSPcImov71ZeWIRxCpfxmkX2sY8fQQwNEAwhAiKTwlaeLgUjGzuCqIOZ90/Jwd
 YfU=
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0xNyAxMToxNCwgRXJpYyBFbmdlc3Ryb20gd3JvdGU6Cj4gT24gU3VuZGF5LCAy
MDE5LTA2LTE2IDE0OjIzOjQzICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4+IEZyb206IE5p
Y2xhcyBaZWlzaW5nIDx6ZWlzaW5nQGRhZW1vbmljLnNlPgo+Pgo+PiBGcmVlQlNEIHJlcXVpcmVz
IHN5cy90eXBlcy5oIGZvciBzeXMvc3lzY3RsLmgsIGFkZCBpdCBhcyBwYXJ0IG9mIHRoZQo+PiBp
bmNsdWRlcyB3aGVuIGNoZWNraW5nIGZvciBoZWFkZXJzLgo+PiBJbnN0ZWFkIG9mIHNwbGl0dGlu
ZyBvdXQgdGhlIGNoZWNrIGZvciBzeXMvc3lzY3RsLmggZnJvbSB0aGUgb3RoZXIKPj4gaGVhZGVy
IGNoZWNrcywganVzdCBhZGQgc3lzL3R5cGVzLmggdG8gYWxsIGhlYWRlciBjaGVja3MuCj4+Cj4+
IHYyIFtFbWlsXQo+PiAgIC0gYWRkIGlubGluZSBjb21tZW50Cj4+ICAgLSBkcm9wIGJhc2gvc2gg
aHVuawo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdt
YWlsLmNvbT4KPiAKPiBTZXJpZXMgaXM6Cj4gUmV2aWV3ZWQtYnk6IEVyaWMgRW5nZXN0cm9tIDxl
cmljLmVuZ2VzdHJvbUBpbnRlbC5jb20+Cj4gCj4gQnV0IEkgYWdyZWUgd2l0aCBFbWlsLCBpdCdz
IGEgRnJlZUJTRCBidWcgZm9yIGl0IHRvIG5vdCBpbmNsdWRlCj4gYSByZXF1aXJlZCBoZWFkZXIs
IHRoaXMgc2hvdWxkIGFsc28gYmUgZml4ZWQgdXBzdHJlYW0uCgpJJ20gbm90IHN1cmUgaWYgbXkg
ZS1tYWlscyBhcmUgZ2V0dGluZyB0byB0aGUgbWFpbGluZyBsaXN0LiAgVGhpcyBpcyB0aGUgCndh
eSBpdCdzIGRvY3VtZW50ZWQgaW4gRnJlZUJTRCwgYW5kIHRoZXJlIGlzIGEgbG90IG9mIGxlZ2Fj
eSByZWFzb25zIGl0IAppcyB0aGlzIHdheS4gIEkgZG91YnQgaXQgd2lsbCBjaGFuZ2UsIGFuZCBl
dmVuIGlmIGl0IGRvZXMsIHRoZXJlIHdpbGwgYmUgCmFib3V0IDUgeWVhcnMgb2YgdHJhbnNpdGlv
biBwZXJpb2QgYmVmb3JlIGFsbCBzdXBwb3J0ZWQgcmVsZWFzZXMgaGFzIHRoZSAKY2hhbmdlLCBt
b3N0IGxpa2VseS4KClRoaXMgaXMgdGhlIGZpcnN0IHRpbWUsIHRvIG15IGtub3dsZWRnZSwgdGhp
cyBpc3N1ZSBoYXMgY29tZSB1cC4KCihJJ20gbm90IHNheWluZyBJIGRpc2FncmVlIHdpdGggeW91
LCBqdXN0IHNheWluZyBpdCdzIHByb2JhYmx5IGVhc2llciB0byAKcGF0Y2ggaGVyZSByYXRoZXIg
dGhhbiB0cnkgdG8gY2hhbmdlIHVwc3RyZWFtLikKClJlZ2FyZHMKLS0gCk5pY2xhcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
