Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7921C2F4D93
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B356EA5E;
	Wed, 13 Jan 2021 14:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3DF6EA5C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:38 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g10so1855460wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GZEx6Psm5kmVFzQRuV4hKShFUTuX59E1ZZSqS64lTO4=;
 b=qCaU5/PwjTYjtfnriB60Z9oLOr+vFl/C6eE9S2SqWRzje404GBkmpQhafug/AkVxOy
 cQQpoF2TPpvHLZ2G0WwI0m9I3+iSy5mECHxCRPxdVQEqbEaiQAKEQ21H2Puw7RerAiVE
 wFP15HZbbxQs2PH85CQiCco+76nv2mFTwq9YLxfrDpX1dbHfhcDj5xFdWbHJisbQiGp9
 gXFKfd2QUbQryXwNq3Wq2jJyOgsjiru7oncOJDfA+X11+HkluVlV1zwafJGTb/u8E2G8
 MRaYmLZI/XB7G9OUxyfbsMCiS30QwhZAVeTDBJWC+SfdIRLhSlZ+MEl7DCFddFc+gJo3
 s87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GZEx6Psm5kmVFzQRuV4hKShFUTuX59E1ZZSqS64lTO4=;
 b=IW+hwG++pXNdYwyAUaVE3IrwZ50KwIH48sDyRcOsNLp4/YcqRsJDSVhFupV8pJ255+
 17YfUHEuqYb+C8nOv9bJbyUNi0CjlfLzLeXPgN9v88/OjQBnWPJBHwJRo4sml07A/zHI
 Xe4ShWjuyhOODNcz87reOFcLGGQye3yIcT3pfNK92UsudYm3v4lqYm7OiMfgGfG3q1Xd
 lDH4RU7P5Q9xKxnd0efx60dX4uipgJ4c07uLfejySooNJI4YpBV1kJdI5MMYQMKD+Hym
 +GbnHuBLrxAcTWCq+2+ZvycpIcE3RdaKH9RR5v74TfHAkLj/GHyN25XTko94/mD1hgSr
 U9Fg==
X-Gm-Message-State: AOAM533o2vhAHfFq9sxJwyzREm/ky8VyxxgyzXDTBxlitUGxHIa+Spn6
 kxvX7iW+w8QbWef/x+RMLrZVILzzmEzSIFe7
X-Google-Smtp-Source: ABdhPJzXGlHjQWCGWlwH0MsHBEeXn1e8tUGwLxoT/K65Pbdak+HaHN+93bMx8dcQNJlERhqlDPiH6w==
X-Received: by 2002:a1c:40d6:: with SMTP id n205mr2609520wma.0.1610549437515; 
 Wed, 13 Jan 2021 06:50:37 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/31] video: fbdev: via: lcd: Remove unused variable
 'mode_crt_table'
Date: Wed, 13 Jan 2021 14:49:53 +0000
Message-Id: <20210113145009.1272040-16-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi92aWEvbGNkLmM6IEluIGZ1bmN0aW9uIOKAmHZpYWZiX2xjZF9zZXRfbW9k
ZeKAmToKIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL2xjZC5jOjU0MDoyOTogd2FybmluZzogdmFy
aWFibGUg4oCYbW9kZV9jcnRfdGFibGXigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KCkNjOiBGbG9yaWFuIFRvYmlhcyBTY2hhbmRpbmF0IDxGbG9yaWFuU2No
YW5kaW5hdEBnbXguZGU+CkNjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZpYS9sY2QuYyB8IDQg
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL2xjZC5jIGIvZHJpdmVycy92aWRlby9m
YmRldi92aWEvbGNkLmMKaW5kZXggNGE4Njk0MDJkMTIwZC4uMDg4Yjk2MjA3NmI1MSAxMDA2NDQK
LS0tIGEvZHJpdmVycy92aWRlby9mYmRldi92aWEvbGNkLmMKKysrIGIvZHJpdmVycy92aWRlby9m
YmRldi92aWEvbGNkLmMKQEAgLTUzNywxMSArNTM3LDkgQEAgdm9pZCB2aWFmYl9sY2Rfc2V0X21v
ZGUoY29uc3Qgc3RydWN0IGZiX3Zhcl9zY3JlZW5pbmZvICp2YXIsIHUxNiBjeHJlcywKIAl1MzIg
Y2xvY2s7CiAJc3RydWN0IHZpYV9kaXNwbGF5X3RpbWluZyB0aW1pbmc7CiAJc3RydWN0IGZiX3Zh
cl9zY3JlZW5pbmZvIHBhbmVsX3ZhcjsKLQljb25zdCBzdHJ1Y3QgZmJfdmlkZW9tb2RlICptb2Rl
X2NydF90YWJsZSwgKnBhbmVsX2NydF90YWJsZTsKKwljb25zdCBzdHJ1Y3QgZmJfdmlkZW9tb2Rl
ICpwYW5lbF9jcnRfdGFibGU7CiAKIAlERUJVR19NU0coS0VSTl9JTkZPICJ2aWFmYl9sY2Rfc2V0
X21vZGUhIVxuIik7Ci0JLyogR2V0IG1vZGUgdGFibGUgKi8KLQltb2RlX2NydF90YWJsZSA9IHZp
YWZiX2dldF9iZXN0X21vZGUoc2V0X2hyZXMsIHNldF92cmVzLCA2MCk7CiAJLyogR2V0IHBhbmVs
IHRhYmxlIFBvaW50ZXIgKi8KIAlwYW5lbF9jcnRfdGFibGUgPSB2aWFmYl9nZXRfYmVzdF9tb2Rl
KHBhbmVsX2hyZXMsIHBhbmVsX3ZyZXMsIDYwKTsKIAl2aWFmYl9maWxsX3Zhcl90aW1pbmdfaW5m
bygmcGFuZWxfdmFyLCBwYW5lbF9jcnRfdGFibGUpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
