Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B04D605B5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 14:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947A66E105;
	Fri,  5 Jul 2019 12:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9814B6E105
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 12:10:14 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v15so1425912eds.9
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 05:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tGB8YOPye831XLasC5mo4ffUMUUauvYPHFIL2i/vB3o=;
 b=t2+p4dOMd4GGV5acX8/Vl6W11053MlFhqHdti6rDXjq3+y07GU4y7L11Oz8X5HlPH6
 +OTUMMIiN6EOHF9fKrSPo8v9OdcfEbZ8t9xfyq1+47X0T1ayhNWzCH4S+facpuVF564h
 pRbCGbdikoo6pSUm3Zb3X8dC4ET4m1GS9rrqXpmqyq5XDWK1qipmhbIqqnz1V9YgcfON
 adXPJuRYR39yyr4vN6lk27Q5JZXdH+8gIBtmmoIzVfnyjeB4sDvubLwrdTfgGNrOKQBC
 79WzwXe+ToLOlqjIIbDZmxPOct0oowzjX7+a8ElG65lpLzKEUnEsZF/IjyNPLPhe9BB2
 yAHw==
X-Gm-Message-State: APjAAAV7EnwfJsnzylHM66tmIDmKIsTWM2VydKYloDx54y7wkdkuGCb6
 +e1Os4UdEoB7Mh8tNExFt/pDKHZwcRQ=
X-Google-Smtp-Source: APXvYqyLUhchMekoLf0B1iUyBpEaeGV1pqywSbmm77rL0RlhFZJFjXyhAiCglkvN0wYpQR4sdHwjqw==
X-Received: by 2002:a17:906:4582:: with SMTP id
 t2mr1938119ejq.242.1562328612864; 
 Fri, 05 Jul 2019 05:10:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 5sm1524350ejx.58.2019.07.05.05.10.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 05:10:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/komeda: remove slave_planes property
Date: Fri,  5 Jul 2019 14:10:03 +0200
Message-Id: <20190705121006.26085-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705121006.26085-1-daniel.vetter@ffwll.ch>
References: <20190705121006.26085-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tGB8YOPye831XLasC5mo4ffUMUUauvYPHFIL2i/vB3o=;
 b=DGkbDDeACXrqbENqwsOTxjwkoYpLkz7weMeCA7PJyd0618Nuk72n7FZFzEPNEaOi5Y
 OzdHjRs27vJ6eqqkqV/NvRc+tgw/fF9uCYQP7t29qyj/b6PKMH2+XeJpHdt6G/yIL2R3
 pIlJ3LJKckCa5r6B76kNHczsLbC8Bo4MCY+eE=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, Lowry Li <lowry.li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvcGVydGllcyBhcmUgdWFwaSBsaWtlIGFueXRoaW5nIGVsc2UsIHdpdGggYWxsIHRoZSB1c3Vh
