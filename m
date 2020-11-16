Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B30582B4DCB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071386EA0D;
	Mon, 16 Nov 2020 17:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3B26E9FA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:19 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 19so59170wmf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ni2p/a1qgnbLwmmB/hD7NYV4hNmI7rYb9FSLzDt4vrQ=;
 b=y1M2raZYDC6gpB5Mcfn5HK0VPQYg/d3IyD5wEaZ8lpNqOJ116kFE2YrxPfyHAozLtM
 hEXxXKHNRbcq6vandz+s4QemQu3/P9TcUDbZ70WoYmHa8GOB46snl+Ax8TnKoHuicMGZ
 91IPIjMeNrgJwGKZpTI2VyeaQGSxHmVEelyKEm9o/SMpAnxQlfbWxpn8Jr7+o+29PJW6
 ubTwCOUpNz2j6ZEI2xVpMDLezNp3wZcAizCwG/68wOUAO+2R7rangWf0/PN481oDOWM9
 1MQj6SKA/ZoK4skFes92k/8voPQoMJEk1u17QeonkE4xiSKLnfEonfyZzBUyVlDjAK/T
 uAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ni2p/a1qgnbLwmmB/hD7NYV4hNmI7rYb9FSLzDt4vrQ=;
 b=IZlLl8hBKmgp8+Ox61cPhnaV7XZCxiOnoLUBsOkHhhs7g3Cz1zc4OFxzdmtam/DySA
 jC7YMru1A8jbqQL3cj7h2n/Z2av/6C6k22/jotsIPggBl+y5F9/aBCzJSgZR/j8mb8fb
 k+vXev1BZgkndXG/dG+1+a+fl5c8Q/vXJqdYc+LE6E3LIZtL7BUqmUbPttQFERtdcnoc
 q3H+Bq4OLqqynfddPgXnnEVj5yNlHPD9FlPB8yd0ZY81G7EfThmGcm4UAqHf2A0rhWMh
 PPoO+fD9joqefrDPVSzHUJsmUk+GBOnTsI3E1L1bRCN5LoX+3jW+VbWen5VRWopSgBsP
 R1pg==
X-Gm-Message-State: AOAM5322/qqDGC0W1yMIbfW8WKPKWirkVmr9AlbPWi96Ukew9zgM0D3s
 xE+z8MbPqFBaVsmbtjX28bJwTU2qVxqGd5hu
X-Google-Smtp-Source: ABdhPJxETsZD33sKO702FEhtaRxNZu5IBxrtx1EC2eTn8ldtL85csSK0HWNMrB9syRBqVFIZIwdWdg==
X-Received: by 2002:a1c:b644:: with SMTP id g65mr15974374wmf.145.1605548538118; 
 Mon, 16 Nov 2020 09:42:18 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 41/42] gpu/ipu-v3/ipu-di: Strip out 2 unused 'di_sync_config'
 entries
Date: Mon, 16 Nov 2020 17:41:11 +0000
Message-Id: <20201116174112.1833368-42-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
