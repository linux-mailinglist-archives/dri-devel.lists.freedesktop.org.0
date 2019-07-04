Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3545EFF7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 02:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC32C6E21E;
	Thu,  4 Jul 2019 00:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E75989701
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 00:13:05 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id v22so4297937qkj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 17:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=ZA3jOmSVe/mZni+P7qZSqsVBbQCslJjxxwdMhbX3Kv8=;
 b=NLyabg03MCYi7CDIWxX8bZfTf2Vxg82vxdkeSBlasCFGf99lgbPpqm++LTWn7rARfc
 t8ihLVK5auDlnmYhEPtlt8ObHUzHL9ei9msZzsqHaZ3uSWNEnQ8NbvSfb3x2B9hZiJ/Y
 05LyGq4CJot+GmbsVlarezPKHh7zS/DfScwlNJ+nwn6AGNvf3l2Q9oRyNsONgVYT5fZk
 qcFBNTCyy1S9ZjXiyqXXIKz0GmoX6YLeBjnT6cofZc5oglyntjvqMTR4JU11EKl7cjEj
 E/p1QyLBLW8HOC4Y7hQoCThMPe2xt5SrBeVqCo7zXthgDVJckvsY6l9qNfT1J98l+iO7
 bc+w==
X-Gm-Message-State: APjAAAXTAfpTvdq5+EvutWgLfGP01lZnpIU+28BqNbT7NR4iWz2Oggfx
 x+aEaFQVLsZmJazqjJsgN1XXMA==
X-Google-Smtp-Source: APXvYqxL7PFzJHCq75zyCiN4F09VcpA/WIRZLQOLRQz9ZNM57XzEqSFAnPzFQF7nCaQX8MXhiw0+Pg==
X-Received: by 2002:a05:620a:4dc:: with SMTP id
 28mr33597909qks.354.1562199184731; 
 Wed, 03 Jul 2019 17:13:04 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s7sm452875qtq.8.2019.07.03.17.13.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 17:13:03 -0700 (PDT)
Date: Wed, 3 Jul 2019 20:13:02 -0400
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20190704001302.GA260390@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=ZA3jOmSVe/mZni+P7qZSqsVBbQCslJjxxwdMhbX3Kv8=;
 b=dwXljzD9mv1TyjGcgJprDbko6ab0xqFAiOt60bCRu/JiGa0xejwyiEoz65oWsQPbTY
 uSk4vZ9uZqnzPHa2H9H4wSM3kVp5zRgSib0/rY4A62avsAw/3KH3aXjQbijTFmrw3YyQ
 B9JVBiSErrl+0JacKSJhCh22PzXSGblk/cbG0VUk90y0CqoaHheHNcIw6kqAMjRC/s7M
 RRnf6tgeEagtojKQjk7bniXWXkZzFyG2MQJdvM+pPCwj1DxCoFwjuuAKGNJkAGxx/ZEF
 ie0fWvBgazR5w42OqS7G5IJ5evKv2P5scQFQio56GoivOwBjHPQe2tugOe7gziJvusHy
 4dGg==
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
Cc: dim-tools@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpeWEsCkxvb2tzIGxpa2UgdGhlIGxhc3QgLWZpeGVzIHB1bGwgZm9yIHRoaXMgY3ljbGUuIE9u
ZSBwYXRjaCB0byBmaXggYSBwb3NzaWJsZQpkb3VibGUtZnJlZS4KCgpkcm0tbWlzYy1maXhlcy0y
MDE5LTA3LTAzOgpwYW5mcm9zdC0gQXZvaWQgZG91YmxlIGZyZWUgYnkgZGVsZXRpbmcgR0VNIGhh
bmRsZSBpbiBjcmVhdGVfYm8gZmFpbHVyZQogICAgICAgICAgcGF0aCAoQm9yaXMpCgpDYzogQm9y
aXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KCkNoZWVycywgU2Vh
bgoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNDFkZTRiZTZmNmVmYTQxMzJi
MjlhZjUxMTU4Y2Q2NzJkOTNmMjU0MzoKCiAgZHJtL3ZpcnRpbzogbW92ZSBkcm1fY29ubmVjdG9y
X3VwZGF0ZV9lZGlkX3Byb3BlcnR5KCkgY2FsbCAoMjAxOS0wNi0yNiAxMTowNTowNSArMDIwMCkK
CmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9hbm9uZ2l0
LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgdGFncy9kcm0tbWlzYy1maXhlcy0yMDE5LTA3
LTAzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMmYwNDBkMjcwODBkZGZmZmVjZmYy
YmUxYTc3MTA3YzQ5NGQwZTRmNDoKCiAgZHJtL3BhbmZyb3N0OiBGaXggYSBkb3VibGUtZnJlZSBl
cnJvciAoMjAxOS0wNi0yOCAxNjo0NTo1MSAtMDYwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KcGFuZnJvc3QtIEF2b2lk
IGRvdWJsZSBmcmVlIGJ5IGRlbGV0aW5nIEdFTSBoYW5kbGUgaW4gY3JlYXRlX2JvIGZhaWx1cmUK
ICAgICAgICAgIHBhdGggKEJvcmlzKQoKQ2M6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemls
bG9uQGNvbGxhYm9yYS5jb20+CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkJvcmlzIEJyZXppbGxvbiAoMSk6CiAgICAgIGRy
bS9wYW5mcm9zdDogRml4IGEgZG91YmxlLWZyZWUgZXJyb3IKCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29n
bGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
