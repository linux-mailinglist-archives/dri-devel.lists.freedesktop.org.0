Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A8B3514E7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 14:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781986E22B;
	Thu,  1 Apr 2021 12:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCA46E22B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 12:52:15 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id w3so2716677ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QNOeEbOGzk9qdmE0JGDABldw/AVbwKBdOFcs754WKaY=;
 b=UUTfTu6N3+X2/z7jzSr7M+b89kxuBynDdUfPfuqCMpk6B4W6lCvS2r+LeUr4JhZknr
 Agp8qzFou0mi+xUBYbqoIxUbQSvHGELVPWChHiHKEWP+J84GJN9QLTZuSChqR7YHUNhN
 DL+KGorMZgQMZR7K0+0p8+pnrI7obAePKPNahRTjBT/OS8877ki9q4D6c1fAdwtQxIhz
 FGZYcG8+aAGhNfda4oYchcgkE5AWD297RffT3w7inPRg8ahDrQYrT5GxLLr2hsu5G9Sv
 9y38V/IbGI5ZfQbHX4TwGnCaUstcffgMHyzT3fnmmOlpNNxXu0klBlIqAnOevwMjSswQ
 OOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QNOeEbOGzk9qdmE0JGDABldw/AVbwKBdOFcs754WKaY=;
 b=PSgD7cLSDEVOkTstYKPHHn8E8esd3J8Fap5glt+FNPqbkuntIrw7do95NDUPub9pSL
 opYnHOISAzBaQ2A3TKLhItSyEUVZuvXjbQUqvGaXtFAfxK0TnZhKa0v/+sumIMOF+SeZ
 Dhbul4kJYK9o8acO+QyKCSbpjjE5tNwXqSjAji6Sd0iwQ7i7a27BNGwGu1MmUgg5977i
 PnbcuJQQsTPZGUcFtKeFwEfo6VMi8cQiLVwW6V9DkzD225VZQEvsBSV0YM9teuxCbqjM
 jX34yqJQozvZr/j7+9DNrfgy3NHwiRkJw19Zwyw0a9GoGo1LRUAsSIZoU6ZIyxVLuTz3
 41Ag==
X-Gm-Message-State: AOAM532G+Q7QYobkoNBNM4snTv6gLH6Y0mGh6cWj09ih9nC3LtPnwHep
 TIpz7KOdd1s2DSFbXPtZgFtj03HJnKc=
X-Google-Smtp-Source: ABdhPJxOW4GoLvYWM24bea9peUTr69CtZaNAxj2wpEVKhjb4ebyvUEsW6CrEAvyq8QX6nFe9McP3xQ==
X-Received: by 2002:a17:906:cb18:: with SMTP id
 lk24mr8741330ejb.70.1617281534544; 
 Thu, 01 Apr 2021 05:52:14 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5e61:f097:a144:e23])
 by smtp.gmail.com with ESMTPSA id o6sm3397882edw.24.2021.04.01.05.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 05:52:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sched: add missing member documentation
Date: Thu,  1 Apr 2021 14:52:13 +0200
Message-Id: <20210401125213.138855-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: sfr@canb.auug.org.au
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBmaXggYSB3YXJuaW5nLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpSZXBvcnRlZC1ieTogU3RlcGhlbiBSb3Rod2VsbCA8c2Zy
QGNhbmIuYXV1Zy5vcmcuYXU+CkZpeGVzOiBmMmYxMmViOWMzMmIgKCJkcm0vc2NoZWR1bGVyOiBw
cm92aWRlIHNjaGVkdWxlciBzY29yZSBleHRlcm5hbGx5IikKLS0tCiBpbmNsdWRlL2RybS9ncHVf
c2NoZWR1bGVyLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaCBiL2luY2x1ZGUvZHJtL2dwdV9zY2hl
ZHVsZXIuaAppbmRleCAxYzgxNWUwYTE0ZWQuLmY4ODhiNWU5NTgzYSAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oCisrKyBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIu
aApAQCAtMjc3LDYgKzI3Nyw3IEBAIHN0cnVjdCBkcm1fc2NoZWRfYmFja2VuZF9vcHMgewogICog
QGhhbmdfbGltaXQ6IG9uY2UgdGhlIGhhbmdzIGJ5IGEgam9iIGNyb3NzZXMgdGhpcyBsaW1pdCB0
aGVuIGl0IGlzIG1hcmtlZAogICogICAgICAgICAgICAgIGd1aWx0eSBhbmQgaXQgd2lsbCBiZSBj
b25zaWRlcmVkIGZvciBzY2hlZHVsaW5nIGZ1cnRoZXIuCiAgKiBAc2NvcmU6IHNjb3JlIHRvIGhl
bHAgbG9hZGJhbGFuY2VyIHBpY2sgYSBpZGxlIHNjaGVkCisgKiBAX3Njb3JlOiBzY29yZSB1c2Vk
IHdoZW4gdGhlIGRyaXZlciBkb2Vzbid0IHByb3ZpZGUgb25lCiAgKiBAcmVhZHk6IG1hcmtzIGlm
IHRoZSB1bmRlcmx5aW5nIEhXIGlzIHJlYWR5IHRvIHdvcmsKICAqIEBmcmVlX2d1aWx0eTogQSBo
aXQgdG8gdGltZSBvdXQgaGFuZGxlciB0byBmcmVlIHRoZSBndWlsdHkgam9iLgogICoKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
