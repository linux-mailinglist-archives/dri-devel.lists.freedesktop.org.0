Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5504A9C6C1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727C68994D;
	Mon, 26 Aug 2019 00:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE596EC79
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:13:05 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 17V6ikQhOThuu17V9ioisO; Fri, 23 Aug 2019 13:13:03 +0200
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v5.3] cec-notifier: clear cec_adap in
 cec_notifier_unregister
Message-ID: <9e1f5b53-a717-ad8c-ef23-bf0722a31b31@xs4all.nl>
Date: Fri, 23 Aug 2019 13:12:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4wfHy51X+54zsvnNmUern5YMsETJnPx6KgPZiFRJAIH9r/Eims+z2zLPFFRija6ny0CfuT8YyRfQpfohOYcSZLFBLn1ZtD1sBxRAkq7sA5r9IITuQtcthn
 PLt8UdWRDT7w4838WvOzuugcisCmGin8lzwfDJ6Su/qwK4TvmumtO0UmJSuQDYqk9O7Hz1kQG14rToSDe5l/YA8z0KhNjsz7qkvhDTkD3Q+641ESfwLZv4Fp
 OkNm/l0UjoYzLA88sJrfVmKVJtw7LNW6TpYInvnugK8=
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

SWYgY2VjX25vdGlmaWVyX2NlY19hZGFwX3VucmVnaXN0ZXIoKSBpcyBjYWxsZWQgYmVmb3JlCmNl
Y191bnJlZ2lzdGVyX2FkYXB0ZXIoKSB0aGVuIGV2ZXJ5dGhpbmcgaXMgT0sgKGFuZCB0aGlzIGlz
IHRoZQpjYXNlIHRvZGF5KS4gQnV0IGlmIGl0IGlzIHRoZSBvdGhlciB3YXkgYXJvdW5kLCB0aGVu
CmNlY19ub3RpZmllcl91bnJlZ2lzdGVyKCkgaXMgY2FsbGVkIGZpcnN0LCBhbmQgdGhhdCBkb2Vz
bid0CnNldCBuLT5jZWNfYWRhcCB0byBOVUxMLgoKU28gaWYgZS5nLiBjZWNfbm90aWZpZXJfc2V0
X3BoeXNfYWRkcigpIGlzIGNhbGxlZCBhZnRlcgpjZWNfbm90aWZpZXJfdW5yZWdpc3RlcigpIGJ1
dCBiZWZvcmUgY2VjX3VucmVnaXN0ZXJfYWRhcHRlcigpCnRoZW4gbi0+Y2VjX2FkYXAgcG9pbnRz
IHRvIGFuIHVucmVnaXN0ZXJlZCBhbmQgbGlrZWx5IGRlbGV0ZWQKY2VjIGFkYXB0ZXIuIFNvIGp1
c3Qgc2V0IG4tPmNlY19hZGFwLT5ub3RpZmllciBhbmQgbi0+Y2VjX2FkYXAKdG8gTlVMTCBmb3Ig
cnVidXN0bmVzcy4KCkV2ZW50dWFsbHkgY2VjX25vdGlmaWVyX3VucmVnaXN0ZXIgd2lsbCBkaXNh
cHBlYXIgYW5kIHRoaXMgd2lsbApiZSBzaW1wbGlmaWVkIHN1YnN0YW50aWFsbHkuCgpTaWduZWQt
b2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KLS0tCiBkcml2
ZXJzL21lZGlhL2NlYy9jZWMtbm90aWZpZXIuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2NlYy9jZWMtbm90aWZpZXIu
YyBiL2RyaXZlcnMvbWVkaWEvY2VjL2NlYy1ub3RpZmllci5jCmluZGV4IDUyYTg2N2JkZTE1Zi4u
NGQ4MmE1NTIyMDcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL2NlYy9jZWMtbm90aWZpZXIu
YworKysgYi9kcml2ZXJzL21lZGlhL2NlYy9jZWMtbm90aWZpZXIuYwpAQCAtMjE4LDYgKzIxOCw4
IEBAIHZvaWQgY2VjX25vdGlmaWVyX3VucmVnaXN0ZXIoc3RydWN0IGNlY19ub3RpZmllciAqbikK
CiAJbXV0ZXhfbG9jaygmbi0+bG9jayk7CiAJbi0+Y2FsbGJhY2sgPSBOVUxMOworCW4tPmNlY19h
ZGFwLT5ub3RpZmllciA9IE5VTEw7CisJbi0+Y2VjX2FkYXAgPSBOVUxMOwogCW11dGV4X3VubG9j
aygmbi0+bG9jayk7CiAJY2VjX25vdGlmaWVyX3B1dChuKTsKIH0KLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
