Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249979C6A0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54EF6E141;
	Mon, 26 Aug 2019 00:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud7.xs4all.net (lb3-smtp-cloud7.xs4all.net
 [194.109.24.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488956EC77
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:07:29 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 17PdikOP3Thuu17PhiogyH; Fri, 23 Aug 2019 13:07:27 +0200
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v5.3] cec-adap: return from cec_s_conn_info() if adap is
 invalid
Message-ID: <8dc2a979-ed12-6486-491d-35d216b3450b@xs4all.nl>
Date: Fri, 23 Aug 2019 13:07:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4wfBxWB5x8jp3jOBbxkAlZJSsBvIQLS2KsAsZNqTiqDjORKeYH2HjKiQNMgOlXCr83c9DuSqXjqJxgxjLiBDJt1jPpsQ/sF69letl7RAAKtBdKiF8uw7Q1
 WzUiLAQ3ROCFgooN5EHcevAGnedFv6drEx3gJrKZzPhi4EwsYOuCFYQNZuB8vddObUfZoCuSlSzGawDKuVpqi2bdEdeMp33XgzsGjt2jzOJgE7KrrZP4pe1Y
 wX6NV+JufobqoyrWWEHLkel/EvojE4Xk0uDJ9Fr3Wng=
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:57 +0000
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
Cc: Dariusz Marcinkiewicz <darekm@google.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hlY2sgaWYgY2VjX3NfY29ubl9pbmZvIGlzIGNhbGxlZCB3aXRoIGEgdmFsaWQgY2VjIGFkYXB0
ZXIsCmRvIG5vdGhpbmcgaWYgaXQgaXMgaW52YWxpZC4KClRoaXMgbWFrZXMgaXQgcG9zc2libGUg
dG8gY2FsbCB0aGlzIGZ1bmN0aW9uIGV2ZW4gaWYgQ0VDIHN1cHBvcnQgaXMKZGlzYWJsZWQgaW4g
dGhlIGtlcm5lbCBjb25maWcuCgpTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWls
LWNpc2NvQHhzNGFsbC5ubD4KLS0tCiBkcml2ZXJzL21lZGlhL2NlYy9jZWMtYWRhcC5jIHwgMyAr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL2NlYy9jZWMtYWRhcC5jIGIvZHJpdmVycy9tZWRpYS9jZWMvY2VjLWFkYXAuYwppbmRl
eCA0NTFjNjFiZGU0ZDQuLjVlZjdkYWViOGNiZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9j
ZWMvY2VjLWFkYXAuYworKysgYi9kcml2ZXJzL21lZGlhL2NlYy9jZWMtYWRhcC5jCkBAIC0xNjE0
LDYgKzE2MTQsOSBAQCBFWFBPUlRfU1lNQk9MX0dQTChjZWNfc19waHlzX2FkZHJfZnJvbV9lZGlk
KTsKIHZvaWQgY2VjX3NfY29ubl9pbmZvKHN0cnVjdCBjZWNfYWRhcHRlciAqYWRhcCwKIAkJICAg
ICBjb25zdCBzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9pbmZvICpjb25uX2luZm8pCiB7CisJaWYgKElT
X0VSUl9PUl9OVUxMKGFkYXApKQorCQlyZXR1cm47CisKIAlpZiAoIShhZGFwLT5jYXBhYmlsaXRp
ZXMgJiBDRUNfQ0FQX0NPTk5FQ1RPUl9JTkZPKSkKIAkJcmV0dXJuOwoKLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
