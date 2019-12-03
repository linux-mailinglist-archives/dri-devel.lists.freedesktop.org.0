Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05B1110399
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 18:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF20D6EA34;
	Tue,  3 Dec 2019 17:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DAD6EA34
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 17:36:41 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id k17so1870856ybp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 09:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k0702IkYGdyEE1ANPdg7njfJXKphvSRdSVo1kbnlkuk=;
 b=LVFIQfpbcqatih2DOrxnoMEZHsKC4SRkw18Qoju3C39RBCw0l4rUeIdadoiXtDWmRw
 82Up2oFmc/KC6YJcHYEz7wMDHd/ZKDJ692p2dzlFAH8iV6V+TcIuRnu50AYCeiidK1n2
 buf923TMynoa3ZsZBULerBDji4pPhs5zDh+CavgziHLdvjWLTsXZ8I/RpVBqWnUf/p8s
 WOB3emD1WMkVOJ5mgoyHvhJtwpxcrZ//TvEVkUR0I1qTWc//PQDCnCIloSRs9kpMNHEi
 +nx1yYFskK4m7oP8yRFVjPqvJqL5qthQRw7FyjT4dVYmZfj3YwyBYvZ2JPBLikwM+Ger
 k6TQ==
X-Gm-Message-State: APjAAAVPM0Qz6BVvOmq4LIn+7nmeMgljWFMG94VQ7v5NHAdTHM/N+zoA
 uX+Vs9erQIPiPmPD6cD/JR95frck0emSFg==
X-Google-Smtp-Source: APXvYqwcb+QRyBdLT8joWna3npCRW53EVDn6Z8oMJbDL0P8yC2MVxu47gS6xbfvSb7DH3fK0BjYDMw==
X-Received: by 2002:a25:5903:: with SMTP id n3mr5409390ybb.466.1575394600302; 
 Tue, 03 Dec 2019 09:36:40 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g190sm1729426ywf.41.2019.12.03.09.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 09:36:39 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ramalingm.c@intel.com
Subject: [PATCH 00/11] drm/i915: Add support for HDCP 1.4 over MST connectors
Date: Tue,  3 Dec 2019 12:36:23 -0500
Message-Id: <20191203173638.94919-1-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k0702IkYGdyEE1ANPdg7njfJXKphvSRdSVo1kbnlkuk=;
 b=Cm9SVzh5LHziU75eJAgwvbR1bN47kAVm1RRl1MmH3xplnHD/2bi3A+IvHAIbHtNwa+
 jhkWcZigd82uZOrybCb8OiuG3cgq87qhKEDR/BcGnDG3doFgH1fIHbqKEdp6UrmNl4as
 Iso0sP4+R/S9t2BUOuZi4MvkeO/jbCTlV05ehLBFLlcwVy+0X2huqrYmY2wA3adYqUCZ
 sQcn6TBv7mpNNNbsx9DK4nsdEmDUL3RLgZNJwkDbrhIoikU/V13kIFffxsyVGviRg1pn
 u8/Ny3ABoJp7z8BQTI0vxlvOSM7FxkeB2uXVVpfD1k4ubWGb1dj6HNmvjsDrIK5BEgQZ
 U+Tg==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpIZXkgYWxsLApBcyB0aGUg
c3ViamVjdCBzYXlzLCB0aGlzIHNldCBhZGRzIHN1cHBvcnQgZm9yIEhEQ1AgMS40IG92ZXIgTVNU
LiBNb3N0Cm9mIHRoZSBzZXQgaXMgcGx1bWJpbmcgYW5kIHJlZmFjdG9yIHRvIGFsbG93IHRoZSBN
U1Qgc3VwcG9ydCB0byBzbG90IGluCm9yZ2FuaWNhbGx5LgoKSSBzdHViYmVkIG91dCBIRENQIDIu
MiBzdXBwb3J0IHNpbmNlIEkgZG9uJ3QgaGF2ZSBhIG1lYW5zIG9mIHRlc3RpbmcgaXQuCklmIG5v
IG9uZSBwaWNrcyB1cCB0aGUgc2xhY2ssIEkgY2FuIGNvbWUgYmFjayB0byBpdCBhdCBhIGxhdGVy
IGRhdGUgd2hlbgpJIGhhdmUgdGhlIHJpZ2h0IGdlYXIuCgpQbGVhc2UgdGFrZSBhIGxvb2ssCgpT
ZWFuCgpTZWFuIFBhdWwgKDExKToKICBkcm0vaTkxNTogRml4IHNoYV90ZXh0IHBvcHVsYXRpb24g
Y29kZQogIGRybS9pOTE1OiBJbnRlcmNlcHQgQWtzdiB3cml0ZXMgaW4gdGhlIGF1eCBob29rcwog
IGRybS9pOTE1OiBEaXNhYmxlIEhEQ1Agc2lnbmFsbGluZyBvbiB0cmFuc2NvZGVyIGRpc2FibGUK
ICBkcm0vaTkxNTogRG9uJ3QgV0FSTiBvbiBIRENQIHRvZ2dsZSBpZiBnZXRfaHdfc3RhdGUgcmV0
dXJucyBmYWxzZQogIGRybS9pOTE1OiBDaGFuZ2UgdG9nZ2xlX3NpZ25hbGxpbmcoKSBhcmd1bWVu
dCB0byBjb25uZWN0b3IKICBkcm0vaTkxNTogRmFjdG9yIG91dCBoZGNwLT52YWx1ZSBhc3NpZ25t
ZW50cwogIGRybS9pOTE1OiBEb24ndCBmdWxseSBkaXNhYmxlIEhEQ1Agb24gYSBwb3J0IGlmIG11
bHRpcGxlIHBpcGVzIGFyZQogICAgdXNpbmcgaXQKICBkcm0vaTkxNTogU3VwcG9ydCBEUCBNU1Qg
aW4gZW5jX3RvX2RpZ19wb3J0KCkgZnVuY3Rpb24KICBkcm0vaTkxNTogVXNlIGRkaV91cGRhdGVf
cGlwZSBpbiBpbnRlbF9kcF9tc3QKICBkcm0vaTkxNTogRXhwb3NlIEhEQ1Agc2hpbSBmdW5jdGlv
bnMgZnJvbSBkcCBmb3IgdXNlIGJ5IGRwX21zdAogIGRybS9pOTE1OiBBZGQgSERDUCAxLjQgc3Vw
cG9ydCBmb3IgTVNUIGNvbm5lY3RvcnMKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RkaS5jICAgICAgfCAgMjcgKystLQogLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV90eXBlcy5oICAgIHwgIDQ4ICsrKysrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jICAgICAgIHwgIDgyICsrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHAuaCAgICAgICB8ICAgNiArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwX21zdC5jICAgfCAgODQgKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMgICAgIHwgMTQ1ICsrKysrKysrKysrKystLS0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgICAgIHwgIDEwICstCiBp
bmNsdWRlL2RybS9kcm1faGRjcC5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwogOCBm
aWxlcyBjaGFuZ2VkLCAyOTggaW5zZXJ0aW9ucygrKSwgMTA3IGRlbGV0aW9ucygtKQoKLS0gClNl
YW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
