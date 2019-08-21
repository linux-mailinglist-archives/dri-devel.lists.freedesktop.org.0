Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 381C097392
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254AA6E92B;
	Wed, 21 Aug 2019 07:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0C86E2B2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 03:55:41 +0000 (UTC)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x7L3tQp1016439;
 Wed, 21 Aug 2019 12:55:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L3tQp1016439
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 0/4] video/logo: various fix and cleanups of
 drivers/video/logo/Makefile
Date: Wed, 21 Aug 2019 12:55:12 +0900
Message-Id: <20190821035517.21671-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1566359727;
 bh=ZLgV4koGuRryubL/TOhgUZDXaC6w+rsrQk3BXi0A+BY=;
 h=From:To:Cc:Subject:Date:From;
 b=jJgX5I2TqWbW5oPGco9DAJtRucNgVC5rqJU1q5p7bkg7ztpoWtK4ChUD9s6nrYMWr
 Df0PmixW4cvgaKelhl5ljqeZneLHGo3+PFu/HYaiOtIIKfoEehoFnLZzJz4clvIvan
 AMdHJRXb8KfV+X6sniQIWlmppAYv0P8qu/br3U52T9EF6+SG1iEJ60TGxoDAPTNWau
 f+piWeYfmgyHwwiQb9ZqTlx1kr3LgQFLOOdG7Jj+U4eoJ1guKLf9X7IpzlrXjkOqo9
 M4kNrj5YlJza2+dBDatLbsnhYlNONvpCwbtPIsIDNkeRBkgSW/FaDnLlveKUqTLpdE
 iG0XcLnqd9LUQ==
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Marek <michal.lkml@markovi.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoKTWFzYWhpcm8gWWFtYWRhICg0KToKICB2aWRlby9sb2dvOiByZW1vdmUgdW5uZWVkZWQgKi5v
IHBhdHRlcm4gZnJvbSBjbGVhbi1maWxlcwogIHZpZGVvL2xvZ286IGZpeCB1bm5lZWRlZCBnZW5l
cmF0aW9uIG9mIGZvbnQgQyBmaWxlcwogIHZpZGVvL2xvZ286IHNpbXBsaWZ5IGNtZF9sb2dvCiAg
dmlkZW8vbG9nbzogbW92ZSBwbm10b2xvZ28gdG9vbCB0byBkcml2ZXJzL3ZpZGVvL2xvZ28vIGZy
b20gc2NyaXB0cy8KCiBkcml2ZXJzL3ZpZGVvL2xvZ28vLmdpdGlnbm9yZSAgICAgICAgICAgICAg
IHwgIDEgKwogZHJpdmVycy92aWRlby9sb2dvL01ha2VmaWxlICAgICAgICAgICAgICAgICB8IDM2
ICsrKystLS0tLS0tLS0tLS0tLS0tLQoge3NjcmlwdHMgPT4gZHJpdmVycy92aWRlby9sb2dvfS9w
bm10b2xvZ28uYyB8ICAwCiBzY3JpcHRzLy5naXRpZ25vcmUgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgLQogc2NyaXB0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAyIC0tCiA1IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0p
CiByZW5hbWUge3NjcmlwdHMgPT4gZHJpdmVycy92aWRlby9sb2dvfS9wbm10b2xvZ28uYyAoMTAw
JSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
