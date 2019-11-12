Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7250F9B3D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 21:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83A76EBE8;
	Tue, 12 Nov 2019 20:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278996EBE8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 20:51:39 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:54635
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iUd8S-0001WX-Qo; Tue, 12 Nov 2019 21:51:36 +0100
Subject: Re: [PATCH 1/2] drm/fb-helper: unexpoert drm_fb_helper_generic_probe
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191112175048.1581-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <8ef9a525-349c-04b3-401d-7f80c63a9246@tronnes.org>
Date: Tue, 12 Nov 2019 21:51:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191112175048.1581-1-daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wGyhHY/RK7uo+OWTfhGc1mL7PL2C3sRJWJQSKoKnk8Q=; b=guukQ7G++5+BW/1kPe505fca2l
 hiX1dysJ2rlfnTVlXPZfQOW4kcQOws4J7wI8SDJEHOzXUYGXgQRAekmrqM2l7/5Zwx9hTjMbA5dWy
 hWcia6fkoYG1/guzwFUtMPzxDnvNgqLwcKf1y7b2DXI4n1l6jCO2qo0VcT9P4cT14WoOP8fts5NV6
 mpl4Az50U0pqREvqeu0t4e2vN29I34JaE6mMqx3xQAHKJjTJnhqSInvlpoM+sdiq4bhGF7AcT/tij
 R9OHfWzbahXxO++TiIAWXgPgQAXRzjvYhc4t3NrMPLjv2Lu1S+uRyCURxBojPaw3wRy6VzqlAh0qO
 j93bffZw==;
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTIuMTEuMjAxOSAxOC41MCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBOb3Qgc3VyZSB3
ZSBkb24ndCB5ZXQgaGF2ZSB0aGlzIGFzIGEgcGF0Y2ggc29tZXdoZXJlIC4uLgo+IAo+IE1vdGl2
YXRpb24gaXMgdGhhdCB0aGUgYXV0b21hdGljIGxpZmV0aW1lIG1hbmFnZW1lbnQgb2YgdGhlIGdl
bmVyaWMgZmJkZXYKPiBjb2RlIGlzIHF1aXRlIHRyaWNreSwgYW5kIGl0J2xsIGdldCBldmVuIG1v
cmUgdHJpY2t5LiBBbGxvd2luZyBkcml2ZXJzCj4gdG8ganVzdCB1c2UgdGhlIGZiX3Byb2JlIGxv
b2tzIGxpa2UgYSByZWNpcGUgZm9yIGRpc2FzdGVyLgo+IAo+IENjOiBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4KPiBDYzogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5v
cmc+Cj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gLS0tCgpU
aGlzIHdhcyBuZWVkZWQgZHVyaW5nIGNvbnZlcnNpb24gb2YgdGhlIGNtYS1oZWxwZXIsIGFuZCB0
aGVuIEkgZm9yZ290Li4uCgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJv
bm5lcy5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
