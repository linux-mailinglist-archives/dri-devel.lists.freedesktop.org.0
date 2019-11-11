Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C91F79F2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 18:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DAC6E98F;
	Mon, 11 Nov 2019 17:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9406E988;
 Mon, 11 Nov 2019 17:29:07 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i12so8634696wro.5;
 Mon, 11 Nov 2019 09:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WvahG5W8zWbUV9iqIm0KSrs4sqEMRwt53GgRh7CNpec=;
 b=CaV60xCpjqN/DlNRR/58Kpm+0hF5FAP23jHBfpFIyF0u1s0rAuDLxTZYF8HKtNwjqt
 CFgRKsUB68LsxrEoc+rEzqRcgpcylPeKPKBt6DeK7fFM1vNryfSt6cuccCG7XGvn+MXl
 y6GSBmA1lPeXa7l2usiQSSefl/25o+KlSomWRaVkkls6CEl7Fdxe+TNQuY5naUlJSObG
 udRbGAOuLwj36G/IY6ZYntRlLWJYf5SfIWpV99ZaPGKMbYhRJKT9y7z89H2qw/lwkLFJ
 phwxnPOOB8sujtSrA/j/7+eXav7rujl3Uylnjqx7anBpl84tHT0gq25w+DVL5WgXYJYW
 nKSQ==
X-Gm-Message-State: APjAAAV4CFU6JhD/JQD8TVNkX8V+kJr84Na417Uco38Rk+59WslUekCK
 rLeAMFZfn+MJn4sCCKfui036GJw6XQ3p11B3lAM=
X-Google-Smtp-Source: APXvYqy15wsyeIRkSnFOQeGZoWHHrPQpkNQoIHKatY4xSgX7gHUbvRLSH0of6Tp/VF9Yf/c+URN441n7EAy5ltGu/Yw=
X-Received: by 2002:a05:6000:18c:: with SMTP id
 p12mr21064238wrx.154.1573493346316; 
 Mon, 11 Nov 2019 09:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20191109194923.231655-1-colin.king@canonical.com>
 <633bbabf-56d4-ad4a-9d4e-9562e7122d17@amd.com>
In-Reply-To: <633bbabf-56d4-ad4a-9d4e-9562e7122d17@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Nov 2019 12:28:53 -0500
Message-ID: <CADnq5_N+WdogHBKuQah92WS6ijFe8K6Ae3RxBdO5hyGMTMGsFg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: fix spelling mistake "exeuction"
 -> "execution"
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WvahG5W8zWbUV9iqIm0KSrs4sqEMRwt53GgRh7CNpec=;
 b=oVKPNzZQoZ50rPMdCnJF0EIT92tbzpfWMmemCHN4JDQliBjPItaFwxO58zW1nWMHc0
 OWw7wfQdOZvtiro0hMaTKCfv6m18CWljs4kfOrmarRWWwoPlsPAtaubiHkb4XUh1BSK/
 w5lSdpoGfmOSHxb8zZzYF2rF0rfWuBY/zgXLuhR49CnMG1GWMSkUvIGRnOzi4KVUM1hm
 OGTz+cNWI8Q1jJBEgwe4PHqbt0wO0gFNWwYMfBDruCvYh5sSKJD1r38etLNHsGEorCFt
 sw4b7kZdE7tvTl1sKDZ11mT5BwzWc9HB6erR9SNuykOxLyjYFLOVtjjjA6Aq4yWjuwW6
 5MfQ==
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgTm92IDExLCAyMDE5IGF0IDg6MzcgQU0g
S2F6bGF1c2thcywgTmljaG9sYXMKPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4gd3JvdGU6
Cj4KPiBPbiAyMDE5LTExLTA5IDI6NDkgcC5tLiwgQ29saW4gS2luZyB3cm90ZToKPiA+IEZyb206
IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gPgo+ID4gVGhlcmUg
YXJlIHNwZWxsaW5nIG1pc3Rha2VzIGluIGEgRENfRVJST1IgbWVzc2FnZSBhbmQgYSBjb21tZW50
Lgo+ID4gRml4IHRoZXNlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxj
b2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4KPiBSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1
c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgo+Cj4gVGhhbmtzIQo+Cj4gTmljaG9s
YXMgS2F6bGF1c2thcwo+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjX2RtdWJfc3J2LmMgICAgfCAyICstCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kbXViL2luYy9kbXViX3Nydi5oIHwgMiArLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2RtdWJfc3J2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNfZG11Yl9zcnYuYwo+ID4gaW5kZXggNjFjZWZlMGEzNzkwLi5iNjVi
NjYwMjUyNjcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNfZG11Yl9zcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
X2RtdWJfc3J2LmMKPiA+IEBAIC05Miw3ICs5Miw3IEBAIHZvaWQgZGNfZG11Yl9zcnZfY21kX2V4
ZWN1dGUoc3RydWN0IGRjX2RtdWJfc3J2ICpkY19kbXViX3NydikKPiA+Cj4gPiAgICAgICBzdGF0
dXMgPSBkbXViX3Nydl9jbWRfZXhlY3V0ZShkbXViKTsKPiA+ICAgICAgIGlmIChzdGF0dXMgIT0g
RE1VQl9TVEFUVVNfT0spCj4gPiAtICAgICAgICAgICAgIERDX0VSUk9SKCJFcnJvciBzdGFydGlu
ZyBETVVCIGV4ZXVjdGlvbjogc3RhdHVzPSVkXG4iLCBzdGF0dXMpOwo+ID4gKyAgICAgICAgICAg
ICBEQ19FUlJPUigiRXJyb3Igc3RhcnRpbmcgRE1VQiBleGVjdXRpb246IHN0YXR1cz0lZFxuIiwg
c3RhdHVzKTsKPiA+ICAgfQo+ID4KPiA+ICAgdm9pZCBkY19kbXViX3Nydl93YWl0X2lkbGUoc3Ry
dWN0IGRjX2RtdWJfc3J2ICpkY19kbXViX3NydikKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZG11Yi9pbmMvZG11Yl9zcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kbXViL2luYy9kbXViX3Nydi5oCj4gPiBpbmRleCBhYThmMDM5NjYxNmQuLjQ1
ZTQyN2QxOTUyZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
bXViL2luYy9kbXViX3Nydi5oCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZG11Yi9pbmMvZG11Yl9zcnYuaAo+ID4gQEAgLTQxNiw3ICs0MTYsNyBAQCBlbnVtIGRtdWJfc3Rh
dHVzIGRtdWJfc3J2X2NtZF9xdWV1ZShzdHJ1Y3QgZG11Yl9zcnYgKmRtdWIsCj4gPiAgICAqIGRt
dWJfc3J2X2NtZF9leGVjdXRlKCkgLSBFeGVjdXRlcyBhIHF1ZXVlZCBzZXF1ZW5jZSB0byB0aGUg
ZG11Ygo+ID4gICAgKiBAZG11YjogdGhlIGRtdWIgc2VydmljZQo+ID4gICAgKgo+ID4gLSAqIEJl
Z2lucyBleGV1Y3Rpb24gb2YgcXVldWVkIGNvbW1hbmRzIG9uIHRoZSBkbXViLgo+ID4gKyAqIEJl
Z2lucyBleGVjdXRpb24gb2YgcXVldWVkIGNvbW1hbmRzIG9uIHRoZSBkbXViLgo+ID4gICAgKgo+
ID4gICAgKiBSZXR1cm46Cj4gPiAgICAqICAgRE1VQl9TVEFUVVNfT0sgLSBzdWNjZXNzCj4gPgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
