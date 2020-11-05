Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED78C2A816E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D276ED90;
	Thu,  5 Nov 2020 14:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6267C6ED90
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h2so1874513wmm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ni2p/a1qgnbLwmmB/hD7NYV4hNmI7rYb9FSLzDt4vrQ=;
 b=P5kJIDqACB9jb6uMDWpBlxNm+8vQEgqLkWzRYli9z9drKI0ges+7m1XSxTElgGB3AT
 E0oeyDVSkgcv4ri+lAhxW9W1Rjd8mQSlGYbxwL6AFS5FAuMyfuFtdGv5mt4QXrMh4xfT
 zYHCgi3xcD3xAO69tRlyoU+DebIeOUPOcXIMIoBVt0wxrx5LPjYM2Zz8nk+c9XlApErS
 4mcJX7FEKH6tTZ+yIbjj7wxpsVd96+HHXxotJ+je7auaSELL8vfBLiBi5PoFeqpLcEsP
 Isi9cCHdhXswdhNbCfZm4nRVZ/OrcvswD2J1qP0rf3tRDIkmsGHB2ajoqWYR1HwYfYYd
 ZR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ni2p/a1qgnbLwmmB/hD7NYV4hNmI7rYb9FSLzDt4vrQ=;
 b=LUKAw2O19CWADAnx57VAF8ayZn6fKGl839/iiD3Ot2R30Ay9o/93VdueVCcpEqUjBo
 IlqK+CTIUIp6jAcO7S+l8RjRv2EZa5eEv2hig7rXSzl+q+X2IGLxrg92s+PpjLB9OIRi
 4kVCksKDMQCWTsviq0GIcMDCFK4wt7FKI9HoxELLbd5fEGZmdHWUX5FnEBEV5RtETrzH
 /ZP7Tewpy+HbPIyKTBe91L5REnvT+a/9snqNay2elRbUtVy3QzqOjta0hgzRWQxpJe9Q
 ylRQY1jwTZXZfzbX2QElOgU9sKZ8hhlAK/X3prdZgazlKk+PhH2QQkdbIUThiofwArcL
 TRug==
X-Gm-Message-State: AOAM530AbhZzCuUoUE9w22zpIyxHBnrZ49bQ3cXmfJ5qjyJahulRERfi
 ispB/OJtEXhjpwBd9t2m+QiAOg==
X-Google-Smtp-Source: ABdhPJwGZM99j8rfQFi86ZhM62w2thIu1iqbxZXuL7hmcT0j5pcCOVuEnqqDxPlt4cOh8LO2oNVTyA==
X-Received: by 2002:a1c:81c9:: with SMTP id c192mr3079205wmd.1.1604587937121; 
 Thu, 05 Nov 2020 06:52:17 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:16 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/19] gpu: ipu-v3: ipu-di: Strip out 2 unused
 'di_sync_config' entries
Date: Thu,  5 Nov 2020 14:45:00 +0000
Message-Id: <20201105144517.1826692-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0YWtpbmcgdXAgdG9vIG11Y2ggc3BhY2Ugb24gdGhlIHN0YWNrLgoKRml4ZXMgdGhl
IGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9ncHUvaXB1
LXYzL2lwdS1kaS5jOiBJbiBmdW5jdGlvbiDigJhpcHVfZGlfc3luY19jb25maWdfbm9uaW50ZXJs
YWNlZOKAmToKIGRyaXZlcnMvZ3B1L2lwdS12My9pcHUtZGkuYzozOTE6MTogd2FybmluZzogdGhl
IGZyYW1lIHNpemUgb2YgMTA2NCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxMDI0IGJ5dGVzIFstV2Zy
YW1lLWxhcmdlci10aGFuPV0KCkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPgpDYzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgpDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2lwdS12My9pcHUtZGkuYyB8IDQgLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvaXB1LXYzL2lwdS1kaS5jIGIvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1kaS5jCmluZGV4IGI0
YTMxZDUwNmZjY2YuLmU2MTdmNjBhZmVlYTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2lwdS12
My9pcHUtZGkuYworKysgYi9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWRpLmMKQEAgLTMxMCwxMCAr
MzEwLDYgQEAgc3RhdGljIHZvaWQgaXB1X2RpX3N5bmNfY29uZmlnX25vbmludGVybGFjZWQoc3Ry
dWN0IGlwdV9kaSAqZGksCiAJCQkvKiB1bnVzZWQgKi8KIAkJfSAsIHsKIAkJCS8qIHVudXNlZCAq
LwotCQl9ICwgewotCQkJLyogdW51c2VkICovCi0JCX0gLCB7Ci0JCQkvKiB1bnVzZWQgKi8KIAkJ
fSwKIAl9OwogCS8qIGNhbid0IHVzZSAjNyBhbmQgIzggZm9yIGxpbmUgYWN0aXZlIGFuZCBwaXhl
bCBhY3RpdmUgY291bnRlcnMgKi8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
