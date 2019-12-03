Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5042510FC2F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 12:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C4389E5A;
	Tue,  3 Dec 2019 11:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0FE89E4C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 11:07:46 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id f7so1155255uaa.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 03:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WMTHKvT0UgTe3Pk4kenyYksxgJtdUsnTENq5GFEFf3s=;
 b=jc05oabSdmGIfOZnh8vgBASXreL0tBDfhieFTP97yy8nl6vrTwzEO5/9OjhXgEZb3b
 cM3ZtHi6KZEQkdACsQV3utlSFOPhHrpk0OQ0S0Ga1VffaM6e2GoDw8DlY894uTEy453/
 KJw58N/IDD7Hby62hP/y0MetSaIqWZs9GI7CalNgGMHsPtNJKwxJH82tPElvyERRhTUZ
 YKy/2MiDnAXZu+0YAkUzhQp2r3HjSnFoYX7Qtn8r5M3OtaMMQpSnp0fmypfHZ6DbTx5F
 CZz4yRsIYHiTzi4FvH6iRzF+DGxgED42soBh7Hk9eanVn0yhGlZ0DVn07HdXHmfE2OD6
 7SMg==
X-Gm-Message-State: APjAAAU3MZyYEwSAxczp5B3s9yVF0URzoIbciUwk2XpGt9bmS0kGMXk/
 dnAMwIhIH6MeQLCeVTgsBqrMq1zhUWten92Gx7E=
X-Google-Smtp-Source: APXvYqxNZR7QS4otjSS1cd+7k9/sZECmglJNk6Y00VICYJCuPng2blcCTJ0WEwoGupFSF2o1EJIGAln0ZTF59UUA7Ls=
X-Received: by 2002:ab0:66d4:: with SMTP id d20mr2963465uaq.64.1575371265114; 
 Tue, 03 Dec 2019 03:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20191203100406.9674-1-tzimmermann@suse.de>
 <20191203100406.9674-3-tzimmermann@suse.de>
In-Reply-To: <20191203100406.9674-3-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 3 Dec 2019 11:06:43 +0000
Message-ID: <CACvgo50oHVLgjcv=ipQq=ZuWv2=mu20VHkVRx3x6+zhp5H9YYQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] drm/pci: Hide legacy PCI functions from non-legacy
 code
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WMTHKvT0UgTe3Pk4kenyYksxgJtdUsnTENq5GFEFf3s=;
 b=cth9QzvbWYxS+t0AieVRwFZLLqZak0s0T2yR6gnY29mTL3+p2BQppYD+5SuuUIJFBU
 m5DnVghj8Q+oK+NmhFi0mQBxd6erZ6lKCr6P6GRBsDRUQaAI1EqzzlpI+/OaieAkOubi
 eO8Uj9u8VK+46qct9kWXFPAxZzUVRoRlFUI8u69x9eER1NV8Qlv/bJe+oqCzhs8cgVus
 Gzu81LsdBLz6rdeiZqnqgFxSSDv41kRDdbrEV/eL9O98npwcRXrw/72OQs/OKA5kvjoj
 ouToBhDQXjUOfovluCEK8Db0vMkfgrHvyLoIDm7kj3i0F0kjCeNKCZmmiiwjh8b4ax9n
 mtRg==
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gVHVlLCAzIERlYyAyMDE5IGF0IDEwOjA0LCBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBEZWNsYXJhdGlvbnMgb2YgZHJtX2xl
Z2FjeV9wY2lfe2luaXQsZXhpdH0oKSBhcmUgYmVpbmcgbW92ZWQgdG8KPiBkcm1fbGVnYWN5Lmgu
IENPTkZJR19EUk1fTEVHQUNZIHByb3RlY3RzIHRoZSBpbXBsZW1lbnRhdGlvbi4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3BjaS5jIHwgIDQgKysrKwo+ICBpbmNsdWRlL2RybS9kcm1f
bGVnYWN5LmggIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgaW5jbHVkZS9k
cm0vZHJtX3BjaS5oICAgICB8IDE1IC0tLS0tLS0tLS0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQs
IDMyIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+CkhvdyBhYm91dCB3ZSBtYWtlIHRo
aXMgcGF0Y2ggMDEvMTIsIHRoaXMgd2F5IHdlIGNhbiBhdm9pZCB0aGUgY3VycmVudApjYXNlIG9m
IC0gYWRkIGNvZGUgb25seSB0byBiZSBtb3ZlZCBpbiBuZXh0IHBhdGNoLgoKQXMgYWx3YXlzIC0g
Y291cGxlIG9mIGlkZWFzIGZvciBmb2xsb3ctdXAgY2xlYW51cHMuCiAtIGRybV9pcnFfYnlfYnVz
aWQoKSBpcyBsZWdhY3kgY29kZWJhc2UgKHNlZSB0aGUgRFJJVkVSX0xFR0FDWSBjaGVjawphdCB0
aGUgdG9wKS4gSG93IGFib3V0IHdlIGdpdmUgaXQgYSBfbGVnYWN5XyBuYW1lPwogLSBXRSBIQVZF
IEEgRkVXIGRyaXZlcl9mZWF0dXJlcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
