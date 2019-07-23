Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8DF71413
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 10:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828E06E294;
	Tue, 23 Jul 2019 08:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E376E294
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 08:38:52 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BF6A080480;
 Tue, 23 Jul 2019 10:38:48 +0200 (CEST)
Date: Tue, 23 Jul 2019 10:38:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 0/4] video: of: display_timing: Adjust err printing of
 of_get_display_timing()
Message-ID: <20190723083847.GA32268@ravnborg.org>
References: <20190722182439.44844-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722182439.44844-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
 a=7gkXJVJtAAAA:8 a=j5P04vaaSkZOzqOPo0QA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Z2guCgpPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAxMToyNDozNUFNIC0wNzAwLCBEb3Vn
bGFzIEFuZGVyc29uIHdyb3RlOgo+IEFzIHJlcG9ydGVkIGJ5IFNhbSBSYXZuYm9yZyBbMV0sIGFm
dGVyIGNvbW1pdCBiOGEyOTQ4ZmEyYjMKPiAoImRybS9wYW5lbDogc2ltcGxlOiBBZGQgYWJpbGl0
eSB0byBvdmVycmlkZSB0eXBpY2FsIHRpbWluZyIpIHdlIG5vdwo+IHNlZSBhIHBvaW50bGVzcyBl
cnJvciBtZXNzYWdlIHByaW50ZWQgb24gZXZlcnkgYm9vdCBmb3IgbWFueSBzeXN0ZW1zLgo+IExl
dCdzIGZpeCB0aGF0IGJ5IGFkanVzdGluZyB3aG8gaXMgcmVzcG9uc2libGUgZm9yIHByaW50aW5n
IGVycm9yCj4gbWVzc2FnZXMgd2hlbiBvZl9nZXRfZGlzcGxheV90aW1pbmcoKSBpcyB1c2VkLgo+
IAo+IE1vc3QgY2VydGFpbmx5IHdlIGNhbiBiaWtlc2hlZCB0aGUgdG9waWMgYWJvdXQgd2hldGhl
ciB0aGlzIGlzIHRoZQo+IHJpZ2h0IGZpeCBvciB3ZSBzaG91bGQgaW5zdGVhZCBhZGQgbG9naWMg
dG8gcGFuZWxfc2ltcGxlX3Byb2JlKCkgdG8KPiBhdm9pZCBjYWxsaW5nIG9mX2dldF9kaXNwbGF5
X3RpbWluZygpIGluIHRoZSBjYXNlIHdoZXJlIHRoZXJlIGlzIG5vCj4gInBhbmVsLXRpbWluZyIg
c3ViLW5vZGUuICBJZiB0aGVyZSBpcyBjb25zZW5zdXMgdGhhdCBJIHNob3VsZCBtb3ZlIHRoZQo+
IGZpeCB0byBwYW5lbF9zaW1wbGVfcHJvYmUoKSBJJ20gaGFwcHkgdG8gc3BpbiB0aGlzIHNlcmll
cy4gIEluIHRoYXQKPiBjYXNlIHdlIHByb2JhYmx5IHNob3VsZCBfcmVtb3ZlXyB0aGUgZXh0cmEg
cHJpbnRzIHRoYXQgd2VyZSBhbHJlYWR5Cj4gcHJlc2VudCBpbiB0aGUgb3RoZXIgdHdvIGNhbGxl
cnMgb2Ygb2ZfZ2V0X2Rpc3BsYXlfdGltaW5nKCkuCj4gCj4gV2hpbGUgYXQgaXQsIGZpeCBhIG1p
c3Npbmcgb2Zfbm9kZV9wdXQoKSBmb3VuZCBieSBjb2RlIGluc3BlY3Rpb24uCj4gCj4gTk9URTog
YW1iYS1jbGNkIGFuZCBwYW5lbC1sdmRzIHdlcmUgb25seSBjb21waWxlLXRlc3RlZC4KPiAKPiBb
MV0gaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDE5MDcyMTA5MzgxNS5HQTQzNzVAcmF2bmJv
cmcub3JnCj4gCj4gCj4gRG91Z2xhcyBBbmRlcnNvbiAoNCk6Cj4gICB2aWRlbzogb2Y6IGRpc3Bs
YXlfdGltaW5nOiBBZGQgb2Zfbm9kZV9wdXQoKSBpbgo+ICAgICBvZl9nZXRfZGlzcGxheV90aW1p
bmcoKQo+ICAgdmlkZW86IG9mOiBkaXNwbGF5X3RpbWluZzogRG9uJ3QgeWVsbCBpZiBubyB0aW1p
bmcgbm9kZSBpcyBwcmVzZW50Cj4gICBkcm06IHBhbmVsLWx2ZHM6IFNwb3V0IGFuIGVycm9yIGlm
IG9mX2dldF9kaXNwbGF5X3RpbWluZygpIGdpdmVzIGFuCj4gICAgIGVycm9yCj4gICB2aWRlbzog
YW1iYS1jbGNkOiBTcG91dCBhbiBlcnJvciBpZiBvZl9nZXRfZGlzcGxheV90aW1pbmcoKSBnaXZl
cyBhbgo+ICAgICBlcnJvcgoKU2VyaWVzIGxvb2tzIGdvb2QgLSB0aGFua3MuClJldmlld2VkLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgpZb3UgY291bGQgY29uc2lkZXIgc2ls
ZW5jaW5nIGRpc3BsYXlfdGltaW5nIGFzIHRoZSBsYXN0IHBhdGNoLCBidXQgdGhhdHMKYSB2ZXJ5
IHNtYWxsIGRldGFpbC4KCkhvdyBkbyB3ZSBhcHBseSB0aGVzZSBmaXhlcyAtIHRvIGRybS1taXNj
LW5leHQ/IEJhcnRsb21pZWo/CgpObyBuZWVkIHRvIGdvIGluIHZpYSBkcm0tbWlzYy1maXhlcyBh
cyB0aGUgb2ZmZW5kaW5nIGNvbW1pdCBpcyBvbmx5IGluCmRybS1taXNjLW5leHQuCgoJU2FtCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
