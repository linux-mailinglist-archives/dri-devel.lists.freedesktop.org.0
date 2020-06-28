Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA69A20C6A1
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 09:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2A36E0AC;
	Sun, 28 Jun 2020 07:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837AA6E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 07:07:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F1BE4FB;
 Sun, 28 Jun 2020 09:07:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593328068;
 bh=ImFuBGjxJULNuw+yqvo5n5X0F7D3HfmoOWnUOSbRzm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mZWrQiCIL16vCYCEWGXxF5PFUeoYcRNgv6ZlEWX5oTEaRoSS/I30KYB7wW5Rm6RoK
 fYJznRM9kSQJlgZVYj0L5IQOB0OB+APHvUBdd6OS5lbbZM+bA6YdnbMMhH9jKhBhez
 ql+XjZI2kMN1PpOp+4cl1EiPcX4gCCbXnXUttJtM=
Date: Sun, 28 Jun 2020 10:07:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel-simple: Add missing BUS descriptions
 for some panels
Message-ID: <20200628070745.GC6954@pendragon.ideasonboard.com>
References: <20200621222742.25695-1-digetx@gmail.com>
 <20200621222742.25695-3-digetx@gmail.com>
 <20200627204338.GL5966@pendragon.ideasonboard.com>
 <dd1c5972-bbac-c2d8-76e8-08997b951e52@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd1c5972-bbac-c2d8-76e8-08997b951e52@gmail.com>
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
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LAoKT24gU3VuLCBKdW4gMjgsIDIwMjAgYXQgMDI6NDQ6MTVBTSArMDMwMCwgRG1p
dHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDI3LjA2LjIwMjAgMjM6NDMsIExhdXJlbnQgUGluY2hhcnQg
0L/QuNGI0LXRgjoKPiA+IE9uIE1vbiwgSnVuIDIyLCAyMDIwIGF0IDAxOjI3OjQyQU0gKzAzMDAs
IERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+PiBUaGlzIHBhdGNoIGFkZHMgbWlzc2luZyBCVVMg
ZmllbGRzIHRvIHRoZSBkaXNwbGF5IHBhbmVsIGRlc2NyaXB0aW9ucyBvZgo+ID4+IHRoZSBwYW5l
bHMgd2hpY2ggYXJlIGZvdW5kIG9uIE5WSURJQSBUZWdyYSBkZXZpY2VzOgo+ID4+Cj4gPj4gICAx
LiBBVU8gQjEwMUFXMDMKPiA+PiAgIDIuIENodW5naHdhIENMQUEwNzBXUDAzWEcKPiA+PiAgIDMu
IENodW5naHdhIENMQUExMDFXQTAxQQo+ID4+ICAgNC4gQ2h1bmdod2EgQ0xBQTEwMVdCMDEKPiA+
PiAgIDUuIElubm9sdXggTjE1NkJHRSBMMjEKPiA+PiAgIDYuIFNhbXN1bmcgTFROMTAxTlQwNQo+
ID4+Cj4gPj4gU3VnZ2VzdGVkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxk
aWdldHhAZ21haWwuY29tPgo+ID4+IC0tLQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2ltcGxlLmMgfCAxMiArKysrKysrKysrKysKPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+
PiBpbmRleCA4N2VkZDJiZGYwOWEuLjk4NmRmOTkzNzY1MCAxMDA2NDQKPiA+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+PiBAQCAtNjk4LDYgKzY5OCw4IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBhdW9fYjEwMWF3MDMgPSB7Cj4gPj4gIAkJLndpZHRoID0g
MjIzLAo+ID4+ICAJCS5oZWlnaHQgPSAxMjUsCj4gPj4gIAl9LAo+ID4+ICsJLmJ1c19mb3JtYXQg
PSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDdYM19TUFdHLAo+ID4+ICsJLmJ1c19mbGFncyA9IERS
TV9CVVNfRkxBR19ERV9ISUdIIHwgRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVfUE9TRURHRSwK
PiA+IAo+ID4gRG9lcyBEUk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV8qIG1ha2Ugc2Vuc2UgZm9y
IExWRFMgPwo+IAo+IFRvIGJlIGhvbmVzdCBJIGRvbid0IGtub3cgd2hldGhlciBpdCBtYWtlIHNl
bnNlIG9yIG5vdCBmb3IgTFZEUy4gSSBzYXcKPiB0aGF0IG90aGVyIExWRFMgcGFuZWxzIGluIHBh
bmVsLXNpbXBsZS5jIHVzZSB0aGUgUElYREFUQSBmbGFnIGFuZCB0aGVuCj4gbG9va2VkIGF0IHdo
YXQgdGltaW5nIGRpYWdyYW1zIGluIHRoZSBkYXRhc2hlZXRzIHNob3cuCgpJIHRoaW5rIHdlIHNo
b3VsZCBkcm9wIERSTV9CVVNfRkxBR19QSVhEQVRBX0RSSVZFXyogZm9yIExWRFMgcGFuZWxzLgpJ
J2xsIHN1Ym1pdCBhIHBhdGNoLgoKPiA+IFRoZSByZXN0IGxvb2tzIGdvb2QsIGV4Y2VwdCB0aGUg
U2Ftc3VuZyBwYW5lbCBmb3Igd2hpY2ggSSBoYXZlbid0IGJlZW4KPiA+IGFibGUgdG8gbG9jYXRl
IGEgZGF0YXNoZWV0Lgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IAo+IFRoYW5rcyB0byB5b3UgYW5kIFNh
bSEKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
