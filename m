Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADDE32B8E9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 16:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1069E89D58;
	Wed,  3 Mar 2021 15:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A497589D58;
 Wed,  3 Mar 2021 15:22:31 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id w65so2755874oie.7;
 Wed, 03 Mar 2021 07:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1zkQQ97wCx5l4oAwiKRm3PYTro4R8m4Ik8B878uu3kM=;
 b=kDN8FhKHHCBKtHgQukPsPJbWp9YgHQ8aiisj3cwnFjz+bHxAf3P04S+T5e/1SB8m2Q
 eiAbfA5W0GVf517ujz3FM4zc9W/Wu0ST833kAEKQidkTq61QtUjTznUaHSOMIchOhqEJ
 BkYwYzZbob7171aXW9LVFwoGxjftRqVvONBXgFUcIdW66LKUxIOSxzIQLK7pik9lrvKH
 jIimY9tWWbz8WdyQna+oJ1lRNcY/jk84cvi60POdccek60TKvwvOVgcxOpeLFrmqT+C9
 L/6dUWWz2en//yIWdsgfc8tSNcB6aa7hUojzqDdRhYdsfhWKYRwk+MvVzYqR1+3rCSJ/
 GDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1zkQQ97wCx5l4oAwiKRm3PYTro4R8m4Ik8B878uu3kM=;
 b=PCgtThuL6yxVa29R3Oyq+9wi6d21+cbM85pQ/5NItvnLRn5LhoeIgC7OqpNJKGLKlu
 ZJKCIOgEhs921LzqelMbUXqO9TB1NmZm0oxcP2lC9JdRfrSI6L4Iu8piOCqQZyp0/muw
 e6Ct52cvS9gHkPVnuLjYwnAgVDj5Yb1L+x7kG27PoISUZOkFdEqRCUb6k4gaxyQ+hxii
 d7a9PLgxJR203hz+0B8JRc1onEBIXCTItZSWnUKh9lNPIjvrDhJUbLXi4Vfm57gegCrb
 qSa5dXvJr5Wz7qCUf71IwkQWGVBIFz/HYVkRRcYILFiZmZEF+AiHwA2xNl4l0DUyPs6s
 ybyg==
X-Gm-Message-State: AOAM533mizGHbXVq2WgtW8//JQjG1RC0+kSLXWLuLPdSC5EID19vRzf+
 AxJjX0sSk2iqZ8OPUyVtcdmdlpidUeoo62b2f2U=
X-Google-Smtp-Source: ABdhPJwi6JJYtdHJou1KLhj6ufmDeaRaqJbFih9YWS87D4y+uBYiLw1BGv2+cLgbEdPSlrMVt5w8YmVyzRP20pFsvlg=
X-Received: by 2002:a05:6808:f15:: with SMTP id
 m21mr7596595oiw.123.1614784951023; 
 Wed, 03 Mar 2021 07:22:31 -0800 (PST)
