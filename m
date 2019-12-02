Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A165D10ED79
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 17:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BAD6E25B;
	Mon,  2 Dec 2019 16:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDAD6E25B;
 Mon,  2 Dec 2019 16:49:10 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e10so12724945edv.9;
 Mon, 02 Dec 2019 08:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JCNF6tgwefhUIMTdjVdbK7yFqIKcfTu3pjPnwJ0a8Uo=;
 b=sEb90PW76KaxkU1Q8pSkzDyAUW/tuKgLZ7PV3hKdvaAn7ej70XOF0qih8dlVL9oKu4
 s6rbO45Wm3ROdO1zCO+TRFLokCLmugb8qYdQN3daigYR1/DfGHryypn5vAnTozLkJCmC
 x6Cd5JGmXEVvvKwDblC7u4Rm+je5ujCA9YbOvv1Tq5LwugTRmj0YlIfy/LGlHh/F33Jm
 TB7ibxtOfRzmUPHPvhRlAivX/KhTXYCOM/nel8Pb9NBO16JLCHXgJWiSk4r+k9bZ3IbB
 KVxgsn+D1f7kZEyCsh9a/EnoZunKhyKJ9lGhHpScjDdU+A56CUU0QrpiPAYzy6mC6IZQ
 Friw==
X-Gm-Message-State: APjAAAUAyALm1QTdJRSufBlpsnGj+9B06hB1tB1IKnsPDYw/W21KoS7W
 xzl0k2AlphER2YnWLJYZwdkoAD/oA5vHolITu/8Ip6uN
X-Google-Smtp-Source: APXvYqwOkds5zFJUwr1u9M8V2LfokAmaX+ozape5Zik4y2kw1WrjcT4qQdtDQd32rn1gW2vmWsf3uHb2NXG6Oy8/oOQ=
X-Received: by 2002:a50:fc85:: with SMTP id f5mr27812882edq.294.1575305349177; 
 Mon, 02 Dec 2019 08:49:09 -0800 (PST)
MIME-Version: 1.0
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6df0d33-edb8acfc-a6f1-486e-a8db-38ec498951ed-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ec6df0d33-edb8acfc-a6f1-486e-a8db-38ec498951ed-000000@us-west-2.amazonses.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 2 Dec 2019 08:48:58 -0800
Message-ID: <CAF6AEGtHkPSx8xU+CdomDtOqLr-cC2bgfHngWWZzx=8STAsQtA@mail.gmail.com>
Subject: Re: [DPU PATCH v3 3/5] drm/msm/dp: add displayPort driver support
To: Chandan Uddaraju <chandanu@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JCNF6tgwefhUIMTdjVdbK7yFqIKcfTu3pjPnwJ0a8Uo=;
 b=lk0XviqhK/oQnxW7KxSv6xIA7fuGC1wjpikxD+6lZuj6OxvsoblVOz65xae/1GRzSN
 Da8mMBMC9Vi0tO1p4z7dnjGEdNZFqPOr6FgK9U6Z0rdnx+3ZKep4j/ivuWPpDsko8+eh
 ZBAidPmsZAIQA8cuxKIrCueFM4s8IucnbcWIbyCv+rfQEZF0HZ5zZM/FNQU31jqSxI15
 6NvKe5D80gcGPM2KlO4EdMVeXxHqLVRh6tbPx3GVCxU4c9HHsMHw3uk7nkWajshX/7sm
 cm7nB/kZ3S9y1nef7oTSxYlxPCwM2upuxZdGvfzFLpwknBL/zt9BeAnUHmdfGgCriWFN
 9X5Q==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMiwgMjAxOSBhdCA1OjQ4IEFNIENoYW5kYW4gVWRkYXJhanUgPGNoYW5kYW51
QGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPgo+IEFkZCB0aGUgbmVlZGVkIGRpc3BsYXlQb3J0IGZp
bGVzIHRvIGVuYWJsZSBEUCBkcml2ZXIKPiBvbiBtc20gdGFyZ2V0Lgo+Cj4gImRwX2Rpc3BsYXki
IG1vZHVsZSBpcyB0aGUgbWFpbiBtb2R1bGUgdGhhdCBjYWxscyBpbnRvCj4gb3RoZXIgc3ViLW1v
ZHVsZXMuICJkcF9kcm0iIGZpbGUgcmVwcmVzZW50cyB0aGUgaW50ZXJmYWNlCj4gYmV0d2VlbiBE
Uk0gZnJhbWV3b3JrIGFuZCBEUCBkcml2ZXIuCj4KPiBjaGFuZ2VzIGluIHYyOgo+IC0tIFVwZGF0
ZSBjb3B5cmlnaHQgbWFya2luZ3Mgb24gYWxsIHJlbGV2YW50IGZpbGVzLgo+IC0tIENoYW5nZSBw
cl9lcnIoKSB0byBEUk1fRVJST1IoKQo+IC0tIFVzZSBBUElzIGRpcmVjdGx5IGluc3RlYWQgb2Yg
ZnVuY3Rpb24gcG9pbnRlcnMuCj4gLS0gVXNlIGRybV9kaXNwbGF5X21vZGUgc3RydWN0dXJlIHRv
IHN0b3JlIGxpbmsgcGFyYW1ldGVycyBpbiB0aGUgZHJpdmVyLgo+IC0tIFVzZSBtYWNyb3MgZm9y
IHJlZ2lzdGVyIGRlZmluaXRpb25zIGluc3RlYWQgb2YgaGFyZGNvZGVkIHZhbHVlcy4KPiAtLSBS
ZXBsYWNlIHdyaXRlbF9yZWxheGVkL3JlYWRsX3JlbGF4ZWQgd2l0aCB3cml0ZWwvcmVhZGwKPiAg
ICBhbmQgcmVtb3ZlIG1lbW9yeSBiYXJyaWVycy4KPiAtLSBSZW1vdmUgdW5uZWNlc3NhcnkgTlVM
TCBjaGVja3MuCj4gLS0gVXNlIGRybSBoZWxwZXIgZnVuY3Rpb25zIGZvciBkcGNkIHJlYWQvd3Jp
dGUuCj4gLS0gVXNlIERSTV9ERUJVR19EUCBmb3IgZGVidWcgbXNncy4KPgo+IGNoYW5nZXMgaW4g
VjM6Cj4gLS0gUmVtb3ZlZCBjaGFuZ2VzIGluIGRwdV9pb191dGlsLltjaF0KPiAtLSBBZGRlZCBs
b2NraW5nIGFyb3VuZCAiaXNfY29ubmVjdGVkIiBmbGFnIGFuZCByZW1vdmVkIGF0b21pY19zZXQo
KQo+IC0tIFJlbW92ZWQgdGhlIGFyZ3VtZW50IHZhbGlkYXRpb24gY2hlY2tzIGluIGFsbCB0aGUg
c3RhdGljIGZ1bmN0aW9ucwo+ICAgIGV4Y2VwdCBpbml0aWFsaXphdGlvbiBmdW5jdGlvbnMgYW5k
IGZldyBBUEkgY2FsbHMgYWNyb3NzIG1zbS9kcCBmaWxlcwo+IC0tIFJlbW92ZWQgaGFyZGNvZGVk
IHZhbHVlcyBmb3IgcmVnaXN0ZXIgcmVhZHMvd3JpdGVzCj4gLS0gUmVtb3ZlZCB2cmVnIHJlbGF0
ZWQgZ2VuZXJpYyBzdHJ1Y3R1cmVzLgo+IC0tIEFkZGVkIHJldHVybiB2YWx1ZXMgd2hlcmUgZXZl
ciBuZWNlc3NhcnkuCj4gLS0gVXBkYXRlZCBkcF9jdHJsX29uIGZ1bmN0aW9uLgo+IC0tIENhbGxp
bmcgdGhlIGN0cmwgc3BlY2lmaWMgY2F0YWxvZyBmdW5jdGlvbnMgZGlyZWN0bHkgaW5zdGVhZCBv
Zgo+ICAgIGZ1bmN0aW9uIHBvaW50ZXJzLgo+IC0tIEFkZGVkIHNlcGVyYXRlIGNoYW5nZSB0aGF0
IGFkZHMgc3RhbmRhcmQgdmFsdWUgaW4gZHJtX2RwX2hlbHBlciBmaWxlLgo+IC0tIEFkZGVkIHNl
cGFyYXRlIGNoYW5nZSBpbiB0aGlzIGxpc3QgdGhhdCBpcyB1c2VkIHRvIGluaXRpYWxpemUKPiAg
ICBkaXNwbGF5cG9ydCBpbiBEUFUgZHJpdmVyLgo+IC0tIEFkZGVkIGNoYW5nZSB0byB1c2UgZHJt
X2RwX2dldF9hZGp1c3RfcmVxdWVzdF92b2x0YWdlKCkgZnVuY3Rpb24uCj4KPiBTaWduZWQtb2Zm
LWJ5OiBDaGFuZGFuIFVkZGFyYWp1IDxjaGFuZGFudUBjb2RlYXVyb3JhLm9yZz4KPiAtLS0KCltz
bmlwXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Vu
Y29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKPiBp
bmRleCBmOTZlMTQyLi4yOWFjN2QzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfZW5jb2Rlci5jCj4gQEAgLTk2Nyw2ICs5NjcsOSBAQCBzdGF0aWMgdm9pZCBkcHVf
ZW5jb2Rlcl92aXJ0X21vZGVfc2V0KHN0cnVjdCBkcm1fZW5jb2RlciAqZHJtX2VuYywKPgo+ICAg
ICAgICAgdHJhY2VfZHB1X2VuY19tb2RlX3NldChEUk1JRChkcm1fZW5jKSk7Cj4KPiArICAgICAg
IGlmIChkcm1fZW5jLT5lbmNvZGVyX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9UTURTICYmIHBy
aXYtPmRwKQo+ICsgICAgICAgICAgICAgICBtc21fZHBfZGlzcGxheV9tb2RlX3NldChwcml2LT5k
cCwgZHJtX2VuYywgbW9kZSwgYWRqX21vZGUpOwo+ICsKCmZvciBiZXR0ZXIgb3IgZm9yIHdvcnNl
LCBEU0kgYW5kIEhETUkgYmFja2VuZHMgY3JlYXRlIGFuIGludGVybmFsCmRybV9icmlkZ2Ugb2Jq
ZWN0IHRvIGF2b2lkIGFsbCBvZiB0aGVzZSBzaHVudHMgb3ZlciBmcm9tIHRoZSBlbmNvZGVyLgpX
ZSBtaWdodCBiZSBzdGlsbCB0aGUgb25seSBkcml2ZXIgdG8gZG8gdGhpcywgYnV0IElNSE8gaXQg
aXMgYmV0dGVyCnRoYW4gbWFraW5nIGVhY2ggZW5jb2RlciBrbm93IGFib3V0IGVhY2ggYmFja2Vu
ZCwgc28gd2UgbWlnaHQgYXMgd2VsbApzdGljayB3aXRoIHRoYXQuCgooc2FtZSBnb2VzIGZvciB0
aGUgb3RoZXIgJ2lmIChkcm1fZW5jLT5lbmNvZGVyX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9U
TURTKSdzKQoKQlIsCi1SCgoKPiAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoY29ubl9pdGVy
LCBjb25uZWN0b3JfbGlzdCwgaGVhZCkKPiAgICAgICAgICAgICAgICAgaWYgKGNvbm5faXRlci0+
ZW5jb2RlciA9PSBkcm1fZW5jKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbm4gPSBjb25u
X2l0ZXI7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
