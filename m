Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA4BF973D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 18:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60616EB94;
	Tue, 12 Nov 2019 17:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D346EB93;
 Tue, 12 Nov 2019 17:35:17 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6590F21A49;
 Tue, 12 Nov 2019 17:35:17 +0000 (UTC)
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] PCI: Add #defines for Enter Compliance, Transmit Margin
Date: Tue, 12 Nov 2019 11:35:01 -0600
Message-Id: <20191112173503.176611-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191112173503.176611-1-helgaas@kernel.org>
References: <20191112173503.176611-1-helgaas@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573580117;
 bh=pJWYwPDI1b+7VTqKGjBEhvWsVOjHjFseDOVjhaStdhc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NH3I85rs04Cj7LE2dCGkcVub5miRBedV4VEu+E+WzltzlWm2def9vstZwbHOlX7Uf
 elNI4E9oHPtqqlgyWoXzuQtQHcfS4s0TX6XvSpvXFbxhEg/6RMr17xvTlx3eep9GsQ
 Nwlp0Fw9inZ9IGaFaJwel8v4cOusWuk6JevnY0PA=
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
Cc: Frederick Lawler <fred@fredlawl.com>, linux-pci@vger.kernel.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KCkFkZCBkZWZpbml0aW9u
cyBmb3IgdGhlIEVudGVyIENvbXBsaWFuY2UgYW5kIFRyYW5zbWl0IE1hcmdpbiBmaWVsZHMgb2Yg
dGhlClBDSWUgTGluayBDb250cm9sIDIgcmVnaXN0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBCam9ybiBI
ZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9saW51eC9wY2lf
cmVncy5oIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvdWFwaS9saW51eC9wY2lfcmVncy5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3Bj
aV9yZWdzLmgKaW5kZXggMjlkNmU5M2ZkMTVlLi41ODY5ZTU3NzhhMDUgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvdWFwaS9saW51eC9wY2lfcmVncy5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9wY2lf
cmVncy5oCkBAIC02NzMsNiArNjczLDggQEAKICNkZWZpbmUgIFBDSV9FWFBfTE5LQ1RMMl9UTFNf
OF8wR1QJMHgwMDAzIC8qIFN1cHBvcnRlZCBTcGVlZCA4R1QvcyAqLwogI2RlZmluZSAgUENJX0VY
UF9MTktDVEwyX1RMU18xNl8wR1QJMHgwMDA0IC8qIFN1cHBvcnRlZCBTcGVlZCAxNkdUL3MgKi8K
ICNkZWZpbmUgIFBDSV9FWFBfTE5LQ1RMMl9UTFNfMzJfMEdUCTB4MDAwNSAvKiBTdXBwb3J0ZWQg
U3BlZWQgMzJHVC9zICovCisjZGVmaW5lICBQQ0lfRVhQX0xOS0NUTDJfRU5URVJfQ09NUAkweDAw
MTAgLyogRW50ZXIgQ29tcGxpYW5jZSAqLworI2RlZmluZSAgUENJX0VYUF9MTktDVEwyX1RYX01B
UkdJTgkweDAzODAgLyogVHJhbnNtaXQgTWFyZ2luICovCiAjZGVmaW5lIFBDSV9FWFBfTE5LU1RB
MgkJNTAJLyogTGluayBTdGF0dXMgMiAqLwogI2RlZmluZSBQQ0lfQ0FQX0VYUF9FTkRQT0lOVF9T
SVpFT0ZfVjIJNTIJLyogdjIgZW5kcG9pbnRzIHdpdGggbGluayBlbmQgaGVyZSAqLwogI2RlZmlu
ZSBQQ0lfRVhQX1NMVENBUDIJCTUyCS8qIFNsb3QgQ2FwYWJpbGl0aWVzIDIgKi8KLS0gCjIuMjQu
MC5yYzEuMzYzLmdiMWJjY2QzZTNkLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
