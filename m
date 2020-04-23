Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35B41B670D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1096EA1D;
	Thu, 23 Apr 2020 22:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CD76E823
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 13:22:56 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x17so6085411wrt.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6lrCN4Y2jvBEhMEE9yoKB0QoRLluJFmgeNzXOO0519c=;
 b=MfGul8Hpypn6B6iEzWypyjdhBn2Sm6I3sSyNkRkdieKZwsujvoViJAlUxKfCp6PvVT
 nwSpOW9fHqYx6TfeuZBHXpiT/Q2s2RfycyW/XV2CCERaWqWBevrZxULrN89FB2oqqqIj
 EC4+LROpYsU0aZMAoa54xpOSfpfCZFQyZRrwaCx87r3hFioBkCt8KsdEjlJAImIi4s1I
 Us/CNyKM0JIG8zvg7SiTo3pIgmAXzgypQm3ZpltQJG1qtzhzgxWvcovuoFdh5tQZy9Cx
 NgvYaqs9da3YhKQ+izEK3Cgf+BXf15gAENfjKuHLNG3VaHH3xMMHcEogSfbIRqjGk5gK
 /7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6lrCN4Y2jvBEhMEE9yoKB0QoRLluJFmgeNzXOO0519c=;
 b=D/OAN6pxVRKGcS0xL06qiiz5vlSGb5tjlDkKNz0ql2+0fH1LTTUxNMMSW+uaKITJHB
 jfkGt/ydgnVxxCBLMUUCwgrUAl9j5B3MiATcr79cxugK48UrlI0JS8pZ9fd525IPX0qY
 75uvmKbV0btzAPg99KRDyxGToVOE3bJrv9tI1G+zwvw0cp/MndTZCG7Ca14s44YdFrDo
 8QgnSYYLllGin30vdKEWrlGpraoB1Pi5epjK7sLaZ9PLaTjr1aagAbEnIdDoQ3vhQ1Kh
 STaC9xtxdKsh8cG5mmCjwWKFXT3W36G91p+2yUNIyFEp6sW/HzkpCfFY1NXIWh/aMnlB
 vE4g==
X-Gm-Message-State: AGi0PuYeD9B0WrXii1MF5MakJDI6vm41reujMKvBc49fm9UYmRWVaZKA
 RfKre2IqLKv2Ia4Js+NC09JJcA==
X-Google-Smtp-Source: APiQypLIExvxbZk7AtfC6O9cBOXmdm+gz1QSH3p+99FlJwwJBGarRXDyjXQkXRxvvC0opKaSfe3/tA==
X-Received: by 2002:adf:fdc1:: with SMTP id i1mr5430755wrs.158.1587648175280; 
 Thu, 23 Apr 2020 06:22:55 -0700 (PDT)
Received: from linaro.org ([37.167.216.250])
 by smtp.gmail.com with ESMTPSA id h137sm14658623wme.0.2020.04.23.06.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 06:22:54 -0700 (PDT)
Date: Thu, 23 Apr 2020 15:22:43 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v6 03/10] PM / EM: update callback structure and add
 device pointer
