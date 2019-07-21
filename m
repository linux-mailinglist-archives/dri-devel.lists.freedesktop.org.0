Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49106F430
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2019 18:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D025789B22;
	Sun, 21 Jul 2019 16:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ECC89B22
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 16:48:51 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57356
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hpF0z-0005fb-RK; Sun, 21 Jul 2019 18:48:49 +0200
Subject: Re: [PATCH v1 1/1] drm/fb: remove unused function:
 drm_gem_fbdev_fb_create()
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20190721140610.GA20842@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <478b7a78-7469-037d-1376-749316cc060d@tronnes.org>
Date: Sun, 21 Jul 2019 18:48:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190721140610.GA20842@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=TX6jiQV+Bc6dRvz2y0VKlZjawRtWFX8N/iMHhuXaEc0=; 
 b=YdbcZsEsNXR0PHeaQ7kV7+UkoXDxFY75OVTdKQwwczRABMfDCuw59xIw4dutzNOtvWmX9zr2GI0wXZFEvM281+WeKUaRAsa7f4RjBLmOAv90NOZ2WW/dBiWwxAqklq5NokCCXGBCPFHhSlZMK8X4qhsbANkNBiHEfwUsWOes0TYRVlSskAf3+4igRL9JEIP+5qWFk2/89TfpZukNyza5SyNC08Ji1iF6fC1qcFD6kTOiqrbMbamkCllxoiKLR9Jj/5vf5bCAs7WKTgNHEFtmvL3DCxN4plZooNqpLz86oSfFtE+wZ9ggMtY8nPKM28ayQvvo+l4fviXdrHsW1WUPKQ==;
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjEuMDcuMjAxOSAxNi4wNiwgc2tyZXYgU2FtIFJhdm5ib3JnOgo+IEFmdGVyIG1pZ3Jh
dGluZyBzZXZlcmFsIGRyaXZlcnMgdG8gdGhlIGdlbmVyaWMgZmJkZXYgdGhlcmUgYXJlCj4gbm8g
dXNlcnMgbGVmdC4gIERlbGV0ZSB0aGUgZnVuY3Rpb24uCj4gCj4gTm90aWNlZCB0aGF0IHRoZXJl
IHdhcyBubyBjYWxsZXJzIHdoaWxlIGJyb3dzaW5nCj4gYXJvdW5kIGluIHRoZSBkcm1fZmIqIGNv
ZGUuCj4gCj4gTGFzdCB1c2VyIHdhcyByZW1vdmVkIHdpdGg6Cj4gY29tbWl0IDEzYWZmMTg0ZWQ5
ZiAoImRybS9xeGw6IHJlbW92ZSBkZWFkIHF4bCBmYmRldiBlbXVsYXRpb24gY29kZSIpCj4gY29t
bWl0IDI2ZDQ3MDdkNDQ1ZCAoImRybS9xeGw6IHVzZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiIp
CgpMaXN0aW5nIDIgY29tbWl0cyBmb3IgdGhlIHNhbWUgZHJpdmVyIHdhcyBjb25mdXNpbmcuIEkg
dGhpbmsgeW91IGNhbgpkcm9wIHRoZSBzZWNvbmQgb25lIHNpbmNlIGl0J3MgdGhlIGZpcnN0IHRo
YXQgY29udGFpbmVkIHRoZSBmdW5jdGlvbiBjYWxsLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxm
QHRyb25uZXMub3JnPgo+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAtLS0KClRoYW5rcyBm
b3IgY2xlYW5pbmcgdXAuCgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJv
bm5lcy5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
