Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E36FC8C6F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 17:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D304A6E153;
	Wed,  2 Oct 2019 15:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EB86E151;
 Wed,  2 Oct 2019 15:12:44 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id 129so6192147ywb.8;
 Wed, 02 Oct 2019 08:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VaE7w1CaTRczQgzzFI2ExCLX+A6tMdd72aOZN4Z0QKo=;
 b=W59V6zg0DYlVFYItgMlyit+W24rLWdZkCLTgi0824xF9GdR68xhu4yyPDJ2R8ecBH2
 cYXIryXkj6rrFlUn2I7+ftXrBg3cXjKhylZIaYSjBTm550WLivC7llLzrX8Tv4Z/n2bV
 lDUikGbXMM5ca4/o7q6CLOMWaVHg/eV9eZn5uHBqm1O1s6DEbh7p7Dqj5MM96u1x/w8J
 XPzww1lnfWnwWGWMkq19nJsmgc6kx6t+1pzMffOZYz1xn8m1IrXK36XQMJO/qQfNsRed
 XdcSE8CIZyI+hdm4x0QtfGMHY1TipMYpdbKJqHHGhUr+8KpyNFDnTTBqmrw5W92bJFa1
 huxg==
X-Gm-Message-State: APjAAAU52jXUhqjzC+jXA9ASWi3XtP/LWMwMkTPdeUeopRtcW9cwY6Mb
 m3JIq2kpB9Q/rMZzKLUk4dSpLODQcr08+zNJQuQ=
X-Google-Smtp-Source: APXvYqx7/3JZinR3TrxpzIRdJHu65zew2z/VyGmSS7W5Ui+1dZIXWQ/1ooSR2vIXkGdizxdKtOnY3kC5vWqx2R8BKLI=
X-Received: by 2002:a81:4a04:: with SMTP id x4mr2900984ywa.168.1570029163271; 
 Wed, 02 Oct 2019 08:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
 <20191002120136.1777161-5-arnd@arndb.de>
 <CADnq5_PkTwTBbQY9JatZD2_sWjdU5_hK7V2GLfviEvMh_QB12Q@mail.gmail.com>
 <CAK8P3a0KMT437okhobg=Vzi5LRDgUO7L-x35LczBGXE2jYLg2A@mail.gmail.com>
