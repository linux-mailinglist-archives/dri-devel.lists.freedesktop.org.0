Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0131C395
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606A58920D;
	Tue, 14 May 2019 07:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B7D8920D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 07:03:04 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id o5so3358629vsq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 00:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KZSOEtw2b+ihnKnrGZWNr36HLCtaAg8cSIpWNk8JChc=;
 b=oKoFDq0M/npnTMZmjbVMlYdcpIE/xj2irtYWdRVi8eciy9L/XfDBxqTTWHvJIqYWBp
 MIYdwuDRsDRKJn3f80SgpONxwk6I2alQp9Ba8rHE8AtohBLo8GxYoWCPtIheDt69fTyc
 cTavhWYR5nA8R5JUgBvUHrzQWogHAE8eHFDCWFVtmaQN1oBq/mlyHaFBN35N2SWK9Xnr
 VPEcyS60IOJWBgyp/zefBh+JETMFjzTxbfU6snJFMZsepZnmSsKXzYbOPYeG243dM39m
 t/ErN6/Zb6l/dyfktL//ro0q3UesSG4VdTKr5IMktAyih1Q5Oej+cGJdwWE+WVRd+JU6
 RCSg==
X-Gm-Message-State: APjAAAVy8C80KGpla5leHewqkEMJlt1Y6s4Xm6+dUArjg/n0mU3Wwt7+
 QTdW56iF/NX8hHV1hHQip9SanTVa/X2bGxg+9DGAmfCc
X-Google-Smtp-Source: APXvYqxcLEggJ72D8Lj2lCI586YjpNi7qxQYDK/BshXU8tCNo7ZvXO31b1JefGAKymISq0+ICT6XxxcqioY83e9pQhM=
X-Received: by 2002:a67:8dc5:: with SMTP id
 p188mr15553242vsd.121.1557817383009; 
 Tue, 14 May 2019 00:03:03 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 14 May 2019 17:02:52 +1000
Message-ID: <CACAvsv77U7_bWYy9CUVGU8zAE0NZcKOLp6kUgppgq9HPd0tBnw@mail.gmail.com>
Subject: nouveau-fixes 5.2
To: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=KZSOEtw2b+ihnKnrGZWNr36HLCtaAg8cSIpWNk8JChc=;
 b=lMrDOjlELyVdqp5KPNEqGhItxfqTMPZWH6e7tE/ftFIVUMFZppc7CI7zuJRBVtFV2m
 vWBnE3R8h645qlBFQuoJqX7A9iK1MoYpMV5v4IfBzJQ+a00ZDBrzx9FAtGvavnuV6vxi
 l1o5P1uIMXCr3YWNqJEnRoE9gkZyTP8WZMIFdCRPT2/6MC9PcbxXjqjDg+FbqJECTFPJ
 EYMKujMwt7hPntYgxvnzlAA1piTzmSKNXIKfg8yYtY6UCDin0bxPDKj2qBCxBNkGt4xc
 4DuKMTlOTE4gK9dSVbsDxC7S34vqWi0CcjMBbE4UUUzYj0rr0BalJ1tfSkU8y9i+b5i0
 NEBw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5LAoKTW9zdGx5IGZpeGVzIGZvciBhIG51bWJlciBvZiBtb2Rlc2V0dGluZy1yZWxhdGVkIGlz
c3VlcyB0aGF0IGhhdmUgYmVlbgpyZXBvcnRlZCwgYXMgd2VsbCBhcyBpbml0aWFsIHN1cHBvcnQg
Zm9yIFRVMTE3IG1vZGVzZXR0aW5nLiAgVFUxMTYKYWxzbyBleGlzdHMgdGhlc2UgZGF5cywgYnV0
IGlzIG5vdCBvZmZpY2lhbGx5IHN1cHBvcnRlZCwgYXMgSSBkb24ndApoYXZlIEhXIHlldCB0byB2
ZXJpZnkgYWdhaW5zdC4KClRoYW5rcywKQmVuLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNl
IGNvbW1pdCAzMGRmMTZiOTNiMjVmZTM0NWU0YzVkNGU5Yzc4OWQzZjRmMzM3YjcyOgoKICBkcm0v
bm91dmVhdS9ub3V2ZWF1OiBmb3J3YXJkIGVycm9yIGdlbmVyYXRlZCB3aGlsZSByZXN1bWluZyBv
YmplY3RzCnRyZWUgKDIwMTktMDUtMDEgMTE6MDg6MzkgKzEwMDApCgphcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0aHViLmNvbS9za2VnZ3NiL2xpbnV4
IGxpbnV4LTUuMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGM0YTUyZDY2OTY5MDQy
M2VlM2M5OWQ4ZWRhMWU2OWNkMDgyMWZjYWQ6CgogIGRybS9ub3V2ZWF1OiBmaXggZHVwbGljYXRp
b24gb2YgbnY1MF9oZWFkX2F0b20gc3RydWN0ICgyMDE5LTA1LTE0CjE2OjU4OjA2ICsxMDAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpCZW4gU2tlZ2dzICg2KToKICAgICAgZHJtL25vdXZlYXUva21zL2d2MTAwLTogZml4
IHNwdXJpb3VzIHdpbmRvdyBpbW1lZGlhdGUgaW50ZXJsb2NrcwogICAgICBkcm0vbm91dmVhdS9r
bXMvbnY1MC06IGZpeCBidWcgcHJldmVudGluZyBub24tdnN5bmMnZCBwYWdlIGZsaXBzCiAgICAg
IGRybS9ub3V2ZWF1L2ttcy9nZjExOS1ncDEweDogcHVzaCBIZWFkU2V0Q29udHJvbE91dHB1dFJl
c291cmNlKCkKbXRoZCB3aGVuIGVuY29kZXJzIGNoYW5nZQogICAgICBkcm0vbm91dmVhdS9jb3Jl
OiBhbGxvdyBkZXRlY3RlZCBjaGlwc2V0IHRvIGJlIG92ZXJyaWRkZW4KICAgICAgZHJtL25vdXZl
YXUvY29yZTogaW5pdGlhbCBzdXBwb3J0IGZvciBib2FyZHMgd2l0aCBUVTExNyBjaGlwc2V0CiAg
ICAgIGRybS9ub3V2ZWF1L2Rpc3AvZHA6IHJlc3BlY3Qgc2luayBsaW1pdHMgd2hlbiBzZWxlY3Rp
bmcgZmFpbHNhZmUKbGluayBjb25maWd1cmF0aW9uCgpQZXRlcmlzIFJ1ZHp1c2lrcyAoMSk6CiAg
ICAgIGRybS9ub3V2ZWF1OiBmaXggZHVwbGljYXRpb24gb2YgbnY1MF9oZWFkX2F0b20gc3RydWN0
CgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5oICAgICAgICAgICB8ICAx
ICsKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYyAgICAgICAgICAgfCAg
MyArKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL3dpbW1jMzdiLmMgICAgICAg
fCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC93bmR3LmMgICAgICAgICAg
IHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyAgICAgICAg
ICAgICB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNl
L2Jhc2UuYyB8IDYwCisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGlz
cC9kcC5jICAgICB8IDExICsrKysrKysrKy0tCiA3IGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
