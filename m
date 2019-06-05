Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1DC35EDA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3846289B18;
	Wed,  5 Jun 2019 14:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906CF89B18
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 14:13:35 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 131so10735741ljf.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 07:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=A2nBpjeVMgfCxtUF+VwEPKKGFA3WxS4KNvAYRoC/1cU=;
 b=UT/p7vUw2gNYrczBguny024aCZ8CBI4h6/HDWC4+Iy6lHP/voM56mLyNcxV1vilT1M
 Hyy/hyS8r/MgTX46GyLXsJF6I6SrnAjoDT4vJEjmGtOA5UqjrFkW3YoCKmQTkVF/pshy
 wg/ZskfEmGFCF/fxp/BBjQReEevjm/D7wA6Na68OtqjJHf87vPkRnAB80oR0kolKUbEk
 tFzW7/cxRmPXq1Z44VA5S/dopCTRvEJV7hDBv6vD9Ykduew78c91gyjTOXj/WBmAmHdL
 r1Woysts0GOYrvcCfqiTE4L4cClYRy8P2hM1e5GGuOLEmzV4IY1MxsaDazRpkE9xTBAe
 IyEA==
X-Gm-Message-State: APjAAAXt+83B9wesC4EqS2YOApR3DuhLHJHOYbf9f+FIPf6z4HA/FXCO
 thSgZw0k1nFzbO85dixz0Iq+b99hOO8=
X-Google-Smtp-Source: APXvYqyn/V3LJD7iEiNNMOh27/jAuEGfG+tBqt38vH5TK7iDHfm1MVpt570d/dmV5BCPKdyw+UNPzg==
X-Received: by 2002:a2e:83ca:: with SMTP id s10mr17774469ljh.163.1559744013596; 
 Wed, 05 Jun 2019 07:13:33 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 f30sm4261675lfa.48.2019.06.05.07.13.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 07:13:33 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/2] drm/r128: drop use of drmP.h
Date: Wed,  5 Jun 2019 16:13:19 +0200
Message-Id: <20190605141321.17819-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A2nBpjeVMgfCxtUF+VwEPKKGFA3WxS4KNvAYRoC/1cU=;
 b=PwvP3w/t+5p7d6WRhQY30xYBd/pkZhH25Y8F972R+oy0BdgOMCxhZ+O4h0tB5VtKst
 l4FiskL04wW12Gk3Id2ny5NFyNPNiQgBIXGzTRDr+TBqCtxQobhQbtVw6IHFOn1y+cN8
 yAUlQxeblV6FJqJ+nJjJHhVTHKJk2ZCo14igMxyn1swPt5/hmHQ+UNkyytF4EepFkUHR
 EhMgMvgfV/EyEi8yJ+ofOXYTn63smyByNxwW7OWX0B5JbOs6TSjsW6ybMKR+nV3plvo9
 oJ4NRi7TGzKMIiQ8qYIfenePVYxuYAwWJCVONMWOHay4jHUWEerh4czh3O20WQ2yOom4
 lH8w==
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgaGVhZGVyIGZpbGUgZHJtUC5oCmluIHRoZSByMTI4
IGRyaXZlci4KQWxzbyBkcm9wIGRlcGVuZGVuY2llcyB0byBkcm1fb3NfbGludXguaAoKCVNhbQoK
ClNhbSBSYXZuYm9yZyAoMik6CiAgICAgIGRybS9yMTI4OiBkcm9wIGRybV9vc19saW51eCBkZXBl
bmRlbmNpZXMKICAgICAgZHJtL3IxMjg6IGRyb3AgdXNlIG9mIGRybVAuaAoKIGRyaXZlcnMvZ3B1
L2RybS9yMTI4L3IxMjhfY2NlLmMgICB8IDI4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0K
IGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfZHJ2LmMgICB8ICA5ICsrKysrKy0tLQogZHJpdmVy
cy9ncHUvZHJtL3IxMjgvcjEyOF9kcnYuaCAgIHwgMTYgKysrKysrKysrKystLS0tLQogZHJpdmVy
cy9ncHUvZHJtL3IxMjgvcjEyOF9zdGF0ZS5jIHwgMjUgKysrKysrKysrKysrKysrKy0tLS0tLS0t
LQogNCBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
