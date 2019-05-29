Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5713C2FB0D
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475206E33D;
	Thu, 30 May 2019 11:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9267C6E07B;
 Wed, 29 May 2019 15:20:26 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id a23so1856149pff.4;
 Wed, 29 May 2019 08:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5iqwr/7+M82RVAcvJU/35r6kJQYabEd1hdFwDzBIfsI=;
 b=PF10gCl0Q3IkoCutCitV59/j4loQ4zbtqnqgHY6H2IiwrbRjGjLtx66oVh8m0PQpre
 lwux+vhizU90wO7O6b+ogUgi5Dzbis7MhBy9DAN2flzD7z38gcG2CjIeR06n3sYXZgsY
 kUTEjQy7Q9F0gPp+YvuTs+sOPy8A5eXUMJUUVHxsMXi5MH2oIcl0MZtVCzH2k0xo9nK5
 fDDljvvXDvzqmY1PWYIJIG7nlKjwbjzSGGxSMtpVCJAvgJ0bbe/Jsk+WfBeuUpUlpZqX
 5RjFG2exHSr138h/Vt2iKM62x8ws6mEsRNW5infxMGuBkuQugLIcfhjFEadrGAlJkwPY
 aOPA==
X-Gm-Message-State: APjAAAUDkgDVKe5cHJdHdmxpBdnxrKPw0hX6g6WRv/ZZIj1cEziJyOZh
 ZkchuQtsNBa6jUeJY+DIra8=
X-Google-Smtp-Source: APXvYqyOuPe0zGzQzJN6XRqrZI+J8Li1vF424ttFYbkWS0vC3iafV8NwogFreW6kAYpb/2JMsJpH6g==
X-Received: by 2002:a62:b517:: with SMTP id y23mr67062939pfe.182.1559143226275; 
 Wed, 29 May 2019 08:20:26 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id r7sm6198321pjb.8.2019.05.29.08.20.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 08:20:25 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 jcrouse@codeaurora.org
Subject: [PATCH v2 0/2] Adreno A540 support
Date: Wed, 29 May 2019 08:20:20 -0700
Message-Id: <20190529152022.42799-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 30 May 2019 11:39:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5iqwr/7+M82RVAcvJU/35r6kJQYabEd1hdFwDzBIfsI=;
 b=fsBv+734WhTc/44VN1m5ZCh1naG2R/7mQ+Hj0zYsjd3OQVJwmv2f0sjuneVEbJzXJ3
 FugudjrH2ld/EftiuKn6pgVHNgidVCRYa8/yeQ0UpUF58clxxoWwpYTqVnHO9HC08NEn
 SuR1w3GNWdMdOZp9t+9QA8q48+zFSxUM4mcqClQzfCACHvIZ3cq8PPdX2bhtlNqbB8IK
 p5K+Qd8vVIZbq83L53Rp45Y/nX9SIgSvqguXJdpMdSLsttJGTr0OgJ9bU5qEBZmhsUsh
 9x3F6/ur3yAk2otK90wftqpH7gpKqLEe0wOyPcvquzjyIHohsS9nztMPalc94xdF36KV
 rwJQ==
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
Cc: marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRyZW5vIGRyaXZlciBzdXBwb3J0IGZvciB0aGUgQTU0MCBmb3VuZCBpbiB0aGUgTVNNODk5OCBT
b0MKCnYyOgotUmVtb3ZlZCBleHRyYSBSQkJNIHdyaXRlCi1Db3JyZWN0ZWQgYWRkZWQgUkJCTSB3
cml0ZXMgdG8gYWxsb3cgZm9yIGh3Y2cgZGlzYWJsZQotUGF0Y2ggdG8gYWRkIFJFR19BNVhYX0hM
U1FfREJHX0VDT19DTlRMIHRvIGVudnl0b29scwotUmVnZW5lcmF0ZWQgYTV4eCBoZWFkZXIgZmls
ZSB3aXRoIHVwZGF0ZWQgZW52eXRvb2xzCi1Vc2VkIFJFR19BNVhYX0hMU1FfREJHX0VDT19DTlRM
IGluIGNvZGUKLVN0cmlwcGVkIGV4dHJhbmlvdXMgbWFnaWMgbnVtYmVyIGNvbW1lbnQKCkplZmZy
ZXkgSHVnbyAoMSk6CiAgZHJtL21zbS9hZHJlbm86IEFkZCBBNTQwIHN1cHBvcnQKCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4LnhtbC5oICAgICAgfCAyOCArKysrLS0tLQogZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYyAgICAgIHwgMjEgKysrKysrCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X3Bvd2VyLmMgICAgfCA3NiArKysrKysrKysrKysrKysr
KysrKystCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNlLmMgfCAxOCAr
KysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5oICAgIHwgIDYgKysK
IDUgZmlsZXMgY2hhbmdlZCwgMTMzIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
