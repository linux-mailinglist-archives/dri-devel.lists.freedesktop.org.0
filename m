Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863925D829
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 00:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D09F6E0A1;
	Tue,  2 Jul 2019 22:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A356E09E;
 Tue,  2 Jul 2019 22:49:05 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so123637edr.11;
 Tue, 02 Jul 2019 15:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SUMBHjqHxfFISJ4tsGh6gHnVJafzY5uBObk9/M1SI6Y=;
 b=IeABfuP7GoYFnPDbyLqwvi7fxUi3pVDLGGJNl+YUnKfHnDh14pQdR7inL5oMSvjOtQ
 l8aMtoNl//7IC/aogujYnuzs7FTju02xgezmKjymmA5G0Xzom4J97y+iDpM+a+JYvkbS
 bBGDE3Q+ktpN4TQmThyp64JTH7R6qCXNG9LHQ+yTL0ItK8n2MMK5ZVTzv0/n7CVHkEa1
 abQbXZE4FnjHFlP6hWzN4IPJxsfbDeOS/N5nT34S8UY367UTXv1IajUHwlIO4Lvo/1ZY
 qlGqzJlFZkqmpHPXgc9DFCtqF+TKT/9WwFbR6Xq6MSI+JN0uCJQ2wnHowKkr8j99jodK
 4YgQ==
X-Gm-Message-State: APjAAAUeNiaTpVnOmqpZW+JIvYP8LaJUZy1TL43+5UAByWaVYChC/4sO
 2KgMPbzJSff+peNa3U86uMKbS689rzKhKR4OmI4=
X-Google-Smtp-Source: APXvYqx4j4OCiYpTjzpwx7oNckBn+SqKRP14iTHp1P6MaiYoDQDLUnA3ecoEITujxJ6YGjIOt/liDhVugoLpxJ8Knu0=
X-Received: by 2002:a50:9468:: with SMTP id q37mr38323779eda.163.1562107743736; 
 Tue, 02 Jul 2019 15:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-3-robdclark@gmail.com>
 <CAKv+Gu_8BOt+f8RTspHo+se-=igZba1zL0+jWLV2HuuUXCKYpA@mail.gmail.com>
 <CAKv+Gu-KhPJxxJA3+J813OPcnoAD4nHq6MhiRTJSd_5y1dPNnw@mail.gmail.com>
 <CAF6AEGv+uAXVV6Q78n=jP0YRDjYn9OS=Xec9MU0+_7EBirxF5w@mail.gmail.com>
 <20190702215953.wdqges66hx3ge4jr@bivouac.eciton.net>
In-Reply-To: <20190702215953.wdqges66hx3ge4jr@bivouac.eciton.net>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 2 Jul 2019 15:48:48 -0700
Message-ID: <CAF6AEGvm62rcm4Lp4a+QmqFweVQ0QWXLDoN2CP8=40BdwiiVbQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] efi/libstub: detect panel-id
To: Leif Lindholm <leif.lindholm@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SUMBHjqHxfFISJ4tsGh6gHnVJafzY5uBObk9/M1SI6Y=;
 b=p4QfsUpxZBUPSNbm9a2ya6+yOVBLb06CncvEKO0qxtLknZ9dc5s45n/yCCCk8pVAGr
 kTtuJCFsVLSmNXI13tt/3c+qkzMeuAESDbdCbiFxU8ZGu73hjgvAB7S/EKz0qJg50PM0
 mggd9oJOp7fMPe31Y0DXLnsbQg44FXj8SGYjCyvHT1W/uN6YXAprbpsjvRGAUJjnYqRY
 UbDxAZ046ar2qRfBKMqC0yk+pCMu82zzkmqLwb0ooQKB2mTZVaIkovBFit3MwyXI7wOa
 w8KYcr5NOXHJ2fqa9bjhrPr+UG3CdQ92BH7V+3eVd900MzHNSuuuaZW55wl9e7h6e4PB
 vpLQ==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Julien Thierry <julien.thierry@arm.com>, linux-efi <linux-efi@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Steve Capper <steve.capper@arm.com>, Alexander Graf <agraf@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCAyOjU5IFBNIExlaWYgTGluZGhvbG0gPGxlaWYubGluZGhv
