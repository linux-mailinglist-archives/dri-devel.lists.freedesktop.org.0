Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE4238567
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADC789AA7;
	Fri,  7 Jun 2019 07:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62A4899C4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 04:46:50 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id a23so463760pff.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 21:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WJVHjkMmFxtpqrvFxD6VDdMJmS3mdvCf/T8uC/iQfpE=;
 b=k8kk3k5cpL4IYYf/tepDOQUmp2sZXRHW/vLYyqMlvApqQyXTuxsElzRLey+f/VCBhf
 IiFlvcXg3sOf37wbFdImIuIjmBV6jk3ppcPSAOYY9x0XAO5cbhHNP2Roc9/LdGUQU/Zt
 nY4ah23tXgbciQbjxijmHK+IxgDech0rCi3GEqPFcrIO+TS0lWMARWjjOaWuLR9p/mMP
 HTvYbfmA16y0JijjA8WebDXkxC7Uyjwb3b7sqIMGcOJtA3eeGEQUQxx+kLR5Skk4DO2g
 toSFAcK0BH9NyEtiv87N6q0ElhuM8xLo0xJp6XlCgxdOPM7VUHc+F9jdOtFDHD5anPFr
 e9WQ==
X-Gm-Message-State: APjAAAUzewomC/YaMlsONNdB30PO6phrEPQhEL4o3rlgUTrqdGvOSmjI
 CZuu3qLRn/dWkvZF75Jt1ScGqIdcI2U=
X-Google-Smtp-Source: APXvYqzpGq5MoY1zujPlCb/7LP8knOsxcYR4CmRuTB/Esr7S6QMVgELMRyjDg+MeAh+WbRmfvPgwMQ==
X-Received: by 2002:a63:2160:: with SMTP id s32mr1099397pgm.431.1559882810101; 
 Thu, 06 Jun 2019 21:46:50 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id o13sm919516pfh.23.2019.06.06.21.46.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 21:46:49 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 15/15] drm/bridge: tc358767: Replace magic number in
 tc_main_link_enable()
Date: Thu,  6 Jun 2019 21:45:50 -0700
Message-Id: <20190607044550.13361-16-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607044550.13361-1-andrew.smirnov@gmail.com>
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WJVHjkMmFxtpqrvFxD6VDdMJmS3mdvCf/T8uC/iQfpE=;
 b=UbobLsOMfL1T8Y0PMIQvPCXr7tTrhm91DzadWXd2tdTSVeCebke0OvMzDGsCLXNl/L
 zAC6aypF3axI2ZYyrDr5ekxwe6yoJK4CHetlk21tKv0O++yJrc6dnkmbQ2lBXduSh5hK
 kSihjYI194TaXo6ZdWUbg/Mj8q9Guxahr0C4cHXjC62tQ+f/E3D+13Bcg5iAc6DUyh+C
 LprWGC900VUMW82wXpkiyhoD+hx19F7MsNZUE42iiDxE+RnhFIz3u+B/Zk+IUlhMp+E9
 dlbQKj4AJx6n5V0nyoEo9ewd8uOYYUKEbg9W75fP7/V79/+BHwtXFPjZHbCpnPXfE0jo
 BQRg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgZG9uJ3QgbmVlZCA4IGJ5dGUgYXJyYXksIERQX0xJTktfU1RBVFVTX1NJWkUgKDYpIHNob3Vs
ZCBiZQplbm91Z2guIFRoaXMgYWxzbyBnZXRzIHJpZCBvZiBhIG1hZ2ljIG51bWJlciBhcyBhIGJv
bnVzLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWls
LmNvbT4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBMYXVyZW50
IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogQW5kcmV5IEd1c2Frb3YgPGFuZHJl
eS5ndXNha292QGNvZ2VudGVtYmVkZGVkLmNvbT4KQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU+CkNjOiBDb3J5IFR1c2FyIDxjb3J5LnR1c2FyQHppaS5hZXJvPgpDYzog
Q2hyaXMgSGVhbHkgPGNwaGVhbHlAZ21haWwuY29tPgpDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hA
cGVuZ3V0cm9uaXguZGU+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
YzM1ODc2Ny5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCmluZGV4IDRhMjQ1MTQ0YWE4My4uMDVj
NWZhYjAxMWY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCkBAIC04NzQsNyArODc0LDcg
QEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtfZW5hYmxlKHN0cnVjdCB0Y19kYXRhICp0YykKIAl1
MzIgZHBfcGh5X2N0cmw7CiAJdTMyIHZhbHVlOwogCWludCByZXQ7Ci0JdTggdG1wWzhdOworCXU4
IHRtcFtEUF9MSU5LX1NUQVRVU19TSVpFXTsKIAogCWRldl9kYmcodGMtPmRldiwgImxpbmsgZW5h
YmxlXG4iKTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
