Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F6E8DFD4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 23:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08E66E84D;
	Wed, 14 Aug 2019 21:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E3789A83
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 21:31:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z11so462699wrt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 14:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tYm0oLJfCUJDLfaw8xlKVmKmh5gb1gg5bZ8BsqpbG2w=;
 b=hpt47BOXUvKCNBbkTAQo2GDw0+e2P27k5u/mLfiqxcvQXFYVnTBbJvXqz4eKKPHirU
 bqaczirYmccI8GApZz+QKN2wfWCd/TeEtVZUFwvP4J7m+d+XMkCNKGzAdvYPFur84CJD
 bJ5bI6Vp1QlkzQr+ns/84hc2IEl+yjQdMxl27L5Pc816ucFcBw1xBxBENMlZQWR8LLhL
 iJHQ6qlmJZH9tFQtlI9nvKXfB78Ks6otQXBpBezxh9WM0gVyZAS64MeHUjthrpVPLaoe
 Y6geTbatxczCjUC3GH2DzxxWxCKr3+js3Qg5N42aZvpAl9FPGnM3qUVR+85ZmOYPGPch
 Oa+g==
X-Gm-Message-State: APjAAAUV3nHt1VsWFCAl9gooPtaXDQqXdPvGH9wr2RKNRMBgZGFwCDQ1
 nxchngOvmwT5P3fyyur1FJ32dA==
X-Google-Smtp-Source: APXvYqw8lLuTxZ6hfwdZzJNnfdFn5XmLS+VVLFtxxRVv3rAphO1bdipm2Vg6J5p9FbEQHc8AEmYICA==
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr1683889wrs.131.1565818282025; 
 Wed, 14 Aug 2019 14:31:22 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id r17sm2095134wrg.93.2019.08.14.14.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 14:31:21 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH 0/7] Adding a proper workaround for fixing RTD3 issues with
 Nouveau
Date: Wed, 14 Aug 2019 23:31:11 +0200
Message-Id: <20190814213118.28473-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rmlyc3QgdGhyZWUgcGF0Y2hlcyBhcmUgcmVtb3ZpbmcgQUNQSSB3b3JrYXJvdW5kcyB3aGljaCBz
aG91bGQgaGF2ZSBuZXZlcgpsYW5kZWQuCgpUaGUgbGFzdCBmb3VyIGFyZSBhZGRpbmcgYSB3b3Jr
YXJvdW5kIHRvIG5vdXZlYXUgd2hpY2ggc2VlbSB0byBoZWxwIHF1aXRlCmEgbG90IHdpdGggdGhl
IFJURDMgaXNzdWVzIHdpdGggTm91dmVhdSwgc28gbGV0J3MgZGlzY3VzcyBhbmQgZ2V0IHdpZGVy
CnRlc3Rpbmcgb2YgdGhvc2UgYW5kIHNlZSBpZiB0aGVyZSBpcyBhbnkgZmFsbG91dCBvciBsYXB0
b3BzIHdoZXJlIHRoZQppc3N1ZXMgZG9uJ3QgZ2V0IGZpeGVkLgoKS2Fyb2wgSGVyYnN0ICg3KToK
ICBSZXZlcnQgIkFDUEkgLyBPU0k6IEFkZCBPRU0gX09TSSBzdHJpbmcgdG8gZW5hYmxlIGRHUFUg
ZGlyZWN0IG91dHB1dCIKICBSZXZlcnQgIkFDUEkgLyBPU0k6IEFkZCBPRU0gX09TSSBzdHJpbmcg
dG8gZW5hYmxlIE5WaWRpYSBIRE1JIGF1ZGlvIgogIFJldmVydCAiQUNQSSAvIE9TSTogQWRkIE9F
TSBfT1NJIHN0cmluZ3MgdG8gZGlzYWJsZSBOVmlkaWEgUlREMyIKICBkcm0vbm91dmVhdS9wY2k6
IGVuYWJsZSBwY2llIGxpbmsgY2hhbmdlcyBmb3IgcGFzY2FsCiAgZHJtL25vdXZlYXUvcGNpOiBh
ZGQgbnZrbV9wY2llX2dldF9zcGVlZAogIGRybS9ub3V2ZWF1L3BjaTogc2F2ZSB0aGUgYm9vdCBw
Y2llIGxpbmsgc3BlZWQgYW5kIHJlc3RvcmUgaXQgb24gZmluaQogIGRybS9ub3V2ZWF1OiBhYm9y
dCBydW50aW1lIHN1c3BlbmQgaWYgd2UgaGl0IGFuIGVycm9yCgogZHJpdmVycy9hY3BpL29zaS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjQgLS0tLS0tLS0tLQogLi4uL2RybS9ub3V2
ZWF1L2luY2x1ZGUvbnZrbS9jb3JlL2RldmljZS5oICAgIHwgIDIgKwogLi4uL2dwdS9kcm0vbm91
dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L3BjaS5oIHwgIDkgKystLQogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9kcm0uYyAgICAgICAgIHwgIDYgKysrCiAuLi4vZ3B1L2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L2Nsay9iYXNlLmMgICAgfCAgMiArLQogLi4uL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvYmFzZS5jICAgIHwgIDkgKysrLQogLi4uL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYyAgIHwgIDggKystLQogLi4uL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvZ3AxMDAuYyAgIHwgMTAgKysrKwogLi4uL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvcGNpZS5jICAgIHwgNDYgKysrKysrKysrKysrKysrKystLQogLi4u
L2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcHJpdi5oICAgIHwgIDcgKysrCiAxMCBm
aWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkKCi0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
