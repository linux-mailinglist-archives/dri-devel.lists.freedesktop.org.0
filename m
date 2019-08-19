Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34BF95140
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0776E43D;
	Mon, 19 Aug 2019 23:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000346E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:03:25 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id o70so2081683pfg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NGWuQi2OFDXkoc4uHO6pNsanjgo7YeBnBRfiQonI2H0=;
 b=L7Smvb/7rkLWXgK2vRwE7NKbyE24q1zh4cvWYkeKy+XNC8BNnumrJU8ge1+OyfMPsY
 S9dLPioh3WQvNAOCL3SdIxEhK9M81ryeOzbdOZyat5LAzcPxWnYic05AMj6qa/EyvjiH
 fK5kQxWMy5gDwHyFWFp0MdvNsAObIyaUZVW1XTaF2zP9HddlqsO6LO4jxmhvc6ygex83
 EFv3P/X1WQJO1xOfDQLA7yyxWQT2OCmt4AXI527P2npuqJCouqVWU1tsBrEhCLdDBRZX
 F4gRpVVANNrv/BzkNnx7U2pi7RUPUFfOYXG3QMwnqtuscLIJIC25dM1sGP+RbnlsENd+
 LqnA==
X-Gm-Message-State: APjAAAWCsQegWmdchmZVhiJl8BYTRWFsjnWjNZNAQEeZqW0IYR4IPwP8
 mOfVnmBIKknnml/Z279S5VjPKA==
X-Google-Smtp-Source: APXvYqwBpcZXQemDrzGXVpe6NlOGvFce2KdFXtlDnxd5tTtST+SL0gIm0SWTpVaSRoFam6HdNk1teg==
X-Received: by 2002:a63:89c2:: with SMTP id
 v185mr21985168pgd.241.1566255805379; 
 Mon, 19 Aug 2019 16:03:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 j15sm17256509pfr.146.2019.08.19.16.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:03:24 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 00/25] drm: Kirin driver cleanups to prep for Kirin960
 support
Date: Mon, 19 Aug 2019 23:02:56 +0000
Message-Id: <20190819230321.56480-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=NGWuQi2OFDXkoc4uHO6pNsanjgo7YeBnBRfiQonI2H0=;
 b=bSPoeIkUgmIhgKRkg16czJLsntFR+sgonGuvg9tqqk+A3C3tMJlFv7E/8T9ThNLBVh
 vzwxh+KZ7e7YKQkcWny3z4vvA3koFpoHcdqyjygQpaR2iIgRSv7iUY1xNxjMHAxPg/JE
 z17GYAzvPGTYlQItGVHcBdTWc5rXfoUaRQ7YWYXjI4dXavxXwWOVRBOj+idE7ajshT0q
 JR1ij4jJmsyensJMw0HjCrL+O4edLFexSCwqEXCe8zxJzpVeWXaX+nsLDJCuZgJnmYgX
 VhpxSk+uf5THOd9+gAA57F54nlXWjtA6b3HGl+NwinJzpsaL2DA3MJ+a5d17l2Ye0YMC
 2uHQ==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2VuZGluZyB0aGlzIG91dCBhZ2FpbiwgdG8gZ2V0IGl0IGJhc2VkIG9uIGRybS1taXNjLW5leHQu
