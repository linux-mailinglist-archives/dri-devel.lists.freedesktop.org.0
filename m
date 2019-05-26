Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB0D2B456
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DE989D58;
	Mon, 27 May 2019 12:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF0B6E1AA;
 Sun, 26 May 2019 07:33:02 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id h2so4283667pgg.1;
 Sun, 26 May 2019 00:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Cg/vgbjG/t5rG/2rIMWKtSp0D9gxhMUNGBD8lfkvzS0=;
 b=B/aeLKjEdW89mbS3jzTBUIp2i1aVOrf/wzOfXL2mIP/Ixfgqlr3xqkplKX2rbBNBXP
 ykdc1+rv8APOhe+1rqWWZlB32SgnfkusmbGTokwjzKSD+j03AAdICRwJWUEuO40QLUWE
 3tI134w8ezeL4dhs/YCr3rYgweAweojTTE6bsP3PA6o6S9rsjo7Bxh1M6WT1WUssQC2Y
 6YDVw79DmfDZi+clhwhbbj7KB3mbRykmAQmzXpuh6xhTvQIrGrl3TA78rt94WrpDZGJV
 ca7dQ2n70Yp7kZvjqM4I9h46fE9YjdacwpFrOijpA3uzaSAnNTycZkDMNbE8oBZfLcER
 Uevw==
X-Gm-Message-State: APjAAAVg8Zb2E2hidxaDt6oPG5/wFpF8Kl6qotQSXL8on3YmvzssF1R/
 LFHhFjdACfOfzmGtFyyN684=
X-Google-Smtp-Source: APXvYqxQfNCd1WBIL1/OjP2muAsSzBBETx0VADMdKojpASOPaJ/A7j+32WalD3l/bEIL0ShiPa0T8w==
X-Received: by 2002:a17:90a:a4c7:: with SMTP id
 l7mr21999145pjw.49.1558855982428; 
 Sun, 26 May 2019 00:33:02 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
 by smtp.gmail.com with ESMTPSA id z9sm6652704pgc.82.2019.05.26.00.32.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 00:33:01 -0700 (PDT)
Date: Sun, 26 May 2019 13:02:54 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Evan Quan <evan.quan@amd.com>, Huang Rui <ray.huang@amd.com>,
 Rex Zhu <Rex.Zhu@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, James Zhu <James.Zhu@amd.com>,
 Shirish S <shirish.s@amd.com>, Trigger Huang <Trigger.Huang@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/amdgpu: Remove duplicate including duplicate header
Message-ID: <20190526073254.GA8567@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=Cg/vgbjG/t5rG/2rIMWKtSp0D9gxhMUNGBD8lfkvzS0=;
 b=lInDxgR8++aiOOZRRg7PG6aQtERRyRMGsmCHU6znVpDZc33N+8MpiwAJx8drlR10dO
 ELNAGAeiqJFGXlisYv4hQcaHFN7P5g5Wynl15duks0SHXubMzJbMUzPGfHn01RslVPSu
 tHH48FIHLaQa3TXfb0hikzk0yOTGBas5C8SayH22GHTFQQVy0ZfeP3Hd0P66KRSfmCb/
 Ngpnzrs6jxXiL1SJlxJWUhk31y7WwugDhakoIJeXw8AFSJyTyvcq0O9ywMAd2Sce7UKM
 pZHr55rv0Mh6mD3Idu/mb1cxgHRM0pVtFKHJL/Ze8V3/mh1Jn6fReiA9Ig/1mnQZk3dx
 RE4A==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cmVtb3ZlIGR1cGxpY2F0ZSBlbnRyeSBvZiBzb2MxNS5oLiBJc3N1ZSBpZGVudGlmaWVkIGJ5IGlu
Y2x1ZGVjaGVjawoKU2lnbmVkLW9mZi1ieTogSGFyaXByYXNhZCBLZWxhbSA8aGFyaXByYXNhZC5r
ZWxhbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
YyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y5XzAuYwppbmRleCBjNzYzNzMzLi5kNzIzMzMyIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTM0LDcgKzM0LDYgQEAKICNpbmNsdWRlICJ2ZWdhMTBf
ZW51bS5oIgogI2luY2x1ZGUgImhkcC9oZHBfNF8wX29mZnNldC5oIgogCi0jaW5jbHVkZSAic29j
MTUuaCIKICNpbmNsdWRlICJzb2MxNV9jb21tb24uaCIKICNpbmNsdWRlICJjbGVhcnN0YXRlX2dm
eDkuaCIKICNpbmNsdWRlICJ2OV9zdHJ1Y3RzLmgiCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
