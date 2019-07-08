Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C96292E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 21:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F4789B22;
	Mon,  8 Jul 2019 19:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DFF89B22
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 19:21:56 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id 190so8970320vsf.9
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 12:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wuYR4ctP+Z0e4Snpj6oEKGwghzEqHesmniJR9+rfaQ0=;
 b=Nw8oDCKOgZl0OY0LCh1nKSyvawhtXdvb4WnR9SQzADTMhgxoAN9Lys4WUTpMmP8eRt
 wZl8bnWTj2DEz1Vd2cNOVa5gar3fzk4h93zHymmdHowkM5PM6foF8NVO8M1AFGJXlXj2
 1XLso77Ls8ojpYgAO8v7XGDXh4+fCcG6oFYaGqPNE2iGxdKyLgRTGXg2kXjsdomIY6nj
 6Ew60nA9Y+Tih64fGz7NwZEweuNbE3/Yl7NrExnigg++YN83DFxSbO28SjfYvqlgrr4Z
 x/Jbe910JfCleFinsNc7ZZ6jK2hLV9eQukQq5o1KZq+ZhbdI3D0qqxSoO9en4vZGBd7a
 YTQA==
X-Gm-Message-State: APjAAAWrAUnRW8bAfgB0SCfK9Lv50ZvbEHNkj9soivFA0D3MH3/hr/GQ
 F4dzqrqpAqXXxarzyAeYC8RD8BezL3oVTZnM+Cs=
X-Google-Smtp-Source: APXvYqy9qC6Fb7uF9IrQ45+NaximQGRL39baY/ctKT5H2+0Utwwj/pwjDL1ih0f7URaOyS7d1hIYqXdCkPAS5SbTJZg=
X-Received: by 2002:a67:dd0d:: with SMTP id y13mr3159460vsj.210.1562613715328; 
 Mon, 08 Jul 2019 12:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <1562609151-7283-1-git-send-email-cai@lca.pw>
In-Reply-To: <1562609151-7283-1-git-send-email-cai@lca.pw>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 8 Jul 2019 15:21:44 -0400
Message-ID: <CAKb7UvhoW2F5LSf4B=vJhLykPCme_ixwbUBup_sBXjoQa72Fzw@mail.gmail.com>
Subject: Re: [PATCH v2] gpu/drm_memory: fix a few warnings
To: Qian Cai <cai@lca.pw>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, joe@perches.com,
 linux-spdx@archiver.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCAyOjA2IFBNIFFpYW4gQ2FpIDxjYWlAbGNhLnB3PiB3cm90
