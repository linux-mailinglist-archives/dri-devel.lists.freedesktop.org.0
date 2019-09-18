Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A09B742C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0BE6F73B;
	Thu, 19 Sep 2019 07:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C8F6EED4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 11:05:56 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id u17so3849519pgi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 04:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=30kQKIRjGxbZH2nrKPWjM2nH2PE3zFDpBAbVHM44zes=;
 b=fiTGnFg1O9AwD5xt0xkQHVIKb0WnBh/EUnaZ1BBf3U2Zi1BDf8uFTrETt08imBQK1j
 DTkmjmaAtzJmzAeRdfE9OvoHh+v6yvBobhjmya2VVCW//jG1l+a1UcrWRVUcH7TKKD4F
 w9IQNUZkAIom5DM6fxtouXjagyRpGbnXI9iJ2NCtEjsGwxwVUxyX7anep/YF3zTbfbke
 pwwilXgfXOqwcnHNu+BbSL0K9ops1aM9ZT2KO5iDlsLE8cEiVdywtBwIw6oit5Zx09KG
 EHZMQXC6L0mNSKK3cx35EE8+TPYAgv8qexA3azrHI7jMkUb+5DbnxHHqTCvhKbL1LJdU
 x6tA==
X-Gm-Message-State: APjAAAUWGfg8/nfv219cBx/T5H5nprVBsFyWKQPFbPooOUg+JDs9xjXN
 ZxQB9Udi+7D54R9E761FL4SMSQ==
X-Google-Smtp-Source: APXvYqxvwEq7GgqxXcrrTzkO4wvLdmjk+3DH/4Ln4BikZpyOFogYSQ9s3A7KhZsmgUq+kV1vCwAyQg==
X-Received: by 2002:a63:9a11:: with SMTP id o17mr3335385pge.434.1568804756380; 
 Wed, 18 Sep 2019 04:05:56 -0700 (PDT)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
 by smtp.gmail.com with ESMTPSA id 8sm6695461pjt.14.2019.09.18.04.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 04:05:55 -0700 (PDT)
From: roman.stratiienko@globallogic.com
To: linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sun4i: Add missing pixel formats to the vi layer
Date: Wed, 18 Sep 2019 14:05:41 +0300
Message-Id: <20190918110541.38124-1-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=30kQKIRjGxbZH2nrKPWjM2nH2PE3zFDpBAbVHM44zes=;
 b=I4c5ggCxKN2zNntPxQ1I5QqVgDzZVa6XYoqPMTttSpuZBN0gfixeIStuTRzRZ6WY3X
 HfrPeeV1m9D33/ag0Z0LnvCdpfZyE6LJZ6wyjSTM2ZDIvm5I4RAWp65JG82Pip5qSctc
 OvhmV3Vad1ufLfnCOQ60M8Th5bwDxuUfm2I3FhWNW39zqFIYu3+HklpG+HBD2MRa93Fq
 oYbkGAvV6Tqb9xt4uQS59a1Vy5MAbVtZp0hJLl6mkz2Fe9qVcyfbYqt0n0tRnqQc+tjY
 gwAfhkvtxRkfp2Sntw+teo7GrHp0+Xxg2BJCiYdrEtzIhQfCIGnVpGWU7dKH0zPH2eDR
 W6Ew==
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
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gU3RyYXRpaWVua28gPHJvbWFuLnN0cmF0aWllbmtvQGdsb2JhbGxvZ2ljLmNv
bT4KCkFjY29yZGluZyB0byBBbGx3aW5uZXIgREUyLjAgU3BlY2lmaWNhdGlvbiBSRVYgMS4wLCB2
aSBsYXllciBzdXBwb3J0cyB0aGUKZm9sbG93aW5nIHBpeGVsIGZvcm1hdHM6ICBBQkdSXzg4ODgs
IEFSR0JfODg4OCwgQkdSQV84ODg4LCBSR0JBXzg4ODgKClNpZ25lZC1vZmYtYnk6IFJvbWFuIFN0
cmF0aWllbmtvIDxyb21hbi5zdHJhdGlpZW5rb0BnbG9iYWxsb2dpYy5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjhpX3ZpX2xheWVyLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
OGlfdmlfbGF5ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV92aV9sYXllci5jCmlu
ZGV4IGJkMGU2YTUyZDFkOC4uMDdjMjdlNmE0Yjc3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
OGlfdmlfbGF5ZXIuYwpAQCAtNDA0LDE3ICs0MDQsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fcGxhbmVfZnVuY3Mgc3VuOGlfdmlfbGF5ZXJfZnVuY3MgPSB7CiBzdGF0aWMgY29uc3QgdTMy
IHN1bjhpX3ZpX2xheWVyX2Zvcm1hdHNbXSA9IHsKIAlEUk1fRk9STUFUX0FCR1IxNTU1LAogCURS
TV9GT1JNQVRfQUJHUjQ0NDQsCisJRFJNX0ZPUk1BVF9BQkdSODg4OCwKIAlEUk1fRk9STUFUX0FS
R0IxNTU1LAogCURSTV9GT1JNQVRfQVJHQjQ0NDQsCisJRFJNX0ZPUk1BVF9BUkdCODg4OCwKIAlE
Uk1fRk9STUFUX0JHUjU2NSwKIAlEUk1fRk9STUFUX0JHUjg4OCwKIAlEUk1fRk9STUFUX0JHUkE1
NTUxLAogCURSTV9GT1JNQVRfQkdSQTQ0NDQsCisJRFJNX0ZPUk1BVF9CR1JBODg4OCwKIAlEUk1f
Rk9STUFUX0JHUlg4ODg4LAogCURSTV9GT1JNQVRfUkdCNTY1LAogCURSTV9GT1JNQVRfUkdCODg4
LAogCURSTV9GT1JNQVRfUkdCQTQ0NDQsCiAJRFJNX0ZPUk1BVF9SR0JBNTU1MSwKKwlEUk1fRk9S
TUFUX1JHQkE4ODg4LAogCURSTV9GT1JNQVRfUkdCWDg4ODgsCiAJRFJNX0ZPUk1BVF9YQkdSODg4
OCwKIAlEUk1fRk9STUFUX1hSR0I4ODg4LAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
