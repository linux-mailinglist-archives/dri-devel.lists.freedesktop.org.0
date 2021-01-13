Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD242F4D92
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4832B6EA5C;
	Wed, 13 Jan 2021 14:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CC36EA5A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:37 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id c124so1837426wma.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dqYcKMvvBegfm3VenU/QB6olxRoFuHKFr2cjTUmqS/8=;
 b=S9AVj327o2YowF2UVDBy78wryMVcbl0h9+66FkKjsJ6i8WFxR9bdMBpvD09HQSKrBK
 vo1ZGwrQgRIbO8nXV14mGFMY7xN/8efJxg72LA+jGfLxFGqANW5Hq1Sp7x03fIgx6wh9
 GIQHviMB4xL7Ezvs1yhHlV4tpH+kRDmAfbGsmQRRzOL0kTysvdv5asLys1CLRMxMQw3j
 KSElJsxQsL2ag8A2zAltelJHGfRZI0Wa5LkJq72Dlg5v5NEk61ys0mgDyU45DAojoCL2
 n+AyXgib6ItiEzC+zdVYwT+v/wpNd5HLgmYqxPkzAM1ka3F9mHglqwUXvhnOweZ6cRBz
 nA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dqYcKMvvBegfm3VenU/QB6olxRoFuHKFr2cjTUmqS/8=;
 b=VBzHgHYj4KezCRJfzW7vYsEV7F4idqeYXjbPcAry5oU+HjXR8Q9NoZXNihNur4aM6B
 ziF7FaIBgAwsCYdeOa2aTQSK6kZhkElLLAb2/jRgj4VcQAj35C4sasGBWTpG5Q5RsCqp
 FlcW8Pv00ISwsOrYuuXiB9lVYe5u5xRJDb3CFqUUM2lf088z39QzcGmb13IUShKV76yr
 zABr4NUbR8o6rZGJX5k8SuWHB2V1+Rp4u7IubnPX/uUS4ZhQPcsHS5JIpGws5+faQwLy
 j4mk2fB3bvlGsCOBddG62PESoG1FpwKZFLtbWt/0liT+zMqhAYK3uvHragqK3nUmXjpN
 xEhg==
X-Gm-Message-State: AOAM531T9Zk9KMlw/zaelrIkEyzSZbxGJbdDcu+kxXUsFZV3Kxh1lJGi
 9T5uC9qNIpeeAvcE5IkWUp7JX2+B9VK4u2Ul
X-Google-Smtp-Source: ABdhPJy4RotZ5wPboUC1kdYhrUWx9GlS9eDgIJqXfbaNL8FlpjQa2No/+N3798NUVzIh33Csn1WwcA==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr2599659wmm.122.1610549436394; 
 Wed, 13 Jan 2021 06:50:36 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/31] video: fbdev: aty: mach64_ct: Remove some set but
 unused variables
