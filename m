Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8063AFD79C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 09:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB326E11D;
	Fri, 15 Nov 2019 08:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89506E30C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 13:25:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l1so5665122wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 05:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y+NZFoUdEcf0PJWdPHX/G2eqhW4MUVM4QQTYn0oEj1I=;
 b=az/hOptCHhbIznrI+lGHvmp4/mLRZx89Sh3Id/P1c5RY09h1qzaKt29p8zJuBpFKZ6
 muhYdJC6/zKvI9UgGoIBnXWdTzbdZZ6Ds+ee53LyLXC+FM8sK8maNe0YwkH7yhS1Fyej
 BRWWPxISNsg0LUPLuiyeSiWWBVTPQ3AaQyv4MmtQmxTda4SAKK5DoZ5rcajVTnmH0ptA
 RgH901E25bUYwP1YWu7kYj0tHFwS6/7Qr8j2rCNNBeknKvp2XY9zDBql/nwn0VwuA1a4
 IwkFKtgdWyhRNUCKH6dcLrbWYKUveQ0qIPQL7dpMw3MiS1KGZYe4+0CZ7rpa6bhnjSng
 U7Uw==
X-Gm-Message-State: APjAAAW8YVf+ZlGtWRxWM00FPQJbYiDTPmbytb3xgajmy/cRtNZ5RW3U
 RiEogWuVETSRLFozVFYxB68=
X-Google-Smtp-Source: APXvYqxdDVgViAKJ2YgU7ehgIo/fK4DVrmQv2FVO8JOYUn+KW7EwMEZTGrXyImi3jae5SwSx24noRQ==
X-Received: by 2002:a1c:2e09:: with SMTP id u9mr7768943wmu.108.1573737928601; 
 Thu, 14 Nov 2019 05:25:28 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id l4sm5897905wme.4.2019.11.14.05.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 05:25:28 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, hjc@rock-chips.com
Subject: [PATCH 2/2] drm/rockchip: use DRM_DEV_WARN macro in debug output
Date: Thu, 14 Nov 2019 16:25:20 +0300
Message-Id: <20191114132520.7323-2-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114132520.7323-1-wambui.karugax@gmail.com>
References: <20191114132520.7323-1-wambui.karugax@gmail.com>
X-Mailman-Approved-At: Fri, 15 Nov 2019 08:05:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y+NZFoUdEcf0PJWdPHX/G2eqhW4MUVM4QQTYn0oEj1I=;
 b=CkN+qodGvOgi3HNbVRPFCi2d/Rmb81dIwiBAj8ecN7XnKalPX/eTzj1ufQjZktOPYc
 tZlxPbHyj1g0xIzlwH31cxxmWqqXe7kqTrS4ZaJWbJQ4dtpuDEZCJZbZaFhNLOcUaoya
 nfax5ZQZUKlsOXpqBbFmiLtLqiz03tpU4fUlK/MHW62aO0TQ/6HBb2cldcFVX4LltOmk
 lanEy0j4Mc1NNHCD2Ry6TByzlRM4P2rlz2NEf1JMUXv8Wf/ObZneHSDcOh7K0v4ckgRC
 aupF0h6wmETm+DNx30WlXJJ2ar1bpMKgQQPIky5OWhbcaNENwEZMTHQeLpagqyQAMZ7B
 33+w==
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
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSB0aGUgdXNlIG9mIGRldl93YXJuIGluIGRlYnVnIG91dHB1dCB3aXRoIHRoZSBuZXcg
RFJNIHNwZWNpZmljCkRSTV9ERVZfV0FSTiBkZWJ1ZyBvdXRwdXQgbWFjcm8gdG8gbWFpbnRhaW4g
Y29uc2lzdGVuY3kgYWNyb3NzIHRoZSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBXYW1idWkgS2Fy
dWdhIDx3YW1idWkua2FydWdheEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL2lubm9faGRtaS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvaW5u
b19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvaW5ub19oZG1pLmMKaW5kZXggZTU4
NjRlODIzMDIwLi5kN2VlOGQxODM1YzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9pbm5vX2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvaW5ub19oZG1p
LmMKQEAgLTc5Niw3ICs3OTYsOCBAQCBzdGF0aWMgc3RydWN0IGkyY19hZGFwdGVyICppbm5vX2hk
bWlfaTJjX2FkYXB0ZXIoc3RydWN0IGlubm9faGRtaSAqaGRtaSkKIAogCXJldCA9IGkyY19hZGRf
YWRhcHRlcihhZGFwKTsKIAlpZiAocmV0KSB7Ci0JCWRldl93YXJuKGhkbWktPmRldiwgImNhbm5v
dCBhZGQgJXMgSTJDIGFkYXB0ZXJcbiIsIGFkYXAtPm5hbWUpOworCQlEUk1fREVWX1dBUk4oaGRt
aS0+ZGV2LAorCQkJICAgICAiY2Fubm90IGFkZCAlcyBJMkMgYWRhcHRlclxuIiwgYWRhcC0+bmFt
ZSk7CiAJCWRldm1fa2ZyZWUoaGRtaS0+ZGV2LCBpMmMpOwogCQlyZXR1cm4gRVJSX1BUUihyZXQp
OwogCX0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
