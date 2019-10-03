Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DFFCB138
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 23:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552936EA7C;
	Thu,  3 Oct 2019 21:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59516EA7C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 21:35:05 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id v4so2558602pff.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 14:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7AHHcEKrWBM5y9wBFl/C7jzA4xtd9EY/YdeDi/hosms=;
 b=SbXaOHwzx96adlymXn4ZFXnpt8dOOKPpGXg6/PqDeCTWf+FyXzA13kNcPghajfwfs6
 yZZaX2vVzjIxhXbAA316EpBaicAeQyFEjO17E2F48RsPz5F/TZdC+A6/xjKDsvlBYogS
 jTmfmAQ254pPl8U8Mc/0COgcnq2TuC2pcdEnG297ZhgW3+EyzTB/pziyemwHG5iHXWIf
 CEu0B0kf+nobwG8i6nd5zjsspyR1d0OveHDgDsSddXlfHbMKjSCBLVdXobq9Qnlo3PgJ
 oeM/R7UggM1knC+c/NN+SxxZy+OiRC9qr1eknxW95F3+Qo5CE9wkDzYYjMMCAAZjEMI9
 fN0Q==
X-Gm-Message-State: APjAAAUlqdqmB59wEVsH3tk47MjybSafen0zaZObSOJIFhclxZ11Rme8
 Vu38rfbnVNUAxWee5eIfkR9KPA==
X-Google-Smtp-Source: APXvYqwzXDfyh4cXIWrG9bwfnxsIwKRIIusw5EU7eFwaLpQRN0oyj60CNEvRM3XFeIwxxnCXAkV7kA==
X-Received: by 2002:a63:4d4e:: with SMTP id n14mr11552757pgl.88.1570138505256; 
 Thu, 03 Oct 2019 14:35:05 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id 30sm3240647pjk.25.2019.10.03.14.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2019 14:35:04 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] backlight: pwm_bl: Add missing curly branches in else branch
Date: Thu,  3 Oct 2019 14:35:02 -0700
Message-Id: <20191003213502.102110-1-mka@chromium.org>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7AHHcEKrWBM5y9wBFl/C7jzA4xtd9EY/YdeDi/hosms=;
 b=ASTwwcBDLKFauBJRi7fwuLBmPbFmPW/3m9tG2zvZzcpcFnfrephyeKAqsoDz/Gbc66
 sNU/cLXRpwM2QQGC5Tx0G9jDeC8pwZEfAnjhJVs59CzNawD20uQqRrHq58tGrC/fQblp
 hNqMsIa+vM2uuIefpEywLO5YYokaczyteqWGA=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGN1cmx5IGJyYWNlcyB0byBhbiAnZWxzZScgYnJhbmNoIGluIHB3bV9iYWNrbGlnaHRfdXBk
YXRlX3N0YXR1cygpCnRvIG1hdGNoIHRoZSBjb3JyZXNwb25kaW5nICdpZicgYnJhbmNoLgoKU2ln
bmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Ci0tLQoKIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9wd21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCmlu
ZGV4IDc0NmVlYmM0MTFkZi4uMTMwYWJmZjI3MDVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9wd21fYmwuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwu
YwpAQCAtMTI1LDggKzEyNSw5IEBAIHN0YXRpYyBpbnQgcHdtX2JhY2tsaWdodF91cGRhdGVfc3Rh
dHVzKHN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibCkKIAkJc3RhdGUuZHV0eV9jeWNsZSA9IGNv
bXB1dGVfZHV0eV9jeWNsZShwYiwgYnJpZ2h0bmVzcyk7CiAJCXB3bV9hcHBseV9zdGF0ZShwYi0+
cHdtLCAmc3RhdGUpOwogCQlwd21fYmFja2xpZ2h0X3Bvd2VyX29uKHBiKTsKLQl9IGVsc2UKKwl9
IGVsc2UgewogCQlwd21fYmFja2xpZ2h0X3Bvd2VyX29mZihwYik7CisJfQogCiAJaWYgKHBiLT5u
b3RpZnlfYWZ0ZXIpCiAJCXBiLT5ub3RpZnlfYWZ0ZXIocGItPmRldiwgYnJpZ2h0bmVzcyk7Ci0t
IAoyLjIzLjAuNDQ0LmcxOGVlYjVhMjY1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
