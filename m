Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E5F2AF81D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531CD6E0CA;
	Wed, 11 Nov 2020 18:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979E36E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:36:07 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l1so3491952wrb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k31TtB+plPHQj7iD5gVHpYef9lXJ4rGnOi0xYl4wuaA=;
 b=ASHzCi9BO6TBGcwRlccGp9W06y8j0wVJwMq49gkz7BHMXS3KXpXkm539aLEiIiT5eV
 3J60SRWROZJ0FT+DPZIgUGeuLIlBzbJ3JgOp3RVGEh3UCM0qSMagRKSiVQlwBRX4N89t
 vB0Ree3UHKnBben9i1q5CR6vQJvd5aYZC1Vbwd6mmNVPgH8nDExSxRuJVBh14GdCW7Yq
 0GuSXBlbu27+niVCWH4gNpovPCq/hwYLR9m9chbHVsUkz/4Wbwssr2FrsBf08bVFdWsM
 NDCSx0uK9ZHg22H6DCkX1XPyX5gUn8DwZt3ayQdLgTk51um7Nb4u1XDE8gltx6Udm44E
 0e2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k31TtB+plPHQj7iD5gVHpYef9lXJ4rGnOi0xYl4wuaA=;
 b=i+mX81cJAJdpFwXkbNhOl1QvX/hjwreJJAI0RY/VMMmewotuUBhQDGdfXAzq2e6zbJ
 MK98c5hKi9bJvNuSUGbZyt6JLMRPtxt9CiLmzbOpw8zOhk1yWUJmRllf4vDjMB3ARIWv
 61AbpxEE219J9RlKPWlAmBqFj24KIKNaesmzsIb4VVaHsBI4l16a0wih/PDf74qKtO/R
 rtmbbro3fyG4iVFxJZxq17fAZKu4psPoEp07jUy5ayN8I7TmXqU55FPUijAjnucK4d0m
 YchfEsnikc+lFQOQTiKymEipRLCNmMnRNz1kz19OYSz843kmWKUN9mwvCDa6DqG/AVyQ
 BAhQ==
X-Gm-Message-State: AOAM5305wVvomb/6pXlmQYd1XKro5yZjYZ+C5cVNkIiNyWeigIBMS8Ij
 oDnLE+wZhlGLhyDAHbRbgjguDw==
X-Google-Smtp-Source: ABdhPJx4N4V4sx7dAlzbxicFql018cJoVgNWMEO73mIRphND5KBdblN4KdUoquQN5qPSW4ezp+XgIg==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr26422272wrw.123.1605119766309; 
 Wed, 11 Nov 2020 10:36:06 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:36:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/19] drm/radeon/evergreen: Move 'si_get_csb_*()'s prototypes
 to shared header
Date: Wed, 11 Nov 2020 18:35:38 +0000
Message-Id: <20201111183545.1756994-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111183545.1756994-1-lee.jones@linaro.org>
References: <20201111183545.1756994-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9zaS5jOjU2Nzg6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhzaV9nZXRfY3NiX3NpemXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogNTY3
OCB8IHUzMiBzaV9nZXRfY3NiX3NpemUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiB8IF5+
fn5+fn5+fn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5jOjU3MTA6Njogd2Fybmlu
Zzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhzaV9nZXRfY3NiX2J1ZmZlcuKAmSBbLVdt
aXNzaW5nLXByb3RvdHlwZXNdCiA1NzEwIHwgdm9pZCBzaV9nZXRfY3NiX2J1ZmZlcihzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldiwgdm9sYXRpbGUgdTMyICpidWZmZXIpCiB8IF5+fn5+fn5+fn5+
fn5+fn5+CgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmMgfCAzICstLQog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5oICAgICAgICB8IDIgKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJn
cmVlbi5jCmluZGV4IDI4ODMwZjRlZjk1ZTMuLmQ4ZWU4MGFkNGVhNDQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9ldmVyZ3JlZW4uYwpAQCAtNDEsNiArNDEsNyBAQAogI2luY2x1ZGUgInJhZGVvbl9hc2lj
LmgiCiAjaW5jbHVkZSAicmFkZW9uX2F1ZGlvLmgiCiAjaW5jbHVkZSAicmFkZW9uX3Vjb2RlLmgi
CisjaW5jbHVkZSAic2kuaCIKIAogI2RlZmluZSBEQ19IUER4X0NPTlRST0woeCkgICAgICAgIChE
Q19IUEQxX0NPTlRST0wgICAgICsgKHggKiAweGMpKQogI2RlZmluZSBEQ19IUER4X0lOVF9DT05U
Uk9MKHgpICAgIChEQ19IUEQxX0lOVF9DT05UUk9MICsgKHggKiAweGMpKQpAQCAtMjE4LDggKzIx
OSw2IEBAIHZvaWQgZXZlcmdyZWVuX3BjaWVfZ2VuMl9lbmFibGUoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpOwogdm9pZCBldmVyZ3JlZW5fcHJvZ3JhbV9hc3BtKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKIHZvaWQgY2lrX2luaXRfY3BfcGdfdGFibGUoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpOwogCi1leHRlcm4gdTMyIHNpX2dldF9jc2Jfc2l6ZShzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldik7Ci1leHRlcm4gdm9pZCBzaV9nZXRfY3NiX2J1ZmZlcihzdHJ1Y3QgcmFkZW9u
X2RldmljZSAqcmRldiwgdm9sYXRpbGUgdTMyICpidWZmZXIpOwogZXh0ZXJuIHUzMiBjaWtfZ2V0
X2NzYl9zaXplKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIGV4dGVybiB2b2lkIGNpa19n
ZXRfY3NiX2J1ZmZlcihzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdm9sYXRpbGUgdTMyICpi
dWZmZXIpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmggYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmgKaW5kZXggZjQ4M2E2NGQxNzA1MC4uMzEwYzU4Mzc2Zjky
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vc2kuaApAQCAtMzIsNSArMzIsNyBAQCB1MzIgc2lfZ3B1X2NoZWNrX3Nv
ZnRfcmVzZXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogdm9pZCBzaV92cmFtX2d0dF9s
b2NhdGlvbihzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgc3RydWN0IHJhZGVvbl9tYyAqbWMp
Owogdm9pZCBzaV9ybGNfcmVzZXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogdm9pZCBz
aV9pbml0X3V2ZF9pbnRlcm5hbF9jZyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cit1MzIg
c2lfZ2V0X2NzYl9zaXplKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKK3ZvaWQgc2lfZ2V0
X2NzYl9idWZmZXIoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHZvbGF0aWxlIHUzMiAqYnVm
ZmVyKTsKIAogI2VuZGlmICAgICAgICAgICAgICAgICAgICAgICAgIC8qIF9fU0lfSF9fICovCi0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
