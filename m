Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2DA81D90
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 15:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544C06E43A;
	Mon,  5 Aug 2019 13:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945C76E43A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:43:27 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p74so74780578wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JhUROw1HvhUxcOE9NaUVqqed4sa60oTqgrJfdf5Zd0w=;
 b=mraS2LstAdKq4B0tzuE8FN9w+efczvvKqZbrX4uWog/4IzNhPJZadnNlNx6UJZNizn
 YaQvhs8SREw0wwU12CyJVdnyHZvvsasee84ayCt7ir9crCMj5jD76CEMHMiGl3CjPjzR
 oS6o8nJYLNlrbOIIUHx5b8UOrOO+GGLzxfD+nu+mRZbHFCoZyy0pQMEHIr2LuR5KpFZD
 wfZHsMKymyCFkCUBL6/XpF/h5+2+Uv6A2UVa+4kiYwaIoKQ1ZofFIvQvKJSZsmDBUsO+
 fFJrC0mm63z9jFBWV0UZPB1NJsvxKwmDe4lCpGn8Cs1vIet8iiMUse2CLnTepLE+irWg
 JOxA==
X-Gm-Message-State: APjAAAWKSUh88g6ZrnoZrZlMxil4s370EPBFweTJT2ZkVapD2ScV9kxe
 F543oGDEcYptLcmh5kGHs1nlog==
X-Google-Smtp-Source: APXvYqwRQ8LTdh+aO2Wutd286Aw3WmG2Oy0ABsRw8fE9gC5QuZErdhrI3Sy/Vj9G8jN3TZSG3y4rYg==
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr18523606wmk.92.1565012606039; 
 Mon, 05 Aug 2019 06:43:26 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t3sm67835842wmi.6.2019.08.05.06.43.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:43:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH 0/3] drm/meson: convert bindings to YAML schemas
Date: Mon,  5 Aug 2019 15:43:16 +0200
Message-Id: <20190805134319.737-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JhUROw1HvhUxcOE9NaUVqqed4sa60oTqgrJfdf5Zd0w=;
 b=vUJfOghBWCqqLATCC18WkSf+axtMpfn3516CSlWGv8IM33ESEoYS7LgHT/JXThmFV+
 R50C/1ljsKosMRkum31NKzxE5GcDf1+cS4PqPboNZkOM842UqaJBkA6t+fVzr5B7cSw8
 XrDB8nUL6WKJ6Mv3ra5McwOCZvYWzVZDnZVLE8WfPFCysZiJfbQgJUiuCEnGzfFunNoe
 wyO7bkgzybB1vzbiu5vUMKJXNhS0d/6ZypXY2dk8Do5vE1HttC9naKxVdJJ53oPBMZlL
 3WC8lqxQs75xql5XaRGCWP6WetYgx47N/5VY5WQpugIwIDIdpTY4OBGqzyq6IPkpqlYQ
 MNlg==
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBjb252ZXJ0cyB0aGUgZXhpc3RpbmcgdGV4dCBiaW5kaW5ncyB0byBZQU1M
IHNjaGVtYXMuCgpUaG9zZSBiaW5kaW5ncyBoYXZlIGEgbG90IG9mIHRleHRzLCB0aHVzIGlzIGlu
dGVyZXN0aW5nIHRvIGNvbnZlcnQuCgpBbGwgaGF2ZSBiZWVuIHRlc3RlZCB1c2luZyA6CiQgbWFr
ZSBBUkNIPWFybTY0IGR0YnNfY2hlY2sKCklzc3VlcyB3aXRoIHRoZSBhbWxvZ2ljIGFybTY0IERU
cyBoYXMgYWxyZWFkeSBiZWVuIGlkZW50aWZpZWQgdGhhbmtzCnRvIHRoZSB2YWxpZGF0aW9uIHNj
cmlwdHMuIFRoZSBEVCBmaXhlcyB3aWxsIGJlIHB1c2hlZCBvbmNlIHRoZXNlIHlhbWwKYmluZGlu
Z3MgYXJlIGFja2VkLgoKTmVpbCBBcm1zdHJvbmcgKDMpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5
OiBhbWxvZ2ljLG1lc29uLWR3LWhkbWk6IGNvbnZlcnQgdG8geWFtbAogIGR0LWJpbmRpbmdzOiBk
aXNwbGF5OiBhbWxvZ2ljLG1lc29uLXZwdTogY29udmVydCB0byB5YW1sCiAgTUFJTlRBSU5FUlM6
IFVwZGF0ZSB3aXRoIEFtbG9naWMgRFJNIGJpbmRpbmdzIGNvbnZlcnRlZCBhcyBZQU1MCgogLi4u
L2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnR4dCAgICAgICAgIHwgMTE5IC0tLS0tLS0t
LS0tLS0KIC4uLi9kaXNwbGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sICAgICAgICB8IDE2
MCArKysrKysrKysrKysrKysrKysKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24t
dnB1LnR4dCAgICB8IDEyMSAtLS0tLS0tLS0tLS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9hbWxv
Z2ljLG1lc29uLXZwdS55YW1sICAgfCAxNTMgKysrKysrKysrKysrKysrKysKIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogNSBmaWxlcyBjaGFu
Z2VkLCAzMTUgaW5zZXJ0aW9ucygrKSwgMjQyIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVz
b24tZHctaGRtaS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFtbAogZGVsZXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9n
aWMsbWVzb24tdnB1LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tdnB1LnlhbWwKCi0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
