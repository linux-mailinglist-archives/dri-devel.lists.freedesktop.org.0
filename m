Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F044A1AD17D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 22:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA0E6E0E4;
	Thu, 16 Apr 2020 20:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06E86E0E4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 20:50:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 577CA97D;
 Thu, 16 Apr 2020 22:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587070224;
 bh=+3HruF7BWI3dgo7B6OhbPOuvAroBWE8pf/TumbaPCNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GOwCpuEhOVC5GevTvJXEoi/Qk7P1KlX897QfWZMYhfj4ComYApD7KvhqkllmU19mP
 QldRhosz0iZgv73AxKq3hbxz4Q1RDTJXLXX0uV0Pc3hFo4bxYuDTfakUEaiF0aWeID
 T94H6CCO0JaBNJsP6wmSzCTC6+UjjieK9mSOxKwQ=
Date: Thu, 16 Apr 2020 23:50:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder bridge
Message-ID: <20200416205012.GA28162@pendragon.ideasonboard.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
 <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
 <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LAoKT24gVGh1LCBBcHIgMTYsIDIwMjAgYXQgMTE6MjE6NDBQTSArMDMwMCwgRG1p
dHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDE2LjA0LjIwMjAgMjE6NTIsIERtaXRyeSBPc2lwZW5rbyDQ
v9C40YjQtdGCOgo+IC4uLgo+ID4+IE1heSBJIGFsc28gcmVjb21tZW5kIHN3aXRjaGluZyB0byB0
aGUgRFJNIHBhbmVsIGJyaWRnZSBoZWxwZXIgPyBJdCB3aWxsCj4gPj4gc2ltcGxpZnkgdGhlIGNv
ZGUuCj4gPiAKPiA+IENvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSB3aGF0IGlzIHRoZSAiRFJNIHBh
bmVsIGJyaWRnZSBoZWxwZXIiPwo+ID4gCj4gPiBJIHRoaW5rIHdlIHdvbid0IG5lZWQgYW55IGFk
ZGl0aW9uYWwgaGVscGVycyBhZnRlciBzd2l0Y2hpbmcgdG8gdGhlCj4gPiBicmlkZ2UgY29ubmVj
dG9yIGhlbHBlciwgbm8/Cj4gCj4gQWN0dWFsbHksIEkgbm93IHNlZSB0aGF0IHRoZSBwYW5lbCBu
ZWVkcyB0byBiZSBtYW51YWxseSBhdHRhY2hlZCB0byB0aGUKPiBjb25uZWN0b3IuCgpUaGUgRFJN
IHBhbmVsIGJyaWRnZSBoZWxwZXIgY3JlYXRlcyBhIGJyaWRnZSBmcm9tIGEgcGFuZWwgKHdpdGgK
ZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2FkZCgpKS4gWW91IGNhbiB0aGVuIGF0dGFjaCB0aGF0IGJy
aWRnZSB0byB0aGUKY2hhaW4sIGxpa2UgYW55IG90aGVyIGJyaWRnZSwgYW5kIHRoZSBlbmFibGUv
ZGlzYWJsZSBvcGVyYXRpb25zIHdpbGwgYmUKY2FsbGVkIGF1dG9tYXRpY2FsbHkgd2l0aG91dCBh
bnkgbmVlZCB0byBjYWxsIHRoZSBwYW5lbCBlbmFibGUvZGlzYWJsZQptYW51YWxseSBhcyBkb25l
IGN1cnJlbnRseS4KCj4gU3RpbGwgaXQncyBub3QgYXBwYXJlbnQgdG8gbWUgaG93IHRvIGdldCBw
YW5lbCBvdXQgb2YgdGhlIGJyaWRnZS4gSXQKPiBsb29rcyBsaWtlIHRoZXJlIGlzIG5vIHN1Y2gg
InBhbmVsIGhlbHBlciIgZm9yIHRoZSBicmlkZ2UgQVBJIG9yIEkganVzdAo+IGNhbid0IGZpbmQg
aXQuCgpZb3UgZG9uJ3QgbmVlZCB0byBnZXQgYSBwYW5lbCBvdXQgb2YgdGhlIGJyaWRnZS4gWW91
IHNob3VsZCBnZXQgdGhlCmJyaWRnZSBhcyBkb25lIHRvZGF5LCBhbmQgd3JhcCBpdCBpbiBhIGJy
aWRnZSB3aXRoCmRldm1fZHJtX3BhbmVsX2JyaWRnZV9hZGQoKS4KCi0tIApSZWdhcmRzLAoKTGF1
cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
