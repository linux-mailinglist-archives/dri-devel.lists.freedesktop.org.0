Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFB029D02
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 19:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DF06E130;
	Fri, 24 May 2019 17:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70F66E131
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 17:32:39 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id x7so3911927ybg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nxi1zwuqndJEn18AdpEkkdQlNqPXeDyt3jpcO1TOWSU=;
 b=ngXODYPv+MtFWgIFjIvKHNL2s8UZs/JslAUF2J5Z88HfU1339VsX6fOyHii4vpR7CY
 Q2p+WsL1cRZ2oSev1WZCXJVBU/tzW2bSkkH4Pn55pIlNXPfpsznBwjR5/JQfmCec/AdM
 wc0wD7r3MPPsTqLtYnuBforWSOCZnjpNHODh4fE+zwdjCDolLx2uLekEXCEGH8Mgih/L
 ALrkWyzHBjWvvzEpvg36ssct432rKnFQ7kfErboqxBvMcxGDORW5mXyShcRHibusCKWP
 gijtzRE3clsUis+VMz5wbMoLW+FTZNnlzHGgsMJBrmbNUBNczL7JMoyVo999ofkackqN
 LC2g==
X-Gm-Message-State: APjAAAUn27vU8mnE2pz7nZXC7HBl1bWIzgsfD2R2xuUtIy2di6grtsrw
 ZwpfXTCjp26rZD7AoW1NMFS0/qPBbzI=
X-Google-Smtp-Source: APXvYqxA8fEtKhzhjbVv+cpIIdWmhzSrXOz4QZdMwEHQFhbwHwzQbYDAGyZce/2VKLRwxnxf+fNpNQ==
X-Received: by 2002:a25:2a86:: with SMTP id
 q128mr28108060ybq.108.1558719158775; 
 Fri, 24 May 2019 10:32:38 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s17sm774437ywg.70.2019.05.24.10.32.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 10:32:38 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dpu: Remove _dpu_debugfs_init
Date: Fri, 24 May 2019 13:32:19 -0400
Message-Id: <20190524173231.5040-2-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524173231.5040-1-sean@poorly.run>
References: <20190524173231.5040-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nxi1zwuqndJEn18AdpEkkdQlNqPXeDyt3jpcO1TOWSU=;
 b=Nw0MCBee/TWTmAxdRVs1IXvAqt1Jv/rkylswgDtTDj9WT/2AwQV8ROQPZCwQUSsPQH
 CU65nugMd4ePhX+UmTx3odq2/HhWQIRrsb4QxiotNxJUz3SdaaGhSTK6WN9ycUPqXkjS
 v+az9kyt50Ha2zamem4lMcJ10IBLtQz3JaTZtTBBDWVXUoaprnws4vWngGzhnu7aROzi
 ew9xCt8+1yQQbkKeBiGlyxlzoq7nQeUYIzOokXTz2PrRcNUR5pB2TkAS1ceWLj8mrECe
 tKOyj/kiYyAgoxQTIPDZNclFfGYzjxziEJtphtj9JZmg1FQroqEIZkGEUCWvj1fHGZsD
 FRng==
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpGb2xkIGl0IGludG8gZHB1
X2RlYnVnZnNfaW5pdC4KCkNjOiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+ClNp
Z25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyB8IDEwICsrLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCmluZGV4IGQ3NzA3MTk2NTQzMS4uMGE4YzMzNGMzYTlm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCkBAIC0yMzEsOCArMjMx
LDkgQEAgdm9pZCAqZHB1X2RlYnVnZnNfY3JlYXRlX3JlZ3NldDMyKGNvbnN0IGNoYXIgKm5hbWUs
IHVtb2RlX3QgbW9kZSwKIAkJCXJlZ3NldCwgJmRwdV9mb3BzX3JlZ3NldDMyKTsKIH0KIAotc3Rh
dGljIGludCBfZHB1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcywgc3RydWN0
IGRybV9taW5vciAqbWlub3IpCitzdGF0aWMgaW50IGRwdV9rbXNfZGVidWdmc19pbml0KHN0cnVj
dCBtc21fa21zICprbXMsIHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKQogeworCXN0cnVjdCBkcHVf
a21zICpkcHVfa21zID0gdG9fZHB1X2ttcyhrbXMpOwogCXZvaWQgKnAgPSBkcHVfaHdfdXRpbF9n
ZXRfbG9nX21hc2tfcHRyKCk7CiAJc3RydWN0IGRlbnRyeSAqZW50cnk7CiAKQEAgLTU3OCwxMyAr
NTc5LDYgQEAgc3RhdGljIGludCBfZHB1X2ttc19kcm1fb2JqX2luaXQoc3RydWN0IGRwdV9rbXMg
KmRwdV9rbXMpCiAJcmV0dXJuIHJldDsKIH0KIAotI2lmZGVmIENPTkZJR19ERUJVR19GUwotc3Rh
dGljIGludCBkcHVfa21zX2RlYnVnZnNfaW5pdChzdHJ1Y3QgbXNtX2ttcyAqa21zLCBzdHJ1Y3Qg
ZHJtX21pbm9yICptaW5vcikKLXsKLQlyZXR1cm4gX2RwdV9kZWJ1Z2ZzX2luaXQodG9fZHB1X2tt
cyhrbXMpLCBtaW5vcik7Ci19Ci0jZW5kaWYKLQogc3RhdGljIGxvbmcgZHB1X2ttc19yb3VuZF9w
aXhjbGsoc3RydWN0IG1zbV9rbXMgKmttcywgdW5zaWduZWQgbG9uZyByYXRlLAogCQlzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIpCiB7Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVy
LCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
