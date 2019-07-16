Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E20886A056
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631DA6E072;
	Tue, 16 Jul 2019 01:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anchovy2.45ru.net.au (anchovy2.45ru.net.au [203.30.46.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497C689FEA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 00:25:07 +0000 (UTC)
Received: (qmail 25523 invoked by uid 5089); 16 Jul 2019 00:25:04 -0000
Received: by simscan 1.2.0 ppid: 25478, pid: 25481, t: 0.0488s
 scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL: $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au)
 (preid@electromag.com.au@203.59.235.95)
 by anchovy3.45ru.net.au with ESMTPA; 16 Jul 2019 00:25:04 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
 id E4261200A395E; Tue, 16 Jul 2019 08:24:59 +0800 (AWST)
From: Phil Reid <preid@electromag.com.au>
To: gregkh@linuxfoundation.org, bhanusreemahesh@gmail.com,
 leobras.c@gmail.com, nsaenzjulienne@suse.de, nishadkamdar@gmail.com,
 preid@electromag.com.au, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 0/2] Staging: fbtft: Fix probing of gpio descriptor
Date: Tue, 16 Jul 2019 08:24:35 +0800
Message-Id: <1563236677-5045-1-git-send-email-preid@electromag.com.au>
X-Mailer: git-send-email 1.8.3.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R1BJTyBwcm9iaW5nIGFuZCByZXNldCBwb2xhcml0eSBhcmUgYnJva2VuLgpGaXggdGhlbS4KCkZp
eGVzOiBjNDQwZWVlMWE3YTEgKCJTdGFnaW5nOiBmYnRmdDogU3dpdGNoIHRvIHRoZSBncGlvIGRl
c2NyaXB0b3IgaW50ZXJmYWNlIikKCkNoYW5nZXMgZnJvbSB2MjoKLSBBZGQgZml4ZXMgdGFnIHRv
ICJGaXggcmVzZXQgYXNzZXJ0aW9uIHdoZW4gdXNpbmcgZ3BpbyBkZXNjcmlwdG9yIgotIEFkZCB0
ZXN0ZWQtYnkgLyByZXZpZXdlZC1ieSB0YWdzCgpQaGlsIFJlaWQgKDIpOgogIFN0YWdpbmc6IGZi
dGZ0OiBGaXggcHJvYmluZyBvZiBncGlvIGRlc2NyaXB0b3IKICBTdGFnaW5nOiBmYnRmdDogRml4
IHJlc2V0IGFzc2VydGlvbiB3aGVuIHVzaW5nIGdwaW8gZGVzY3JpcHRvcgoKIGRyaXZlcnMvc3Rh
Z2luZy9mYnRmdC9mYnRmdC1jb3JlLmMgfCA0MyArKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9u
cygtKQoKLS0gCjEuOC4zLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
