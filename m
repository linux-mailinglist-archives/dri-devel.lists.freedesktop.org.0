Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F33C61053C5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 15:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FBC6E165;
	Thu, 21 Nov 2019 14:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A69D6EF44;
 Thu, 21 Nov 2019 14:02:30 +0000 (UTC)
Received: from localhost (173-25-83-245.client.mchsi.com [173.25.83.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2918C2070B;
 Thu, 21 Nov 2019 14:02:30 +0000 (UTC)
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH 1/7] PCI: Add #defines for Enter Compliance, Transmit Margin
Date: Thu, 21 Nov 2019 08:02:14 -0600
Message-Id: <20191121140220.38030-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191121140220.38030-1-helgaas@kernel.org>
References: <20191121140220.38030-1-helgaas@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574344950;
 bh=QNl5ddLlEQtj52j/MrXKdvbk9C/ac81zzKOpevreAlo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nE13WhF9osewZpyc5VcK5pgYoegxUhErGHh15hrUmRqty2dv5MIKf3XhGCXZpSwOh
 +t4Q9oucbnTf26CkDgDDNN4O4wIC8nyLa2x8f1nix4T6sySG/W6pcJn0Hnt5ZyHgQL
 TI++KCuYgfo2TIGe+nr66fTwAHyswUv7QeM8WNuo=
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
Cc: Frederick Lawler <fred@fredlawl.com>, Dave Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KCkFkZCBkZWZpbml0aW9u
cyBmb3IgdGhlIEVudGVyIENvbXBsaWFuY2UgYW5kIFRyYW5zbWl0IE1hcmdpbiBmaWVsZHMgb2Yg
dGhlClBDSWUgTGluayBDb250cm9sIDIgcmVnaXN0ZXIuCgpMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMTkxMTEyMTczNTAzLjE3NjYxMS0yLWhlbGdhYXNAa2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpSZXZpZXdlZC1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGluY2x1ZGUv
dWFwaS9saW51eC9wY2lfcmVncy5oIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9wY2lfcmVncy5oIGIvaW5jbHVk
ZS91YXBpL2xpbnV4L3BjaV9yZWdzLmgKaW5kZXggMjlkNmU5M2ZkMTVlLi41ODY5ZTU3NzhhMDUg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9wY2lfcmVncy5oCisrKyBiL2luY2x1ZGUv
dWFwaS9saW51eC9wY2lfcmVncy5oCkBAIC02NzMsNiArNjczLDggQEAKICNkZWZpbmUgIFBDSV9F
WFBfTE5LQ1RMMl9UTFNfOF8wR1QJMHgwMDAzIC8qIFN1cHBvcnRlZCBTcGVlZCA4R1QvcyAqLwog
I2RlZmluZSAgUENJX0VYUF9MTktDVEwyX1RMU18xNl8wR1QJMHgwMDA0IC8qIFN1cHBvcnRlZCBT
cGVlZCAxNkdUL3MgKi8KICNkZWZpbmUgIFBDSV9FWFBfTE5LQ1RMMl9UTFNfMzJfMEdUCTB4MDAw
NSAvKiBTdXBwb3J0ZWQgU3BlZWQgMzJHVC9zICovCisjZGVmaW5lICBQQ0lfRVhQX0xOS0NUTDJf
RU5URVJfQ09NUAkweDAwMTAgLyogRW50ZXIgQ29tcGxpYW5jZSAqLworI2RlZmluZSAgUENJX0VY
UF9MTktDVEwyX1RYX01BUkdJTgkweDAzODAgLyogVHJhbnNtaXQgTWFyZ2luICovCiAjZGVmaW5l
IFBDSV9FWFBfTE5LU1RBMgkJNTAJLyogTGluayBTdGF0dXMgMiAqLwogI2RlZmluZSBQQ0lfQ0FQ
X0VYUF9FTkRQT0lOVF9TSVpFT0ZfVjIJNTIJLyogdjIgZW5kcG9pbnRzIHdpdGggbGluayBlbmQg
aGVyZSAqLwogI2RlZmluZSBQQ0lfRVhQX1NMVENBUDIJCTUyCS8qIFNsb3QgQ2FwYWJpbGl0aWVz
IDIgKi8KLS0gCjIuMjQuMC40MzIuZzlkM2Y1ZjViNjMtZ29vZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
