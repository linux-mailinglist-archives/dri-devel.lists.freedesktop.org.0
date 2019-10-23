Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929ACE1E99
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 16:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109026EAF6;
	Wed, 23 Oct 2019 14:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EA76EAF5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 14:50:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 3so19965661wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 07:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hI++rq87/vzhhNCoiGKRBhfGgl78W1Dui9zd3x/qQ6w=;
 b=hcJmMIdfdX7GQlcsYSRON5uKRkNX5xMDZI2QZ8hjPL4UUS8yIC0/jFPcMJuEVBgrP4
 wWWRDarP4/kpE0do80sZLvUaGT90MFKBJ8a5De5lj9my0xc9pwS0jFjbNP4mTW25do/x
 /xhUIZM9rinkiBpi7VUHbNTxWtvvMenaAyqFa/PCzilpjE3wyuMAU4ueZja+tWCLTsbs
 aDdwyfWwBrBUINC4a6poIDhFNC78fP+EE9EWL3NnPDoczfxTdmmVNcuTXtGH+9j8I69k
 63HlFGzXYrWOyIYl5sUO3rMnjLVmD1tdA1kqHWmgZnQfIdUTyI/SXMOLhWLNiOIp93PH
 zmMQ==
X-Gm-Message-State: APjAAAV7rMDs0Y2QmcR0RSjGHzCEwTGvkVkC5RhgKrxPoTasUCWumcsE
 /qla4+PpudYASyfPyGy4Y75y2pDk1iI=
X-Google-Smtp-Source: APXvYqz6SKA1161CLMMgJ+Bb7B3GJ2UJet2eQgt0IepdWzg0DsNtFTJCakql9yy/ZLRrb4nH2k81nA==
X-Received: by 2002:a1c:7401:: with SMTP id p1mr267890wmc.144.1571842205591;
 Wed, 23 Oct 2019 07:50:05 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z125sm29614190wme.37.2019.10.23.07.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 07:50:02 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/todo: Add entry to remove load/unload hooks
Date: Wed, 23 Oct 2019 16:49:53 +0200
Message-Id: <20191023144953.28190-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023144953.28190-1-daniel.vetter@ffwll.ch>
References: <20191023144953.28190-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hI++rq87/vzhhNCoiGKRBhfGgl78W1Dui9zd3x/qQ6w=;
 b=T5ZB9xenAjjIIKo5qRh3lmAZbur2qrfnZtFve4tLR8MQANz2jUmcpDG3iSzhQJBkBH
 aSPzPD+ZjNBnZEFJ6stEhPneyEMQdLFxQ+L8c9q0/KmsgxpwYvY+L5sz8mxo6igX3/47
 a80RXwxP5ZraAz1L4j+T9YOG8W6AcHFP9o35Q=
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSBtaWRsYXllciwgYnJva2VuLCBhbmQgYmVjYXVzZSBvZiB0aGUgb2xkIGd1bmssIHdl
IGNhbid0IGZpeAp0aGVtLiBGb3IgZXhhbXBsZXMgc2VlIHRoZSB2YXJpb3VzIGNoZWNrcyBpbiBk
cm1fbW9kZV9vYmplY3QuYyBhZ2FpbnN0CmRldi0+cmVnaXN0ZXJlZCwgd2hpY2ggY2Fubm90IGJl
IGVuZm9yY2VkIGlmIHRoZSBkcml2ZXIgc3RpbGwgdXNlcyB0aGUKbG9hZCBob29rLgoKVW5mb3J0
dW5hdGVseSBvdXIgYmlnZ2VzdCBkcml2ZXIgc3RpbGwgdXNlcyBsb2FkL3VubG9hZCwgc28gdGhp
cyB3b3VsZApiZSByZWFsbHkgZ3JlYXQgdG8gZ2V0IGZpeGVkLgoKQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCB8IDE3ICsrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QK
aW5kZXggNzNjNTFiNWEwOTk3Li41YTQ0ZjQ2MzgwYzIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRp
b24vZ3B1L3RvZG8ucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CkBAIC0zNTEs
NiArMzUxLDIzIEBAIGNvbm5lY3RvciByZWdpc3Rlci91bnJlZ2lzdGVyIGZpeGVzCiAKIExldmVs
OiBJbnRlcm1lZGlhdGUKIAorUmVtb3ZlIGxvYWQvdW5sb2FkIGNhbGxiYWNrcyBmcm9tIGFsbCBu
b24tRFJJVkVSX0xFR0FDWSBkcml2ZXJzCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworVGhlIGxvYWQvdW5sb2FkIGNhbGxi
YWNrcyBpbiBzdHJ1Y3QgJmRybV9kcml2ZXIgYXJlIHZlcnkgbXVjaCBtaWRsYXllcnMsIHBsdXMK
K2ZvciBoaXN0b3JpY2FsIHJlYXNvbnMgdGhleSBnZXQgdGhlIG9yZGVyaW5nIHdyb25nIChhbmQg
d2UgY2FuJ3QgZml4IHRoYXQpCitiZXR3ZWVuIHNldHRpbmcgdXAgdGhlICZkcm1fZHJpdmVyIHN0
cnVjdHVyZSBhbmQgY2FsbGluZyBkcm1fZGV2X3JlZ2lzdGVyKCkuCisKKy0gUmV3b3JrIGRyaXZl
cnMgdG8gbm8gbG9uZ2VyIHVzZSB0aGUgbG9hZC91bmxvYWQgY2FsbGJhY2tzLCBkaXJlY3RseSBj
b2RpbmcgdGhlCisgIGxvYWQvdW5sb2FkIHNlcXVlbmNlIGludG8gdGhlIGRyaXZlcidzIHByb2Jl
IGZ1bmN0aW9uLgorCistIE9uY2UgYWxsIG5vbi1EUklWRVJfTEVHQUNZIGRyaXZlcnMgYXJlIGNv
bnZlcnRlZCwgZGlzYWxsb3cgdGhlIGxvYWQvdW5sb2FkCisgIGNhbGxiYWNrcyBmb3IgYWxsIG1v
ZGVybiBkcml2ZXJzLgorCitDb250YWN0OiBEYW5pZWwgVmV0dGVyCisKK0xldmVsOiBJbnRlcm1l
ZGlhdGUKKwogQ29yZSByZWZhY3RvcmluZ3MKID09PT09PT09PT09PT09PT09CiAKLS0gCjIuMjMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
