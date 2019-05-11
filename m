Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A685E1A98E
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 23:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2362589ADC;
	Sat, 11 May 2019 21:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BF589ADC
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 21:07:41 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8FF5529;
 Sat, 11 May 2019 23:07:35 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/10] [HACK] arm64: dts: renesas: ebisu: Enable LVDS
 dual-link operation
Date: Sun, 12 May 2019 00:07:02 +0300
Message-Id: <20190511210702.18394-11-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557608856;
 bh=bmbKUjFfXfWcRKkJYDUDqgF0lrUm8PwxkmraXp84bsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H6AORLeJz9YTOdJafWdKzYfFt+goi5A36UJklymkx19lPaM3i0lHCDV10OyancW9Z
 2WuHW3YUZnZ2kXzt9XGLxwh2cSzNPyAYUCxr/K6VIguxIdV/VJO0slxmPrGHaZjhn2
 BPNR8Wuyukf3PT8FoKK2HeL/ZtrbbgiPp0bMsT5U=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlIGFuZCBjb25uZWN0IHRoZSBzZWNvbmQgTFZEUyBlbmNvZGVyIHRvIHRoZSBzZWNvbmQg
TFZEUyBpbnB1dCBvZgp0aGUgVEhDNjNMVkQxMDI0IGZvciBkdWFsLWxpbmsgTFZEUyBvcGVyYXRp
b24uIFRoaXMgcmVxdWlyZXMgY2hhbmdpbmcKdGhlIGRlZmF1bHQgc2V0dGluZ3Mgb2YgU1c0NSBh
bmQgU1c0NyB0byBPRkYgYW5kIE9OIHJlc3BlY3RpdmVseS4KClNpZ25lZC1vZmYtYnk6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgot
LS0KIC4uLi9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLWViaXN1LmR0cyB8IDIxICsr
KysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3
Nzk5MC1lYmlzdS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAtZWJp
c3UuZHRzCmluZGV4IDE0NGMwODIwY2Y2MC4uODhiZGJmNGZjODJjIDEwMDY0NAotLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAtZWJpc3UuZHRzCisrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC1lYmlzdS5kdHMKQEAgLTkzLDExICs5MywxOCBA
QAogCiAJCQlwb3J0QDAgewogCQkJCXJlZyA9IDwwPjsKLQkJCQl0aGM2M2x2ZDEwMjRfaW46IGVu
ZHBvaW50IHsKKwkJCQl0aGM2M2x2ZDEwMjRfaW4wOiBlbmRwb2ludCB7CiAJCQkJCXJlbW90ZS1l
bmRwb2ludCA9IDwmbHZkczBfb3V0PjsKIAkJCQl9OwogCQkJfTsKIAorCQkJcG9ydEAxIHsKKwkJ
CQlyZWcgPSA8MT47CisJCQkJdGhjNjNsdmQxMDI0X2luMTogZW5kcG9pbnQgeworCQkJCQlyZW1v
dGUtZW5kcG9pbnQgPSA8Jmx2ZHMxX291dD47CisJCQkJfTsKKwkJCX07CisKIAkJCXBvcnRAMiB7
CiAJCQkJcmVnID0gPDI+OwogCQkJCXRoYzYzbHZkMTAyNF9vdXQ6IGVuZHBvaW50IHsKQEAgLTQ1
MSwxNyArNDU4LDI3IEBACiAJcG9ydHMgewogCQlwb3J0QDEgewogCQkJbHZkczBfb3V0OiBlbmRw
b2ludCB7Ci0JCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZ0aGM2M2x2ZDEwMjRfaW4+OworCQkJCXJl
bW90ZS1lbmRwb2ludCA9IDwmdGhjNjNsdmQxMDI0X2luMD47CiAJCQl9OwogCQl9OwogCX07CiB9
OwogCiAmbHZkczEgeworCXN0YXR1cyA9ICJva2F5IjsKKwogCWNsb2NrcyA9IDwmY3BnIENQR19N
T0QgNzI3PiwKIAkJIDwmeDEzX2Nsaz4sCiAJCSA8JmV4dGFsX2Nsaz47CiAJY2xvY2stbmFtZXMg
PSAiZmNrIiwgImRjbGtpbi4wIiwgImV4dGFsIjsKKworCXBvcnRzIHsKKwkJcG9ydEAxIHsKKwkJ
CWx2ZHMxX291dDogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGhjNjNsdmQx
MDI0X2luMT47CisJCQl9OworCQl9OworCX07CiB9OwogCiAmb2hjaTAgewotLSAKUmVnYXJkcywK
CkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