MIME-Version: 1.0
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <20210303134319.3160762-5-lee.jones@linaro.org>
In-Reply-To: <20210303134319.3160762-5-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Mar 2021 10:22:20 -0500
Message-ID: <CADnq5_OaxR7WLNtQizH=wf1W9y0F3zzWVkwmPwXOq975_pPoFw@mail.gmail.com>
Subject: Re: [PATCH 04/53] drm/amd/display/dc/bios/command_table: Remove
 unused variable
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Qinglang Miao <miaoqinglang@huawei.com>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMywgMjAyMSBhdCA4OjQzIEFNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gTm9uZSBvZiB0aGUgc3Vycm91bmRpbmcgY29kZSB3YXMgcmVtb3Zl
ZCBqdXN0IGluIGNhc2UgZXZlbiBhIHNtYWxsCj4gZnJhY3Rpb24gb2YgaXQgd2FzIGZ1bmN0aW9u
YWwuCj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToK
Pgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Jpb3MvY29tbWFu
ZF90YWJsZS5jOiBJbiBmdW5jdGlvbiDigJhhZGp1c3RfZGlzcGxheV9wbGxfdjLigJk6Cj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxl
LmM6MTQ1OTozNTogd2FybmluZzogdmFyaWFibGUg4oCYcGFyYW1z4oCZIHNldCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhh
cnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+
IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBDYzogUWluZ2xhbmcgTWlhbyA8bWlhb3FpbmdsYW5nQGh1YXdlaS5jb20+Cj4gQ2M6IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
PgoKVGhpcyBmdW5jdGlvbiBzaG91bGQgYmUgY2FsbGluZyB0aGUgYXRvbSBjbWQgdGFibGUgd2l0
aCB0aGUKcGFyYW1ldGVycy4gIEp1c3Qgc2VudCBhIHBhdGNoIHRvIGZpeCB0aGlzOgpodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNDIyODMzLwoKQWxleAoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJsZS5jIHwgMTIg
KysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jp
b3MvY29tbWFuZF90YWJsZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3Mv
Y29tbWFuZF90YWJsZS5jCj4gaW5kZXggYWZjMTBiOTU0ZmZhNy4uOWQzYmMzYTA3MzgyMSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3Rh
YmxlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5k
X3RhYmxlLmMKPiBAQCAtMTUxNywyMCArMTUxNywxNCBAQCBzdGF0aWMgZW51bSBicF9yZXN1bHQg
YWRqdXN0X2Rpc3BsYXlfcGxsX3YyKAo+ICAgICAgICAgc3RydWN0IGJwX2FkanVzdF9waXhlbF9j
bG9ja19wYXJhbWV0ZXJzICpicF9wYXJhbXMpCj4gIHsKPiAgICAgICAgIGVudW0gYnBfcmVzdWx0
IHJlc3VsdCA9IEJQX1JFU1VMVF9GQUlMVVJFOwo+IC0gICAgICAgQURKVVNUX0RJU1BMQVlfUExM
X1BTX0FMTE9DQVRJT04gcGFyYW1zID0geyAwIH07Cj4KPiAgICAgICAgIC8qIFdlIG5lZWQgdG8g
Y29udmVydCBmcm9tIEtIeiB1bml0cyBpbnRvIDEwS0h6IHVuaXRzIGFuZCB0aGVuIGNvbnZlcnQK
PiAgICAgICAgICAqIG91dHB1dCBwaXhlbCBjbG9jayBiYWNrIDEwS0h6LS0+S0h6ICovCj4gICAg
ICAgICB1aW50MzJfdCBwaXhlbF9jbG9ja18xMEtIel9pbiA9IGJwX3BhcmFtcy0+cGl4ZWxfY2xv
Y2sgLyAxMDsKPgo+IC0gICAgICAgcGFyYW1zLnVzUGl4ZWxDbG9jayA9IGNwdV90b19sZTE2KCh1
aW50MTZfdCkocGl4ZWxfY2xvY2tfMTBLSHpfaW4pKTsKPiAtICAgICAgIHBhcmFtcy51Y1RyYW5z
bWl0dGVySUQgPQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGJwLT5jbWRfaGVscGVyLT5lbmNv
ZGVyX2lkX3RvX2F0b20oCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGRhbF9ncmFwaGljc19vYmplY3RfaWRfZ2V0X2VuY29kZXJfaWQoCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicF9wYXJhbXMtPmVuY29k
ZXJfb2JqZWN0X2lkKSk7Cj4gLSAgICAgICBwYXJhbXMudWNFbmNvZGVNb2RlID0KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAodWludDhfdClicC0+Y21kX2hlbHBlci0+ZW5jb2Rlcl9tb2RlX2Jw
X3RvX2F0b20oCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJwX3Bh
cmFtcy0+c2lnbmFsX3R5cGUsIGZhbHNlKTsKPiArICAgICAgIGJwLT5jbWRfaGVscGVyLT5lbmNv
ZGVyX2lkX3RvX2F0b20oCj4gKyAgICAgICAgICAgICAgIGRhbF9ncmFwaGljc19vYmplY3RfaWRf
Z2V0X2VuY29kZXJfaWQoYnBfcGFyYW1zLT5lbmNvZGVyX29iamVjdF9pZCkpOwo+ICsgICAgICAg
YnAtPmNtZF9oZWxwZXItPmVuY29kZXJfbW9kZV9icF90b19hdG9tKGJwX3BhcmFtcy0+c2lnbmFs
X3R5cGUsIGZhbHNlKTsKPiAgICAgICAgIHJldHVybiByZXN1bHQ7Cj4gIH0KPgo+IC0tCj4gMi4y
Ny4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
