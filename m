Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BC8CB55C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A056EADD;
	Fri,  4 Oct 2019 07:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Thu, 03 Oct 2019 15:09:32 UTC
Received: from lb3-smtp-cloud8.xs4all.net (lb3-smtp-cloud8.xs4all.net
 [194.109.24.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A70D6EA0D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 15:09:32 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud8.xs4all.net with ESMTPA
 id G2cTi3U1Eop0AG2cWi8jqb; Thu, 03 Oct 2019 17:02:21 +0200
Subject: Re: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Johan Korsnes <jkorsnes@cisco.com>
References: <20191003071549.31272-1-jkorsnes@cisco.com>
 <20191003134417.GF1208@intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <52313559-8b8f-1f4d-a341-a2f1ff10bc0f@xs4all.nl>
Date: Thu, 3 Oct 2019 17:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003134417.GF1208@intel.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfD8+jPTyj6pY1Rh0zJlS6TiPAOwM/O2lNxzABDT/71Zq+Ewyc7XarVFgKo9lfw3LNkCGxe15VZtNxD6BnSOf+nqpCIWg6U9qKoD154km1f8zAcSJHpYv
 2mpE31GXMulfahAeh1iSwiWxWM4rDj2Pf3Ji2YpfaF49nbtq+R9dWzhSvKB/9kEwttmgjmoeFIsdImiocTaZJPwZFr6stQkEYsQ6h46MWsINNXnhlClMZr+K
 HasxgFj9fcwPZRkTslV8QkYPxsAIt8OHe0biMZZvIB+/1LNvjXygUlDN4YszJiEHi/sRlKHusicAXs2ZoYKqJQ==
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMy8xOSAzOjQ0IFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gVGh1LCBPY3Qg
MDMsIDIwMTkgYXQgMDk6MTU6NDlBTSArMDIwMCwgSm9oYW4gS29yc25lcyB3cm90ZToKPj4gV2hl
biBsb2dnaW5nIHRoZSBBVkkgSW5mb0ZyYW1lLCBjbGVhcmx5IGluZGljYXRlIHdoZXRoZXIgb3Ig
bm90IHRoZQo+PiBleHRlbmRlZCBjb2xvcmltZXRyeSBhdHRyaWJ1dGUgaXMgYWN0aXZlLiBUaGlz
IGlzIG9ubHkgdGhlIGNhc2Ugd2hlbgo+PiB0aGUgQVZJIEluZm9GcmFtZSBjb2xvcmltZXRyeSBh
dHRyaWJ1dGUgaXMgc2V0IHRvIGV4dGVuZGVkLiBbMF0KPj4KPj4gWzBdIENUQS04NjEtRyBzZWN0
aW9uIDYuNCBwYWdlIDU3Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvaGFuIEtvcnNuZXMgPGprb3Jz
bmVzQGNpc2NvLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL3ZpZGVvL2hkbWkuYyB8IDggKysrKysr
Ky0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vaGRtaS5jIGIvZHJpdmVycy92aWRlby9oZG1p
LmMKPj4gaW5kZXggZjI5ZGI3MjhmZjI5Li5hNzA5ZTM4YTUzY2EgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvdmlkZW8vaGRtaS5jCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vaGRtaS5jCj4+IEBAIC02
ODIsOCArNjgyLDE0IEBAIHN0YXRpYyB2b2lkIGhkbWlfYXZpX2luZm9mcmFtZV9sb2coY29uc3Qg
Y2hhciAqbGV2ZWwsCj4+ICAJaGRtaV9sb2coIiAgICBhY3RpdmUgYXNwZWN0OiAlc1xuIiwKPj4g
IAkJCWhkbWlfYWN0aXZlX2FzcGVjdF9nZXRfbmFtZShmcmFtZS0+YWN0aXZlX2FzcGVjdCkpOwo+
PiAgCWhkbWlfbG9nKCIgICAgaXRjOiAlc1xuIiwgZnJhbWUtPml0YyA/ICJJVCBDb250ZW50IiA6
ICJObyBEYXRhIik7Cj4+IC0JaGRtaV9sb2coIiAgICBleHRlbmRlZCBjb2xvcmltZXRyeTogJXNc
biIsCj4+ICsKPj4gKwlpZiAoZnJhbWUtPmNvbG9yaW1ldHJ5ID09IEhETUlfQ09MT1JJTUVUUllf
RVhURU5ERUQpCj4+ICsJCWhkbWlfbG9nKCIgICAgZXh0ZW5kZWQgY29sb3JpbWV0cnk6ICVzXG4i
LAo+PiAgCQkJaGRtaV9leHRlbmRlZF9jb2xvcmltZXRyeV9nZXRfbmFtZShmcmFtZS0+ZXh0ZW5k
ZWRfY29sb3JpbWV0cnkpKTsKPj4gKwllbHNlCj4+ICsJCWhkbWlfbG9nKCIgICAgZXh0ZW5kZWQg
Y29sb3JpbWV0cnk6IE4vQSAoMHgleClcbiIsCj4+ICsJCQlmcmFtZS0+ZXh0ZW5kZWRfY29sb3Jp
bWV0cnkpOwo+IAo+IFllYWgsIHNlZW1zIGZpbmUuIE1pZ2h0IG1ha2UgdGhlIGxvZ3MgYSBiaXQg
bGVzcyBjb25mdXNpbmcgYXQgbGVhc3QuCj4gCj4gUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gUFMuIHdvdWxkIGJlIG5pY2Ug
aXQgc29tZW9uZSB3ZXJlIHRvIGV4dGVuZCB0aGlzIGNvZGUgdG8gZGVhbCB3aXRoIHRoZQo+IEFD
RSBiaXRzIHRvby4gRG8geW91IGhhdmUgcGxhbnMvaW50ZXJlc3QgaW4gZG9pbmcgdGhhdD8KCklm
IHdlIHRhY2tsZSB0aGlzLCB0aGVuIGl0IHdvdWxkIGJlIHBhcnQgb2YgYSBsYXJnZXIgZWZmb3J0
IGluIHVwZGF0aW5nCnRoaXMgY29kZS4gVGhlcmUgYXJlIG1vcmUgZmllbGRzIG1pc3NpbmcgaW4g
b3RoZXIgSW5mb0ZyYW1lcyBhcyB3ZWxsLgoKU28geWVzLCB3ZSBoYXZlIGludGVyZXN0IGluIHRo
aXMsIGJ1dCBubywgdGhlcmUgYXJlIG5vIHBsYW5zIDotKQoKUmVnYXJkcywKCglIYW5zCgo+IAo+
PiArCj4+ICAJaGRtaV9sb2coIiAgICBxdWFudGl6YXRpb24gcmFuZ2U6ICVzXG4iLAo+PiAgCQkJ
aGRtaV9xdWFudGl6YXRpb25fcmFuZ2VfZ2V0X25hbWUoZnJhbWUtPnF1YW50aXphdGlvbl9yYW5n
ZSkpOwo+PiAgCWhkbWlfbG9nKCIgICAgbnVwczogJXNcbiIsIGhkbWlfbnVwc19nZXRfbmFtZShm
cmFtZS0+bnVwcykpOwo+PiAtLSAKPj4gMi4yMC4xCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
