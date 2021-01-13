Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABD22F45C9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0076E077;
	Wed, 13 Jan 2021 08:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8C76E061
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:13 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r3so1086781wrt.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TuIgFykBDNAyCTS3nlQLhUgyjjMaofDJMrakOYVbGJ4=;
 b=OPbeiTnztfD+0HsOGRAz/algFIdjza0Mha4+zjTi+go+mtYX28fmkqErpS7SPSYwOY
 0BlCN8/kvWgv/s7Oza70HVI8XBi8b/gbWFuWbUanSz5AtgNsgcH8k6vQJ779zWLtcoOd
 xouoN/uj/J5mWVVynsDWHxvX+k+He0q0DCvdU8LSGF3ubQE20BV+piQw19OFFgAE1IW8
 6ayHGDpbV9BT1Zfs/n8NYbVeVCSDOjiVB0bHnSH9nMio0PQMKv1yNhlR2re0fHyvvKy4
 mqOThv9t2wscoM+aKNDPvmAB1QY0hSgUH/aVX7OK+br/m/D9WjooGUjAbEnNPv4lJnx5
 uDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TuIgFykBDNAyCTS3nlQLhUgyjjMaofDJMrakOYVbGJ4=;
 b=D1io2V53nIro8BB7QOT4O6J7I0Uo/j3xFiMgp6o1/I2I65hJTbF/gtN6+BCHLZOFLC
 7ILZexfjGkOru1luoA3FExTsxP0z2NW7CDYO+0bkfrzZtIazkBJ6JpA21FlvY8hYJAEZ
 s9skrhN+je1oWxADW29Ad1re2DkwcxFpf+o6BrIeOKI39qfq9SI1czLIG79fmU5yhMdj
 aX1hVuj0/1ZDLKFFs2JFZKhq/YJyOml+s6Q+gle+v2j8vd3WIJJfzkJ48jR2eqpbMNBd
 i7EjMtuNyR83NkHNFM273BinPtMgsSDlB1O7k1Dv2+YVi4xPMSiVBcrFggS0QFVXV53n
 BncQ==
X-Gm-Message-State: AOAM531ZcAKME5kb6Ngrg6hwAjzTHMyQqKnlqs3H+5oYV4PeTxzsUCks
 x+dFhvr5ODgejJjsU/9iWCRvf8ms4UhVxrVG
X-Google-Smtp-Source: ABdhPJxGS+miZsOX4pjXXNJB2F7W2rx+9Yk6/u0aWVW93nTCONywWM1HcBZORVasZfBrn3QtvOKAyQ==
X-Received: by 2002:adf:8184:: with SMTP id 4mr1226871wra.63.1610525292458;
 Wed, 13 Jan 2021 00:08:12 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:11 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/30] drm/amd/display/dc/dce60/Makefile: Ignore
 -Woverride-init warning
Date: Wed, 13 Jan 2021 08:07:35 +0000
Message-Id: <20210113080752.1003793-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlNjAvZGNlNjBfcmVzb3VyY2UuYzoyODoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2luY2x1ZGUvYXNpY19yZWcvZGNlL2RjZV82XzBfZC5oOjU2ODo0Mzogd2FybmluZzogaW5pdGlh
bGl6ZWQgZmllbGQgb3ZlcndyaXR0ZW4gWy1Xb3ZlcnJpZGUtaW5pdF0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlNjAvZGNlNjBfcmVzb3VyY2UuYzoxNTU6MTQ6
IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhtbUNSVEMwX0RDRkVfTUVNX0xJR0hUX1NM
RUVQX0NOVEzigJkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNl
L2RjZV90cmFuc2Zvcm0uaDoxNzA6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmFNS
SeKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U2MC9kY2U2
MF9yZXNvdXJjZS5jOjE4MTozOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYWEZNX0NP
TU1PTl9SRUdfTElTVF9EQ0U2MOKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kY2U2MC9kY2U2MF9yZXNvdXJjZS5jOjE4NTozOiBub3RlOiBpbiBleHBhbnNpb24g
b2YgbWFjcm8g4oCYdHJhbnNmb3JtX3JlZ3PigJkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2luY2x1ZGUvYXNpY19yZWcvZGNlL2RjZV82XzBfZC5oOjU2ODo0Mzogbm90ZTogKG5lYXIg
aW5pdGlhbGl6YXRpb24gZm9yIOKAmHhmbV9yZWdzWzBdLkRDRkVfTUVNX0xJR0hUX1NMRUVQX0NO
VEzigJkpCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTYwL2Rj
ZTYwX3Jlc291cmNlLmM6MTU1OjE0OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYbW1D
UlRDMF9EQ0ZFX01FTV9MSUdIVF9TTEVFUF9DTlRM4oCZCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfdHJhbnNmb3JtLmg6MTcwOjI6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZiBtYWNybyDigJhTUknigJkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZGNlNjAvZGNlNjBfcmVzb3VyY2UuYzoxODE6Mzogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvIOKAmFhGTV9DT01NT05fUkVHX0xJU1RfRENFNjDigJkKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlNjAvZGNlNjBfcmVzb3VyY2UuYzoxODU6
Mzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmHRyYW5zZm9ybV9yZWdz4oCZCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9pbmNsdWRlL2FzaWNfcmVnL2RjZS9kY2VfNl8wX2Qu
aDo2NDU6NDM6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJy
aWRlLWluaXRdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTYw
L2RjZTYwX3Jlc291cmNlLmM6MTU1OjE0OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCY
bW1DUlRDMV9EQ0ZFX01FTV9MSUdIVF9TTEVFUF9DTlRM4oCZCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2VfdHJhbnNmb3JtLmg6MTcwOjI6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhTUknigJkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvZGMvZGNlNjAvZGNlNjBfcmVzb3VyY2UuYzoxODE6Mzogbm90ZTogaW4gZXhw
YW5zaW9uIG9mIG1hY3JvIOKAmFhGTV9DT01NT05fUkVHX0xJU1RfRENFNjDigJkKCiBOQjogU25p
cHBlZCBsb3RzIGZvciB0aGUgc2FrZSBvZiBicmV2aXR5CgpDYzogSGFycnkgV2VudGxhbmQgPGhh
cnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogTWF1
cm8gUm9zc2kgPGlzc29yLm9ydWFtQGdtYWlsLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZTYwL01ha2VmaWxlIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2U2MC9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U2MC9N
YWtlZmlsZQppbmRleCA3MDM2YzNiZDBmODcxLi5kZGE1OTZmYTFjZDc2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlNjAvTWFrZWZpbGUKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTYwL01ha2VmaWxlCkBAIC0yMyw2ICsyMyw4IEBA
CiAjIE1ha2VmaWxlIGZvciB0aGUgJ2NvbnRyb2xsZXInIHN1Yi1jb21wb25lbnQgb2YgREFMLgog
IyBJdCBwcm92aWRlcyB0aGUgY29udHJvbCBhbmQgc3RhdHVzIG9mIEhXIENSVEMgYmxvY2suCiAK
K0NGTEFHU19BTUREQUxQQVRIKS9kYy9kY2U2MC9kY2U2MF9yZXNvdXJjZS5vID0gJChjYWxsIGNj
LWRpc2FibGUtd2FybmluZywgb3ZlcnJpZGUtaW5pdCkKKwogRENFNjAgPSBkY2U2MF90aW1pbmdf
Z2VuZXJhdG9yLm8gZGNlNjBfaHdfc2VxdWVuY2VyLm8gXAogCWRjZTYwX3Jlc291cmNlLm8KIAot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
