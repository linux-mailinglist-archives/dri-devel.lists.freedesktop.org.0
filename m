Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74800BF1FE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 13:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCAE6ECC3;
	Thu, 26 Sep 2019 11:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094676ECC3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 11:43:29 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id f21so1659922otl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 04:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4NJdVMhLCeR2qiK+ps5K2jQQOjDIRz/+T2QEFlJumLo=;
 b=JfwIaTnDTLpyMwbSY6ThQ0Os1pVEc4WUfB3D7lB84tmKl/+UlrkdYKafJbnOeQq4Kb
 FZkVlB//HIcNQhGUsJM/L4o2NpNrQ26Nz5AjLg4S19a1IARsb6olN+lHmbQTNk/f2WHa
 pt1LmQUmOOCZGl2b929jFcNywxfEi+otC5dQRTlYmKiO3Q3Ivg9Xsq5IEB4kaS063f/t
 oI2GhBv2C4TTXsBaOimwICeXk3wgNZe4y0v7yCfcKlFogPIwcA0Hilhh2iPSsbxT/Bzi
 Qig2wUFbZ3B49HqX1WzGVWYbHEVygnygY8kLQabdXQfG+yJAvRSc2402uoIWLDVbV9PS
 VGxw==
X-Gm-Message-State: APjAAAUcIZOG9diGScP8uMTUfcpqfX1gsL2tNvgGUWwRKN0H6Ius9e5D
 8KMlQxLxZG/GlqgcHaxnQiDf/nnjySKqU8PihXQ=
X-Google-Smtp-Source: APXvYqwrzHBwDdOQwaGyp+5fyfQIfQ0z97+Qu0pah+x251meUloMW93t4iddIxB6GsMhyGbNpuoyECgs8nMgvL16kGA=
X-Received: by 2002:a9d:193:: with SMTP id e19mr2139993ote.107.1569498208192; 
 Thu, 26 Sep 2019 04:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190926101312.32218-1-geert@linux-m68k.org>
 <CAK7LNATN5QyC+-_VRZm_ZysYd8Z8aWU0Ys0cTpU2GUdEdrXvPg@mail.gmail.com>
