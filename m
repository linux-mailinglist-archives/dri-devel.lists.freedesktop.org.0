Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDBD8FADE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 08:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F216EAD9;
	Fri, 16 Aug 2019 06:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66886EADB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 06:24:06 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id j7so8662026ota.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 23:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UbemS0Z3+J8HDXKXNZjWi7HzzaHw4A8dNiqBV6V1Rck=;
 b=IYrqnLuzLb2IvIzTfg5ojWetGDBqpYGQBz5795kLQop84U+TYlYrzCAr36XFe7khxy
 Gtxojjfy5xrrWnxY2W99IXTbJDixQJBgnUD5ZCsZXO0tQblVaOWGhZOCLrss+UcK+O0F
 10sf7y+/TxHBFnc4cX9sSgS2Wt/tREctymb4hXPvjQzwsM0zSBj0xYqI5cZObX5CedKH
 sjs2XT1gEvJSDuVJMVBfyyY8Kz2f5g/0JrVGCKpurxf26zrxipM5FOnMvRGcYZpxosiy
 /FgVBTzQXAfHxkra95DjIxU6nQC6hYHTgR0W3p8TSTSexjL+NYKw7r2sTJwHbs8o75HT
 /Xtg==
X-Gm-Message-State: APjAAAVyqTF6G7LfFBiyq305Iz7h8vnKY68ZgZumGiYHP14GpAMWyvL5
 g3aHkO8fmMTBjGFxttZWm5Ut25vxUgPuxAxOV8+rsQ==
X-Google-Smtp-Source: APXvYqym4oO06UAaqAKOdwMX9+ZXUpuUmFqkjQr53j2qEVTw6wqvTfv6JC/8+4MTWKM7ZLy4wXnYnyZPWJJHKs0fIjE=
X-Received: by 2002:a9d:590d:: with SMTP id t13mr6769456oth.281.1565936646046; 
 Thu, 15 Aug 2019 23:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190816133132.6b37d7fa@canb.auug.org.au>
 <20190816044846.GA27781@ravnborg.org>
In-Reply-To: <20190816044846.GA27781@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 16 Aug 2019 08:23:54 +0200
Message-ID: <CAKMK7uFy2vtOpSNrJyPDp0mvPTEvTD3zw7_gTuWe6gRqj18FFg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UbemS0Z3+J8HDXKXNZjWi7HzzaHw4A8dNiqBV6V1Rck=;
 b=aP6TnlrWiVWmS2YmWqIbc6ujqbBXxF1RRQmqDdEDynDuT8y8e2+stArtXrzJF+NFCx
 ZpokzqOSnc2/SQ6T8ZJAvrwtp6xgbO/JPQQzVva9vWLalVQ2fjTke74PJiLH4nLAqGj9
 W+pc8NTOqySX8gyUKXzeeb3sQsIRngfvJIhzo=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgNjo0OCBBTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgU3RlcGhlbi4KPgo+IE9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0
