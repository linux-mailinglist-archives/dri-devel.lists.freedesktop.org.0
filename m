Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1496D13A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 17:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E286E408;
	Thu, 18 Jul 2019 15:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAE26E408;
 Thu, 18 Jul 2019 15:37:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i21so27828331ljj.3;
 Thu, 18 Jul 2019 08:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=msF3MVYkbWCmjlEsllEC7ghJ5l8dCQMz96G7rmDoUUs=;
 b=nFi5oOgHK2b5OXFYVSeEHbBY+6h7Pm4O0mi7cl3V3gjCQoNifoCv6gutup67r0rdXx
 5086VWH2wzcvN8fs1kA1V621LD91m1vShCtvGmHicWY/GW442LbYqv+zhd/cqmPiQTxI
 VqGcl0LpFGugy7a3gT1F/OeVcqtEw6bCPr6PmmzzBsFA2VTqwfvfWcPtfR5x5glj6q2c
 rItQ86gCYCBcLoj5QJTfdcOv7MgGOxnlX0DeFcZfgrooHQ7LtNg/CkKz+sOHHttgFX8U
 s0yxAXlkDBz2TAoeW+OxOoNLEd2FQXJ4YCG/pXvpfvqf6SGI+MlxPSMOsST6RT0Qe3ZG
 Qp4g==
X-Gm-Message-State: APjAAAWPnlFq2Rx3pdX04Rujlx7h07h0P/7TfQ5UH7f6i9hm3z8mma2C
 /0b6t35sEdVGYfMEIsv9QquUO5EqFoM=
X-Google-Smtp-Source: APXvYqzv6M83aU/o3XY9NT32NNB3rX4F1M7oXnOeQj3WOATt+zjKczACrpGph8W1PElcXza+vx8rUA==
X-Received: by 2002:a2e:994:: with SMTP id 142mr24257597ljj.130.1563464269897; 
 Thu, 18 Jul 2019 08:37:49 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c30sm4062388lfp.70.2019.07.18.08.37.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 08:37:49 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH/RFT v1 0/6] drm/via: drop use of deprecated headers drmP.h and
 drm_os_linux.h
Date: Thu, 18 Jul 2019 17:37:31 +0200
Message-Id: <20190718153737.28657-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=msF3MVYkbWCmjlEsllEC7ghJ5l8dCQMz96G7rmDoUUs=;
 b=JohCTUsi0fX0Nh5yIQ80jsi68ITeDFUnZ75TLf2NKpLdPvd7mOc5qaconMdOQlpsO0
 sHsawWnyJF3prKBZVFFvJpjW3pZkV/cEpe2NcPaAtCGG65RSB3itXs6W17O3P6j5swgX
 nJS9GzxnpgpGQtrVwi+JZcNNDWhSqUFXE1KhY/OLAghvDFdO+Q0mN/Pf8dEht8xm2Apo
 F858pozRCsDQHGQF1EMVdb+ngW85xxa2rB2Va58pAS1r+YTwo23HV/1TtBc4yWbv6aL/
 w5HLGowpg/Bd6Ap2+Egeub/gu14bNeC+Ynlegm4H6e7CpwHMazkoYloPOvFyVE40YEFO
 m5ZA==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kevin Brace <kevinbrace@gmx.com>, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBzb21lIGphbml0b3JpYWwgdXBkYXRlcyB0byB0aGUgdmlhIGRyaXZlcgp0aGF0IGlz
