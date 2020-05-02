Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9E11C2C8C
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 14:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB766E1D5;
	Sun,  3 May 2020 12:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2B46E084
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 22:08:09 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id r2so7738835ilo.6
 for <dri-devel@lists.freedesktop.org>; Sat, 02 May 2020 15:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rSrxmGMEHdAsOxIyHglPoSDFTwvwDOLa96EGkdCDTOk=;
 b=JiJDoq4kTK/JeQtyl5/8r+9eNapC1+8QWpBzpzUcg0pnLcYH+Mul5NvhokEMUU94Wj
 13Empzq7yZ1JiGicsHgxxJymc/FryFT8z6NtrloxEaDJn1oR+xyCYZp/+F2ATqtwnW6K
 Y2tps0ELayvGyeGIOJH9Spy2Wwt7P8OqIYkNqjrggE+mUZbVQxLodcw/6u2u+OXFD1Bb
 ZZNkt3RmnONSIva+efN24JMQDWVvWYDQG0VvAokwid1nf48K9dfCeTNaYd0s89YmA9OO
 LP73uPltfjKW2grljPD/hhqA4S8DBa+nn8sATUWmbdFenxldDM/VrwqTzexsbq6CXPsp
 Mlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rSrxmGMEHdAsOxIyHglPoSDFTwvwDOLa96EGkdCDTOk=;
 b=iZZ6/kVWo9hDhFo5yqqBxZ9H+NsyRwHA/b/4f7fiCtWxV3dpiwIMXjMMEXd7kBQUlT
 IqXJUcWU9JphiyDsYyKQBngENRHeZEjH4RtxkZN5HAptGum48Ixec/DxmQHr/UnU/BIu
 5eU97GPniKFTG4xZ5Ejg3obN5xFYEpU3geNnFKXs9bwwXlhkMMS7d1KydLS/eHSDoIZ0
 oKUz0Ge9vdRY/ckP0wGl0/F0tUPffccjETYCD7aOxTOYU8jGNXGXBtKHIgEC1pJNlpZ+
 RRiS+oiXI5t+k7m9AUN2ERXrBDf0R4xEZOuQfGBBgnKT6JuxSUfwLKLXCGWSzkCiKEJW
 V4ZA==
X-Gm-Message-State: AGi0Pub4bjxPo63RnsX7lOhqil+XBD4NSl3btg9cl1dHjmD85+ELOryl
 yRTthB2+6nWZQwIgSC2F2jzvZVCpRHIMlzd8Lmk=
X-Google-Smtp-Source: APiQypIglU/rsUA7UkfS0alL/U6tWm1DYn6R8+QV1bjHR4oo53RmWnBw8qz7r5fFurIhZFVGX+PEEjek+rQxTeyD1as=
X-Received: by 2002:a05:6e02:111:: with SMTP id
 t17mr9258389ilm.59.1588457288614; 
 Sat, 02 May 2020 15:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
 <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
 <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
 <CAJiuCcfa9ro1V4nBzfD48cCuHpEsLaNA5P0bb-tQ3hcWUCtpkA@mail.gmail.com>
 <000f26f4-3640-797f-c7f6-4b31a5e2669e@arm.com>
