Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB717D350
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 04:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AF56E326;
	Thu,  1 Aug 2019 02:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813C26E326
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 02:25:21 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id c3so9876162pfa.13
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 19:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0b83mFxyRn6zkAdnvu0XGM34loYRjow/prwSt7efn18=;
 b=f2nPX7gZKXDAV2BKcEomGFpUSHqBndwem8inNrIku35JNIbnHnrAhvLZPIUYgRqhvX
 SAFcVh/MpwbjoR/3dvsKB0oc2iiLGBy5AhNtI9Fm09Iew2tfrYabP2Nco14JRkAV+Ybm
 sM2TMos4kRnIaC4xKUX7AeNxr1ypk0TDZtOY2aENEkp7/+2UkKCiXaC89FvYqr9Q21FQ
 rk0nYnJ1fLGgBVTEWdUFxZ5pro0tr9RCXSbINSg6hVJtz3PW8rURG5gLRyqvunHUq49H
 8qVbzMnKnE1DA0p8PrAzT/qzIQlCl2oWNkBHG4m5oSJvBwWa657HbIem4ReoxTRiVTLr
 0m2Q==
X-Gm-Message-State: APjAAAWfzCJywLyvEObd7dPH8pdHkESc3T/W/IGMjq0JsZvwYroDHnLX
 iELJmQIUbCZG1vZ6X83NtuGOP5i2Zkg=
X-Google-Smtp-Source: APXvYqzzhOlGXx56ebH4YuRooIUVEixjqggst9Kp0B3MVZGz8WyZ9yS++AAczoTU245+naH/0lr3sg==
X-Received: by 2002:a63:58c:: with SMTP id 134mr121724532pgf.106.1564626320863; 
 Wed, 31 Jul 2019 19:25:20 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id v184sm64911342pgd.34.2019.07.31.19.25.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 31 Jul 2019 19:25:20 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 0/6] udmabuf guest <--> host interaction model
Date: Wed, 31 Jul 2019 19:25:11 -0700
Message-Id: <20190801022517.1903-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0b83mFxyRn6zkAdnvu0XGM34loYRjow/prwSt7efn18=;
 b=gAGN5Vhc/Hq1t4lY3qSZ5rgfopzZSs/tIlrsu1p9XOYhmQsBZUyBOi/uiEikWwcoRw
 aKfiM9i3JXT32wbtHBGcCxbTIhFLFN3W8Xeq6txcDmggI/vQ5rCG8N4Ysjw3X01Ps48k
 3DCG10f7MKaI7UDiIhQVCmRQA97RnJdb7r3eM=
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBkZXNpcmFibGUgdG8gdXNlIHplcm8tY29weSBtZWNoYW5pc21zIHdoZW4gdXNpbmcgdmFy
aW91cyBncmFwaGljcwpidWZmZXJzLiBXaXRoIHVkbWFidWYsIHR3byBjYXNlcyBjb21lIHRvIG1p
bmQ6CgoxKSBEaXJlY3RseSBzY2FuLW91dCBhIGd1ZXN0LW1hcHBlZCBidWZmZXIKMikgSW1wb3J0
IGludG8gVksgd2l0aCBWS19FWFRfZXh0ZXJuYWxfbWVtb3J5X2RtYV9idWYKCkhvd2V2ZXIsIGRp
c3BsYXlzIGFyZSBub3QgZ2VuZXJhbGx5IGNvaGVyZW50IHdpdGggdGhlIENQVSBhbmQgbWFueQpH
UFVzIGFyZW4ndCBlaXRoZXIuICBTbyB3ZSBuZWVkIHRvIG1hcCB3cml0ZS1jb21iaW5lIGluIHRo
ZSBndWVzdC4KT25lIHdheSB0byBhY2hpZXZlIHRoaXMgaXMgdG8gc3luY2hyb25pemUgb24gdGhl
IGhvc3QuCgpbd2FybmluZ10gLS0gb25seSBjb21waWxlIHRlc3RlZCBhdCB0aGlzIHBvaW50IHRv
IGdldCBmZWVkYmFjawoKR3VyY2hldGFuIFNpbmdoICg2KToKICB1ZG1hYnVmOiB1c2UgY2FjaGVf
c2d0X21hcHBpbmcgb3B0aW9uCiAgdWRtYWJ1ZjogYWRkIGFiaWxpdHkgdG8gc2V0IGFjY2VzcyBm
bGFncyBvbiB1ZG1hYnVmCiAgdWRtYWJ1ZjogZW5mb3JjZSBhY2Nlc3MgZmxhZ3MKICB1ZG1hYnVm
OiBhZGQgYSBwb2ludGVyIHRvIHRoZSBtaXNjZGV2aWNlIGluIGRtYS1idWYgcHJpdmF0ZSBkYXRh
CiAgdWRtYWJ1Zjogc2VwYXJhdGUgb3V0IGNyZWF0aW5nL2Rlc3Ryb3lpbmcgc2NhdHRlci10YWJs
ZQogIHVkbWFidWY6IGltcGxlbWVudCBiZWdpbl9jcHVfYWNjZXNzL2VuZF9jcHVfYWNjZXNzIGhv
b2tzCgogZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyAgICB8IDEwMyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLQogaW5jbHVkZS91YXBpL2xpbnV4L3VkbWFidWYuaCB8ICAgNSAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
