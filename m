Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB61AE425
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 08:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D0F6E826;
	Tue, 10 Sep 2019 06:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ED789BF1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 13:10:48 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j1so3297942qth.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 06:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yb8yHMlIFzUkKzSOPMN5jEAOXNsGpVU598NQKlQa4ts=;
 b=fQvUlqLSHfRo3R+IAJ9nrVu1bAYifbP5xbtPxDCGWaHN55vEHPcYRVL5Uz3apDEh0Z
 mCtQvCO+nRPhkqOfww+Ahwj9rD+8Y3CGUJ11Y1DzEgaOMBCWBJMXxNov29dNMS6T3Gcu
 O+K2TjCdFRU5eSJJ6ocOs1Hiqe6wTA/CRorfo5pLzbt4DRpClKTWHVRqVZFbZxFqS3PZ
 f2kagDpFAlruEf7KeZFxeqtPfcj9uOlX75pSQhABTsmVBTdbLg0Ob5L735UVY0aqi0Wk
 4sMvfiL4k+/ZIPHAUqQl3N0X1N3p41wGVbn7hccjUQtX1BtUbCuDRG5jkueEAzs0y9Z1
 1dWQ==
X-Gm-Message-State: APjAAAVRmUVS7XfU4qWAeaO73TmYXMkPHNN6KkzuAzyxObkmMm3lgF2Q
 bOlWWPliC1OrP9mTlHdg3lApmw==
X-Google-Smtp-Source: APXvYqwTTE3hZvWnnnr+k3gCNcwlLvkUkshYg2WStKBEtFgMNikRNuBCNT/p6a2XZniIiz+lmVBFHQ==
X-Received: by 2002:ac8:4884:: with SMTP id i4mr21622436qtq.33.1568034647373; 
 Mon, 09 Sep 2019 06:10:47 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id x68sm6545372qkc.16.2019.09.09.06.10.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 06:10:46 -0700 (PDT)
Message-ID: <1568034644.5576.116.camel@lca.pw>
Subject: Re: [PATCH] gpu/drm: fix a -Wstringop-truncation warning
From: Qian Cai <cai@lca.pw>
To: Emil Velikov <emil.l.velikov@gmail.com>, daniel@ffwll.ch
Date: Mon, 09 Sep 2019 09:10:44 -0400
In-Reply-To: <1566585426-2952-1-git-send-email-cai@lca.pw>
References: <1566585426-2952-1-git-send-email-cai@lca.pw>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Sep 2019 06:57:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yb8yHMlIFzUkKzSOPMN5jEAOXNsGpVU598NQKlQa4ts=;
 b=P5hAXo++ypAfAtew5+1QXfKaaCuEfWtlcqjklyahBjKtJYDA9BHSkopx2fQKs7jjQm
 jJhojpO4Bel6OQyrtzYn6gRfJpuzk/ut/s/rA6aPVIOqjrRffvFWwRc63qeDOtmRGL86
 mVJvWpxVLhCwVhJIPdghYlFxjUtNV3KSMeZR5ZybBYMRyierASAEKsOMy1dKFKOznXRl
 tX9U6GgVuzkKa+p26HN/GTgJqC87p6qPJjNImTALbubQx2SMCy0h/thm1GTgSkmd3kxb
 7flWSXq0k3xY7geeU82pAdhIjCx/q5qWxjx9ADE0M5yv9tzpag42jxntnsPtMshztbrW
 W3Lw==
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

