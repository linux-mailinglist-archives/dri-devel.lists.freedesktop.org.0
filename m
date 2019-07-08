Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB4463158
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF7D897EF;
	Tue,  9 Jul 2019 07:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF2689C6C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 16:58:16 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id a93so8588224pla.7
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 09:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=T1w86HYowDLmCMH8t5cBhr+6c2jCirc20RP6wN4si70=;
 b=ks/shXsmdmVM7/f+2RBmYDHdVpN8LeAD5b3TTUal7ARmltLo50zKH0iQIZnjF33uCu
 jwO3qGJvbf/DJjTvzGwgrX6rr8RYp3YN9IJecUNyl3t2ZrBE4b8S6c/C1AjEPQg0GeVD
 DM6Wn2jcbivE5NSMIvtJg9CJoS2TqQM40ZRrd0SSVLzUP94nYlattTKZBUIMChGLte8B
 exY6HkgDRnVAo8I0XDnKhrABfutbuWc58VnrsLQKnK3aw64sm88LKnhrrkDRG4vKnUdq
 YnQyDT+aKDj71C55HiW+y8FR3r9an0IpgnBNSGDlcrvCfTNu6YmtS3wzInDaoGwN9GL7
 AdfQ==
X-Gm-Message-State: APjAAAVsENr0R4/xxjudruBcAY5zVTPW1XJlghaWMpNPQB77cgmAE8lU
 m2/cqd4a2sQRTIMOpM8mjYQ=
X-Google-Smtp-Source: APXvYqyFG3Gc3x/EWlA+SYYdLs8gzBuzL0sMqRKNFy/azUlajXonAhGrBaf2rrvEJ6mwe/wrQGrUCg==
X-Received: by 2002:a17:902:f089:: with SMTP id
 go9mr26326216plb.81.1562605096151; 
 Mon, 08 Jul 2019 09:58:16 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id z13sm66698pjn.32.2019.07.08.09.58.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 09:58:15 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v2 2/2] drm/panel: simple: Add support for Sharp LD-D5116Z01B
 panel
Date: Mon,  8 Jul 2019 09:58:11 -0700
Message-Id: <20190708165811.46370-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=T1w86HYowDLmCMH8t5cBhr+6c2jCirc20RP6wN4si70=;
 b=WRYTWK7F5Ug23w8882zblyMsDIYjkcH4ACBYvdFKP4HL+HoJF1SflMX5UPfAE18J9s
 HOCDZ+7FN/A8VyoDiR58OWig3Sbj4SSt6eO+ZgLGUnQlHF1VlI0ye9BaFZ9w3O9mNoDd
 V8D64/xzPpIE0ptFL9EASiMiMRdaXsOXqu3JeLfO6kTmqz128xjw4FWNo1nnm3UWV1Wr
 6hm6o3QWjC+zTUMjI5GtOmVAFivpp6vN/fh8mcTxXOFDwzAzgHovj/Zr4Jhp1+RVNM/I
 8vdtJYAdy18AzDQOw4OpGLMLqr4FMX78KI5jjJHg9k39D4D5HVsKIOxogpqEwR/B3v30
 K27A==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFNoYXJwIExELUQ1MTE2WjAxQiBpcyBhIDEyLjMiIGVEUCBwYW5lbCB3aXRoIGEgMTkyMFgx
MjgwIHJlc29sdXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5o
dWdvQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAyOSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwppbmRleCA1YTkzYzRlZGYxZTQuLmE4ODA4
YjEzYzM3MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwpAQCAtMjM1NCw2ICsy
MzU0LDMyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBzYW1zdW5nX2x0bjE0MGF0
MjlfMzAxID0gewogCX0sCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgc2hhcnBfbGRfZDUxMTZ6MDFiX21vZGUgPSB7CisJLmNsb2NrID0gMTY4NDgwLAorCS5oZGlz
cGxheSA9IDE5MjAsCisJLmhzeW5jX3N0YXJ0ID0gMTkyMCArIDQ4LAorCS5oc3luY19lbmQgPSAx
OTIwICsgNDggKyAzMiwKKwkuaHRvdGFsID0gMTkyMCArIDQ4ICsgMzIgKyA4MCwKKwkudmRpc3Bs
YXkgPSAxMjgwLAorCS52c3luY19zdGFydCA9IDEyODAgKyAzLAorCS52c3luY19lbmQgPSAxMjgw
ICsgMyArIDEwLAorCS52dG90YWwgPSAxMjgwICsgMyArIDEwICsgNTcsCisJLnZyZWZyZXNoID0g
NjAsCisJLmZsYWdzID0gRFJNX01PREVfRkxBR19QSFNZTkMgfCBEUk1fTU9ERV9GTEFHX1BWU1lO
QywKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBzaGFycF9sZF9kNTExNnow
MWIgPSB7CisJLm1vZGVzID0gJnNoYXJwX2xkX2Q1MTE2ejAxYl9tb2RlLAorCS5udW1fbW9kZXMg
PSAxLAorCS5icGMgPSA4LAorCS5zaXplID0geworCQkud2lkdGggPSAyNjAsCisJCS5oZWlnaHQg
PSAxMjAsCisJfSwKKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQsCisJ
LmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19EQVRBX01TQl9UT19MU0IsCit9OworCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgc2hhcnBfbHEwMzVxN2RiMDNfbW9kZSA9IHsK
IAkuY2xvY2sgPSA1NTAwLAogCS5oZGlzcGxheSA9IDI0MCwKQEAgLTMwMDIsNiArMzAyOCw5IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHBsYXRmb3JtX29mX21hdGNoW10gPSB7
CiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJzYW1zdW5nLGx0bjE0MGF0MjktMzAxIiwKIAkJLmRh
dGEgPSAmc2Ftc3VuZ19sdG4xNDBhdDI5XzMwMSwKKwl9LCB7CisJCS5jb21wYXRpYmxlID0gInNo
YXJwLGxkLWQ1MTE2ejAxYiIsCisJCS5kYXRhID0gJnNoYXJwX2xkX2Q1MTE2ejAxYiwKIAl9LCB7
CiAJCS5jb21wYXRpYmxlID0gInNoYXJwLGxxMDM1cTdkYjAzIiwKIAkJLmRhdGEgPSAmc2hhcnBf
bHEwMzVxN2RiMDMsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
