Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F2823D5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 19:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67896E51D;
	Mon,  5 Aug 2019 17:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137996E51D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 17:17:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29DD32F9;
 Mon,  5 Aug 2019 19:17:21 +0200 (CEST)
Date: Mon, 5 Aug 2019 20:17:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2] drm: rcar_lvds: Fix dual link mode operations
Message-ID: <20190805171719.GB13149@pendragon.ideasonboard.com>
References: <20190805161837.11856-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805161837.11856-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565025441;
 bh=yqTebMyCVqyE1EO2DbL4pb0qQVnsJgnd8Hudm4zbpI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KzhL5uP2lTRmeOD08ssZF8sSI8Mg9RYislg0FBa+9JrHroFxiuphxs5QPeA+kluDp
 W76dfIqlkutBAOqccjLBUYYqIHuE/JNH6jiJVMrELoaUqOLNMq3g5hL8p5PQtTGDEt
 gHbQUtRknGd/W6CCRNi1E2doOmMekIp2TCggA8DQ=
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
Cc: fabrizio.castro@bp.renesas.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBNb24sIEF1ZyAwNSwgMjAx
OSBhdCAwNjoxODozN1BNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gVGhlIFItQ2FyIExW
RFMgZW5jb2RlciB1bml0cyBzdXBwb3J0IGR1YWwtbGluayBvcGVyYXRpb25zIGJ5IHNwbGl0dGlu
Zwo+IHRoZSBwaXhlbCBvdXRwdXQgYmV0d2VlbiB0aGUgcHJpbWFyeSBlbmNvZGVyIGFuZCB0aGUg
Y29tcGFuaW9uIG9uZS4KCnMvY29tcGFuaW9uIG9uZS9jb21wYW5pb24gZW5jb2Rlci8KCj4gQ3Vy
cmVudGx5IHRoZSBjb21wYW5pb24gZW5jb2RlciBmYWlscyBhdCBwcm9iZSB0aW1lLCBjYXVzaW5n
IHRoZQo+IHJlZ2lzdHJhdGlvbiBvZiB0aGUgcHJpbWFyeSB0byBmYWlsIGFzIHdlbGwsIHByZXZl
bnRpbmcgdGhlIHdob2xlIERVIHVuaXQKPiBmcm9tIGJlaW5nIHJlZ2lzdGVyZWQgYXQgYWxsLgo+
IAo+IEZpeCB0aGlzIGJ5IG5vdCBiYWlsaW5nIG91dCBmcm9tIHByb2JlIHdpdGggZXJyb3IgaWYg
dGhlCj4gInJlbmVzYXMsY29tcGFuaW9uIiBwcm9wZXJ0eSBpcyBub3Qgc3BlY2lmaWVkLgo+IAo+
IEZpeGVzOiBmYTQ0MGQ4NzAzNTggKCJkcm06IHJjYXItZHU6IGx2ZHM6IEFkZCBzdXBwb3J0IGZv
ciBkdWFsLWxpbmsgbW9kZSIpCj4gUmVwb3J0ZWQtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6
aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8
amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgphbmQgYXBwbGllZCB0byBteSB0
cmVlLCB0aGFuayB5b3UuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2
ZHMuYyB8IDYgKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
bHZkcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiBpbmRleCBiYWRh
N2VlOTg1NDQuLjBiODcyZDAwNzYwYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2x2ZHMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZk
cy5jCj4gQEAgLTY2MiwxMCArNjYyLDggQEAgc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHRf
Y29tcGFuaW9uKHN0cnVjdCByY2FyX2x2ZHMgKmx2ZHMpCj4gCj4gIAkvKiBMb2NhdGUgdGhlIGNv
bXBhbmlvbiBMVkRTIGVuY29kZXIgZm9yIGR1YWwtbGluayBvcGVyYXRpb24sIGlmIGFueS4gKi8K
PiAgCWNvbXBhbmlvbiA9IG9mX3BhcnNlX3BoYW5kbGUoZGV2LT5vZl9ub2RlLCAicmVuZXNhcyxj
b21wYW5pb24iLCAwKTsKPiAtCWlmICghY29tcGFuaW9uKSB7Cj4gLQkJZGV2X2VycihkZXYsICJD
b21wYW5pb24gTFZEUyBlbmNvZGVyIG5vdCBmb3VuZFxuIik7Cj4gLQkJcmV0dXJuIC1FTlhJTzsK
PiAtCX0KPiArCWlmICghY29tcGFuaW9uKQo+ICsJCXJldHVybiAwOwo+IAo+ICAJLyoKPiAgCSAq
IFNhbml0eSBjaGVjazogdGhlIGNvbXBhbmlvbiBlbmNvZGVyIG11c3QgaGF2ZSB0aGUgc2FtZSBj
b21wYXRpYmxlCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
