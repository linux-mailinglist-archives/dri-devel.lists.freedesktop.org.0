Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB002286066
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 15:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A5B6E0C4;
	Wed,  7 Oct 2020 13:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36E46E0C4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:45:35 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D860208C7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602078335;
 bh=ZGycqLQnWRcYr+zGDoPkZ0Y2h8iE8vTiYIvdTbJ7wYM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2u0xydeyNZnnq7gB0IpIhE+t9VepmFdtTUXUNoLaKzPfPImj+YPfASdHCWaTlwFa2
 rmvzkILyS1MOUIGVKbEDm6RIIW/DIYcjkQi2Og53Oi2ekXJALdKNHvhj9juU0gKHXq
 2Ih1SQby4QZg6QFd7mSVaYdpNytkUcCEoobM5Cyw=
Received: by mail-oo1-f42.google.com with SMTP id b12so615079oop.13
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 06:45:35 -0700 (PDT)
X-Gm-Message-State: AOAM5320EIkSU/gjfp7M92syq+mt712ChLTEEGhnSIQ6kMbQCLa1sI3w
 zOKg1AyUUGr/HupqhA9GLVZ/k+RugsYf/uWkaA==
X-Google-Smtp-Source: ABdhPJwMidY5D4LbqCYMVItlTXxCPRQ8wzloeEbPoe9hAw4PmpVbOa+/uoUpA6rW+K/g8yB/2iBG+X6+3auNbYWdvDw=
X-Received: by 2002:a4a:b30d:: with SMTP id m13mr2103963ooo.50.1602078334774; 
 Wed, 07 Oct 2020 06:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <1601691422-12851-1-git-send-email-anitha.chrisanthus@intel.com>
 <1601691422-12851-2-git-send-email-anitha.chrisanthus@intel.com>
In-Reply-To: <1601691422-12851-2-git-send-email-anitha.chrisanthus@intel.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 7 Oct 2020 08:45:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL9Wf4H8NQeu2Qe-zeCVk2A=XVY6kC2nUTdQ0M6qRphMA@mail.gmail.com>
Message-ID: <CAL_JsqL9Wf4H8NQeu2Qe-zeCVk2A=XVY6kC2nUTdQ0M6qRphMA@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] drm/kmb: Keem Bay driver register definition
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 edmund.j.dea@intel.com, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMiwgMjAyMCBhdCA5OjE3IFBNIEFuaXRoYSBDaHJpc2FudGh1cwo8YW5pdGhh
LmNocmlzYW50aHVzQGludGVsLmNvbT4gd3JvdGU6Cj4KPiBSZWdpc3RlciBkZWZpbml0aW9ucyBm
b3IgS2VlbSBCYXkgZGlzcGxheSBkcml2ZXIKPgo+IHYyOiByZW1vdmVkIGxpY2Vuc2UgdGV4dCAo
U2FtKQo+IHYzOiBTcXVhc2hlZCBhbGwgNTkgY29tbWl0cyB0byBvbmUKPiB2NDogcmV2aWV3IGNo
YW5nZXMgZnJvbSBTYW0gUmF2bmJvcmcKPiAgICAgICAgIHJlbmFtZWQgZGV2X3AgdG8ga21iCj4g
djU6IGNvcnJlY3RlZCBzcGVsbGluZ3MKPiB2NjogY29ycmVjdGVkIGNoZWNrcGF0Y2ggd2Fybmlu
Z3MKPgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gU2lnbmVkLW9mZi1i
eTogQW5pdGhhIENocmlzYW50aHVzIDxhbml0aGEuY2hyaXNhbnRodXNAaW50ZWwuY29tPgo+IFJl
dmlld2VkLWJ5OiBCb2IgUGFhdXdlIDxib2Iuai5wYWF1d2VAaW50ZWwuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0va21iL2ttYl9yZWdzLmggfCA3NDggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDc0OCBpbnNlcnRpb25zKCsp
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0va21iL2ttYl9yZWdzLmgKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0va21iL2ttYl9yZWdzLmggYi9kcml2ZXJzL2dw
dS9kcm0va21iL2ttYl9yZWdzLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAuLmY3OTRhYzMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2ttYi9r
bWJfcmVncy5oCj4gQEAgLTAsMCArMSw3NDggQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb25seQo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgwqkgMjAxOC0yMDIwIEludGVs
IENvcnBvcmF0aW9uCj4gKyAqLwo+ICsKPiArI2lmbmRlZiBfX0tNQl9SRUdTX0hfXwo+ICsjZGVm
aW5lIF9fS01CX1JFR1NfSF9fCj4gKwo+ICsjZGVmaW5lIEVOQUJMRSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAxCj4gKyNkZWZpbmUgRElTQUJMRSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMAo+ICsvKmZyb20gRGF0YSBCb29rIHNlY3Rpb24gMTIuNS44
LjEgcGFnZSA0MzIyICovCj4gKyNkZWZpbmUgQ1BSX0JBU0VfQUREUiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICgweDIwODEwMDAwKQo+ICsjZGVmaW5lIE1JUElfQkFTRV9BRERSICAgICAgICAg
ICAgICAgICAgICAgICAgICAoMHgyMDkwMDAwMCkKPiArLypmcm9tIERhdGEgQm9vayBzZWN0aW9u
IDEyLjExLjYuMSBwYWdlIDQ5NzIgKi8KPiArI2RlZmluZSBMQ0RfQkFTRV9BRERSICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKDB4MjA5MzAwMDApCj4gKyNkZWZpbmUgTVNTX0NBTV9CQVNFX0FE
RFIgICAgICAgICAgICAgICAgICAgICAgKE1JUElfQkFTRV9BRERSICsgMHgxMDAwMCkKPiArI2Rl
ZmluZSBMQ0RfTU1JT19TSVpFICAgICAgICAgICAgICAgICAgICAgICAgICAoMHgzMDAwKQo+ICsj
ZGVmaW5lIE1JUElfTU1JT19TSVpFICAgICAgICAgICAgICAgICAgICAgICAgICgweDQwMDApCj4g
KyNkZWZpbmUgTVNTX0NBTV9NTUlPX1NJWkUgICAgICAgICAgICAgICAgICAgICAgKDB4MzApCgpX
aHkgYXJlIHRoZXNlIGRlZmluZXMgaGVyZT8gVGhleSBhbGwgY29tZSBmcm9tIERULgoKUm9iCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
