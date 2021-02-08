Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A149F313E34
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 19:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BC56E9B1;
	Mon,  8 Feb 2021 18:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F015B6E9B1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 18:57:09 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id o63so10836213pgo.6
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 10:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=2/gzTW7nLFsuo+IwWrIaRt+TvJX/TxBhhTnVcO/vt5w=;
 b=lOB8zinUAvyLO85HhB6TSwBqNnQK1ljBILQkgdqwfhQOiu4unf9pzceIqrYuZ078ty
 wGXEoy5Tx8tezMyFsu3JPxkei8ZS+/8rZR7me9KJSJQjcW5ybLZCGNnHESTPPIX6xJS+
 Mmt59ZFieppEbkC4SulqdsBEM9V7x6RjGQu3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=2/gzTW7nLFsuo+IwWrIaRt+TvJX/TxBhhTnVcO/vt5w=;
 b=qb2H/FxZ3H5wBQr0XQAnLcRK3Qpch7c6SWLMfAxgfcso2NNPL+mApDq5a+K5WLRm1Z
 VnPnicHSxbldh3Z8hJt+mHlHub7aehDAAJAaWOOfF0kQBkfjPPps4xyS3GiDY/3IcG3H
 qF/uGa2DxZMm/a1e+4SL329+5qMSG3ir3iiJgtT84QuW/HgPsVVSUJKAQ0QURuCBBjtF
 gLox4GPK0RU4Pfle1YQqV343kDtsPNLgnpk6MfOCkR8dg0z7wQQ13nYQ/ITpxfgL1wh3
 xOhI4O2o61gl8t5UdGuTOoeKKm5+G15cQKM6hKgJIckDUWw2pAhSb+RKQtD7f+YRi5oC
 GKsw==
X-Gm-Message-State: AOAM530nI2oRZmnkmDMGdalKFUkatNPNuvbJpIva2Xm4Lvx18BAwQcuR
 WiPFYwzTsyqcHuVFdEHydLIhhg==
X-Google-Smtp-Source: ABdhPJw7v065YuC3/mbkLcjCDyAiR6tav2E1VDnkk1wO2jAZ5ggH5FG4+RFceqHEy7gfiUQeynQvcA==
X-Received: by 2002:a05:6a00:15cc:b029:1ba:5282:3ab8 with SMTP id
 o12-20020a056a0015ccb02901ba52823ab8mr19019293pfu.77.1612810629426; 
 Mon, 08 Feb 2021 10:57:09 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:751a:ba0b:8918:c305])
 by smtp.gmail.com with ESMTPSA id r15sm20452075pgh.39.2021.02.08.10.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:57:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8943f0acd2944144b21b5796c07e79ff5e707aaf.camel@perches.com>
References: <20210207041858.3317171-1-swboyd@chromium.org>
 <8943f0acd2944144b21b5796c07e79ff5e707aaf.camel@perches.com>
Subject: Re: [PATCH] drm/msm/dp: Add a missing semi-colon
From: Stephen Boyd <swboyd@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>,
 Rob Clark <robdclark@gmail.com>
Date: Mon, 08 Feb 2021 10:57:07 -0800
Message-ID: <161281062730.76967.14597290603195200219@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Lee Jones <lee.jones@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBKb2UgUGVyY2hlcyAoMjAyMS0wMi0wNiAyMTowNjo1NCkKPiBPbiBTYXQsIDIwMjEt
MDItMDYgYXQgMjA6MTggLTA4MDAsIFN0ZXBoZW4gQm95ZCB3cm90ZToKPiA+IEEgbWlzc2luZyBz
ZW1pY29sb24gaGVyZSBjYXVzZXMgbXkgZXh0ZXJuYWwgZGlzcGxheSB0byBzdG9wIHdvcmtpbmcu
Cj4gPiBJbmRlZWQsIG1pc3NpbmcgdGhlIHNlbWljb2xvbiBvbiB0aGUgcmV0dXJuIHN0YXRlbWVu
dCBsZWFkcyB0bwo+ID4gZHBfcGFuZWxfdXBkYXRlX3R1X3RpbWluZ3MoKSBub3QgZXhpc3Rpbmcg
YmVjYXVzZSB0aGUgY29tcGlsZXIgdGhpbmtzCj4gPiBpdCdzIHBhcnQgb2YgdGhlIHJldHVybiBz
dGF0ZW1lbnQgb2YgYSB2b2lkIGZ1bmN0aW9uLCBzbyBpdCBtdXN0IG5vdCBiZQo+ID4gaW1wb3J0
YW50Lgo+ID4gCj4gPiDCoMKgJCAuL3NjcmlwdHMvYmxvYXQtby1tZXRlciBiZWZvcmUubyBhZnRl
ci5vCj4gPiDCoMKgYWRkL3JlbW92ZTogMS8xIGdyb3cvc2hyaW5rOiAwLzEgdXAvZG93bjogNzQw
MC8tNzU0MCAoLTE0MCkKPiA+IMKgwqBGdW5jdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhCj4gPiDCoMKgZHBfcGFuZWxfdXBkYXRlX3R1
X3RpbWluZ3MgICAgICAgICAgICAgICAgICAgICAtICAgIDc0MDAgICArNzQwMAo+ID4gwqDCoF9k
cF9jdHJsX2NhbGNfdHUuY29uc3Rwcm9wICAgICAgICAgICAgICAgICAxODAyNCAgIDE3OTAwICAg
IC0xMjQKPiA+IMKgwqBkcF9wYW5lbF91cGRhdGVfdHVfdGltaW5ncy5jb25zdHByb3AgICAgICAg
IDc0MTYgICAgICAgLSAgIC03NDE2Cj4gPiDCoMKgVG90YWw6IEJlZm9yZT01NDQ0MCwgQWZ0ZXI9
NTQzMDAsIGNoZyAtMC4yNiUKPiA+IAo+ID4gQWRkIGEgc2VtaWNvbG9uIHNvIHRoaXMgZnVuY3Rp
b24gd29ya3MgbGlrZSBpdCB1c2VkIHRvLgo+IFtdCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kcC9kcF9jdHJsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2N0cmwu
Ywo+IFtdCj4gPiBAQCAtNjMxLDcgKzYzMSw3IEBAIHN0YXRpYyB2b2lkIF9kcF9jdHJsX2NhbGNf
dHUoc3RydWN0IGRwX3R1X2NhbGNfaW5wdXQgKmluLAo+ID4gwqAKPiA+IAo+ID4gwqAgICAgIHR1
ID0ga3phbGxvYyhzaXplb2YoKnR1KSwgR0ZQX0tFUk5FTCk7Cj4gPiDCoCAgICAgaWYgKCF0dSkK
PiA+IC0gICAgICAgICAgICAgcmV0dXJuCj4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+IMKg
Cj4gPiAKPiA+IMKgICAgICBkcF9wYW5lbF91cGRhdGVfdHVfdGltaW5ncyhpbiwgdHUpOwo+IAo+
IFdvdywgdGhhdCdzIHJlYWxseSB1bmZvcnR1bmF0ZSB0aGF0IGRwX3BhbmVsX3VwZGF0ZV90dV90
aW1pbmdzCj4gaXMgYWxzbyB2b2lkLgo+IAo+IFBlcmhhcHMgdGhpcyBhcyBZQSBjaGVja3BhdGNo
IHdhcm5pbmc6Cj4gCj4gLS0tCgpBY2tlZC1ieTogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21p
dW0ub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