IDAxOjMxOjMyUE0gKzEwMDAsIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4gPiBIaSBhbGwsCj4g
Pgo+ID4gQWZ0ZXIgbWVyZ2luZyB0aGUgZHJtLW1pc2MgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0
IGJ1aWxkICh4ODZfNjQKPiA+IGFsbG1vZGNvbmZpZykgcHJvZHVjZWQgdGhpcyB3YXJuaW5nOgo+
ID4KPiA+IHdhcm5pbmc6IHNhbWUgbW9kdWxlIG5hbWVzIGZvdW5kOgo+ID4gICBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC1uZWMtbmw4MDQ4aGwxMS5rbwo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbmVjLW5sODA0OGhsMTEua28KPiA+IHdh
cm5pbmc6IHNhbWUgbW9kdWxlIG5hbWVzIGZvdW5kOgo+ID4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC1zaGFycC1sczAzN3Y3ZHcwMS5rbwo+ID4gICBk
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMwMzd2N2R3MDEua28KPiA+IHdhcm5p
bmc6IHNhbWUgbW9kdWxlIG5hbWVzIGZvdW5kOgo+ID4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29t
YXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC1zb255LWFjeDU2NWFrbS5rbwo+ID4gICBkcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtc29ueS1hY3g1NjVha20ua28KPiA+IHdhcm5pbmc6IHNhbWUg
bW9kdWxlIG5hbWVzIGZvdW5kOgo+ID4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBm
Yi9kaXNwbGF5cy9wYW5lbC10cG8tdGQwMjh0dGVjMS5rbwo+ID4gICBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRlYzEua28KPiA+IHdhcm5pbmc6IHNhbWUgbW9kdWxlIG5h
bWVzIGZvdW5kOgo+ID4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5
cy9wYW5lbC10cG8tdGQwNDNtdGVhMS5rbwo+ID4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtdHBvLXRkMDQzbXRlYTEua28KPiA+Cj4gPiBJbnRyb2R1Y2VkIGJ5IGNvbW1pdHMKPiA+Cj4g
PiAgIGRmNDM5YWJlNjUwMSAoImRybS9wYW5lbDogQWRkIGRyaXZlciBmb3IgdGhlIE5FQyBOTDgw
NDhITDExIHBhbmVsIikKPiA+ICAgYzljZjRjMmEzYmQzICgiZHJtL3BhbmVsOiBBZGQgZHJpdmVy
IGZvciB0aGUgU2hhcnAgTFMwMzdWN0RXMDEgcGFuZWwiKQo+ID4gICAxYzhmYzNmMGM1ZDIgKCJk
cm0vcGFuZWw6IEFkZCBkcml2ZXIgZm9yIHRoZSBTb255IEFDWDU2NUFLTSBwYW5lbCIpCj4gPiAg
IDQxNWI4ZGQwODcxMSAoImRybS9wYW5lbDogQWRkIGRyaXZlciBmb3IgdGhlIFRvcHBvbHkgVEQw
MjhUVEVDMSBwYW5lbCIpCj4gPiAgIGRjMmUxZTViMjc5OSAoImRybS9wYW5lbDogQWRkIGRyaXZl
ciBmb3IgdGhlIFRvcHBvbHkgVEQwNDNNVEVBMSBwYW5lbCIpCj4KPiBVcHMsIGhhZCBub3Qgc2Vl
biB0aGlzIG9uZSBjb21pbmcuCj4gV2UgYXJlIGluIHRoZSBwcm9jZXNzIG9mIHJlbW92aW5nIHRo
ZSBkcml2ZXJzIGluIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiLwo+IGFuZCBkZWNp
ZGVkIHRvIGludHJvZHVjZSB0aGUgbmV3IGRyaXZlcnMgZWFybHkgdG8gZ2V0IHRoZW0gb3V0IG9m
IGEKPiBsb25nZXIgcGF0Y2ggc2VyaWVzLgoKU2hvdWxkIHdlIGhhdmUgYSBjb25maWcgZGVwZW5k
ZW5jeSB0byBub3QgYWxsb3cgdGhlIG9sZCBmYmRldiBvbWFwCndoZW4gdGhlIGRybSBvbWFwIGRy
aXZlciBpcyBlbmFibGVkPyBJIHRoaW5rIHRoYXQgd291bGQgdGFrZSBjYXJlIG9mCmFsbCB0aGlz
LgoKT3IgdG9vIGFubm95aW5nIGZvciBkZXZlbG9wbWVudD8KCkFsc28gbm90ZSB0aGF0IGZiZGV2
IGlzIGluIGRybS1taXNjIG5vdywgc28gd2Ugc2hvdWxkIGJlIGFibGUgdG8gZml4CnRoaXMgYWxs
IHdpdGhvdXQgY3Jvc3MtdHJlZSBjb25mbGljdHMuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4
IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
