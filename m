Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA074F5E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 15:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388BA6E75B;
	Thu, 25 Jul 2019 13:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E516E75A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:27:46 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id i11so50242676edq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 06:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jI3WU8kCFFRwPXY0aUAMpriixsNwaQuj71gjRmCLbE8=;
 b=SdIVzZrgGYVcxAXgWyHjdR/5wzeEHFUdeujif/z0nJ0I72MJGGLK7HRWNdE3EgpdD/
 clv/j5tQ6RFboyoRwJ7BHXlgWepBiFwcKQJoqu/vB1jQ392ymBSYNNot7QHT4Re6cfMo
 /ZPq89WeteIe8BKdA5sVO73wrohCyGQdCCs+G7rWxdRfa1bsBMlwJ+uUNYxAvW+lNtZ4
 NfjrvjmDz4jQDzL278xabvB8T1rPOL3h27Wp0d4BGiRS7vJXxRc5zoxsb6w2xPStkwut
 hpfDK2+PuPGscGhoJG4OS3kxto70msQBu3Qd1ACvcBafjWuKrnvT6LL7kxmyi6KWeX2U
 7DEw==
X-Gm-Message-State: APjAAAXYTmqvjxNS3r7H1xsn2bbT54saP7qQ9pUhoC417LxtFc9L6B2C
 +5EX47XyMDGnQUvxf77GEvvzBag+xZE=
X-Google-Smtp-Source: APXvYqw3nc9vhMcoiP6SnFaQRYsy2bAVZRrwFSktDvsY4gt4BWo0mGOr2gIGIEd8TdUQYri04k1Byw==
X-Received: by 2002:a50:a511:: with SMTP id y17mr76740559edb.259.1564061265319; 
 Thu, 25 Jul 2019 06:27:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id l1sm13091167edr.17.2019.07.25.06.27.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 06:27:44 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] RESEND: ditch gem_prime_res_obj hook
Date: Thu, 25 Jul 2019 15:26:51 +0200
Message-Id: <20190725132655.11951-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jI3WU8kCFFRwPXY0aUAMpriixsNwaQuj71gjRmCLbE8=;
 b=Yuji33LG9EdX54G/OxtL3RlNnCdEAgPgjKazOPwiRS6x/1/IG6+HHnpKu05EAIAGaL
 pTupgtLmph+4cMO/aNdepe6op2GOFQDT5ODp1iybQ0r2rmPWaNYus5wcktxiypY2fMaf
 66HRu7r5Gif8hq+Sl1ZPZ/cr8u+N47tIcmsq4=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKUmVzZW5kaW5nIHRoaXMgbGl0dGxlIHBhdGNoIHNlcmllcyAoZXZlcnl0aGluZyBl
bHNlIGxhbmRlZCBub3cpLCBzbyB0aGF0CndlIGNhbiBtb3ZlIGZvcndhcmQgd2l0aCBHZXJkJ3Mg
c2VyaWVzIHRvIGVtYmVkIGEgZ2VtX2JvIGluIHRoZSB0dG1fYm8gKGhlCnJlYmFzZWQgb24gdG9w
IG9mIHRoaXMpLgoKUmV2aWV3L3Rlc3RpbmcgbXVjaCBhcHByZWNpYXRlZC4KClRoYW5rcywgRGFu
aWVsCgpEYW5pZWwgVmV0dGVyICg0KToKICBkcm0vcmFkZW9uOiBGaWxsIG91dCBnZW1fb2JqZWN0
LT5yZXN2CiAgZHJtL25vdXZlYXU6IEZpbGwgb3V0IGdlbV9vYmplY3QtPnJlc3YKICBkcm0vYW1k
Z3B1OiBGaWxsIG91dCBnZW1fb2JqZWN0LT5yZXN2CiAgZHJtL3ByaW1lOiBEaXRjaCBnZW1fcHJp
bWVfcmVzX29iaiBob29rCgogRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgICAgICAgICAgICAg
ICAgICB8ICA5IC0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rt
YV9idWYuYyB8IDE3ICstLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZG1hX2J1Zi5oIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYyAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jICAgICAgICAgICAg
ICAgICB8ICAzIC0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jICAgICAg
ICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jICAgICAgIHwg
IDEgLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9nZW0uaCAgICAgICB8ICAxIC0K
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfcHJpbWUuYyAgICAgfCAgNyAtLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyAgICAgICAgIHwgIDIgLS0KIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5jICAgICAgfCAgMSArCiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jICAgICAgIHwgIDcgLS0tLS0tLQogaW5jbHVk
ZS9kcm0vZHJtX2Rydi5oICAgICAgICAgICAgICAgICAgICAgICB8IDEyIC0tLS0tLS0tLS0tLQog
MTQgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2MCBkZWxldGlvbnMoLSkKCi0tIAoy
LjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