CgpUaGlzIHBhdGNoc2V0IGNvbnRhaW5zIG9uZSBmaXggKGluIHRoZSBmcm9udCwgc28gaXRzIGVh
c2llciB0bwpldmVudHVhbGx5IGJhY2twb3J0KSwgYW5kIGEgc2VyaWVzIG9mIGNoYW5nZXMgZnJv
bSBZaVBpbmcgdG8KcmVmYWN0b3IgdGhlIGtpcmluIGRybSBkcml2ZXIgc28gdGhhdCBpdCBjYW4g
YmUgdXNlZCBvbiBib3RoCmtpcmluNjIwIGJhc2VkIGRldmljZXMgKGxpa2UgdGhlIG9yaWdpbmFs
IEhpS2V5IGJvYXJkKSBhcyB3ZWxsCmFzIGtpcmluOTYwIGJhc2VkIGRldmljZXMgKGxpa2UgdGhl
IEhpS2V5OTYwIGJvYXJkKS4KClRoZSBmdWxsIGtpcmluOTYwIGRybSBzdXBwb3J0IGlzIHN0aWxs
IGJlaW5nIHJlZmFjdG9yZWQsIGJ1dCBhcwp0aGlzIGJhc2Uga2lyaW4gcmV3b3JrIHdhcyBnZXR0
aW5nIHRvIGJlIHN1YnN0YW50aWFsLCBJIHdhbnRlZAp0byBzZW5kIG91dCB0aGUgZmlyc3QgY2h1
bmssIHNvIHRoYXQgdGhlIHJldmlldyBidXJkZW4gd2Fzbid0Cm92ZXJ3aGVsbWluZy4KClRoZSBm
dWxsIEhpS2V5OTYwIHBhdGNoIHN0YWNrIGNhbiBiZSBmb3VuZCBoZXJlOgogIGh0dHBzOi8vZ2l0
LmxpbmFyby5vcmcvcGVvcGxlL2pvaG4uc3R1bHR6L2FuZHJvaWQtZGV2LmdpdC9sb2cvP2g9ZGV2
L2hpa2V5OTYwLW1haW5saW5lLVdJUAoKdGhhbmtzCi1qb2huCgoKTmV3IGluIHY0OgoqIFJlYmFz
ZWQgdG8gZHJtLW1pc2MtbmV4dCwgbWlub3IgdHdlYWtzIHRvIG1lcmdlIGNoYW5nZXMKKiBEcm9w
cGVkICJkcm06IGtpcmluOiBHZXQgcmlkIG9mIGRybVAuaCBpbmNsdWRlcyIgYXMgc2ltaWxhciBj
aGFuZ2UKICB3YXMgYWxyZWFkeSBpbiBkcm0tbWlzYyBuZXh0CiogQWRkZWQgYWNrZWQtYnkgdGFn
IGZyb20gWGlubGlhbmcKCgpDYzogUm9uZ3JvbmcgWm91IDx6b3Vyb25ncm9uZ0BnbWFpbC5jb20+
CkNjOiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29uLmNvbT4KQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KQ2M6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCgpEYSBMdiAoMSk6CiAgZHJtOiBraXJp
bjogRml4IGZvciBoaWtleTYyMCBkaXNwbGF5IG9mZnNldCBwcm9ibGVtCgpKb2huIFN0dWx0eiAo
Myk6CiAgZHJtOiBraXJpbjogUmVtb3ZlIEhJU0lfS0lSSU5fRFdfRFNJIGNvbmZpZyBvcHRpb24K
ICBkcm06IGtpcmluOiBSZW1vdmUgdW5yZWFjaGFibGUgcmV0dXJuCiAgZHJtOiBraXJpbjogTW92
ZSB3b3JrcXVldWUgdG8gYWRlX2h3X2N0eCBzdHJ1Y3R1cmUKClh1IFlpUGluZyAoMjEpOgogIGRy
bToga2lyaW46IFJlbW92ZSB1bmNlc3NhcnkgcGFyYW1ldGVyIGluZGlyZWN0aW9uCiAgZHJtOiBr
aXJpbjogUmVtb3ZlIG91dF9mb3JtYXQgZnJvbSBhZGVfY3J0YwogIGRybToga2lyaW46IFJlbmFt
ZSBhZGVfcGxhbmUgdG8ga2lyaW5fcGxhbmUKICBkcm06IGtpcmluOiBSZW5hbWUgYWRlX2NydGMg
dG8ga2lyaW5fY3J0YwogIGRybToga2lyaW46IER5bmFtaWNhbGx5IGFsbG9jYXRlIHRoZSBod19j
dHgKICBkcm06IGtpcmluOiBNb3ZlIHJlcXVlc3QgaXJxIGhhbmRsZSBpbiBhZGUgaHcgY3R4IGFs
bG9jCiAgZHJtOiBraXJpbjogTW92ZSBraXJpbl9jcnRjLCBraXJpbl9wbGFuZSwga2lyaW5fZm9y
bWF0IHRvCiAgICBraXJpbl9kcm1fZHJ2LmgKICBkcm06IGtpcmluOiBSZWFubWUgZGNfb3BzIHRv
IGtpcmluX2RybV9kYXRhCiAgZHJtOiBraXJpbjogTW92ZSBhZGUgY3J0Yy9wbGFuZSBoZWxwIGZ1
bmN0aW9ucyB0byBkcml2ZXJfZGF0YQogIGRybToga2lyaW46IE1vdmUgY2hhbm5lbCBmb3JtYXRz
IHRvIGRyaXZlciBkYXRhCiAgZHJtOiBraXJpbjogTW92ZSBtb2RlIGNvbmZpZyBmdW5jdGlvbiB0
byBkcml2ZXJfZGF0YQogIGRybToga2lyaW46IE1vdmUgcGxhbmUgbnVtYmVyIGFuZCBwcmltYXkg
cGxhbmUgaW4gZHJpdmVyIGRhdGEKICBkcm06IGtpcmluOiBNb3ZlIGNvbmZpZyBtYXhfd2lkdGgg
YW5kIG1heF9oZWlnaHQgdG8gZHJpdmVyIGRhdGEKICBkcm06IGtpcmluOiBNb3ZlIGRybSBkcml2
ZXIgdG8gZHJpdmVyIGRhdGEKICBkcm06IGtpcmluOiBBZGQgcmVnaXN0ZXIgY29ubmVjdCBoZWxw
ZXIgZnVuY3Rpb25zIGluIGRybSBpbml0CiAgZHJtOiBraXJpbjogUmVuYW1lIHBsYW5lX2luaXQg
YW5kIGNydGNfaW5pdAogIGRybToga2lyaW46IEZpeCBkZXYtPmRyaXZlcl9kYXRhIHNldHRpbmcK
ICBkcm06IGtpcmluOiBNYWtlIGRyaXZlcl9kYXRhIHZhcmlhYmxlIG5vbi1nbG9iYWwKICBkcm06
IGtpcmluOiBBZGQgYWxsb2NfaHdfY3R4L2NsZWFuX2h3X2N0eCBvcHMgaW4gZHJpdmVyIGRhdGEK
ICBkcm06IGtpcmluOiBQYXNzIGRyaXZlciBkYXRhIHRvIGNydGMgaW5pdCBhbmQgcGxhbmUgaW5p
dAogIGRybToga2lyaW46IE1vdmUgYWRlIGRybSBpbml0IHRvIGtpcmluIGRybSBkcnYKCiBkcml2
ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL0tjb25maWcgICAgICAgfCAgMTAgKy0KIGRyaXZl
cnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4vTWFrZWZpbGUgICAgICB8ICAgNCArLQogLi4uL2dw
dS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2FkZV9yZWcuaCAgIHwgICAxICsKIC4uLi9ncHUv
ZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMgICB8IDM1MSArKysrKysrLS0tLS0t
LS0tLS0KIC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmMgICB8IDI1
MCArKysrKysrKystLS0tCiAuLi4vZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Ry
di5oICAgfCAgNDggKystCiA2IGZpbGVzIGNoYW5nZWQsIDM2OCBpbnNlcnRpb25zKCspLCAyOTYg
ZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
