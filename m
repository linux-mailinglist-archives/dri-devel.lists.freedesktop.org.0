Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE55010D0C
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 21:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6419892BE;
	Wed,  1 May 2019 19:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9B5892BE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 19:09:23 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id g7so21121091qtc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2019 12:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=A8ekHoZzNtikEQk+7DGoOR8lW0ADGu9tUhOQO4eJXlQ=;
 b=j0U3zQ5JiI7hoyOyjhR150DuZ2fpFYdCYIKlsd6bH85op27T7Aq9z+4SScaeiz54s5
 UFdv3otyV72F+t5WGXdUaehyLj+2tKg9tf2mfzlZKglDsT1jX9HV5GSulpXo1BcIRxa0
 Nya/7RMSnywYEquQatMrKhYGFFiKqjrA5ZmTTzv5FFknGlpTNGgWn43w3mIaaWLL8aL+
 I9TwgtPiQKaQwZiX+dhPeAqMlelWprBxM/adwhMgmlJq3en3k9+ADTf8i+aUx8bPL1tK
 L9f7S4gbpGCK1O86mgIvYETZgUjh98rPwy2AkVfxnRRNi1+4XlU9pEgVEOZSK7Ou2uKk
 9/SA==
X-Gm-Message-State: APjAAAVk+8xzAqYM2Qd0AZ/Gsqu5+AlBYIRUgQNBPqDTDwgvMyrxZbYc
 q3iKBGcbgaEGZXmgN97GQQZAOg==
X-Google-Smtp-Source: APXvYqxZmYKDhwPB8Jo2bT5iVZERa6msTGD9UHq8HGaeLrUTnimIiL9nt9+6WT2xr1E7t9nvmgkeKA==
X-Received: by 2002:aed:3b33:: with SMTP id p48mr61752528qte.180.1556737762878; 
 Wed, 01 May 2019 12:09:22 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id a57sm8723497qtk.63.2019.05.01.12.09.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 May 2019 12:09:22 -0700 (PDT)
Date: Wed, 1 May 2019 15:09:21 -0400
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20190501190921.GA120430@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=A8ekHoZzNtikEQk+7DGoOR8lW0ADGu9tUhOQO4eJXlQ=;
 b=DRtAaJAuyw4oGuNr/JILi3JHJsEUlt0G/6JtRDewOjUtw4j+9rFEqb07NG/i7JBx6q
 5rBCZ7/SCTne6WoYeXF52rQDjKYr/D8UbHkiSnT+kkY9F4Jv3JsjUwnMMx2eCU1uRq11
 0qc1v/soH0zyB2Co3HuXjB4QKM1ATxnBatn4JLqVJwCj8XkGcIE4FCpFKyN/Nh7Keaf7
 v+a7VPIuHo1QQ8UMKEOyHPZMp3vGvik4jV3DgDRsX4L0Pv6izeD+a5WiwGdbwZi97/YJ
 GsqQ9EQj6D62L63VEYLobjVzjeqUr6pcAoGptfXqWvY3yAV5agZMAOmZypmgmu9FmWhR
 IDxw==
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
Cc: Philip Yang <Philip.Yang@amd.com>, dim-tools@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhLiosClF1aWV0IHdlZWsgc2luY2UgdGhlIGxhc3QgUFIsIEknZCBzYXkgd2UncmUgcmVh
ZHkgZm9yIHRoZSBtZXJnZSB3aW5kb3chCgoKZHJtLW1pc2MtbmV4dC1maXhlcy0yMDE5LTA1LTAx
Ogpjb3JlOiByZXN0b3JlIGRybSBtbWFwX3JhbmdlIHNpemUgYmFjayB0byAxVEIgKFBoaWxpcCkK
c3BoaW54OiBzcXVhc2ggd2FybmluZyAoU2VhbikKCkNjOiBQaGlsaXAgWWFuZyA8UGhpbGlwLllh
bmdAYW1kLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgoKQ2hlZXJz
LCBTZWFuCgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAxZGU3MjU5Mjc1Y2E0
ZWJjNjY0NTlkZTY2MjA1NThkM2UzOGQ0MTQyOgoKICBkcm0vZmItaGVscGVyOiBGaXggZHJtX2Zi
X2hlbHBlcl9maXJtd2FyZV9jb25maWcoKSBOVUxMIHBvaW50ZXIgZGVyZWYgKDIwMTktMDQtMjQg
MTU6NTc6NDMgKzAyMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
CiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIHRhZ3MvZHJtLW1p
c2MtbmV4dC1maXhlcy0yMDE5LTA1LTAxCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8g
NzYxZTQ3M2Y2YjIzZjIwNjg2MmQ5MDRhMWE1ZmNiYzAxMjY1NmI0NzoKCiAgZHJtL2dlbTogRml4
IHNwaGlueCB3YXJuaW5ncyAoMjAxOS0wNC0yNSAxMDowMjoxMCAtMDQwMCkKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KY29y
ZTogcmVzdG9yZSBkcm0gbW1hcF9yYW5nZSBzaXplIGJhY2sgdG8gMVRCIChQaGlsaXApCnNwaGlu
eDogc3F1YXNoIHdhcm5pbmcgKFNlYW4pCgpDYzogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFt
ZC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGhp
bGlwIFlhbmcgKDEpOgogICAgICBkcm06IGluY3JlYXNlIGRybSBtbWFwX3JhbmdlIHNpemUgdG8g
MVRCCgpTZWFuIFBhdWwgKDEpOgogICAgICBkcm0vZ2VtOiBGaXggc3BoaW54IHdhcm5pbmdzCgog
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAgICAgfCAxMCArKysrKy0tLS0tCiBpbmNsdWRlL2Ry
bS9kcm1fdm1hX21hbmFnZXIuaCB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
