Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC9B116CAD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 13:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A630E6E420;
	Mon,  9 Dec 2019 12:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBF26E420;
 Mon,  9 Dec 2019 12:00:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c9so15888528wrw.8;
 Mon, 09 Dec 2019 04:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eUlSTHSiZH4UmQzCStEFr2SlLYYI3f+fEsxXqTQKGEo=;
 b=PXKdvmkRA8ssacCjp1RwB5nxP0/Q3UhF2qNAqOcZRn5UpTa5GSDDRPuKTkS/JAGnrM
 DgIBPFgJ3oZjYNo0y+XcYic0ZtM5iCK1aCr7BJJV+c+h6BEk1be/V7XPcZAKxfCAe0kt
 g6ZkkqNU+l7OSVT6Pk/mdnN5ix5BKxUTIOtBn/t3hWbgP140I4/WaCZY8Oa74cKtoXvh
 luhxmPB7BgtKv/TRL8koJ59ljG4l0d9X9YGdrODBW9lWDFVDQbdOt+f2xP5Ozvke1gzP
 owOBiUJMHnZYtnN2P28KWopzId/+uXbyy4r7pqnIq0O8PGS5WTfofLAA2821y5T1hQVW
 W47Q==
X-Gm-Message-State: APjAAAVMSQrqIVWHZ0c7Gt6eBH7f5ofmjEn17JHiyfISOWnUxVwdOheE
 oioYOO8EiAiImy0mYnuPJuccHIMH
X-Google-Smtp-Source: APXvYqy8gUZ62b/oFszldo4GGat8TaeZcBUdGBZVJVA603pZpl99V8gAU2LSa9aXDlLD/OJA4FB2Hg==
X-Received: by 2002:adf:eb09:: with SMTP id s9mr1814750wrn.61.1575892809527;
 Mon, 09 Dec 2019 04:00:09 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id p9sm13785522wmg.45.2019.12.09.04.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:00:08 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v3 1/9] iommu: Document iommu_fwspec::flags field
Date: Mon,  9 Dec 2019 12:59:57 +0100
Message-Id: <20191209120005.2254786-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eUlSTHSiZH4UmQzCStEFr2SlLYYI3f+fEsxXqTQKGEo=;
 b=VkvNEI69NbptprnfrSLJJuVIxMR1DAqnBpe6bT2fimzlIzLsJmIDHSZSn6Ut2RxDif
 p6y2SKw8x10ZfAA7p0w6NUvDmNVvmwfFUMuJj0VT/jFIc0NBuz2QzOY1JniQujB6PbxP
 EPwJ8YSLvzz7hFgSi1MsbjHY8zjxG3VfjdGQSe2QnRuu4ASIFzYAmKbMyit53ROwSSKy
 ypFXgzrJGKjTHvAwaSESZFEq//nejEu3cGX9nBjz96N/pD0Ma/IAzFJFRXtzoAT2pkLj
 k8Iw7t2kElSUBArEBVZFVMMPDoP43FoKvtTM0gO8QkNwBFy6ywEVGeBER/nJDhdIcVVf
 qOyg==
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
Cc: Joerg Roedel <jroedel@suse.de>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gdGhpcyBmaWVs
ZCB3YXMgYWRkZWQgaW4gY29tbWl0IDU3MDJlZTI0MTgyZiAoIkFDUEkvSU9SVDogQ2hlY2sgQVRT
CmNhcGFiaWxpdHkgaW4gcm9vdCBjb21wbGV4IG5vZGVzIiksIHRoZSBrZXJuZWxkb2MgY29tbWVu
dCB3YXNuJ3QgdXBkYXRlZAphdCB0aGUgc2FtZSB0aW1lLgoKQWNrZWQtYnk6IEpvZXJnIFJvZWRl
bCA8anJvZWRlbEBzdXNlLmRlPgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGlu
Z0BudmlkaWEuY29tPgotLS0KIGluY2x1ZGUvbGludXgvaW9tbXUuaCB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb21tdS5o
IGIvaW5jbHVkZS9saW51eC9pb21tdS5oCmluZGV4IGYyMjIzY2JiNWZkNS4uMjE2ZTkxOTg3NWVh
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2lvbW11LmgKKysrIGIvaW5jbHVkZS9saW51eC9p
b21tdS5oCkBAIC01NzAsNiArNTcwLDcgQEAgc3RydWN0IGlvbW11X2dyb3VwICpmc2xfbWNfZGV2
aWNlX2dyb3VwKHN0cnVjdCBkZXZpY2UgKmRldik7CiAgKiBAb3BzOiBvcHMgZm9yIHRoaXMgZGV2
aWNlJ3MgSU9NTVUKICAqIEBpb21tdV9md25vZGU6IGZpcm13YXJlIGhhbmRsZSBmb3IgdGhpcyBk
ZXZpY2UncyBJT01NVQogICogQGlvbW11X3ByaXY6IElPTU1VIGRyaXZlciBwcml2YXRlIGRhdGEg
Zm9yIHRoaXMgZGV2aWNlCisgKiBAZmxhZ3M6IElPTU1VIGZsYWdzIGFzc29jaWF0ZWQgd2l0aCB0
aGlzIGRldmljZQogICogQG51bV9pZHM6IG51bWJlciBvZiBhc3NvY2lhdGVkIGRldmljZSBJRHMK
ICAqIEBpZHM6IElEcyB3aGljaCB0aGlzIGRldmljZSBtYXkgcHJlc2VudCB0byB0aGUgSU9NTVUK
ICAqLwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
