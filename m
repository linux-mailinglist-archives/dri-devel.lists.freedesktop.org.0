Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E132E74C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 23:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2C46E0BB;
	Wed, 29 May 2019 21:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CFA6E111
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 21:18:35 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m14so2464296qka.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 14:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=5fNozO3bwwzX6wXm+puxeZDwgkkGojQ7a7fZzhpnV5Y=;
 b=UfNaYgww2SjzHGCG8PwuB5Zh01O7mTB5sjD8MSIA4fjH2xs/t5H/RWbwaLa8gx219a
 q133HVvzw1KRu2P15/UlxXSR43cFp4NKT0vd6zcizc9tinnT7iBQYGv3ADy8C/Vlnk0l
 oT/RZfGLCdqeM82xh7gEYfymnLmGFkH+4QL7P6sOWp7huoIhL4emt4JfNRARWTHkmztH
 AM64ustu0D3BqSDy7Tomngq9/vaxpylFGqZH2xuUaEWw2tIDS5TwW3xKyOhVlFOUHAfM
 2uXw2a1edFc5qPa6mlOBlHsU4KjKHn/Wv5/jTX3pxJD+uznAWBeyNB/SDQiLPPepR68c
 kFRg==
X-Gm-Message-State: APjAAAV2c/q7QzDy3tMy+uBkdrc4G2LBm1T/jyUhHLqLvciIgcgh3OGZ
 gLSmidoxuJ8qxk8heR6qDMAnmw==
X-Google-Smtp-Source: APXvYqwtfiAzESHby2OuVfBs15loPuuROecBbjF5kbk0UyyrJooGQptOSu/cdLt1Yerabpg0GoXAPA==
X-Received: by 2002:a05:620a:3:: with SMTP id j3mr77599698qki.95.1559164714180; 
 Wed, 29 May 2019 14:18:34 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id w143sm363919qka.22.2019.05.29.14.18.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 14:18:33 -0700 (PDT)
Date: Wed, 29 May 2019 17:18:33 -0400
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20190529211833.GA195708@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=5fNozO3bwwzX6wXm+puxeZDwgkkGojQ7a7fZzhpnV5Y=;
 b=K2N04qjY3JMxlYEUHC1v+e51c09smLZprV1GfOWb1lmhS9VRZdEaqZBTzPI5SH4d8r
 Fwsp5sNkChDD6HAOMnIDs1zMU5f6/ZxNC+EwAdnSfOJdI0iz5H3Qrs7UEyST4MXTquyh
 9dRquH25hNn2Jm8V3u78c6ZPPe1sliGKnzSc6wVtFOMF9KquLjEwX3pscUeKC+jO1qkj
 AFtu+Z/fPRABFu/kmQD28IuBBdBZJ0Oh9AalY06XBOK9bLprfH3l9+Xr5w9ElRDUhjcl
 G9vkxSO4fzTn/PK1pNzeVVhJQs8t2H5rgov1JtAppq/2kUCHkfxnn2lcWaH27bJzxkQA
 njCw==
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhLiosCk9uZSBsaW5lIHB1bGwtcmVxdWVzdCwgb25lLWxpbmUgc3VtbWFyeS4gUGxlYXNl
IHB1bGwgOikKCmRybS1taXNjLWZpeGVzLTIwMTktMDUtMjk6CnF4bDogRHJvcCBXQVJOIHdoZW4g
dS9zIHRyaWVzIHRvIG1tYXAgYSBwcmltZSBidWZmZXIgKEdlcmQpCgpDYzogR2VyZCBIb2ZmbWFu
biA8a3JheGVsQHJlZGhhdC5jb20+CgpDaGVlcnMsIFNlYW4KCgpUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IGYzNjE3YjQ0OWQwYmNmM2I1ZDgwYTk3ZjUxNDk4ZGNmNzQ2M2NmN2U6
CgogIGRybS9wYW5mcm9zdDogU2VsZWN0IGRldmZyZXEgKDIwMTktMDUtMjIgMTM6MDU6MTMgLTA1
MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5v
bmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIHRhZ3MvZHJtLW1pc2MtZml4ZXMtMjAx
OS0wNS0yOQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDk1Yjc0Y2U4ODk0Mzc0N2Zm
ZjBhM2E4YTZmMDRlZWNiZTdiMWMzY2U6CgogIGRybS9xeGw6IGRyb3AgV0FSTl9PTkNFKCkgKDIw
MTktMDUtMjcgMTM6MTc6MDMgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnF4bDogRHJvcCBXQVJOIHdoZW4gdS9z
IHRyaWVzIHRvIG1tYXAgYSBwcmltZSBidWZmZXIgKEdlcmQpCgpDYzogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkdlcmQgSG9mZm1hbm4gKDEpOgogICAgICBkcm0v
cXhsOiBkcm9wIFdBUk5fT05DRSgpCgogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfcHJpbWUuYyB8
IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCi0tIApTZWFuIFBhdWwsIFNvZnR3
YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
