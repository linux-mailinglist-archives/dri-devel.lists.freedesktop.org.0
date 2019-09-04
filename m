Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE7A85B7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 16:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B2B89178;
	Wed,  4 Sep 2019 14:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E8E89178
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 14:39:51 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id y91so10732962ede.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 07:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6T0vunus81oOSmwTqHi4FK+oiqrTPhnd6mOhK/w9O8A=;
 b=k9UgXq9FfqtvuoDhbcstRVSlnNTehXbAVtk6BN6/zCtmGjWO2yL22sAQ3q0DK+FYAC
 mqsz0Et9Th61lyMTJIl7Olbzai24DYDFIUbHWxcfsAMjyTBw5+/pxa2wC8CCO2PHoAN+
 1o52l63yOMwib6KKv3fMI7AakXfcg1xF7ZtJT94lLwyBX/IlpG+pB45D/Hg53jW1DZB0
 dJ5w4kl5a9cHzzUBgG3an0gbyUnLi2qPdHecqNB/JP1/HpSc81ZzDLJiist859M7jEc1
 zo6pBRucBe4v3mG7gVt3v8+PTtAy5+ri5XQbHqaWoLSw15QXoh8lkFc/0hN2Fwd+ch8Q
 6LkA==
X-Gm-Message-State: APjAAAWebDUHrsRatO2muuNqYmpOP9pBXiN/bkwIG7ypB7HLH8iNI+ca
 A1PwyZ8X2KmAsQ2zQdP6IxGPUZ1rps8=
X-Google-Smtp-Source: APXvYqx1iJEwAuMY6gGSyeXYiE0i8+1etOubxtB2OFh9lvmJS25iZONCpdkoN/emK36dCsIA8aUF3g==
X-Received: by 2002:a17:906:1d10:: with SMTP id
 n16mr8787944ejh.34.1567607989373; 
 Wed, 04 Sep 2019 07:39:49 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id o4sm101157edq.84.2019.09.04.07.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 07:39:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: Use EOPNOTSUPP, not ENOTSUPP
Date: Wed,  4 Sep 2019 16:39:42 +0200
Message-Id: <20190904143942.31756-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6T0vunus81oOSmwTqHi4FK+oiqrTPhnd6mOhK/w9O8A=;
 b=HtLb9dmSPQQ8J9F8WwGhXf+vJ1jEnR9GYIjPbZm9MLP1f0DxYZk6IPazDhgQLxfMGe
 NlEf3qKzsUuXZIY07fMVTt3XkAUacPmhcnSTbJNoCYRbWwlMcMTOSGPs5wbz6qkdVAGn
 DAC4kAz0g6k+Hgib0Na8i/u19UBdWYnIj87Tc=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Andres Rodriguez <andresx7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LSBpdCdzIHdoYXQgd2UgcmVjb21tZW5kIGluIG91ciBkb2NzOgoKaHR0cHM6Ly9kcmkuZnJlZWRl
