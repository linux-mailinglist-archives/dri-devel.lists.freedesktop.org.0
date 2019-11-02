Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED07ED00E
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 18:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386FC6E0C1;
	Sat,  2 Nov 2019 17:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947C86E0C1;
 Sat,  2 Nov 2019 17:56:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p4so12717468wrm.8;
 Sat, 02 Nov 2019 10:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fg11aERMXXKX34QNhVirF3sCeunB+ZROwt3Ey5G2HSM=;
 b=YT9kC+VB60/dBwmA7+WZr/suC+7aJGKB+N2YuwViTSJ5oD3wOgOymbx4upBESjA1xI
 sesKhQJlvThuyuUgMBiss6bKOGu/Dc+kqRp0I8kjYCBhwtZJgI0BEI5AtxvnKVld2JGt
 ZeWLeLx57whdVwSr7aIvZ+Q8sGbEhZFYag5nozTsspnHOShdTpmngYov2I3a8rNlVC3H
 MCncsKpjZd7Fs+DUcDzJ2OoE+WmkSFB9nwGm+4PurJDHaZE8Ubza0JrG3Dz3wymv4P4Y
 JQHdTYeRN1YQ4q/7tagNSeYhnddFtXFjDM2ZXi4kd7c51JXBSwer9BVWgWquTG6ugKVE
 xbhg==
X-Gm-Message-State: APjAAAUFWwOWFRBOQjPsvK69sXxz2dldWSmijlmEN7pci1aiz9wQPGIN
 Zvb/CAD/CYcm7q/OkO7+Moo=
X-Google-Smtp-Source: APXvYqw6k2ZjTC5NJXhWRF/IpJtNW8Ee625GVll8Tb68kyZ4MZEqLCHCXpiEBakP2egHmjfskc68qA==
X-Received: by 2002:a5d:5222:: with SMTP id i2mr15880369wra.271.1572717400076; 
 Sat, 02 Nov 2019 10:56:40 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id x8sm4879225wrm.7.2019.11.02.10.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2019 10:56:38 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 0/9] drm/nouveau: Various fixes for GP10B
