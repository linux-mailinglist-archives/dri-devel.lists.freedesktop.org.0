Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6A2C043A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADA189FA5;
	Mon, 23 Nov 2020 11:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03A76E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e7so674938wrv.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XQiSvdHNX/l8zTX1wnsdbanAAcRSnCZFK2InbUgz80=;
 b=ITMcw66kMNj6+a35t560vvLEJp9Qh3wX0OAmVSouJIPLLOsp/LcrYRXMqRiNL1IzWp
 N88RAF/OA4LP2xGceSDMEdHSP4NCSNn2TSIa0J52t70m0+Cd5Jd5qhoE/KLjniNY96Du
 CEvjpeHeTWD7XQHNXEmghRGM3nQKcrWOIa0NHPPChpU0y7QnN4rLW1ESzUI0kG2lNCsk
 L/FNUM/285Cq7SZpdjddlkjFfHPPQV3ZKYnfwp4fh//vsODzAD4+0ePc8TkDFkGMZaPl
 dpKkd1zjRHALp6PHoTEqjG2Nt7KRy4F4csBhN90NqRTLGFbhiEeIGjVPQO9wWpcoy6jh
 eW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XQiSvdHNX/l8zTX1wnsdbanAAcRSnCZFK2InbUgz80=;
 b=P0q8Fs8f3QBlxmL6G1TmuOcp3L35M4cxO+FU8y1zZ/tY8a+0Kf1WbvUAYzz/csKAUG
 rPB7gjzXe2irbi9fozqfjQ4bQJNm9wAsSHX3fOirCsRDW0j1jsnIm7/C0dWDANXVfQ+P
 uyKl7wCDDsVT41INUT9OHfJ4y+A+CbjBSvVDRjFwJX1eo7LD4mbOl+r1ef9nmb/vu/+q
 pWfPM8dXUFYYsXxs77wed52VwFooKr+GwIkYyANC7qz2U1ghO16yZFALg9X+RjAwS6pA
 /DQOSgsPBn/vVLbjNlKpkknhFz91mWRRy4n4558JV85n1hmMa7jGb4yV0t4u2hOo0gEk
 OQtw==
X-Gm-Message-State: AOAM533/BQdUckOcHKLjLedSDAwSaoyNh4kvmiM+nF7DDuc0QeZedIhs
 v58tL8LlW1CVcv4/CV8PP2+BKw==
X-Google-Smtp-Source: ABdhPJxT9cxp1U8EXv22g8t43yc2F9riiqF+zpYFisUPqziMGnHw1PIj+Zfqh0lCo7aiBznqqCCdbw==
X-Received: by 2002:adf:e80b:: with SMTP id o11mr30535225wrm.409.1606130415390; 
 Mon, 23 Nov 2020 03:20:15 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 38/40] drm/msm/msm_drv: Make '_msm_ioremap()' static
Date: Mon, 23 Nov 2020 11:19:17 +0000
Message-Id: <20201123111919.233376-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21fZHJ2LmM6MTI0OjE1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmF9tc21faW9yZW1hcOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzog
Um9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3Js
eS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2
LmMKaW5kZXggNGQ1ODY2OGI4MDg1My4uZWRjOTllM2IwZWNhNyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2
LmMKQEAgLTEyMSw4ICsxMjEsOCBAQCBzdHJ1Y3QgY2xrICptc21fY2xrX2dldChzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2LCBjb25zdCBjaGFyICpuYW1lKQogCXJldHVybiBjbGs7CiB9CiAK
LXZvaWQgX19pb21lbSAqX21zbV9pb3JlbWFwKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
IGNvbnN0IGNoYXIgKm5hbWUsCi0JCQkgICBjb25zdCBjaGFyICpkYmduYW1lLCBib29sIHF1aWV0
KQorc3RhdGljIHZvaWQgX19pb21lbSAqX21zbV9pb3JlbWFwKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYsIGNvbnN0IGNoYXIgKm5hbWUsCisJCQkJICBjb25zdCBjaGFyICpkYmduYW1lLCBi
b29sIHF1aWV0KQogewogCXN0cnVjdCByZXNvdXJjZSAqcmVzOwogCXVuc2lnbmVkIGxvbmcgc2l6
ZTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
