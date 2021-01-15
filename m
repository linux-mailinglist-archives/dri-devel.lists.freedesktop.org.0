Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F11A62F8377
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9A36E499;
	Fri, 15 Jan 2021 18:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0336E487
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a12so10179302wrv.8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4aoNCmjio9l+rvMx1zGsBoMkbgJVfYu39oKJNZ/3uls=;
 b=oO4p2Qt7e2zzJjwbtmcEgQslHf38O4Ll5XneLSPcedcp/U955WUp7OBBo6XiOUrCQR
 9bHWdzJcJe3/sydkNSJNTJOreeX4oOTwpUTCktEaWWW8sttfSHXciVTMy22hD9F3+Z7u
 dla+xlHuqn4W6StDx1+0ZvM8+HJevlmInFOs5KwEZ7Rb6VUMPb9aqqL+XHDsjQMlQlMz
 a0CdfQ38BCdPa9Y/pkBO7Wo2o6ZeA4Opq/q7PR2FSheFdYQdiLgVB44MHFLilMYiYVG9
 ZysciPyZ2KEm1ky3FthuachRs994pMprRdfD9QOSZiWP6Eez1kOX5QFHhyk9YwJhmTEl
 acgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4aoNCmjio9l+rvMx1zGsBoMkbgJVfYu39oKJNZ/3uls=;
 b=jaYjZBklGnsPyLEaGs2v9nzBCIAMZReW+2FdGXj0uwf8WigVCtok/PoS4fLeV0Yeax
 KkisAgzj6rz3yszG94R/uPKfPbNf9TdFTp1YQmGlp6oXxM2nflocu05iwYUToGC0JAmP
 1Lo0l4g8U67ZZQpx7zCBdQ6Ec1MqbMHr1kls3es3LOl74pp3PQYu8BmFg3y1hQD/41jI
 bhPNYD3HD7o8PIHeXDLdfx/3SnHLfX8Ki2CBHE8vaAfNkphLKqdfvwk10E3suHC1IzvH
 BnRVU7ubMmxrkQi/ixOWgHOl0HSpx5vkIviu8G6WlvcFxNvFT+qpezMley4XxUsmTLuv
 9zpw==
X-Gm-Message-State: AOAM531Xd2jLeXRe3oOBlX9JrE90gtjh/bZI+PEjzJc1dk3Xe3kHXDt4
 tY6wX2oFlLRoIxBS7y22R+O/33qX5O24yRUf
X-Google-Smtp-Source: ABdhPJyPDU+rAWr+95CjBqCha9HFpSx3cJkKiSRB/6/qt1lCEMkfnxYyUnFr5HtNk7VsyimbxHcgyw==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr14778574wrt.396.1610734431166; 
 Fri, 15 Jan 2021 10:13:51 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/40] drm/gma500/gma_device: Include our own header
 containing prototypes
Date: Fri, 15 Jan 2021 18:12:55 +0000
Message-Id: <20210115181313.3431493-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9nbWFfZGV2aWNlLmM6MTA6Njogd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciDigJhnbWFfZ2V0X2NvcmVfZnJlceKAmSBbLVdtaXNzaW5nLXByb3RvdHlw
ZXNdCgpDYzogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29uQGdtYWlsLmNvbT4K
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZ21hNTAwL2dtYV9kZXZpY2UuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nbWFfZGV2aWNlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dtYV9kZXZpY2UuYwppbmRleCBjZmJlYjAxMGVkZTBk
Li40YzkxZTg2ZjRiMTQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dtYV9k
ZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2dtYV9kZXZpY2UuYwpAQCAtNiw2
ICs2LDcgQEAKICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KIAogI2luY2x1ZGUgInBzYl9kcnYuaCIKKyNp
bmNsdWRlICJnbWFfZGV2aWNlLmgiCiAKIHZvaWQgZ21hX2dldF9jb3JlX2ZyZXEoc3RydWN0IGRy
bV9kZXZpY2UgKmRldikKIHsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
