Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB59321531E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E78F6E317;
	Mon,  6 Jul 2020 07:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EE589711
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:43 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g10so12384202wmc.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDNf3J71u1aUfcnNyg8gyy9KZOUzjLKhZpSmplNUzVU=;
 b=n7SAyMDoC8z9XGY9pGLfmg7j7xlUarueDRBmVPXx5wlzTW+NHKqXBu2H/pL+fr9uxB
 3bchYayv83a1Be2PrwfgB1qtqk1SvDPy5asdP3CDEVyPFFKDWEcAk9uQz1NVU2zEIHXW
 0o985UdlcDRlVZU7oON3XZpQMvJbk4S7h5C3cb1CQVhDvDyBxH19Qkvzt3079Gt/3q/2
 i+jhxpJjTPtex472NFmZIGlnoFj2ZX27DF/ea4TnLT1UA8xyW57TiO1CklA1tE33dTVI
 iEdEQFVgKkRVyAiOyd1I44rEsdBRPEBB4ApHVIZwc1V7uRlkUA00x7krm7zU4B/D2LvQ
 vZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDNf3J71u1aUfcnNyg8gyy9KZOUzjLKhZpSmplNUzVU=;
 b=P77NHMnnylRBkWxiX9rf5CP9RRH4BHPY1C8Q1w9IOefaxgH1qGMq/m6Fjj2HNidVeo
 3jL5wC1J8UyCU3NXNWWnbRMP1GnptayN5YGQ0Cehld/rx76E84LXEkwgYziEL/FpRWmx
 S9NQBMZOr1HtvzZJTrILg33mrlam2rpZrlZed3wZG7ohRlPmBfIDrhW4bfQK29tCUROR
 Ro6u/686HJuhcsiZlrllLlfOl5lnuBcrV+hApm4RmxzFCl3GlJ1q2U5G/F5qDAgjCfcy
 ROazjD1rIKYgd+G8Op2gGgrOpQ3tzWPxzjG06tST/eToMR5MnUZlgMc8AeOCDNEMfWOL
 f2rQ==
X-Gm-Message-State: AOAM53233l2OypwhcV3vbn5rA68Sk9YYXC1+i/xMn55SLTqGeS6yC4TG
 bxBYt6xGhDAMizq9sOtuG48=
X-Google-Smtp-Source: ABdhPJyzdD6tO+bRBuPcM+rAdj+oVuvZ4Y1HfXEtSxZXy/ZXO3TR+iENAw9yF6eoD42kE3wPnpRemg==
X-Received: by 2002:a1c:6006:: with SMTP id u6mr39776781wmb.111.1593858342397; 
 Sat, 04 Jul 2020 03:25:42 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:41 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 00/14] Add regulator devfreq support to Panfrost
Date: Sat,  4 Jul 2020 12:25:21 +0200
Message-Id: <20200704102535.189647-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGlzIHNlcmllIGNsZWFucyBhbmQgYWRkcyByZWd1bGF0b3Igc3VwcG9ydCB0byBQYW5m
cm9zdCBkZXZmcmVxLgpUaGlzIGlzIG1vc3RseSBiYXNlZCBvbiBjb21tZW50IGZvciB0aGUgZnJl
c2hseSBpbnRyb2R1Y2VkIGxpbWEKZGV2ZnJlcS4KCldlIG5lZWQgdG8gYWRkIHJlZ3VsYXRvciBz
dXBwb3J0IGJlY2F1c2Ugb24gQWxsd2lubmVyIHRoZSBHUFUgT1BQCnRhYmxlIGRlZmluZXMgYm90
aCBmcmVxdWVuY2llcyBhbmQgdm9sdGFnZXMuCgpGaXJzdCBwYXRjaGVzIFswMS0wN10gc2hvdWxk
IG5vdCBjaGFuZ2UgdGhlIGFjdHVhbCBiZWhhdmlvcgphbmQgaW50cm9kdWNlIGEgcHJvcGVyIHBh
bmZyb3N0X2RldmZyZXEgc3RydWN0LgoKUmVnYXJkcywKQ2zDqW1lbnQKCkNsw6ltZW50IFDDqXJv
biAoMTQpOgogIGRybS9wYW5mcm9zdDogYXZvaWQgc3RhdGljIGRlY2xhcmF0aW9uCiAgZHJtL3Bh
bmZyb3N0OiBjbGVhbiBoZWFkZXJzIGluIGRldmZyZXEKICBkcm0vcGFuZnJvc3Q6IGRvbid0IHVz
ZSBwZmRldmZyZXEuYnVzeV9jb3VudCB0byBrbm93IGlmIGh3IGlzIGlkbGUKICBkcm0vcGFuZnJv
c3Q6IGludHJvZHVjZSBwYW5mcm9zdF9kZXZmcmVxIHN0cnVjdAogIGRybS9wYW5mcm9zdDogdXNl
IHNwaW5sb2NrIGluc3RlYWQgb2YgYXRvbWljCiAgZHJtL3BhbmZyb3N0OiBwcm9wZXJseSBoYW5k
bGUgZXJyb3IgaW4gcHJvYmUKICBkcm0vcGFuZnJvc3Q6IHJlbmFtZSBlcnJvciBsYWJlbHMgaW4g
ZGV2aWNlX2luaXQKICBkcm0vcGFuZnJvc3Q6IG1vdmUgZGV2ZnJlcV9pbml0KCkvZmluaSgpIGlu
IGRldmljZQogIGRybS9wYW5mcm9zdDogZHluYW1pY2FsbHkgYWxsb2MgcmVndWxhdG9ycwogIGRy
bS9wYW5mcm9zdDogYWRkIHJlZ3VsYXRvcnMgdG8gZGV2ZnJlcQogIGFybTY0OiBkZWZjb25maWc6
IEVuYWJsZSBkZXZmcmVxIGNvb2xpbmcgZGV2aWNlCiAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBo
NjogQWRkIGNvb2xpbmcgbWFwIGZvciBHUFUKICBbRE8gTk9UIE1FUkdFXSBhcm02NDogZHRzOiBh
bGx3aW5uZXI6IGg2OiBBZGQgR1BVIE9QUCB0YWJsZQogIFtETyBOT1QgTUVSR0VdIGFybTY0OiBk
dHM6IGFsbHdpbm5lcjogZm9yY2UgR1BVIHJlZ3VsYXRvciB0byBiZSBhbHdheXMKCiAuLi4vZHRz
L2FsbHdpbm5lci9zdW41MGktaDYtYmVlbGluay1nczEuZHRzICAgfCAgIDEgKwogYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kgIHwgMTAyICsrKysrKysrKysrCiBh
cmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyAgIHwgMTY1ICsrKysrKysr
KysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaCAg
IHwgIDMwICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyAg
ICB8ICA2MSArKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNl
LmggICAgfCAgMTQgKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyAg
ICAgICB8ICAxNSArLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jICAg
ICAgIHwgIDEwICstCiA5IGZpbGVzIGNoYW5nZWQsIDI5MCBpbnNlcnRpb25zKCspLCAxMDkgZGVs
ZXRpb25zKC0pCgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
