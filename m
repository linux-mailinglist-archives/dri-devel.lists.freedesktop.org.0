Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3CB32B84D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA05C6E98C;
	Wed,  3 Mar 2021 13:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C926E985
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:31 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u16so5735132wrt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=STeXZot7UNsWfWvi+ECfSVOes0yoTqiHgkq3rfNhNfU=;
 b=eIs+/oNLfkhdj6OT9dHSDH8W5WywMha6aMEKck0RmrxPz7iqr/11jJ4qds3prHui1K
 hck5bggU4m8/bTTDKgxh0Nkpf9mdXzbD9LK780fc9pZOuHC0aambtq3x8UULm1iZ5Zcz
 KrLopof08NjqlnH2p6jzv84EkH39sPi2gyq12F0LKblBEAiwfqPDkmSvMxK78bdvfnIW
 Jif+z9+EU+ox3nnMiPcVh8a7lg3Vdk6yO/f5wfBVB8XQtVBGQyPKJzmMFOapeMA3tH76
 0yMwbK/kOvDFwKk4rUoRv91R35GZiyl1tWhiQFEdbqjhFObsxQCXi61w0V5NM/ri0z/9
 ctVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=STeXZot7UNsWfWvi+ECfSVOes0yoTqiHgkq3rfNhNfU=;
 b=Q+s8S31GpgNShlNfk9B/ionAQRCGlrLa1lESiIKWR8NkPCtVtLs4T6ZaPeuADGu/aF
 IR+RUBEDiELPGk8pDuUmxNEaFLn0SCJ9V5wZr7U1GeZq5WdEFambyNRQ9IJVT+EkitXV
 uAYEcZ7NIjWzzP/maQ1caCgldWVOsSgqTayiw3lPyH+Tl8e7+RHSP8v/Mj0514vbWyhe
 5EtBN5E7wyEXWDviZkZDIqLEMrJI3HLBAWArn2ScMj8H0LM7/UsxI9342uOPhaf69R7t
 j65m7qWhqrSKCIMvH3pHqizLlIZ2elygEXOBZ/pyBsFd529eRtz/pEEZAjgwBYDpSoKM
 aLNg==
X-Gm-Message-State: AOAM531vN7jhtsKpfy6jPPi39TipTa9yvS1HgyALjvzEknERgJ2hOYP1
 IsKvFyiJsdmABVzfD+B/BLQQJg==
X-Google-Smtp-Source: ABdhPJx3ALBlSbPNO7VGAg22evCyZnjw0EKxLAj088hCAeuLI1iMyd0Gfp/X25XEIyWBUENSWyHtxg==
X-Received: by 2002:a5d:404f:: with SMTP id w15mr22820915wrp.106.1614779070093; 
 Wed, 03 Mar 2021 05:44:30 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:29 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 53/53] drm/vmwgfx/ttm_object: Reorder header to immediately
 precede its struct
Date: Wed,  3 Mar 2021 13:43:19 +0000
Message-Id: <20210303134319.3160762-54-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>, Rob Clark <rob.clark@linaro.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxzbyBhZGQgbWlzc2luZyBkZXNjcmlwdGlvbiBmb3IgJ3JlZmNvdW50JwoKRml4ZXMgdGhlIGZv
bGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC90dG1fb2JqZWN0LmM6NjA6IGVycm9yOiBDYW5ub3QgcGFyc2Ugc3RydWN0IG9yIHVuaW9u
IQoKQ2M6IFZNd2FyZSBHcmFwaGljcyA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUu
Y29tPgpDYzogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2FyZS5jb20+CkNjOiBaYWNr
IFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2Fs
IDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4K
Q2M6IFJvYiBDbGFyayA8cm9iLmNsYXJrQGxpbmFyby5vcmc+CkNjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFy
by1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUu
Y29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQv
MjAyMTAxMTUxODE2MDEuMzQzMjU5OS0zMC1sZWUuam9uZXNAbGluYXJvLm9yZwotLS0KIGRyaXZl
cnMvZ3B1L2RybS92bXdnZngvdHRtX29iamVjdC5jIHwgMTkgKysrKysrKysrKy0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1fb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3R0bV9vYmplY3QuYwppbmRleCBiM2ZkYzYzMDQ5N2NiLi4xMTIzOTRkZDBhYjZh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3R0bV9vYmplY3QuYwpAQCAtNDIsNiArNDIsMTQgQEAKICAq
LwogCiAKKyNkZWZpbmUgcHJfZm10KGZtdCkgIltUVE1dICIgZm10CisKKyNpbmNsdWRlIDxsaW51
eC9saXN0Lmg+CisjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KKyNpbmNsdWRlIDxsaW51eC9z
bGFiLmg+CisjaW5jbHVkZSA8bGludXgvYXRvbWljLmg+CisjaW5jbHVkZSAidHRtX29iamVjdC5o
IgorCiAvKioKICAqIHN0cnVjdCB0dG1fb2JqZWN0X2ZpbGUKICAqCkBAIC01NSwxNiArNjMsOSBA
QAogICoKICAqIEByZWZfaGFzaDogSGFzaCB0YWJsZXMgb2YgcmVmIG9iamVjdHMsIG9uZSBwZXIg
dHRtX3JlZl90eXBlLAogICogZm9yIGZhc3QgbG9va3VwIG9mIHJlZiBvYmplY3RzIGdpdmVuIGEg
YmFzZSBvYmplY3QuCisgKgorICogQHJlZmNvdW50OiByZWZlcmVuY2UvdXNhZ2UgY291bnQKICAq
LwotCi0jZGVmaW5lIHByX2ZtdChmbXQpICJbVFRNXSAiIGZtdAotCi0jaW5jbHVkZSA8bGludXgv
bGlzdC5oPgotI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+Ci0jaW5jbHVkZSA8bGludXgvc2xh
Yi5oPgotI2luY2x1ZGUgPGxpbnV4L2F0b21pYy5oPgotI2luY2x1ZGUgInR0bV9vYmplY3QuaCIK
LQogc3RydWN0IHR0bV9vYmplY3RfZmlsZSB7CiAJc3RydWN0IHR0bV9vYmplY3RfZGV2aWNlICp0
ZGV2OwogCXNwaW5sb2NrX3QgbG9jazsKLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
