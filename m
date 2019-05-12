Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F31531ADCC
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 20:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7C889276;
	Sun, 12 May 2019 18:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85CA89276
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 18:41:42 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 13so5927055pfw.9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 11:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+4FJQrwxfW4iQ3D++ujgHoZ7fSNJSGSWELuM5mxXM0=;
 b=QrhNJdJKL1mH0bQAR86uTjx9s6htY+GolmDGAZ0iZnwCPMbqdnxocb06Cdjs+SQLMI
 2M9qO8SgqEQnE2vRo+TwQtSDjWP1QvdzvodGb5xPzS8+e8jnuakfwMdy+ptDqMJVQ1ll
 +vPoCkhfPY70nh9v930nnHk1EJQkRPkdmkqUgqTZSEddnXND3u6439/XVyT3JVhQl76m
 vTVohbq51v0V523cv379BKq21/qJh4nIuRK81SMd+kAmmQL0F47mw1zqEQFkwsiLAKMT
 s9Wr2gPihSiEFNKkG3CRkEtpmQxO01Sf8+ZwdoVr4dNATaoG4m+Pl8q4/Q2xBgYtbtLb
 /XlQ==
X-Gm-Message-State: APjAAAV11k0UXrPcmPwxIXnrFg8vWRkXYHqtxqzCN0F/LT6eyF3SNAoW
 DAhZbu30tMzxqEqYpD/Li9MztQ==
X-Google-Smtp-Source: APXvYqxEjNVOEFw39liUe55Z6S+XNfP2Rf4kINCXCoKeJYUK6ImMO8g8xjL8UwoLXVRCynFgk9TW7A==
X-Received: by 2002:a63:4346:: with SMTP id q67mr26842320pga.241.1557686502441; 
 Sun, 12 May 2019 11:41:42 -0700 (PDT)
Received: from localhost.localdomain ([115.97.185.144])
 by smtp.gmail.com with ESMTPSA id 37sm11041291pgn.21.2019.05.12.11.41.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 11:41:42 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v10 0/2] drm/sun4i: sun6i_mipi_dsi: Fixes/updates
Date: Mon, 13 May 2019 00:11:25 +0530
Message-Id: <20190512184128.13720-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+4FJQrwxfW4iQ3D++ujgHoZ7fSNJSGSWELuM5mxXM0=;
 b=OFAoMYrjTKSrSw68dDWRRAa8d060sQJaewjsrrmuYlw7o0UTzedLE5cjsvyGvG6/lj
 XFe19ijnnSaSUUsxtTUcmuztKzK4FrkBnPr61fwbecvFpT8FD+xEs/TTVE3mTrT4M214
 GmkpotVhxepcWmHthgsbOF67lJkSrkiHKb8rM=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB2MTAgZm9yIHRoZSBwcmV2aW91cyBzZXJpZXNbMV0gYW5kIGZldyBwYXRoZXMgYXJl
IGRyb3BwZWQKYXMgcGFydCBvZiB0aGlzIHNlcmllcyBzaW5jZSBpdCB3b3VsZCByZXF1aXJlIHNl
cGFyYXRlIHJld29yayBzYW1lCndpbGwgc2VuZCBpbiBzZXBhcmF0ZWx5IG9yIGFub3RoZXIgc2Vy
aWVzLgoKQ2hhbmdlcyBmb3IgdjEwOgotIHJlYmFzZWQgb24gbGludXgtbmV4dAotIGRyb3BwZWQg
ZmV3IHBhdGNoZXMKLSBhZGQgMTUwIG11bHRpcGxpY2F0aW9uIG9uIGhzeW5jX3BvcmNoCkNoYW5n
ZXMgZm9yIHY5OgotIHJlYmFzZSBvbiBkcm0tbWlzYwotIHVwZGF0ZSBjb21taXQgbWVzc2FnZXMK
LSBhZGQgaHN5bmNfcG9yY2ggb3ZlcmZsb3cgcGF0Y2gKQ2hhbmdlcyBmb3Igdjg6Ci0gcmViYXNl
IG9uIG1hc3RlcgotIHJld29yayBvbiBjb21taXQgbWVzc2FnZXMKLSByZXdvcmsgdmlkZW8gc3Rh
cnQgZGVsYXkKLSBpbmNsdWRlIGRycSBjaGFuZ2VzIGZyb20gcHJldmlvdXMgdmVyc2lvbgpDaGFu
Z2VzIGZvciB2NzoKLSByZWJhc2Ugb24gbWFzdGVyCi0gY29sbGVjdCBNZXJsaWpuIFdhamVyIFRl
c3RlZC1ieSBjcmVkaXRzLgpDaGFuZ2VzIGZvciB2NjoKLSBmaXhlZCBhbGwgYnVyc3QgbW9kZSBw
YXRjaGVzIGFzIHBlciBwcmV2aW91cyB2ZXJzaW9uIGNvbW1lbnRzCi0gcmViYXNlIG9uIG1hc3Rl
cgotIHVwZGF0ZSBwcm9wZXIgY29tbWl0IG1lc3NhZ2UKLSBkcm9wcGVkIHVubmVlZGVkIGNvbW1l
bnRzCi0gb3JkZXIgdGhlIHBhdGNoZXMgdGhhdCBtYWtlIHJldmlldyBlYXN5CkNoYW5nZXMgZm9y
IHY1LCB2NCwgdjMsIHYyOgotIHVzZSBleGlzdGluZyBkcml2ZXIgY29kZSBjb25zdHJ1Y3QgZm9y
IGhibGsgY29tcHV0YXRpb24KLSBjcmVhdGUgc2VwYXJhdGUgZnVuY3Rpb24gZm9yIHZibGsgY29t
cHV0YXRpb24gCi0gY2xlYW51cCBjb21taXQgbWVzc2FnZXMKLSB1cGRhdGUgcHJvcGVyIGNvbW1p
dCBtZXNzYWdlcwotIGZpeGVkIGNoZWNrcGF0Y2ggd2FybmluZ3MvZXJyb3JzCi0gdXNlIHByb3Bl
ciByZXR1cm4gdmFsdWUgZm9yIHRjb24wIHByb2JlCi0gYWRkIGxvZ2ljIHRvIGdldCB0Y29uMCBk
aXZpZGVyIHZhbHVlcwotIHNpbXBsaWZ5IHRpbWluZ3MgY29kZSB0byBzdXBwb3J0IGJ1cnN0IG1v
ZGUKLSBmaXggZHJxIGNvbXB1dGF0aW9uIHJldHVybiB2YWx1ZXMKLSByZWJhc2Ugb24gbWFzdGVy
CgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMDgzNzE2My8KCkFueSBp
bnB1dHM/CkphZ2FuLgoKSmFnYW4gVGVraSAoMik6CiAgZHJtL3N1bjRpOiBzdW42aV9taXBpX2Rz
aTogRml4IGhzeW5jX3BvcmNoIG92ZXJmbG93CiAgZHJtL3N1bjRpOiBzdW42aV9taXBpX2RzaTog
U3VwcG9ydCBEU0kgR0VORVJJQ19TSE9SVF9XUklURV8yIHRyYW5zZmVyCgogZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