RW1pbCwgdGhpcyBzZWVtcyBoYXMgYmVlbiBzdGFsbGVkIGFnYWluIGZyb20gRFJNIG1haW50YWlu
ZXJzLiBKdXN0IHRvIHNlZSBpZiB5b3UKaGF2ZSBzb21lICJtYWdpYyIgdG8gdW5zaWxlbmNlIGl0
IGxpa2UgdGhlIGxhc3QgdGltZS4uLgoKT24gRnJpLCAyMDE5LTA4LTIzIGF0IDE0OjM3IC0wNDAw
LCBRaWFuIENhaSB3cm90ZToKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2xpbnV4
L2JpdG1hcC5oOjksCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9jcHVt
YXNrLmg6MTIsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20v
Y3B1bWFzay5oOjUsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9h
c20vbXNyLmg6MTEsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9h
c20vcHJvY2Vzc29yLmg6MjEsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC94ODYvaW5j
bHVkZS9hc20vY3B1ZmVhdHVyZS5oOjUsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC94
ODYvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaDo1MywKPiAgICAgICAgICAgICAgICAgIGZyb20g
Li9pbmNsdWRlL2xpbnV4L3RocmVhZF9pbmZvLmg6MzgsCj4gICAgICAgICAgICAgICAgICBmcm9t
IC4vYXJjaC94ODYvaW5jbHVkZS9hc20vcHJlZW1wdC5oOjcsCj4gICAgICAgICAgICAgICAgICBm
cm9tIC4vaW5jbHVkZS9saW51eC9wcmVlbXB0Lmg6NzgsCj4gICAgICAgICAgICAgICAgICBmcm9t
IC4vaW5jbHVkZS9saW51eC9yY3VwZGF0ZS5oOjI3LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAu
L2luY2x1ZGUvbGludXgvcmN1bGlzdC5oOjExLAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2lu
Y2x1ZGUvbGludXgvcGlkLmg6NSwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xp
bnV4L3NjaGVkLmg6MTQsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC91
YWNjZXNzLmg6NSwKPiAgICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9ncHUvZHJtL2RybV9w
cm9wZXJ0eS5jOjI0Ogo+IEluIGZ1bmN0aW9uICdzdHJuY3B5JywKPiAgICAgaW5saW5lZCBmcm9t
ICdkcm1fcHJvcGVydHlfY3JlYXRlJyBhdAo+IGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJvcGVydHku
YzoxMzA6MjoKPiAuL2luY2x1ZGUvbGludXgvc3RyaW5nLmg6MzA1Ojk6IHdhcm5pbmc6ICdfX2J1
aWx0aW5fc3RybmNweScgc3BlY2lmaWVkCj4gYm91bmQgMzIgZXF1YWxzIGRlc3RpbmF0aW9uIHNp
emUgWy1Xc3RyaW5nb3AtdHJ1bmNhdGlvbl0KPiAgIHJldHVybiBfX2J1aWx0aW5fc3RybmNweShw
LCBxLCBzaXplKTsKPiAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+
IEZpeCBpdCBieSB1c2luZyBzdHJzY3B5KCkgd2hpY2ggd2lsbCBhbHdheXMgcmV0dXJuIGEgdmFs
aWQgc3RyaW5nLCBhbmQKPiBkb2Vzbid0IHVubmVjZXNzYXJpbHkgZm9yY2UgdGhlIHRhaWwgb2Yg
dGhlIGRlc3RpbmF0aW9uIGJ1ZmZlciB0byBiZQo+IHplcm9lZC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wcm9w
ZXJ0eS5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5LmMKPiBpbmRleCA4OTJjZTYzNmVmNzIuLjY2
ZWMyY2M3YTU1OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5LmMKPiBAQCAtMTI3LDggKzEyNyw3
IEBAIHN0cnVjdCBkcm1fcHJvcGVydHkgKmRybV9wcm9wZXJ0eV9jcmVhdGUoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKPiAgCXByb3BlcnR5LT5udW1fdmFsdWVzID0gbnVtX3ZhbHVlczsKPiAgCUlO
SVRfTElTVF9IRUFEKCZwcm9wZXJ0eS0+ZW51bV9saXN0KTsKPiAgCj4gLQlzdHJuY3B5KHByb3Bl
cnR5LT5uYW1lLCBuYW1lLCBEUk1fUFJPUF9OQU1FX0xFTik7Cj4gLQlwcm9wZXJ0eS0+bmFtZVtE
Uk1fUFJPUF9OQU1FX0xFTi0xXSA9ICdcMCc7Cj4gKwlzdHJzY3B5KHByb3BlcnR5LT5uYW1lLCBu
YW1lLCBEUk1fUFJPUF9OQU1FX0xFTik7Cj4gIAo+ICAJbGlzdF9hZGRfdGFpbCgmcHJvcGVydHkt
PmhlYWQsICZkZXYtPm1vZGVfY29uZmlnLnByb3BlcnR5X2xpc3QpOwo+ICAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
