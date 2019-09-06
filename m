Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66E0AC06D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 21:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D226E0AF;
	Fri,  6 Sep 2019 19:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B66C6E096
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 19:23:55 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id r26so15184266ioh.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 12:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W2yelZaQQgNOeM3tNL1ucPE8YNMsnU8lMoKbAm8AChY=;
 b=ZS5YG/30VLVKyQu8ODwWb0btkdHhcAel6KjGqgGU+mDgTHschmJuzaWzob5gE/7xmR
 x0XbKWBia2/u/RlxIEF8TAk+WQoKLHl8SfThDOSva1e66GG4JWQdbeCpnpNYLVx3qfq9
 LneV//cKsKUkwyqFVVj7S2i3iUJsQYXnaTS6s0XYH6QmAjo4ogz79tC8ATCcYQ74nrjo
 /bPLepzMDNMDDtO6QXFCTkeVimrL6puFOM3/OXK7BUtXkW0ckKYusmIrcgvQVUXPJsFD
 lKxfMcPH295b5Bx6yn4bsUZH/76FmTlUfN1QCp4x1sAmtqNBhT2l+PU58lo5K6KESijc
 aAPw==
X-Gm-Message-State: APjAAAWr0dfOsbvk9R1lj83/LGH/JF6q7URXKIOSpvu3EjGK9kdVaO40
 scatKmUbBeFJBLweB9N0DA1TajWpPjZuOA==
X-Google-Smtp-Source: APXvYqyY9z+bVXK367r0PSgo655xMFstBXHta7tC6uhSnr685D0+632U3Kq50X7yvcGVAdjr9dTt6w==
X-Received: by 2002:a02:b882:: with SMTP id p2mr11801092jam.16.1567797834689; 
 Fri, 06 Sep 2019 12:23:54 -0700 (PDT)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id h70sm10931804iof.48.2019.09.06.12.23.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 12:23:54 -0700 (PDT)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/msm/dpu: Remove unused macro
Date: Fri,  6 Sep 2019 13:23:40 -0600
Message-Id: <20190906192344.223694-2-ddavenport@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906192344.223694-1-ddavenport@chromium.org>
References: <20190906192344.223694-1-ddavenport@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W2yelZaQQgNOeM3tNL1ucPE8YNMsnU8lMoKbAm8AChY=;
 b=B3VuUrCPXYpqko0QYumGcNMUcl2LhhNpt8HxgSsn0nP4Qj3gxIGutfehwIrE/9CNMq
 Y/x74jvwoJ5LfLkSBRpe9Ody0Qe/J7PVA5YgG84CwXB6883006LkjTHM/BKvJ5Ghkbp8
 cqFcByfJzSDo8FoE6q4ujiKJd2RwGPWB9kUNM=
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
Cc: freedreno@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bruce Wang <bzwang@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Davenport <ddavenport@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogRHJldyBEYXZlbnBvcnQgPGRkYXZlbnBvcnRAY2hyb21pdW0ub3JnPgot
LS0KCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmggfCA0IC0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9rbXMuaAppbmRleCA0Yzg4OWFhYmRhZjkuLjZjZWJhMzNhMTc5ZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuaApAQCAtMTM5LDEwICsxMzksNiBAQCBzdHJ1Y3Qg
dnN5bmNfaW5mbyB7CiAKICNkZWZpbmUgdG9fZHB1X2ttcyh4KSBjb250YWluZXJfb2YoeCwgc3Ry
dWN0IGRwdV9rbXMsIGJhc2UpCiAKLS8qIGdldCBzdHJ1Y3QgbXNtX2ttcyAqIGZyb20gZHJtX2Rl
dmljZSAqICovCi0jZGVmaW5lIGRkZXZfdG9fbXNtX2ttcyhEKSAoKEQpICYmIChEKS0+ZGV2X3By
aXZhdGUgPyBcCi0JCSgoc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqKSgoRCktPmRldl9wcml2YXRl
KSktPmttcyA6IE5VTEwpCi0KIC8qKgogICogRGVidWdmcyBmdW5jdGlvbnMgLSBleHRyYSBoZWxw
ZXIgZnVuY3Rpb25zIGZvciBkZWJ1Z2ZzIHN1cHBvcnQKICAqCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