Message-ID: <20200423132243.GA65632@linaro.org>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-4-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410084210.24932-4-lukasz.luba@arm.com>
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, b.zolnierkie@samsung.com, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTAsIDIwMjAgYXQgMDk6NDI6MDNBTSArMDEwMCwgTHVrYXN6IEx1YmEgd3Jv
dGU6Cj4gVGhlIEVuZXJneSBNb2RlbCBmcmFtZXdvcmsgaXMgZ29pbmcgdG8gc3VwcG9ydCBkZXZp
Y2VzIG90aGVyIHRoYXQgQ1BVcy4gSW4KPiBvcmRlciB0byBtYWtlIHRoaXMgaGFwcGVuIGNoYW5n
ZSB0aGUgY2FsbGJhY2sgZnVuY3Rpb24gYW5kIGFkZCBwb2ludGVyIHRvCj4gYSBkZXZpY2UgYXMg
YW4gYXJndW1lbnQuCj4gCj4gVXBkYXRlIHRoZSByZWxhdGVkIHVzZXJzIHRvIHVzZSBuZXcgZnVu
Y3Rpb24gYW5kIG5ldyBjYWxsYmFjayBmcm9tIHRoZQo+IEVuZXJneSBNb2RlbC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWthc3ogTHViYSA8bHVrYXN6Lmx1YmFAYXJtLmNvbT4KPiAtLS0KClsgLi4u
IF0KCj4gK3N0YXRpYyBzdHJ1Y3QgZW1fcGVyZl9kb21haW4gKgo+ICtlbV9jcmVhdGVfcGQoc3Ry
dWN0IGRldmljZSAqZGV2LCBpbnQgbnJfc3RhdGVzLCBzdHJ1Y3QgZW1fZGF0YV9jYWxsYmFjayAq
Y2IsCj4gKwkgICAgIGNwdW1hc2tfdCAqc3BhbikKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBvcHBf
ZWZmLCBwcmV2X29wcF9lZmYgPSBVTE9OR19NQVg7Cj4gIAl1bnNpZ25lZCBsb25nIHBvd2VyLCBm
cmVxLCBwcmV2X2ZyZXEgPSAwOwo+IEBAIC0xMDYsNyArMTA3LDcgQEAgc3RhdGljIHN0cnVjdCBl
bV9wZXJmX2RvbWFpbiAqZW1fY3JlYXRlX3BkKGNwdW1hc2tfdCAqc3BhbiwgaW50IG5yX3N0YXRl
cywKPiAgCQkgKiBsb3dlc3QgcGVyZm9ybWFuY2Ugc3RhdGUgb2YgJ2NwdScgYWJvdmUgJ2ZyZXEn
IGFuZCB1cGRhdGVzCj4gIAkJICogJ3Bvd2VyJyBhbmQgJ2ZyZXEnIGFjY29yZGluZ2x5Lgo+ICAJ
CSAqLwo+IC0JCXJldCA9IGNiLT5hY3RpdmVfcG93ZXIoJnBvd2VyLCAmZnJlcSwgY3B1KTsKPiAr
CQlyZXQgPSBjYi0+YWN0aXZlX3Bvd2VyKCZwb3dlciwgJmZyZXEsIGRldik7Cj4gIAkJaWYgKHJl
dCkgewo+ICAJCQlwcl9lcnIoInBkJWQ6IGludmFsaWQgcGVyZi4gc3RhdGU6ICVkXG4iLCBjcHUs
IHJldCk7Cj4gIAkJCWdvdG8gZnJlZV9wc190YWJsZTsKCldoeSBhcmUgdGhlIGNoYW5nZXMgJ2Nw
dScgdG8gJ2RldicgaW4gdGhlIHBhdGNoIDQvMTAgaW5zdGVhZCBvZiB0aGlzIG9uZSA/Cgo+IEBA
IC0yMzcsNyArMjM4LDcgQEAgaW50IGVtX2Rldl9yZWdpc3Rlcl9wZXJmX2RvbWFpbihzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBucl9zdGF0ZXMsCj4gIAl9Cj4gIAo+ICAJLyogQ3Jl
YXRlIHRoZSBwZXJmb3JtYW5jZSBkb21haW4gYW5kIGFkZCBpdCB0byB0aGUgRW5lcmd5IE1vZGVs
LiAqLwo+IC0JcGQgPSBlbV9jcmVhdGVfcGQoc3BhbiwgbnJfc3RhdGVzLCBjYik7Cj4gKwlwZCA9
IGVtX2NyZWF0ZV9wZChkZXYsIG5yX3N0YXRlcywgY2IsIHNwYW4pOwo+ICAJaWYgKCFwZCkgewo+
ICAJCXJldCA9IC1FSU5WQUw7Cj4gIAkJZ290byB1bmxvY2s7CgotLSAKCiA8aHR0cDovL3d3dy5s
aW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFy
bz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8
CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
