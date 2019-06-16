Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05903474AC
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 15:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2920D890D2;
	Sun, 16 Jun 2019 13:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A50890D2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 13:25:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z23so6402826wma.4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 06:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iZNQrMv8b9GbuhClzn2Y2vK16NESCbaSLxGK4Sz972c=;
 b=epDIlSzgkPkQjl+VCMu3Pvgqk/sTWFDaaVggdpg2TmQ1+/BtwitPfcrwp0PaA1ZvZd
 bhD9wTXwonfQjZ7hULjzWxtFqThZh/vzDRaZ9aSGOL5CU+3F9/u5rR7dPjt0i6xn+j9o
 SlnJms/oc4xC8H/JT8SvmU2D5vG0OsU3KYqjtU4kn/kkjJe+IrehbxWCSuA4vmLumZVg
 jC/evgrabhwfD3lqopfN6qqBYSi4obbrpWSL9JGL0lPtnv8auczCFqfsrGAEbtxdPL5N
 3AgHaVW761BxQAUgoPAWzyHNWT4WEZj2QfljPAA0DHkNGwThughK7SnYEyAsm3/uVaaA
 J6VA==
X-Gm-Message-State: APjAAAXjzJ3/KKVtVPNsxKFGw7/wSthXM76qxPi+J8/QcERjsjQ/p9Lv
 M1fzpwiLPp+ATCNrZwtKrn/mjahq
X-Google-Smtp-Source: APXvYqxyLxWdl6cZjvnpl0LWhHlbto/JqYAOx3dqyiB806Q0yDKbQ8ghzrFlz6l1cMYw/eIX21lELw==
X-Received: by 2002:a1c:f515:: with SMTP id t21mr16017504wmh.39.1560691550493; 
 Sun, 16 Jun 2019 06:25:50 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id g2sm9332424wmh.0.2019.06.16.06.25.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 06:25:49 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 2/4] *symbols-check: use normal shell over bash
Date: Sun, 16 Jun 2019 14:23:41 +0100
Message-Id: <20190616132343.26370-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190616132343.26370-1-emil.l.velikov@gmail.com>
References: <20190616132343.26370-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iZNQrMv8b9GbuhClzn2Y2vK16NESCbaSLxGK4Sz972c=;
 b=uV7kBIse5Y/jKYnyxF+l2KBh0jIFCO5SVjmN77vsO7LoJ1fZcWp82jh1O4vJqTsOw8
 la7sfRPACkniQESKWLR/Van2YaHmZuGcZ0Z3L96DuIbd8lSiyOuiiMHvqMgjCfEAom5U
 +vUJXV6MinnJbROhSIRv0qO0S/wynJmmjO/8zIgB8nY/Bq4mDJITjJYW6GqTe87vp6cu
 vUNqkugs0igUSnPmO/0cJoIYSpwClzYZv0QfuGDmrJCH4AtXT+t2y63u7FLQpspzSuHi
 AU8Ji1jqSfXKnLwVlWR/EOdaexBniy+GFNgFXXl4zo2qf31/32qn/ty/5SqgTPzBmjWZ
 Ta4A==
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
Cc: Niclas Zeising <zeising@daemonic.se>,
 Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm9uZSBvZiB0aGUgdGVzdHMgYXJlIGJhc2ggc3BlY2lmaWMuIFRlc3RlZCB3aXRoIGJhc2gsIHpz
