Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11174116A10
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994616E3B5;
	Mon,  9 Dec 2019 09:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6582C6E0CB
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2019 17:19:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f129so12390041wmf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2019 09:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Af0AIrF2pn2WiljuwZLbgsnTz6mwhPcm7wLICRG7aXU=;
 b=WR5fXCzhK3sQ7Z2KNP+6DyayvJ/dy41e8snt6j/fTuX8WU6AtCEavCvFoMioiOLwEj
 jAGJCK2yAKHNauZAv+s21FgszLI8PqgNLUZnpGWWVm3ebMAa6OKPN4kW7Cg+VvcM1uKt
 xWpLM27ZI20Ddx1IGYMKQqY9FX4THg4ZcVLec9222GKvrcqIlxfScO2C1jdt5o50NwPU
 FSzty+qLmzVxEvN0Ub+78FCcOev/6a9O2ZeCHtrQZwC+Ps0V+Ts9R4Hk5kzstTYfI4OK
 n7uKPZfmBndSvYtzJlsKOMGwEzqU29NtMZQU2BmskRT0CRsa/Z8N656e0FqOs8zKxIZE
 vINA==
X-Gm-Message-State: APjAAAWKVGHX0nLFGuQEguW8eStl9+WQBgPGRNCJnwhbdsuJftH7U0hz
 GSEyq6Wv6YW+AlA/qPPkFnY=
X-Google-Smtp-Source: APXvYqzKs5N7Q7VkfHt/A0pJeugUntAJWwWw96d/Y+AABbb6hRDfVkYvauPT6/LzxBSp7XZU8E51bw==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr21086627wmi.107.1575825541855; 
 Sun, 08 Dec 2019 09:19:01 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371AD700428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371a:d700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g25sm11791383wmh.3.2019.12.08.09.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 09:19:01 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	narmstrong@baylibre.com
Subject: [PATCH v2 2/2] drm: meson: venc: cvbs: fix CVBS mode matching
Date: Sun,  8 Dec 2019 18:18:32 +0100
Message-Id: <20191208171832.1064772-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
References: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Af0AIrF2pn2WiljuwZLbgsnTz6mwhPcm7wLICRG7aXU=;
 b=HSeJVcOunCaBhrbYJRxC+JJuLUSzSb8dl6z/zdArFxVXJJsloVOq8463hSurjc+3TP
 wjIn7/G6dNRHl5p/UKKibhYd1Ua7uLmpkb/c0umZcPjJ9IRBF8eNRlRSByt0FpLCACF3
 sCjMP0xkROPJikNqBxmC5M945CXBFcQnF/FJ9N7/Dh3vDXMyYfGLRr9lZ8E1M6zW3aef
 Ril7fpN8dRm/tVbhlGd5n73y61PGYgG3FWsJ6eqJgCJasaCqv9e6AaTzmsFfBvKUh+vD
 DF617jh3WLGIzM82GuhNLbFmAtEgEHlXfpkYujDD7aKXPE99Bfbhnd/qvbFikkFPQvDd
 VjQA==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCBjb21taXQgMjIyZWMxNjE4YzNhY2UgKCJkcm06IEFkZCBhc3BlY3QgcmF0aW8gcGFyc2lu
