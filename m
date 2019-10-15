Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FA7D6DEF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 05:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044F46E5ED;
	Tue, 15 Oct 2019 03:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
 [209.85.221.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA926E5EC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 03:48:50 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id d126so4006003vkb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 20:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ShNj6dpdoV3qxQt4i9xwFO5EQ7UppT+qckLzoe6/RVM=;
 b=eCp/TOLiqYd1s4tC41MxzdauGvPWvhmJpyWB0dguJNhN0vkdrZ24zvDMnzx4uUQ0Rt
 PsgSK1FiiZLLX0JUM+D5a3WOz19/N5yM7qK7QGizeM41lTjF7J5BWlPpCAU/IP8J1Rph
 frrXNQkbvIBtxnp18Y2mpd9Anczotg+M4ZmLdZl7Ajfpp1q7dCj//bvnxtyua0i3YIZr
 yUX7Q7uuyZV9YakroIv3dG0CBVevvcJq+759hap1LwxOMj0dV+lY5d0ExUO46Z6/JWqN
 JE7yFTv+IlEAA3Ivei8QkcOLh6DAmlYd0lNfaI4KvRmGg+zuFswGZKtxJLjEg3M00vd4
 P9rA==
X-Gm-Message-State: APjAAAWCVAo+oZXLGFRD2Etzn8pMB7aD8w0fvkpLBp7cp0EwQtWSWWGL
 h8m+HLe2ytmIvauWLQOxO09Krm9d1atqs7/WrRE=
X-Google-Smtp-Source: APXvYqxH5f7OmvnZ/VqNozEqskHJCWXLm5Yf1SmDDoJ889PXslulCrMngbZQcWghJZlRkZDfRWKDbqse5aSs/aSpn7Y=
X-Received: by 2002:a1f:1d15:: with SMTP id d21mr17456229vkd.55.1571111329347; 
 Mon, 14 Oct 2019 20:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191011054240.17782-1-james.qian.wang@arm.com>
 <20191011054240.17782-2-james.qian.wang@arm.com>
 <CAKb7Uvik6MZSwCQ4QF7ed1wttfufbR-J4vNdOtYzM+1tqPE_vw@mail.gmail.com>
 <20191015011604.GA26941@jamwan02-TSP300>
In-Reply-To: <20191015011604.GA26941@jamwan02-TSP300>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 14 Oct 2019 23:48:38 -0400
Message-ID: <CAKb7Uvh7y20oikYR+UpabgXLHJM2i+2DPVyYSwE37d=NpheUGg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgOToxNiBQTSBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKQo8amFtZXMucWlhbi53YW5nQGFybS5jb20+IHdyb3RlOgo+IE9uIE1vbiwg
T2N0IDE0LCAyMDE5IGF0IDExOjU4OjQ4QU0gLTA0MDAsIElsaWEgTWlya2luIHdyb3RlOgo+ID4g
T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTo0MyBBTSBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKQo+ID4gPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPiB3cm90ZToKPiA+ID4g
KyAqCj4gPiA+ICsgKiBDb252ZXJ0IGFuZCBjbGFtcCBTMzEuMzIgc2lnbi1tYWduaXR1ZGUgdG8g
UW0ubiAyJ3MgY29tcGxlbWVudC4KPiA+ID4gKyAqLwo+ID4gPiArdWludDY0X3QgZHJtX2NvbG9y
X2N0bV9zMzFfMzJfdG9fcW1fbih1aW50NjRfdCB1c2VyX2lucHV0LAo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IG0sIHVpbnQzMl90IG4pCj4gPiA+
ICt7Cj4gPiA+ICsgICAgICAgdTY0IG1hZyA9ICh1c2VyX2lucHV0ICYgfkJJVF9VTEwoNjMpKSA+
PiAoMzIgLSBuKTsKPiA+ID4gKyAgICAgICBib29sIG5lZ2F0aXZlID0gISEodXNlcl9pbnB1dCAm
IEJJVF9VTEwoNjMpKTsKPiA+ID4gKyAgICAgICBzNjQgdmFsOwo+ID4gPiArCj4gPiA+ICsgICAg
ICAgLyogdGhlIHJhbmdlIG9mIHNpZ25lZCAycyBjb21wbGVtZW50IGlzIFstMl5uK20sIDJebitt
IC0gMV0gKi8KPiA+Cj4gPiBUaGlzIGltcGxpZXMgdGhhdCBuID0gMzIsIG0gPSAwIHdvdWxkIGFj
dHVhbGx5IHlpZWxkIGEgMzMtYml0IDIncwo+ID4gY29tcGxlbWVudCBudW1iZXIuIElzIHRoYXQg
d2hhdCB5b3UgbWVhbnQ/Cj4KPiBZZXMsIHNpbmNlIG0gZG9lc24ndCBpbmNsdWRlIHNpZ24tYml0
IFNvIGEgUTAuMzIgaXMgYSAzM2JpdCB2YWx1ZS4KClRoaXMgZ29lcyBjb3VudGVyIHRvIHdoYXQg
dGhlIHdpa2lwZWRpYSBwYWdlIHNheXMgWwpodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9R
XyhudW1iZXJfZm9ybWF0KSBdOgoKKHJlZm9ybWF0dGVkIHNsaWdodGx5IGZvciB0ZXh0LW9ubHkg
Y29uc3VtcHRpb24pOgoKIiIiCkZvciBleGFtcGxlLCBhIFExNS4xIGZvcm1hdCBudW1iZXI6Cgot
IHJlcXVpcmVzIDE1KzEgPSAxNiBiaXRzCi0gaXRzIHJhbmdlIGlzIFstMl4xNCwgMl4xNCAtIDJe
LTFdID0gWy0xNjM4NC4wLCArMTYzODMuNV0gPSBbMHg4MDAwLAoweDgwMDEgLi4uIDB4RkZGRiwg
MHgwMDAwLCAweDAwMDEgLi4uIDB4N0ZGRSwgMHg3RkZGXQotIGl0cyByZXNvbHV0aW9uIGlzIDJe
LTEgPSAwLjUKIiIiCgpUaGlzIHN1Z2dlc3RzIHRoYXQgdGhlIHByb3BlciB3YXkgdG8gcmVwcmVz
ZW50IGEgc3RhbmRhcmQgMzItYml0IDIncwpjb21wbGVtZW50IGludGVnZXIgd291bGQgYmUgUTMy
LjAuCgogIC1pbGlhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
