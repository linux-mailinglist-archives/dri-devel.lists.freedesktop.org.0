Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE34C4ABAC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 22:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27366E239;
	Tue, 18 Jun 2019 20:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C796E239
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 20:24:34 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s15so17055839qtk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MOjw9BHWo3T0l7S3HTHH3vMaG0gZSQ2JDUl5dsuqsG8=;
 b=ZI7qMDM0bDs47dNNyz3aIjyZ5o/4ZGLwZTFxOZbEqQmXC9Z6Wji9n/81yF1eFn/bwh
 cBgLhNWaVejyjoAYiXnKGKxPlxRNN/rBorGRLydBp2CU5UPTV9jVZnkNui2N5Rx3nW2b
 U/6WzDmqx70e2JTdu3gnE8xfKKYgfAnl/KemCdcHEH4iSO10D2Y+J1DXVrNVNaeEMBrA
 bLRHUCyh1M7RIuZ2o+PuhAK70LD9uj8ZWZIt46BKFBnp7v8vHiCvyz+GY/AqFAOyXvfa
 7tYr6i+ZyMIHObumRH7KDZTGBQUIty5ifZoPzB2tUEGrqyKnVApO2wkSv4lvxjBZ+DA3
 QEPQ==
X-Gm-Message-State: APjAAAXnMxTi2aEcF3W/AwY6rTysBw4iD9iuAN4a+WDKKInaduG3DpYM
 CP+CZnrwEu4yhKgGRWtUCVFVpiUyQtI=
X-Google-Smtp-Source: APXvYqydfwJ5cnp6fT1knf4RuCLh1+NLiNl0Xink+Hs1XytUjAPJARWNPVAhqmBKCLyWY67k3z6LRg==
X-Received: by 2002:a0c:a182:: with SMTP id e2mr28217546qva.15.1560889473369; 
 Tue, 18 Jun 2019 13:24:33 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id o71sm8516554qke.18.2019.06.18.13.24.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 13:24:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/msm: mdp5+dpu interconnect support
Date: Tue, 18 Jun 2019 13:24:08 -0700
Message-Id: <20190618202425.15259-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MOjw9BHWo3T0l7S3HTHH3vMaG0gZSQ2JDUl5dsuqsG8=;
 b=dhgqGKJRQYeZ5wNr0CU80k43oKxmMrcbwu87Xx/12miDILLgt9ZCqpaaOkteCPM2U+
 l7kj/4GPfvgF3O+gOwNnBaSuzdAFZafzhTRXkw6zWyEB42jgGcTWXSa2peqsn7xalZEB
 eI5R6cGeCpe3kxGJP74JoWeKbwnYhfTHIjte4lf/jIyoWckJuLp+Fvg/3GA3Kk/lP4m7
 C9HTU09CPakaTTFYp4YoBKr+SECrp9oV/vBugwVaQtTeQw1vXTcYXZxmEcaQTEgBWj+9
 5N8q6QPeq9zudjkVo8WjnwzWGeEuegBE+0qlyI3NTDAigfAn79nl5hlGwl0nbuD40t+l
 eTJA==
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
 Sean Paul <seanpaul@chromium.org>, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKTW9zdCBvZiB0aGlzIGlz
IGEgcmVzZW5kIG9mIHRoaW5ncyB0aGF0IGhhdmUgYWxyZWFkeSBiZWVuIHBvc3RlZCB0bwpsaXN0
LiAgSSd2ZSByZWJhc2VkIHRoZSBEUFUgcGF0Y2hlcywgd2hpY2ggd2FzIHNvbWV3aGF0IGNvbmZs
aWN0eSBkdWUgdG8Kb3RoZXIgY2hhbmdlcyBhbmQgcmVmYWN0b3JpbmcgaW4gdGhlIERQVSBjb2Rl
LgoKQWJoaW5hdiBLdW1hciAoMSk6CiAgZHJtL21zbS9kcHU6IGFkZCBpY2Mgdm90aW5nIGluIGRw
dV9tZHNzX2luaXQKCkdlb3JnaSBEamFrb3YgKDEpOgogIGRybS9tc20vbWRwNTogVXNlIHRoZSBp
bnRlcmNvbm5lY3QgQVBJCgpKYXlhbnQgU2hla2hhciAoMyk6CiAgZHJtL21zbS9kcHU6IGNsZWFu
IHVwIHJlZmVyZW5jZXMgb2YgRFBVIGN1c3RvbSBidXMgc2NhbGluZwogIGRybS9tc20vZHB1OiBJ
bnRlZ3JhdGUgaW50ZXJjb25uZWN0IEFQSSBpbiBNRFNTCiAgZHQtYmluZGluZ3M6IG1zbS9kaXNw
OiBJbnRyb2R1Y2UgaW50ZXJjb25uZWN0IGJpbmRpbmdzIGZvciBNRFNTIG9uCiAgICBTRE04NDUK
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kcHUudHh0ICAgfCAgMTAgKwog
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVyZi5jIHwgMTc0ICsrKysr
KystLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVy
Zi5oIHwgICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jICAg
ICAgfCAgMTEgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9tZHNzLmMgICAg
ICB8ICA1NyArKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV90cmFjZS5o
ICAgICB8ICAyMiArLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMg
ICAgICB8ICAxNCArKwogNyBmaWxlcyBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9ucygrKSwgMTM0IGRl
bGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