c2t0b3Aub3JnL2RvY3MvZHJtL2dwdS9kcm0tdWFwaS5odG1sI3JlY29tbWVuZGVkLWlvY3RsLXJl
dHVybi12YWx1ZXMKCi0gaXQncyB0aGUgb3ZlcndoZWxtaW5nbHkgdXNlZCBlcnJvciBjb2RlIGZv
ciAib3BlcmF0aW9uIG5vdAogIHN1cHBvcnRlZCIsIGF0IGxlYXN0IGluIGRybSBjb3JlIChzbGln
aHRseSBsZXNzIHNvIGluIGRyaXZlcnMpOgoKJCBnaXQgZ3JlcCBFT1BOT1RTVVAgLS0gZHJpdmVy
cy9ncHUvZHJtLypjIHwgd2MgLWwKODMKJCBnaXQgZ3JlcCBFTk9UU1VQIC0tIGRyaXZlcnMvZ3B1
L2RybS8qYyB8IHdjIC1sCjUKCi0gaW5jbHVkZS9saW51eC9lcnJuby5oIG1ha2VzIGl0IGZhaXJs
eSBjbGVhciB0aGF0IHRoZXNlIGFyZSBmb3IgbmZzdjMKICAocGx1cyB0aGV5IGFsc28gaGF2ZSBl
cnJvciBjb2RlcyBhYm92ZSA1MTIsIHdoaWNoIGlzIHRoZSBibG9jayB3aXRoCiAgc29tZSBzcGVj
aWFsIGJlaGF2aW91ciAuLi4pCgovKiBEZWZpbmVkIGZvciB0aGUgTkZTdjMgcHJvdG9jb2wgKi8K
CklmIHRoZSBhYm92ZSBpc24ndCByZWZsZWN0aW5nIGN1cnJlbnQgcHJhY3RpY2UsIHRoZW4gSSBn
dWVzcyB3ZSBzaG91bGQKYXQgbGVhc3QgdXBkYXRlIHRoZSBkb2NzLgoKQ2M6IEpvc8OpIFJvYmVy
dG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1y
aXBhcmRAa2VybmVsLm9yZz4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogQW5kcmVzIFJvZHJpZ3Vl
eiA8YW5kcmVzeDdAZ21haWwuY29tPgpDYzogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5l
cy5vcmc+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jICAgICB8IDYgKysrLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCmluZGV4IDgyYTRjZWVkM2Zj
Zi4uMTJjNzgzZjRkOTU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwpAQCAtMzcxOSw3ICszNzE5LDcgQEAgY2Vh
X2RiX29mZnNldHMoY29uc3QgdTggKmNlYSwgaW50ICpzdGFydCwgaW50ICplbmQpCiAJCWlmICgq
ZW5kIDwgNCB8fCAqZW5kID4gMTI3KQogCQkJcmV0dXJuIC1FUkFOR0U7CiAJfSBlbHNlIHsKLQkJ
cmV0dXJuIC1FTk9UU1VQUDsKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwogCX0KIAogCXJldHVybiAw
OwpAQCAtNDE4OCw3ICs0MTg4LDcgQEAgaW50IGRybV9lZGlkX3RvX3NhZChzdHJ1Y3QgZWRpZCAq
ZWRpZCwgc3RydWN0IGNlYV9zYWQgKipzYWRzKQogCiAJaWYgKGNlYV9yZXZpc2lvbihjZWEpIDwg
MykgewogCQlEUk1fREVCVUdfS01TKCJTQUQ6IHdyb25nIENFQSByZXZpc2lvblxuIik7Ci0JCXJl
dHVybiAtRU5PVFNVUFA7CisJCXJldHVybiAtRU9QTk9UU1VQUDsKIAl9CiAKIAlpZiAoY2VhX2Ri
X29mZnNldHMoY2VhLCAmc3RhcnQsICZlbmQpKSB7CkBAIC00MjQ5LDcgKzQyNDksNyBAQCBpbnQg
ZHJtX2VkaWRfdG9fc3BlYWtlcl9hbGxvY2F0aW9uKHN0cnVjdCBlZGlkICplZGlkLCB1OCAqKnNh
ZGIpCiAKIAlpZiAoY2VhX3JldmlzaW9uKGNlYSkgPCAzKSB7CiAJCURSTV9ERUJVR19LTVMoIlNB
RDogd3JvbmcgQ0VBIHJldmlzaW9uXG4iKTsKLQkJcmV0dXJuIC1FTk9UU1VQUDsKKwkJcmV0dXJu
IC1FT1BOT1RTVVBQOwogCX0KIAogCWlmIChjZWFfZGJfb2Zmc2V0cyhjZWEsICZzdGFydCwgJmVu
ZCkpIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYwppbmRleCBjNGVlMjcwOWE2ZjMuLmY4MTU0MzE2YTNi
MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYwpAQCAtOTU1LDcgKzk1NSw3IEBAIHN0YXRpYyBpbnQg
bWlwaV9kYmlfdHlwZWMxX2NvbW1hbmQoc3RydWN0IG1pcGlfZGJpICpkYmksIHU4ICpjbWQsCiAJ
aW50IHJldDsKIAogCWlmIChtaXBpX2RiaV9jb21tYW5kX2lzX3JlYWQoZGJpLCAqY21kKSkKLQkJ
cmV0dXJuIC1FTk9UU1VQUDsKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwogCiAJTUlQSV9EQklfREVC
VUdfQ09NTUFORCgqY21kLCBwYXJhbWV0ZXJzLCBudW0pOwogCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
