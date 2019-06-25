Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C45573F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 20:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4056E1CE;
	Tue, 25 Jun 2019 18:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1666B6E1CE;
 Tue, 25 Jun 2019 18:31:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so18996115wrm.8;
 Tue, 25 Jun 2019 11:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1k6hfZcpJIBaCfeqIL60ce8xDXxgWj93nj94jCgJSTo=;
 b=aj2ntNIHSVbRYv+6pooiaKz1MCusfjnBbcjWKcwUDbg669rECHVhH1iNJXsQJLcLet
 uEEjLCRb9BGs1Z4BlHq/wCTQNRb+4oAlSO+cB17+BqbuIDNMf2U9mFCYIjOwlhgO+yd8
 PPylRxAyFaIwIgs9QFD2s0U+ZK+3zWxhtaI932WQHzsUY1OKFeF8kCWIJAKuhm0CgPev
 lRokNqY3JSG0WjAq2NczDqisy8/weEu0Q77bxYjhVtKDoN44qTSfdXZ3S2JzVDJYdsBR
 yqKXiTci27Lp92Cl/drknkCd6iZ9tSL3Y4TFn40A2SKXM9DSmi2W2lrMd1E/vPr74dGE
 1lSA==
X-Gm-Message-State: APjAAAUAYS8vegamrHk0VV41NV3OPo2thO3jRSwrqtZjZv81ns+AQOcW
 0veBS12w/GChNA5CPqSi3Xz6bP/5pXNhBhZsitc=
X-Google-Smtp-Source: APXvYqwfe6KcLiCe8FzulhaOqL1BbjYOGqtafi2ofby/R8/XEKqS+DPyFOG5DnAaeHtviD5jOo78NRS7rIJt7YWYQ08=
X-Received: by 2002:a5d:4752:: with SMTP id o18mr13462492wrs.74.1561487494677; 
 Tue, 25 Jun 2019 11:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190620232127.25436-1-lyude@redhat.com>
In-Reply-To: <20190620232127.25436-1-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Jun 2019 14:31:22 -0400
Message-ID: <CADnq5_OsM9H3mT8cnobWGOfQH7qEfq8thYtqsFHmnb06v8sTDA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Don't skip display settings in hwmgr_resume()
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1k6hfZcpJIBaCfeqIL60ce8xDXxgWj93nj94jCgJSTo=;
 b=chHO/3WEzBX/decN9UB4l37wLw6z5xTvYZGNBOMe9Z9yTmakHWVHUmyabomJX3nL3M
 aI0J4BoysTsG5hi4JvoahKxA2psG7dUGssEpIwqoMDTXSu33VB+SsdOwP8bIsbwMITxw
 BNdePvVU+tt/I+KD7Yw6Sl5gxP0uUOqqpOhCN9Bv7TmOsmF5Y5NYHbaIjQWQr+pkcFan
 q4M7Q944QOpB1VSz3+lAcX4ChtZnVir5tKpfS4/+OZmKseIgFI38HSYEbQOxuOWCXc6B
 kqJeDXQ8tgUXNqzoQaSEphFa3cwiESCPqJxQrhHt4i2hnb2hj7RVVoAwPlnZ2ntTEoI0
 FLpA==
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
Cc: David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, "for 3.8" <stable@vger.kernel.org>,
 Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgNzoyMiBQTSBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPiB3cm90ZToKPgo+IEknbSBub3QgZW50aXJlbHkgc3VyZSB3aHkgdGhpcyBpcywgYnV0IGZv
