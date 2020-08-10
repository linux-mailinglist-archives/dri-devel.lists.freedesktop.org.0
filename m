Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 932BC240B22
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 18:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790E789B05;
	Mon, 10 Aug 2020 16:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221D689B05
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 16:26:37 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBCAA204EC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597076797;
 bh=fkfI6OJtgRo63f+y4uLQRkaVeFikdXuomFKqwErsDWM=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=1A5HlNsY9sbYwrjvpsPbvfcoC+3uJ2wFSkcaCgV5gctYlI0tCGW2kNhN7x3u3KMEu
 g2wsrb68w5s7kaMhv0F/FC22kvkpUE76ufHo/gqF4QCgUxKk9X1hdf4GvIhsQT8CLI
 Ot9GZqV/1QdC6DWU204fTJPIaob1llqcXCgfm+DY=
Received: by mail-ot1-f53.google.com with SMTP id t7so7758600otp.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 09:26:36 -0700 (PDT)
X-Gm-Message-State: AOAM532ID9aR3+l0MXP6tyOEzkL/2p4eWxFs3zTHI8MrQOAM9GdcVcO4
 nMwUzK2jMzkQfcGkVo7SK+rcnnb6bXHxcjzpGQ==
X-Google-Smtp-Source: ABdhPJx//bZialdTk8cnPDttxIrd8vs1afDiBKqW0iV/L7RcHfJcceW7i1t04GrgEEOd00euxQ57zyuVIfAKbHfZbYM=
X-Received: by 2002:a05:6830:1d8e:: with SMTP id
 y14mr1457483oti.129.1597076796182; 
 Mon, 10 Aug 2020 09:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200710095409.407087-1-peron.clem@gmail.com>
 <CAL_JsqLnOGVbO5T92dyzt3K-v4BRNt72yMpYR_wW-z8dpdVSvA@mail.gmail.com>
 <CAJiuCcfezzr7w9=-G6WK0p6YS=6SBAKF8jv=yAOyNFJ59X80qw@mail.gmail.com>
 <CAJiuCceufQko1KWmU0rHSaJiKMKST0L3OADE0O4_7myLtV4Zjg@mail.gmail.com>
 <20200810122138.GH2352366@phenom.ffwll.local>
In-Reply-To: <20200810122138.GH2352366@phenom.ffwll.local>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Aug 2020 10:26:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJGXVgP3AyViocmzqGAf3jep-M-9rCyqhzW9HOx-+m6CA@mail.gmail.com>
Message-ID: <CAL_JsqJGXVgP3AyViocmzqGAf3jep-M-9rCyqhzW9HOx-+m6CA@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] Add regulator devfreq support to Panfrost
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
 Rob Herring <robh@kernel.org>, Nishanth Menon <nm@ti.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTAsIDIwMjAgYXQgNjoyMSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gRnJpLCBBdWcgMDcsIDIwMjAgYXQgMDY6MzA6MDVQTSArMDIw
MCwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+ID4gT24gRnJpLCA3IEF1ZyAyMDIwIGF0IDE4OjI4
LCBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gSGkgUm9iLAo+ID4gPgo+ID4gPiBPbiBGcmksIDcgQXVnIDIwMjAgYXQgMTg6MTMsIFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gRnJpLCBK
dWwgMTAsIDIwMjAgYXQgMzo1NCBBTSBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwu
Y29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIaSwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBU
aGlzIHNlcmllIGNsZWFucyBhbmQgYWRkcyByZWd1bGF0b3Igc3VwcG9ydCB0byBQYW5mcm9zdCBk
ZXZmcmVxLgo+ID4gPiA+ID4gVGhpcyBpcyBtb3N0bHkgYmFzZWQgb24gY29tbWVudCBmb3IgdGhl
IGZyZXNobHkgaW50cm9kdWNlZCBsaW1hCj4gPiA+ID4gPiBkZXZmcmVxLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFdlIG5lZWQgdG8gYWRkIHJlZ3VsYXRvciBzdXBwb3J0IGJlY2F1c2Ugb24gQWxsd2lu
bmVyIHRoZSBHUFUgT1BQCj4gPiA+ID4gPiB0YWJsZSBkZWZpbmVzIGJvdGggZnJlcXVlbmNpZXMg
YW5kIHZvbHRhZ2VzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEZpcnN0IHBhdGNoZXMgWzAxLTA3XSBz
aG91bGQgbm90IGNoYW5nZSB0aGUgYWN0dWFsIGJlaGF2aW9yCj4gPiA+ID4gPiBhbmQgaW50cm9k
dWNlIGEgcHJvcGVyIHBhbmZyb3N0X2RldmZyZXEgc3RydWN0Lgo+ID4gPiA+ID4KPiA+ID4gPiA+
IFJlZ2FyZHMsCj4gPiA+ID4gPiBDbMOpbWVudAo+ID4gPiA+ID4KPiA+ID4gPiA+IENoYW5nZXMg
c2luY2UgdjQ6Cj4gPiA+ID4gPiAgLSBGaXggbWlzc2VkIGEgcGZkZXYgdG8gJnBmZGV2LT5kZXZm
cmVxIGR1cmluZyByZWJhc2UKPiA+ID4gPiA+Cj4gPiA+ID4gPiBDaGFuZ2VzIHNpbmNlIHYzOgo+
ID4gPiA+ID4gIC0gQ29sbGVjdCBTdGV2ZW4gUHJpY2UgcmV2aWV3ZWQtYnkgdGFncwo+ID4gPiA+
ID4gIC0gUmViYXNlIG9uIG5leHQvbWFzdGVyIChuZXh0LTIwMjAwNzA5KQo+ID4gPiA+ID4KPiA+
ID4gPiA+IENoYW5nZXMgc2luY2UgdjI6Cj4gPiA+ID4gPiAgLSBDb2xsZWN0IEFseXNzYSBSb3Nl
bnp3ZWlnIHJldmlld2VkLWJ5IHRhZ3MKPiA+ID4gPiA+ICAtIEZpeCBvcHBfc2V0X3JlZ3VsYXRv
ciBiZWZvcmUgYWRkaW5nIG9wcF90YWJsZSAoaW50cm9kdWNlIGluIHYyKQo+ID4gPiA+ID4gIC0g
Q2FsbCBlcnJfZmluaSBpbiBjYXNlIG9wcF9hZGRfdGFibGUgZmFpbGVkCj4gPiA+ID4gPgo+ID4g
PiA+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+ID4gPiA+ICAtIENvbGxlY3QgU3RldmVuIFByaWNl
IHJldmlld2VkLWJ5IHRhZ3MKPiA+ID4gPiA+ICAtIEZpeCBzcGlubG9jayBjb21tZW50Cj4gPiA+
ID4gPiAgLSBEcm9wIE9QUCBjbG9jay1uYW1lIHBhdGNoCj4gPiA+ID4gPiAgLSBEcm9wIGRldmlj
ZV9wcm9wZXJ0eV90ZXN0IHBhdGNoCj4gPiA+ID4gPiAgLSBBZGQgcmVuYW1lIGVycm9yIGxhYmVs
cyBwYXRjaAo+ID4gPiA+ID4KPiA+ID4gPiA+IENsw6ltZW50IFDDqXJvbiAoMTQpOgo+ID4gPiA+
ID4gICBkcm0vcGFuZnJvc3Q6IGF2b2lkIHN0YXRpYyBkZWNsYXJhdGlvbgo+ID4gPiA+ID4gICBk
cm0vcGFuZnJvc3Q6IGNsZWFuIGhlYWRlcnMgaW4gZGV2ZnJlcQo+ID4gPiA+ID4gICBkcm0vcGFu
ZnJvc3Q6IGRvbid0IHVzZSBwZmRldmZyZXEuYnVzeV9jb3VudCB0byBrbm93IGlmIGh3IGlzIGlk
bGUKPiA+ID4gPiA+ICAgZHJtL3BhbmZyb3N0OiBpbnRyb2R1Y2UgcGFuZnJvc3RfZGV2ZnJlcSBz
dHJ1Y3QKPiA+ID4gPiA+ICAgZHJtL3BhbmZyb3N0OiB1c2Ugc3BpbmxvY2sgaW5zdGVhZCBvZiBh
dG9taWMKPiA+ID4gPiA+ICAgZHJtL3BhbmZyb3N0OiBwcm9wZXJseSBoYW5kbGUgZXJyb3IgaW4g
cHJvYmUKPiA+ID4gPiA+ICAgZHJtL3BhbmZyb3N0OiByZW5hbWUgZXJyb3IgbGFiZWxzIGluIGRl
dmljZV9pbml0Cj4gPiA+ID4gPiAgIGRybS9wYW5mcm9zdDogbW92ZSBkZXZmcmVxX2luaXQoKS9m
aW5pKCkgaW4gZGV2aWNlCj4gPiA+ID4gPiAgIGRybS9wYW5mcm9zdDogZHluYW1pY2FsbHkgYWxs
b2MgcmVndWxhdG9ycwo+ID4gPiA+ID4gICBkcm0vcGFuZnJvc3Q6IGFkZCByZWd1bGF0b3JzIHRv
IGRldmZyZXEKPiA+ID4gPiA+ICAgYXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxlIGRldmZyZXEgY29v
bGluZyBkZXZpY2UKPiA+ID4gPiA+ICAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBoNjogQWRkIGNv
b2xpbmcgbWFwIGZvciBHUFUKPiA+ID4gPiA+ICAgW0RPIE5PVCBNRVJHRV0gYXJtNjQ6IGR0czog
YWxsd2lubmVyOiBoNjogQWRkIEdQVSBPUFAgdGFibGUKPiA+ID4gPiA+ICAgW0RPIE5PVCBNRVJH
RV0gYXJtNjQ6IGR0czogYWxsd2lubmVyOiBmb3JjZSBHUFUgcmVndWxhdG9yIHRvIGJlIGFsd2F5
cwo+ID4gPiA+Cj4gPiA+ID4gUGF0Y2hlcyAxLTEwIGFwcGxpZWQgdG8gZHJtLW1pc2MuCj4gPiA+
Cj4gPiA+IFRoaXMgc2VyaWUgaGFzIGJlZW4gc3VwZXJzZWRlZCBieSB2NS4KPiA+ID4KPiA+ID4g
Q291bGQgeW91IGFwcGx5IHRoZSB2NSBpbnN0ZWFkLgo+ID4KPiA+IE91cHMgZm9yZ2V0IG15IGVt
YWlsCj4gPgo+ID4gSSBnb3QgYW4gaXNzdWUgd2l0aCBteSBnbWFpbC4uLgo+Cj4gZHJtLW1pc2Mg
aXMgYSBub24tcmViYXNpbmcgdHJlZSAoYmVjYXVzZSBpdCdzIGdvdCBsb3RzIG9mCj4gbWFpbnRh
aW5lcnMvY29tbWl0dGVycykuIFdoaWNoIG1lYW5zIHdlIG5lZWQgZml4dXAgcGF0Y2hlcyBub3cu
Cj4KPiBOb3QgdGhhdCBjdXJyZW50bHkgZHJtLW1pc2MtbmV4dCBpc24ndCBpbiBsaW51eC1uZXh0
IGJlY2F1c2Ugb2YgdGhlIG1lcmdlCj4gd2luZG93LCBzbyBqdXN0IHJlYmFzaW5nIG9uIHRvcCBv
ZiBsaW51eC1uZXh0IHdvbnQgd29yayAoYXQgbGVhc3Qgbm90Cj4gdW50aWwgLXJjMSBpcyBvdXQp
LiBZb3UgY2FuIGdldCB0aGUgdHJlZSBoZXJlIG1lYW53aGlsZToKPgo+IGh0dHBzOi8vY2dpdC5m
cmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjLwoKSSBhcHBsaWVkIHY1IHNvIHRoZXJlJ3Mgbm90
aGluZyB0byBkby4gVGhlIGdtYWlsIGlzc3VlIHdhcyBnbWFpbCBwdXQKdjQgYW5kIHY1IGluIHRo
ZSBzYW1lIGNvbnZlcnNpb24gKHVuZGVyIHY0KSB3aGljaCBpdCBsaWtlcyB0byBkbwpzb21ld2hh
dCByYW5kb21seSBhbmQgd2l0aCBubyByZWdhcmQgdG8gYWN0dWFsIHRocmVhZGluZy4gOigKClJv
YgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
