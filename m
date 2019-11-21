Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A2C105312
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 14:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B496EE85;
	Thu, 21 Nov 2019 13:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BECC6EE6D;
 Thu, 21 Nov 2019 13:29:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E188020708;
 Thu, 21 Nov 2019 13:29:32 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: Fix Kconfig indentation
Date: Thu, 21 Nov 2019 21:29:30 +0800
Message-Id: <20191121132930.29544-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574342975;
 bh=0aOPNq5lXI55EI7T6Z/U8tjiPKHmWfdsWlLmyY7a3Rs=;
 h=From:To:Cc:Subject:Date:From;
 b=vZ/TGfN092xHxItzh1k40rwiwOfUH8RR41oFZrUozW73w3jkMOB3rXuCRdOAIfZsf
 tZHj0xy3DLTiYeAppfN2UI574SG+rSkdRLCthqDlTkUbg4VhY2htsgnKfHHrdCyp08
 SNHZoCZPyj8TdNLeMi5hNX454ZyZqJdCZsiCsVeg=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYWNwL0tjb25m
aWcgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYWNwL0tjb25maWcg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FjcC9LY29uZmlnCmluZGV4IGQ5NjhjMjQ3MTQxMi4uMTli
YWU5MTAwZGE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FjcC9LY29uZmlnCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYWNwL0tjb25maWcKQEAgLTIsMTEgKzIsMTEgQEAKIG1l
bnUgIkFDUCAoQXVkaW8gQ29Qcm9jZXNzb3IpIENvbmZpZ3VyYXRpb24iCiAKIGNvbmZpZyBEUk1f
QU1EX0FDUAotICAgICAgIGJvb2wgIkVuYWJsZSBBTUQgQXVkaW8gQ29Qcm9jZXNzb3IgSVAgc3Vw
cG9ydCIKLSAgICAgICBkZXBlbmRzIG9uIERSTV9BTURHUFUKLSAgICAgICBzZWxlY3QgTUZEX0NP
UkUKLSAgICAgICBzZWxlY3QgUE1fR0VORVJJQ19ET01BSU5TIGlmIFBNCi0gICAgICAgaGVscAor
CWJvb2wgIkVuYWJsZSBBTUQgQXVkaW8gQ29Qcm9jZXNzb3IgSVAgc3VwcG9ydCIKKwlkZXBlbmRz
IG9uIERSTV9BTURHUFUKKwlzZWxlY3QgTUZEX0NPUkUKKwlzZWxlY3QgUE1fR0VORVJJQ19ET01B
SU5TIGlmIFBNCisJaGVscAogCUNob29zZSB0aGlzIG9wdGlvbiB0byBlbmFibGUgQUNQIElQIHN1
cHBvcnQgZm9yIEFNRCBTT0NzLgogCVRoaXMgYWRkcyB0aGUgQUNQIChBdWRpbyBDb1Byb2Nlc3Nv
cikgSVAgZHJpdmVyIGFuZCB3aXJlcwogCWl0IHVwIGludG8gdGhlIGFtZGdwdSBkcml2ZXIuICBU
aGUgQUNQIGJsb2NrIHByb3ZpZGVzIHRoZSBETUEKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
