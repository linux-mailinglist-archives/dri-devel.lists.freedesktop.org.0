Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FB4EBEFD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C0389C2A;
	Fri,  1 Nov 2019 08:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C2F6F71F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 06:54:39 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id t8so11796749qtc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 23:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hcGqjrsVYd4m1KPrxn+0lQoybxEDVr6kOaUDeRE6zmI=;
 b=beNc6rR+hHi6PMEacdMxfv+9W07foLW+h5L0oUZos6rjhSy52AqgwjMQt7MwJlH83p
 xEoE2qoEOdT+VExqA6GE5ra983aXGRpuCYogwoDOBPDnlXGRGCY1CxQSJGLYASZi2PSx
 wJymt1FVEpNXO0nQiN8NSMrGZz5WKI8+0ETnAeT5pSFgqksJliK3Z9K9JcZ+KDm1qhjv
 uWmzDUxOUWXM+Tuzvfpjmg2u4KvcOF0hongpn04JAO5VeFi853waJi+qHbMDc228fBx0
 3b8TfPl6h8bWe56nZkEV/xzC5LJ0+NOausha6DeGi+8Y7jP8pg3Dru/9yh2Vc0MxQFfz
 XRXA==
X-Gm-Message-State: APjAAAX2hakzLCrZl0jPNJERKjPoPdZ8JV7B/pz2h4cBTag5bMR+CmyL
 4/tIXquqpy2nLzqXqxZWcsE=
X-Google-Smtp-Source: APXvYqzWB71qt7jFB3h9cadZxz2r7DadcHLtG6Q1EeWOKfkO7sZShn+DY0xNr/yn0PX/qv8L6m+Y7Q==
X-Received: by 2002:ac8:67c1:: with SMTP id r1mr8955296qtp.83.1572591278529;
 Thu, 31 Oct 2019 23:54:38 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id l93sm3203382qtd.86.2019.10.31.23.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 23:54:37 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] backlight: lp855x: disable enable regulator when remove
Date: Fri,  1 Nov 2019 14:53:33 +0800
Message-Id: <20191101065333.7004-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hcGqjrsVYd4m1KPrxn+0lQoybxEDVr6kOaUDeRE6zmI=;
 b=YeVxXAqVWVDIPdLaehRkoXfjySSQfTzBU/ZBCLkDK28tHxsHSRsfrINkW3yjNGBmun
 hG9hZ1Znj3jgqaoZJ2bep3bT4/jiin/tFz5WtYzdyEjtqOBdJN0Xe/bKRNKHv6VH7/7x
 RgM8qqPz9l2xbeayjvxsmu2ugv9F2QbBFOv0W79xJ4NimVanGI8SrdpEXHDTlXBD9QjZ
 Z5/L5HuopLPx+LH4Ipubnn2fXsIsCk8vijciSI9Z6nDuXMa4cx5Lo13aynE423+zuqQP
 Q8e1nOv5mqq4T1L+q7XVK3sm8VSJUUSh68UYnK+iO3YRoCdjTIFQ1Q23j7vjRs0dloKS
 qpXQ==
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
Cc: Milo Kim <milo.kim@ti.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Chuhong Yuan <hslester96@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bHA4NTV4IGZvcmdldHMgdG8gZGlzYWJsZSBlbmFibGUgcmVndWxhdG9yIHdoZW4gcmVtb3ZlLgpB
ZGQgYSBjYWxsIHRvIHJlZ3VsYXRvcl9kaXNhYmxlIGluIHJlbW92ZSBqdXN0IGxpa2Ugd2hhdCBp
cyBkb25lIHRvCnN1cHBseSByZWd1bGF0b3IuCgpTaWduZWQtb2ZmLWJ5OiBDaHVob25nIFl1YW4g
PGhzbGVzdGVyOTZAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xwODU1
eF9ibC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xwODU1eF9ibC5jIGIvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvbHA4NTV4X2JsLmMKaW5kZXggZjY4OTIwMTMxYTRhLi40ZmNmOWVjMTg4NjggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xwODU1eF9ibC5jCisrKyBiL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L2xwODU1eF9ibC5jCkBAIC00OTksNiArNDk5LDggQEAgc3RhdGlj
IGludCBscDg1NXhfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbCkKIAliYWNrbGlnaHRfdXBk
YXRlX3N0YXR1cyhscC0+YmwpOwogCWlmIChscC0+c3VwcGx5KQogCQlyZWd1bGF0b3JfZGlzYWJs
ZShscC0+c3VwcGx5KTsKKwlpZiAobHAtPmVuYWJsZSkKKwkJcmVndWxhdG9yX2Rpc2FibGUobHAt
PmVuYWJsZSk7CiAJc3lzZnNfcmVtb3ZlX2dyb3VwKCZscC0+ZGV2LT5rb2JqLCAmbHA4NTV4X2F0
dHJfZ3JvdXApOwogCiAJcmV0dXJuIDA7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
