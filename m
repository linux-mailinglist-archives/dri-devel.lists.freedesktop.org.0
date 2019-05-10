Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298A19F2C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 16:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB45D89DA8;
	Fri, 10 May 2019 14:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABEE89DA7;
 Fri, 10 May 2019 14:30:06 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a17so5543918qth.3;
 Fri, 10 May 2019 07:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=or9D5WuW8eJkNri9s9UWGSGro2pvBkeC2DMXbybI4JQ=;
 b=AyUDWCse2w5F5ENt2qmPtX1JMrk0cmHQvERzZm0tB0fZtLELy5gS+oVd3WzaOQ5J7n
 1Fnn6nyFf1DP7o+CFD7hBtTxgwrLvdGehcABl3raHX7YVa9slUmZh+wvKfTERXIYl9qo
 i5aGYelCSV5O8y2IGlO3SW2F3iC+2fE6iOpBbIg9pu6ix7z3vNEHRKPZOYt3bWrD41zI
 j4Iw4pDDbW3kfVioSKYaPA2VzA3BWRUWMSwrph+XpxKPJAPW8wWV2xEnUXtm/Aqszewg
 12dMgriJqE6hP4xHKZ8znVti6fvDnfp6LIsMgdjQ3nKyTNx0NeJ9+WjUqnxajKzA+GgI
 csgw==
X-Gm-Message-State: APjAAAX6GoSx0SGYF4Bl9yJdq3fy4Ofz/pCAFyVUFTvb9rF78ookBBSo
 lTqK+mC8jFvPIoaD1jfoqSlX9wCR
X-Google-Smtp-Source: APXvYqxS9xpjpoGJjxzz3CiPX5SnUuN70/CtXrfYmlqinEBYoi1vRo31B9EkqaeXS0iNx3mPRUJNWA==
X-Received: by 2002:ac8:2f6c:: with SMTP id k41mr9624277qta.371.1557498605231; 
 Fri, 10 May 2019 07:30:05 -0700 (PDT)
Received: from localhost.localdomain ([71.219.84.143])
 by smtp.gmail.com with ESMTPSA id r4sm2778208qkb.20.2019.05.10.07.30.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 10 May 2019 07:30:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "vgaarb: Keep adding VGA device in queue"
Date: Fri, 10 May 2019 09:29:58 -0500
Message-Id: <20190510142958.28017-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=or9D5WuW8eJkNri9s9UWGSGro2pvBkeC2DMXbybI4JQ=;
 b=Su+2nvWT29MwnECgRTWEqgq7qhm3L9uje5OkoZb+JkX0QOaYpany2OGf9dzSylHjST
 wOndxkauXccBttPMxe6QU5oHhfi3pqkXOpOo1Yl/wV4AsE9u5kzLgi217TkU58cluqCb
 xchYjL4lZu8mThKdjDFICaIDliXABxRBJnKr+BOnm2ncAH5e1DLXIBIvi/o8LrXjrYcG
 sQuZG2RRQ1ARe6EK7nWCE/p6GAJw8cpucbCZSnqdD0d7VSwDwCg/CONj7J9/lKf8npRK
 8yQLxK9WXJeQuMgoQlog2d4jEvSJ6UF/AXYpFYm4VCRJnGjmthuaq6fmqH6Hd9D3ewzS
 ebBw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Aaron Ma <aaron.ma@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBicmVha3MgbXVsdGlwbGUgZ3JhcGhpY3MgY2FyZHMgaW4gdGhlIEFtaWdhb25lIHg1MDAw
Cm9uIFBQQy4KClRoaXMgcmV2ZXJ0cyBjb21taXQgM2Q0MmYxZGRjNDdhNjljMGNlMTU1ZjlmMzBk
NzY0YzRkNjg5YTVmYS4KCkJ1ZzogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9MTA5MzQ1ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KQ0M6IEFhcm9uIE1hIDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L3ZnYS92Z2FhcmIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L3ZnYS92Z2Fh
cmIuYyBiL2RyaXZlcnMvZ3B1L3ZnYS92Z2FhcmIuYwppbmRleCBmMmYzZWY4YWYyNzEuLjhhM2M0
NTIxOWEyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvdmdhL3ZnYWFyYi5jCisrKyBiL2RyaXZl
cnMvZ3B1L3ZnYS92Z2FhcmIuYwpAQCAtNzI1LDcgKzcyNSw3IEBAIHN0YXRpYyBib29sIHZnYV9h
cmJpdGVyX2FkZF9wY2lfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogCXZnYV9hcmJpdGVy
X2NoZWNrX2JyaWRnZV9zaGFyaW5nKHZnYWRldik7CiAKIAkvKiBBZGQgdG8gdGhlIGxpc3QgKi8K
LQlsaXN0X2FkZF90YWlsKCZ2Z2FkZXYtPmxpc3QsICZ2Z2FfbGlzdCk7CisJbGlzdF9hZGQoJnZn
YWRldi0+bGlzdCwgJnZnYV9saXN0KTsKIAl2Z2FfY291bnQrKzsKIAl2Z2FhcmJfaW5mbygmcGRl
di0+ZGV2LCAiVkdBIGRldmljZSBhZGRlZDogZGVjb2Rlcz0lcyxvd25zPSVzLGxvY2tzPSVzXG4i
LAogCQl2Z2FfaW9zdGF0ZV90b19zdHIodmdhZGV2LT5kZWNvZGVzKSwKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