aCwgZGFzaCwgbWtzaAphbmQga3NoLgoKU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWls
LmwudmVsaWtvdkBnbWFpbC5jb20+Ci0tLQogYW1kZ3B1L2FtZGdwdS1zeW1ib2wtY2hlY2sgICAg
ICAgfCAyICstCiBldG5hdml2L2V0bmF2aXYtc3ltYm9sLWNoZWNrICAgICB8IDIgKy0KIGV4eW5v
cy9leHlub3Mtc3ltYm9sLWNoZWNrICAgICAgIHwgMiArLQogZnJlZWRyZW5vL2ZyZWVkcmVuby1z
eW1ib2wtY2hlY2sgfCAyICstCiBpbnRlbC9pbnRlbC1zeW1ib2wtY2hlY2sgICAgICAgICB8IDIg
Ky0KIGxpYmttcy9rbXMtc3ltYm9sLWNoZWNrICAgICAgICAgIHwgMiArLQogbm91dmVhdS9ub3V2
ZWF1LXN5bWJvbC1jaGVjayAgICAgfCAyICstCiBvbWFwL29tYXAtc3ltYm9sLWNoZWNrICAgICAg
ICAgICB8IDIgKy0KIHJhZGVvbi9yYWRlb24tc3ltYm9sLWNoZWNrICAgICAgIHwgMiArLQogdGVn
cmEvdGVncmEtc3ltYm9sLWNoZWNrICAgICAgICAgfCAyICstCiAxMCBmaWxlcyBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hbWRncHUvYW1k
Z3B1LXN5bWJvbC1jaGVjayBiL2FtZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNrCmluZGV4IDVjZTE1
ZjQ2Li5lYTgzODUwZCAxMDA3NTUKLS0tIGEvYW1kZ3B1L2FtZGdwdS1zeW1ib2wtY2hlY2sKKysr
IGIvYW1kZ3B1L2FtZGdwdS1zeW1ib2wtY2hlY2sKQEAgLTEsNCArMSw0IEBACi0jIS9iaW4vYmFz
aAorIyEvYmluL3NoCiAKIHNldCAtdQogCmRpZmYgLS1naXQgYS9ldG5hdml2L2V0bmF2aXYtc3lt
Ym9sLWNoZWNrIGIvZXRuYXZpdi9ldG5hdml2LXN5bWJvbC1jaGVjawppbmRleCAxODkxMDY4OC4u
ZWY0ZTY2ZjQgMTAwNzU1Ci0tLSBhL2V0bmF2aXYvZXRuYXZpdi1zeW1ib2wtY2hlY2sKKysrIGIv
ZXRuYXZpdi9ldG5hdml2LXN5bWJvbC1jaGVjawpAQCAtMSw0ICsxLDQgQEAKLSMhL2Jpbi9iYXNo
CisjIS9iaW4vc2gKIAogc2V0IC11CiAKZGlmZiAtLWdpdCBhL2V4eW5vcy9leHlub3Mtc3ltYm9s
LWNoZWNrIGIvZXh5bm9zL2V4eW5vcy1zeW1ib2wtY2hlY2sKaW5kZXggNDlkNjExZTYuLmQyYzM2
MmUxIDEwMDc1NQotLS0gYS9leHlub3MvZXh5bm9zLXN5bWJvbC1jaGVjaworKysgYi9leHlub3Mv
ZXh5bm9zLXN5bWJvbC1jaGVjawpAQCAtMSw0ICsxLDQgQEAKLSMhL2Jpbi9iYXNoCisjIS9iaW4v
c2gKIAogc2V0IC11CiAKZGlmZiAtLWdpdCBhL2ZyZWVkcmVuby9mcmVlZHJlbm8tc3ltYm9sLWNo
ZWNrIGIvZnJlZWRyZW5vL2ZyZWVkcmVuby1zeW1ib2wtY2hlY2sKaW5kZXggOTc4MDI2YzAuLjk4
N2UzOGZhIDEwMDc1NQotLS0gYS9mcmVlZHJlbm8vZnJlZWRyZW5vLXN5bWJvbC1jaGVjaworKysg
Yi9mcmVlZHJlbm8vZnJlZWRyZW5vLXN5bWJvbC1jaGVjawpAQCAtMSw0ICsxLDQgQEAKLSMhL2Jp
bi9iYXNoCisjIS9iaW4vc2gKIAogc2V0IC11CiAKZGlmZiAtLWdpdCBhL2ludGVsL2ludGVsLXN5
bWJvbC1jaGVjayBiL2ludGVsL2ludGVsLXN5bWJvbC1jaGVjawppbmRleCBkZTM3N2JlZi4uMmYz
NTUzMjEgMTAwNzU1Ci0tLSBhL2ludGVsL2ludGVsLXN5bWJvbC1jaGVjaworKysgYi9pbnRlbC9p
bnRlbC1zeW1ib2wtY2hlY2sKQEAgLTEsNCArMSw0IEBACi0jIS9iaW4vYmFzaAorIyEvYmluL3No
CiAKIHNldCAtdQogCmRpZmYgLS1naXQgYS9saWJrbXMva21zLXN5bWJvbC1jaGVjayBiL2xpYmtt
cy9rbXMtc3ltYm9sLWNoZWNrCmluZGV4IDMwZjQ0NGY3Li43ZDM0MjZmNiAxMDA3NTUKLS0tIGEv
bGlia21zL2ttcy1zeW1ib2wtY2hlY2sKKysrIGIvbGlia21zL2ttcy1zeW1ib2wtY2hlY2sKQEAg
LTEsNCArMSw0IEBACi0jIS9iaW4vYmFzaAorIyEvYmluL3NoCiAKIHNldCAtdQogCmRpZmYgLS1n
aXQgYS9ub3V2ZWF1L25vdXZlYXUtc3ltYm9sLWNoZWNrIGIvbm91dmVhdS9ub3V2ZWF1LXN5bWJv
bC1jaGVjawppbmRleCA2Mjk2MjQ0Yy4uMzY3MDNhM2UgMTAwNzU1Ci0tLSBhL25vdXZlYXUvbm91
dmVhdS1zeW1ib2wtY2hlY2sKKysrIGIvbm91dmVhdS9ub3V2ZWF1LXN5bWJvbC1jaGVjawpAQCAt
MSw0ICsxLDQgQEAKLSMhL2Jpbi9iYXNoCisjIS9iaW4vc2gKIAogc2V0IC11CiAKZGlmZiAtLWdp
dCBhL29tYXAvb21hcC1zeW1ib2wtY2hlY2sgYi9vbWFwL29tYXAtc3ltYm9sLWNoZWNrCmluZGV4
IDE2ZGEzYzQwLi4yMTUyMmJhMCAxMDA3NTUKLS0tIGEvb21hcC9vbWFwLXN5bWJvbC1jaGVjawor
KysgYi9vbWFwL29tYXAtc3ltYm9sLWNoZWNrCkBAIC0xLDQgKzEsNCBAQAotIyEvYmluL2Jhc2gK
KyMhL2Jpbi9zaAogCiBzZXQgLXUKIApkaWZmIC0tZ2l0IGEvcmFkZW9uL3JhZGVvbi1zeW1ib2wt
Y2hlY2sgYi9yYWRlb24vcmFkZW9uLXN5bWJvbC1jaGVjawppbmRleCBkYTYwNWJiOC4uN2I2OWY5
YTQgMTAwNzU1Ci0tLSBhL3JhZGVvbi9yYWRlb24tc3ltYm9sLWNoZWNrCisrKyBiL3JhZGVvbi9y
YWRlb24tc3ltYm9sLWNoZWNrCkBAIC0xLDQgKzEsNCBAQAotIyEvYmluL2Jhc2gKKyMhL2Jpbi9z
aAogCiBzZXQgLXUKIApkaWZmIC0tZ2l0IGEvdGVncmEvdGVncmEtc3ltYm9sLWNoZWNrIGIvdGVn
cmEvdGVncmEtc3ltYm9sLWNoZWNrCmluZGV4IDg1MzliOTViLi5hNzRkOTc0OSAxMDA3NTUKLS0t
IGEvdGVncmEvdGVncmEtc3ltYm9sLWNoZWNrCisrKyBiL3RlZ3JhL3RlZ3JhLXN5bWJvbC1jaGVj
awpAQCAtMSw0ICsxLDQgQEAKLSMhL2Jpbi9iYXNoCisjIS9iaW4vc2gKIAogc2V0IC11CiAKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
