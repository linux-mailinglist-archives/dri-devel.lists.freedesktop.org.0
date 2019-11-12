Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6EFAB86
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF3E6EBC5;
	Wed, 13 Nov 2019 07:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6956EB7C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 17:09:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 8so3816608wmo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 09:09:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=q25FqYYq1HlyGPjqgeEbhuqnD600bhraE2cbn15efDk=;
 b=fxHNjgEtT0YaHxXHhq11OtQFDNYDrXdYGdjp9mkUShhTwdk2ORYsMfGkS2zmzmPb2Q
 HpZ6juWgrgRaEvdlQBBas31nOpe+f0PEzYGW8aU0crOq5LEThljGBHx1N2OIqrbu3Zdq
 e/0FhiKqUo4LepjjALYEuZ59C9iSORFH5GTry6tDUgf/NFtHKt0Vx4OFIwYscKafvTm5
 G69ehmB/x2jXnX6GoPodn5iN4TgsmEBNpaiSDOuVo1tNQq2p/UmpTzw2fbUAbaZdyJX3
 KKnK6ZiFCU0QzcIydfel6vede8mEIz3kzWs+1m2P4Zw6hbXNrZOub/9MvN0ajO2adfYS
 4QtQ==
X-Gm-Message-State: APjAAAUkkMA+C67Wvzfw48OyYX8sFfHrUn23Lqfjy3x1CGQNcaB90f17
 RVBhJ7gNJk5KZjqJkJayCGA=
X-Google-Smtp-Source: APXvYqw392tT7DEaSUIK7JTdFQ8zHu8LaLkki7a5br3mb2UbvC8pRr6d4QNExxepW5tBpGF1rKulxg==
X-Received: by 2002:a1c:7412:: with SMTP id p18mr4893680wmc.9.1573578558909;
 Tue, 12 Nov 2019 09:09:18 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id b196sm4413071wmd.24.2019.11.12.09.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 09:09:18 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/print: add DRM_DEV_WARN macro
Date: Tue, 12 Nov 2019 20:09:09 +0300
Message-Id: <20191112170909.13733-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=q25FqYYq1HlyGPjqgeEbhuqnD600bhraE2cbn15efDk=;
 b=DSi3bo6cDFdgW/C5P50IUyxuHVbJaIT1KQDQJxZkX6fp/LeiGw+F1rG3TDvh0ejvLL
 +syJXdzdFaFffRg7au/lmwpJEdUxQszlMT8S0Up5Vg1LSJvN8wf5L8MoRRGxUDoOS9PH
 iVfi8QICo/cylWoEXrNxkZ7VyUM6cZyeQFg0Pzh2/GoHIa+Giazla9tmWg23/3weCbNl
 CW14uWAm8jBHY3j0C2UGlQFhiWMWffPnJ4qHXg6NWdQuNl+Oe88OmSuvxMO7yAhqkVGb
 x16L6LSwcTuWS0Msty4MCBjXhsSnPLhgD9Genkzfg4gs0SpBy0gVXclGzSw/LC1UDeAI
 Cpqg==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBEUk1fREVWX1dBUk4gaGVscGVyIG1hY3JvIGZvciBwcmludGluZyB3YXJuaW5ncwp0
aGF0IHVzZSBkZXZpY2UgcG9pbnRlcnMgaW4gdGhlaXIgbG9nIG91dHB1dCBmb3JtYXQuCkRSTV9E
RVZfV0FSTiBjYW4gcmVwbGFjZSB0aGUgdXNlIG9mIGRldl93YXJuIGluIHN1Y2ggY2FzZXMuCgpT
aWduZWQtb2ZmLWJ5OiBXYW1idWkgS2FydWdhIDx3YW1idWkua2FydWdheEBnbWFpbC5jb20+Ci0t
LQogaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oIGIv
aW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKaW5kZXggNWI4MDQ5OTkyYzI0Li42ZGRmOTFjMGNiMjkg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCisrKyBiL2luY2x1ZGUvZHJtL2Ry
bV9wcmludC5oCkBAIC0zMjksNiArMzI5LDE1IEBAIHZvaWQgZHJtX2Vycihjb25zdCBjaGFyICpm
b3JtYXQsIC4uLik7CiAjZGVmaW5lIERSTV9XQVJOX09OQ0UoZm10LCAuLi4pCQkJCQkJXAogCV9E
Uk1fUFJJTlRLKF9vbmNlLCBXQVJOSU5HLCBmbXQsICMjX19WQV9BUkdTX18pCiAKKy8qKgorICog
V2FybmluZyBvdXRwdXQuCisgKgorICogQGRldjogZGV2aWNlIHBvaW50ZXIKKyAqIEBmbXQ6IHBy
aW50ZigpIGxpa2UgZm9ybWF0IHN0cmluZy4KKyAqLworI2RlZmluZSBEUk1fREVWX1dBUk4oZGV2
LCBmbXQsIC4uLikJCQkJCVwKKwlkcm1fZGV2X3ByaW50ayhkZXYsIEtFUk5fV0FSTklORywgZm10
LCAjI19fVkFfQVJHU19fKQorCiAvKioKICAqIEVycm9yIG91dHB1dC4KICAqCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
