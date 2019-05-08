Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 682531812D
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 22:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE93898F5;
	Wed,  8 May 2019 20:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB848990D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 20:42:21 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j6so67699qtq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 13:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uG+TEtfOSsy4+ujMXHtSOZwgjjNzW4a2h3NrTWtmpcw=;
 b=DS3PFAaj83dkfMcHDdoWy8xAEZVo2N44nEVPYW2BGKpF63WCpesHmpQWEikSly4bb7
 PwQI2x3tM8LPn1Ti24zGywP1UvwjmHqv57DpYt7TfALu0rkC+XMnBkhQqjTHphQXUr02
 avDOwXESk37XRH1dYvp2V6+nkhO71d0o7V/x1irV63kgnud6ZeS/MRRBvWE6QpMBUBl/
 ZL+NDV2sg2lYED3Yg0SvN51hlBpg2GCZvS4UCYiKtAScbormVWllIvoa03c6758qoCua
 isq0Yk/phMnjAN1HdYXryux/pTN7XmQJg9FsLdwKbP/hhiLsZpaqfWm6pqUmyBuBwu1D
 lP4Q==
X-Gm-Message-State: APjAAAXQyjP6QXea3g8Y6DYZCKx9PAEzf6HiO6BYYcWrvAcINe7a/Sdz
 EiyvMVc2F6CGwgdrTGaBETbkxBpwrN4=
X-Google-Smtp-Source: APXvYqwI+31y8roRNFcBjGKiVx2lICKNrZDeBTagRFVi4C/gl/a8y/pa3+kipK4OkgDikGKLbjOf8w==
X-Received: by 2002:aed:350e:: with SMTP id a14mr21436qte.349.1557348140357;
 Wed, 08 May 2019 13:42:20 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
 by smtp.gmail.com with ESMTPSA id m31sm11466292qtm.46.2019.05.08.13.42.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 13:42:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/msm: mdp5+dpu interconnect support
Date: Wed,  8 May 2019 13:42:10 -0700
Message-Id: <20190508204219.31687-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uG+TEtfOSsy4+ujMXHtSOZwgjjNzW4a2h3NrTWtmpcw=;
 b=AXBsK8KxxKuG4nXxBzBCv9TCjcJhbEm/UrhQ59XJMW4dFH4rd9DnOTQJbodHYbOii4
 bWWs09uZAwG7n0ozj+hmT/+RM2azr0pMLhGd6iATsR54860dF60a7bgs0QoHsG6x84VO
 HGqR2KVnyOkTtzpviehKiWbMEUDqxSRfBavIhvkn6boI2Fxbk6p0D3U8OqL0f74AwoJW
 8ssXp0qZ5S76rr7U4mNRhoxLapOJIBYbstf/1ovSI6v7OHdxZPiTmLP1GIM2WDk00Tbd
 H7vFzATAeH9vqnogV1EzPdYXOxVF96nLbn12dRYGEJkbfgviagZ5DzVe2fVtNwu9prON
 TXxw==
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
Cc: Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKTW9zdCBvZiB0aGlzIGlz
IGEgcmVzZW5kIG9mIHRoaW5ncyB0aGF0IGhhdmUgYWxyZWFkeSBiZWVuIHBvc3RlZCB0bwpsaXN0
LiAgSSd2ZSByZWJhc2VkIHRoZSBEUFUgcGF0Y2hlcywgd2hpY2ggd2FzIHNvbWV3aGF0IGNvbmZs
aWN0eSBkdWUgdG8Kb3RoZXIgY2hhbmdlcyBhbmQgcmVmYWN0b3JpbmcgaW4gdGhlIERQVSBjb2Rl
LgoKUHJvYmFibHkgd291bGRuJ3QgaHVydCBmb3Igc29tZW9uZSB0byBsb29rIG92ZXIgbXkgcmVi
YXNlcyBvZiB0aGUgZmlyc3QKdHdvIHBhdGNoZXMgaW4gcGFydGljdWxhci4gIEJ1dCBJIGRvbid0
IHRoaW5rIEkgbWlzc2VkIGFueXRoaW5nLCBhbmQKdGhleSBnZXQgZGlzcGxheSBiYWNrIHRvIHdv
cmtpbmcgd2l0aG91dCB1bmRlcmZsb3cuCgpJIGFwb2xvZ2l6ZSBpZiBJIG1pc3NlZCBhbnkgci1i
L2EtYiB0YWdzLCBwYXRjaHdvcmsgZGlkbid0IHNlZW0gdG8gcGljawp0aGVtIHVwIGZvciBzb21l
IHJlYXNvbi4gIEkgbG9va2VkIHRocnUgZWFybGllciB2ZXJzaW9ucyBvZiB0aGUgRFBVCnBhdGNo
ZXMsIGJ1dCBJIG1pZ2h0IGhhdmUgbWlzc2VkIHRhZ3MuCgpBYmhpbmF2IEt1bWFyICgxKToKICBk
cm0vbXNtL2RwdTogYWRkIGljYyB2b3RpbmcgaW4gZHB1X21kc3NfaW5pdAoKR2VvcmdpIERqYWtv
diAoMSk6CiAgZHJtL21zbS9tZHA1OiBVc2UgdGhlIGludGVyY29ubmVjdCBBUEkKCkpheWFudCBT
aGVraGFyICgzKToKICBkcm0vbXNtL2RwdTogY2xlYW4gdXAgcmVmZXJlbmNlcyBvZiBEUFUgY3Vz
dG9tIGJ1cyBzY2FsaW5nCiAgZHJtL21zbS9kcHU6IEludGVncmF0ZSBpbnRlcmNvbm5lY3QgQVBJ
IGluIE1EU1MKICBkdC1iaW5kaW5nczogbXNtL2Rpc3A6IEludHJvZHVjZSBpbnRlcmNvbm5lY3Qg
YmluZGluZ3MgZm9yIE1EU1Mgb24KICAgIFNETTg0NQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbXNtL2RwdS50eHQgICB8ICAxMCArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfY29yZV9wZXJmLmMgfCAxNzQgKysrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY29yZV9wZXJmLmggfCAgIDQgKy0KIGRyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMgICAgICB8ICAxMSArLQogZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X21kc3MuYyAgICAgIHwgIDU3ICsrKysrLQogZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3RyYWNlLmggICAgIHwgIDIyICstLQogZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyAgICAgIHwgIDE0ICsrCiA3IGZpbGVzIGNo
YW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCAxMzQgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