Date: Sat,  2 Nov 2019 18:56:28 +0100
Message-Id: <20191102175637.3065-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fg11aERMXXKX34QNhVirF3sCeunB+ZROwt3Ey5G2HSM=;
 b=FLzW9d6erDn/RwVAHdSRCc0yMFte8vZTNq4lvLhX1e1ADj0W+CfFPce59eATPP+3Vc
 qBsxWMNzdGFuTwDSHnnh/yDzJibGf3nSDiLQxSDFHXIq4KiOJ3YiTk2VqxaPKNmb4S0N
 vAy8qzOCL7u+OFNtt+y4liudUD+D3QS0IGnM9J11M2EaoakBxKRAadXaE7i5R7uriwmT
 d6WObeUbfe2SDQfqsAc2GgCwI4HqoklFhtxTnQqsBeJQvrxJ0ztJ8RBHH9ZLzRl+R0vh
 kVCf5beLLR9S82ZtcXLgbuB+azDyuhrIdmevUyjGqMC3Rft+SJaRVrUEQEntcTq5oUPI
 tEMQ==
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
 Ben Dooks <ben.dooks@codethink.co.uk>, dri-devel@lists.freedesktop.org
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
LCBpdCdkIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBnaXZlIGFuIEFja2VkLWJ5IG9uIHRob3NlIHR3
byBwYXRjaGVzCnNvIHRoYXQgQmVuIGNhbiBwaWNrIHRoZW0gYm90aCB1cCBpbnRvIHRoZSBOb3V2
ZWF1IHRyZWUuIEFsdGVybmF0aXZlbHkgSQpjYW4gcHV0IHRoZW0gYm90aCBpbnRvIGEgc3RhYmxl
IGJyYW5jaCBhbmQgc2VuZCBhIHB1bGwgcmVxdWVzdCB0byBib3RoCm9mIHlvdS4gT3IgeWV0IGFu
b3RoZXIgYWx0ZXJuYXRpdmUgd291bGQgYmUgZm9yIEpvZXJnIHRvIGFwcGx5IHRoZW0gbm93CmFu
ZCBCZW4gdG8gd2FpdCBmb3IgdjUuNS1yYzEgdW50aWwgaGUgcGlja3MgdXAgdGhlIHJlc3QuIEFs
bCBvZiB0aG9zZQp3b3JrIGZvciBtZS4KClRoaWVycnkKClRoaWVycnkgUmVkaW5nICg5KToKICBp
b21tdTogRG9jdW1lbnQgaW9tbXVfZndzcGVjOjpmbGFncyBmaWVsZAogIGlvbW11OiBBZGQgZHVt
bXkgZGV2X2lvbW11X2Z3c3BlY19nZXQoKSBoZWxwZXIKICBkcm0vbm91dmVhdTogZmF1bHQ6IEFk
ZCBzdXBwb3J0IGZvciBHUDEwQgogIGRybS9ub3V2ZWF1OiB0ZWdyYTogRG8gbm90IHRyeSB0byBk
aXNhYmxlIFBDSSBkZXZpY2UKICBkcm0vbm91dmVhdTogdGVncmE6IEF2b2lkIHB1bHNpbmcgcmVz
ZXQgdHdpY2UKICBkcm0vbm91dmVhdTogdGVncmE6IFNldCBjbG9jayByYXRlIGlmIG5vdCBzZXQK
ICBkcm0vbm91dmVhdTogc2VjYm9vdDogUmVhZCBXUFIgY29uZmlndXJhdGlvbiBmcm9tIEdQVSBy
ZWdpc3RlcnMKICBkcm0vbm91dmVhdTogZ3AxMGI6IEFkZCBjdXN0b20gTDIgY2FjaGUgaW1wbGVt
ZW50YXRpb24KICBkcm0vbm91dmVhdTogZ3AxMGI6IFVzZSBjb3JyZWN0IGNvcHkgZW5naW5lCgog
Li4uL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvZmF1bHQuaCAgIHwgIDEgKwogLi4u
L2dwdS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2x0Yy5oIHwgIDEgKwogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyAgICAgICAgIHwgIDMgKy0KIC4uLi9ncHUv
ZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL2Jhc2UuYyB8ICA2ICstCiAuLi4vZHJtL25v
dXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMgICAgfCAyNCArKysrLS0KIC4uLi9ncHUv
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQvS2J1aWxkICB8ICAxICsKIC4uLi9ncHUvZHJt
L25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQvYmFzZS5jICB8ICAyICstCiAuLi4vZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L2dwMTAwLmMgfCAxNyArKy0tCiAuLi4vZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L2dwMTBiLmMgfCA1MyArKysrKysrKysrKysKIC4uLi9n
cHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQvZ3YxMDAuYyB8ICAxICsKIC4uLi9ncHUv
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQvcHJpdi5oICB8IDEwICsrKwogLi4uL2dwdS9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9sdGMvS2J1aWxkICAgIHwgIDEgKwogLi4uL2dwdS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9sdGMvZ3AxMGIuYyAgIHwgNjUgKysrKysrKysrKysrKysrCiAu
Li4vZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2x0Yy9wcml2LmggICAgfCAgMiArCiAuLi4v
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvc2VjYm9vdC9nbTIwMC5oICAgfCAgMiArLQogLi4uL2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L3NlY2Jvb3QvZ20yMGIuYyAgIHwgODEgKysrKysrKysrKysr
LS0tLS0tLQogLi4uL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3NlY2Jvb3QvZ3AxMGIuYyAgIHwg
IDQgKy0KIGluY2x1ZGUvbGludXgvaW9tbXUuaCAgICAgICAgICAgICAgICAgICAgICAgICB8IDQ2
ICsrKysrKy0tLS0tCiAxOCBmaWxlcyBjaGFuZ2VkLCAyNDkgaW5zZXJ0aW9ucygrKSwgNzEgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvZmF1bHQvZ3AxMGIuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L2x0Yy9ncDEwYi5jCgotLSAKMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