ciBzb21lIHJlYXNvbjoKPgo+IDkyMTkzNWRjNjQwNCAoImRybS9hbWQvcG93ZXJwbGF5OiBlbmZv
cmNlIGRpc3BsYXkgcmVsYXRlZCBzZXR0aW5ncyBvbmx5IG9uIG5lZWRlZCIpCj4KPiBCcmVha3Mg
cnVudGltZSBQTSByZXN1bWUgb24gdGhlIFJhZGVvbiBQUk8gV1ggMzEwMCAoTGV4YSkgaW4gb25l
IHRoZQo+IHByZS1wcm9kdWN0aW9uIGxhcHRvcHMgSSBoYXZlLiBUaGUgaXNzdWUgbWFuaWZlc3Rz
IGFzIHRoZSBmb2xsb3dpbmcKPiBtZXNzYWdlcyBpbiBkbWVzZzoKPgo+IFtkcm1dIFVWRCBhbmQg
VVZEIEVOQyBpbml0aWFsaXplZCBzdWNjZXNzZnVsbHkuCj4gYW1kZ3B1IDAwMDA6M2I6MDAuMDog
W2RybTphbWRncHVfcmluZ190ZXN0X2hlbHBlciBbYW1kZ3B1XV0gKkVSUk9SKiByaW5nIHZjZTEg
dGVzdCBmYWlsZWQgKC0xMTApCj4gW2RybTphbWRncHVfZGV2aWNlX2lwX3Jlc3VtZV9waGFzZTIg
W2FtZGdwdV1dICpFUlJPUiogcmVzdW1lIG9mIElQIGJsb2NrIDx2Y2VfdjNfMD4gZmFpbGVkIC0x
MTAKPiBbZHJtOmFtZGdwdV9kZXZpY2VfcmVzdW1lIFthbWRncHVdXSAqRVJST1IqIGFtZGdwdV9k
ZXZpY2VfaXBfcmVzdW1lIGZhaWxlZCAoLTExMCkuCj4KPiBBbmQgaGFwcGVucyBhZnRlciBhYm91
dCA2LTEwIHJ1bnRpbWUgUE0gc3VzcGVuZC9yZXN1bWUgY3ljbGVzIChzb21ldGltZXMKPiBzb29u
ZXIsIGlmIHlvdSdyZSBsdWNreSEpLiBVbmZvcnR1bmF0ZWx5IEkgY2FuJ3Qgc2VlbSB0byBwaW4g
ZG93bgo+IHByZWNpc2VseSB3aGljaCBwYXJ0IGluIHBzbV9hZGp1c3RfcG93ZXJfc3RhdGVfZHlu
YW1pYyB0aGF0IGlzIGNhdXNpbmcKPiB0aGUgaXNzdWUsIGJ1dCBub3Qgc2tpcHBpbmcgdGhlIGRp
c3BsYXkgc2V0dGluZyBzZXR1cCBzZWVtcyB0byBmaXggaXQuCj4gSG9wZWZ1bGx5IGlmIHRoZXJl
IGlzIGEgYmV0dGVyIGZpeCBmb3IgdGhpcywgdGhpcyBwYXRjaCB3aWxsIHNwYXJrCj4gZGlzY3Vz
c2lvbiBhcm91bmQgaXQuCj4KCkV2YW4sIGFueSBpZGVhcyBvbiB0aGlzPyAgT3RoZXJ3aXNlLCBs
ZXQncyBqdXN0IGFwcGx5IGl0LgoKQWxleAoKCj4gRml4ZXM6IDkyMTkzNWRjNjQwNCAoImRybS9h
bWQvcG93ZXJwbGF5OiBlbmZvcmNlIGRpc3BsYXkgcmVsYXRlZCBzZXR0aW5ncyBvbmx5IG9uIG5l
ZWRlZCIpCj4gQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogSHVhbmcgUnVpIDxyYXkuaHVh
bmdAYW1kLmNvbT4KPiBDYzogUmV4IFpodSA8UmV4LlpodUBhbWQuY29tPgo+IENjOiBMaWt1biBH
YW8gPExpa3VuLkdhb0BhbWQuY29tPgo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2
NS4xKwo+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9od21nci5jCj4gaW5kZXggNmNkNjQ5N2M2
ZmMyLi4wZTFiMmQ5MzA4MTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvaHdtZ3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL2h3bWdyLmMKPiBAQCAtMzI1LDcgKzMyNSw3IEBAIGludCBod21ncl9yZXN1bWUoc3Ry
dWN0IHBwX2h3bWdyICpod21ncikKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7Cj4KPiAtICAgICAgIHJldCA9IHBzbV9hZGp1c3RfcG93ZXJfc3RhdGVfZHlu
YW1pYyhod21nciwgdHJ1ZSwgTlVMTCk7Cj4gKyAgICAgICByZXQgPSBwc21fYWRqdXN0X3Bvd2Vy
X3N0YXRlX2R5bmFtaWMoaHdtZ3IsIGZhbHNlLCBOVUxMKTsKPgo+ICAgICAgICAgcmV0dXJuIHJl
dDsKPiAgfQo+IC0tCj4gMi4yMS4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