ZyBpbiBEUk0KbGF5ZXIiKSB0aGUgZHJtIGNvcmUgc3RhcnRlZCBob25vcmluZyB0aGUgcGljdHVy
ZV9hc3BlY3RfcmF0aW8gZmllbGQKd2hlbiBjb21wYXJpbmcgdHdvIGRybV9kaXNwbGF5X21vZGVz
LiBQcmlvciB0byB0aGF0IGl0IHdhcyBpZ25vcmVkLgpXaGVuIHRoZSBDVkJTIGVuY29kZXIgZHJp
dmVyIHdhcyBpbml0aWFsbHkgc3VibWl0dGVkIHRoZXJlIHdhcyBubyBhc3BlY3QKcmF0aW8gY2hl
Y2suCgpTd2l0Y2ggZnJvbSBkcm1fbW9kZV9lcXVhbCgpIHRvIGRybV9tb2RlX21hdGNoKCkgd2l0
aG91dApEUk1fTU9ERV9NQVRDSF9BU1BFQ1RfUkFUSU8gdG8gZml4ICJrbXNjdWJlIiBhbmQgWC5v
cmcgb3V0cHV0IHVzaW5nIHRoZQpDVkJTIGNvbm5lY3Rvci4gV2hlbiAoZm9yIGV4YW1wbGUpIGtt
c2N1YmUgc2V0cyB0aGUgb3V0cHV0IG1vZGUgd2hlbgp1c2luZyB0aGUgQ1ZCUyBjb25uZWN0b3Ig
aXQgcGFzc2VzIEhETUlfUElDVFVSRV9BU1BFQ1RfTk9ORSwgbWFraW5nIHRoZQpkcm1fbW9kZV9l
cXVhbCgpIGZhaWwgYXMgaXQgaW5jbHVkZSB0aGUgYXNwZWN0IHJhdGlvLgoKUHJpb3IgdG8gdGhp
cyBwYXRjaCBrbXNjdWJlIHJlcG9ydGVkOgogIGZhaWxlZCB0byBzZXQgbW9kZTogSW52YWxpZCBh
cmd1bWVudAoKVGhlIENWQlMgbW9kZSBjaGVja2luZyBpbiB0aGUgc3VuNGkgKGRyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW40aV90di5jCnN1bjRpX3R2X21vZGVfdG9fZHJtX21vZGUpIGFuZCBaVEUg
KGRyaXZlcnMvZ3B1L2RybS96dGUvenhfdHZlbmMuYwp0dmVuY19tb2RlX3twYWwsbnRzY30pIGRy
aXZlcnMgZG9uJ3Qgc2V0IHRoZSAicGljdHVyZV9hc3BlY3RfcmF0aW8iIGF0CmFsbC4gVGhlIE1l
c29uIFZQVSBkcml2ZXIgZG9lcyBub3QgcmVseSBvbiB0aGUgYXNwZWN0IHJhdGlvIGZvciB0aGUg
Q1ZCUwpvdXRwdXQgc28gd2UgY2FuIHNhZmVseSBkZWNvdXBsZSBpdCBmcm9tIHRoZSBoZG1pX3Bp
Y3R1cmVfYXNwZWN0CnNldHRpbmcuCgpGaXhlczogMjIyZWMxNjE4YzNhY2UgKCJkcm06IEFkZCBh
c3BlY3QgcmF0aW8gcGFyc2luZyBpbiBEUk0gbGF5ZXIiKQpGaXhlczogYmJiZTc3NWVjNWI1ZGEg
KCJkcm06IEFkZCBzdXBwb3J0IGZvciBBbWxvZ2ljIE1lc29uIEdyYXBoaWMgQ29udHJvbGxlciIp
ClNpZ25lZC1vZmYtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xA
Z29vZ2xlbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmNfY3Zi
cy5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuY19jdmJz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuY19jdmJzLmMKaW5kZXggNmI4YTA3
NGU0ZmY0Li4xYmQ2YjZkMTVmZmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl92ZW5jX2N2YnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuY19j
dmJzLmMKQEAgLTcyLDcgKzcyLDExIEBAIG1lc29uX2N2YnNfZ2V0X21vZGUoY29uc3Qgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgKnJlcV9tb2RlKQogCWZvciAoaSA9IDA7IGkgPCBNRVNPTl9DVkJT
X01PREVTX0NPVU5UOyArK2kpIHsKIAkJc3RydWN0IG1lc29uX2N2YnNfbW9kZSAqbWVzb25fbW9k
ZSA9ICZtZXNvbl9jdmJzX21vZGVzW2ldOwogCi0JCWlmIChkcm1fbW9kZV9lcXVhbChyZXFfbW9k
ZSwgJm1lc29uX21vZGUtPm1vZGUpKQorCQlpZiAoZHJtX21vZGVfbWF0Y2gocmVxX21vZGUsICZt
ZXNvbl9tb2RlLT5tb2RlLAorCQkJCSAgIERSTV9NT0RFX01BVENIX1RJTUlOR1MgfAorCQkJCSAg
IERSTV9NT0RFX01BVENIX0NMT0NLIHwKKwkJCQkgICBEUk1fTU9ERV9NQVRDSF9GTEFHUyB8CisJ
CQkJICAgRFJNX01PREVfTUFUQ0hfM0RfRkxBR1MpKQogCQkJcmV0dXJuIG1lc29uX21vZGU7CiAJ
fQogCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
