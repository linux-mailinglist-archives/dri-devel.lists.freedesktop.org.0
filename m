Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD983941E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 20:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A8589E2A;
	Fri,  7 Jun 2019 18:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C33089E2A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 18:19:01 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k21so917639edq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 11:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=SgapDvu9AZ9bjduDzfdPcw5741fT3T5XkHZzme8aMgw=;
 b=OuXKQ2xjjkDSICyy1USp5N97ln+qDWoZVBUBeEddFsKgMGwESelbvR8lLXv+xlv4Ea
 e0xTKxyYhn/BzRcH2jfpvB3MbK5Tol+TQz0yi7QNv14lQBpshe7OvVlESmUZnzwVkFZ8
 FMZaL+28t3tIqXVQSGeKIWcBKynd1vehiy1vo1e21kKny4vlv8zvzYrrozF1TrZ78hR5
 axrGhD+Q0zUMp6NIcexstG2M3WUutmlLPSj+8Kxef+L5w0jyw9U8LLln6vPBRtgQtwFo
 CsOeL4ExdTWiiuJHZPql8r6VhSm3IlHWBvYeHdq4E7T4AaZ9eA1j6XuuvInDyQverIVm
 H8pA==
X-Gm-Message-State: APjAAAW8dCey9IUCZuGXmUMTvtsw0PyLfEQ6qol+DcjGxAepKXWAGJNs
 eeGBJQOA34eoMtLCaRJdnhSBbg==
X-Google-Smtp-Source: APXvYqyMFYfjRaCLPfHcgcuJZs/84Otob7yqvDwuAVVMsR09fUXE/VI7k5InDN/B9gVoq4GB1K88Lg==
X-Received: by 2002:a50:90af:: with SMTP id c44mr32178174eda.126.1559931539756; 
 Fri, 07 Jun 2019 11:18:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y8sm492652ejq.24.2019.06.07.11.18.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 11:18:58 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:18:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ayan Halder <Ayan.Halder@arm.com>
Subject: Re: [PATCH] drm/komeda: Enable/Disable vblank interrupts
Message-ID: <20190607181856.GK21222@phenom.ffwll.local>
Mail-Followup-To: Ayan Halder <Ayan.Halder@arm.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nd <nd@arm.com>
References: <20190607150323.20395-1-ayan.halder@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607150323.20395-1-ayan.halder@arm.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=SgapDvu9AZ9bjduDzfdPcw5741fT3T5XkHZzme8aMgw=;
 b=cz7+iCOvp3QtnYJKjfVjS2bko5hNUS6qKdcdu4D68IIitzSC8cQmMbhTSql0v74US2
 2gR0DzB7NNt6+8xhoSgcbI9oGHD8ySJlQ3J5DxiFXewizn1Uz1+kaZQ9ooApg56Ji1id
 XJEwpivJwiDuvvxw6eKyvAG/nmlnyQ2veB6Po=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDM6MDM6MzlQTSArMDAwMCwgQXlhbiBIYWxkZXIgd3Jv
dGU6Cj4gT25lIG5lZWRzIHRvIHNldCAiKHN0cnVjdCBkcm1fZGV2aWNlICopLT5pcnFfZW5hYmxl
ZCA9IHRydWUiIHRvIHNpZ25hbCBkcm0gY29yZQo+IHRvIGVuYWJsZSB2YmxhbmsgaW50ZXJydXB0
cyBhZnRlciB0aGUgaGFyZHdhcmUgaGFzIGJlZW4gaW5pdGlhbGl6ZWQuCj4gQ29ycmVzcG9uZGlu
Z2x5LCBvbmUgbmVlZHMgdG8gZGlzYWJsZSB2YmxhbmsgaW50ZXJydXB0cyBieSBzZXR0aW5nCj4g
IihzdHJ1Y3QgZHJtX2RldmljZSAqKS0+aXJxX2VuYWJsZWQgPSBmYWxzZSIgYXQgdGhlIGJlZ2lu
bmluZyBvZiB0aGUKPiBkZS1pbml0aWFsaXppbmcgcm91dGluZS4KCk9ubHkgaWYgeW91IGRvbid0
IHVzZSB0aGUgZHJtX2lycV9pbnN0YWxsIGhlbHBlci4gUXVvdGluZyB0aGUga2VybmVsZG9jIGlu
CmZ1bGw6CgoJLyoqCgkgKiBAaXJxX2VuYWJsZWQ6CgkgKgoJICogSW5kaWNhdGVzIHRoYXQgaW50
ZXJydXB0IGhhbmRsaW5nIGlzIGVuYWJsZWQsIHNwZWNpZmljYWxseSB2YmxhbmsKCSAqIGhhbmRs
aW5nLiBEcml2ZXJzIHdoaWNoIGRvbid0IHVzZSBkcm1faXJxX2luc3RhbGwoKSBuZWVkIHRvIHNl
dCB0aGlzCgkgKiB0byB0cnVlIG1hbnVhbGx5LgoJICovCglib29sIGlycV9lbmFibGVkOwoKTm90
IGVudGlyZWx5IHN1cmUgd2hlcmUgeW91J3ZlIGZvdW5kIHlvdXIgcXVvdGUsIGJ1dCBpdCdzIG5v
dCBjb21wbGV0ZS4KCkNoZWVycywgRGFuaWVsCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEF5YW4gS3Vt
YXIgaGFsZGVyIDxheWFuLmhhbGRlckBhcm0uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMKPiBpbmRleCA3YjVjZGUxNGUzYmEuLmI0ZmQ4ZWUwZDA1ZiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9r
bXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5jCj4gQEAgLTIwNCw2ICsyMDQsOCBAQCBzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmtvbWVkYV9r
bXNfYXR0YWNoKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ICAJaWYgKGVycikKPiAgCQlnb3Rv
IHVuaW5zdGFsbF9pcnE7Cj4gIAo+ICsJZHJtLT5pcnFfZW5hYmxlZCA9IHRydWU7Cj4gKwo+ICAJ
ZXJyID0gZHJtX2Rldl9yZWdpc3Rlcihkcm0sIDApOwo+ICAJaWYgKGVycikKPiAgCQlnb3RvIHVu
aW5zdGFsbF9pcnE7Cj4gQEAgLTIxMSw2ICsyMTMsNyBAQCBzdHJ1Y3Qga29tZWRhX2ttc19kZXYg
KmtvbWVkYV9rbXNfYXR0YWNoKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ICAJcmV0dXJuIGtt
czsKPiAgCj4gIHVuaW5zdGFsbF9pcnE6Cj4gKwlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4g
IAlkcm1faXJxX3VuaW5zdGFsbChkcm0pOwo+ICBjbGVhbnVwX21vZGVfY29uZmlnOgo+ICAJZHJt
X21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKPiBAQCAtMjI1LDYgKzIyOCw3IEBAIHZvaWQga29t
ZWRhX2ttc19kZXRhY2goc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMpCj4gIAlzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtID0gJmttcy0+YmFzZTsKPiAgCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0g
ZHJtLT5kZXZfcHJpdmF0ZTsKPiAgCj4gKwlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4gIAlt
ZGV2LT5mdW5jcy0+ZGlzYWJsZV9pcnEobWRldik7Cj4gIAlkcm1fZGV2X3VucmVnaXN0ZXIoZHJt
KTsKPiAgCWRybV9pcnFfdW5pbnN0YWxsKGRybSk7Cj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
