Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B3474AB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 15:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF5689127;
	Sun, 16 Jun 2019 13:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3238A890D2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 13:25:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p13so7025490wru.10
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 06:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TS9lwWz77eAnWau9EHKu6Ns0BFPrcuTC7wke1p2mPSY=;
 b=VhZLNRUYzzr4D1YTLJh/lq0rx3bx4Ie2W5eGTeLlcL7t7WI135FuU1duVEWrZqJSUN
 MmDtpXMTVEykWx0DDKqUNqVxq38qycns6TWK3vXjqWjRvpt1c05Bk4+78OW+YFlDOjV6
 NMnYFR6lO+6pVQDxMG60YVDRtC8ng1KTTnS7aFsMwy5uEv/U87ainLYqyFvxFy80AebX
 6ESlZXLlUtfrK1IvrnRhvyyTA0nH/yosqKXFuPaGoNqRxlsxK+yjqWU+uHfNKCXAouMu
 xQwz4B1qlirBWOko8STgdPVpDZokXxxFmUsYWBD7kFySPL8DeNByCWXUbpX5/JVdVaTV
 HFYQ==
X-Gm-Message-State: APjAAAVfzkdkegP6d8JCwskZ7GWGQQ/j1kyEXpnmwzjx7nsWoYFd9YBU
 1TxCbTwZQ3tvunURntKrr8/pCw5G
X-Google-Smtp-Source: APXvYqz/YjJUZqayRB7RjX0IwEonIKKbeQG9c4jP2F9tbSlOSbo6Snh+iSXXM7Ywnz+QXwC6rRw0sQ==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr37604833wrv.61.1560691549534; 
 Sun, 16 Jun 2019 06:25:49 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id g2sm9332424wmh.0.2019.06.16.06.25.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 06:25:48 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 1/4] meson.build: Fix typo
Date: Sun, 16 Jun 2019 14:23:40 +0100
Message-Id: <20190616132343.26370-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TS9lwWz77eAnWau9EHKu6Ns0BFPrcuTC7wke1p2mPSY=;
 b=pWYEXd3gOTxx04IThzvqm7lal2bysv4XKpiF92pwIjnZy48d+4frsfH8wl5kaMz5Nw
 w1t/tLvDjEGabB3C1hxb9S8RW9ssC00Gog4N6VCTcu51lwSCwRZkruugJJ4rujU7nt3d
 edJHl9hdBa20kobJvw4pm77QCHx/dZ1O59x61RogIiJRKGHpvjFi/Dkjt7UfLi8zaodW
 aWuLnFID41Sc42EsHOHEV2Ig8ErF/ELqgansCr07LNipDqJBDS+OQRMm7BxBTFvyLNaA
 zijgiyvXKHMYf0PBJeFgC/jqE2JTR79ss32j7Ks5Gk/X1NraYL/bTzuvI/yUGGKi/fzZ
 DHJQ==
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

RnJvbTogTmljbGFzIFplaXNpbmcgPHplaXNpbmdAZGFlbW9uaWMuc2U+CgpSZXZpZXdlZC1ieTog
RW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Ci0tLQogbWVzb24uYnVpbGQg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCmluZGV4IGJlNzY4YWZhLi42NGYw
ZDViMSAxMDA2NDQKLS0tIGEvbWVzb24uYnVpbGQKKysrIGIvbWVzb24uYnVpbGQKQEAgLTI0OCw3
ICsyNDgsNyBAQCBpZiBwcm9nX3hzbHQuZm91bmQoKQogZW5kaWYKIHdpdGhfbWFuX3BhZ2VzID0g
d2l0aF9tYW5fcGFnZXMgIT0gJ2ZhbHNlJyBhbmQgcHJvZ194c2x0LmZvdW5kKCkgYW5kIHByb2df
c2VkLmZvdW5kKCkKIAotIyBVc2VkIGZvciB0ZXRzCisjIFVzZWQgZm9yIHRlc3RzCiBwcm9nX2Jh
c2ggPSBmaW5kX3Byb2dyYW0oJ2Jhc2gnKQogCiBjb25maWcuc2V0MTAoJ0hBVkVfVklTSUJJTElU
WScsCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