In-Reply-To: <CAK7LNATN5QyC+-_VRZm_ZysYd8Z8aWU0Ys0cTpU2GUdEdrXvPg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2019 13:43:16 +0200
Message-ID: <CAMuHMdU3T83z1iZ7O2-5eRkawdGm50Auw5o0K9+J5Q7+oev62g@mail.gmail.com>
Subject: Re: [PATCH -next] fbdev: c2p: Fix link failure on non-inlining
To: Masahiro Yamada <yamada.masahiro@socionext.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWWFtYWRhLXNhbiwKCk9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDEyOjQ1IFBNIE1hc2FoaXJv
IFlhbWFkYQo8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3RlOgo+IE9uIFRodSwg
U2VwIDI2LCAyMDE5IGF0IDc6MTMgUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4gd3JvdGU6Cj4gPiBXaGVuIHRoZSBjb21waWxlciBkZWNpZGVzIG5vdCB0byBpbmxp
bmUgdGhlIENodW5reS10by1QbGFuYXIgY29yZQo+ID4gZnVuY3Rpb25zLCB0aGUgYnVpbGQgZmFp
bHMgd2l0aDoKPiA+Cj4gPiAgICAgYzJwX3BsYW5hci5jOigudGV4dCsweGQ2KTogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgYzJwX3Vuc3VwcG9ydGVkJwo+ID4gICAgIGMycF9wbGFuYXIuYzooLnRl
eHQrMHgxZGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjMnBfdW5zdXBwb3J0ZWQnCj4gPiAg
ICAgYzJwX2lwbGFuMi5jOigudGV4dCsweGM0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYzJw
X3Vuc3VwcG9ydGVkJwo+ID4gICAgIGMycF9pcGxhbjIuYzooLnRleHQrMHgxNTApOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBjMnBfdW5zdXBwb3J0ZWQnCj4gPgo+ID4gRml4IHRoaXMgYnkgbWFy
a2luZyB0aGUgZnVuY3Rpb25zIF9fYWx3YXlzX2lubGluZS4KPiA+Cj4gPiBSZXBvcnRlZC1ieTog
bm9yZXBseUBlbGxlcm1hbi5pZC5hdQo+ID4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiA+IC0tLQo+ID4gRml4ZXM6IDAyNWYwNzJlNTgy
Mzk0N2MgKCJjb21waWxlcjogZW5hYmxlIENPTkZJR19PUFRJTUlaRV9JTkxJTklORyBmb3JjaWJs
eSIpCj4gPgo+ID4gQXMgdGhpcyBpcyBhIHBhdGNoIGluIGFrcG0ncyB0cmVlLCB0aGUgY29tbWl0
IElEIGluIHRoZSBGaXhlcyB0YWcgaXMgbm90Cj4gPiBzdGFibGUuCj4KPiBCVFcsIHRoYXQgRml4
ZXMgdGFnIGlzIGluY29ycmVjdC4KPgo+IElycmVzcGVjdGl2ZSBvZiAwMjVmMDcyZTU4MjM5NDdj
LCB5b3UgY291bGQgbWFudWFsbHkgZW5hYmxlCj4gQ09ORklHX09QVElNSVpFX0lOTElOSU5HIGZy
b20gbWVudWNvbmZpZyBldGMuCgpNZXJlbHkgZW5hYmxpbmcgdGhhdCBkb2Vzbid0IGhlbHAuCllv
dSBhbHNvIG5lZWQgQ09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpFPXksIHdoaWxlIHRoZQpkZWZh
dWx0IGlzIENPTkZJR19DQ19PUFRJTUlaRV9GT1JfUEVSRk9STUFOQ0U9eS4KV2hpY2ggaXMgd2h5
IG15IGFsbHttb2QseWVzfWNvbmZpZyBidWlsZHMgbmV2ZXIgY2F1Z2h0IHRoYXQgOi0oCgo+IFNv
LCB0aGlzIGJ1aWxkIGVycm9yIHdvdWxkIGhhdmUgYmVlbiBmb3VuZCBtdWNoIGVhcmxpZXIKPiBp
ZiBzb21lYm9keSBoYWQgYmVlbiBydW5uaW5nIHJhbmRjb25maWcgdGVzdHMgb24gbTY4ay4KCkl0
J3MgYmVlbiBhIHdoaWxlIEkgZGlkIHRoYXQuLi4KCkJUVywgZG9lcyByYW5kY29uZmlnIHJhbmRv
bWl6ZSBjaG9pY2VzIHRoZXNlIGRheXM/CkkgcmVtZW1iZXIgaXQgZGlkbid0IHVzZSB0byBkbyB0
aGF0LgoKPiBJdCBpcyBpbXBvc3NpYmxlIHRvIGRldGVjdCB0aGlzIGVycm9yIG9uIG90aGVyIGFy
Y2hpdGVjdHVyZXMKPiBiZWNhdXNlIHRoZSBkcml2ZXIgY29uZmlnIG9wdGlvbnMgYXJlIGd1YXJk
ZWQgYnkKPiAnZGVwZW5kcyBvbiBBVEFSSScgb3IgJ2RlcGVuZHMgb24gQU1JR0EnLgo+Cj4gVGhl
IGNvcnJlY3QgdGFnIGlzOgo+Cj4gRml4ZXM6IDkwMTJkMDExNjYwZSAoImNvbXBpbGVyOiBhbGxv
dyBhbGwgYXJjaGVzIHRvIGVuYWJsZQo+IENPTkZJR19PUFRJTUlaRV9JTkxJTklORyIpCj4KPiBU
aGUgY29tbWl0IGlkIGlzIHN0YWJsZS4KClRoYW5rcywgd2lsbCB1cGRhdGUuCgo+IEFzIGFuIGFk
ZGl0aW9uYWwgd29yaywKPiBkZXBlbmRzIG9uIChBTUlHQSB8fCBDT01QSUxFX1RFU1QpCj4gd291
bGQgYmUgbmljZSB1bmxlc3MgdGhpcyBkcml2ZXIgY29udGFpbnMgbTY4ay1zcGVjaWZpYyBjb2Rl
LgoKVGhlIEFtaWdhIGFuZCBBdGFyaSBmcmFtZSBidWZmZXIgZHJpdmVycyBuZWVkIDxhc20ve2Ft
aWdhLGF0YXJpfWh3Lmg+LAphbmQgdGhlIEF0YXJpIGRyaXZlciBjb250YWlucyBpbmxpbmUgYXNt
LgoKVGhlIEMyUCBjb2RlIGNvdWxkIGJlIHB1dCBiZWhpbmQgaXRzIG93biBLY29uZmlnIHN5bWJv
bCwgSSBndWVzcy4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
