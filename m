Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81FE34E212
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 09:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D446E865;
	Tue, 30 Mar 2021 07:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCB96E865
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 07:23:30 +0000 (UTC)
Date: Tue, 30 Mar 2021 07:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1617089008;
 bh=uyxiiNlmIpUqH5pV51j68OH6R9OIx2NMn7HBlqoxjWA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=rmdyZIi1rI9f6E7lkoqWOHQnEjeuf+fMw8xGgnB1pafJJytQTJHD08d6TnZpwCV1H
 wn50aEcMlFQFsPnYEiQDxK6CeQLGIgJW6Qi8nTjEeVHD9tF33Gy87vur4wU7cEIPRQ
 IdYxvkfa1ksytU6Lw2iGx/qHe60sKXHcaQIsJUKjjVh1LvKVeCiQOYzF++BXrLvqty
 7XyzUWtBa1ijJ2T3m+BY32SwGVYvwjc47hrmQBMRYbUYt+fHRoB2bDouMO6Mh3zCcc
 oE8jjvWgpnJsV+Chm84hVMT9LjE3vpqIQ9T7v30RoNto1nezDwANJEBqW7gffXtGaw
 ylJdCpXAOvwZA==
To: Paul Cercueil <paul@crapouillou.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm/ingenic: Switch IPU plane to type OVERLAY
Message-ID: <BH3N8QICMyp64pmUQyXLwYMnCNBvXxThwvKJIOmyMU0XIgTtorcGd7s7AjnIFXQrLGEoJMuvPcWTiv38syiYOTCDv-bSxswFBX6y3UYqTwE=@emersion.fr>
In-Reply-To: <20210329175046.214629-2-paul@crapouillou.net>
References: <20210329175046.214629-1-paul@crapouillou.net>
 <20210329175046.214629-2-paul@crapouillou.net>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, od@zcrc.me, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJdCBzaG91bGQgaGF2ZSBiZWVuIGFuIE9WRVJMQVkgZnJvbSB0aGUgYmVnaW5uaW5nLiBUaGUg
ZG9jdW1lbnRhdGlvbgo+IHN0aXB1bGF0ZXMgdGhhdCB0aGVyZSBzaG91bGQgYmUgYW4gdW5pcXVl
IFBSSU1BUlkgcGxhbmUgcGVyIENSVEMuCgpUaGFua3MgZm9yIHRoZSBxdWljayBwYXRjaCEgT25l
IGNvbW1lbnQgYmVsb3figKYKCj4gRml4ZXM6IGZjMWFjZjMxN2IwMSAoImRybS9pbmdlbmljOiBB
ZGQgc3VwcG9ydCBmb3IgdGhlIElQVSIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAj
IDUuOCsKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5l
dD4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0tZHJ2LmMgfCAx
MSArKysrKy0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWlwdS5jICAg
ICB8ICAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJt
LWRydi5jIGIvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0tZHJ2LmMKPiBpbmRl
eCAyOTc0MmVjNWFiOTUuLjA5MjI1Yjc3MGJiOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdl
bmljL2luZ2VuaWMtZHJtLWRydi5jCj4gQEAgLTQxOSw3ICs0MTksNyBAQCBzdGF0aWMgdm9pZCBp
bmdlbmljX2RybV9wbGFuZV9lbmFibGUoc3RydWN0IGluZ2VuaWNfZHJtICpwcml2LAo+ICAJdW5z
aWduZWQgaW50IGVuX2JpdDsKPgo+ICAJaWYgKHByaXYtPnNvY19pbmZvLT5oYXNfb3NkKSB7Cj4g
LQkJaWYgKHBsYW5lLT50eXBlID09IERSTV9QTEFORV9UWVBFX1BSSU1BUlkpCj4gKwkJaWYgKHBs
YW5lICE9ICZwcml2LT5mMCkKCkkgZG9uJ3Qga25vdyBhYm91dCB0aGlzIGRyaXZlciBidXTigKYg
aXMgdGhpcyByZWFsbHkgdGhlIHNhbWUgYXMgdGhlIHByZXZpb3VzCmNvbmRpdGlvbj8gVGhlIHBy
ZXZpb3VzIGNvbmRpdGlvbiB3b3VsZCBtYXRjaCB0d28gcGxhbmVzLCB0aGlzIG9uZSBzZWVtcyB0
bwptYXRjaCBvbmx5IGEgc2luZ2xlIHBsYW5lLiBXaGF0IGFtIEkgbWlzc2luZz8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
