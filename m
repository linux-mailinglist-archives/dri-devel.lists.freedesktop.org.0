Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546DFB3CA6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 16:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCD16E9A2;
	Mon, 16 Sep 2019 14:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097426E99F;
 Mon, 16 Sep 2019 14:36:10 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a23so278265edv.5;
 Mon, 16 Sep 2019 07:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1XsV7RL+tXiXcHs/nNSnKdJfDWDCeCRmVKpz9qqh7x8=;
 b=FSagH7oEV8ZSpw0A2w+HazHyxoFisN+REAaCnx0kYNLpr/3F4IJOoK7BhwavqTLCuY
 DTmcDPzJokFUkKIZh5Ylpn7Cz5gmwrcyfM0ftrZy6zEe3Ui8PKFnRBYWjRxvHMKOFu4U
 lDsJe0kjNbZdAPcvYcJGHDOO9IosX0Pyi97ISd0Y5tQil++6vxOjvIta1P/g7k/crsVN
 rrD1R0DrSNgn2joeSnKzh+ZUYhE+vyI5BD5nVuNGlpAc2MdSS02TrDKQrzx+iKrUgyjJ
 ibLIq2wubunapCEjLI5gSZTewv6sBSPE79k1OpbGnrx4wa4/RZ7qfm0BxHOm/Y3sExs4
 Q9gw==
X-Gm-Message-State: APjAAAWAIMGyPDNrTsosobWiCg+WxNErhQJO8mowacA1pyQjjLrKL515
 hEQxWpGcZ0ptP7lX8ykNdfs=
X-Google-Smtp-Source: APXvYqxXBbdV8qdmbObyOkvwZ40s/zXM1aQGDXKm1JO7i3ZvwOtGICLnyv2wexFTsar9KsCikZrPbg==
X-Received: by 2002:a50:f789:: with SMTP id h9mr62690414edn.139.1568644568525; 
 Mon, 16 Sep 2019 07:36:08 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id v8sm2106478edl.74.2019.09.16.07.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 07:36:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 0/2] drm/nouveau: Two more fixes
Date: Mon, 16 Sep 2019 16:36:04 +0200
Message-Id: <20190916143606.9272-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1XsV7RL+tXiXcHs/nNSnKdJfDWDCeCRmVKpz9qqh7x8=;
 b=VmEY6TkoD9EByQhHCWP3BviHoRObQo0EZmi3oqyyjrcr1R55kNSIugaCQcdCTNx7XX
 bzImoc/VtY2zoTa8pDfrPhwC72t2gmcQTZdZuJBrXIYwYDPj3wcaiC3rAon/Oya8Zv/E
 KbCWVfiz5MXdDORppZuvDUrLyyQu/FNrRXwyqzuFm2BHpa1bskBCoiLRR4+aQ5hAwKL/
 E1GKnXhEoQExbZTwEVbQZwxpJ5NlxrlgHi5tEg2PVILMEdCd7L+wO3Nyd/r43K72MSKp
 evteyuxrV8BpODA+g/Z+dhFaaExl85+3JAWuWhEQdW8kmItaUYsbu8G03kykZ6YigDTF
 hnpA==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkhpIEJlbiwKCkkgbWVz
c2VkIHVwIHRoZSBvcmRlcmluZyBvZiBwYXRjaGVzIGluIG15IHRyZWUgYSBiaXQsIHNvIHRoZXNl
IHR3byBmaXhlcwpnb3Qgc2VwYXJhdGVkIGZyb20gdGhlIG90aGVycy4gSSBkb24ndCBjb25zaWRl
ciB0aGVzZSBwYXJ0aWN1bGFyaWx5CnVyZ2VudCBiZWNhdXNlIHRoZSBjcmFzaCB0aGF0IHRoZSBm
aXJzdCBvbmUgZml4ZXMgb25seSBoYXBwZW5zIG9uIGdwMTBiCndoaWNoIHdlIGRvbid0IGVuYWJs
ZSBieSBkZWZhdWx0IHlldCBhbmQgdGhlIHNlY29uZCBwYXRjaCBmaXhlcyBhIGNyYXNoCnRoYXQg
b25seSBoYXBwZW5zIG9uIG1vZHVsZSB1bmxvYWQgKG9yIGRyaXZlciB1bmJpbmQsIG1vcmUgYWNj
dXJhdGVseSksCndoaWNoIGlzbid0IGEgdGVycmlibHkgY29tbW9uIHRoaW5nIHRvIGRvLgoKSSds
bCBiZSBzZW5kaW5nIG91dCBmaXhlcyBzaG9ydGx5IHRvIG1ha2UgdGhlIEdQMTBCIHdvcmsgbW9y
ZSBwcm9wZXJseQpvbiBhIHdpZGVyIHJhbmdlIG9mIEpldHNvbiBUWDIgZGV2aWNlcyBhbmQgZW5h
YmxlIGl0IGJ5IGRlZmF1bHQuCgpPbmUgdGhpbmcgdG8gbWVudGlvbiBpcyB0aGF0IEknbSBub3Qg
ZXhhY3RseSBzdXJlIGlmIHRoZSBmaXJzdCBwYXRjaCBpcwp0aGUgcmlnaHQgdGhpbmcgdG8gZG8u
IEkgaGF2ZW4ndCBzZWVuIGFueSBpc3N1ZXMgYWZ0ZXIgdGhhdCBjaGFuZ2UsIGJ1dApJJ20gYWxz
byBub3QgZXhhY3RseSBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0IEJBUjIgaXMgdXNlZCBmb3IsIHNv
IEkgZG9uJ3QKa25vdyBpZiBJIHdvdWxkJ3ZlIGV2ZW4gY292ZXJlZCB0aG9zZSBjb2RlIHBhdGhz
IChvdGhlciB0aGFuIHRoZSBvbmUKY2F1c2luZyB0aGUgY3Jhc2ggYXQgcHJvYmUgdGltZSkgaW4g
bXkgdGVzdHMuCgpJdCdkIGJlIGdyZWF0IHRvIGdldCBMeXVkZSdzIGZlZWRiYWNrIG9uIHRoZSBz
ZWNvbmQgcGF0Y2gsIHNpbmNlIHRoYXQKY2FsbCB0byBwY2lfZGlzYWJsZV9kZXZpY2UoKSB3YXMg
cmF0aGVyIG9kZGx5IHBsYWNlZCBhbmQgSSdtIG5vdCBzdXJlIGlmCnRoYXQgd2FzIGVzc2VudGlh
bCBmb3IgdGhpbmdzIHRvIHdvcmsgb3Igd2hldGhlciB0aGUgc2xpZ2h0bHkgZGlmZmVyZW50CnBv
aW50IGluIHRpbWUgd2hlcmUgaXQncyBjYWxsZWQgYWZ0ZXIgdGhpcyBwYXRjaCBpcyBhbHNvIG9r
YXkuIEl0IGxvb2tzCnRvIG1lIGxpa2UgaXQgc2hvdWxkIHdvcmsgZmluZSwgYnV0IEkgZG9uJ3Qg
Y3VycmVudGx5IGhhdmUgYSB3YXkgdG8gdGVzdAp0aGlzIG9uIGRlc2t0b3AgR1BVcy4KClRoaWVy
cnkKClRoaWVycnkgUmVkaW5nICgyKToKICBkcm0vbm91dmVhdTogdGVncmE6IEZpeCBOVUxMIHBv
aW50ZXIgZGVyZWZlcmVuY2UKICBkcm0vbm91dmVhdTogdGVncmE6IERvIG5vdCB0cnkgdG8gZGlz
YWJsZSBQQ0kgZGV2aWNlCgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyAg
ICAgICAgIHwgIDMgKy0KIC4uLi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9pbnN0bWVtL2drMjBh
LmMgICB8IDMwICsrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
