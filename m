Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E7451BE4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 22:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAE489DB4;
	Mon, 24 Jun 2019 20:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D26089DB4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 20:03:27 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id w25so4361159ioc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5G5TGMZ6AYi5gRQNnYnWdNq47kMogCEidAxRTjgan2s=;
 b=ooQVjRKlPWOkCu6FbZHsjRkIZiXzXv/eMBx6flWK7kYiLVxPjY3x45G94vWiC5uiRU
 eklQ2myTVyZekS3PJVKTFINg533DMmx5LKjneImoXJSXEENd7Cl8Ue1rGesy6y7zl+8L
 maR6pAcjlfTsi5t/0GyQi314+xwW7Uy9IYrk4j2D0HWu3pKnhOTe9W6o106L9mcVBPpp
 Vvb2Q7+sfBaOUwmq54+mwPs8XRhOqLrxirnUkLZviOkz0Kw5NoyHTuPZfKIslkKxExqs
 VtaVKuXxvLtNDf8vENHDstpcUX3k5aZIXYGRXyJs4+HjjHsFC3DEwAMvGwQSKgUrs2hy
 9emg==
X-Gm-Message-State: APjAAAXt/+DVhBdYVOUWjfDC0do7RH/KdwGYpSNKXR9TCiP0k8lmNRVn
 RJxFhzFHXIPzVsFhY9EaBSJXS3TZvB8=
X-Google-Smtp-Source: APXvYqwCf3vge7SZ6Tfkhu9VjbLTXaMKiDihGAZiVDxisWL65Q4pO5RC/oZP5y90Adi0uonrw1WhFw==
X-Received: by 2002:a5e:9241:: with SMTP id z1mr18334395iop.39.1561406606459; 
 Mon, 24 Jun 2019 13:03:26 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41])
 by smtp.gmail.com with ESMTPSA id b14sm14177073iod.33.2019.06.24.13.03.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 13:03:25 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id m24so1102959ioo.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:03:24 -0700 (PDT)
X-Received: by 2002:a5d:8ccc:: with SMTP id k12mr30848489iot.141.1561406604290; 
 Mon, 24 Jun 2019 13:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190621211346.1324-1-ezequiel@collabora.com>
 <20190621211346.1324-3-ezequiel@collabora.com>
In-Reply-To: <20190621211346.1324-3-ezequiel@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jun 2019 13:03:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V3dq0qS2Finw7gxbZqyRvuLqGv-573LHX+41odjBOTxA@mail.gmail.com>
Message-ID: <CAD=FV=V3dq0qS2Finw7gxbZqyRvuLqGv-573LHX+41odjBOTxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/rockchip: Add optional support for CRTC gamma
 LUT
To: Ezequiel Garcia <ezequiel@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5G5TGMZ6AYi5gRQNnYnWdNq47kMogCEidAxRTjgan2s=;
 b=XWtBPn9ibpqotN/2oTx9ERROro6K607uDjcBZubtfZ7AWCAdk2ckqc80ebr81hYsSI
 ManUcxBZ7CpcbYP/eRkdTt7HCnpsIIeyh7Uo6Vn3wjXexTEfwL+8zXXVp43P6HvcPOaq
 hP0kyexxzW11HpYpHOyzzIY/K7o6DbmZCV9D4=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIEp1biAyMSwgMjAxOSBhdCAyOjE0IFBNIEV6ZXF1aWVsIEdhcmNpYSA8ZXpl
cXVpZWxAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYW4gb3B0aW9uYWwgQ1JUQyBnYW1t
YSBMVVQgc3VwcG9ydCwgYW5kIGVuYWJsZSBpdCBvbiBSSzMyODguCj4gVGhpcyBpcyBjdXJyZW50
bHkgZW5hYmxlZCB2aWEgYSBzZXBhcmF0ZSBhZGRyZXNzIHJlc291cmNlLAo+IHdoaWNoIG5lZWRz
IHRvIGJlIHNwZWNpZmllZCBpbiB0aGUgZGV2aWNldHJlZS4KPgo+IFRoZSBhZGRyZXNzIHJlc291
cmNlIGlzIHJlcXVpcmVkIGJlY2F1c2Ugb24gc29tZSBTb0NzLCBzdWNoIGFzCj4gUkszMjg4LCB0
aGUgTFVUIGFkZHJlc3MgaXMgYWZ0ZXIgdGhlIE1NVSBhZGRyZXNzLCBhbmQgdGhlIGxhdHRlcgo+
IGlzIHN1cHBvcnRlZCBieSBhIGRpZmZlcmVudCBkcml2ZXIuIFRoaXMgcHJldmVudHMgdGhlIERS
TSBkcml2ZXIKPiBmcm9tIHJlcXVlc3RpbmcgYW4gZW50aXJlIHJlZ2lzdGVyIHNwYWNlLgo+Cj4g
VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gd29ya3MgZm9yIFJHQiAxMC1iaXQgdGFibGVzLCBh
cyB0aGF0Cj4gaXMgd2hhdCBzZWVtcyB0byB3b3JrIG9uIFJLMzI4OC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KPiAtLS0KPiBDaGFu
Z2VzIGZyb20gdjE6Cj4gKiBkcm9wIGV4cGxpY2l0IGxpbmVhciBMVVQgYWZ0ZXIgZmluZGluZyBh
IHByb3Blcgo+ICAgd2F5IHRvIGRpc2FibGUgZ2FtbWEgY29ycmVjdGlvbi4KPiAqIGF2b2lkIHNl
dHRpbmcgZ2FtbWEgaXMgdGhlIENSVEMgaXMgbm90IGFjdGl2ZS4KPiAqIHMvaW50L3Vuc2lnbmVk
IGludCBhcyBzdWdnZXN0ZWQgYnkgSmFjb3BvLgo+ICogb25seSBlbmFibGUgY29sb3IgbWFuYWdl
bWVudCBhbmQgc2V0IGdhbW1hIHNpemUKPiAgIGlmIGdhbW1hIExVVCBpcyBzdXBwb3J0ZWQsIHN1
Z2dlc3RlZCBieSBEb3VnLgo+ICogZHJvcCB0aGUgcmVnLW5hbWVzIHVzYWdlLCBhbmQgaW5zdGVh
ZCBqdXN0IHVzZSBpbmRleGVkIHJlZwo+ICAgc3BlY2lmaWVycywgc3VnZ2VzdGVkIGJ5IERvdWcu
Cj4KPiBDaGFuZ2VzIGZyb20gUkZDOgo+ICogUmVxdWVzdCAoYW4gb3B0aW9uYWwpIGFkZHJlc3Mg
cmVzb3VyY2UgZm9yIHRoZSBMVVQuCj4gKiBEcm9wIHN1cHBvcnQgZm9yIFJLMzM5OSwgd2hpY2gg
ZG9lc24ndCBzZWVtIHRvIHdvcmsKPiAgIG91dCBvZiB0aGUgYm94IGFuZCBuZWVkcyBtb3JlIHJl
c2VhcmNoLgo+ICogU3VwcG9ydCBwYXNzLXRocnUgc2V0dGluZyB3aGVuIEdBTU1BX0xVVCBpcyBO
VUxMLgo+ICogQWRkIGEgY2hlY2sgZm9yIHRoZSBnYW1tYSBzaXplLCBhcyBzdWdnZXN0ZWQgYnkg
SWxpYS4KPiAqIE1vdmUgZ2FtbWEgc2V0dGluZyB0byBhdG9taWNfY29tbWl0X3RhaWwsIGFzIHBv
aW50ZWQKPiAgIG91dCBieSBKYWNvcG8vTGF1cmVudCwgaXMgdGhlIGNvcnJlY3Qgd2F5Lgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMgIHwgICAzICsK
PiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyB8IDExNCArKysr
KysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJt
X3ZvcC5oIHwgICA3ICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3Bf
cmVnLmMgfCAgIDIgKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDEyNiBpbnNlcnRpb25zKCspCgpMb29r
cyBoYXBweSB0byBtZSBub3cuICBTaW5jZSBJJ20gbm90IGEgRFJNIGV4cGVydCBhbmQgYWxtb3N0
CmNlcnRhaW5seSBkb24ndCBrbm93IG11Y2ggYWJvdXQgZ2FtbWEgTFVULCB0YWtlIHRoaXMgYXMg
eW91IHdpbGw6CgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21p
dW0ub3JnPgoKSSdtIG5vdCBpbiBmcm9udCBvZiBteSB2ZXlyb24gZGV2aWNlIGF0IHRoZSBtb21l
bnQsIHNvIEkgY2FuJ3QgcmUtdGVzdApleGFjdGx5IHRoaXMgcGF0Y2ggc28gSSB3b24ndCBhZGQg
YSBUZXN0ZWQtYnkgdGFnLiAgSG93ZXZlciwgSSdsbCBub3RlCnRoYXQgZWFybGllciB2ZXJzaW9u
cyB3b3JrZWQgZm9yIHRoZSB0ZXN0IGFwcCBJIHdhcyBhYmxlIHRvIGZpbmQgaW4KQ2hyb21lIE9T
IGFuZCBJJ2QgaW1hZ2luZSB0aGlzIG9uZSBkb2VzIHRvby4KCi1Eb3VnCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
