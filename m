Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100E1AB2BC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C020C6E029;
	Fri,  6 Sep 2019 07:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700316E110
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 14:41:02 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 4so2327038qki.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 07:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RwHVDa1GJi8ayjzjkgzkLTLLpxPbUkF92tRTyGxKp8E=;
 b=PzzCn8D3bc7fGXQNAKJ7nTOKM97m2D3pxU7D4T+43JEGqVQ41EwC20gBsiJmrccO6I
 LzRJchw0CQUT/YnHota7B5Nzd4htdf9cpaw753vr4Zs4ppl9+42jkDznjOTS86e1l7h2
 H6d0yJkyQl4EaXtiGjLk22h65oyfsxiM7NbDDYOSMfYzzy0i/J8S6mC4jo/zl+ZMQhKc
 gQWJSBhZlVIX6Ub+zVGbUKyDMnT+sm1wW6qwSQjLWjahvkkeIMNUSWaCWVoTSClStUnm
 yGqlnpBFAJpJVSl4QFrv2w+qXrkhNsgFkrW4Z4UBmiv9sjC/HMjRRYx1zOnWBKqqCTEi
 lCgQ==
X-Gm-Message-State: APjAAAXZQLvXVuK18wbmAG4uMRu3nPAi3At4gxPDShb+08YFvg3uE8Za
 DfFUkdLzXNIE2YjydIlqKG2yxg==
X-Google-Smtp-Source: APXvYqxrtgPstnzHgyJSHuCxcpq5WtjXy9rbKx4EcN+tuoaOvYFpINd6tpp3e7sRgqvGI8ZvUhn+VQ==
X-Received: by 2002:a37:a695:: with SMTP id p143mr3314043qke.144.1567694461221; 
 Thu, 05 Sep 2019 07:41:01 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id x2sm1030038qkf.83.2019.09.05.07.40.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 07:41:00 -0700 (PDT)
