Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7800789DC9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 14:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73E86E4FE;
	Mon, 12 Aug 2019 12:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A036E4FE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:13:57 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50587
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hx9D0-0000w6-T3; Mon, 12 Aug 2019 14:13:54 +0200
Subject: Re: [PATCH 4/4] drm/panel/ili9341: Support DPI panels
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190801135249.28803-1-noralf@tronnes.org>
 <20190801135249.28803-5-noralf@tronnes.org>
 <20190811164139.GB14660@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <4b195dcc-1b78-2d4b-b309-17cf8761296a@tronnes.org>
Date: Mon, 12 Aug 2019 14:13:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190811164139.GB14660@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=+bmzINh29FLlnLWaoEpnaDA2fwvHRLAe157iLBHMBdY=; 
 b=azwrCzJLKHNUS/IWrBj0i9naHrjxEt8A7ZgrfFda0w6GF1rcPNgv+sJgQc55HZALbqRrVg9VLgJJQnXKcYfboks9Bp0jCbQNeTJRRro8ckIEdowac6aRQ/Y1FxBbwxr3PMLtsQBf2FDqvJlzGhpj5BJ+cglsC1wQfNlNwWCAB8Eym5LhCWRl4aLUdYEZlGqls0vPa6Wny/zhA7Y7p+TPi1yFzX3XN+eNRpjNtDD8rwTRFYfk8H/DpBKirFuLgC2WWnrwCMqwW4niY0Pu40rhK4eYwcw/T5FbUnjyXD0S7bdjOxp2QOsLhFRDx7QkElcGPd0Uij2HZljwmgc1bkvqDw==;
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
Cc: daniel.vetter@ffwll.ch, emil.l.velikov@gmail.com, josef@lusticky.cz,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTEuMDguMjAxOSAxOC40MSwgc2tyZXYgU2FtIFJhdm5ib3JnOgo+IEhpIE5vcmFsZi4K
PiAKPiBPbiBUaHUsIEF1ZyAwMSwgMjAxOSBhdCAwMzo1Mjo0OVBNICswMjAwLCBOb3JhbGYgVHLD
uG5uZXMgd3JvdGU6Cj4+IEFkZCBzdXBwb3J0IGZvciBwYW5lbHMgdGhhdCB1c2UgdGhlIERQSSBp
bnRlcmZhY2UuCj4+IElMSTkzNDEgaGFzIG9uYm9hcmQgUkFNIHNvIHRoZSBhc3N1bXB0aW9uIG1h
ZGUgaGVyZSBpcyB0aGF0IGFsbCBzdWNoCj4+IHBhbmVscyBzdXBwb3J0IHBpeGVsIHVwbG9hZCBv
dmVyIERCSS4KPj4KPj4gVGhlIHByZXNlbmNlL2Fic2Vuc2Ugb2YgdGhlIERldmljZSBUcmVlICdw
b3J0JyBub2RlIGRlY2lkZXMgd2hpY2gKPj4gaW50ZXJmYWNlIGlzIHVzZWQgZm9yIHBpeGVsIHRy
YW5zZmVyLgo+IEhhdmUgeW91IGNvbnNpZXJlZCBpZiB0aGUgY29tcGF0aWJsZSBjb3VsZCBiZSB1
c2VkIHRvIGRldGVybWluZSB0aGUgdXNlCj4gb2YgYSBwYW5lbD8KPiBUaGVuIGl0IGlzIG1vcmUg
ZXhwbGljaXQgaG93IHRoZSBIVyBpcyBkZXNjcmliZWQgaW4gRFQuCj4gCgpJcyB0aGF0IGNvbW1v
biB0byB1c2UgdGhlIGNvbXBhdGlibGUgdG8gdGVsbCB3aGljaCBpbnRlcmZhY2UgdG8gdXNlPwpJ
IGRvbid0IGtub3cgd2hhdCBiZXN0IHByYWN0aWNlIGlzIGhlcmUuCgpOb3JhbGYuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
