Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16EBD903
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 09:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F8E6EB2F;
	Wed, 25 Sep 2019 07:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C456EADB;
 Tue, 24 Sep 2019 18:13:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4F0DAF03;
 Tue, 24 Sep 2019 18:12:59 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 07/11] dts: arm64: layerscape: add dma-ranges property to
 qoric-mc node
Date: Tue, 24 Sep 2019 20:12:38 +0200
Message-Id: <20190924181244.7159-8-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2019 07:19:29 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, f.fainelli@gmail.com,
 mbrugger@suse.com, wahrenst@gmx.net, james.quinlan@broadcom.com,
 robin.murphy@arm.com, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cW9yaXEtbWMncyBkcG1hY3MgRE1BIGNvbmZpZ3VyYXRpb24gaXMgaW5oZXJpdGVkIGZyb20gdGhl
aXIgcGFyZW50IG5vZGUsCndoaWNoIGFjdHMgYSBidXMgaW4gdGhpcyByZWdhcmQuIFNvIGZhciBp
dCBtYWtlZCBhbGwgZGV2aWNlcyBhcwpkbWEtY29oZXJlbnQgYnV0IG5vIGRtYS1yYW5nZXMgcmVj
b21tZW5kYXRpb24gaXMgbWFkZS4KClRoZSB0cnV0aCBpcyB0aGF0IHRoZSB1bmRlcmx5aW5nIGlu
dGVyY29ubmVjdCBoYXMgRE1BIGNvbnN0cmFpbnRzLCBzbwphZGQgYW4gZW1wdHkgZG1hLXJhbmdl
cyBpbiBxb3JpcS1tYydzIG5vZGUgaW4gb3JkZXIgZm9yIERUJ3MgRE1BCmNvbmZpZ3VyYXRpb24g
Y29kZSB0byBnZXQgdGhlIERNQSBjb25zdHJhaW50cyBmcm9tIGl0LgoKU2lnbmVkLW9mZi1ieTog
Tmljb2xhcyBTYWVueiBKdWxpZW5uZSA8bnNhZW56anVsaWVubmVAc3VzZS5kZT4KLS0tCgogYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA4OGEuZHRzaSB8IDEgKwogYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMjA4eGEuZHRzaSB8IDEgKwogYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEuZHRzaSB8IDEgKwogMyBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHMxMDg4YS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWxzMTA4OGEuZHRzaQppbmRleCBjNjc2ZDA3NzE3NjIuLmYwZDBiNjE0NWI3MiAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA4OGEuZHRzaQorKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDg4YS5kdHNpCkBAIC02OTgs
NiArNjk4LDcgQEAKIAkJCSAgICAgIDwweDAwMDAwMDAwIDB4MDgzNDAwMDAgMCAweDQwMDAwPjsg
LyogTUMgY29udHJvbCByZWcgKi8KIAkJCW1zaS1wYXJlbnQgPSA8Jml0cz47CiAJCQlpb21tdS1t
YXAgPSA8MCAmc21tdSAwIDA+OwkvKiBUaGlzIGlzIGZpeGVkLXVwIGJ5IHUtYm9vdCAqLworCQkJ
ZG1hLXJhbmdlczsKIAkJCWRtYS1jb2hlcmVudDsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDM+Owog
CQkJI3NpemUtY2VsbHMgPSA8MT47CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHMyMDh4YS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWxzMjA4eGEuZHRzaQppbmRleCA3YTBiZThlYWE4NGEuLmZkNjAzNmI3ODY1YyAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMjA4eGEuZHRzaQorKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMyMDh4YS5kdHNpCkBAIC0zNDAs
NiArMzQwLDcgQEAKIAkJCSAgICAgIDwweDAwMDAwMDAwIDB4MDgzNDAwMDAgMCAweDQwMDAwPjsg
LyogTUMgY29udHJvbCByZWcgKi8KIAkJCW1zaS1wYXJlbnQgPSA8Jml0cz47CiAJCQlpb21tdS1t
YXAgPSA8MCAmc21tdSAwIDA+OwkvKiBUaGlzIGlzIGZpeGVkLXVwIGJ5IHUtYm9vdCAqLworCQkJ
ZG1hLXJhbmdlczsKIAkJCWRtYS1jb2hlcmVudDsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDM+Owog
CQkJI3NpemUtY2VsbHMgPSA8MT47CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWx4MjE2MGEuZHRzaQppbmRleCA0MDhlMGVjZGNlNmEuLjM3MzViYjEzOWNiMiAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEuZHRzaQorKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNpCkBAIC04Njgs
NiArODY4LDcgQEAKIAkJCW1zaS1wYXJlbnQgPSA8Jml0cz47CiAJCQkvKiBpb21tdS1tYXAgcHJv
cGVydHkgaXMgZml4ZWQgdXAgYnkgdS1ib290ICovCiAJCQlpb21tdS1tYXAgPSA8MCAmc21tdSAw
IDA+OworCQkJZG1hLXJhbmdlczsKIAkJCWRtYS1jb2hlcmVudDsKIAkJCSNhZGRyZXNzLWNlbGxz
ID0gPDM+OwogCQkJI3NpemUtY2VsbHMgPSA8MT47Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
