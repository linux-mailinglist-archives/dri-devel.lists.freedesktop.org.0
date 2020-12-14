Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7772D993F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 14:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DF76E209;
	Mon, 14 Dec 2020 13:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2126E134;
 Mon, 14 Dec 2020 13:51:14 +0000 (UTC)
IronPort-SDR: hsd+OYSMftx7oMceH66DCUcX0edFIVqhClh09XNRjsm0Q+9RCCV7bkKTXDK+gahKMcerR9oSIa
 qH+8V9gfO2qA==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="172139863"
X-IronPort-AV: E=Sophos;i="5.78,419,1599548400"; d="scan'208";a="172139863"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 05:51:11 -0800
IronPort-SDR: pAp/gGRPEEFrEs2wvhwD9gBt/nSjOL3YMAs43dVWKpBnbRBwsCfr5Z0K1FGoZ98aWfIPgSIdPL
 Un/2hE4QkNeA==
X-IronPort-AV: E=Sophos;i="5.78,419,1599548400"; d="scan'208";a="487078372"
Received: from ssonth-mobl.gar.corp.intel.com (HELO [10.215.117.161])
 ([10.215.117.161])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 05:51:08 -0800
Subject: Re: [PATCH v4 16/16] drm/i915: Enable PCON configuration for Color
 Conversion for TGL
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
 <20201208075145.17389-17-ankit.k.nautiyal@intel.com>
 <9bda98244dea4f578a372361d52c0a98@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <ab904612-3072-ba69-77e2-b2dbbad34a5c@intel.com>
Date: Mon, 14 Dec 2020 19:21:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <9bda98244dea4f578a372361d52c0a98@intel.com>
Content-Language: en-US
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "Kulkarni,
 Vandita" <vandita.kulkarni@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzEzLzIwMjAgMTI6NTkgUE0sIFNoYW5rYXIsIFVtYSB3cm90ZToKPgo+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBOYXV0aXlhbCwgQW5raXQgSyA8YW5raXQuay5u