In-Reply-To: <000f26f4-3640-797f-c7f6-4b31a5e2669e@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 3 May 2020 00:07:57 +0200
Message-ID: <CAJiuCcfrMhu5Mi7YZTttw2k+hGui0GFAmOhPh_9fv4Te27M0+A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: add devfreq regulator support
To: Steven Price <steven.price@arm.com>
X-Mailman-Approved-At: Sun, 03 May 2020 12:54:36 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RldmVuLAoKT24gVHVlLCAxNCBBcHIgMjAyMCBhdCAxNToxMCwgU3RldmVuIFByaWNlIDxz
dGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4KPiBIaSBDbMOpbWVudCwKPgo+IE9uIDEzLzA0
LzIwMjAgMTg6MjgsIENsw6ltZW50IFDDqXJvbiB3cm90ZToKPiA+IEhpIFN0ZXZlbiwKPiA+Cgo8
c25pcD4KCj4gR2V0dGluZyBhIGJhY2t0cmFjZSBmcm9tIHRoZSB0d28gb2NjdXJyZW5jZXMsIEkg
c2VlIG9uZSBhZGRlZCBmcm9tOgo+Cj4gICAgKGRlYnVnZnNfY3JlYXRlX2RpcikgZnJvbSBbPGMw
NDYzM2Y4Pl0gKGNyZWF0ZV9yZWd1bGF0b3IrMHhlMC8weDIyMCkKPiAgICAoY3JlYXRlX3JlZ3Vs
YXRvcikgZnJvbSBbPGMwNDY4MWQ4Pl0gKF9yZWd1bGF0b3JfZ2V0KzB4MTY4LzB4MjA0KQo+ICAg
IChfcmVndWxhdG9yX2dldCkgZnJvbSBbPGMwNDY4MmUwPl0gKHJlZ3VsYXRvcl9idWxrX2dldCsw
eDY0LzB4ZjQpCj4gICAgKHJlZ3VsYXRvcl9idWxrX2dldCkgZnJvbSBbPGMwNDY5NmYwPl0KPiAo
ZGV2bV9yZWd1bGF0b3JfYnVsa19nZXQrMHg0MC8weDc0KQo+ICAgIChkZXZtX3JlZ3VsYXRvcl9i
dWxrX2dldCkgZnJvbSBbPGJmMDBhZjQ0Pl0KPiAocGFuZnJvc3RfZGV2aWNlX2luaXQrMHgxYjQv
MHg0OGMgW3BhbmZyb3N0XSkKPiAgICAocGFuZnJvc3RfZGV2aWNlX2luaXQgW3BhbmZyb3N0XSkg
ZnJvbSBbPGJmMDBhNGQ0Pl0KPiAocGFuZnJvc3RfcHJvYmUrMHg5NC8weDE4NCBbcGFuZnJvc3Rd
KQo+ICAgIChwYW5mcm9zdF9wcm9iZSBbcGFuZnJvc3RdKSBmcm9tIFs8YzA0ZWU2OTQ+XQo+IChw
bGF0Zm9ybV9kcnZfcHJvYmUrMHg0OC8weDk0KQo+Cj4gQW5kIHRoZSBvdGhlcjoKPgo+ICAgIChk
ZWJ1Z2ZzX2NyZWF0ZV9kaXIpIGZyb20gWzxjMDQ2MzNmOD5dIChjcmVhdGVfcmVndWxhdG9yKzB4
ZTAvMHgyMjApCj4gICAgKGNyZWF0ZV9yZWd1bGF0b3IpIGZyb20gWzxjMDQ2ODFkOD5dIChfcmVn
dWxhdG9yX2dldCsweDE2OC8weDIwNCkKPiAgICAoX3JlZ3VsYXRvcl9nZXQpIGZyb20gWzxjMDVj
MTI4MD5dIChkZXZfcG1fb3BwX3NldF9yZWd1bGF0b3JzKzB4NmMvMHgxODQpCj4gICAgKGRldl9w
bV9vcHBfc2V0X3JlZ3VsYXRvcnMpIGZyb20gWzxiZjAwYjRhYz5dCj4gKHBhbmZyb3N0X2RldmZy
ZXFfaW5pdCsweDM4LzB4MWFjIFtwYW5mcm9zdF0pCj4gICAgKHBhbmZyb3N0X2RldmZyZXFfaW5p
dCBbcGFuZnJvc3RdKSBmcm9tIFs8YmYwMGE1MDg+XQo+IChwYW5mcm9zdF9wcm9iZSsweGM4LzB4
MTg0IFtwYW5mcm9zdF0pCj4gICAgKHBhbmZyb3N0X3Byb2JlIFtwYW5mcm9zdF0pIGZyb20gWzxj
MDRlZTY5ND5dCj4gKHBsYXRmb3JtX2Rydl9wcm9iZSsweDQ4LzB4OTQpCj4KPiBCb3RoIGFyZSBj
cmVhdGVkIGF0IC9yZWd1bGF0b3IvdmRkX2dwdQoKSSdtIHByZXBhcmluZyBhIG5ldyB2ZXJzaW9u
IHdpdGggc29tZSBjbGVhbiBmcm9tIGxpbWEgZGV2ZnJlcS4KTXkgd29ya2luZyBicmFuY2ggOgpo
dHRwczovL2dpdGh1Yi5jb20vY2xlbWVudHBlcm9uL2xpbnV4L2NvbW1pdHMvcGFuZnJvc3RfZGV2
ZnJlcQoKVHdvIHN0cmFuZ2UgdGhpbmdzIEkgb2JzZXJ2ZToKIC0gQWZ0ZXIgMzBzZWMgdGhlIHJl
Z3VsYXRvciBpcyByZWxlYXNlZCBieSBPUFAgPz8/ClsgICAzMy43NTc2MjddIHZkZC1ncHU6IGRp
c2FibGluZwpJbnRyb2R1Y2UgdGhlIHJlZ3VsYXRvciBzdXBwb3J0IGluIHRoaXMgY29tbWl0Ogpo
dHRwczovL2dpdGh1Yi5jb20vY2xlbWVudHBlcm9uL2xpbnV4L2NvbW1pdC9iZTMxMGMzN2I4MjAx
MGUyOTNiN2YxMjljY2RjYjcxMWEyYWJiMmNlCgogLSBUaGUgQ29vbGluZyBtYXAgaXMgbm90IHBy
b2JlIGNvcnJlY3RseSA6ClsgICAgMi41NDU3NTZdIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBbZHJt
OnBhbmZyb3N0X2RldmZyZXFfaW5pdApbcGFuZnJvc3RdXSBGYWlsZWQgdG8gcmVnaXN0ZXIgY29v
bGluZyBkZXZpY2UKSW50cm9kdWNlIGluIHRoaXMgY29tbWl0IDoKaHR0cHM6Ly9naXRodWIuY29t
L2NsZW1lbnRwZXJvbi9saW51eC9jb21taXQvMDI1MmMzOGZkNTVhZDc4MzY2YWM0YjE3MTRlMjg1
Yzg4ZGIzNDU1NwoKRG8geW91IGhhdmUgYW4gaGludCBhYm91dCB3aGF0IEknbSBtaXNzaW5nID8K
ClRoYW5rcyBmb3IgeW91ciBoZWxwLApDbGVtZW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
