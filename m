Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E554A1325
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EEB89467;
	Thu, 29 Aug 2019 08:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8425E899D4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 10:06:42 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 2uqYiSkmaThuu2uqbiH4Yp; Wed, 28 Aug 2019 12:06:40 +0200
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
 <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl> <20190828093820.GE2917@ulmo>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2eed5ed3-85f3-4c19-4dd2-3d8432829c2a@xs4all.nl>
Date: Wed, 28 Aug 2019 12:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190828093820.GE2917@ulmo>
Content-Language: en-US
X-CMAE-Envelope: MS4wfICnyPpyLoiNxB54ZtdajPaDnNAEM4lSIUM5Hbc4HsKu9WwOmwAH4uFMtz+T42F+a3RkVKtD7nAB8Oz3F3Vi7VBAl/A/qWfK5gnkOo7Yz8WWbQnkeKxJ
 FzXaVij84az22p+H+eK9AlJPPsz0oM6s5kuDVuB01dl4zEBKldZbH9HRrX/GFzqNbhQPCckgngmkkd6TKovPAIBLQPP8QFgaINGIbUmxtTclWciPLG2+iQtf
 9BIjuNtk4cnhG3HilEQ8bQiRcZQu4vMpHddMR58OkNLhkl99tPTRm0beMKTA/JHD2dtecBGtn2xxCsDnfQFIL6KWCpSfLPCNuaEmk6JeIQ6Z1FLu9EvBLOzP
 aWY8V7+z0BeiWn3Im+f9xrE+kfjt1iyoeoaKQjMOpRuN6XRXsGY9bwGsr3A9uMwV7B1/QBkfWV1aV4UdjRd8G+C4m0eFwQ+o1DKNtWe6XL2k37bHouk=
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:01:00 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Dariusz Marcinkiewicz <darekm@google.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yOC8xOSAxMTozOCBBTSwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gT24gV2VkLCBBdWcg
MjgsIDIwMTkgYXQgMTA6MDk6MzBBTSArMDIwMCwgSGFucyBWZXJrdWlsIHdyb3RlOgo+PiBUaGll
cnJ5LAo+Pgo+PiBDYW4geW91IHJldmlldyB0aGlzIHBhdGNoPwo+Pgo+PiBUaGFua3MhCj4+Cj4+
IAlIYW5zCj4gCj4gRGlkIHlvdSB3YW50IG1lIHRvIHBpY2sgdGhpcyB1cCBpbnRvIHRoZSBkcm0v
dGVncmEgdHJlZT8gT3IgZG8geW91IHdhbnQKPiB0byBwaWNrIGl0IHVwIGludG8geW91ciB0cmVl
PwoKQ2FuIHlvdSBwaWNrIGl0IHVwIGZvciB0aGUgbmV4dCBjeWNsZT8gQXMgeW91IG1lbnRpb25l
ZCwgd2UgbWlzc2VkIHRoZQpkZWFkbGluZSBmb3IgNS40LCBzbyB0aGlzIGZlYXR1cmUgd29uJ3Qg
YmUgZW5hYmxlZCBpbiB0aGUgcHVibGljIENFQyBBUEkKdW50aWwgNS41LgoKVGhhbmtzIQoKCUhh
bnMKCj4gCj4gV2UncmUganVzdCBwYXN0IHRoZSBEUk0gc3Vic3lzdGVtIGRlYWRsaW5lLCBzbyBp
dCdsbCBoYXZlIHRvIHdhaXQgdW50aWwKPiB0aGUgbmV4dCBjeWNsZSBpZiB3ZSBnbyB0aGF0IHdh
eS4gSWYgeW91J3JlIGluIGEgaHVycnkgeW91IG1heSB3YW50IHRvCj4gcGljayBpdCB1cCB5b3Vy
c2VsZiwgaW4gd2hpY2ggY2FzZToKPiAKPiBBY2tlZC1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRp
bmdAbnZpZGlhLmNvbT4KPiAKPj4gT24gOC8xNC8xOSAxMjo0NSBQTSwgRGFyaXVzeiBNYXJjaW5r
aWV3aWN6IHdyb3RlOgo+Pj4gVXNlIHRoZSBuZXcgY2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lz
dGVyKCkgZnVuY3Rpb25zIHRvCj4+PiAodW4pcmVnaXN0ZXIgdGhlIG5vdGlmaWVyIGZvciB0aGUg
SERNSSBjb25uZWN0b3IsIGFuZCBmaWxsIGluCj4+PiB0aGUgY2VjX2Nvbm5lY3Rvcl9pbmZvLgo+
Pj4KPj4+IENoYW5nZXMgc2luY2UgdjQ6Cj4+PiAJLSBvbmx5IGNyZWF0ZSBhIENFQyBub3RpZmll
ciBmb3IgSERNSSBjb25uZWN0b3JzCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFyaXVzeiBNYXJj
aW5raWV3aWN6IDxkYXJla21AZ29vZ2xlLmNvbT4KPj4+IFRlc3RlZC1ieTogSGFucyBWZXJrdWls
IDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvb3V0cHV0LmMgfCAyOCArKysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4+PiAgMSBm
aWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9vdXRwdXQuYwo+Pj4gaW5kZXggYmRjYWE0YzcxNjhjZi4uMzQzNzM3MzRmZjY4OSAx
MDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYwo+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jCj4+PiBAQCAtNzAsNiArNzAsMTEgQEAgdGVn
cmFfb3V0cHV0X2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciwgYm9vbCBmb3JjZSkKPj4+ICAKPj4+ICB2b2lkIHRlZ3JhX291dHB1dF9jb25uZWN0b3JfZGVz
dHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+Pj4gIHsKPj4+ICsJc3RydWN0
IHRlZ3JhX291dHB1dCAqb3V0cHV0ID0gY29ubmVjdG9yX3RvX291dHB1dChjb25uZWN0b3IpOwo+
Pj4gKwo+Pj4gKwlpZiAob3V0cHV0LT5jZWMpCj4+PiArCQljZWNfbm90aWZpZXJfY29ubl91bnJl
Z2lzdGVyKG91dHB1dC0+Y2VjKTsKPj4+ICsKPj4+ICAJZHJtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVy
KGNvbm5lY3Rvcik7Cj4+PiAgCWRybV9jb25uZWN0b3JfY2xlYW51cChjb25uZWN0b3IpOwo+Pj4g
IH0KPj4+IEBAIC0xNjMsMTggKzE2OCwxMSBAQCBpbnQgdGVncmFfb3V0cHV0X3Byb2JlKHN0cnVj
dCB0ZWdyYV9vdXRwdXQgKm91dHB1dCkKPj4+ICAJCWRpc2FibGVfaXJxKG91dHB1dC0+aHBkX2ly
cSk7Cj4+PiAgCX0KPj4+ICAKPj4+IC0Jb3V0cHV0LT5jZWMgPSBjZWNfbm90aWZpZXJfZ2V0KG91
dHB1dC0+ZGV2KTsKPj4+IC0JaWYgKCFvdXRwdXQtPmNlYykKPj4+IC0JCXJldHVybiAtRU5PTUVN
Owo+Pj4gLQo+Pj4gIAlyZXR1cm4gMDsKPj4+ICB9Cj4+PiAgCj4+PiAgdm9pZCB0ZWdyYV9vdXRw
dXRfcmVtb3ZlKHN0cnVjdCB0ZWdyYV9vdXRwdXQgKm91dHB1dCkKPj4+ICB7Cj4+PiAtCWlmIChv
dXRwdXQtPmNlYykKPj4+IC0JCWNlY19ub3RpZmllcl9wdXQob3V0cHV0LT5jZWMpOwo+Pj4gLQo+
Pj4gIAlpZiAob3V0cHV0LT5ocGRfZ3BpbykKPj4+ICAJCWZyZWVfaXJxKG91dHB1dC0+aHBkX2ly
cSwgb3V0cHV0KTsKPj4+ICAKPj4+IEBAIC0xODQsNiArMTgyLDcgQEAgdm9pZCB0ZWdyYV9vdXRw
dXRfcmVtb3ZlKHN0cnVjdCB0ZWdyYV9vdXRwdXQgKm91dHB1dCkKPj4+ICAKPj4+ICBpbnQgdGVn
cmFfb3V0cHV0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IHRlZ3JhX291dHB1
dCAqb3V0cHV0KQo+Pj4gIHsKPj4+ICsJaW50IGNvbm5lY3Rvcl90eXBlOwo+Pj4gIAlpbnQgZXJy
Owo+Pj4gIAo+Pj4gIAlpZiAob3V0cHV0LT5wYW5lbCkgewo+Pj4gQEAgLTE5OSw2ICsxOTgsMjEg
QEAgaW50IHRlZ3JhX291dHB1dF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCB0
ZWdyYV9vdXRwdXQgKm91dHB1dCkKPj4+ICAJaWYgKG91dHB1dC0+aHBkX2dwaW8pCj4+PiAgCQll
bmFibGVfaXJxKG91dHB1dC0+aHBkX2lycSk7Cj4+PiAgCj4+PiArCWNvbm5lY3Rvcl90eXBlID0g
b3V0cHV0LT5jb25uZWN0b3IuY29ubmVjdG9yX3R5cGU7Cj4+PiArCS8qCj4+PiArCSAqIENyZWF0
ZSBhIENFQyBub3RpZmllciBmb3IgSERNSSBjb25uZWN0b3IuCj4+PiArCSAqLwo+Pj4gKwlpZiAo
Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlBIHx8Cj4+PiArCSAgICBj
b25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUIpIHsKPj4+ICsJCXN0cnVj
dCBjZWNfY29ubmVjdG9yX2luZm8gY29ubl9pbmZvOwo+Pj4gKwo+Pj4gKwkJY2VjX2ZpbGxfY29u
bl9pbmZvX2Zyb21fZHJtKCZjb25uX2luZm8sICZvdXRwdXQtPmNvbm5lY3Rvcik7Cj4+PiArCQlv
dXRwdXQtPmNlYyA9IGNlY19ub3RpZmllcl9jb25uX3JlZ2lzdGVyKG91dHB1dC0+ZGV2LCBOVUxM
LAo+Pj4gKwkJCQkJCQkgJmNvbm5faW5mbyk7Cj4+PiArCQlpZiAoIW91dHB1dC0+Y2VjKQo+Pj4g
KwkJCXJldHVybiAtRU5PTUVNOwo+Pj4gKwl9Cj4+PiArCj4+PiAgCXJldHVybiAwOwo+Pj4gIH0K
Pj4+ICAKPj4+Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
