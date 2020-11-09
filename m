Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3B12AC6D9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55720895B6;
	Mon,  9 Nov 2020 21:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92418895B9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c9so935751wml.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f19bG5OlKZrzXa9sIoz5zZmJ+HLtlGgA3VlLSxdphFA=;
 b=aCa++B8skb7N4286tYGRf0uVCE5RA7rp82ko+LOn4nj7tYdW1Try+em3OvGh7LqyHJ
 MRu9QWNM2UQmP4ba30mnVaQj4DEhUYiDtJAvbyg6Z4WqzCMSMMBCywL5BuHEKRLTQ3Nt
 2X145Ci6pyLdMT7zFdh2R7fTC99dcrsXD0EYw9LuP3OsGdalYW3SAGUiCeNOmz/E9yEK
 mchlHxBojyQih21VMFDS9OpCNNLApP66gmN4r2PoS0bM6GwOpg6mRa2jMWrpl7BtEGXH
 FFXqxiP6DlTTZZGtyKGVzWqpe9Tq3bxgTloLVFtq3gA13n/n1cc5NsUa3HUiCib0YktV
 cJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f19bG5OlKZrzXa9sIoz5zZmJ+HLtlGgA3VlLSxdphFA=;
 b=fsMloOsmPrmKF6+jOVlgAaSwDf2SGHIjeeHhBme6lFaZTmXsg8t7pC5DXzBZVNmVao
 gexalIsv3LIOgXQNAq8xmZskAJOROw6DuCKvnrrtXL/NZpAOhxr/0SdRqGNc2epY6opF
 ZFz89d3RC/jlctXGvD6ZmBfTxyruJpoa2FK8NUogkkJ7rLheGJdDqFFN0BllaNd2iDgD
 8Q9tlqYlBkj1mAu/NZwjTfVuarZJHJfQ8uy7K3xcn0Wt64pFGvW5zQ3P1mWv9zVrRXtA
 GN7ndaRi6oMuY2P8ZT/pREPC6zbAC7nxdEZNGidu9evkf0yJFfrK7tMmKvZuNGzyB3Yr
 ARbA==
X-Gm-Message-State: AOAM532tyAscOnASKdQgmyvgtSUDW/q95SLupWPkjTGj1NZ+xbUKJqkU
 Gpt28fsscUXz8nI9qclDYtE3mQ==
X-Google-Smtp-Source: ABdhPJwQU+oNyhuK8854ZDn2P3n7yVLK4Po3zrKf1ArE64AewxBRgP1hJdqCM5548erM822qPbeZIw==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr1138832wmp.187.1604956775281; 
 Mon, 09 Nov 2020 13:19:35 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/20] drm/radeon: Move 'radeon_pm_acpi_event_handler'
 prototype into shared header
Date: Mon,  9 Nov 2020 21:18:49 +0000
Message-Id: <20201109211855.3340030-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9ydjc3MC5jOjExMzg6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJv
dG90eXBlIGZvciDigJhydjc3MF9zZXRfY2xrX2J5cGFzc19tb2Rl4oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KIDExMzggfCB2b2lkIHJ2NzcwX3NldF9jbGtfYnlwYXNzX21vZGUoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpCiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCkNjOiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNl
bXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oICAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2FjcGkuYyB8IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b24uaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgKaW5kZXggMzJhMmM4OTRlZTNm
Zi4uMWNiYmFmZjdjZWRlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b24uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCkBAIC0yOTEsNiArMjkx
LDcgQEAgdm9pZCByYWRlb25fcG1fZmluaShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiB2
b2lkIHJhZGVvbl9wbV9jb21wdXRlX2Nsb2NrcyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7
CiB2b2lkIHJhZGVvbl9wbV9zdXNwZW5kKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIHZv
aWQgcmFkZW9uX3BtX3Jlc3VtZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cit2b2lkIHJh
ZGVvbl9wbV9hY3BpX2V2ZW50X2hhbmRsZXIoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwog
dm9pZCByYWRlb25fY29tYmlvc19nZXRfcG93ZXJfbW9kZXMoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpOwogdm9pZCByYWRlb25fYXRvbWJpb3NfZ2V0X3Bvd2VyX21vZGVzKHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2KTsKIGludCByYWRlb25fYXRvbV9nZXRfY2xvY2tfZGl2aWRlcnMoc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9hY3BpLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hY3BpLmMK
aW5kZXggNmNmMTY0NWU3YTFhOC4uMGViNTk0YjU2YWY4YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fYWNwaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2FjcGkuYwpAQCAtNDUsOCArNDUsNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcmFkZW9u
X2F0cHhfZGdwdV9yZXFfcG93ZXJfZm9yX2Rpc3BsYXlzKHZvaWQpIHsgcmV0dXJuIGZhbHNlOwog
CiAjZGVmaW5lIEFDUElfQUNfQ0xBU1MgICAgICAgICAgICJhY19hZGFwdGVyIgogCi1leHRlcm4g
dm9pZCByYWRlb25fcG1fYWNwaV9ldmVudF9oYW5kbGVyKHN0cnVjdCByYWRlb25fZGV2aWNlICpy
ZGV2KTsKLQogc3RydWN0IGF0aWZfdmVyaWZ5X2ludGVyZmFjZSB7CiAJdTE2IHNpemU7CQkvKiBz
dHJ1Y3R1cmUgc2l6ZSBpbiBieXRlcyAoaW5jbHVkZXMgc2l6ZSBmaWVsZCkgKi8KIAl1MTYgdmVy
c2lvbjsJCS8qIHZlcnNpb24gKi8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
