Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B99A15279F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 09:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B416E966;
	Wed,  5 Feb 2020 08:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7729D6E966;
 Wed,  5 Feb 2020 08:43:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so1576530wmi.5;
 Wed, 05 Feb 2020 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=hofsal/+J1DkEh/A0bMQg/14AtuyfYhdycW8zHJa91M=;
 b=q8vV/mphw3IXoyA770tOQyRVXPDD2nXK6V/h6J3tgU7ti3TL8XR7fLgDofrZ4lqj3f
 rJOGf0HNfYVh4TRTcF6CYRdf4dywqInOuB0yeR3iFh40SdX0y4qw2d4Cn+i3YhMeqfZ6
 9n9PtxzXtNATudr/Gw6I/1qHI98yG12Zep9XzUh/6k5uRhChsaK69RdyQ1eQ9SgN62Mr
 gFwMtjR49mO2K0qoYFpzL/zBonJ/M8CfCblwoo80DrfqKp5lqYEdMlu63i2AKxcpolDP
 eU7c13c5hLb8Az1FN+AgDhLpVvXaGOIA+AxWxknICS6EPrkDr0eBr+1iOAiEZBZoXNaq
 ORsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=hofsal/+J1DkEh/A0bMQg/14AtuyfYhdycW8zHJa91M=;
 b=rSIHlKmPaidFnl3oMDdETAVS99LZyoxNf239FY7FBZ5WiLMsFwVyYpwezFkCVq0x1Z
 UJ4BVHWtbWt43QH3uZTMUSTwAT7zcHDiOkZMuz0cq+P3IQ63JX3zISqkaGzZomTicDYn
 sc4YRbItkEVun7yMgNg8g9y4QhhQzfF6FBCRSFcuRiicn5WGIL0OjPscjB7DbHfL0J3f
 jhiSmqc7UHsNcDmODRaZBk2MWhj0BKh4OkTTpt8i5eZY8eCM5Iu/0+hfPChrIpmm36+q
 qucceO6A3d3Qi+1xw0tIybQnC/5bGGYgxOkqjUpDWy8gkdMKvNWaPqdekodgdfvNgpUt
 3SZA==
X-Gm-Message-State: APjAAAVzfQWhgeI09zh8dVOdKHY/3GYjgwFBpsW0rmre4BidohQeZdmp
 CDZmUkmBOBw2hESLp5ABuQg=
X-Google-Smtp-Source: APXvYqyqME4BIOGQaYU7wMMFzCW3efXUnpxa1MB0tHB8VtwVQWywgJZJm5sJtsskV+9symO6GuT1Kg==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr4323214wmb.73.1580892181059;
 Wed, 05 Feb 2020 00:43:01 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g18sm6975158wmh.48.2020.02.05.00.43.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Feb 2020 00:43:00 -0800 (PST)
