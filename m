Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3526ACDE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 21:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0F889A44;
	Tue, 15 Sep 2020 19:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F8C89A44
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 19:02:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k18so545247wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 12:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yXie8KLV7ShlZWhEm9UlbuFqIWQ7E77axILBYs0CyOY=;
 b=VXzVLKVemj5KkWSG36GqyUkMATpaKPcudVfiq3MwDsuDJ0c17tK2bo/NiDgkfw5yKy
 pE9dBIsXPOeBwPvxA4TPbdMit4Vl8y3nnoJetU2KH6rPOL/njCIt0dc8ysH1clbROPmg
 copZ1T0oylISB8qXRxJT/VtlRzPEIax2Sego+m3Y+eU9poNsBgMojSQlrRFZoeRbv2Xo
 andiWRFfCCEceJ2BVZxie7WEaBMYBewsWKxM7P945A5P0Dl5H/3wYxjy3zkg/9GPBnUK
 9Hxd75SWfQTT8utSQcOQqurRK5subkGfe9c4dTC8aJgFZAkBhzlI0orlRTS5x8jXLqSP
 Hlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yXie8KLV7ShlZWhEm9UlbuFqIWQ7E77axILBYs0CyOY=;
 b=bQEqceIimfUHt/DRxDdJIxV6UY/xAWW/cxA1AwRwLt3bWRShnQQWaPaBO3D1pi2ORR
 lWJL/o+MXRkdlK0IL3awTC1Ut6o7nbTCeXvFjPinT3ifc1Jj5Osq1Fr7a6usYo+7ZzVD
 kenyaWFFAW5ANFBXgmmZunTLNzzfCwvMkaQHcBBQ6W1uCdr5GSok20q+722lHtUKNVEq
 KW1Vj4peOj8CM2FjLKYpaK+fJJqLLlhcy4I61BN6Mr/Yb5sSNxV4Az5c/s7vQek22Ts7
 +fGD0UI9JnN+DfYacxakFSwRHlfDaNuBO8vH7buuzr3uTeRf2NcStvzcS35PeydmiYvt
 Kdsg==
X-Gm-Message-State: AOAM531q7Adt48OegJA1QP0cIctPsHmGWd6qzcD/nlOD11n5RhNRzA3V
 x+TVOqdLdjc3Z6iY6g+TwcTR2W5cAsTEJy1y3H4=
X-Google-Smtp-Source: ABdhPJzk9eyxFbI1rJI68h478tr8wfvyAYGWtTFclkkVdtqdvg+JoAVZ3j4OlPmVc8RQgrxC9TLlU1GoxApBrz0roOA=
X-Received: by 2002:a7b:c141:: with SMTP id z1mr793609wmi.79.1600196538282;
 Tue, 15 Sep 2020 12:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <1599638225-39300-1-git-send-email-tiantao6@hisilicon.com>
 <665ed169-cc12-2e6e-11f9-bc1a69fdaad7@amd.com>
In-Reply-To: <665ed169-cc12-2e6e-11f9-bc1a69fdaad7@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2020 15:02:07 -0400
Message-ID: <CADnq5_Mj4bJ-FMORL9cvex5E_5gO6p5CQqTvcDSA0OZoPeHevQ@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: fix sched_fence.c kernel-doc warnings
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
Cc: Dave Airlie <airlied@linux.ie>, linuxarm@huawei.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFdlZCwgU2VwIDksIDIwMjAgYXQgNToxMSBBTSBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0g
MDkuMDkuMjAgdW0gMDk6NTcgc2NocmllYiBUaWFuIFRhbzoKPiA+IEZpeCBrZXJuZWwtZG9jIHdh
cm5pbmdzLgo+ID4gZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9mZW5jZS5jOjExMDog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yCj4gPiBtZW1iZXIgJ2YnIG5vdCBkZXNjcmli
ZWQgaW4gJ2RybV9zY2hlZF9mZW5jZV9yZWxlYXNlX3NjaGVkdWxlZCcKPiA+IGRyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfZmVuY2UuYzoxMTA6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlv
bgo+ID4gcGFyYW1ldGVyICdmZW5jZScgZGVzY3JpcHRpb24gaW4gJ2RybV9zY2hlZF9mZW5jZV9y
ZWxlYXNlX3NjaGVkdWxlZCcKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUaWFuIFRhbyA8dGlhbnRh
bzZAaGlzaWxpY29uLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX2ZlbmNlLmMgfCAyICstCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX2ZlbmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX2ZlbmNlLmMKPiA+IGluZGV4IDhiNDVjM2ExYjg0Li42OWRlMmM3IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9mZW5jZS5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2ZlbmNlLmMKPiA+IEBAIC0xMDEsNyArMTAxLDcg
QEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2ZlbmNlX2ZyZWUoc3RydWN0IHJjdV9oZWFkICpyY3Up
Cj4gPiAgIC8qKgo+ID4gICAgKiBkcm1fc2NoZWRfZmVuY2VfcmVsZWFzZV9zY2hlZHVsZWQgLSBj
YWxsYmFjayB0aGF0IGZlbmNlIGNhbiBiZSBmcmVlZAo+ID4gICAgKgo+ID4gLSAqIEBmZW5jZTog
ZmVuY2UKPiA+ICsgKiBAZjogZmVuY2UKPiA+ICAgICoKPiA+ICAgICogVGhpcyBmdW5jdGlvbiBp
cyBjYWxsZWQgd2hlbiB0aGUgcmVmZXJlbmNlIGNvdW50IGJlY29tZXMgemVyby4KPiA+ICAgICog
SXQganVzdCBSQ1Ugc2NoZWR1bGVzIGZyZWVpbmcgdXAgdGhlIGZlbmNlLgo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
