Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C04813892A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 13:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC17889CC1;
	Fri,  7 Jun 2019 11:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A52389CC1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:37:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E7CD334;
 Fri,  7 Jun 2019 13:37:11 +0200 (CEST)
Date: Fri, 7 Jun 2019 14:36:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 03/20] dt-bindings: display, renesas, du: Update 'vsps' in
 example
Message-ID: <20190607113657.GC7593@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-4-jacopo+renesas@jmondi.org>
 <20190606165352.GK12825@pendragon.ideasonboard.com>
 <CAMuHMdVJEJ9Sehm5Ug4P+HW0iPYufPuYVD9vQ3qKg=htXFmuLg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVJEJ9Sehm5Ug4P+HW0iPYufPuYVD9vQ3qKg=htXFmuLg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559907431;
 bh=h8nNlFwztfsVZRShmhKejPLZbbtWBGar1pZQXZWtef4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QdVf2z/obGcSpSa+as048Dj+EKhXDVel+ZE/VzBlsyBBvw5KbscRuZhg1MGRoJoxl
 pt2QDbciEc/3qSjdG/cc9DMkPh0DR5wC2ecGDCTydSWrsc3HYOviYMNio2pCxlsn8h
 6aGYDtS8cQtAuxHnWSCzQBas9JAXkj1O7H9NEKdQ=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpPbiBUaHUsIEp1biAwNiwgMjAxOSBhdCAxMDowMDoyM1BNICswMjAwLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gT24gVGh1LCBKdW4gNiwgMjAxOSBhdCA4OjUwIFBNIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBUaHUsIEp1biAwNiwgMjAxOSBhdCAwNDoyMjow
M1BNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gPj4gVXBkYXRlIHRoZSAndnNwcycgcHJv
cGVydHkgc3RydWN0dXJlIGluIHRoZSBkb2N1bWVudGF0aW9uIGV4YW1wbGUgdG8KPiA+PiByZWZs
ZWN0IHdoYXQncyBhY3R1YWxseSBpbXBsZW1lbnRlZCBpbiB0aGUgZGV2aWNlIHRyZWUgc291cmNl
cy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNA
am1vbmRpLm9yZz4KPiAKPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0Cj4gPj4gQEAgLTkyLDcgKzkyLDcg
QEAgRXhhbXBsZTogUjhBNzc5NSAoUi1DYXIgSDMpIEVTMi4wIERVCj4gPj4gICAgICAgICAgICAg
ICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDcyMj4sCj4gPj4gICAgICAgICAgICAgICAgICAgICAg
ICA8JmNwZyBDUEdfTU9EIDcyMT47Cj4gPj4gICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJk
dS4wIiwgImR1LjEiLCAiZHUuMiIsICJkdS4zIjsKPiA+PiAtICAgICAgICAgICAgIHZzcHMgPSA8
JnZzcGQwIDA+LCA8JnZzcGQxIDA+LCA8JnZzcGQyIDA+LCA8JnZzcGQwIDE+Owo+ID4+ICsgICAg
ICAgICAgICAgdnNwcyA9IDwmdnNwZDAgMCAmdnNwZDEgMCAmdnNwZDIgICZ2c3BkMCAxPjsKPiA+
Cj4gPiBUaGUgZm9ybWVyIGlzIHNpbXBsZXIgdG8gcmVhZCB0aGFuIHRoZSBsYXR0ZXIgaW4gbXkg
b3Bpbmlvbi4gU2hvdWxkbid0Cj4gPiB3ZSB1cGRhdGUgdGhlIC5kdHNpIGZpbGVzIGluc3RlYWQg
Pwo+IAo+IFllcywgaXQgaXMgZWFzaWVyIHRvIHJlYWQgKGZvciBodW1hbnMpLgo+IAo+ID4+ICAg
ICAgICAgICAgICAgY21tcyA9IDwmY21tMCAmY21tMSAmY21tMiAmY21tMz47Cj4gCj4gUGVyaGFw
cyB3ZSB3YW50IGdyb3VwaW5nIGhlcmUsIHRvbz8KCkFzIHRoZXJlJ3MgYSBzaW5nbGUgZW50cnkg
cGVyIENNTSBpdCBtYXR0ZXJzIGxlc3MgaW4gbXkgb3Bpbmlvbi4gSSdtCmZpbmUgd2l0aCBlaXRo
ZXIgb3B0aW9ucy4KCj4gCj4gPj4KPiA+PiAgICAgICAgICAgICAgIHBvcnRzIHsKCi0tIApSZWdh
cmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
