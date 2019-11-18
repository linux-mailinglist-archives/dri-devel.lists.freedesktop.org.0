Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C91FB10007F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 09:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792C66E121;
	Mon, 18 Nov 2019 08:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FFD89286
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 08:09:12 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q13so10003348pff.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 00:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vRkaKiZ0jcK6pZOODPSHPs05af1EHFvRH6r+NHDvbGM=;
 b=XQHM7kLpwkAQApNN5UjbOujYaQbawtNkaOMJbtwXSmyuVqBPL2uYS69XBhiW6nzXhB
 YVRjosDB8KZIh8X0NigmROc3P76oU3PQDeg2oksp4/e5Wn6SRj7+al89rdDQn2xut1dq
 AJfeHEO61OYb1eylYzemvSnQkbKyP0bHDmLsUCbvUDhWYXZIt5gmvIT/nw8QXgLIbaNL
 +xkeTYqtfReTrxCrGjHc+EKz21hFaafEVG8cg8jqQgHmPZki5wIPgp7/n5MQraBXOSk+
 V1/RAnuhOhl0Nr8tMrmP3p4Ph8t6fOuQGxPSoGjHdDwFrbZhgdXjvccW/iRsu/+e0EDB
 /jCA==
X-Gm-Message-State: APjAAAVgGExCoSJAQZ2qq+8T7O5Oumrf9rNEwXHukZQsMLFul/bWwch2
 HF3aUZtpc/kGrHtAWo6IR0Q=
X-Google-Smtp-Source: APXvYqyqXM4dF/Bi8sS6a38D6GEbquJXQ6xwUz/LmqrrZeJ/7Sma+NSuyAYem4JwyHzl9f78o5JtYw==
X-Received: by 2002:a62:e119:: with SMTP id q25mr33042968pfh.161.1574064551736; 
 Mon, 18 Nov 2019 00:09:11 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id y24sm21273800pfr.116.2019.11.18.00.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 00:09:11 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] fbdev: s1d13xxxfb: add missed unregister_framebuffer in remove
Date: Mon, 18 Nov 2019 16:09:00 +0800
Message-Id: <20191118080900.30634-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Nov 2019 08:36:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vRkaKiZ0jcK6pZOODPSHPs05af1EHFvRH6r+NHDvbGM=;
 b=pmaHxIU+GCD6VEupE1hCmo/hCdEJPDzkAJsMNygngaLbm8RyaEKPo+YTSBEyzbu1St
 Lk2mlA6PYXWbfpGDclJv5JAXeYpd/R9xVBBm5QF1mLaapYKL+2VD0l06tEcqwG+hC+rv
 iZB7f6tuFby6M0JjyMAYEgJSr2V4UYoBjlKRFbWOouMn3X5Fhbkjs25K8vHvJF8327pk
 sejuBgyTiqOMzEflAc1CCskqRuGZexEIO+B86jmueVbjbAFhhWNjrhB8rWYbrBn7Hc1H
 ci7s1jDzU9rvq0Cfz/PpS2VzpdX1YHTUAHyccMaKngTLMtKrI5W95E/+wX6RryrlXVPv
 IfSg==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBjYWxscyByZWdpc3Rlcl9mcmFtZWJ1ZmZlciBpbiBwcm9iZSBidXQgZG9lcyBu
b3QgY2FsbAp1bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyIGluIHJlbW92ZS4KQWRkIHRoZSBtaXNzZWQg
Y2FsbCB0byBmaXggaXQuCgpTaWduZWQtb2ZmLWJ5OiBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZA
Z21haWwuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvczFkMTN4eHhmYi5jIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L3MxZDEzeHh4ZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvczFkMTN4eHhmYi5jCmlu
ZGV4IGUwNGVmYjU2N2I1Yy4uMTYyMDAzZWE2Yjc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L3MxZDEzeHh4ZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3MxZDEzeHh4ZmIu
YwpAQCAtNzI5LDYgKzcyOSw3IEBAIHMxZDEzeHh4ZmJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAJc3RydWN0IHMxZDEzeHh4ZmJfcGFyICpwYXIgPSBOVUxMOwogCiAJaWYg
KGluZm8pIHsKKwkJdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihpbmZvKTsKIAkJcGFyID0gaW5mby0+
cGFyOwogCQlpZiAocGFyICYmIHBhci0+cmVncykgewogCQkJLyogZGlzYWJsZSBvdXRwdXQgJiBl
bmFibGUgcG93ZXJzYXZlICovCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
