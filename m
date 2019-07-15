Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDBA6A053
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A32A6E06D;
	Tue, 16 Jul 2019 01:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C45898C7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 14:30:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 22189B084;
 Mon, 15 Jul 2019 14:30:07 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: fbtft: Fix wrong check in fbtft_write_wmem16_bus8()
Date: Mon, 15 Jul 2019 16:30:02 +0200
Message-Id: <20190715143003.12819-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
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
Cc: devel@driverdev.osuosl.org, leobras.c@gmail.com,
 linux-fbdev@vger.kernel.org, nishadkamdar@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, bhanusreemahesh@gmail.com,
 preid@electromag.com.au, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgYWN0dWFsbHkgd2FudCB0byBzZXQgdGhlIGdwaW8gcGluIGlmIGl0J3MgYXZpbGFibGUsIG5v
dCB0aGUgb3RoZXIgd2F5CmFyb3VuZC4KCkZpeGVzOiBjNDQwZWVlMWE3YTEgKCJTdGFnaW5nOiBm
YnRmdDogU3dpdGNoIHRvIHRoZSBncGlvIGRlc2NyaXB0b3IgaW50ZXJmYWNlIikKU2lnbmVkLW9m
Zi1ieTogTmljb2xhcyBTYWVueiBKdWxpZW5uZSA8bnNhZW56anVsaWVubmVAc3VzZS5kZT4KLS0t
CiBkcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0
YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVzLmMgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVz
LmMKaW5kZXggMmVhODE0ZDBkY2E1Li42M2M2NWRkNjdiMTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
c3RhZ2luZy9mYnRmdC9mYnRmdC1idXMuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0
ZnQtYnVzLmMKQEAgLTEzNSw3ICsxMzUsNyBAQCBpbnQgZmJ0ZnRfd3JpdGVfdm1lbTE2X2J1czgo
c3RydWN0IGZidGZ0X3BhciAqcGFyLCBzaXplX3Qgb2Zmc2V0LCBzaXplX3QgbGVuKQogCXJlbWFp
biA9IGxlbiAvIDI7CiAJdm1lbTE2ID0gKHUxNiAqKShwYXItPmluZm8tPnNjcmVlbl9idWZmZXIg
KyBvZmZzZXQpOwogCi0JaWYgKCFwYXItPmdwaW8uZGMpCisJaWYgKHBhci0+Z3Bpby5kYykKIAkJ
Z3Bpb2Rfc2V0X3ZhbHVlKHBhci0+Z3Bpby5kYywgMSk7CiAKIAkvKiBub24gYnVmZmVyZWQgd3Jp
dGUgKi8KLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
