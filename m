Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2339CF283F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E706EE9E;
	Thu,  7 Nov 2019 07:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 394 seconds by postgrey-1.36 at gabe;
 Wed, 06 Nov 2019 10:13:34 UTC
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75D16E1DE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 10:13:34 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 5EF88C635F; Wed,  6 Nov 2019 10:06:55 +0000 (GMT)
Date: Wed, 6 Nov 2019 10:06:55 +0000
From: Sean Young <sean@mess.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [RFC PATCH 00/12] i2c: replace i2c_new_probed_device with an
 ERR_PTR variant
Message-ID: <20191106100655.GA2743@gofer.mess.org>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
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
Cc: linux-fbdev@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTA6NTA6MThBTSArMDEwMCwgV29sZnJhbSBTYW5nIHdy
b3RlOgo+IEZyb206IFdvbGZyYW0gU2FuZyA8d3NhQHRoZS1kcmVhbXMuZGU+Cj4gCj4gSW4gdGhl
IG9uLWdvaW5nIG1pc3Npb24gdG8gbGV0IGkyY19uZXdfKiBjYWxscyByZXR1cm4gYW4gRVJSX1BU
UiBpbnN0ZWFkCj4gb2YgTlVMTCwgaGVyZSBpcyBhIHNlcmllcyBjb252ZXJ0aW5nIGkyY19uZXdf
cHJvYmVkX2RldmljZSgpLiBBIG5ldwo+IGZ1bmN0aW9uIGNhbGxlZCBpMmNfbmV3X3NjYW5uZWRf
ZGV2aWNlKCkgaXMgaW50cm9kdWNlZCB3aXRoIHRoZSBuZXcKPiByZXR2YWwsIGJ1dCBmb3Igbm93
LCBhIGNvbXBhdGliaWxpdHkgaGVscGVyIGlzIHByb3ZpZGVkIHVudGlsIGFsbCB1c2Vycwo+IGFy
ZSBjb252ZXJ0ZWQuIFRoZSByZXN0IG9mIHRoZSBwYXRjaGVzIGNvbnZlcnQgYWxsIGN1cnJlbnQg
aW4tdHJlZQo+IHVzZXJzLgo+IAo+IE5vdGUgdGhhdCB0aGVzZSBwYXRjaGVzIGFyZSBSRkMgYmVj
YXVzZSBJIHdhbnQgZmVlZGJhY2sgb24gdGhlIGFwcHJvYWNoCj4gYW5kIGhvcGVmdWxseSBjb2xs
ZWN0IGFja3Mgb24gdGhlIGRyaXZlciBjb252ZXJzaW9ucy4gSWYgYWxsIGdvZXMgd2VsbCwKPiBJ
J2xsIGFwcGx5IHRoZSBmaXJzdCB0d28gcGF0Y2hlcyBmb3IgdGhlIG5leHQgbWVyZ2Ugd2luZG93
LiBUaGVuLCBvbmNlCj4gdGhpcyBkZXBlbmRlbmN5IGlzIHVwc3RyZWFtLCBJJ2xsIHJlc2VuZCB0
aGlzIHNlcmllcyB3aXRoIGFsbCBpc3N1ZXMKPiBmaXhlZCBhbmQgYWNrcyBjb2xsZWN0ZWQuCgpU
aGUgcGF0Y2hlcyB0byBkcml2ZXJzL21lZGlhL3BjaS8qIGFyZSBhbGwgSVIgcmVsYXRlZCB3aGlj
aCBoYXZlIHRvdWNoZWQKb24vcmVhZCBvdmVyIHRoZSB5ZWFycy4gU28sIGZvciB0aG9zZToKCkFj
a2VkLWJ5OiBTZWFuIFlvdW5nIDxzZWFuQG1lc3Mub3JnPgoKPiAKPiBDb3JlIGNoYW5nZXMgdGVz
dGVkIG9uIGEgUmVuZXNhcyBTYWx2YXRvci1YUyBib2FyZCAoUi1DYXIgTTMtTiksIGRyaXZlcgo+
IHBhdGNoZXMgYnVpbGQgdGVzdGVkIGJ5IG1lIGFuZCBidWlsZGJvdC4KPiAKPiBXb2xmcmFtIFNh
bmcgKDEyKToKPiAgIGkyYzogcmVwbGFjZSBpMmNfbmV3X3Byb2JlZF9kZXZpY2Ugd2l0aCBhbiBF
UlJfUFRSIHZhcmlhbnQKPiAgIGkyYzogaWN5OiBjb252ZXJ0IHRvIGkyY19uZXdfc2Nhbm5lZF9k
ZXZpY2UKPiAgIG1hY2ludG9zaDogY29udmVydCB0byBpMmNfbmV3X3NjYW5uZWRfZGV2aWNlCj4g
ICBwbGF0Zm9ybTogY2hyb21lOiBjb252ZXJ0IHRvIGkyY19uZXdfc2Nhbm5lZF9kZXZpY2UKPiAg
IHZpZGVvOiBmYmRldjogbWF0cm94OiBjb252ZXJ0IHRvIGkyY19uZXdfc2Nhbm5lZF9kZXZpY2UK
PiAgIGlucHV0OiBtb3VzZTogY29udmVydCB0byBpMmNfbmV3X3NjYW5uZWRfZGV2aWNlCj4gICBt
ZWRpYTogcGNpOiBjeDIzODg1OiBjb252ZXJ0IHRvIGkyY19uZXdfc2Nhbm5lZF9kZXZpY2UKPiAg
IG1lZGlhOiBwY2k6IGN4ODg6IGNvbnZlcnQgdG8gaTJjX25ld19zY2FubmVkX2RldmljZQo+ICAg
bWVkaWE6IHBjaTogYnQ4eHg6IGNvbnZlcnQgdG8gaTJjX25ld19zY2FubmVkX2RldmljZQo+ICAg
bWVkaWE6IHBjaTogY3gxODogY29udmVydCB0byBpMmNfbmV3X3NjYW5uZWRfZGV2aWNlCj4gICBt
ZWRpYTogcGNpOiBpdnR2OiBjb252ZXJ0IHRvIGkyY19uZXdfc2Nhbm5lZF9kZXZpY2UKPiAgIG1l
ZGlhOiB2NGwyLWNvcmU6IGNvbnZlcnQgdG8gaTJjX25ld19zY2FubmVkX2RldmljZQo+IAo+ICBE
b2N1bWVudGF0aW9uL2kyYy9pbnN0YW50aWF0aW5nLWRldmljZXMucnN0IHwgMTAgKysrKy0tLS0t
Cj4gIERvY3VtZW50YXRpb24vaTJjL3dyaXRpbmctY2xpZW50cy5yc3QgICAgICAgfCAgOCArKyst
LS0tCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaWN5LmMgICAgICAgICAgICAgICAgfCAgOCAr
KystLS0tCj4gIGRyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYyAgICAgICAgICAgICAgICAgfCAy
NSArKysrKysrKysrKysrKysrLS0tLS0KPiAgZHJpdmVycy9pbnB1dC9tb3VzZS9wc21vdXNlLXNt
YnVzLmMgICAgICAgICB8ICA4ICsrKystLS0KPiAgZHJpdmVycy9tYWNpbnRvc2gvdGhlcm1fd2lu
ZHR1bm5lbC5jICAgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9tZWRpYS9wY2kvYnQ4eHgvYnR0
di1pbnB1dC5jICAgICAgICB8ICA2ICsrLS0tCj4gIGRyaXZlcnMvbWVkaWEvcGNpL2N4MTgvY3gx
OC1pMmMuYyAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL21lZGlhL3BjaS9jeDIzODg1L2N4
MjM4ODUtaTJjLmMgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL21lZGlhL3BjaS9jeDg4L2N4ODgt
aW5wdXQuYyAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2LWky
Yy5jICAgICAgICAgICB8ICA2ICsrLS0tCj4gIGRyaXZlcnMvbWVkaWEvcGNpL2l2dHYvaXZ0di1p
MmMuaCAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWky
Yy5jICAgICAgICAgIHwgMTAgKysrKy0tLS0tCj4gIGRyaXZlcnMvcGxhdGZvcm0vY2hyb21lL2No
cm9tZW9zX2xhcHRvcC5jICAgfCAxOCArKysrKysrKy0tLS0tLS0KPiAgZHJpdmVycy92aWRlby9m
YmRldi9tYXRyb3gvaTJjLW1hdHJveGZiLmMgICB8ICA0ICsrLS0KPiAgaW5jbHVkZS9saW51eC9p
MmMuaCAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysrKystLS0KPiAgMTYgZmlsZXMg
Y2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4y
MC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
