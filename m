Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E4A341754
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD256E9A6;
	Fri, 19 Mar 2021 08:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A546E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:46 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id u9so8276709ejj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1D64SVMvmhdwuXpC8yQyBurTfGArjqR5f88yUwkGnjo=;
 b=ih+byn5SaHURLinLJy61nATTEUMe8vQzf+Wme4RNbiXwTCukEVwYWl9/LmLBd+gGPX
 BPV3gUINlkQOzYVHWsKkwSkuApoP6THu29KcuCPwPcErnWEkw2tbwQhW2kb963whlRR3
 /Glxz65+HP+jZ50lYrNkF54H+hWUEiiLgVmxiEu8qA7Oh/YrABFLd/en2VZNM7WD9mH4
 9noPJ30KTZDc9VlfmMCUVOp5v9grwMvx2bUOWxIWamPNPrPpKTD5ewqwy6Ch9HfJKX2J
 ZKtBbTVhHqxvIq0+cdw2sxsXWFpMcOCcZ2tcQ/j7eh3sxRxS2nt0K08u7zm6X/vgyYpK
 h9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1D64SVMvmhdwuXpC8yQyBurTfGArjqR5f88yUwkGnjo=;
 b=WuZhIvcDl1oQgxyPmMG+/r8mwImNnzsOMxlNdMGiuINu0qdF+6qu/UGvTVJEwRVt23
 B1soNNpM1rti+icwMYKWYlx53ixJBrhnLc4/xDOPpwmQ6DM9R5S9o5VnWESS8YlpX2Gm
 VZSSzst5wWRJfxSD7VSzjr4COTndG5k47uRzGz/1E3VPtrFGQToAbBP5C6f0pq3zzLI+
 /u/8PeqmhW+kf1NOYppWxfD5kIii7FDfgGl4hHTj/0hVMc70HKGS3s+CebzuoZn3UxvK
 gzZPlCKJ73YQtiGNsHWj+pMjGYRcHUGpfG+b1SSm4sqEk9zVAenTGBAw0s2vaK3PNKwg
 LtYQ==
X-Gm-Message-State: AOAM531JDBx4cqGFg7QWP4aRI/CN5sxSLmb5M7TnNVqihc8LJy+ArRQz
 km5IQIRpvar4EkcbFD3wZe/7nSyq4SSq0A==
X-Google-Smtp-Source: ABdhPJwBdmyDdjAgM3AbyrSm0+lZxfiSLPz6jfWiCHcbRtFoy2VbAFhzJc06XSjDVyDn/72ypUKr9Q==
X-Received: by 2002:a17:907:9870:: with SMTP id
 ko16mr2987441ejc.227.1616142284971; 
 Fri, 19 Mar 2021 01:24:44 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:44 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/19] drm/nouveau/dispnv50/disp: Remove unused variable 'ret'
 from function returning void
Date: Fri, 19 Mar 2021 08:24:22 +0000
Message-Id: <20210319082428.3294591-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOiBJbiBmdW5jdGlvbiDigJhudjUwX21z
dG1fY2xlYW51cOKAmToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzox
MzU3OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNv
bT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52
NTAvZGlzcC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1
MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXgg
YzUxZWZjYTgyYWM3OC4uODI4ZjQ4ZDViZGQ0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2Rpc3AuYwpAQCAtMTM4NiwxMiArMTM4NiwxMSBAQCBudjUwX21zdG1fY2xlYW51cChz
dHJ1Y3QgbnY1MF9tc3RtICptc3RtKQogewogCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91
dmVhdV9kcm0obXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldik7CiAJc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyOwotCWludCByZXQ7CiAKIAlOVl9BVE9NSUMoZHJtLCAiJXM6IG1zdG0gY2xlYW51
cFxuIiwgbXN0bS0+b3V0cC0+YmFzZS5iYXNlLm5hbWUpOwotCXJldCA9IGRybV9kcF9jaGVja19h
Y3Rfc3RhdHVzKCZtc3RtLT5tZ3IpOworCWRybV9kcF9jaGVja19hY3Rfc3RhdHVzKCZtc3RtLT5t
Z3IpOwogCi0JcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQyKCZtc3RtLT5tZ3IpOwor
CWRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0MigmbXN0bS0+bWdyKTsKIAogCWRybV9mb3JfZWFj
aF9lbmNvZGVyKGVuY29kZXIsIG1zdG0tPm91dHAtPmJhc2UuYmFzZS5kZXYpIHsKIAkJaWYgKGVu
Y29kZXItPmVuY29kZXJfdHlwZSA9PSBEUk1fTU9ERV9FTkNPREVSX0RQTVNUKSB7Ci0tIAoyLjI3
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
