Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319F2D080D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD6E6E90E;
	Wed,  9 Oct 2019 07:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3986E060
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 07:32:26 +0000 (UTC)
Received: from [IPv6:2001:983:e9a7:1:a406:d42:889e:ff00]
 ([IPv6:2001:983:e9a7:1:a406:d42:889e:ff00])
 by smtp-cloud8.xs4all.net with ESMTPA
 id HjymiUHClop0AHjyniKb0m; Tue, 08 Oct 2019 09:32:25 +0200
Subject: Re: [PATCH v1 1/2] drm_dp_cec: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20191007171224.1581-1-sam@ravnborg.org>
 <20191007171224.1581-2-sam@ravnborg.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d3f17a40-9477-320b-ebe3-a841feb72627@xs4all.nl>
Date: Tue, 8 Oct 2019 09:32:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191007171224.1581-2-sam@ravnborg.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfKiuYwSKH9gtBc6Oaut9xfLxHVo5rTWnjVhCeXST9Zj9D+HeP3F5HfhEFetRUeYMtosRvZjZEmbwOhP3kJIE5L2wM3+zo62u9qXbPFPXcexbW8hqJQU6
 W2WZ7/Hvmp+3ooH9L2AXYejHmXO7Jaj8Lr5JsCo2OMfMcT2LcRsUtw+l27gBI9tPXKVhyaMXA5lmD+Oj+H47ZcRGZDUn8DBjW70/NSw2tFzonKLhFq1HKgH+
 MEFOqLoDC39NGN+i/Z9a0CxH01BN5lero4uKgtHFkyB6+y7zhLJhByxn+ehJHk6a4Ajxxl5XjKEiMRnkxJ9jykGRZvtzwALSn1+yCoWwms0JQ8bg1eJwEG9n
 ZBd+GhYBRy6MJDdaoQSAWId/jS3NO0Ay9ARwNS6IVAlMutRjnb7tFGf0oFpZWtG4sPSS1Q38IqLaV+RhfY+ih6PoTlGx7yD1h7J1V89g7N1Ep05K+QOga0j6
 lKZl7nmbkPHKl7YFj2rlr9RoaSNZV9AKCh9rMRKCPr4PgdWUykdajUIUihGdF9VAyNQhre9fayX3jNCd
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dariusz Marcinkiewicz <darekm@google.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNy8xOSA3OjEyIFBNLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gZHJtUC5oIGlzIGRlcHJl
Y2F0ZWQgYW5kIHdpbGwgYmUgZGVsZXRlZC4KPiBSZXBsYWNlIHVzZSB3aXRoIHByb3BlciBoZWFk
ZXIuCj4gCj4gRGl2aWRlIGhlYWRlciBpbmNsdWRlcyBpbiBibG9ja3Mgd2hpbGUgdG91Y2hpbmcg
dGhlc2UuCj4gCj4gQnVpbGQgdGVzdGVkIHdpdGggdmFyaW91cyBhcmNodGVjdHVyZXMgYW5kIGNv
bmZpZ3MuCgpBY2tlZC1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+
CgpSZWdhcmRzLAoKCUhhbnMKCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgo+IEZpeGVzOiBhZTg1YjBkZjEyNGY2OTI4ICgiZHJtX2RwX2NlYzogYWRk
IGNvbm5lY3RvciBpbmZvIHN1cHBvcnQuIikKPiBDYzogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxk
YXJla21AZ29vZ2xlLmNvbT4KPiBDYzogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRh
bGwubmw+Cj4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gQ2M6IEJlbiBTa2Vn
Z3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9j
ZWMuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfY2VjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2NlYy5jCj4gaW5kZXggYjQ1N2MxNmMzYThiLi4zYWIy
NjA5ZjllYzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9jZWMuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfY2VjLmMKPiBAQCAtOCwxMCArOCwxMiBAQAo+ICAj
aW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiArCj4gKyNpbmNsdWRlIDxtZWRpYS9jZWMuaD4KPiAr
Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2Nvbm5lY3Rvci5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9k
ZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fZHBfaGVscGVyLmg+Cj4gLSNpbmNsdWRlIDxk
cm0vZHJtUC5oPgo+IC0jaW5jbHVkZSA8bWVkaWEvY2VjLmg+Cj4gIAo+ICAvKgo+ICAgKiBVbmZv
cnR1bmF0ZWx5IGl0IHR1cm5zIG91dCB0aGF0IHdlIGhhdmUgYSBjaGlja2VuLWFuZC1lZ2cgc2l0
dWF0aW9uCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
