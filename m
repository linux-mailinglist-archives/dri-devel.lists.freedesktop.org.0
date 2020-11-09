Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 872D82AC6DA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0CC895C4;
	Mon,  9 Nov 2020 21:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF63895B6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a65so923151wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mP6ncVP3tb6PBoh8PR+HhOmxf1xJDs0FPGkTnD+ivtc=;
 b=KFykpLfCS//ZsH9E/r0koc17hviNUTM0dyZhwgahRURu3RDlD7WSTPyYvfI4R8B37N
 ZFI3daldAmSN6II7vkZ85e3c/io1Z3RNNLihM2vj4e44wuAlM7r5dqaY2pDwC8H5SDhx
 MVXosMn+hWDvCRWFW3ZAc6jqRmjlJQqoWzd+x45NGezmyeXfjnPyZNr4TX3GenC0Kslv
 8jDKQGDpJUYd5tCK0MisiUthJtNJogiZomkAVQ4mIqAEpuMMcUSgIerN9BLCTgEJ9vGL
 +NKWgQHleOmv5Wx5VeN25Eq5miaw3qZyfxGB+zMrOE+/foVnBu/M/3DohTb7/Dk+ROoN
 7rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mP6ncVP3tb6PBoh8PR+HhOmxf1xJDs0FPGkTnD+ivtc=;
 b=PW18GpNVmoL8nmLeW9vx4EQfPmttBo57hQ8qkXhcNE6D29dv8wZ2A0N2I9CWoZ73wK
 eO0OvAyw+Pg0MEcGOIubD1+hxc1v/7VqpIstkcHUaUwthTxhc2c+DZsn2eg4P0yg8cmV
 4OgTfgbV/ThmRWAJbR52vMC0hs84lbmBC5ln4qraMTQKscq1vLRM/5TUxEZjCAA1Qten
 N827mpBLVrcLC4Scu6k3+6E+yrTTrqgt/lGz9IZVZ83wm6VUGnWir8tiG9FH3JMW+Vr1
 OeTWf0+j5urMP2vGhkynwKInXah8VdK4HEM6PWmcEAKZ+FRohLaGXKqYmcJAP6vZHSIR
 vuEQ==
X-Gm-Message-State: AOAM530i7RVVD/XUYjEz/kKEOV28JD9NrzDPIef5/Y8rvmEPGTcsfY4D
 wkkeiFlI6bkLWbLC+/ur4/nSrg==
X-Google-Smtp-Source: ABdhPJwMQ0THyZ4Mbc995Ryvr/CJnNf+FANW5IqZWpqhZmq6ig24FVd7CojcL67BKR9smBQwsI+Y4A==
X-Received: by 2002:a1c:7f14:: with SMTP id a20mr1125386wmd.95.1604956773891; 
 Mon, 09 Nov 2020 13:19:33 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/20] drm/radeon/evergreen: Move 'rv770_set_clk_bypass_mode'
 prototype to shared location
Date: Mon,  9 Nov 2020 21:18:48 +0000
Message-Id: <20201109211855.3340030-14-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
aW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYyB8IDEgLQogZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yNjAwLmMgICAgICB8IDEgLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCAg
ICB8IDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jCmluZGV4IDE0ZDkwZGMzNzZlNzEuLjM1NDFh
OTQ0NGJlMjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYwpAQCAtMjIzLDcgKzIyMyw2
IEBAIGV4dGVybiB1MzIgc2lfZ2V0X2NzYl9zaXplKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2
KTsKIGV4dGVybiB2b2lkIHNpX2dldF9jc2JfYnVmZmVyKHN0cnVjdCByYWRlb25fZGV2aWNlICpy
ZGV2LCB2b2xhdGlsZSB1MzIgKmJ1ZmZlcik7CiBleHRlcm4gdTMyIGNpa19nZXRfY3NiX3NpemUo
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogZXh0ZXJuIHZvaWQgY2lrX2dldF9jc2JfYnVm
ZmVyKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCB2b2xhdGlsZSB1MzIgKmJ1ZmZlcik7Ci1l
eHRlcm4gdm9pZCBydjc3MF9zZXRfY2xrX2J5cGFzc19tb2RlKHN0cnVjdCByYWRlb25fZGV2aWNl
ICpyZGV2KTsKIAogc3RhdGljIGNvbnN0IHUzMiBldmVyZ3JlZW5fZ29sZGVuX3JlZ2lzdGVyc1td
ID0KIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKaW5kZXggNmU3ODBiMDEwOTk5NS4uOTU4Nzc5MjUwMzUy
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKQEAgLTExMiw3ICsxMTIsNiBAQCB2b2lkIHI2MDBfZmlu
aShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiB2b2lkIHI2MDBfaXJxX2Rpc2FibGUoc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogc3RhdGljIHZvaWQgcjYwMF9wY2llX2dlbjJfZW5h
YmxlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIGV4dGVybiBpbnQgZXZlcmdyZWVuX3Js
Y19yZXN1bWUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwotZXh0ZXJuIHZvaWQgcnY3NzBf
c2V0X2Nsa19ieXBhc3NfbW9kZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiAKIC8qCiAg
KiBJbmRpcmVjdCByZWdpc3RlcnMgYWNjZXNzb3IKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCmluZGV4
IDQyMWY2YjI2NTEyZWQuLjMyYTJjODk0ZWUzZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaApA
QCAtMjgwLDYgKzI4MCw4IEBAIHN0cnVjdCByYWRlb25fY2xvY2sgewogCXVpbnQzMl90IHZjb19m
cmVxOwogfTsKIAordm9pZCBydjc3MF9zZXRfY2xrX2J5cGFzc19tb2RlKHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2KTsKKwogLyoKICAqIFBvd2VyIG1hbmFnZW1lbnQKICAqLwotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