Date: Wed, 13 Jan 2021 14:49:52 +0000
Message-Id: <20210113145009.1272040-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: daniel.mantione@freepascal.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi9hdHkvbWFjaDY0X2N0LmM6IEluIGZ1bmN0aW9uIOKAmGF0eV9pbml0X3Bs
bF9jdOKAmToKIGRyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2NF9jdC5jOjQwNTo0Njogd2Fy
bmluZzogdmFyaWFibGUg4oCYdmdhX2RzcF9vbl9vZmbigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2NF9j
dC5jOjQwNTozMDogd2FybmluZzogdmFyaWFibGUg4oCYdmdhX2RzcF9jb25maWfigJkgc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KIGRyaXZlcnMvdmlkZW8vZmJk
ZXYvYXR5L21hY2g2NF9jdC5jOjQwNToxODogd2FybmluZzogdmFyaWFibGUg4oCYZHNwX29uX29m
ZuKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IGRh
bmllbC5tYW50aW9uZUBmcmVlcGFzY2FsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9h
dHkvbWFjaDY0X2N0LmMgfCAxOSArKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2F0eS9tYWNoNjRfY3QuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2
NF9jdC5jCmluZGV4IGY4N2NjODFmNGZhMmIuLjIzZWVjZWNhMWU5ZDcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvYXR5L21hY2g2NF9jdC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvYXR5L21hY2g2NF9jdC5jCkBAIC00MDIsNyArNDAyLDcgQEAgc3RhdGljIGludCBhdHlfaW5p
dF9wbGxfY3QoY29uc3Qgc3RydWN0IGZiX2luZm8gKmluZm8sIHVuaW9uIGF0eV9wbGwgKnBsbCkK
IAlzdHJ1Y3QgYXR5ZmJfcGFyICpwYXIgPSAoc3RydWN0IGF0eWZiX3BhciAqKSBpbmZvLT5wYXI7
CiAJdTggbXBvc3RfZGl2LCB4cG9zdF9kaXYsIHNjbGtfcG9zdF9kaXZfcmVhbDsKIAl1MzIgcSwg
bWVtY250bCwgdHJwOwotCXUzMiBkc3BfY29uZmlnLCBkc3Bfb25fb2ZmLCB2Z2FfZHNwX2NvbmZp
ZywgdmdhX2RzcF9vbl9vZmY7CisJdTMyIGRzcF9jb25maWc7CiAjaWZkZWYgREVCVUcKIAlpbnQg
cGxsbWNsaywgcGxsc2NsazsKICNlbmRpZgpAQCAtNDg4LDI1ICs0ODgsMTAgQEAgc3RhdGljIGlu
dCBhdHlfaW5pdF9wbGxfY3QoY29uc3Qgc3RydWN0IGZiX2luZm8gKmluZm8sIHVuaW9uIGF0eV9w
bGwgKnBsbCkKIAogCS8qIEFsbG93IEJJT1MgdG8gb3ZlcnJpZGUgKi8KIAlkc3BfY29uZmlnID0g
YXR5X2xkX2xlMzIoRFNQX0NPTkZJRywgcGFyKTsKLQlkc3Bfb25fb2ZmID0gYXR5X2xkX2xlMzIo
RFNQX09OX09GRiwgcGFyKTsKLQl2Z2FfZHNwX2NvbmZpZyA9IGF0eV9sZF9sZTMyKFZHQV9EU1Bf
Q09ORklHLCBwYXIpOwotCXZnYV9kc3Bfb25fb2ZmID0gYXR5X2xkX2xlMzIoVkdBX0RTUF9PTl9P
RkYsIHBhcik7CiAKIAlpZiAoZHNwX2NvbmZpZykKIAkJcGxsLT5jdC5kc3BfbG9vcF9sYXRlbmN5
ID0gKGRzcF9jb25maWcgJiBEU1BfTE9PUF9MQVRFTkNZKSA+PiAxNjsKLSNpZiAwCi0JRklYTUU6
IGlzIGl0IHJlbGV2YW50IGZvciB1cz8KLQlpZiAoKCFkc3Bfb25fb2ZmICYmICFNNjRfSEFTKFJF
U0VUXzNEKSkgfHwKLQkJKChkc3Bfb25fb2ZmID09IHZnYV9kc3Bfb25fb2ZmKSAmJgotCQkoIWRz
cF9jb25maWcgfHwgISgoZHNwX2NvbmZpZyBeIHZnYV9kc3BfY29uZmlnKSAmIERTUF9YQ0xLU19Q
RVJfUVcpKSkpIHsKLQkJdmdhX2RzcF9vbl9vZmYgJj0gVkdBX0RTUF9PRkY7Ci0JCXZnYV9kc3Bf
Y29uZmlnICY9IFZHQV9EU1BfWENMS1NfUEVSX1FXOwotCQlpZiAoQVRJRGl2aWRlKHZnYV9kc3Bf
b25fb2ZmLCB2Z2FfZHNwX2NvbmZpZywgNSwgMSkgPiAyNCkKLQkJCXBsbC0+Y3QuZmlmb19zaXpl
ID0gMzI7Ci0JCWVsc2UKLQkJCXBsbC0+Y3QuZmlmb19zaXplID0gMjQ7Ci0JfQotI2VuZGlmCisK
IAkvKiBFeGl0IGlmIHRoZSB1c2VyIGRvZXMgbm90IHdhbnQgdXMgdG8gdGFtcGVyIHdpdGggdGhl
IGNsb2NrCiAJcmF0ZXMgb2YgaGVyIGNoaXAuICovCiAJaWYgKHBhci0+bWNsa19wZXIgPT0gMCkg
ewotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
