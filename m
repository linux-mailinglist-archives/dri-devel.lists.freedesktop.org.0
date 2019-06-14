Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0BB4750D
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0128929C;
	Sun, 16 Jun 2019 14:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1786489826
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 19:42:10 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id go2so1404130plb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=iOo7ovvaSmJUe1owVhwhdiFkGRwgIV4cXbraxhrxLvs=;
 b=EpImapsp+w09cMIAyjGOsNDfeS3lHLIFPFk0uuEg1bMLfKYugx7qr+Epgbvt9dtfFp
 19mThz6A9yx64fDXuc+StB6ti//mPvP3SLBVrk9S9IuDWiEODh6UqoE8RwkQjPXhOXkr
 /WchmhJlSHMzhsCTNXQFAKzDHRxpqklXi270GSpFffnWJ5okxHabouijWzjP5mZdGHco
 j+Qpbd4SOpiSIIS6I2/f/G6XnLrKQ6nxu0IdYQ0XFv/DYk/pXbeEwcHbLIZT/zlUeICP
 s5tfYQb3dHdRIbK5p73uF6B5bge2p9U4XKj9rwYujkSfyguVLYgyB/sC6E0YPin6TQW8
 qLAQ==
X-Gm-Message-State: APjAAAVBQ0qPjMvqZlfVOkR5Ltx/mytczftWWyIeOTMsi/uaOIaOORaj
 1nU0uUolnGMkxHt7QlOlQHE=
X-Google-Smtp-Source: APXvYqxMcUPKHuqr7vT0eG64kedh2H/zqPy8ECIXTE/ZICLTtW5A7MVGYkvapCcgbXDvYNBjh0mX/Q==
X-Received: by 2002:a17:902:42a5:: with SMTP id
 h34mr58012891pld.16.1560541329341; 
 Fri, 14 Jun 2019 12:42:09 -0700 (PDT)
Received: from ahmlpt0706 ([106.222.0.33])
 by smtp.gmail.com with ESMTPSA id c133sm3657278pfb.111.2019.06.14.12.42.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 12:42:08 -0700 (PDT)
Date: Sat, 15 Jun 2019 01:11:56 +0530
From: Saiyam Doshi <saiyamdoshi.in@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH] staging: android: fix style problem
Message-ID: <20190614194156.GA21401@ahmlpt0706>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=iOo7ovvaSmJUe1owVhwhdiFkGRwgIV4cXbraxhrxLvs=;
 b=a43LZDav76Pb80xF7UQV0HQJoGsXYknT/1qYhUhtsCsOwM7QPyo6l2hml7sibRTCHf
 BRspBc6UPwynf6+ymZCg0iGOCnQZ9KvYL2snFre65WQQ2vsrUyvniUzsyFeD2BnRMmbJ
 Y5zTEw3DzYOnDYIPetwDny/Y/t8nJLYif1fi2YGdn5h8ub4YGdflFG2+xD4IA95L4sLh
 dGM96uB2Iah+a0I2mP2EhcEMIlcme7e851qq9UT++heZg+Ce7DlaJOPqBR10K7kP3l6r
 zk8A6o7TIM1Ys83Pfe74DK3Vf54dqWSZbE31dRp9ElMaJxz3MTl4LfxKle+ydIm+C1+Z
 SQsw==
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y2hlY2twYXRjaCByZXBvcnRlZCAiV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMiLiBU
aGlzCnBhdGNoIGZpeGVzIGl0IGJ5IGFsaWduaW5nIGZ1bmN0aW9uIGFyZ3VtZW50cy4KClNpZ25l
ZC1vZmYtYnk6IFNhaXlhbSBEb3NoaSA8c2FpeWFtZG9zaGkuaW5AZ21haWwuY29tPgotLS0KIGRy
aXZlcnMvc3RhZ2luZy9hbmRyb2lkL2lvbi9pb25fY2h1bmtfaGVhcC5jIHwgNCArKystCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbl9jaHVua19oZWFwLmMgYi9kcml2ZXJzL3N0
YWdpbmcvYW5kcm9pZC9pb24vaW9uX2NodW5rX2hlYXAuYwppbmRleCAzY2RkZTljMWE3MTcuLjZh
Y2VhYjJlNzdlNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbl9j
aHVua19oZWFwLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbl9jaHVua19o
ZWFwLmMKQEAgLTEwNyw3ICsxMDcsOSBAQCBzdGF0aWMgc3RydWN0IGlvbl9oZWFwX29wcyBjaHVu
a19oZWFwX29wcyA9IHsKIAkudW5tYXBfa2VybmVsID0gaW9uX2hlYXBfdW5tYXBfa2VybmVsLAog
fTsKIAotc3RydWN0IGlvbl9oZWFwICppb25fY2h1bmtfaGVhcF9jcmVhdGUocGh5c19hZGRyX3Qg
YmFzZSwgc2l6ZV90IHNpemUsIHNpemVfdCBjaHVua19zaXplKQorc3RydWN0IGlvbl9oZWFwICpp
b25fY2h1bmtfaGVhcF9jcmVhdGUocGh5c19hZGRyX3QgYmFzZSwKKwkJCQkgICAgICAgc2l6ZV90
IHNpemUsCisJCQkJICAgICAgIHNpemVfdCBjaHVua19zaXplKQogewogCXN0cnVjdCBpb25fY2h1
bmtfaGVhcCAqY2h1bmtfaGVhcDsKIAlpbnQgcmV0OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
