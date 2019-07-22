Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C50DB70752
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 19:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DC189CF5;
	Mon, 22 Jul 2019 17:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30F989C88
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 17:31:22 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id s41so12516018ybe.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lP0XjMlMRi5R0bJnEqH68yqud/6fz4WO8J0JiG4/9gk=;
 b=FYaWLCm2nd47Fql3vsq38jGf0UQLAs+HriCLztfPXMMRBTvO4GwbBicMb5PBB2lcdw
 1XOnAbQTwAb9Bs479m0z4ElSkIgs1qDNMl0slXvVElZr8ZW2PQ9kuuJgYHKinrgMG3mb
 Lte6Ep8pXLWyc2IOL+jBiL39BdPHLAu/dV/ulXsUIXqhiIy5Uw2jSMhWQs3rkA+JuKgQ
 8ARDQzyvSnAtvtTHqQQN7nFe4VU4BJv0QcnkDnxaNbEOszwe2y67hy50ytUNA4uL/ROF
 hafRCzvRV4UCzTDqEqHufZe/DU72bEza+U00hyvHF4JgEVGdLgNI8aK0zmKnr+Hfrphw
 sWSQ==
X-Gm-Message-State: APjAAAUvLgPpDHx2bHY0sguOqvDdOH/QifpXwgHdtj3VTaqj01al0jq7
 zouTNYC/5VNoloO/MPybQ13h8jP17R/iwg==
X-Google-Smtp-Source: APXvYqx6UmYf41BJcHpiV4NFeUgMYGRL/N81JL99BUb/HEd51bUvdrxIHLuh7CCJ6bn1Kf92tWqV8Q==
X-Received: by 2002:a5b:b41:: with SMTP id b1mr38359691ybr.277.1563816681829; 
 Mon, 22 Jul 2019 10:31:21 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k64sm9303004ywk.77.2019.07.22.10.31.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:31:21 -0700 (PDT)
Date: Mon, 22 Jul 2019 13:31:20 -0400
From: Sean Paul <sean@poorly.run>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm: use correct dev node location in comment
Message-ID: <20190722173120.GE104440@art_vandelay>
References: <20190722165648.7828-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722165648.7828-1-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lP0XjMlMRi5R0bJnEqH68yqud/6fz4WO8J0JiG4/9gk=;
 b=bkWz+7nAcP86FQahZgTgC65G6IkP5mjOZf4H8qPlEFJqqlaA1UmesZFmOB7dLfqvH3
 fB+ASP7OKcoc4sGwMNl+LdlqTnu+yrk3HLaVCXH1lGVDNvPs6V8c+JAvYF5/WouY1w2y
 056iZo5h37fFQgLHtEFSj97yUKEoepUcordtiP0Jr+J7JsyOfTOWSjFepndSLIC/1ZNZ
 2QqE6RAX545oi9BKc44fgT+rBMu04sS1CM1ieKQJtrKLiIXbskkxl0rYfXCWSAi6EIFT
 0GGxlQ8+2QlizHjisNUX+X2OQVSEXbW1RbQusFY8iJKH5J5BVIfYVDcmUeMVCxcydrTF
 so6A==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDU6NTY6NDhQTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4g
Cj4gQ3VycmVudCBjb21tZW50IG1lbnRpb25zIC9kZXYvZHJtIHdoaWNoIGhhc24ndCBiZWVuIGEg
dGhpbmcgZXZlbiBiZWZvcmUKPiB0aGUgY29kZSB3YXMgbWVyZ2VkIGludG8gdGhlIGtlcm5lbCA7
LSkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJv
cmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyB8IDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxl
LmMKPiBpbmRleCBlYTM0YmM5OTE4NTguLjUyNzRiNDBlYjVlMyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5j
Cj4gQEAgLTI4NSw3ICsyODUsNyBAQCBzdGF0aWMgaW50IGRybV9jcHVfdmFsaWQodm9pZCkKPiAg
fQo+ICAKPiAgLyoKPiAtICogQ2FsbGVkIHdoZW5ldmVyIGEgcHJvY2VzcyBvcGVucyAvZGV2L2Ry
bS4KPiArICogQ2FsbGVkIHdoZW5ldmVyIGEgcHJvY2VzcyBvcGVucyAvZGV2L2RyaS9bbnVtYmVy
XQoKV2VsbCwgL2Rldi9kcmkvW251bWJlcl0gYWxzbyBkb2Vzbid0IGV4aXN0LiBZb3UgY291bGQg
Y2hhbmdlIHRvOgoKKyAqIENhbGxlZCB3aGVuZXZlciBhIHByb2Nlc3Mgb3BlbnMgL2Rldi9kcmkv
KGNhcmR8cmVuZGVyKVtudW1iZXJdCgpvciBkb24ndCB0cnkgdG8gc3BlY2lmeSB0aGUgZXhhY3Qg
cGF0aCBhbmQgc2F5OgoKKyAqIENhbGxlZCB3aGVuZXZlciBhIHByb2Nlc3Mgb3BlbnMgYSBkcm0g
bm9kZQoKCkVpdGhlciB3YXksIAoKUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHku
cnVuPgoKCj4gICAqCj4gICAqIFxwYXJhbSBmaWxwIGZpbGUgcG9pbnRlci4KPiAgICogXHBhcmFt
IG1pbm9yIGFjcXVpcmVkIG1pbm9yLW9iamVjdC4KPiAtLSAKPiAyLjIxLjAKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApTZWFuIFBh
dWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
