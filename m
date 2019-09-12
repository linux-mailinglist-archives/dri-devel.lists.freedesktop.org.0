Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0410B0CD7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 12:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3385D6ECAE;
	Thu, 12 Sep 2019 10:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CE36ECAE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 10:26:42 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E340733A;
 Thu, 12 Sep 2019 12:26:38 +0200 (CEST)
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
Date: Thu, 12 Sep 2019 11:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568283999;
 bh=2zUt4HB7PYMjMGgMKlMSLXGexV2OpGaqgU1pFFcT7js=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=H2mgjg+P/Ne5IOdvf7iQtkk3RBYP4Bor9aPnpsZzIr+HZP7vBNux9cMFB9cTXgKWQ
 LjZ/LYBoM6sYf52P+BrZn8GagFdig5JfyWL8v4VxXrqv1wjTORNbqmQByNLK4a7Vur
 DrjEJ7TqOuyvTyeAMUwojTQakHp/6LhMECxvuHA4=
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2VyZ2VpLAoKKHB1bGxpbmcgaW4gK0dlZXJ0IGZvciBoaXMgb3BpbmlvbiBvbiBjb21wYXRp
YmxlIHN0cmluZyB1c2FnZXMpCgpPbiAxMi8wOS8yMDE5IDExOjAwLCBTZXJnZWkgU2h0eWx5b3Yg
d3JvdGU6PiBIZWxsbyEKPiAKPiBPbiAxMS4wOS4yMDE5IDIyOjI1LCBLaWVyYW4gQmluZ2hhbSB3
cm90ZToKPiAKPj4gQWRkIGRpcmVjdCBzdXBwb3J0IGZvciB0aGUgcjhhNzc5ODAgKFYzSCkuCj4+
Cj4+IFRoZSBWM0ggc2hhcmVzIGEgY29tbW9uLCBjb21wYXRpYmxlIGNvbmZpZ3VyYXRpb24gd2l0
aCB0aGUgcjhhNzc5NzAKPj4gKFYzTSkgc28gdGhhdCBkZXZpY2UgaW5mbyBzdHJ1Y3R1cmUgaXMg
cmV1c2VkLgo+IAo+IMKgwqAgRG8gd2UgcmVhbGx5IG5lZWQgdG8gYWRkIHlldCBhbm90aGVyIGNv
bXBhdGlibGUgaW4gdGhpcyBjYXNlPwo+IEkganVzdCBhZGRlZCByOGE3Nzk3MCB0byB0aGUgY29t
cGF0aWJsZSBwcm9wIGluIHRoZSByOGE3Nzk4MCBEVC4gVGhhdCdzIHdoeQo+IGEgcGF0Y2ggbGlr
ZSB0aGlzIG9uZSBkaWRuJ3QgZ2V0IHBvc3RlZCBieSBtZS4KCkl0J3Mgbm90IGp1c3QgYWJvdXQg
dGhlIGNvbXBhdGlibGUgc3RyaW5nIGZvciBtZSBoZXJlLAoKVGhlcmUgaXMgbm8gaW5kaWNhdGlv
biBpbiB0aGUgZHJpdmVyIHRoYXQgaXQgc3VwcG9ydHMgdGhlIHI4YTc3OTgwLCBhbmQKbm8gY29t
bWVudCBpbiB0aGUgZHJpdmVyIHRvIGV4cGxhaW4gdGhhdCB0aGUgcjhhNzc5ODAgaXMgc2hhcmVk
IGJ5IHRoZQpyOGE3Nzk3MC4KClRoaXMgcGF0Y2ggbWFrZXMgdGhhdCBleHBsaWNpdCBhdCB0aGUg
ZHJpdmVyLgoKQWxzbyAtIEkgYW0gY29uc2lkZXJpbmcgc2VuZGluZyBhIHBhdGNoICh0aGF0IEkn
dmUgYWxyZWFkeSBjcmVhdGVkCmFueXdheSkgdG8gcmVtb3ZlIHRoZSByOGE3Nzk3MCByZWZlcmVu
Y2UgZnJvbSB0aGUKCiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTgwLmR0c2kg
ZmlsZS4KClRoaXMgaXMgdGhlICpvbmx5KiBub24gcjhhNzc5ODAgcmVmZXJlbmNlIGluIHRoaXMg
ZmlsZSwgc28gaXQgc2VlbXMgdmVyeQpvdXQgb2YgcGxhY2UuCgpJbiBmYWN0IG1vcmUgc28gdGhh
biB0aGF0IC0gZXhjZXB0IGZvciBhIHNlZW1pbmdseSBnbGFyaW5nIHR5cG8sIHRoYXQKSSdsbCBp
bnZlc3RpZ2F0ZSBhbmQgc2VuZCBhIHBhdGNoIGZvciBuZXh0LCB0aGlzIGlzIHRoZSAqb25seSog
Y3Jvc3Mtc29jCmNvbXBhdGlibGUgcmVmZXJlbmNlOgoKCgojIS9iaW4vc2gKCmZpbGVzPXI4YTc3
Ki5kdHNpCgpmb3IgZiBpbiAkZmlsZXM7CmRvCglzb2M9YGJhc2VuYW1lICRmIC5kdHNpIHwgc2Vk
ICdzLy0uKi8vJ2AKCWVjaG8gIkY6ICRmIHNvYzogJHNvYyI7CgoJIyBGaW5kIGFsbCByZWZlcmVu
Y2VzIHRvIGFsbCBzb2NzLCB0aGVuIGhpZGUgJ3RoaXMnIHNvYwoJZ3JlcCByOGE3NyAkZiB8IGdy
ZXAgLXYgJHNvYwpkb25lOwoKRmluZHMgOgoKPiBGOiByOGE3NzRhMS5kdHNpIHNvYzogcjhhNzc0
YTEKPiBGOiByOGE3NzRjMC5kdHNpIHNvYzogcjhhNzc0YzAKPiBGOiByOGE3Nzk1LWVzMS5kdHNp
IHNvYzogcjhhNzc5NQo+IEY6IHI4YTc3OTUuZHRzaSBzb2M6IHI4YTc3OTUKPiBGOiByOGE3Nzk2
LmR0c2kgc29jOiByOGE3Nzk2Cj4gRjogcjhhNzc5NjUuZHRzaSBzb2M6IHI4YTc3OTY1Cj4gICog
QmFzZWQgb24gcjhhNzc5Ni5kdHNpCj4gRjogcjhhNzc5NzAuZHRzaSBzb2M6IHI4YTc3OTcwCj4g
CQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHB3bS1yOGE3NzkwIiwgInJlbmVzYXMscHdtLXJjYXIi
Owo+IEY6IHI4YTc3OTgwLmR0c2kgc29jOiByOGE3Nzk4MAo+IAkJCQkgICAgICJyZW5lc2FzLGR1
LXI4YTc3OTcwIjsKPiBGOiByOGE3Nzk5MC5kdHNpIHNvYzogcjhhNzc5OTAKPiBGOiByOGE3Nzk5
NS5kdHNpIHNvYzogcjhhNzc5OTUKCi0tCktCCgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBLaWVyYW4g
QmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+IFsuLi5d
Cj4gCj4gTUJSLCBTZXJnZWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
