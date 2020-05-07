Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 575B71C9412
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBC46EA13;
	Thu,  7 May 2020 15:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A996EA13
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:33 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z6so7251431wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVcIzZl/C4rP8Hgxo4JAutifjDeFEAztIdXfJngfWgA=;
 b=nodbBDvuzNsHGThc+tgqV2F6xQYredszArQNKqAnBlYc1PtmbPVTHXKKJ+dpH+XOm7
 QCLeNUaqJOzMf1AoAM0wofVUJrPYUr0DHMwhKJiQl3hcVu+xognMacztyB+c4qnwv5ad
 IB8K1yOLQNMoEE824Tx+KVtecvJJmmFbC9FbMfx8V7HoqBf/312EMWPeTkBd/ZFZ2Vsb
 vK6jPtY1CtdTPO0Ee6zS+H6MNLEGqZhppEPwlLFrTpItvJFN2r9c/+xt1dxGe0ys7kz7
 d86f46aO1GITXvMw3jlqesnM9yfpLjOCg8yUJJnnFaf3MwgO9kMeQc90eDd5DEPct6gk
 dFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wVcIzZl/C4rP8Hgxo4JAutifjDeFEAztIdXfJngfWgA=;
 b=MzulIMGUO9LWHPjIuG6FviF0RNpPvV0shhD+xu6glwi/z6KroYQx4WtnCtH9YLAzKQ
 YNmS+ptDt/bn7L+iP688TWAE7INn+Nm5ych7TzKu7VVivhPocfadJ/CwS35kA3+IVzdp
 f5KtJlv57+SDgF6xwhKCGxyNJOZHFdhRLEQDcFAGEMyLRGnbdEUNmsX9sDW7IIN6hNX9
 4/Uwx3wc1bwjNjbxy8pVP1a3z8daAwPeJ7ZA0N/vt+W5xjigsbYFt89okKAYNlDEeauK
 L6cRpiDzZBHX3ozn8El/WsVRXpfE30PKcZauhfpoPKVqlzuKaQL6xYLNWcpvb8SYjVMk
 G2XA==
X-Gm-Message-State: AGi0PuYnJE82SJxZtNE9NfeP4JcENUL0FSNmn3W8ggPm18kQjeWsLPeg
 mzG9Hc5Bc1lur+v+q9WjsBvIbH7y
X-Google-Smtp-Source: APiQypJJ929oq9zJ17YqnsEXgB5LocapEk/o7DpW7FBS/TybtvkRVe4ux3kV6BTEM72tqusQyWK+iQ==
X-Received: by 2002:a1c:3182:: with SMTP id x124mr11704785wmx.54.1588864290627; 
 Thu, 07 May 2020 08:11:30 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:30 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 28/36] drm/rockchip: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:14 +0100
Message-Id: <20200507150822.114464-29-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Sandy Huang <hjc@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClNwZWxsaW5n
IG91dCBfdW5sb2NrZWQgZm9yIGVhY2ggYW5kIGV2ZXJ5IGRyaXZlciBpcyBhIGFubm95aW5nLgpF
c3BlY2lhbGx5IGlmIHdlIGNvbnNpZGVyIGhvdyBtYW55IGRyaXZlcnMsIGRvIG5vdCBrbm93IChv
ciBuZWVkIHRvKQphYm91dCB0aGUgaG9ycm9yIHN0b3JpZXMgaW52b2x2aW5nIHN0cnVjdF9tdXRl
eC4KCkp1c3QgZHJvcCB0aGUgc3VmZml4LiBJdCBtYWtlcyB0aGUgQVBJIGNsZWFuZXIuCgpEb25l
IHZpYSB0aGUgZm9sbG93aW5nIHNjcmlwdDoKCl9fZnJvbT1kcm1fZ2VtX29iamVjdF9wdXRfdW5s
b2NrZWQKX190bz1kcm1fZ2VtX29iamVjdF9wdXQKZm9yIF9fZmlsZSBpbiAkKGdpdCBncmVwIC0t
bmFtZS1vbmx5ICRfX2Zyb20pOyBkbwogIHNlZCAtaSAgInMvJF9fZnJvbS8kX190by9nIiAkX19m
aWxlOwpkb25lCgpDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KQ2M6ICJIZWlr
byBTdMO8Ym5lciIgPGhlaWtvQHNudGVjaC5kZT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFi
b3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMg
IHwgMiArLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYyB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYwppbmRleCA5YjEzYzc4NGIz
NDcuLjNhYTM3ZTE3NzY2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX2RybV9mYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fZmIuYwpAQCAtODgsNyArODgsNyBAQCByb2NrY2hpcF9mYl9jcmVhdGUoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxlLAogCQkJc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICoqb2JqID0gYWZiY19mYi0+YmFzZS5vYmo7CiAKIAkJCWZvciAoaSA9IDA7IGkgPCBpbmZv
LT5udW1fcGxhbmVzOyArK2kpCi0JCQkJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9ialtp
XSk7CisJCQkJZHJtX2dlbV9vYmplY3RfcHV0KG9ialtpXSk7CiAKIAkJCWtmcmVlKGFmYmNfZmIp
OwogCQkJcmV0dXJuIEVSUl9QVFIocmV0KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX2dlbS5jCmluZGV4IDBkMTg4NDY4NGRjYi4uYjkyNzViYTdjNWE1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2dlbS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZ2VtLmMKQEAgLTM5Miw3ICszOTIs
NyBAQCByb2NrY2hpcF9nZW1fY3JlYXRlX3dpdGhfaGFuZGxlKHN0cnVjdCBkcm1fZmlsZSAqZmls
ZV9wcml2LAogCQlnb3RvIGVycl9oYW5kbGVfY3JlYXRlOwogCiAJLyogZHJvcCByZWZlcmVuY2Ug
ZnJvbSBhbGxvY2F0ZSAtIGhhbmRsZSBob2xkcyBpdCBub3cuICovCi0JZHJtX2dlbV9vYmplY3Rf
cHV0X3VubG9ja2VkKG9iaik7CisJZHJtX2dlbV9vYmplY3RfcHV0KG9iaik7CiAKIAlyZXR1cm4g
cmtfb2JqOwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