In-Reply-To: <CAK8P3a0KMT437okhobg=Vzi5LRDgUO7L-x35LczBGXE2jYLg2A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Oct 2019 11:12:31 -0400
Message-ID: <CADnq5_PWWndBomBOXTYgmFqo+U8f8d8+OdJ5Ym3+a2mgO5=E0A@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/amd/display: fix dcn21 Makefile for clang
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VaE7w1CaTRczQgzzFI2ExCLX+A6tMdd72aOZN4Z0QKo=;
 b=nLE1/iHWa7XE0yBbCQsMddzPXDMYx7T4sjIBuOZqqXZgejKTiKwtDFPNxWFQbx8KPF
 jszcdAsTTJNxBc1JHRulzs5bfBibve3/UJgW0TMYdIFY5wuxcv0faMIo5dI++rfYLYJt
 /PMsuwgWLH2n3vXCWACK6ITP1xOJpQSf3igP8zQtoza3UOwpT8/dKHsGV1FIyqYMyf9I
 00+ZJFee/TjjHhNh+QCI31xd/7tqwDF01IAQEIjoMF9krRmcoTMDOw5ZuN7I63ACgsG0
 TYqFKEXHnhWWpMZQ3Mg9VyAyNfkTNVBTnSf2DxiAmp1TbQSrrEklfutDIi/HK4Whanqn
 yNXw==
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCAxMDo1MSBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDIsIDIwMTkgYXQgNDoxNyBQTSBBbGV4IERldWNo
ZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSSdtIGdldHRpbmcgYW4g
ZXJyb3Igd2l0aCBnY2Mgd2l0aCB0aGlzIHBhdGNoOgo+ID4gICBDQyBbTV0gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2Uubwo+ID4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNv
dXJjZS5jOiBJbgo+ID4gZnVuY3Rpb24g4oCYY2FsY3VsYXRlX3dtX3NldF9mb3JfdmxldmVs4oCZ
Ogo+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24yMS9kY24y
MV9yZXNvdXJjZS5jOjk2NDoyMjoKPiA+IGVycm9yOiBTU0UgcmVnaXN0ZXIgcmV0dXJuIHdpdGgg
U1NFIGRpc2FibGVkCj4KPiBJIGNoZWNrZWQgYWdhaW4gd2l0aCBnY2MtOCwgYnV0IGRvIG5vdCBz
ZWUgdGhhdCBlcnJvciBtZXNzYWdlLgo+Cj4gPiA+IC1DRkxBR1NfJChBTUREQUxQQVRIKS9kYy9k
Y24yMS9kY24yMV9yZXNvdXJjZS5vIDo9IC1taGFyZC1mbG9hdCAtbXNzZSAtbXByZWZlcnJlZC1z
dGFjay1ib3VuZGFyeT00Cj4gPiA+ICtDRkxBR1NfJChBTUREQUxQQVRIKS9kYy9kY24yMS9kY24y
MV9yZXNvdXJjZS5vIDo9IC1taGFyZC1mbG9hdCAtbXNzZSAkKGNjX3N0YWNrX2FsaWduKQo+Cj4g
Tm90aGluZyBzaG91bGQgcmVhbGx5IGNoYW5nZSB3aXRoIHJlZ2FyZHMgdG8gdGhlIC1tc3NlIGZs
YWcgaGVyZSwgb25seQo+IHRoZSBzdGFjayBhbGlnbm1lbnQgZmxhZyBjaGFuZ2VkLiBNYXliZSB0
aGVyZSB3YXMgc29tZSBvdGhlciBjaGFuZ2UKPiBpbiB5b3VyIE1ha2VmaWxlIHRoYXQgY29uZmxp
Y3RzIHdpdGggbXkgbXkgcGF0Y2g/CgpUaGlzIHBhdGNoIG9uIHRvcCBvZiB5b3VycyBzZWVtcyB0
byBmaXggaXQgYW5kIGFsaWducyBiZXR0ZXIgd2l0aCB0aGUKb3RoZXIgTWFrZWZpbGVzOgoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9NYWtlZmlsZQpi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9NYWtlZmlsZQppbmRleCBlZjY3
M2JmZmMyNDEuLmU3MWYzZWU3NmNkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMS9NYWtlZmlsZQpAQCAtOSwxMCArOSwxMCBAQCBlbHNlIGlmbmVxICgkKGNhbGwg
Y2Mtb3B0aW9uLCAtbXN0YWNrLWFsaWdubWVudD0xNiksKQogICAgICAgIGNjX3N0YWNrX2FsaWdu
IDo9IC1tc3RhY2stYWxpZ25tZW50PTE2CiBlbmRpZgoKLUNGTEFHU18kKEFNRERBTFBBVEgpL2Rj
L2RjbjIxL2RjbjIxX3Jlc291cmNlLm8gOj0gLW1oYXJkLWZsb2F0IC1tc3NlCiQoY2Nfc3RhY2tf
YWxpZ24pCitDRkxBR1NfZGNuMjFfcmVzb3VyY2UubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgJChj
Y19zdGFja19hbGlnbikKCiBpZmRlZiBDT05GSUdfQ0NfSVNfQ0xBTkcKLUNGTEFHU18kKEFNRERB
TFBBVEgpL2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLm8gKz0gLW1zc2UyCitDRkxBR1NfZGNuMjFf
cmVzb3VyY2UubyArPSAtbXNzZTIKIGVuZGlmCgogQU1EX0RBTF9EQ04yMSA9ICQoYWRkcHJlZml4
ICQoQU1EREFMUEFUSCkvZGMvZGNuMjEvLCQoRENOMjEpKQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
