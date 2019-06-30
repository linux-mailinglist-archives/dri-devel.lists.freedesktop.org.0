Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598C05AFD5
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 15:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF5189BE8;
	Sun, 30 Jun 2019 13:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E483F89BE8;
 Sun, 30 Jun 2019 13:14:58 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id l128so8923137qke.2;
 Sun, 30 Jun 2019 06:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nc5W7+AXQXpGcLL+N74zfKeQQmgVMy5emCXGT/mdFok=;
 b=S7qekLP36ZTeFGi+/pJe3klfvHoMY+xmeG5KByHy4DRRC12EUc3C/lw0G+HeqksspM
 Z1EzJhttqV7/HccQFKWpidJT6Xd+jt5+1rDwxFpvaUeOQZTUuSkDtPzQKHiNWx950WJA
 adXcjcK8kTUtcZQYdbx3V7lmZjtWIrvO0izZYBAmbLcTGYf/Irc9AooCFG26tZfhud3y
 10fSidXY0thgAa9QxwSreegauHezZicdxg6C57dFQx7zrO8+qm2aUsZsw/5Z8xOPG471
 4PrUlsdWSDcUCtTWzJnQ87aAGzs9aUetOl02GuAXHFtYP3SCvu1f+Wx4MBkdTnlzOTDl
 EUcg==
X-Gm-Message-State: APjAAAVnNnAOwOsP8CtZqY/+cctucYtS77Cp+7QAVcN7KYxDwrhpGv9L
 X1a/DR5wvlSi9gjAZ51Erf3YwSRJjgU=
X-Google-Smtp-Source: APXvYqyWLADI9zCODKytyFhhWC20izReqX526BI+yel5BcdlsW8jp45pwiETLtEsIuiDjBjgs17wAQ==
X-Received: by 2002:a37:a854:: with SMTP id r81mr16453214qke.53.1561900497832; 
 Sun, 30 Jun 2019 06:14:57 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id b5sm3405201qkk.45.2019.06.30.06.14.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 06:14:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: few small cleanups
Date: Sun, 30 Jun 2019 06:14:40 -0700
Message-Id: <20190630131445.25712-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nc5W7+AXQXpGcLL+N74zfKeQQmgVMy5emCXGT/mdFok=;
 b=C6cU4x2uPfVu/sKGnA0d31gUr4/SD0rfIkGWCTw7ejLqxsIuTjAO/sGHgDelc5kZYw
 iPYJJnqQr36x/POyezEwcZ79/RZRairBochzK9pz9V3KCw02LSutlBDzGje7IVDfXZs4
 O3lk+wevFqtWfil16atlL6VzADGLOJpoy/+C29dJl6ugfAkF6E8VejpQHdahMqpZEugz
 NoYelWjNnh7PAXWTbrkMpiyJXqno0FjkPjkWl6NwF0psObn2uSkNb26zJtv3pyvONYQu
 CvPSXNxYH6mirAzEdeVrMBpFcjtOkRDfV0kkppMCeJ5R9qKpG1aLW4c0CL4IDfscMBVD
 fGwg==
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKMiBhbmQgMyBhcmUgc29t
ZSBlYXJseSBwcmVwLXdvcmsgdG8gZGVhbCB3aXRoIGJvb3Rsb2FkZXIgZW5hYmxlZApkaXNwbGF5
cywgd2hlcmUgd2Ugd2FudCB0byBhdm9pZCBydW5wbSBnZXQvcHV0IGN5Y2xlcyB1bnRpbCB3ZSBr
bm93CnRoYXQgd2Ugd29uJ3QgLUVQUk9CRV9ERUZFUi4gIChPdGhlcndpc2UsIGl0IHdpbGwga2ls
bCB0aGUgZGlzcGxheSwKYW5kIGl0J3Mgbm90IHRlcnJpYmx5IG5pY2UgdG8ga2lsbCBlZmlmYiBh
bmQgbGVhdmUgdGhlIHVzZXIgd2l0aCBubwpnb29kIHdheSB0byBkZWJ1ZyB3aGF0IGRlcGVuZGVu
Y3kgdGhleSBhcmUgbWlzc2luZy4pCgpSb2IgQ2xhcmsgKDMpOgogIGRybS9tc206IGRvbid0IG9w
ZW4tY29kZSBnb3Zlcm5vciBuYW1lCiAgZHJtL21zbS9kcHU6IHJlbW92ZSBkcHVfbWRzczpod3Zl
cnNpb24KICBkcm0vbXNtL2RzaTogbWFrZSBzdXJlIHdlIGhhdmUgcGFuZWwgb3IgYnJpZGdlIGVh
cmxpZXIKCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jIHwgIDUgLS0t
LQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpLmggICAgICAgICAgICB8ICAyICstCiBkcml2
ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jICAgICAgIHwgMzAgKysrKysrKysrKysrLS0t
LS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jICAgIHwgIDkg
KysrLS0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMgICAgICAgICAgICB8ICAyICst
CiA1IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