bCBydWxlcwpyZWdhcmRpbmcgcmV2aWV3LCB0ZXN0Y2FzZXMsIG9wZW4gc291cmNlIHVzZXJzcGFj
ZSAuLi4gRnVydGhlcm1vcmUKZHJpdmVyLXByaXZhdGUga21zIHByb3BlcnRpZXMgYXJlIGhpZ2hs
eSBkaXNjb3VyYWdlZCwgb3ZlciB0aGUgcGFzdApmZXcgeWVhcnMgd2UndmUgcmVhbGl6ZWQgd2Ug
bmVlZCB0byBtYWtlIGEgc2VyaW91cyBlZmZvcnQgYXQgYmV0dGVyCnN0YW5kYXJkaXppbmcgdGhp
cyBzdHVmZi4KCkFnYWluIHRoaXMgcHJvYmFibHkgbmVlZHMgbXVsdGlwbGUgcGllY2VzIHRvIHNv
bHZlIHRoaXMgcHJvcGVybHk6CgotIFRvIG1ha2UgcGxhbmUgY29uZmlndXJhdGlvbiBsZXNzIHN1
cnByaXNpbmcgdG8gdXNlcnNwYWNlIHlvdQogIHByb3BhYmx5IG5lZWQgdG8gdmlydHVhbGl6ZSBw
bGFuZXMsIGFuZCByZW9yZGVyIHdoaWNoIGxvZ2ljYWwgcGxhbmUKICB5b3UgbWFwIHRvIHdoaWNo
IHBoeXNpY2FsIG9uZSBkeW5hbWljYWxseS4gSW5zdGVhZCBvZiBleHBvc2luZyBhCiAga29tZWRh
LXNwZWNpZmljIGxpbWl0YXRpb24gdG8gdXNlcnNwYWNlIGFuZCBleHBlY3RpbmcgdGhlbSB0byBk
dHJ0LgogIEkgdGhpbmsgbXNtIGFuZCByY2FyLWR1IGRvIHRoYXQgYWxyZWFkeSAoYW5kIG90aGVy
cyksIGlmIHlvdSBuZWVkCiAgcGVvcGxlIHRvIGNoYXQgd2l0aCBvciBleGFtcGxlIGNvZGUuCgot
IElmIHRoaXMgaXMgbmVlZGVkIGZvciB2YWxpZGF0aW9uLCBhZ2FpbiAtPmF0b21pY19wcmludF9z
dGF0ZSBhbmQgdGhlCiAgaW5mcmFzdHJ1Y3R1cmUgYXJvdW5kIHRoYXQgaXMgeW91ciBmcmllbmQu
CgpGaXhlczogM2I5ZGZhNGVmMjhjICgiZHJtL2tvbWVkYTogQWRkIHNsYXZlIHBpcGVsaW5lIHN1
cHBvcnQiKQpDYzogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJt
LmNvbT4KQ2M6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5x
aWFuLndhbmdAYXJtLmNvbT4KQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgpD
YzogTWFsaSBEUCBNYWludGFpbmVycyA8bWFsaWRwQGZvc3MuYXJtLmNvbT4KQ2M6IEJyaWFuIFN0
YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgMjQgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAgIHwgIDMgLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDI3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NydGMuYwppbmRleCBlODUyZGMyN2YxYjguLmY0NDAwNzg4YWI5NCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0
Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMu
YwpAQCAtNDk5LDI2ICs0OTksNiBAQCBpbnQga29tZWRhX2ttc19zZXR1cF9jcnRjcyhzdHJ1Y3Qg
a29tZWRhX2ttc19kZXYgKmttcywKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBrb21lZGFf
Y3J0Y19jcmVhdGVfc2xhdmVfcGxhbmVzX3Byb3BlcnR5KHN0cnVjdCBrb21lZGFfY3J0YyAqa2Ny
dGMpCi17Ci0Jc3RydWN0IGRybV9jcnRjICpjcnRjID0gJmtjcnRjLT5iYXNlOwotCXN0cnVjdCBk
cm1fcHJvcGVydHkgKnByb3A7Ci0KLQlpZiAoa2NydGMtPnNsYXZlX3BsYW5lcyA9PSAwKQotCQly
ZXR1cm4gMDsKLQotCXByb3AgPSBkcm1fcHJvcGVydHlfY3JlYXRlX3JhbmdlKGNydGMtPmRldiwg
RFJNX01PREVfUFJPUF9JTU1VVEFCTEUsCi0JCQkJCSAic2xhdmVfcGxhbmVzIiwgMCwgVTMyX01B
WCk7Ci0JaWYgKCFwcm9wKQotCQlyZXR1cm4gLUVOT01FTTsKLQotCWRybV9vYmplY3RfYXR0YWNo
X3Byb3BlcnR5KCZjcnRjLT5iYXNlLCBwcm9wLCBrY3J0Yy0+c2xhdmVfcGxhbmVzKTsKLQotCWtj
cnRjLT5zbGF2ZV9wbGFuZXNfcHJvcGVydHkgPSBwcm9wOwotCi0JcmV0dXJuIDA7Ci19Ci0KIHN0
YXRpYyBzdHJ1Y3QgZHJtX3BsYW5lICoKIGdldF9jcnRjX3ByaW1hcnkoc3RydWN0IGtvbWVkYV9r
bXNfZGV2ICprbXMsIHN0cnVjdCBrb21lZGFfY3J0YyAqY3J0YykKIHsKQEAgLTU1NSwxMCArNTM1
LDYgQEAgc3RhdGljIGludCBrb21lZGFfY3J0Y19hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICpr
bXMsCiAKIAljcnRjLT5wb3J0ID0ga2NydGMtPm1hc3Rlci0+b2Zfb3V0cHV0X3BvcnQ7CiAKLQll
cnIgPSBrb21lZGFfY3J0Y19jcmVhdGVfc2xhdmVfcGxhbmVzX3Byb3BlcnR5KGtjcnRjKTsKLQlp
ZiAoZXJyKQotCQlyZXR1cm4gZXJyOwotCiAJcmV0dXJuIGVycjsKIH0KIApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAppbmRleCAyNzc1ZjM0YmY0
YWIuLmM1NDVjYjk2M2Q0MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfa21zLmgKQEAgLTk0LDkgKzk0LDYgQEAgc3RydWN0IGtvbWVkYV9jcnRjIHsK
IAogCS8qKiBAZGlzYWJsZV9kb25lOiB0aGlzIGZsaXBfZG9uZSBpcyBmb3IgdHJhY2luZyB0aGUg
ZGlzYWJsZSAqLwogCXN0cnVjdCBjb21wbGV0aW9uICpkaXNhYmxlX2RvbmU7Ci0KLQkvKiogQHNs
YXZlX3BsYW5lc19wcm9wZXJ0eTogcHJvcGVydHkgZm9yIHNsYXZlcyBvZiB0aGUgcGxhbmVzICov
Ci0Jc3RydWN0IGRybV9wcm9wZXJ0eSAqc2xhdmVfcGxhbmVzX3Byb3BlcnR5OwogfTsKIAogLyoq
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
