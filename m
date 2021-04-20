Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9718366196
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 23:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772076E8E5;
	Tue, 20 Apr 2021 21:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82446E8E5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 21:27:15 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso32385231otv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=30FxQx6+h/DPZfAuYkCh0ZYoDk/KVeqAfInmZT+LL3E=;
 b=sFZydY8u9ka2/hRBi6tB84+cNI9yI6A5eHiJF6L2eIBh5bTHgCEj8vr5GcNwyBX53m
 YtZgsDa35Y5jxsFYmBqwahuvtaNfyvFNS3GwlA2VqNHdBIlnzUiLdAQB6tm3VU5VDyso
 uFGc0Z8Qp7RcAooHar0ptvBIuQph1o6Nyk4TlTiba47P2aajD5eB79njpMy6nsbXLQuw
 tBMjHzP1MJLB9xQF4+AcMqjkWhZZuYfp697XThO2ZYGUamm5xYwqOAC0t3L9zJYGd9mI
 MMITrMovm2eLl47XlYTB8ZkWc6GmXSMT6zOSg4MEr7YvIPBkYf+x85LpaPChrLMFUSXG
 9ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=30FxQx6+h/DPZfAuYkCh0ZYoDk/KVeqAfInmZT+LL3E=;
 b=YGAY0kfmo7uAOZQId3ZKQcYpT65JbzcK9fy9pZ9aeOZHnt1Fq9gvk9fNSTP59dJe1+
 BjKNmADzHmzzQVYFzhLKPmf8EgkVSryqXPepYKwIeXrdkYl0fwGF95VbpetHrmzcyyBX
 ZnSQtlgzVPYkaf8hL0PcxCCc2nQfLxDQoyxir6vaXOPvsWIU0ifzXYJqjTiEU4AWLjtY
 7yuq79Cv57O6UaVq1WZwbWROZIr1nFFMbS1AOB4gS2dIpYR3sAKulEV8Dl9f/6LBu3ua
 klmFZSzuw+Qnj8xir4EcrU3Wrt6QG4wUozSWQWUCrnDqiQTaGQPaM93OpbRZhuzU7Fm3
 n3Hw==
X-Gm-Message-State: AOAM53225vt1pZuBAy0ReuemaV1Tf6S9JIssH4X9HT2JtvfcBuqvXneD
 To4SU0TTXa/0wncMeGGPSPnqFCn07huCSEK+asE=
X-Google-Smtp-Source: ABdhPJzyHli5TQG29616h8SoL5wezkFSsDA4ukcNLXQQEbIAs43KGcKjYGIETR2Kb01xcJ3OxH/pNSr2v18uh+7dFEc=
X-Received: by 2002:a9d:75c4:: with SMTP id c4mr18676343otl.311.1618954035087; 
 Tue, 20 Apr 2021 14:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-24-lee.jones@linaro.org>
 <5035dd00-45a9-80c0-7bcc-8035167a8e0d@amd.com>
In-Reply-To: <5035dd00-45a9-80c0-7bcc-8035167a8e0d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Apr 2021 17:27:04 -0400
Message-ID: <CADnq5_Os8LjPoj7_fim2x2RqMhySSUT0BRFdMfd8AFdAjGkhTA@mail.gmail.com>
Subject: Re: [PATCH 23/40] drm/ttm/ttm_bo: Fix incorrectly documented function
 'ttm_bo_cleanup_refs'
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Huang Rui <ray.huang@amd.com>, Lee Jones <lee.jones@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTYsIDIwMjEgYXQgMTE6MzIgQU0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDE2LjA0LjIxIHVtIDE2OjM3IHNjaHJp
ZWIgTGVlIEpvbmVzOgo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4gPgo+ID4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jOjI5Mzogd2Fy
bmluZzogZXhwZWN0aW5nIHByb3RvdHlwZSBmb3IgZnVuY3Rpb24gdHRtX2JvX2NsZWFudXBfcmVm
cygpLiBQcm90b3R5cGUgd2FzIGZvciB0dG1fYm9fY2xlYW51cF9yZWZzKCkgaW5zdGVhZAo+ID4K
PiA+IENjOiBDaHJpc3RpYW4gS29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBD
YzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+
ID4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gPiBDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZwo+ID4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+ID4gU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPgo+IFJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpDYW4geW91IHB1
c2ggdGhlIHR0bSBhbmQgc2NoZWQgZml4ZXMgdG8gZHJtLW1pc2M/CgpBbGV4CgoKPgo+ID4gLS0t
Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAyICstCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYwo+ID4gaW5kZXggY2ZkMGI5MjkyMzk3My4uZGVmZWM5NDg3ZTFkZSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMKPiA+IEBAIC0yNzQsNyArMjc0LDcgQEAgc3RhdGljIHZvaWQgdHRtX2Jv
X2ZsdXNoX2FsbF9mZW5jZXMoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiA+ICAgfQo+
ID4KPiA+ICAgLyoqCj4gPiAtICogZnVuY3Rpb24gdHRtX2JvX2NsZWFudXBfcmVmcwo+ID4gKyAq
IHR0bV9ib19jbGVhbnVwX3JlZnMKPiA+ICAgICogSWYgYm8gaWRsZSwgcmVtb3ZlIGZyb20gbHJ1
IGxpc3RzLCBhbmQgdW5yZWYuCj4gPiAgICAqIElmIG5vdCBpZGxlLCBibG9jayBpZiBwb3NzaWJs
ZS4KPiA+ICAgICoKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
