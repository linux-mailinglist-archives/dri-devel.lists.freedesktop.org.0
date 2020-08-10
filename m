Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8E32413E1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 01:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC2B6E05C;
	Mon, 10 Aug 2020 23:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016246E05C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 23:35:24 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 832BD20768
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 23:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597102524;
 bh=mUFFmkou94l0+oI7TalaQjtTqBSFTvrCHtwnmz6LL0A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vBW9u2mlbk5HoC5arbS7XOKaq/n3mNVP07JZtF9T6scT1DVVIeBJqU1VYp5xuk/Yn
 4FBVO3aOU5SVhzZLb1x+ovVr9CuYnZuaAJAbppWuHOUphiM+H4QnI3UuYWb5JrcMPm
 L/7l50z+giBwjQtpb4bayVeukl18kzJK9afq3cWY=
Received: by mail-ej1-f52.google.com with SMTP id g19so11106600ejc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 16:35:24 -0700 (PDT)
X-Gm-Message-State: AOAM531wejw1nFRtSmfzEVxD5cpB51dWCp/qFyEA06WsH0EjjrGIkmEl
 k+MkYgZ7IVgMI52zc4ZDYm5aQNFSocq3jbKCtg==
X-Google-Smtp-Source: ABdhPJwBk2x2WfFrL8VJcib6l0+cEkseFLtLxcww+LQRp8tRkSoMlZaGe/disJzE6QbWTXApPzJSvByWzdkYXp0Lx7g=
X-Received: by 2002:a17:906:2356:: with SMTP id
 m22mr23377263eja.124.1597102523075; 
 Mon, 10 Aug 2020 16:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1596855231-5782-4-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 11 Aug 2020 07:35:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY____7Yd1Gh-22oiOxsvftBjOHQ0T9CmKtGw6XLjw11gcQ@mail.gmail.com>
Message-ID: <CAAOTY____7Yd1Gh-22oiOxsvftBjOHQ0T9CmKtGw6XLjw11gcQ@mail.gmail.com>
Subject: Re: [RESEND v7, PATCH 3/7] mtk-mmsys: add mmsys private data
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDjmnIg45pelIOmAseWFrSDkuIrljYgxMDo1NuWvq+mBk++8mgo+Cj4gdGhl
IHJlYXNvbiB3aHkgc3BsaXQgb3V0IGRpc3BsYXkgY29ubmVjdGlvbiBmdW5jdGlvbjoKPiAxLiB0
aGVyZSB3aWxsIG1vcmUgYW5kIG1vcmUgTWVkaWF0ZWsgU29jIHVwc3RyZWFtLCBhbmQgdGhlIGRp
c3BsYXkgcGF0aAo+IGNvbm5lY3Rpb24gZnVuY3Rpb24gbXRrX21tc3lzX2RkcF9tb3V0X2VuLCBt
dGtfbW1zeXNfZGRwX3NlbF9pbiBhbmQKPiBtdGtfbW1zeXNfZGRwX3NvdXRfc2VsIHdpbGwgY29t
cGxpY2F0ZWQgbW9yZSBhbmQgbW9yZQo+IDIuIG1hbnkgb2YgdGhlIGNvbm5lY3Rpb24gYXJlIG9u
bHkgdXNlZCBpbiBzb21lIFNvQywgYW5kIHVzZWxlc3MgZm9yCj4gb3RoZXIgU29DIGFuZCBub3Qg
cmVhZGFibGUsCj4gMy4gaWYgd2UgYWRkIGEgbmV3IFNvQyBjb25uZWN0aW9uLCB3ZSBuZWVkIGNo
ZWNrIGlzIHRoaXMgYWZmZWN0IG90aGVyCj4gU29jCj4KPiB0aGUgcmVhc29uIHdoeSBub3QgYXBw
bHkgdGhlIHByZXZpb3VzIHNlcmllcyBtZXRob2Q6Cj4gdGhpcyB2ZXJzaW9uIGlzIG1vcmUgcmVh
ZGFibGUgYW5kIGNsZWFyCj4gaWYgZ28gb24gdXNlIHY2LCBleGNlcHQgbXQyNzAxL210ODE3My9t
dDI3MTIsIHdlIG5lZWQgYWRkIHR3byBtb3JlCj4gcHJpdmF0ZSBkYXRhIGFycmF5IGZvciBtdDY3
NzkgYW5kIG10Njc5NywgYW5kIHRoZSBjb25uZWN0IGZ1bmN0aW9uCj4gd2lsbCBhZGQgbW9yZSBp
Zi9lbHNlIHVzZWNhc2UKPgo+IG1vdmUgY3VycmVudCBkaXNwbGF5IGNvbm5lY3Rpb24gZnVuY3Rp
b24gaW50byBtdDI3MDEtbW1zeXMuYwo+IGtlZXAgbXQyNzAxL210ODE3My9tdDI3MTIvbXQ2Nzc5
L210Njc5NyB3aXRoIG9yaWdpbmFsIHZlcnNpb24KPiBjb25uZWN0aW9uIGZ1bmN0aW9uCj4gdGhl
IGNvcnJlc3BvbmRlZCBTb0MgdXBzdHJlYW0gbWVtYmVyIHdpbGwgY29kaW5nIHRoZXNlIGFuZCB0
ZXN0IGl0Cj4gb24gdGhlIFNvQyBpZiBpdCBpcyBuZWVkLgo+CgpGb3IgdGhpcyBwYXRjaCwgSSBw
cmVmZXIgWzFdJ3MgaW1wbGVtZW50YXRpb24uIEluIFsxXSwgZm9yIGVhY2ggU29DLAp0aGUgb25s
eSBkaWZmZXJlbmNlIGlzIGFuIGFycmF5IGZvciByb3V0aW5nIHJlZ2lzdGVyIHNldHRpbmcuIElu
IHRoaXMKcGF0Y2gsIHRoZSBkaWZmZXJlbmNlIGFyZSB0aHJlZSBmdW5jdGlvbiB3aGljaCBpcyBt
b3JlIGNvbXBsaWNhdGVkCnRoYW4gWzFdLiBJZiB5b3UgbGlrZSwgeW91IGNvdWxkIHBpY2sgWzFd
IHRvIHVwc3RyZWFtLgoKWzFdIGh0dHBzOi8vY2hyb21pdW0tcmV2aWV3Lmdvb2dsZXNvdXJjZS5j
b20vYy9jaHJvbWl1bW9zL3RoaXJkX3BhcnR5L2tlcm5lbC8rLzIzNDUxODYKClJlZ2FyZHMsCkNo
dW4tS3VhbmcuCgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVA
bWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9NYWtlZmlsZSAgICAg
ICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL21tc3lzL01ha2VmaWxlICAg
ICAgIHwgICAyICsKPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXQyNzAxLW1tc3lzLmMg
fCAyNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvc29jL21lZGlhdGVr
L210ay1tbXN5cy5jICAgICAgICAgIHwgMjcxICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaCAgICB8ICAxNSArKwo+
ICA1IGZpbGVzIGNoYW5nZWQsIDMxNCBpbnNlcnRpb25zKCspLCAyMjUgZGVsZXRpb25zKC0pCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5cy9NYWtlZmlsZQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXQyNzAxLW1t
c3lzLmMKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
