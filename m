Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEE5175BA4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 14:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2597C6E40F;
	Mon,  2 Mar 2020 13:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674D16E40F;
 Mon,  2 Mar 2020 13:30:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF8E09D0;
 Mon,  2 Mar 2020 14:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583155848;
 bh=h7lt+W5qM9a89Ue8PxCQdmS0gGQg6iDuUSHEewzQ8EU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KGfZuxJIOguTnOtMq9Ea+enXp0OGp9yhu78jGRip4Rbz3JxZtpjXBpLPdp04eTz0z
 liLJ385Mw3H5yrnqseQLTb91BUE/RRXN150rbyMHqAJ8dnNpa7AzdnQykYILj/A8d0
 t8uQvBPW0+VAp9xHEY7ijOEGWBHHGS+b+yFSoFZg=
Date: Mon, 2 Mar 2020 15:30:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH 6/9] drm/nouveau: Fix unused variable warning
Message-ID: <20200302133023.GQ11960@pendragon.ideasonboard.com>
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200302125649.61443-7-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302125649.61443-7-pankaj.laxminarayan.bharadiya@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Manasi Navare <manasi.d.navare@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGFua2FqLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBNb24sIE1hciAwMiwgMjAy
MCBhdCAwNjoyNjo0NlBNICswNTMwLCBQYW5rYWogQmhhcmFkaXlhIHdyb3RlOgo+IG5vdXZlYXVf
ZHJtIHBvaW50ZXIgaXMgbm90IGdldHRpbmcgdXNlZCBhbnltb3JlIGluCj4gbnY1MF9tc3RtX3ty
ZWdpc3RlcixkZXN0cm95fV9jb25uZWN0b3IgZnVuY3Rpb25zLCBoZW5jZSByZW1vdmUgaXQuCj4g
Cj4gVGhpcyBmaXhlcyBiZWxvdyB3YXJuaW5nLgo+IAo+IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2Rpc3AuYzogSW4gZnVuY3Rpb24g4oCYbnY1MF9tc3RtX2Rlc3Ryb3lfY29ubmVj
dG9y4oCZOgo+IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzoxMjYzOjIy
OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYZHJt4oCZIFstV3VudXNlZC12YXJpYWJsZV0K
PiAgIHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0oY29ubmVjdG9yLT5kZXYp
Owo+ICAgICAgICAgICAgICAgICAgICAgICBefn4KPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmM6IEluIGZ1bmN0aW9uIOKAmG52NTBfbXN0bV9yZWdpc3Rlcl9jb25uZWN0
b3LigJk6Cj4gZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjEyNzQ6MjI6
IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhkcm3igJkgWy1XdW51c2VkLXZhcmlhYmxlXQo+
ICAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2RybShjb25uZWN0b3ItPmRldik7
Cj4gICAgICAgICAgICAgICAgICAgICAgIF5+fgoKQXMgY29tbWVudGVkIG9uIDcvOSwgeW91IHNo
b3VsZCBzcXVhc2ggdGhpcyB3aXRoIHRoZSBwYXRjaCB0aGF0CmludHJvZHVjZXMgdGhlIHdhcm5p
bmdzLgoKPiBTaWduZWQtb2ZmLWJ5OiBQYW5rYWogQmhhcmFkaXlhIDxwYW5rYWoubGF4bWluYXJh
eWFuLmJoYXJhZGl5YUBpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2Rpc3AuYyB8IDMgLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiBpbmRleCA5N2Rk
NTBlMjkxN2QuLjRlMTY0YWQ4MDAzZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNw
bnY1MC9kaXNwLmMKPiBAQCAtMTI2MCw3ICsxMjYwLDYgQEAgc3RhdGljIHZvaWQKPiAgbnY1MF9t
c3RtX2Rlc3Ryb3lfY29ubmVjdG9yKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdy
LAo+ICAJCQkgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgewo+IC0Jc3Ry
dWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2RybShjb25uZWN0b3ItPmRldik7Cj4gIAlz
dHJ1Y3QgbnY1MF9tc3RjICptc3RjID0gbnY1MF9tc3RjKGNvbm5lY3Rvcik7Cj4gIAo+ICAJZHJt
X2Nvbm5lY3Rvcl91bnJlZ2lzdGVyKCZtc3RjLT5jb25uZWN0b3IpOwo+IEBAIC0xMjcxLDggKzEy
NzAsNiBAQCBudjUwX21zdG1fZGVzdHJveV9jb25uZWN0b3Ioc3RydWN0IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyICptZ3IsCj4gIHN0YXRpYyB2b2lkCj4gIG52NTBfbXN0bV9yZWdpc3Rlcl9jb25u
ZWN0b3Ioc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgewo+IC0Jc3RydWN0IG5v
dXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2RybShjb25uZWN0b3ItPmRldik7Cj4gLQo+ICAJZHJt
X2Nvbm5lY3Rvcl9yZWdpc3Rlcihjb25uZWN0b3IpOwo+ICB9Cj4gIAoKLS0gClJlZ2FyZHMsCgpM
YXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
