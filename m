Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5208C89FB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 15:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86066E105;
	Wed,  2 Oct 2019 13:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1816E0D9;
 Wed,  2 Oct 2019 13:41:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q9so941319wrm.8;
 Wed, 02 Oct 2019 06:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zDudtJN8svNKdK3GLnCJ/Dk7Mp6Jv88jvEndY5m6DX8=;
 b=sfw22Wl7sygrbpKpcQQn32uiFL9psqD2B9ThmJX2Qx2j623VGRZFF4pZ0IBDYXhp1/
 FM6n7ilUOxiqbUbtRnNsmU/V3Ws0qpToDsdFaNYoo2z8ZNE4XtdI5EslJN4eJ3n7thoH
 DSSgQpUZ+KgfXzLJgPz3uIjbUceICo3AZmePbWryUkBU1bEWcvx58B/SelelGtOkjSCF
 fxQWymOr1GjywSPl/shzfKsfAkTJvvSFjbevzS7doYeD5Fv47RRAaWLrL3nyIRb8N9MW
 fdQBV+/n58snf3vJRpcgEcEDrkU74pldVGjdEklHPE4p4qF79t/Js7ZWwDMGGeVPKwKS
 GiYw==
X-Gm-Message-State: APjAAAUGBo80L+nh+7BcC7INWtdIH8hdUX3Q+AvPriXpAdmpT4zGYaNz
 QofLn/++974iv5apE5nYZNLeKsam6EtouuzqLLE=
X-Google-Smtp-Source: APXvYqyTzHKnhMINri0Sgy7y05i7A68sCvl+xV41UB3nMWhoY8A6EENNu6528Ze98rtgID+3CHQIkIn5jrZTpgOcn6A=
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr2803702wrn.40.1570023692609;
 Wed, 02 Oct 2019 06:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190930200902.inmjn264l6pxcdsq@outlook.office365.com>
In-Reply-To: <20190930200902.inmjn264l6pxcdsq@outlook.office365.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Oct 2019 09:41:21 -0400
Message-ID: <CADnq5_MapuHn=yNSkYf6yUzatXps2sMJPNLJ-wUad5jqg+GuQw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Initialize variable before use
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zDudtJN8svNKdK3GLnCJ/Dk7Mp6Jv88jvEndY5m6DX8=;
 b=iEVpU1UpkYCdUvTGHys/gPjNX7+WHTs0ltbAc+zJbBRPv9soYFWc3I79bl9lB3fEnk
 4Rks8z6bxtDHULcl59TcjJq1PclVanM1TCKl4W1JkOTy9Rv3GLS5wgJm9wwfpA+ZYy47
 RNYfUmua0M4CtjD+T+kNwpnMWSngXkdjgUdZBOGZkfDQeZ0t4QcqfpsVV3vdNGf/AmOW
 pL6jxRA932ketvd+VdpdE5clDkiJ+9HJx1t1WKaPeu9BCqNeVdqeqrjbcr90jE0854m0
 CFfEC47TI4AV+zWZYFgnsOofDVAMGj8gU2YIRk2aUwB0rZlaQsr8QuauqgiB8eD3bQFl
 OC8A==
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgNDowOSBQTSBTaXF1ZWlyYSwgUm9kcmlnbwo8Um9kcmln
by5TaXF1ZWlyYUBhbWQuY29tPiB3cm90ZToKPgo+IFRoZSAnZGVidWdfZGF0YScgdmFyaWFibGUg
Z2V0cyBwcmludGVkIGluIGRlYnVnIHN0YXRlbWVudHMgd2l0aG91dCBhCj4gcHJpb3IgaW5pdGlh
bGl6YXRpb24gaW4gdGhlIGZ1bmN0aW9uCj4gaHViYnViMV92ZXJpZnlfYWxsb3dfcHN0YXRlX2No
YW5nZV9oaWdoLCBhcyByZXBvcnRlZCB3aGVuIGJ1aWxkaW5nIHdpdGgKPiBnY2MgOS4xLjA6Cj4K
PiB3YXJuaW5nOiDigJhkZWJ1Z19kYXRh4oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4g
dGhpcyBmdW5jdGlvbiBbLVdtYXliZS11bmluaXRpYWxpemVkXQo+ICAgMjkwIHwgIHByaW50ayMj
b25jZShLRVJOXyMjbGV2ZWwgIlsiIERSTV9OQU1FICJdICIgZm10LCAjI19fVkFfQVJHU19fKQo+
ICAgICAgIHwgIF5+fn5+fgo+IGRjL2RjbjEwL2RjbjEwX2h1YmJ1Yi5jOjEzNDoxNTogbm90ZTog
4oCYZGVidWdfZGF0YeKAmSB3YXMgZGVjbGFyZWQgaGVyZQo+ICAgMTM0IHwgIHVuc2lnbmVkIGlu
dCBkZWJ1Z19kYXRhOwo+Cj4gTm90ZSB0aGF0IGluaXRpYWxpemUgZGVidWdfZGF0YSB3aXRoIDAs
IGluIHRoaXMgY2FzZSwgaXMgc2FmZSBiZWNhdXNlIHdlCj4gaGF2ZSBhIGxvb3AgaW4gYSBmZXcg
bGluZXMgYmVsb3cgdGhhdCB3aWxsIGluaXRpYWxpemUgdGhpcyB2YXJpYWJsZSB3aXRoCj4gdGhl
IHByb3BlciB2YWx1ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPFJvZHJp
Z28uU2lxdWVpcmFAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMTAvZGNuMTBfaHViYnViLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJidWIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJidWIuYwo+IGluZGV4IGE3ODAwNTdlMmRiYy4uYjY5
NjdhN2U2YzdiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24xMC9kY24xMF9odWJidWIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24xMC9kY24xMF9odWJidWIuYwo+IEBAIC0xMzMsNyArMTMzLDcgQEAgYm9vbCBodWJidWIx
X3ZlcmlmeV9hbGxvd19wc3RhdGVfY2hhbmdlX2hpZ2goCj4gICAgICAgICBzdGF0aWMgdW5zaWdu
ZWQgaW50IG1heF9zYW1wbGVkX3BzdGF0ZV93YWl0X3VzOyAvKiBkYXRhIGNvbGxlY3Rpb24gKi8K
PiAgICAgICAgIHN0YXRpYyBib29sIGZvcmNlZF9wc3RhdGVfYWxsb3c7IC8qIGhlbHAgd2l0aCBy
ZXZlcnQgd2EgKi8KPgo+IC0gICAgICAgdW5zaWduZWQgaW50IGRlYnVnX2RhdGE7Cj4gKyAgICAg
ICB1bnNpZ25lZCBpbnQgZGVidWdfZGF0YSA9IDA7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgaTsK
Pgo+ICAgICAgICAgaWYgKGZvcmNlZF9wc3RhdGVfYWxsb3cpIHsKPiAtLQo+IDIuMjMuMAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBt
YWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
