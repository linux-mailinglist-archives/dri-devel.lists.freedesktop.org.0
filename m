Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E385BE7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956EB6E7C8;
	Thu,  8 Aug 2019 07:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D5089FE3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 12:50:24 +0000 (UTC)
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hvLOY-0007ez-Mt
 for dri-devel@lists.freedesktop.org; Wed, 07 Aug 2019 12:50:22 +0000
Received: by mail-pl1-f197.google.com with SMTP id x1so9255890plm.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 05:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=uW0MrXbB3BW7ZtLsIKXuNS6TLMaCGNiLsqZ7mbvjEew=;
 b=QZY1Q3QqfUTWIRox5qNhWFvuo0c1RkT3ccJAo4uIfQ0N2fPViyYULB8UsOW1Ih5ZTe
 hyZjAFdeqP2orA2hpdI2Vt52bOFsyNSaOHuv3qeDqao1S5gPObi3kg3D7eshY1z4F+xT
 VMsiAizbTY8URxy0ycy64RDLPqQyrgzNvX3ZQsz+Vlm5DMfeM31bSbOy8ODe0YObx/0/
 7YX/H4ZYkNbB7ZwcDFJnk8zJg0qgdspMv8XJIzxJnDDR9qTvzpBfUb8Kxx2hwGWPMSIi
 RPN7eeiO4UV2lVIb6/AqPgeCSQUDV5ANEc5L2FkHMuBEcCPhFoiRGx/S2IEdKjLmyk3p
 CRTg==
X-Gm-Message-State: APjAAAVHzD9uMYNyQSxDauJuvUDFRnhl35icPAvb/IhRpLyLLGT3qDEI
 1lOI0sVCIvELYvJQdau/fsWRhrDd0RnZToAdS9pKCYKBn8fafR9tqzbg/hTcGJubEcQI7J/k4XQ
 lpcDK8vKKybsxEhvk17iU3Z4mdMp/bewBvCeHfZyHVyuFNw==
X-Received: by 2002:a17:902:2ea2:: with SMTP id
 r31mr8140589plb.200.1565182221406; 
 Wed, 07 Aug 2019 05:50:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyP0mQsPRLO2O4uMJVwX5RbRxIPKKkBUk5N/K6JMpdRXjIw0uJRlI9ss9Nu1lLF3yZ0bhwyuw==
X-Received: by 2002:a17:902:2ea2:: with SMTP id
 r31mr8140558plb.200.1565182221045; 
 Wed, 07 Aug 2019 05:50:21 -0700 (PDT)
Received: from 2001-b011-380f-37d3-744a-8654-5394-196d.dynamic-ip6.hinet.net
 (2001-b011-380f-37d3-744a-8654-5394-196d.dynamic-ip6.hinet.net.
 [2001:b011:380f:37d3:744a:8654:5394:196d])
 by smtp.gmail.com with ESMTPSA id o129sm68613198pfg.1.2019.08.07.05.50.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 05:50:20 -0700 (PDT)
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: [Regression] "drm/amdgpu: enable gfxoff again on raven series (v2)"
Message-Id: <3EB0E920-31D7-4C91-A360-DBFB4417AC2F@canonical.com>
Date: Wed, 7 Aug 2019 20:50:17 +0800
To: Huang Rui <ray.huang@amd.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Anthony Wong <anthony.wong@canonical.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpBZnRlciBjb21taXQgMDA1NDQwMDY2ZjkyICgiZHJtL2FtZGdwdTogZW5hYmxlIGdmeG9m
ZiBhZ2FpbiBvbiByYXZlbiBzZXJpZXMgIAoodjIp4oCdKSwgYnJvd3NlcnMgb24gUmF2ZW4gUmlk
Z2Ugc3lzdGVtcyBjYXVzZSBzZXJpb3VzIGNvcnJ1cHRpb24gbGlrZSB0aGlzOgpodHRwczovL2xh
dW5jaHBhZGxpYnJhcmlhbi5uZXQvNDM2MzE5NzcyL1NjcmVlbnNob3QlMjBmcm9tJTIwMjAxOS0w
OC0wNyUyMDA0LTIwLTM0LnBuZwoKRmlybXdhcmVzIGZvciBSYXZlbiBSaWRnZSBpcyB1cC10by1k
YXRlLgoKS2FpLUhlbmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
