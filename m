Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A683EBFBF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FBC6F780;
	Fri,  1 Nov 2019 08:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F166F780
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 08:43:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [109.190.253.13])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86ADB4FF;
 Fri,  1 Nov 2019 09:43:27 +0100 (CET)
Date: Fri, 1 Nov 2019 10:43:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Overlay support in the i.MX7 display
Message-ID: <20191101084318.GA8428@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1572597807;
 bh=4HZer+bgw3Io66HHWMPfysuGO3XmlHQwp25qLz8++vY=;
 h=Date:From:To:Cc:Subject:From;
 b=J9g7NOZn/63xjhe3C5IaqwEZqRMU4nEPZVsEY9cT3J9nAIQfu32dFUg9FS3wfUu7l
 3/BVzkEHTz/5UMJHTadVpOz/43jahpHs7lum2N/JklMy+GS6rxUi13eLm/v851x0K8
 WEtydjcM+/Lhbfwwbz2OYL4rty6ark40r6+X9Ngk=
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

SGVsbG8sCgpJJ20gbG9va2luZyBhdCB0aGUgYXZhaWxhYmxlIG9wdGlvbnMgdG8gc3VwcG9ydCBv
dmVybGF5cyBpbiB0aGUgZGlzcGxheQpwaXBlbGluZSBvZiB0aGUgaS5NWDcuIFRoZSBMQ0RJRiBp
dHNlbGYgdW5mb3J0dW5hbHRleSBkb2Vzbid0IHN1cHBvcnQKb3ZlcmxheXMsIHRoZSBmZWF0dXJl
IGJlaW5nIGltcGxlbWVudGVkIGluIHRoZSBQWFAuIEEgZHJpdmVyIGZvciB0aGUgUFhQCmlzIGF2
YWlsYWJsZSBidXQgb25seSBzdXBwb3J0cyBvbGRlciBTb0NzIHdob3NlIFBYUCBkb2Vzbid0IHN1
cHBvcnQKb3ZlcmxheXMuIFRoaXMgZHJpdmVyIGlzIGltcGxlbWVudGVkIGFzIGEgVjRMMiBtZW0y
bWVtIGRyaXZlciwgd2hpY2gKbWFrZXMgc3VwcG9ydCBvZiBhZGRpdGlvbmFsIGlucHV0IGNoYW5u
ZWxzIGltcG9zc2libGUuCgpIZXJlIGFyZSB0aGUgb3B0aW9ucyBJIGNhbiBlbnZpc2lvbjoKCi0g
RXh0ZW5kIHRoZSBleGlzdGluZyBQWFAgZHJpdmVyIHRvIHN1cHBvcnQgbXVsdGlwbGUgY2hhbm5l
bHMuIFRoaXMgaXMKICB0ZWNobmljYWxseSBmZWFzaWJsZSwgYnV0IHdpbGwgcmVxdWlyZSBtb3Zp
bmcgYXdheSBmcm9tIHRoZSBWNEwyCiAgbWVtMm1lbSBmcmFtZXdvcmssIHdoaWNoIHdvdWxkIGJy
ZWFrIHVzZXJzcGFjZS4gSSBkb24ndCB0aGluayB0aGlzCiAgcGF0aCBjb3VsZCBsZWFkIGFueXdo
ZXJlLgoKLSBXcml0ZSBhIG5ldyBQWFAgZHJpdmVyIGZvciB0aGUgaS5NWDcsIHN0aWxsIHVzaW5n
IFY0TDIsIGJ1dCB3aXRoCiAgbXVsdGlwbGUgdmlkZW8gbm9kZXMuIFRoaXMgd291bGQgYWxsb3cg
YmxlbmRpbmcgbXVsdGlwbGUgbGF5ZXJzLCBidXQKICB3b3VsZCByZXF1aXJlIHdyaXRpbmcgdGhl
IG91dHB1dCB0byBtZW1vcnksIHdoaWxlIHRoZSBQWFAgaGFzIHN1cHBvcnQKICBmb3IgZGlyZWN0
IGNvbm5lY3Rpb25zIHRvIHRoZSBMQ0RJRiAodGhyb3VnaCBzbWFsbCBTUkFNIGJ1ZmZlcnMpLgog
IFBlcmZvcm1hbmNlcyB3b3VsZCB0aHVzIGJlIHN1Ym9wdGltYWwuIFRoZSBBUEkgd291bGQgYWxz
byBiZSBhd2t3YXJkLAogIGFzIHVzaW5nIHRoZSBQWFAgZm9yIGRpc3BsYXkgd291bGQgcmVxdWly
ZSB1c2FnZSBvZiBWNEwyIGluCiAgYXBwbGljYXRpb25zLgoKLSBFeHRlbmQgdGhlIG14c2ZiIGRy
aXZlciB3aXRoIFBYUCBzdXBwb3J0LCBhbmQgZXhwb3NlIHRoZSBQWFAgaW5wdXRzIGFzCiAgS01T
IHBsYW5lcy4gVGhlIFBYUCB3b3VsZCBvbmx5IGJlIHVzZWQgd2hlbiBhdmFpbGFibGUsIGFuZCB3
b3VsZCBiZQogIHRyYW5zcGFyZW50IHRvIGFwcGxpY2F0aW9ucy4gVGhpcyB3b3VsZCBob3dldmVy
IHByZXZlbnQgdXNpbmcgaXQKICBzZXBhcmF0ZWx5IGZyb20gdGhlIGRpc3BsYXkgKHRvIHBlcmZv
cm0gbXVsdGktcGFzcyBhbHBoYSBibGVuZGluZyBmb3IKICBpbnN0YW5jZSkuCgpXaGF0IHdvdWxk
IGJlIHRoZSBiZXN0IG9wdGlvbiBnb2luZyBmb3J3YXJkID8gV291bGQgYW55IG9mIHlvdSwgYnkg
YW55CmNoYW5jZSwgaGF2ZSBhbHJlYWR5IHN0YXJ0ZWQgd29yayBpbiB0aGlzIGFyZWEgPwoKLS0g
ClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
