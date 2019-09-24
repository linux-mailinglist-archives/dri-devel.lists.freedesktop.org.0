Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1896BBCCC0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6446EA69;
	Tue, 24 Sep 2019 16:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6866EA66;
 Tue, 24 Sep 2019 16:42:45 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 115B4217F4;
 Tue, 24 Sep 2019 16:42:43 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 20/87] drm/amd/display: Use proper enum conversion
 functions
Date: Tue, 24 Sep 2019 12:40:36 -0400
Message-Id: <20190924164144.25591-20-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343365;
 bh=YhMxZFoY6IL1aOj/xsge9Nvb1sMx8PA81BVaG9x7qes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iw9cy7aldZbXmWlIU8gSG8xe7tHvB0CqlwjC9RpvuVvTGI0vAOFuwa75L41lTKcnn
 6LqbRxz2NcM8dO0bjSRrE6lrwWAoYCr1Zk94AKWX/2OxP/hvbkFuvVgVAhsOHGP1gu
 SDUeQr40oWJwy3SI0EDGPcoJz9iwhf9PBunYp09o=
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KClsgVXBz
dHJlYW0gY29tbWl0IGQxOTZiYmJjMjhmYWI4MjYyNGY3Njg2ZjhiMGRhOGU4NjQ0YjZlNmEgXQoK
Y2xhbmcgd2FybnM6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fcHBfc211LmM6MzM2Ojg6Cndhcm5pbmc6IGltcGxpY2l0IGNvbnZlcnNp
b24gZnJvbSBlbnVtZXJhdGlvbiB0eXBlICdlbnVtIHNtdV9jbGtfdHlwZScKdG8gZGlmZmVyZW50
IGVudW1lcmF0aW9uIHR5cGUgJ2VudW0gYW1kX3BwX2Nsb2NrX3R5cGUnClstV2VudW0tY29udmVy
c2lvbl0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRjX3RvX3NtdV9j
bG9ja190eXBlKGNsa190eXBlKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jOjQyMToxNDoKd2Fy
bmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIGVudW1lcmF0aW9uIHR5cGUgJ2VudW0KYW1k
X3BwX2Nsb2NrX3R5cGUnIHRvIGRpZmZlcmVudCBlbnVtZXJhdGlvbiB0eXBlICdlbnVtIHNtdV9j
bGtfdHlwZScKWy1XZW51bS1jb252ZXJzaW9uXQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZGNfdG9fcHBfY2xvY2tfdHlwZShjbGtfdHlwZSksCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
ClRoZXJlIGFyZSBmdW5jdGlvbnMgdG8gcHJvcGVybHkgY29udmVydCBiZXR3ZWVuIGFsbCBvZiB0
aGVzZSB0eXBlcywgdXNlCnRoZW0gc28gdGhlcmUgYXJlIG5vIGxvbmdlciBhbnkgd2FybmluZ3Mu
CgpGaXhlczogYTQzOTEzZWE1MGE1ICgiZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBmdW5jdGlvbiBn
ZXRfY2xvY2tfYnlfdHlwZV93aXRoX2xhdGVuY3kgZm9yIG5hdmkxMCIpCkZpeGVzOiBlNWU0ZTIy
MzkxYzIgKCJkcm0vYW1kL3Bvd2VycGxheTogYWRkIGludGVyZmFjZSB0byBnZXQgY2xvY2sgYnkg
dHlwZSB3aXRoIGxhdGVuY3kgZm9yIGRpc3BsYXkgKHYyKSIpCkxpbms6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzU4NgpTaWduZWQtb2ZmLWJ5OiBOYXRo
YW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogTGVv
IExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hh
bEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX3BwX3NtdS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKaW5kZXggNTkyZmE0OTljOWY4Ni4u
OTU5NGMxNTQ2NjRmYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKQEAgLTMzNCw3ICszMzQsNyBAQCBib29s
IGRtX3BwX2dldF9jbG9ja19sZXZlbHNfYnlfdHlwZSgKIAkJfQogCX0gZWxzZSBpZiAoYWRldi0+
c211LmZ1bmNzICYmIGFkZXYtPnNtdS5mdW5jcy0+Z2V0X2Nsb2NrX2J5X3R5cGUpIHsKIAkJaWYg
KHNtdV9nZXRfY2xvY2tfYnlfdHlwZSgmYWRldi0+c211LAotCQkJCQkgIGRjX3RvX3NtdV9jbG9j
a190eXBlKGNsa190eXBlKSwKKwkJCQkJICBkY190b19wcF9jbG9ja190eXBlKGNsa190eXBlKSwK
IAkJCQkJICAmcHBfY2xrcykpIHsKIAkJCWdldF9kZWZhdWx0X2Nsb2NrX2xldmVscyhjbGtfdHlw
ZSwgZGNfY2xrcyk7CiAJCQlyZXR1cm4gdHJ1ZTsKQEAgLTQxOSw3ICs0MTksNyBAQCBib29sIGRt
X3BwX2dldF9jbG9ja19sZXZlbHNfYnlfdHlwZV93aXRoX2xhdGVuY3koCiAJCQlyZXR1cm4gZmFs
c2U7CiAJfSBlbHNlIGlmIChhZGV2LT5zbXUucHB0X2Z1bmNzICYmIGFkZXYtPnNtdS5wcHRfZnVu
Y3MtPmdldF9jbG9ja19ieV90eXBlX3dpdGhfbGF0ZW5jeSkgewogCQlpZiAoc211X2dldF9jbG9j
a19ieV90eXBlX3dpdGhfbGF0ZW5jeSgmYWRldi0+c211LAotCQkJCQkJICAgICAgIGRjX3RvX3Bw
X2Nsb2NrX3R5cGUoY2xrX3R5cGUpLAorCQkJCQkJICAgICAgIGRjX3RvX3NtdV9jbG9ja190eXBl
KGNsa190eXBlKSwKIAkJCQkJCSAgICAgICAmcHBfY2xrcykpCiAJCQlyZXR1cm4gZmFsc2U7CiAJ
fQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