ZToKPgo+IFRoZSBvcGVuaW5nIGNvbW1lbnQgbWFyayAiLyoqIiBpcyByZXNlcnZlZCBmb3Iga2Vy
bmVsLWRvYyBjb21tZW50cywgc28KPiBpdCB3aWxsIGdlbmVyYXRlIGEgd2FybmluZyB3aXRoICJt
YWtlIFc9MSIuCj4KPiBkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jOjI6IHdhcm5pbmc6IENh
bm5vdCB1bmRlcnN0YW5kICAqIFxmaWxlCj4gZHJtX21lbW9yeS5jCj4KPiBBbHNvLCBzaWxlbmNl
IGEgY2hlY2twYXRjaCB3YXJuaW5nIGJ5IGFkZGluZyBhIGxpY2Vuc2UgaWRlbnRmaXRlciB3aGVy
ZQo+IGl0IGluZGljYXRlcyB0aGUgTUlUIGxpY2Vuc2UgZnVydGhlciBkb3duIGluIHRoZSBzb3Vy
Y2UgZmlsZS4KPgo+IFdBUk5JTkc6IE1pc3Npbmcgb3IgbWFsZm9ybWVkIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyIHRhZyBpbiBsaW5lIDEKPgo+IEl0IGJlY29tZXMgcmVkdW5kYW50IHRvIGFkZCBi
b3RoIGFuIFNQRFggaWRlbnRpZmllciBhbmQgaGF2ZSBhCj4gZGVzY3JpcHRpb24gb2YgdGhlIGxp
Y2Vuc2UgaW4gdGhlIGNvbW1lbnQgYmxvY2sgYXQgdGhlIHRvcCwgc28gcmVtb3ZlCj4gdGhlIGxh
dGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogUWlhbiBDYWkgPGNhaUBsY2EucHc+Cj4gLS0tCj4KPiB2
MjogcmVtb3ZlIHRoZSByZWR1bmRhbnQgZGVzY3JpcHRpb24gb2YgdGhlIGxpY2Vuc2UuCj4KPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYyB8IDIyICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fbWVtb3J5LmMKPiBpbmRleCAxMzJmZWY4ZmYxYjYuLjg2YTExZmM4ZTk1NCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9tZW1vcnkuYwo+IEBAIC0xLDQgKzEsNSBAQAo+IC0vKioKPiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IE1JVAo+ICsvKgo+ICAgKiBcZmlsZSBkcm1fbWVtb3J5LmMKPiAgICog
TWVtb3J5IG1hbmFnZW1lbnQgd3JhcHBlcnMgZm9yIERSTQo+ICAgKgo+IEBAIC0xMiwyNSArMTMs
NiBAQAo+ICAgKiBDb3B5cmlnaHQgMTk5OSBQcmVjaXNpb24gSW5zaWdodCwgSW5jLiwgQ2VkYXIg
UGFyaywgVGV4YXMuCj4gICAqIENvcHlyaWdodCAyMDAwIFZBIExpbnV4IFN5c3RlbXMsIEluYy4s
IFN1bm55dmFsZSwgQ2FsaWZvcm5pYS4KPiAgICogQWxsIFJpZ2h0cyBSZXNlcnZlZC4KPiAtICoK
PiAtICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFu
eSBwZXJzb24gb2J0YWluaW5nIGEKPiAtICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3Nv
Y2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwKPiAtICogdG8gZGVh
bCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQg
bGltaXRhdGlvbgo+IC0gKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwg
cHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwKPiAtICogYW5kL29yIHNlbGwgY29waWVz
IG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlCj4gLSAq
IFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5n
IGNvbmRpdGlvbnM6Cj4gLSAqCj4gLSAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0
aGlzIHBlcm1pc3Npb24gbm90aWNlIChpbmNsdWRpbmcgdGhlIG5leHQKPiAtICogcGFyYWdyYXBo
KSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25z
IG9mIHRoZQo+IC0gKiBTb2Z0d2FyZS4KPiAtICoKPiAtICogVEhFIFNPRlRXQVJFIElTIFBST1ZJ
REVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKPiAt
ICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBP
RiBNRVJDSEFOVEFCSUxJVFksCj4gLSAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NF
IEFORCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVOVCBTSEFMTAo+IC0gKiBWQSBMSU5VWCBT
WVNURU1TIEFORC9PUiBJVFMgU1VQUExJRVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1B
R0VTIE9SCgpUaGlzIHRhbGtzIGFib3V0IFZBIExpbnV4IFN5c3RlbXMgYW5kL29yIGl0cyBzdXBw
bGllcnMsIHdoaWxlIHRoZSBNSVQKbGljZW5jZSB0YWxrcyBhYm91dCBhdXRob3JzIG9yIGNvcHly
aWdodCBob2xkZXJzLgoKQXJlIHN1Y2ggdHJhbnNmb3JtYXRpb25zIE9LIHRvIGp1c3QgZG8/Cgog
IC1pbGlhCgo+IC0gKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENP
TlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwKPiAtICogQVJJU0lORyBGUk9NLCBPVVQgT0YgT1Ig
SU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SCj4gLSAqIE9USEVS
IERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KPiAgICovCj4KPiAgI2luY2x1ZGUgPGxpbnV4L2hp
Z2htZW0uaD4KPiAtLQo+IDEuOC4zLjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