bG1AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCAwMiwgMjAxOSBhdCAwMjowMTo0
OVBNIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiA+ID4gU28gd2UgYXJlIGRlYWxpbmcgd2l0
aCBhIHBsYXRmb3JtIHRoYXQgdmlvbGF0ZXMgdGhlIFVFRkkgc3BlYywgc2luY2UKPiA+ID4gPiBp
dCBkb2VzIG5vdCBib3RoZXIgdG8gaW1wbGVtZW50IHZhcmlhYmxlIHNlcnZpY2VzIGF0IHJ1bnRp
bWUgKGJlY2F1c2UKPiA+ID4gPiBNUyBsZXQgdGhlIHZlbmRvciBnZXQgYXdheSB3aXRoIHRoaXMp
Lgo+ID4gPgo+ID4gPiBUbyBjbGFyaWZ5LCB0aGUgYWJvdmUgcmVtYXJrIGFwcGxpZXMgdG8gcG9w
dWxhdGluZyB0aGUgRFQgZnJvbSB0aGUgT1MKPiA+ID4gcmF0aGVyIHRoYW4gZnJvbSB0aGUgZmly
bXdhcmUuCj4gPgo+ID4geWVhaCwgaXQgaXNuJ3QgcHJldHR5LCBidXQgdGhlcmUgKmFyZSogc29t
ZSBvdGhlciBzaW1pbGFyIGNhc2VzIHdoZXJlCj4gPiBlZmktc3R1YiBpcyBwb3B1bGF0aW5nIERU
Li4gKGxpa2UgdXBkYXRlX2ZkdF9tZW1tYXAoKSBhbmQKPiA+IGthc2xyLXNlZWQpLi4KPgo+IFRo
ZSBwcm9ibGVtIGlzbid0IHdpdGggdGhlIHN0dWIgdXBkYXRpbmcgdGhlIERULCB0aGUgcHJvYmxl
bSBpcyB3aGF0Cj4gaXQgdXBkYXRlcyBpdCB3aXRoLgo+Cj4gdXBkYXRlX2ZkdF9tZW1tYXAoKSBp
cyB0aGUgc3R1YiBmaWxsaW5nIGluIHRoZSBpbmZvcm1hdGlvbiBpdAo+IGNvbW11bmljYXRlcyB0
byB0aGUgbWFpbiBrZXJuZWwuCj4KPiBrYXNsci1zZWVkIHNldHMgYSBzdGFuZGFyZCBwcm9wZXJ0
eSB1c2luZyBhIHN0YW5kYXJkIGludGVyZmFjZSBpZiB0aGF0Cj4gaW50ZXJmYWNlIGlzIGF2YWls
YWJsZSB0byBpdCBhdCB0aGUgcG9pbnQgb2YgZXhlY3V0aW9uLgo+Cj4gU2luY2Ugd2hhdCB3ZSdy
ZSBkb2luZyBoZXJlIGlzIGRyZXNzaW5nIHVwIGFuIEFDUEkgcGxhdGZvcm0gdG8gbWFrZSBpdAo+
IGxvb2sgbGlrZSBpdCB3YXMgYSBEVCBwbGF0Zm9ybSwgYW5kIHNpbmNlIHdlIGhhdmUgdGhlIGFi
aWxpdHkgdG8gdHdlYWsKPiB0aGUgRFQgYmVmb3JlIGV2ZXIgcGFzc2luZyBpdCB0byB0aGUga2Vy
bmVsLCBsZXQncyBqdXN0IGRvIHRoYXQuCj4KPiBZZXMsIEkga25vdyBJIHNhaWQgSSdkIHJhdGhl
ciBub3QsIGJ1dCBpdCdzIHdheSBuaWNlciB0aGFuIHN0aWNraW5nCj4gcGxhdGZvcm0tc3BlY2lm
aWMgaGFja3MgaW50byB0aGUgRUZJIHN0dWIuCj4KPiAoSWYgYWRkaW5nIGl0IGFzIGEgRFQgcHJv
cGVydHkgaXMgaW5kZWVkIHRoZSB0aGluZyB0byBkby4pCj4KPiA+ID4gLi4uIGJ1dCBzYXZpbmcg
dmFyaWFibGVzIGF0IGJvb3QgdGltZSBmb3IgY29uc3VtcHRpb24gYXQgcnVudGltZSBpcwo+ID4g
PiBzb21ldGhpbmcgdGhhdCB3ZSB3aWxsIGxpa2VseSBzZWUgbW9yZSBvZiBpbiB0aGUgZnV0dXJl
Lgo+ID4KPiA+IEkgdGhpbmsgdGhpcyB3aWxsIGJlIG5pY2UsIGJ1dCBpdCBhbHNvIGRvZXNuJ3Qg
YWRkcmVzcyB0aGUgbmVlZCBmb3IgYQo+ID4gcXVpcmsgdG8gZ2V0IHRoaXMgaW50byAvY2hvc2Vu
Li4gIEkgZ3Vlc3Mgd2UgKmNvdWxkKiB1c2UgYSBzaGltIG9yCj4gPiBzb21ldGhpbmcgdGhhdCBy
dW5zIGJlZm9yZSB0aGUga2VybmVsIHRvIGRvIHRoaXMuICBCdXQgdGhhdCBqdXN0IHNlZW1zCj4g
PiBsaWtlIGEgbG9naXN0aWNhbC9zdXBwb3J0IG5pZ2h0bWFyZS4KPiA+Cj4gPiBUaGVyZSBpcyBv
bmUga2VybmVsLCBhbmQgdGhlcmUKPiA+IGFyZSBOIGRpc3RybydzLCBzbyBkZWJ1Z2dpbmcgYSB1
c2VycyAiSSBkb24ndCBnZXQgYSBzY3JlZW4gYXQgYm9vdCIKPiA+IHByb2JsZW0gYmVjYXVzZSB0
aGVpciBkaXN0cm8gbWlzc2VkIHNvbWUgc2hpbSBwYXRjaCByZWFsbHkganVzdAo+ID4gZG9lc24n
dCBzZWVtIGxpa2UgYSBoZWFkYWNoZSBJIHdhbnQgdG8gaGF2ZS4KPgo+IFRoZSBkaXN0cm9zIHNo
b3VsZCBub3QgbmVlZCB0byBiZSBhd2FyZSAqYXQgYWxsKiBvZiB0aGUgaGFja3MgcmVxdWlyZWQK
PiB0byBkaXNndWlzZSB0aGVzZSBwbGF0Zm9ybXMgYXMgRFQgcGxhdGZvcm1zLgo+Cj4gSWYgdGhl
eSBkbywgdGhleSdyZSBhbHJlYWR5IGRldmljZS1zcGVjaWZpYyBpbnN0YWxsZXJzIGFuZCBoYXZl
Cj4gYWxyZWFkeSBhY2NlcHRlZCB0aGUgbG9naXN0aWNhbC9zdXBwb3J0IG5pZ2h0bWFyZS4KPgoK
SSBndWVzcyBJJ20gbm90ICphZ2FpbnN0KiBhIERUIGxvYWRlciBzaGltIHBvcHVsYXRpbmcgdGhl
IHBhbmVsLWlkCm92ZXIgaW50byAvY2hvc2VuLi4gSSBoYWQgaXQgaW4gbWluZCBhcyBhIGJhY2t1
cCBwbGFuLiAgT2ZjIHN0aWxsIG5lZWQKdG8gZ2V0IGR0IGZvbGtzIHRvIGJ1eSBpbnRvIC9jaG9z
ZW4vcGFuZWwtaWQgYnV0IGZvciBEVCBib290IEkgdGhpbmsKdGhhdCBpcyB0aGUgYmVzdCBvcHRp
b24uICAoQXQgbGVhc3QgdGhlIC9jaG9zZW4vcGFuZWwtaWQgYXBwcm9hY2gKZG9lc24ndCByZXF1
aXJlIHRoZSBzaGltIHRvIGJlIGF3YXJlIG9mIGhvdyB0aGUgcGFuZWwgaXMgd2lyZWQgdXAgdG8K
ZHNpIGNvbnRyb2xsZXIgYW5kIHdoZXRoZXIgdGhlaXIgaXMgYSBicmlkZ2UgaW4gYmV0d2Vlbiwg
YW5kIHRoYXQKc2hvcnQgb2YgdGhpbmcsIHNvIHRoZSBwYW5lbC1pZCBhcHByb2FjaCBzZWVtcyBt
b3JlIG1haW50YWluYWJsZSB0aGF0Cm90aGVyIG9wdGlvbnMuKQoKSSBhbSBhIGJpdCBmZWFyZnVs
IG9mIHByb2JsZW1zIGFyaXNpbmcgZnJvbSBkaWZmZXJlbnQgZGlzdHJvcyBhbmQKdXNlcnMgdXNp
bmcgZGlmZmVyZW50IHZlcnNpb25zIG9mIHNoaW0sIGFuZCBob3cgdG8gbWFuYWdlIHRoYXQuICBJ
Cmd1ZXNzIGlmIHNvbWVob3cgInNoaW0gdGhpbmciIHdhcyBwYXJ0IG9mIHRoZSBrZXJuZWwsIHRo
ZXJlIHdvdWxkIGJ5Cm9uZSBsZXNzIG1vdmluZyBwYXJ0Li4uIEknZCBrbm93IGlmIHVzZXIgaGFk
IGtlcm5lbCB2WC5ZLlogdGhleSdkIGJlCmdvb2QgdG8gZ28gdnMgbm90LiAgQnV0ICphbHNvKiBk
ZXBlbmRpbmcgb24gYSBuZXctZW5vdWdoIHZlcnNpb24gb2YgYQpzaGltLCB3aGVyZSB0aGUgdmVy
c2lvbiAjIGlzIHByb2JhYmx5IG5vdCBlYXNpbHkgYXBwYXJlbnQgdG8gdGhlIGVuZAp1c2VyLCBz
b3VuZHMgYSBiaXQgc2NhcnkgZnJvbSB0aGUgImFsbCB0aGUgdGhpbmdzIHRoYXQgY2FuIGdvIHdy
b25nIgpwb2ludCBvZiB2aWV3LiAgTWF5YmUgSSdtIHBhcmFub2lkLCBidXQgSSdtIGEgYml0IHdv
cnJpZWQgYWJvdXQgaG93IHRvCm1hbmFnZSB0aGF0LgoKQlIsCi1SCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
