Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26241115998
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 00:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E1C6FAB0;
	Fri,  6 Dec 2019 23:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FAC6FAAC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 23:14:59 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id z90so7685505ilc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 15:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+bCO0qSTsJpgnDH0NSYAfIQh9sSmAX/hx8vy7p3YEc=;
 b=k8rkYWmTKKIl9BplJD4piXejP1cUnu3Rz1zNbwrZoVTAvHgBbKrB/wnTNzuk6o9tbk
 9vz33KasgYDEsT+BP61h88ZuZIBApTYqbw9uon4lQgv7KAvm4gBH/4pYJO0zQ7hXryqV
 B/M1Y2PtzCUrKspQOuEDqxQ+Jk6SQPom7WXldlyvFv7cZ/GxE5GiRH9Nqbzl055mhnOL
 kbeHO4OeYydj3GoMUbs3uKNozIrbADnPOwMegl9TRq0+8SrHOvIQhb0qA2sFR4RWwMUU
 vCV1JGwESXpYU2MnnDWsY+EqCLbNhsKhP3fcg8RCz0til04sMPgGwcdd846Y7IqBzqu3
 GcgA==
X-Gm-Message-State: APjAAAUDB+vHlpTIGaDXgZ86skwF2jCA/omDZeCDLXas4WuHuvjM2xc8
 OXvilmU1/uZzmtTAp/kblCRNry2FiJ4=
X-Google-Smtp-Source: APXvYqyUb3p6TWF/5Y1tQt1qhDpYXT7+c9Ks6efvV7gYz+U+FZ8DrGd412XaRsB2HXJbl4Mm60rr3Q==
X-Received: by 2002:a92:3d49:: with SMTP id k70mr16067531ila.246.1575674098985; 
 Fri, 06 Dec 2019 15:14:58 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id b15sm4317946ilo.37.2019.12.06.15.14.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Dec 2019 15:14:58 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/msm/dpu: Remove unreachable code
Date: Fri,  6 Dec 2019 16:13:47 -0700
Message-Id: <20191206161137.5.I3259a95a1b16978f6b38c23597a9bbba4521cf67@changeid>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
References: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c+bCO0qSTsJpgnDH0NSYAfIQh9sSmAX/hx8vy7p3YEc=;
 b=Z/Xbx5SMGzkmTzlohmFaRjaKSG/233oQvFE0GoAG/NKcc14JXMPJXivMjqsc0SqKZk
 765ac0i7aKxsJGA4+Psdynz1zjogcjcALFhr3BRP9FYr1dm0+kY+TgU7/IfKZaSE1/Mf
 2aTR1awEqLKv/bIObkeI4DKvXPt4DiHt9C1X0=
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
Cc: Bruce Wang <bzwang@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Drew Davenport <ddavenport@chromium.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHJldHVybiBzdGF0ZW1lbnQgZm9sbG93cyBhbm90aGVyIHJldHVybiBzdGF0ZW1lbnQsIHNv
IHdpbGwgbmV2ZXIgYmUKcmVhY2hlZC4KClNpZ25lZC1vZmYtYnk6IERyZXcgRGF2ZW5wb3J0IDxk
ZGF2ZW5wb3J0QGNocm9taXVtLm9yZz4KLS0tCgogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9l
bmNvZGVyX3BoeXNfY21kLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5j
b2Rlcl9waHlzX2NtZC5jCmluZGV4IGNmZDAxYjBhYzdmMS4uY2MyZWNmMzI3NTgyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfY21k
LmMKQEAgLTgxNiw2ICs4MTYsNCBAQCBzdHJ1Y3QgZHB1X2VuY29kZXJfcGh5cyAqZHB1X2VuY29k
ZXJfcGh5c19jbWRfaW5pdCgKIAlEUFVfREVCVUdfQ01ERU5DKGNtZF9lbmMsICJjcmVhdGVkXG4i
KTsKIAogCXJldHVybiBwaHlzX2VuYzsKLQotCXJldHVybiBFUlJfUFRSKHJldCk7CiB9Ci0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
