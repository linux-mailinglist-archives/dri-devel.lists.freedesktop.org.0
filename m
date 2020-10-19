Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1454D2922E4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 09:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E5A6E8DC;
	Mon, 19 Oct 2020 07:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64026E8DC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 07:21:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E795AB0E;
 Mon, 19 Oct 2020 07:21:01 +0000 (UTC)
Subject: Re: [PATCH] au1100fb: Remove NULL pointer check before
 clk_enable/disable
To: Xu Wang <vulab@iscas.ac.cn>, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch
References: <20201014082137.23320-1-vulab@iscas.ac.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6cf83ff0-eeae-5646-b068-34dbacf2d961@suse.de>
Date: Mon, 19 Oct 2020 09:21:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201014082137.23320-1-vulab@iscas.ac.cn>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDE0LjEwLjIwIDEwOjIxLCBYdSBXYW5nIHdyb3RlOgo+IEJlY2F1c2UgY2xrX2VuYWJs
ZSwgY2xrX2Rpc2FibGUsIGNsa19wcmVwYXJlLCBhbmQgY2xrX3VucHJlcGFyZSBhbHJlYWR5Cj4g
Y2hlY2tlZCBOVUxMIGNsb2NrIHBhcmFtZXRlciwgc28gdGhlIGFkZGl0aW9uYWwgY2hlY2tzIGFy
ZSB1bm5lY2Vzc2FyeSwKPiBqdXN0IHJlbW92ZSB0aGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFh1
IFdhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPgoKU2FtIGNvbnZpbmNlZCBtZSB0byBtZXJnZSB0aGlz
IHBhdGNoIGFzLWlzIHdpdGggb3V0IHRoZSBhZGRpdGlvbmFsCmNsZWFudXAgb2YgdGhlIGRyaXZl
ci4gU28KClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KCkknbGwgbWVyZ2UgaXQgaW50byBkcm0tbWlzYy1uZXh0LgoKSSdkIHN0aWxsIGxpa2UgdG8g
ZW5jb3VyYWdlIHlvdSB0byBzZW5kIGEgcGF0Y2ggZm9yIHRoZSBvdGhlciBjbGtfKgpjYWxscyBp
biBhdTExMDBmYi4KCkJlc3QgcmVnYXJkClRob21hcwoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9m
YmRldi9hdTExMDBmYi5jIHwgNiArKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRl
di9hdTExMDBmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9hdTExMDBmYi5jCj4gaW5kZXggMzdh
NjUxMmZlZGEwLi4zNjU5ZGZiYjgxYzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRl
di9hdTExMDBmYi5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdTExMDBmYi5jCj4gQEAg
LTU2MCw4ICs1NjAsNyBAQCBpbnQgYXUxMTAwZmJfZHJ2X3N1c3BlbmQoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqZGV2LCBwbV9tZXNzYWdlX3Qgc3RhdGUpCj4gIAkvKiBCbGFuayB0aGUgTENEICov
Cj4gIAlhdTExMDBmYl9mYl9ibGFuayhWRVNBX1BPV0VSRE9XTiwgJmZiZGV2LT5pbmZvKTsKPiAg
Cj4gLQlpZiAoZmJkZXYtPmxjZGNsaykKPiAtCQljbGtfZGlzYWJsZShmYmRldi0+bGNkY2xrKTsK
PiArCWNsa19kaXNhYmxlKGZiZGV2LT5sY2RjbGspOwo+ICAKPiAgCW1lbWNweSgmZmJyZWdzLCBm
YmRldi0+cmVncywgc2l6ZW9mKHN0cnVjdCBhdTExMDBmYl9yZWdzKSk7Cj4gIAo+IEBAIC01Nzcs
OCArNTc2LDcgQEAgaW50IGF1MTEwMGZiX2Rydl9yZXN1bWUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqZGV2KQo+ICAKPiAgCW1lbWNweShmYmRldi0+cmVncywgJmZicmVncywgc2l6ZW9mKHN0cnVj
dCBhdTExMDBmYl9yZWdzKSk7Cj4gIAo+IC0JaWYgKGZiZGV2LT5sY2RjbGspCj4gLQkJY2xrX2Vu
YWJsZShmYmRldi0+bGNkY2xrKTsKPiArCWNsa19lbmFibGUoZmJkZXYtPmxjZGNsayk7Cj4gIAo+
ICAJLyogVW5ibGFuayB0aGUgTENEICovCj4gIAlhdTExMDBmYl9mYl9ibGFuayhWRVNBX05PX0JM
QU5LSU5HLCAmZmJkZXYtPmluZm8pOwo+IAoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