Message-ID: <1567694459.5576.94.camel@lca.pw>
Subject: Re: [PATCH] gpu/drm: fix a -Wstringop-truncation warning
From: Qian Cai <cai@lca.pw>
To: daniel@ffwll.ch
Date: Thu, 05 Sep 2019 10:40:59 -0400
In-Reply-To: <1566585426-2952-1-git-send-email-cai@lca.pw>
References: <1566585426-2952-1-git-send-email-cai@lca.pw>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RwHVDa1GJi8ayjzjkgzkLTLLpxPbUkF92tRTyGxKp8E=;
 b=qW7gVcDzND0lYEahwAo1BqDAlHLaPYyKi+juRuxEk8puYQtfS+Az/JTNxleGT5JOjh
 MUyftEBA8SZN5lFGaF80LXJ8ExVfw3bUWGZgk/0CNI7hquPgcyc0Z433Z+H9EhW+jG1i
 0P1nzrcuzqbqxB9BOy0FUPYjPpOpsjEkaEtC/+DTJg4ooZZTzrgPNtrj+cD2zC/jw2LR
 keQ+N/No0VKSJ7PKB+C6wSR82Ffmo5B7syJJBD6R6GvW1LyOX+IeJTQGBms+0pPwAMAI
 RFyMgaq1iZppL7q7WXfHaQ/CW+w7bQPH8RuVMvrRQuZ4+SKye+twacYsL3BVp73xz7RD
 VQOg==
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
Cc: maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZy4gUGxlYXNlIHRha2UgYSBsb29rIGF0IHRoaXMgdHJpdmlhbCBwYXRjaC4KCk9uIEZyaSwg
MjAxOS0wOC0yMyBhdCAxNDozNyAtMDQwMCwgUWlhbiBDYWkgd3JvdGU6Cj4gSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIC4vaW5jbHVkZS9saW51eC9iaXRtYXAuaDo5LAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBmcm9tIC4vaW5jbHVkZS9saW51eC9jcHVtYXNrLmg6MTIsCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9jcHVtYXNrLmg6NSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZnJvbSAu
L2FyY2gveDg2L2luY2x1ZGUvYXNtL21zci5oOjExLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmg6MjEsCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9jcHVmZWF0dXJlLmg6NSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmg6NTMsCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZyb20gLi9pbmNsdWRlL2xpbnV4L3RocmVhZF9pbmZv
Lmg6MzgsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZyb20gLi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9wcmVlbXB0Lmg6NywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZnJvbSAuL2luY2x1ZGUvbGludXgvcHJlZW1wdC5oOjc4LAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBmcm9tIC4vaW5jbHVkZS9saW51eC9yY3VwZGF0ZS5oOjI3LAo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmcm9tIC4vaW5jbHVkZS9saW51eC9y
Y3VsaXN0Lmg6MTEsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZyb20gLi9p
bmNsdWRlL2xpbnV4L3BpZC5oOjUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGZyb20gLi9pbmNsdWRlL2xpbnV4L3NjaGVkLmg6MTQsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGZyb20gLi9pbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaDo1LAo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmcm9tIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJvcGVy
dHkuYzoyNDoKPiBJbiBmdW5jdGlvbiAnc3RybmNweScsCj4gwqDCoMKgwqBpbmxpbmVkIGZyb20g
J2RybV9wcm9wZXJ0eV9jcmVhdGUnIGF0Cj4gZHJpdmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0eS5j
OjEzMDoyOgo+IC4vaW5jbHVkZS9saW51eC9zdHJpbmcuaDozMDU6OTogd2FybmluZzogJ19fYnVp
bHRpbl9zdHJuY3B5JyBzcGVjaWZpZWQKPiBib3VuZCAzMiBlcXVhbHMgZGVzdGluYXRpb24gc2l6
ZSBbLVdzdHJpbmdvcC10cnVuY2F0aW9uXQo+IMKgIHJldHVybiBfX2J1aWx0aW5fc3RybmNweShw
LCBxLCBzaXplKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgo+IAo+IEZpeCBpdCBieSB1c2luZyBzdHJzY3B5KCkgd2hpY2ggd2lsbCBhbHdheXMgcmV0
dXJuIGEgdmFsaWQgc3RyaW5nLCBhbmQKPiBkb2Vzbid0IHVubmVjZXNzYXJpbHkgZm9yY2UgdGhl
IHRhaWwgb2YgdGhlIGRlc3RpbmF0aW9uIGJ1ZmZlciB0byBiZQo+IHplcm9lZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fcHJvcGVydHkuYyB8IDMgKy0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cHJvcGVydHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvcGVydHkuYwo+IGluZGV4IDg5MmNl
NjM2ZWY3Mi4uNjZlYzJjYzdhNTU5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cHJvcGVydHkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvcGVydHkuYwo+IEBAIC0x
MjcsOCArMTI3LDcgQEAgc3RydWN0IGRybV9wcm9wZXJ0eSAqZHJtX3Byb3BlcnR5X2NyZWF0ZShz
dHJ1Y3QgZHJtX2RldmljZQo+ICpkZXYsCj4gwqAJcHJvcGVydHktPm51bV92YWx1ZXMgPSBudW1f
dmFsdWVzOwo+IMKgCUlOSVRfTElTVF9IRUFEKCZwcm9wZXJ0eS0+ZW51bV9saXN0KTsKPiDCoAo+
IC0Jc3RybmNweShwcm9wZXJ0eS0+bmFtZSwgbmFtZSwgRFJNX1BST1BfTkFNRV9MRU4pOwo+IC0J
cHJvcGVydHktPm5hbWVbRFJNX1BST1BfTkFNRV9MRU4tMV0gPSAnXDAnOwo+ICsJc3Ryc2NweShw
cm9wZXJ0eS0+bmFtZSwgbmFtZSwgRFJNX1BST1BfTkFNRV9MRU4pOwo+IMKgCj4gwqAJbGlzdF9h
ZGRfdGFpbCgmcHJvcGVydHktPmhlYWQsICZkZXYtPm1vZGVfY29uZmlnLnByb3BlcnR5X2xpc3Qp
Owo+IMKgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
