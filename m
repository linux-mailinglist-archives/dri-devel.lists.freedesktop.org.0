Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CD82F1EF0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7275589FA5;
	Mon, 11 Jan 2021 19:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2882B89F71
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:20:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r7so935875wrc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6qinHvszbHKv20eCXlyTbSvavsiU8PbuOK8tq0MfV4=;
 b=U5WrAgLJ8zefgyYItfLqzBpx5oezBJvkiQLUCDgp7ycKfwDXDoTHty7FA+6ZV6b97D
 NN8TEmkq6DHq42uIgNLTOIEbRfkfbccMZETj/PMttJ2Y98DpPLI7id8ONWPkZT731Swt
 hJJbrMWLZs18go/1pgQ7/kTCSsK0LKmq1XTQYWl3hcHa9ku9VZArcO/7bdZBuG24mUHU
 jAsVtScfwlqZe499JuK+JNDp8T/I9067L96PqehBzZQY3UhKNs+wF/BO/EZyNbuy46m7
 DLB9O/gv8+AwO5AWSR0m98Ok8PU080KcvTE0cbgwxMiXuFobeFEEJbPYMBsdP5jApnat
 Z82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6qinHvszbHKv20eCXlyTbSvavsiU8PbuOK8tq0MfV4=;
 b=nAw19KPyNkqDv3qwFAave7Sqr78nXjyx7F+y9xiF2LL+G3Mb8WivlURSxKtjUqC6Sm
 npCraLw8l0q0hAn+LIaf9KGbYj2R5F/u+O9ImMonHpoy42Q8WUajvcGNqdYyCIzj583m
 wNh11SyeAhI3Y8tvnRNbqoqJAkLzedO53WOKXIjAz5y9+7QG2U/epw+kUKwoEgwx+yMM
 lbDL7ThuKZyUkpVaReVq6M1hwN83eJdxqZx7U9EC7sZsBG6tMS+ii9XtJdBLUnjcaKVV
 IIxZ62db7nBs16AxiajUMJekyu93XCJetQ465EhW18m6ZKKa5b68KL143AYXQ+djqoSY
 U6gA==
X-Gm-Message-State: AOAM531VLt4vl/ekqMxDviwt4IRvQJxxF28vPl5ry6YgyhDRSeOqUHjk
 wUj4nDRVarQuSsrlAY2e0cYVAw==
X-Google-Smtp-Source: ABdhPJw9iB23UMo+bsaBTwuBmXwlBwb8fjpQuEWOiOMMgFvtZM8pnezg4Eom59nkxXii3Xp2BqKlnw==
X-Received: by 2002:adf:d085:: with SMTP id y5mr606162wrh.41.1610392810705;
 Mon, 11 Jan 2021 11:20:10 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:20:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/40] drm/amd/display/dc/dce110/dce110_mem_input_v: Include
 our own header, containing prototypes
Date: Mon, 11 Jan 2021 19:19:17 +0000
Message-Id: <20210111191926.3688443-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX21lbV9pbnB1
dF92LmM6MTAzNDo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTEx
MF9tZW1faW5wdXRfdl9jb25zdHJ1Y3TigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IEhh
cnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5n
LmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CkNjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX21lbV9pbnB1dF92LmMg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX21lbV9pbnB1dF92LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9tZW1faW5wdXRfdi5j
CmluZGV4IDE5YjE5NzYxMzliNjkuLjhiYmI0OTkwNjdmNzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX21lbV9pbnB1dF92LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfbWVtX2lucHV0X3Yu
YwpAQCAtMzQsNiArMzQsNyBAQAogI2luY2x1ZGUgImluYy9kY2VfY2FsY3MuaCIKIAogI2luY2x1
ZGUgImRjZS9kY2VfbWVtX2lucHV0LmgiCisjaW5jbHVkZSAiZGNlMTEwX21lbV9pbnB1dF92Lmgi
CiAKIHN0YXRpYyB2b2lkIHNldF9mbGlwX2NvbnRyb2woCiAJc3RydWN0IGRjZV9tZW1faW5wdXQg
Km1lbV9pbnB1dDExMCwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
