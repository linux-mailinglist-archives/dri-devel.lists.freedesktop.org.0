Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA1B5E76
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 09:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924236EE2E;
	Wed, 18 Sep 2019 07:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023FB6EE2E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 07:59:44 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c4so5785904edl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 00:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=9RAAszLOpdIvDldweaPkNLOitxpBV3SI+NOvvapdMHQ=;
 b=ETMQ0w10ODgCfTd/tiWzu0QRj0spnVjOboEEP20rFcrCTAOplAZHZWrXhUO50pj7Gc
 RJHyrE4KSwatWVvpid/GJ/sp8FamBbFIzGmc9v2iYCgHReRASOZpHGNi5A8Q75kBmhwB
 Uhq5ZrnA4x64GDDmKTVuVyJzRizpAmjAhKLy7YmqlnJiWxpTbVjkDxfESQOUNFHqhSI8
 ICHSIoaCpoaPAHN4VhgOj664fJQE3SR5k3Efr/OhFW/Bgt6pOfBNwVv0+6cTD5jxV/oq
 e77EKbS+oy22ggjuTDh7RAzMuIfIpEQi3hMzZaobEiIDs5iE5t3uRggU3Lr/zybq+D6j
 +Yxg==
X-Gm-Message-State: APjAAAVfyGBfn8/1uP1FWZoido2hk4rKcwVmkdBPhO3csmZn/duhm8s+
 jLTqU6F4J45fN6WOHp4vaNVEpg==
X-Google-Smtp-Source: APXvYqwdTowkGcbqJWBiyUssJDPxqStLRSPXEVU9xDnvzaLO5HZLFcTS6gDV42cjcuNM5YUODE775Q==
X-Received: by 2002:a17:906:d185:: with SMTP id
 c5mr7830673ejz.139.1568793583476; 
 Wed, 18 Sep 2019 00:59:43 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b15sm894079edf.24.2019.09.18.00.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 00:59:42 -0700 (PDT)
Date: Wed, 18 Sep 2019 09:59:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/komeda: Remove in-code use of ifdef
Message-ID: <20190918075939.GZ3958@phenom.ffwll.local>
Mail-Followup-To: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 nd <nd@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CAKMK7uECMr46Ag8E=eqTKdZxgt_4M42t7GEyNGv0gxpv-TL3Pg@mail.gmail.com>
 <20190917150314.20892-1-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917150314.20892-1-mihail.atanassov@arm.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=9RAAszLOpdIvDldweaPkNLOitxpBV3SI+NOvvapdMHQ=;
 b=PBQnipt0tgT8m3MGkNMC7d8tYWy6wP232bRYATMSh+qc3+imbzkBvG6+QVXbpLsVT1
 9+P0Opb9/LQtRo7XYHAubAsDrZCes7mJ3txtNBwfxnmvURclx9W1r2U7Wpfr1BUDZOBi
 QGPIYb3ePJaZoKP2AsnoeSwkaSDB0F+TlyV68=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDM6MDU6MDhQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBQcm92aWRlIGEgZHVtbXkgc3RhdGljIGlubGluZSBmdW5jdGlvbiBpbiB0aGUg
aGVhZGVyIGluc3RlYWQuCj4gCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
PiBDYzogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8TG93cnkuTGlAYXJtLmNvbT4K
PiBDYzogamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4u
d2FuZ0Bhcm0uY29tPgo+IEZpeGVzOiA0ZDc0YjI1ZWUzOTUgKCJkcm0va29tZWRhOiBBZGRzIGVy
cm9yIGV2ZW50IHByaW50IGZ1bmN0aW9uYWxpdHkiKQo+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBB
dGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggfCAyICsrCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIHwgMiAtLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAo+IGluZGV4IGUyOGU3ZTY1NjNh
Yi4uOGFjZjhjMDYwMWNjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rldi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmgKPiBAQCAtMjIwLDYgKzIyMCw4IEBAIHN0cnVjdCBrb21lZGFf
ZGV2ICpkZXZfdG9fbWRldihzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+ICAKPiAgI2lmZGVmIENPTkZJ
R19EUk1fS09NRURBX0VSUk9SX1BSSU5UCj4gIHZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1
Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cyk7Cj4gKyNlbHNlCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBr
b21lZGFfcHJpbnRfZXZlbnRzKHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRzKSB7fQo+ICAjZW5k
aWYKPiAgCj4gICNlbmRpZiAvKl9LT01FREFfREVWX0hfKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+IGluZGV4IDE4ZDdlMjUyMDIyNS4u
ZGM4NWMwOGU2MTRkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfa21zLmMKPiBAQCAtNDcsOSArNDcsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qg
a29tZWRhX2ttc19pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQo+ICAJbWVtc2V0KCZl
dnRzLCAwLCBzaXplb2YoZXZ0cykpOwo+ICAJc3RhdHVzID0gbWRldi0+ZnVuY3MtPmlycV9oYW5k
bGVyKG1kZXYsICZldnRzKTsKPiAgCj4gLSNpZmRlZiBDT05GSUdfRFJNX0tPTUVEQV9FUlJPUl9Q
UklOVAo+ICAJa29tZWRhX3ByaW50X2V2ZW50cygmZXZ0cyk7Cj4gLSNlbmRpZgo+ICAKPiAgCS8q
IE5vdGlmeSB0aGUgY3J0YyB0byBoYW5kbGUgdGhlIGV2ZW50cyAqLwo+ICAJZm9yIChpID0gMDsg
aSA8IGttcy0+bl9jcnRjczsgaSsrKQo+IC0tIAo+IDIuMjMuMAo+IAoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
