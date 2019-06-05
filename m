Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A57C735E95
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742FD89ABE;
	Wed,  5 Jun 2019 14:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FEA89ABA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 14:03:38 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h11so23293034ljb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 07:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nh+I0twaHiwOR8m3ZRS418ZiUoF/zKXN40KUygu0+dY=;
 b=V/uBTo4JxD7wqyow0uraz8bkhabYvBuDC/wIiHsaxXhwS1vPXLNeAdIBoOWQN93vUI
 h1iqb4JNZkl6NXTnGkwKdK7JUWZXify62vd5uNhC3r6QgnO4qZ2l47XENH9AHU70OnLV
 2DzueEw1M5LCQdD3Msrl+eb301filLrwQli9apPzMcNFIeg3dBrD/vWV8UGTTEwKCNYe
 Fp5bM8T2wCagXvMPxix3fl2DByQTPATBmxtx0F4kt8dN5+eCowwGztWCkA1OufnlEecL
 ZRv32tpxEgFwinuAXFrsqNQq4aNfsKgSk9ei7rAP2K/AG/FYH5mlImiF3LOgPg3mEKMd
 Rowg==
X-Gm-Message-State: APjAAAWD1rpAgmnE8ghwNONIeSJ8hvcFzsuc+9pXuI7uhlKKMrbGfnYp
 mjRSwG3ufueCMZ57uUzmcnoq/QaooJk=
X-Google-Smtp-Source: APXvYqwDs6GPeZSRSo427zUcKyJYvAbInou+hSmh0W3FSFizhOTW7G5Nq6oXQlS+2b9oxqC/kSDBVg==
X-Received: by 2002:a2e:6545:: with SMTP id z66mr21766960ljb.146.1559743416840; 
 Wed, 05 Jun 2019 07:03:36 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 v2sm4217658lfi.52.2019.06.05.07.03.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 07:03:36 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/2] drm/savage: drop use of drmP.h
Date: Wed,  5 Jun 2019 16:03:12 +0200
Message-Id: <20190605140313.13629-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nh+I0twaHiwOR8m3ZRS418ZiUoF/zKXN40KUygu0+dY=;
 b=Ls6h1/mfR2yAkb71JshU0bFOy+t/GlVFDZbrp7hZ/lN8ueBHuPnZgToebKZYGk+mes
 q1XHnBfA90eOtzf6zEiYFVgP91OkyQ/q+DIIHZTtXUNw4HO86ASzU1AJ4mdIS1S0hYcC
 pRPh/82xKTe0K0iayYRJgW+ArMnzZfRO9ICPKElBA5KqduvaAdZI0KiN7y+SE0fGnFqL
 RVIipE+3JpuLLmse45gmKv8G3hquRgbpuaRCOrvBU5F8gWGS21Nrsm5jOOEVKqjzqRYB
 fksiwH6o8cjV0iU28sy0s8Vh/wAgjJoaD9JE2os+7qYa7who306rqOInrxHZ8zpe6EQx
 GYQg==
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpBbmQgbGlrZXdp
c2UgZHJvcCB1c2Ugb2YgbWFjcm9zIGZyb20gZHJtX29zX2xpbnV4LmgKCglTYW0KCgpTYW0gUmF2
bmJvcmcgKDIpOgogICAgICBkcm0vc2F2YWdlOiBkcm9wIHVzZSBvZiBkcm1fb3NfbGludXgKICAg
ICAgZHJtL3NhdmFnZTogZHJvcCB1c2Ugb2YgZHJtUC5oCgogZHJpdmVycy9ncHUvZHJtL3NhdmFn
ZS9zYXZhZ2VfYmNpLmMgICB8IDI1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2Rydi5jICAgfCAgOSArKysrKy0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9zYXZhZ2Uvc2F2YWdlX2Rydi5oICAgfCAxMCArKysrKysrKy0tCiBkcml2ZXJzL2dwdS9k
cm0vc2F2YWdlL3NhdmFnZV9zdGF0ZS5jIHwgIDkgKysrKysrKystCiA0IGZpbGVzIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
