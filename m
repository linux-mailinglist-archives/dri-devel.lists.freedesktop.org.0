Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E277D66754
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 09:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA1B6E2CF;
	Fri, 12 Jul 2019 07:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anchovy1.45ru.net.au (anchovy1.45ru.net.au [203.30.46.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479DD6E15A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 08:32:06 +0000 (UTC)
Received: (qmail 12549 invoked by uid 5089); 11 Jul 2019 08:32:04 -0000
Received: by simscan 1.2.0 ppid: 12385, pid: 12386, t: 0.0766s
 scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL: $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au)
 (preid@electromag.com.au@203.59.235.95)
 by anchovy1.45ru.net.au with ESMTPA; 11 Jul 2019 08:32:03 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
 id 64E6720971BAB; Thu, 11 Jul 2019 16:32:00 +0800 (AWST)
From: Phil Reid <preid@electromag.com.au>
To: gregkh@linuxfoundation.org, bhanusreemahesh@gmail.com,
 leobras.c@gmail.com, nishadkamdar@gmail.com, preid@electromag.com.au,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 devel@driverdev.osuosl.org, nsaenzjulienne@suse.de
Subject: [PATCH 2/2] Staging: fbtft: Fix reset assertion when using gpio
 descriptor
Date: Thu, 11 Jul 2019 16:31:53 +0800
Message-Id: <1562833913-10510-3-git-send-email-preid@electromag.com.au>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562833913-10510-1-git-send-email-preid@electromag.com.au>
References: <1562833913-10510-1-git-send-email-preid@electromag.com.au>
X-Mailman-Approved-At: Fri, 12 Jul 2019 07:00:44 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHlwaWNhbGx5IGdwaW9kX3NldF92YWx1ZSBjYWxscyB3b3VsZCBhc3NlcnQgdGhlIHJlc2V0IGxp
bmUgYW5kCnRoZW4gcmVsZWFzZSBpdCB1c2luZyB0aGUgc3ltYW50aWNzIG9mOgoJZ3Bpb2Rfc2V0
X3ZhbHVlKHBhci0+Z3Bpby5yZXNldCwgMCk7CgkuLi4gZGVsYXkKCWdwaW9kX3NldF92YWx1ZShw
YXItPmdwaW8ucmVzZXQsIDEpOwpBbmQgdGhlIGdwaW8gYmluZGluZyB3b3VsZCBzcGVjaWZ5IHRo
ZSBwb2xhcml0eS4KClByaW9yIHRvIGNvbnZlcnNpb24gdG8gZ3Bpb2QgY2FsbHMgdGhlIHBvbGFy
aXR5IGluIHRoZSBEVAp3YXMgaWdub3JlZCBhbmQgYXNzdW1lZCB0byBiZSBhY3RpdmUgbG93LiBG
aXggaXQgc28gdGhhdApEVCBwb2xhcml0eSBpcyByZXNwZWN0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBQ
aGlsIFJlaWQgPHByZWlkQGVsZWN0cm9tYWcuY29tLmF1PgotLS0KIGRyaXZlcnMvc3RhZ2luZy9m
YnRmdC9mYnRmdC1jb3JlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2Zi
dGZ0LWNvcmUuYyBiL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3JlLmMKaW5kZXggNDRi
ODA3NC4uYmM3NTAyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNv
cmUuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jCkBAIC0yMzEsOSAr
MjMxLDkgQEAgc3RhdGljIHZvaWQgZmJ0ZnRfcmVzZXQoc3RydWN0IGZidGZ0X3BhciAqcGFyKQog
CWlmICghcGFyLT5ncGlvLnJlc2V0KQogCQlyZXR1cm47CiAJZmJ0ZnRfcGFyX2RiZyhERUJVR19S
RVNFVCwgcGFyLCAiJXMoKVxuIiwgX19mdW5jX18pOwotCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVl
cChwYXItPmdwaW8ucmVzZXQsIDApOwotCXVzbGVlcF9yYW5nZSgyMCwgNDApOwogCWdwaW9kX3Nl
dF92YWx1ZV9jYW5zbGVlcChwYXItPmdwaW8ucmVzZXQsIDEpOworCXVzbGVlcF9yYW5nZSgyMCwg
NDApOworCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChwYXItPmdwaW8ucmVzZXQsIDApOwogCW1z
bGVlcCgxMjApOwogfQogCi0tIAoxLjguMy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
