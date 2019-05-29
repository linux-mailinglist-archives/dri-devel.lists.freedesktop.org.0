Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F8A2E2CA
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 19:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB646E092;
	Wed, 29 May 2019 17:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D06D89F75;
 Wed, 29 May 2019 17:03:56 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id s57so3488845qte.8;
 Wed, 29 May 2019 10:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x3dbZTTfRweYM8TIEInuYfhfCcGofjM7eI5b9kT/C3I=;
 b=flvu4YdvlURwEGa5bItyD5gW/nUHSerKRnP6uiI+S3ZaMvLplsVLuvnWMjbgbFH2t6
 L0SzD7+1fHnvJ09W1GNYkHKWK0K1dEbGdJLA+uG312RU/2S0cUF99XMYOUKxycsGLfRb
 0fz5Md01OUhV22DV3a+HkbtDqSrPvCa+pdKxPeq21c2sXM7cPsgZ8FLbLTk3mFE2C7yQ
 nU0nt0qc85e9DtP7NE5jV9fYP/JQqXPgMAQ9/swVwFO5PyMKSmrKs0eRDlcApo90IwTp
 aZS92xUJzgQA87OMXAS9VFvxkE8Wg2D6nioFIvDD6QAw4EAO4ipOU/I4bRLJDt9Iqeyq
 VyPw==
X-Gm-Message-State: APjAAAUUZ5EUFWzZDT3l77cA13BFVMU2mRKuwWXU6/kZh6UI5GQLRqSe
 lTrfeSihNBtfiPdCnznT7BApaFnf
X-Google-Smtp-Source: APXvYqx3RFvlTDxAlEihQcx2xYK6d8Z3lW2jSDCcKktWX3poUNf3CH5pCIUdV/713PE7S0Wk41Q7TA==
X-Received: by 2002:ac8:2a46:: with SMTP id l6mr56468175qtl.309.1559149435291; 
 Wed, 29 May 2019 10:03:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.72.228])
 by smtp.gmail.com with ESMTPSA id 19sm3846qtq.12.2019.05.29.10.03.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 29 May 2019 10:03:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.2
Date: Wed, 29 May 2019 12:03:47 -0500
Message-Id: <20190529170347.3272-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x3dbZTTfRweYM8TIEInuYfhfCcGofjM7eI5b9kT/C3I=;
 b=luRenXZezN45zPJt2p9HVtBH+Kcrh6sXPPpv+MVNLSWRgRSB1EJ+XN5+GWUtJKFNWA
 wqBVJMLJew6c12oeZeZSL9HQXtv8Bc54elUvemIrYF93DatLyATjPcp0UBb0rWTIRKnC
 MD8+kS9LPkXo34S+Np8iFhVKwBEkWqWzKSMVBaDWuIjwS7SCYZ5iV6c8mRpOOHw96CWA
 isOPr3h8uKwXyoc3IM2Kgj8LRlQqi8a6mxvHxWy6Z9axiojwX2v31VoZCvtDLlEsVzR4
 AdBdH3h++vESfU8ohdXqfhOECcRqM2gceWn+wuxUz/4NirA+BtxoqRy5X3UdBn15P1OP
 7W0A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuMjoKLSBSZXNwaW4gdGhlIFJhdmVuIERNQ1Ug
cGF0Y2ggd2l0aCB0aGUgaWZkZWYgZml4ZWQKLSBGaXggZm9yIGEgY2xlYW4gZGlzcGxheSB3aGVu
IGxvYWRpbmcgdGhlIGRyaXZlciBvbiBSYXZlbgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNl
IGNvbW1pdCBjMDc0OTg5MTcxODAxMTcxYWY2YzVmNTNkZDE2YjI3ZjM2YjMxZGViOgoKICBSZXZl
cnQgImRybS9hbWQvZGlzcGxheTogRG9uJ3QgbG9hZCBETUNVIGZvciBSYXZlbiAxIiAoMjAxOS0w
NS0yNCAxOTo1Njo1MCArMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0OgoKICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCBkcm0tZml4
ZXMtNS4yCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMDIxMjI3NTNmMWQwYWMzOWQ4
Yzg5ZjIwZjU0MWE1MTlhMzAwMmU5MjoKCiAgZHJtL2FtZGdwdTogcmVzZXJ2ZSBzdG9sbGVuIHZy
YW0gZm9yIHJhdmVuIHNlcmllcyAoMjAxOS0wNS0yOSAwOTo1MjoxMCAtMDUwMCkKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
RmxvcmEgQ3VpICgxKToKICAgICAgZHJtL2FtZGdwdTogcmVzZXJ2ZSBzdG9sbGVuIHZyYW0gZm9y
IHJhdmVuIHNlcmllcwoKSGFycnkgV2VudGxhbmQgKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6
IERvbid0IGxvYWQgRE1DVSBmb3IgUmF2ZW4gMSAodjIpCgogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYyAgICAgICAgICAgICB8ICAzICstLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDEyICsrKysrKysrKystLQogMiBmaWxl
cyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