Subject: Re: [PATCH 00/14] amdgpu: remove load and unload callbacks
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200205034852.4157-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <55465772-40ef-2525-630a-8eaa8217a7f1@gmail.com>
Date: Wed, 5 Feb 2020 09:42:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200205034852.4157-1-alexander.deucher@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDIuMjAgdW0gMDQ6NDggc2NocmllYiBBbGV4IERldWNoZXI6Cj4gVGhlc2UgYXJlIGRl
cHJlY2F0ZWQgYW5kIHRoZSBkcm0gd2lsbCBzb29uIHN0YXJ0IHdhcm5pbmcgd2hlbiBkcml2ZXJz
IHN0aWxsCj4gdXNlIHRoZW0uICBJdCB3YXMgYSBsb25nIGFuZCB0d2lzdHkgcm9hZCwgYnV0IHNl
ZW1zIHRvIHdvcmsuCgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPiBmb3IgdGhlIHdob2xlIHNlcmllcy4KCj4KPiBBbGV4IERldWNoZXIgKDE0KToK
PiAgICBkcm0vYW1kZ3B1OiByZW5hbWUgYW1kZ3B1X2RlYnVnZnNfcHJlZW1wdF9jbGVhbnVwCj4g
ICAgZHJtL2FtZGdwdS90dG06IG1vdmUgZGVidWdmcyBpbml0IGludG8gY29yZSBhbWRncHUgZGVi
dWdmcwo+ICAgIGRybS9hbWRncHUvcG06IG1vdmUgZGVidWdmcyBpbml0IGludG8gY29yZSBhbWRn
cHUgZGVidWdmcwo+ICAgIGRybS9hbWRncHUvc2E6IG1vdmUgZGVidWdmcyBpbml0IGludG8gY29y
ZSBhbWRncHUgZGVidWdmcwo+ICAgIGRybS9hbWRncHUvZmVuY2U6IG1vdmUgZGVidWdmcyBpbml0
IGludG8gY29yZSBhbWRncHUgZGVidWdmcwo+ICAgIGRybS9hbWRncHUvZ2VtOiBtb3ZlIGRlYnVn
ZnMgaW5pdCBpbnRvIGNvcmUgYW1kZ3B1IGRlYnVnZnMKPiAgICBkcm0vYW1kZ3B1L3JlZ3M6IG1v
dmUgZGVidWdmcyBpbml0IGludG8gY29yZSBhbWRncHUgZGVidWdmcwo+ICAgIGRybS9hbWRncHUv
ZmlybXdhcmU6IG1vdmUgZGVidWdmcyBpbml0IGludG8gY29yZSBhbWRncHUgZGVidWdmcwo+ICAg
IGRybS9hbWRncHU6IGRvbid0IGNhbGwgZHJtX2Nvbm5lY3Rvcl9yZWdpc3RlciBmb3Igbm9uLU1T
VCBwb3J0cwo+ICAgIGRybS9hbWRncHUvZGlzcGxheTogbW92ZSBkZWJ1Z2ZzIGluaXQgaW50byBj
b3JlIGFtZGdwdSBkZWJ1Z2ZzCj4gICAgZHJtL2FtZC9kaXNwbGF5OiBtb3ZlIGRwY2QgZGVidWdm
cyBtZW1iZXJzIHNldHVwCj4gICAgZHJtL2FtZGdwdS9kaXNwbGF5OiBhZGQgYSBsYXRlIHJlZ2lz
dGVyIGNvbm5lY3RvciBjYWxsYmFjawo+ICAgIGRybS9hbWRncHUvcmluZzogbW92ZSBkZWJ1Z2Zz
IGluaXQgaW50byBjb3JlIGFtZGdwdSBkZWJ1Z2ZzCj4gICAgZHJtL2FtZGdwdTogZHJvcCBsZWdh
Y3kgZHJtIGxvYWQgYW5kIHVubG9hZCBjYWxsYmFja3MKPgo+ICAgLi4uL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jICAgIHwgIDEgLQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyAgIHwgNjcgKysrKysrKysrKysrKysrKysrLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuaCAgIHwgIDIgKy0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgICB8IDE3IC0tLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgICAgICAgfCAxMyAr
KystCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYyAgICAgfCAg
MyAtCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYyAgICAgICAgfCAg
NyArLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oICAgIHwg
IDEgKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgICAgICAgIHwg
IDkgKy0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uaCAgICAgICAg
fCAgMiArCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jICAgICAg
fCAxNSArLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaCAg
ICAgIHwgIDQgKysKPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAg
ICAgICB8IDE0ICstLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
aCAgICAgICB8ICAzICsKPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92aXJ0dWFs
LmMgICAgICB8ICAxIC0KPiAgIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYyB8IDI2ICsrKy0tLS0KPiAgIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX2RlYnVnZnMuYyB8ICAzICsKPiAgIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
bXN0X3R5cGVzLmMgICB8ICAyIC0KPiAgIDE4IGZpbGVzIGNoYW5nZWQsIDExMiBpbnNlcnRpb25z
KCspLCA3OCBkZWxldGlvbnMoLSkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
