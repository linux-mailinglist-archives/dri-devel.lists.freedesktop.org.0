Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F37D2CED15
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 21:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F13B6E77F;
	Mon,  7 Oct 2019 19:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F136E77F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 19:58:45 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id t8so10120412lfc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 12:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Te0+R9wpvPeH+o9CV2jEjmUB3JH7u+cwE1kQcoJj+5Y=;
 b=l1EihwUZRG11Teji5ERRNVKSAbO9IL5DZnaWr4ZTksw5vwaenCP39wLkmxlOn8LM2U
 Cjdc+X1KZABem+kNad++n3QDT2XdbHZwZW3gRw02y2TQdjdh1E6HFiqCP7E85muhA3mw
 +9pDuhmaC7EHyCBFkLIeJJKm9Q4Lme9v3aH3eTYV2FwIfoMGWG34/2uAViHRpGOka0r8
 P4UBSvNFEOa9HbkqJERaIpm5W7U++eHECC4EKR0nOi8l1AXIDUnEBQhkYrFwjTcAqjRH
 iW7f7aGfWEzjwDxYimBXKFqdgFszzl3UXEXzwvqDo+A9x6erqak+RnX0eJMO5XiFK8K1
 CU/g==
X-Gm-Message-State: APjAAAXFr8HSPzkpvDTryO9VShOItCucIejrHrqpZjYkzkF0gScFSjWk
 mdUcgPnyprvHTVjNNK5/P82/ZlGoYK1DxGtqlHo=
X-Google-Smtp-Source: APXvYqzM5LSRr8DUaKlzmH6RkIJ9Aly1jDPxv54WESgbm5QfkDnA2bcUWwy916zRthkZbP/PK22Ah1VQBZelbCX06h4=
X-Received: by 2002:a19:f247:: with SMTP id d7mr523246lfk.191.1570478323306;
 Mon, 07 Oct 2019 12:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <1eba1bc0-ba0c-b948-6a3d-51a98f4e5c27@gmail.com>
In-Reply-To: <1eba1bc0-ba0c-b948-6a3d-51a98f4e5c27@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 8 Oct 2019 05:58:30 +1000
Message-ID: <CAPM=9tyivSLW_DUJuZo9XQ8-0DsdCuPxrzqLUC-1u9riihqLSg@mail.gmail.com>
Subject: Re: [pull] ttm drm-fixes-5.4
To: "Koenig, Christian" <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Te0+R9wpvPeH+o9CV2jEjmUB3JH7u+cwE1kQcoJj+5Y=;
 b=JxaaaxRGIOtBUcj9BE6TpTiKRgnPl9ATRW8SZeFxeHKBmOx8Q3EAGmm1b1DbFzeHyR
 yIh/+HLZtPUmJVoi6FEPSYaw0nqcb3hlGFzkFfWMMLjn5X4QGgcucbO5xsxgOAWfucx7
 00hRQmLReNBoXVO8JfZeXubX7xIC9+l8YgldbyhQGXwosd4/LQAw4IJ4m11+I5pPGkaX
 vRnMFtz7jNPZbzEv5JfBdx1z6p/axhanViChKiavW52TnD/Csqb9m6b3DDfJLJvFIuT4
 ETgZ6z6Z7EDNwXjHHN0ihYd6QmNSXjzQv38yYyONiKG4zRSn4RKCldRhtgM2qmyl9aAM
 9xuw==
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHNvbWUgcmVhc29uIHRoaXMgZGlkbid0IGVuZCB1cCBpbiBwYXRjaHdvcmsgd2hpY2ggbWFr
ZXMgaXQgaGFyZApmb3IgbWUgdG8gcHJvY2Vzcy4KClVzdWFsIHN1c3BlY3RzIGFyZSB1c2luZyB0
b28gb2xkIGEgZ2l0IHRvIHNlbmQgaXQgb3IgbWF5YmUgaXQgZ290IGN0cmwtTXMgaW4gaXQuCgpE
YXZlLgoKT24gVGh1LCAzIE9jdCAyMDE5IGF0IDAxOjQ0LCBDaHJpc3RpYW4gS8O2bmlnCjxja29l
bmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBEYXZlLCBEYW5pZWws
Cj4KPiB3ZSBoYWQgc29tZSBwcm9ibGVtcyB0aGlzIGN5Y2xlIHNlbmRpbmcgb3V0IFRUTSBmaXhl
cyBiZWNhdXNlIG9mIGxhY2sgb2YKPiB0aW1lIHRvIHJlYmFzZSBhbWQtc3RhZ2luZy1kcm0tbmV4
dC4KPgo+IEJlY2F1c2Ugb2YgdGhpcyBBbGV4IGFuZCBJIGRlY2lkZWQgdGhhdCBJJ20gZ29pbmcg
dG8gc2VuZCBvdXQgVFRNIHB1bGwKPiByZXF1ZXN0cyBzZXBhcmF0ZWx5IG5vdy4gU28gdGhpcyBp
cyB0aGUgZmlyc3Qgc21hbGwgYnVuY2ggb2YgZml4ZXMgZm9yIDUuNC4KPgo+IFRoZSBmb2xsb3dp
bmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNTRlY2I4ZjcwMjhjNWViM2Q3NDBiYjgyYjBmMWQ5MGYy
ZGY2M2M1YzoKPgo+ICAgIExpbnV4IDUuNC1yYzEgKDIwMTktMDktMzAgMTA6MzU6NDAgLTA3MDAp
Cj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgIGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9ja29lbmlnL2xpbnV4LWRybS5naXQgZHJtLXR0bS1m
aXhlcwo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDNlZWZjZmU5YTY0NGJlNDQw
OTY5MWI0NGMzYjJkNjI5ZDE3N2ZiOWE6Cj4KPiAgICBkcm0vdHRtOiBSZXN0b3JlIHR0bSBwcmVm
YXVsdGluZyAoMjAxOS0xMC0wMiAxNTo1NzozNCArMDIwMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBDaHJpc3Rp
YW4gS8O2bmlnICgxKToKPiAgICAgICAgZHJtL3R0bTogZml4IGJ1c3kgcmVmZXJlbmNlIGluIHR0
bV9tZW1fZXZpY3RfZmlyc3QKPgo+IFRob21hcyBIZWxsc3Ryb20gKDEpOgo+ICAgICAgICBkcm0v
dHRtOiBSZXN0b3JlIHR0bSBwcmVmYXVsdGluZwo+Cj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jICAgIHwgIDQgKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8
IDE2ICsrKysrKystLS0tLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAxMSBkZWxldGlvbnMoLSkKPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