YXV0aXlhbEBpbnRlbC5jb20+Cj4+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDgsIDIwMjAgMToy
MiBQTQo+PiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRl
bC5jb20+Owo+PiBhaXJsaWVkQGxpbnV4LmllOyBqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb207
IHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tOwo+PiBLdWxrYXJuaSwgVmFuZGl0YSA8dmFu
ZGl0YS5rdWxrYXJuaUBpbnRlbC5jb20+OyBTaGFybWEsIFN3YXRpMgo+PiA8c3dhdGkyLnNoYXJt
YUBpbnRlbC5jb20+Cj4+IFN1YmplY3Q6IFtQQVRDSCB2NCAxNi8xNl0gZHJtL2k5MTU6IEVuYWJs
ZSBQQ09OIGNvbmZpZ3VyYXRpb24gZm9yIENvbG9yCj4+IENvbnZlcnNpb24gZm9yIFRHTAo+IEFw
cGVuZCBkaXNwbGF5IGhlcmUuCgoKTm90ZWQuIFdpbGwgY2hhbmdlIGluIHRoZSBuZXh0IHZlcnNp
b24gb2YgdGhlIHBhdGNoLgoKPj4gVGhpcyBwYXRjaCBlbmFibGVzIFBDT04gY29uZmlndXJhdGlv
biBmb3IgY29sb3Igc3BhY2UgY29udmVyc2lvbiBmb3IKPj4gVEdMKyBwbGF0ZnJvbS4gVGhpcyB3
aWxsIGhlbHAgaW4gc3VwcG9ydGluZyA4a0A2MCBZVVY0MjAgbW9kZXMgY29tbW9uCj4+IGluIEhE
TUkgOGsgcGFuZWxzLCB0aHJvdWdoIGEgY2FwYWJsZSBQQ09OLgo+PiBBbHNvIGFsbG93IDhrQDYw
IFlVVjQyMCBtb2Rlcywgb25seSBpZiBQQ09OIGNsYWltcyB0byBzdXBwb3J0IHRoZSBjb2xvciBz
cGFjZQo+PiBjb252ZXJzaW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmtpdCBOYXV0aXlhbCA8
YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgfCAxICsKPj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kcC5jICB8IDUgKysrKysKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kZGkuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMK
Pj4gaW5kZXggNzIxYTQ3YmJjMDA5Li5lZDZiOGVhODU0MDggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwo+PiBAQCAtMzY0NCw2ICszNjQ0LDcgQEAgc3Rh
dGljIHZvaWQgdGdsX2RkaV9wcmVfZW5hYmxlX2RwKHN0cnVjdAo+PiBpbnRlbF9hdG9taWNfc3Rh
dGUgKnN0YXRlLAo+PiAgIAlpZiAoIWlzX21zdCkKPj4gICAJCWludGVsX2RwX3NldF9wb3dlcihp
bnRlbF9kcCwgRFBfU0VUX1BPV0VSX0QwKTsKPj4KPj4gKwlpbnRlbF9kcF9jb25maWd1cmVfcHJv
dG9jb2xfY29udmVydGVyKGludGVsX2RwKTsKPiBCb3RoIHRoZSBjaGFuZ2VzIHNlZW1zIHRvIGJl
IHVucmVsYXRlZCwgaXQgd291bGQgYmUgZ29vZCB0byBwdXQgY29uZmlndXJhdGlvbgo+IG9mIHBy
b3RvY29sIGNvbnZlcnRvciBpbiBlYXJsaWVyIHBhdGNoZXMgYW5kIGp1c3QgcHJ1bmluZyBsb2dp
YyBoZXJlLgo+IEFsc28gdGhlIGRlc2NyaXB0aW9uIG9mIHBhdGNoIG5lZWRzIHRvIGNoYW5nZSB0
byBjbGVhcmx5IGNhbGwgdGhpcyBvdXQuCgoKQWxyaWdodC4gV2lsbCBzcGxpdCB0aGUgcHJ1bmlu
ZyBsb2dpYyBpbnRvIGEgc2VwYXJhdGUgcGF0Y2guCgoKPgo+PiAgIAlpbnRlbF9kcF9zaW5rX3Nl
dF9kZWNvbXByZXNzaW9uX3N0YXRlKGludGVsX2RwLCBjcnRjX3N0YXRlLCB0cnVlKTsKPj4gICAJ
LyoKPj4gICAJICogRERJIEZFQzogImFudGljaXBhdGVzIGVuYWJsaW5nIEZFQyBlbmNvZGluZyBz
ZXRzIHRoZSBGRUNfUkVBRFkgYml0Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwLmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMKPj4gaW5kZXggYjNmMTE5MGQ4MTUwLi44NjI4OWM5MjU2MTIgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPj4gQEAgLTcyMCw2ICs3MjAsMTEg
QEAgaW50ZWxfZHBfbW9kZV92YWxpZF9kb3duc3RyZWFtKHN0cnVjdAo+PiBpbnRlbF9jb25uZWN0
b3IgKmNvbm5lY3RvciwKPj4gICAJY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm8g
PSAmY29ubmVjdG9yLT5iYXNlLmRpc3BsYXlfaW5mbzsKPj4gICAJaW50IHRtZHNfY2xvY2s7Cj4+
Cj4+ICsJLyogQWxsb3cgOGsgWVVWNDIwIG1vZGVzLCBvbmx5IGlmIFBDT04gc3VwcG9ydHMgUkdC
LT5ZVVYgY29udmVyc2lvbgo+PiAqLwo+PiArCWlmIChtb2RlLT5oZGlzcGxheSA9PSA3NjgwICYm
IGRybV9tb2RlX2lzXzQyMF9vbmx5KGluZm8sIG1vZGUpICYmCj4+ICsJICAgICFpbnRlbF9kcC0+
ZGZwLnJnYl90b195Y2JjcikKPiBJIHRoaW5rIHRoaXMgd2lsbCBiZSBhIHBsYXRmb3JtIGxpbWl0
YXRpb24sIGFzIHRoZXJlIG1heSBiZSBwbGF0Zm9ybXMgd2hpY2ggY2FuCj4gZG8gdGhhdCBvbiB0
aGUgU09DIHNpZGUgYXMgd2VsbC4gU28gd291bGQgYmUgZ29vZCB0byBsaW1pdCB0byB0aG9zZSBw
bGF0Zm9ybXMgd2hlcmUKPiBwY29uIGNvbnZlcnNpb24gaXMgdGhlIG9ubHkgb3B0aW9uIGluIG9y
ZGVyIHRvIHN1cHBvcnQgdGhpcyBjb25maWd1cmF0aW9uLCBpbnN0ZWFkIG9mIGRvaW5nCj4gaXQg
Zm9yIGFsbCBwbGF0Zm9ybXMuCgpXZSBkbyBoYXZlIGEgZmxhZ8KgIHljYmNyXzQyMF9hbGxvd2Vk
IHdoaWNoIGdldHMgc2V0IGZvciBHZW4gPiA1IGFuZCBhbHNvIAppZiBEUCBzaW5rIGhhcyB5Y2Jj
cjQyMCBwYXNzdGhyb3VnaCBvciB5Y2JjcjQ0NC0+NDIwIGNvbnZlcnNpb24gc3VwcG9ydC4KClNv
IHRoZW9yZXRpY2FsbHkgd2Ugc2hvdWxkIGJlIGFibGUgdG8gY29udmVydCBSR0ItPllDYkNSIGZv
ciBHZW4gPiA1LgoKQnV0IEkgYW0gbm90IHN1cmUsIGlmIHdlIG5lZWQgc29tZSBjaGFuZ2VzIHdo
ZW4gd2UgdXNlIGJpZyBqb2luZXIuCgpXaXRoIFJlYWx0ZWsgSERNSTIuMSBkb25nbGUsIEkgd2Fz
IGFibGUgdG8gZ2V0IFJHQi0+WUNiQ3IgYW5kIDQ0NC0+NDIwIApjb252ZXJzaW9uIGZvciA4a0A2
MCBZVVY0MjAgdGhyb3VnaCBQQ09OLgoKUHJvYmFibHkgbmVlZCB0byByZXZpc2l0IHRoaXMgYWdh
aW4uCgpUaGFua3MgJiBSZWdhcmRzLAoKQW5raXQKCj4KPj4gKwkJcmV0dXJuIE1PREVfTk9fNDIw
Owo+PiArCj4+ICAgCS8qCj4+ICAgCSAqIElmIFBDT04gYW5kIEhETUkyLjEgc2luayBib3RoIHN1
cHBvcnQgRlJMIE1PREUsIGNoZWNrIEZSTAo+PiAgIAkgKiBiYW5kd2lkdGggY29uc3RyYWludHMu
Cj4+IC0tCj4+IDIuMTcuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
