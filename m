Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3084750E
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89548892B6;
	Sun, 16 Jun 2019 14:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15D3892BD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 18:55:51 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id k187so2053282pga.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 11:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=D+syJ3SL1nuOH0xkteKH/buQWr95V/F3KATaumHZy1s=;
 b=nKEVb9aPlB9ajGZnU01YVotNyhXsazVNB8bz6q+ZJ/KpQKxBUNfhQVp4EOvHhyGJvz
 bOlN+HHeDxx+EM0MuhFN8O0YNNotaseM+6iCklCInsT5PxoaAhnBBLjKXy0ubcFa59NY
 0f5tlXLI3bOOpwN4QLGQzvuj336s3wTBgtClr19XZzvKsbzRJ4aq3UrEIkY3HfbI1n5B
 dCW1/BA5YUEFqdeI2i1ctf+UKUnTEqyUzNQQnMmHyTn8khgEISMm22k7klnJTY5yM8Ob
 FhnvW/FQcIru0F5mk11IK8OmuKX0IYhiC+QRBljSA0qzNLH7dNuZnAHh9qkRanaFFIPM
 Njmw==
X-Gm-Message-State: APjAAAX39Yj5cdLoca7Rs32juyQTryJU33AtcnNe8by2MayE/apMyVk2
 +mZD+Bqr8omhWigdZ1m97h4=
X-Google-Smtp-Source: APXvYqwkcDuQH9liqXyWK1uKCKA4RPQF+zphrhMUb0LCRFkGimnSjaDuvjeLe1QCeWyGaARVQ6YKLA==
X-Received: by 2002:a63:e317:: with SMTP id f23mr23202775pgh.142.1560538551555; 
 Fri, 14 Jun 2019 11:55:51 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id c26sm1225267pfr.71.2019.06.14.11.55.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 11:55:51 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: 
Subject: [PATCH 0/2] MSM8998 MTP Display
Date: Fri, 14 Jun 2019 11:55:47 -0700
Message-Id: <20190614185547.34518-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=D+syJ3SL1nuOH0xkteKH/buQWr95V/F3KATaumHZy1s=;
 b=EHS50QbzkjLT+Av6pFw2E5h+1zENcT2G8i6ylRVNrq0XFeaMWA/gSlbC2Ls+b6py+u
 fgSidofKxz+j5YRAhtPdVPiWCE8b76ajZVccTXvu3yphAsTqFZeZx51ZdFfh0eSwEUUb
 wBSu+RAdVMGiJeYPf3hCtY2yFQlU6UPuw60EdqSq3s76dKJWKvH9ed6cmxkXkc2Muss9
 trhUvrXlenEj+M0DrsCHQg/oiw58pcdLsWdDHj6JedT8vsc7duWGbGrJ9A28o0I/ruUt
 UZI4aknr5pBhWgWZKDRKFK/V10NXFGuVXCi/5fJ88QVw6dhKADcWjHNYcWgs27vHj68N
 jQAg==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2Ugd2UgYXJlIHRyeWluZyB0byBnZXQgdGhlIEdQVSBhbmQgZGlzcGxheSBoYXJkd2FyZSBp
biB0aGUgU29DCnN1cHBvcnRlZCwgaXQgd291bGQgYmUgbmljZSB0byBiZSBhYmxlIHRvIHB1dCB0
aGUgb3V0cHV0IG9uIHRoZQppbnRlZ3JhdGVkIHBhbmVsIGZvciB0aGUgcmVmZXJlbmNlIHBsYXRm
b3JtLiAgVG8gZG8gc28sIHdlIG5lZWQgc3VwcG9ydAppbiB0aGUgVHJ1bHkgZHJpdmVyIHRvIHN1
cHBvcnQgdGhlIHNwZWNpZmljIHBhbmVsIHZhcmlhbnQgZm9yIHRoZQpNU004OTk4IE1UUC4gIFRo
aXMgc2VyaWVzIGFkZHMgdGFodCBzdXBwb3J0LgoKSmVmZnJleSBIdWdvICgyKToKICBkdC1iaW5k
aW5nczogZGlzcGxheTogdHJ1bHk6IEFkZCBNU004OTk4IE1UUCBwYW5lbAogIGRybS9wYW5lbDog
dHJ1bHk6IEFkZCBNU004OTk4IE1UUCBzdXBwb3J0CgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvdHJ1
bHksbnQzNTU5Ny50eHQgICAgICAgIHwgICA3ICstCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtdHJ1bHktbnQzNTU5Ny5jICAgfCAxNDkgKysrKysrKysrKysrKy0tLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDExNiBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