IHJlcXVpcmVkIHRvIGdldCByaWQgb2YgZGVwcmVjYXRlZCBoZWFkZXJzCmluIHRoZSBkcm0gc3Vi
c3lzdGVtLgoKVGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgYXJlIHRyaXZpYWwsIHdoZXJlCnRoZSBk
ZXBlbmRlbmNpZXMgb24gZHJtUC5oIGFuZCBkcm1fb3NfbGludXggYXJlIGRyb3BwZWQuCgpUaGUg
cmVtYWluaW5nIHRocmVlIHBhdGNoZXMgZHJvcCB1c2Ugb2YgRFJNX1dBSVRfT04oKS4KVGhleSBh
cmUgcmVwbGFjZWQgYnkgd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQoKS4KVGhlc2Ug
cGF0Y2hlcyBjb3VsZCB1c2UgYSBtb3JlIGNyaXRpY2FsIHJldmlldy4KCldoZW4gcmVwbGFjaW5n
IERSTV9XQUlUX09OKCkgSSB0b29rIGNhcmUgdG8gbm90IGNoYW5nZSB0aGUgdWFwaSwKYnkgY29u
dGludWUgdG8gdXNlIHRoZSBvcmlnaW5hbCByZXR1cm4gY29kZXMuCgpUaGUgZm9sbG93aW5nIHRh
YmxlIHdhcyB1c2VkIGZvciB0aGUgdHJhbnNpdGlvbjoKCiAgICAgICAgICAgICAgIERSTV9XQUlU
X09OICAgd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQKICAgICAgICAgICAgICAgLS0t
LS0tLS0tLS0gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpjb25kaXRpb24gT0s6
ICAgIHJldCAgICAgICAgICAgICAgICAgICA+PSAxCnRpbWVvdXQ6ICAgICAgICAtRUJVU1kgICAg
ICAgICAgICAgICAgICAwCmludGVycnVwdGVkOiAgICAtRUlOVFIgICAgICAgICAgICAgLUVSRVNU
QVJUU1lTCgpUaGUgY2hhbmdlcyBoYXMgYmVlbiBidWlsZCB0ZXN0ZWQgb25seS4KVGVzdGluZyBv
biBhIHJlYWwgZGV2aWNlIHdvdWxkIGJlIGhpZ2hseSBhcHByZWNpYXRlZC4KCkkgaGFkIHByZWZl
cnJlZCB0aGF0IHRoZSB2aWEgZHJpdmVyIHdhcyByZXBsYWNlZCBieSB0aGUKb3BlbmNocm9tZSBk
cml2ZXIsIGJ1dCB1bnRpbCB3ZSBoYXZlIGl0IHRoZW4gd2UgbmVlZAp0byBkZWFsIHdpdGggdGhl
IGxlZ2FjeSB2aWEgZHJpdmVyIHRvIHJlbW92ZSBvbGQgY3J1ZnQKaW4gdGhlIGRybSBzdWJzeXN0
ZW0uCgpOb3RlOiBBIHNpbXBsZXIgYXBwcm9hY2ggaGFkIGJlZW4gdG8gY29weSBEUk1fV0FJVF9P
Tgp0byB2aWFfZHJ2LmgsIGJ1dCB0aGVuIHRoZSBhY3R1YWwgc29sdXRpb24gaXMKcHJlc3VtZWFi
bHkgYmV0dGVyLgoKCVNhbQoKClNhbSBSYXZuYm9yZyAoNik6CiAgICAgIGRybS92aWE6IGRyb3Ag
dXNlIG9mIERSTShSRUFEfFdSSVRFKSBtYWNyb3MKICAgICAgZHJtL3ZpYTogbWFrZSB2aWFfZHJ2
Lmggc2VsZi1jb250YWluZWQKICAgICAgZHJtL3ZpYTogZHJvcCB1c2Ugb2YgZHJtUC5oCiAgICAg
IGRybS92aWE6IGRyb3AgRFJNX1dBSVRfT04oKSBpbiB2aWFfZG1hYmxpdC5jCiAgICAgIGRybS92
aWE6IGRyb3AgRFJNX1dBSVRfT04oKSBpbiB2aWFfaXJxCiAgICAgIGRybS92aWE6IGRyb3AgRFJN
X1dBSVRfT04oKSBpbiB2aWFfdmlkZW8KCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWEuYyAg
ICAgIHwgIDkgKysrKystCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMgIHwgNjYg
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92
aWEvdmlhX2Rydi5jICAgICAgfCAgNyArKy0tCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYu
aCAgICAgIHwgMjEgKysrKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9pcnEuYyAg
ICAgIHwgMzcgKysrKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9t
YXAuYyAgICAgIHwgIDYgKysrLQogZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfbW0uYyAgICAgICB8
ICA3ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX3ZlcmlmaWVyLmMgfCAxMCArKystLS0K
IGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX3ZpZGVvLmMgICAgfCAyMyArKysrKysrKysrLS0tCiA5
IGZpbGVzIGNoYW5nZWQsIDEzNyBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
