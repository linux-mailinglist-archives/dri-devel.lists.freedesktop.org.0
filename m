Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF3116CAA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 13:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EB16E419;
	Mon,  9 Dec 2019 12:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D63D6E41D;
 Mon,  9 Dec 2019 12:00:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j42so15830746wrj.12;
 Mon, 09 Dec 2019 04:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jVo4EgL5w5uDzGazf3l7wTsJXSg/MMHtXYeNv2rCsg0=;
 b=ZdYZI627dPCjgDyIKvsq4y9+nWq5Qa3teDBxZpjWaIP2yrba1GJ4dIRi8KrV/J3wIf
 EN7VsBFoWQ3FBaN+SFjcjr61si42UtvYxiXZmd4mBFe68ltE51fzOhB7drpuRZQEfiNu
 Kz2uUxSdabmQ1hop5EL/sx04xJGr8rDroOeC/G7NoOWjCvKaNhMvTx9d6+XBXVMRZAqK
 +Kff29M6wBJxqYuDTq4FZ4PglpJVB7oFr2s33XkcyrQyMaM7DCWdwEoiK5yfO1yHwDLF
 HTFQXBbAfk+ZB4ghNlUo3BDgru1z4X8KQSKHJRJ0BzYCJz0IrrqTOByWjq2F6l9RogtE
 QA2A==
X-Gm-Message-State: APjAAAV7IkHzRUBoaOmRAt2p65onkl8qJo0d6Pqi5pV0Nz7ucUot+EhR
 DFyUcy2TgzeR5MV9MqGNEAhC61Wf
X-Google-Smtp-Source: APXvYqxvFtxU6WB/3/ekW7w5obFZRKXEM9dhhw5b2O7nuk/LQYLOnnP+CjtLvAnv6TgIKMEEED5xxg==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr1828916wrv.308.1575892807435; 
 Mon, 09 Dec 2019 04:00:07 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id y139sm13774689wmd.24.2019.12.09.04.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:00:06 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v3 0/9] drm/nouveau: Various fixes for GP10B
Date: Mon,  9 Dec 2019 12:59:56 +0100
Message-Id: <20191209120005.2254786-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jVo4EgL5w5uDzGazf3l7wTsJXSg/MMHtXYeNv2rCsg0=;
 b=SOtdMTkeK4Pz/v4aVYilY6jLxtIONogeSbNmCED6mecKqiMNQmaVrWE6AOzhiMrm9H
 mCp06313qLGpUBnFQRrvFW32/EnbuZzn1//FBzNena9YePQCuAj7P0Tn9w0JkemC8gng
 Bq3kMuj0QL2Pk9zNr60qvJuLHMxJP3dEW8eximpgUIJSIOFgOJLEeGuZ3fVAG5EfMDir
 grgBrRPkKuWhoLBozRiIvgM7P27yv3+jo3xkqAIwbY9g6ESHBan2BzItHP0G3/qv0pko
 aUX+Y7kvINbNerW6MoZVmMSgvvcT/Xq8GURz8bxVWsmM4F6mL0nDKpf/gus+2FF1rTbW
 Y2HQ==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkhpIEJlbiwKCmhlcmUn
