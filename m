Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C8144EF
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EE18921E;
	Mon,  6 May 2019 07:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FAC8921E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 07:04:48 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s7so4685053ljh.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 00:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iNnmod9ZKYpePclbWo4PT7+A86yCjlpOu7Z5K0IfDaI=;
 b=J/YMcMtwAuvXfX7pgQV2UKqvzzt0tZ0rhzU1iTq3m7kg050V3Yjz0QYS8/jVh4nSHc
 wAnG31P4p++xvvxomiFMY84vIJPSgcV/IGYgfaZ5OFasyU2BVmeZAoaYj48EEMNeEPb8
 vJyKni995GoDsfj/h1D9J14q+fe2Sck76YLns1l1lZLtYBE/6u+6czfke2eNlDUbbyFH
 fwkdP55pOJO1sgDbRBnYi7jw1TG/Ju67kzGdZ4bjZHxaKJP1ad0U6uG+/kAM4sxK8uNr
 lDTq0lz4qxLvxNkD4mXAtRWip1s3fzFu+mNwfhcXYTR3Ll7cAK/7M2v/TizViQWcWE0l
 1izg==
X-Gm-Message-State: APjAAAWkE3u9mnO+Hoyx+9hiVeFurbT/IdUZTW7n1wNWG0J+ODKq9KIE
 Do/pa3LT7XfHMJkJdFVSY/asxpnsYg5gPx8aOJ7FYg==
X-Google-Smtp-Source: APXvYqwpSJLl8gV6pdZU4YYHl94me2CBN5IMcXEz3u0oBYWdfeT0XTVNkb2FrbRHhDYCHk2DkNUzwnMuw0PYb0iLxEY=
X-Received: by 2002:a2e:8e93:: with SMTP id z19mr9427670ljk.159.1557126286550; 
 Mon, 06 May 2019 00:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-4-masneyb@onstation.org>
In-Reply-To: <20190505130413.32253-4-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2019 09:04:35 +0200
Message-ID: <CACRpkdZFK9EGptXbtowUMai6M-jdh6OSTU2=X9A-N3R7hcvXiQ@mail.gmail.com>
Subject: Re: [PATCH RFC 3/6] ARM: qcom_defconfig: add display-related options
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iNnmod9ZKYpePclbWo4PT7+A86yCjlpOu7Z5K0IfDaI=;
 b=pDlv+7ag2wt+konKcf3YjvXQ6Rx8/AkKeXQxV1jX2Yytl40iicDeBaiJDqbX1JNyQr
 dmy65YjhxAUORD4wvQCuMlzacDMJ3Gv3BOZ4wyPiCHxJbsVE8p+pIhpKg9KPEeiIYfut
 2t/qiJZs/QJWX8oAuj9XOnR3mE1OMSi+mDyfHECpsTb6MaNv3Q53YK0yef+Z487Kpx4i
 HHgX3CBx/h482EqJqKDZNPhTMgzEvMbtTfQRCY1ChPdtS4DaHFcNfq/y9M8Rgoyah0Hq
 ikkFaNXi8C43tOIs5Gm1aGBA/Ad71E3g0vMbVmm3JB1k+Gvlnx1hAAonb082ZSfAbS3f
 OLlA==
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
Cc: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgNSwgMjAxOSBhdCAzOjA0IFBNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPiB3cm90ZToKCj4gQWRkIHRoZSBDTUEgKENvbnRpZ3VvdXMgTWVtb3J5IEFsbG9j
YXRvcikgZm9yIHRoZSBNU00gRFJNIGRyaXZlciwgdGhlCj4gc2ltcGxlIHBhbmVsLCBhbmQgdGhl
IFRJIExNMzYzMEEgZHJpdmVyIGluIG9yZGVyIHRvIHN1cHBvcnQgdGhlIGRpc3BsYXkKPiBvbiB0
aGUgTEcgTmV4dXMgNSAoaGFtbWVyaGVhZCkgcGhvbmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCcmlh
biBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cgo+IFRoZSBwYW5lbCBhbmQgYmFja2xpZ2h0
IGFyZSBjdXJyZW50bHkgY29tcGlsZWQgaW50byB0aGUga2VybmVsLCBidXQgd2lsbAo+IGJlIG1v
dmVkIHRvIGJlIG1vZHVsZXMgb25jZSB0aGUgZGlzcGxheSBpcyBmdWxseSB3b3JraW5nIGluIGEg
bGF0ZXIKPiB2ZXJpc29uIG9mIHRoaXMgcGF0Y2ggc2VyaWVzLgoKSSBkb24ndCBzZWUgd2h5IHdl
IHdvdWxkIHdhbnQgdG8gZG8gdGhhdCwgdGhlIEZCIGNvbnNvbGUgaXMKdHJhZGl0aW9uYWxseSAo
eDg2KSBnb29kIHRvIGFsd2HDvXMgZ2V0IHVwLCBhcyBzZXJpYWwgY29uc29sZQptaWdodCBub3Qg
YWx3YXlzIGJlIGF2YWlsYWJsZS4gRm9yIGV4YW1wbGUgZm9yIHBlb3BsZQp3aG8gY2FuJ3Qgc29s
ZGVyIHNwZWNpYWwgY2FibGVzIGJ1dCBzdGlsbCB3YW50IHRvIGJvb3QgYQpjdXN0b20gUk9NIG9u
IHRoZWlyIE5leHVzLiBTbyBJJ2Qgc2F5IGtlZXAgaXQgbGlrZSB0aGlzLgoKWW91cnMsCkxpbnVz
IFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
