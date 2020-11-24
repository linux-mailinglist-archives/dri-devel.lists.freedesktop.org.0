Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0402C30EB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9721E6E584;
	Tue, 24 Nov 2020 19:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508E36E529
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p8so23564391wrx.5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTQ5gL/fFZGCODd+MpCfGseH3ViN6nmo6i+7UzfYda0=;
 b=vhF37QAFFTx6Db8V5kbTsDQoerTQjzFKn+ANrhtYl406/gkriHZ4ylI6iyUyHWakwL
 syhFicrl2QLMplXmezvxYV3ooX/dPhH+NAidO5uSgGBAsQKnXFaAa6nOiAE5/MIIqqim
 OMmeTkMW09SFmEzT4aTu3PXKiARnItjTQhCGDuZmz1rc2F7fsFs83nenchpwEI4xkYp1
 R8gHJTGIsSuPWgE8dpuoi+9FMQZt2f1AJKvbNTvNPL32C/06y6x55EQh6Ltz2MoxLmYA
 KjSBVlNHDSKg6spfxS0RARtsaRiHc7rKP+0tTem+q/z7LcztsPne7B3iF743KIvnBR66
 I1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTQ5gL/fFZGCODd+MpCfGseH3ViN6nmo6i+7UzfYda0=;
 b=UPD/KGGxg7y8+4IrB9NYzvRI3MMO0vKWBVAqkowBeDPnI/IxfuPeScAXHjI0bUGHUP
 XYIcLEMKF1x6KyKwE8Ditn/1IfK/tk+CxRpiRAGKZVJYSNR0lx4bjZACTyp/tQQDwEvH
 gCfP0YqGhP7ETppqP6AFDfO2GJ2MIdC+RAn48ngOKQ9p7eFRhXt7A+2ELt5mPkhez7vh
 Ut9J6vdk0wG/OTIENGTMMGjWwNXphGrpxco/eF/0P35slR6mn8EXuFl6a6HBhTyRmexO
 XFqIzgFLWzbAzKAIZJwPtZjEY5gzHpqMmRuVBvr1/y15kyHJ6ydKu0kFOUwY00xOW8C5
 ZEVw==
X-Gm-Message-State: AOAM533lYAgSOGx0a+vmj2DsNDOB/HmsBjib6hUFQeYFM7r6SXhrSeD2
 i63V8JuRDNN+sJMotRGC0FaStQ==
X-Google-Smtp-Source: ABdhPJwPLyBXb00eAHfohzKLGLKoQMLk9bEUJuVpLR76WQmyJ6H7DoAgkfyLfw6viWi9n7ydO3Jwzw==
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr80073wrq.11.1606247078052;
 Tue, 24 Nov 2020 11:44:38 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/40] drm/amd/amdgpu/jpeg_v2_0: Add some missing kernel-doc
 descriptions
Date: Tue, 24 Nov 2020 19:38:15 +0000
Message-Id: <20201124193824.1118741-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192Ml8wLmM6NDk4OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdhZGRyJyBub3QgZGVzY3JpYmVkIGluICdqcGVnX3YyXzBfZGVj
X3JpbmdfZW1pdF9mZW5jZScKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjJfMC5j
OjQ5ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnc2VxJyBub3QgZGVz
Y3JpYmVkIGluICdqcGVnX3YyXzBfZGVjX3JpbmdfZW1pdF9mZW5jZScKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2pwZWdfdjJfMC5jOjQ5ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ2pwZWdfdjJfMF9kZWNfcmluZ19l
bWl0X2ZlbmNlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192Ml8wLmM6NDk4OiB3
YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdmZW5jZScgZGVzY3JpcHRpb24gaW4g
J2pwZWdfdjJfMF9kZWNfcmluZ19lbWl0X2ZlbmNlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvanBlZ192Ml8wLmM6NTQ5OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVy
ICdqb2InIG5vdCBkZXNjcmliZWQgaW4gJ2pwZWdfdjJfMF9kZWNfcmluZ19lbWl0X2liJwogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192Ml8wLmM6NTQ5OiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbGFncycgbm90IGRlc2NyaWJlZCBpbiAnanBlZ192Ml8w
X2RlY19yaW5nX2VtaXRfaWInCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdf
djJfMC5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9qcGVnX3Yy
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjJfMC5jCmluZGV4IDZiODBk
Y2VhODBlYzguLjE1YzAyMjRkNDhiMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2pwZWdfdjJfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdf
djJfMC5jCkBAIC00ODksNyArNDg5LDkgQEAgdm9pZCBqcGVnX3YyXzBfZGVjX3JpbmdfaW5zZXJ0
X2VuZChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiAgKiBqcGVnX3YyXzBfZGVjX3JpbmdfZW1p
dF9mZW5jZSAtIGVtaXQgYW4gZmVuY2UgJiB0cmFwIGNvbW1hbmQKICAqCiAgKiBAcmluZzogYW1k
Z3B1X3JpbmcgcG9pbnRlcgotICogQGZlbmNlOiBmZW5jZSB0byBlbWl0CisgKiBAYWRkcjogYWRk
cmVzcworICogQHNlcTogc2VxdWVuY2UgbnVtYmVyCisgKiBAZmxhZ3M6IGZlbmNlIHJlbGF0ZWQg
ZmxhZ3MKICAqCiAgKiBXcml0ZSBhIGZlbmNlIGFuZCBhIHRyYXAgY29tbWFuZCB0byB0aGUgcmlu
Zy4KICAqLwpAQCAtNTM4LDcgKzU0MCw5IEBAIHZvaWQganBlZ192Ml8wX2RlY19yaW5nX2VtaXRf
ZmVuY2Uoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1NjQgYWRkciwgdTY0IHNlcSwKICAqIGpw
ZWdfdjJfMF9kZWNfcmluZ19lbWl0X2liIC0gZXhlY3V0ZSBpbmRpcmVjdCBidWZmZXIKICAqCiAg
KiBAcmluZzogYW1kZ3B1X3JpbmcgcG9pbnRlcgorICogQGpvYjogam9iIHRvIHJldHJpdmUgdm1p
ZCBmcm9tCiAgKiBAaWI6IGluZGlyZWN0IGJ1ZmZlciB0byBleGVjdXRlCisgKiBAZmxhZ3M6IHVu
dXNlZAogICoKICAqIFdyaXRlIHJpbmcgY29tbWFuZHMgdG8gZXhlY3V0ZSB0aGUgaW5kaXJlY3Qg
YnVmZmVyLgogICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
