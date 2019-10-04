Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB15CBB49
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 15:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C844B6EB6C;
	Fri,  4 Oct 2019 13:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738586EB6C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 13:08:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 06:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="276041229"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 04 Oct 2019 06:08:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2019 16:08:35 +0300
Date: Fri, 4 Oct 2019 16:08:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Subject: Re: [PATCH] drm: atomic helper: fix W=1 warnings
Message-ID: <20191004130835.GX1208@intel.com>
References: <20190909135205.10277-1-benjamin.gaignard@st.com>
 <20190909135205.10277-2-benjamin.gaignard@st.com>
 <20191003142738.GM1208@intel.com>
 <CA+M3ks4FBAgCRDDHZ=x7kvQ1Y=0dBdj4+KLO2djh__hW+L=3gQ@mail.gmail.com>
 <20191003150526.GN1208@intel.com>
 <CA+M3ks7-SNusVJsiHqrmy4AN+_OO5e1X=ZRN16Hj6f-V3GnVow@mail.gmail.com>
 <20191003154627.GQ1208@intel.com>
 <CA+M3ks4gpDdZTPdBYRd=CrwgEYiSWJbXqvtPb-0KpW1BhzvmEQ@mail.gmail.com>
 <20191004122747.GT1208@intel.com>
 <5fe9d7e2-f434-70cb-ac0f-ad66a565093d@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5fe9d7e2-f434-70cb-ac0f-ad66a565093d@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMTI6MzY6NTZQTSArMDAwMCwgQmVuamFtaW4gR0FJR05B
