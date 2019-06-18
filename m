Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D60649A0A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E836E0F1;
	Tue, 18 Jun 2019 07:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B009F6E0C4;
 Tue, 18 Jun 2019 01:11:28 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so18915162edr.11;
 Mon, 17 Jun 2019 18:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=qkCiUVj0VugFone9Q9W6ljAve1bW+OW0QjoILb3tipw=;
 b=a7NSDgBTlcV7EOmuY2/zzgpD+skOwXSuV8Lu5Q8sJCDQoDIB5QGxtK4T3v5Z5zQFYV
 TV53yFpyGFZRYxWEBfz6dMg1if6WN+8awwNLaB9sTg9OEz4kbZRlSGTDWk2CCbhESPbq
 FfaZHDH4QF/K8zbepNifLNNVvM8ZI9ZAEOYkylZ2KKglGwU8xYA4f6wGaA875Xgn7Fgy
 NIVDATrxUOfDMvgY+Vzd5omq4+9BptboVF2v0u+9gi7tueRrXVBqIAh9SRX5jcDJp/gd
 bkIXWC55bA+ESUycO1HFDmUoET8c4/xbyej+J2RNPoYl41/zLZTbkTgIHrL+X9JA7m61
 4PDw==
X-Gm-Message-State: APjAAAUBC1A8DOK+vaF85FG7Evcidf0q5xfbcBIlc23bP4nLxKdWKYwh
 RMySXmPr8h5RBQzAIavJ5c/vDD7HGsQ=
X-Google-Smtp-Source: APXvYqx9ccbJtoSHa26LPIc3BFE0FBLwxaIr/ZcAkWyuy0BkRFQO8MmPJEMmdpQ66+pUqnLE8HpP4A==
X-Received: by 2002:a50:b0e3:: with SMTP id j90mr2980661edd.26.1560820287270; 
 Mon, 17 Jun 2019 18:11:27 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id p37sm4185558edc.14.2019.06.17.18.11.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 18:11:26 -0700 (PDT)
Date: Mon, 17 Jun 2019 18:11:24 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Anthony Koo <Anthony.Koo@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: arm32 build failure after abe882a39a9c ("drm/amd/display: fix issue
 with eDP not detected on driver load")
Message-ID: <20190618011124.GA67760@archlinux-epyc>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=qkCiUVj0VugFone9Q9W6ljAve1bW+OW0QjoILb3tipw=;
 b=nsUwJUj/lnoFntRkDnKVwnq/d9FeGFWNDPrx740De1flmr61SPj8PnVj9Lai/iUZe+
 akX+bwe46jgvXe5eiSMOmY3eg6w4zRb4auJSbTpbgnJxzJ7BxCrqcwXEt66oI4EcFz9c
 aYOVWfuAEy0tnnSTZrOIJxC0ZUII/ATh1YqPRmvx2Mu1ffBpJDNgt4BKSqk5G4OuL/ep
 K1ERuFDRzRuPx/Z2ENWDMPsWGzSUQwFD7nbjnfSpUSBbeHyTXX99UtMf7U/G0o1gJ9k3
 Pixz5m/1o7PUAvKEZQXtVNem0tnvAMLGiMfHrG3115k9TkDOXV6QrEy1l0W6ciLVW3Ef
 mruw==
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jun Lei <Jun.Lei@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKQWZ0ZXIgY29tbWl0IGFiZTg4MmEzOWE5YyAoImRybS9hbWQvZGlzcGxheTogZml4
IGlzc3VlIHdpdGggZURQIG5vdApkZXRlY3RlZCBvbiBkcml2ZXIgbG9hZCIpIGluIC1uZXh0LCBh
cm0zMiBhbGx5ZXNjb25maWcgYnVpbGRzIHN0YXJ0CmZhaWxpbmcgYXQgbGluayB0aW1lOgoKYXJt
LWxpbnV4LWdudWVhYmktbGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmsubzogaW4KZnVuY3Rpb24gYGRjX2xpbmtfZGV0ZWN0JzoKZGNfbGluay5jOigudGV4dCsw
eDI2MGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2JhZF91ZGVsYXknCgphcm0zMiBvbmx5
IGFsbG93cyBhIHVkZWxheSB2YWx1ZSBvZiB1cCB0byAyMDAwLCBzZWUKYXJjaC9hcm0vaW5jbHVk
ZS9hc20vZGVsYXkuaCBmb3IgbW9yZSBpbmZvLgoKUGxlYXNlIGxvb2sgaW50byB0aGlzIHdoZW4g
eW91IGhhdmUgYSBjaGFuY2UhCk5hdGhhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