cyBhIHJldmlzZWQgc3Vic2V0IG9mIHRoZSBwYXRjaGVzIEkgaGFkIHNlbnQgb3V0IGEgY291cGxl
IG9mIHdlZWtzCmFnby4gSSd2ZSByZXdvcmtlZCB0aGUgQkFSMiBhY2Nlc3NlcyBpbiB0aGUgd2F5
IHRoYXQgeW91IGhhZCBzdWdnZXN0ZWQsCndoaWNoIGF0IGxlYXN0IGZvciBHUDEwQiB0dXJuZWQg
b3V0IHRvIGJlIGZhaXJseSB0cml2aWFsIHRvIGRvLiBJIGhhdmUKbm90IGxvb2tlZCBpbiBkZXRh
aWwgYXQgdGhpcyBmb3IgR1YxMUIgeWV0LCBidXQgYSBjdXJzb3J5IGxvb2sgc2hvd2VkCnRoYXQg
QkFSMiBpcyBhY2Nlc3NlZCBpbiBtb3JlIHBsYWNlcywgc28gdGhlIGVxdWl2YWxlbnQgZm9yIEdW
MTFCIG1pZ2h0CmJlIGEgYml0IG1vcmUgaW52b2x2ZWQuCgpPdGhlciB0aGFuIHRoYXQsIG5vdCBh
IGxvdCBoYXMgY2hhbmdlZCBzaW5jZSB0aGVuLiBJJ3ZlIGFkZGVkIGEgY291cGxlCm9mIHByZWN1
cnNvcnkgcGF0Y2hlcyB0byBhZGQgSU9NTVUgaGVscGVyIGR1bW1pZXMgZm9yIHRoZSBjYXNlIHdo
ZXJlCklPTU1VIGlzIGRpc2FibGVkIChhcyBzdWdnZXN0ZWQgYnkgQmVuIERvb2tzKS4KCkpvZXJn
IGhhcyBnaXZlbiBhbiBBY2tlZC1ieSBvbiB0aGUgZmlyc3QgdHdvIHBhdGNoZXMsIHNvIEkgdGhp
bmsgaXQnZCBiZQplYXNpZXN0IGlmIHlvdSBwaWNrZWQgdGhvc2UgdXAgaW50byB0aGUgTm91dmVh
dSB0cmVlIGJlY2F1c2Ugb2YgdGhlCmJ1aWxkIGRlcGVuZGVuY3kgb2Ygc3Vic2VxdWVudCBwYXRj
aGVzIG9uIHRoZW0uCgpUaGllcnJ5CgpUaGllcnJ5IFJlZGluZyAoOSk6CiAgaW9tbXU6IERvY3Vt
ZW50IGlvbW11X2Z3c3BlYzo6ZmxhZ3MgZmllbGQKICBpb21tdTogQWRkIGR1bW15IGRldl9pb21t
dV9md3NwZWNfZ2V0KCkgaGVscGVyCiAgZHJtL25vdXZlYXU6IGZhdWx0OiBBZGQgc3VwcG9ydCBm
b3IgR1AxMEIKICBkcm0vbm91dmVhdTogdGVncmE6IERvIG5vdCB0cnkgdG8gZGlzYWJsZSBQQ0kg
ZGV2aWNlCiAgZHJtL25vdXZlYXU6IHRlZ3JhOiBBdm9pZCBwdWxzaW5nIHJlc2V0IHR3aWNlCiAg
ZHJtL25vdXZlYXU6IHRlZ3JhOiBTZXQgY2xvY2sgcmF0ZSBpZiBub3Qgc2V0CiAgZHJtL25vdXZl
YXU6IHNlY2Jvb3Q6IFJlYWQgV1BSIGNvbmZpZ3VyYXRpb24gZnJvbSBHUFUgcmVnaXN0ZXJzCiAg
ZHJtL25vdXZlYXU6IGdwMTBiOiBBZGQgY3VzdG9tIEwyIGNhY2hlIGltcGxlbWVudGF0aW9uCiAg
ZHJtL25vdXZlYXU6IGdwMTBiOiBVc2UgY29ycmVjdCBjb3B5IGVuZ2luZQoKIC4uLi9kcm0vbm91
dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2ZhdWx0LmggICB8ICAxICsKIC4uLi9ncHUvZHJtL25v
dXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9sdGMuaCB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZHJtLmMgICAgICAgICB8ICAzICstCiAuLi4vZ3B1L2RybS9ub3V2ZWF1
L252a20vZW5naW5lL2RldmljZS9iYXNlLmMgfCAgNiArLQogLi4uL2RybS9ub3V2ZWF1L252a20v
ZW5naW5lL2RldmljZS90ZWdyYS5jICAgIHwgMjQgKysrKy0tCiAuLi4vZ3B1L2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L2ZhdWx0L0tidWlsZCAgfCAgMSArCiAuLi4vZ3B1L2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L2ZhdWx0L2Jhc2UuYyAgfCAgMiArLQogLi4uL2dwdS9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9mYXVsdC9ncDEwMC5jIHwgMTcgKystLQogLi4uL2dwdS9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9mYXVsdC9ncDEwYi5jIHwgNTMgKysrKysrKysrKysrCiAuLi4vZ3B1L2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L2ZhdWx0L2d2MTAwLmMgfCAgMSArCiAuLi4vZ3B1L2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L2ZhdWx0L3ByaXYuaCAgfCAxMCArKysKIC4uLi9ncHUvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvbHRjL0tidWlsZCAgICB8ICAxICsKIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvbHRjL2dwMTBiLmMgICB8IDY1ICsrKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9sdGMvcHJpdi5oICAgIHwgIDIgKwogLi4uL2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L3NlY2Jvb3QvZ20yMDAuaCAgIHwgIDIgKy0KIC4uLi9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9zZWNib290L2dtMjBiLmMgICB8IDgxICsrKysrKysrKysrKy0tLS0tLS0KIC4u
Li9kcm0vbm91dmVhdS9udmttL3N1YmRldi9zZWNib290L2dwMTBiLmMgICB8ICA0ICstCiBpbmNs
dWRlL2xpbnV4L2lvbW11LmggICAgICAgICAgICAgICAgICAgICAgICAgfCA0NyArKysrKystLS0t
LQogMTggZmlsZXMgY2hhbmdlZCwgMjQ5IGluc2VydGlvbnMoKyksIDcyIGRlbGV0aW9ucygtKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Zh
dWx0L2dwMTBiLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9sdGMvZ3AxMGIuYwoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
