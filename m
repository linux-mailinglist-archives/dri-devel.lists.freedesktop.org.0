Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90112F45BF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B943B89F0A;
	Wed, 13 Jan 2021 08:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C5589F45
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id 91so1060720wrj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uijBif3LDCp6uSB/PBdTvGwhpkhL7Mx60YRAsO0AYy8=;
 b=fWyttGY5YOrU5xtJtANQdhj0LNwlYyw16LtKgiVGW+KEARU+XsvOkAHJg/PmCEwWVC
 1XHvUW+k7rB2zYNgC88Up8ZfZzpelyN25otNAF9TXn2iYIyclDpgWNtO90qfzJ/3NhK5
 uaafJQFVy/vaqjiU0j9y9ebW8oJlif4JBGxyuRvgJx6UFoNFnvbExzKka9eR0uobCKsJ
 kO6L+t5ue1oa9eTTbmKplUpBaAE/xLNq4yZjdjLXtMZ8DO1cupBORTIM9d3yVLf0nNk8
 2pUE0Ac/j1MftsxdUyo0oTe9rqFDRgER8g6u6V7EW5Xdx7iMmHS90cBbM5YK/raStG39
 /v2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uijBif3LDCp6uSB/PBdTvGwhpkhL7Mx60YRAsO0AYy8=;
 b=W5/trN9ldpWHumiSY15cVTpex+5mNPmUvTmABUBPYbTXKw4P7HXQm5TKAxM5xhAdWN
 iRNlhhb4jsvdYIkF5jAql9E0/5xiYVr0+FQvKXVzYBcLARCbFKL2Wfz8WAExRC40CEAZ
 SQHaJPp9REpQP+3vUtoQbZkP4/kRN+igWEGroX5pS9Mthf+4HCB1v3MPXC2DdYmbAD6K
 ohTm6l+BM5NPBaXXrQYagcNIWT0XPlzaqO+AXvNZtHl7bFyD9hGZoaZ7LwgjimQW0AmV
 /dgSI5I6GcLYmSZwQ1Up9d4o7MciJ8sybmpWfp7kah9nfgetx0NwQN/Cp134TBwwwgg3
 g/wA==
X-Gm-Message-State: AOAM533n6yN3csRHXqUpnZQm5SR4H2R/cRqWFaFxydshzfsbLrCC4ywO
 uHqhdW1mwDmkfXNPYb5j/6Yq9w==
X-Google-Smtp-Source: ABdhPJyOQUs/awLYYca6/4bn7RF3frSY5UBrKKCm/uO/5uxt7oQu7dpIBVHi4TVCij2NMs44m6v1mA==
X-Received: by 2002:a5d:4112:: with SMTP id l18mr1190946wrp.116.1610525282432; 
 Wed, 13 Jan 2021 00:08:02 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/30] drm/amd/display/modules/info_packet/info_packet:
 Correct kernel-doc formatting
Date: Wed, 13 Jan 2021 08:07:27 +0000
Message-Id: <20210113080752.1003793-6-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9tb2R1bGVzL2luZm9fcGFja2V0L2luZm9f
cGFja2V0LmM6NDEyOiB3YXJuaW5nOiBDYW5ub3QgdW5kZXJzdGFuZCAgKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioKCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIC4uLi9hbWQvZGlzcGxheS9tb2R1bGVzL2lu
Zm9fcGFja2V0L2luZm9fcGFja2V0LmMgICB8IDEzICsrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5mb19wYWNrZXQvaW5mb19wYWNrZXQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2luZm9fcGFja2V0L2luZm9fcGFj
a2V0LmMKaW5kZXggMGZkZjdhM2U5NmRlYS4uNTdmMTk4ZGU1ZTJjYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5mb19wYWNrZXQvaW5mb19wYWNrZXQu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmZvX3BhY2tldC9p
bmZvX3BhY2tldC5jCkBAIC00MDksMTYgKzQwOSwxMSBAQCB2b2lkIG1vZF9idWlsZF92c2NfaW5m
b3BhY2tldChjb25zdCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0sCiB9CiAKIC8qKgot
ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqCi0gKiAgRnVuY3Rpb246IG1vZF9idWlsZF9oZl92c2lmX2lu
Zm9wYWNrZXQKKyAqICBtb2RfYnVpbGRfaGZfdnNpZl9pbmZvcGFja2V0IC0gUHJlcGFyZSBIRE1J
IFZlbmRvciBTcGVjaWZpYyBpbmZvIGZyYW1lLgorICogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBGb2xsb3dzIEhETUkgU3BlYyB0byBidWlsZCB1cCBWZW5kb3IgU3BlY2lmaWMgaW5m
byBmcmFtZQogICoKLSAqICBAYnJpZWYKLSAqICAgICBQcmVwYXJlIEhETUkgVmVuZG9yIFNwZWNp
ZmljIGluZm8gZnJhbWUuCi0gKiAgICAgRm9sbG93cyBIRE1JIFNwZWMgdG8gYnVpbGQgdXAgVmVu
ZG9yIFNwZWNpZmljIGluZm8gZnJhbWUKLSAqCi0gKiAgQHBhcmFtIFtpbl0gc3RyZWFtOiBjb250
YWlucyBkYXRhIHdlIG1heSBuZWVkIHRvIGNvbnN0cnVjdCBWU0lGIChpLmUuIHRpbWluZ18zZF9m
b3JtYXQsIGV0Yy4pCi0gKiAgQHBhcmFtIFtvdXRdIGluZm9fcGFja2V0OiAgIG91dHB1dCBzdHJ1
Y3R1cmUgd2hlcmUgdG8gc3RvcmUgVlNJRgotICoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCisgKiAgQHN0
cmVhbTogICAgICBjb250YWlucyBkYXRhIHdlIG1heSBuZWVkIHRvIGNvbnN0cnVjdCBWU0lGIChp
LmUuIHRpbWluZ18zZF9mb3JtYXQsIGV0Yy4pCisgKiAgQGluZm9fcGFja2V0OiBvdXRwdXQgc3Ry
dWN0dXJlIHdoZXJlIHRvIHN0b3JlIFZTSUYKICAqLwogdm9pZCBtb2RfYnVpbGRfaGZfdnNpZl9p
bmZvcGFja2V0KGNvbnN0IHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSwKIAkJc3RydWN0
IGRjX2luZm9fcGFja2V0ICppbmZvX3BhY2tldCkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