UkQgd3JvdGU6Cj4gCj4gT24gMTAvNC8xOSAyOjI3IFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gPiBPbiBGcmksIE9jdCAwNCwgMjAxOSBhdCAxMjo0ODowMlBNICswMjAwLCBCZW5qYW1pbiBH
YWlnbmFyZCB3cm90ZToKPiA+PiBMZSBqZXUuIDMgb2N0LiAyMDE5IMOgIDE3OjQ2LCBWaWxsZSBT
eXJqw6Rsw6QKPiA+PiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IGEgw6ljcml0IDoK
PiA+Pj4gT24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDU6Mzc6MTVQTSArMDIwMCwgQmVuamFtaW4g
R2FpZ25hcmQgd3JvdGU6Cj4gPj4+PiBMZSBqZXUuIDMgb2N0LiAyMDE5IMOgIDE3OjA1LCBWaWxs
ZSBTeXJqw6Rsw6QKPiA+Pj4+IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gYSDDqWNy
aXQgOgo+ID4+Pj4+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDA0OjQ2OjU0UE0gKzAyMDAsIEJl
bmphbWluIEdhaWduYXJkIHdyb3RlOgo+ID4+Pj4+PiBMZSBqZXUuIDMgb2N0LiAyMDE5IMOgIDE2
OjI3LCBWaWxsZSBTeXJqw6Rsw6QKPiA+Pj4+Pj4gPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPiBhIMOpY3JpdCA6Cj4gPj4+Pj4+PiBPbiBNb24sIFNlcCAwOSwgMjAxOSBhdCAwMzo1Mjow
NVBNICswMjAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToKPiA+Pj4+Pj4+PiBGaXggd2Fybmlu
Z3Mgd2l0aCBXPTEuCj4gPj4+Pj4+Pj4gRmV3IGZvcl9lYWNoIG1hY3JvIHNldCB2YXJpYWJsZXMg
dGhhdCBhcmUgbmV2ZXIgdXNlZCBsYXRlci4KPiA+Pj4+Pj4+PiBQcmV2ZW50IHdhcm5pbmcgYnkg
bWFya2luZyB0aGVzZSB2YXJpYWJsZXMgYXMgX19tYXliZV91bnVzZWQuCj4gPj4+Pj4+Pj4KPiA+
Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25h
cmRAc3QuY29tPgo+ID4+Pj4+Pj4+IC0tLQo+ID4+Pj4+Pj4+ICAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9hdG9taWNfaGVscGVyLmMgfCAzNiArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0KPiA+Pj4+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxOCBkZWxl
dGlvbnMoLSkKPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY19oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBl
ci5jCj4gPj4+Pj4+Pj4gaW5kZXggYWExNmVhMTdmZjliLi5iNjlkMTdiMGI5YmQgMTAwNjQ0Cj4g
Pj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKPiA+Pj4+
Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+ID4+Pj4+Pj4+
IEBAIC0yNjIsNyArMjYyLDcgQEAgc3RlYWxfZW5jb2RlcihzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqc3RhdGUsCj4gPj4+Pj4+Pj4gICAgICAgICAgICAgIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5j
b2RlcikKPiA+Pj4+Pj4+PiAgIHsKPiA+Pj4+Pj4+PiAgICAgICAgc3RydWN0IGRybV9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlOwo+ID4+Pj4+Pj4+IC0gICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3I7Cj4gPj4+Pj4+Pj4gKyAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgX19tYXliZV91
bnVzZWQgKmNvbm5lY3RvcjsKPiA+Pj4+Pj4+IFJhdGhlciB1Z2x5LiBJTU8gd291bGQgYmUgbmlj
ZXIgaWYgd2UgY291bGQgaGlkZSBzb21ldGhpbmcgaW5zaWRlCj4gPj4+Pj4+PiB0aGUgaXRlcmF0
b3IgbWFjcm9zIHRvIHN1cHByZXNzIHRoZSB3YXJuaW5nLgo+ID4+Pj4+PiBPayBidXQgaG93ID8K
PiA+Pj4+Pj4gY29ubmVjdG9yIGlzIGFzc2lnbmVkIGluIHRoZSBtYWNyb3MgYnV0IG5vdCB1c2Vk
IGxhdGVyIGFuZCB3ZSBjYW4ndAo+ID4+Pj4+PiBzZXQgIl9fbWF5YmVfdW51c2VkIgo+ID4+Pj4+
PiBpbiB0aGUgbWFjcm8uCj4gPj4+Pj4+IERvZXMgYW5vdGhlciBrZXl3b3JkIGV4aXN0IGZvciB0
aGF0ID8KPiA+Pj4+PiBTdGljayBhICh2b2lkKShjb25uZWN0b3IpIGludG8gdGhlIG1hY3JvPwo+
ID4+Pj4gVGhhdCBjb3VsZCB3b3JrIGJ1dCBpdCB3aWxsIGxvb2sgc3RyYW5nZSBpbnNpZGUgdGhl
IG1hY3JvLgo+ID4+Pj4KPiA+Pj4+PiBBbm90aGVyIChhcmd1YWJseSBjbGVhbmVyKSBpZGVhIHdv
dWxkIGJlIHRvIHJlbW92ZSB0aGUgY29ubmVjdG9yL2NydGMvcGxhbmUKPiA+Pj4+PiBhcmd1bWVu
dCBmcm9tIHRoZSBpdGVyYXRvcnMgZW50aXJlbHkgc2luY2UgaXQncyByZWR1bmRhbnQsIGFuZCBp
bnN0ZWFkIGp1c3QKPiA+Pj4+PiBleHRyYWN0IGl0IGZyb20gdGhlIGFwcHJvcHJpYXRlIG5ldy9v
bGQgc3RhdGUgYXMgbmVlZGVkLgo+ID4+Pj4+Cj4gPj4+Pj4gV2UgY291bGQgdGhlbiBhbHNvIGFk
ZCBhIGZvcl9lYWNoX2Nvbm5lY3Rvcl9pbl9zdGF0ZSgpL2V0Yy4gd2hpY2ggb21pdAo+ID4+Pj4+
IHMgdGhlIHN0YXRlIGFyZ3VtZW50cyBhbmQganVzdCBoYXMgdGhlIGNvbm5lY3RvciBhcmd1bWVu
dCwgZm9yIGNhc2VzIHdoZXJlCj4gPj4+Pj4geW91IGRvbid0IGNhcmUgYWJvdXQgdGhlIHN0YXRl
cyB3aGVuIGl0ZXJhdGluZy4KPiA+Pj4+IFRoYXQgbWF5IGxlYWQgdG8gZ2V0IGEgbWFjcm8gZm9y
IGVhY2ggcG9zc2libGUgY29tYmluYXRpb24gb2YgdXNlZCB2YXJpYWJsZXMuCj4gPj4+IFdlIGFs
cmVhZHkgaGF2ZSBuZXcvb2xkL29sZG5ldywgc28gd291bGQgImp1c3QiIGFkZCBvbmUgbW9yZS4K
PiA+PiBOb3QganVzdCBvbmUsIGl0IHdpbGwgYmUgb25lIGVhY2ggbmV3L29sZC9vbGRuZXcgbWFj
cm8gdG8gYmUgYWJsZSB0byBkaXN0aW5ndWlzaAo+ID4+IHdoZW4gY29ubmVjdG9yIGlzIHVzZWQg
b3Igbm90Lgo+ID4gV2hhdCBJJ20gc3VnZ2VzdGluZyBpcyB0aGlzOgo+ID4gZm9yX2VhY2hfY29u
bmVjdG9yX2luX3N0YXRlKHN0YXRlLCBjb25uZWN0b3IsIGkpCj4gPiBmb3JfZWFjaF9vbGRfY29u
bmVjdG9yX2luX3N0YXRlKHN0YXRlLCBvbGRfY29ubl9zdGF0ZSwgaSkKPiA+IGZvcl9lYWNoX25l
d19jb25uZWN0b3JfaW5fc3RhdGUoc3RhdGUsIG5ld19jb25uX3N0YXRlLCBpKQo+ID4gZm9yX2Vh
Y2hfb2xkbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShzdGF0ZSwgb2xkX2Nvbm5fc3RhdGUsIG5ld19j
b25uX3N0YXRlLCBpKQo+ID4KPiA+IFNvIG9ubHkgZm91ciBpbiB0b3RhbCBmb3IgZWFjaCBvYmpl
Y3QgdHlwZSwgaW5zdGVhZCBvZiB0aGUgY3VycmVudAo+ID4gdGhyZWUuCj4gCj4gWW91IGFyZSBt
aXNzaW5nIHRoZXNlIGNhc2VzOiBvbGQgYW5kIGNvbm5lY3RvciwgbmV3IGFuZCBjb25uZWN0b3Is
Cj4gCj4gb2xkIGFuZCBuZXcgYW5kIGNvbm5lY3RvciBhcmUgbmVlZGVkIHRvZ2V0aGVyLgoKTm8s
IHRoYXQncyByZWR1bmRhbnQuIFlvdSBjYW4gYWx3YXlzIGdldCB0aGUgY29ubmVjdG9yIGZyb20K
b2xkL25ld19jb25uX3N0YXRlLT5jb25uZWN0b3IgaWYgeW91IG5lZWQgaXQuCgotLSAKVmlsbGUg
U3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
