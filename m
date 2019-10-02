Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D7EC88FE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 14:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1AD6E095;
	Wed,  2 Oct 2019 12:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489276E095
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 12:44:22 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z19so56628256ior.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 05:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K2EDNo6fdIk1yPYshgFY+LxCeMPIbUzUML1ZMzywDRM=;
 b=dNSLZyrh2F4uimZoDxaPh/O89s9Uj6tLUtU89U2b/ro0wCsGEDV0Zam0hCBZ1smENm
 MUhtkck5v9cyZJdOlq1nozVZPQRKAdfTOXGTMHWCm/f4+aKwd2Ag2ltC9Qs6dV8zBGTZ
 BwVkyp/vtVeygetZOHKvn+5gFeSgvRh7hWcj3xsW+6qiNxWhIXrsrG5QNQcNKyJL+JUN
 4YOu35nTbc8efu9JTzC/GHGDheFTObTwtilQtvxMpaM0ki+kdOqKHFQs7AuW5JJ4L1nU
 eKkJPmopGdUpP6K6iewILZ1IqIRqYKUGYzOB4o9r87VLk8DVI72sQrQG3gBwCrYnJXpY
 b6Ng==
X-Gm-Message-State: APjAAAXyvoLCtOV9jLBZ/f9JYCru/bq0H9K/bx3DITT9WSc25hnDSMNb
 kG7NMjK9oCnb6JW8PnGVacXk4mv15sW3E+SwVGE=
X-Google-Smtp-Source: APXvYqzF9cOJ1aDPvRHDfwikKgbCR0zT25G5dvOsc9grgCxxK+urmYa+3ZhC8DFiIN5cP4/smp+ud+JsYhZ8En+SGgg=
X-Received: by 2002:a92:9912:: with SMTP id p18mr4029749ili.78.1570020261376; 
 Wed, 02 Oct 2019 05:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191002122542.8449-1-tomi.valkeinen@ti.com>
In-Reply-To: <20191002122542.8449-1-tomi.valkeinen@ti.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 2 Oct 2019 07:44:10 -0500
Message-ID: <CAHCN7xKCSVSJ2h7Y-NF_TNDhB-LKH=aMmma4g8dH56POqDVWUA@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: fix max fclk divider for omap36xx
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=K2EDNo6fdIk1yPYshgFY+LxCeMPIbUzUML1ZMzywDRM=;
 b=YByVcbYGwBrrXoTfRrEu+N9yzrjjw5L+sR+uOIyNX+ofw5xuvwwWx5Mo7LtEJ/sFY6
 LGqRFvAZGfiWD/HojLNYSLQrU91SCRcq77H3KQcesiDQxiH6VbJdTA/LqSK0RM89zT/+
 v/bJ7NYgtTGkEu2MIVwXIePCTUPAA3GjvI8DK+L1qkiQP5KBfHdLub3XFf81lauiC56L
 Dmb3Fd8wRFw7j/BRQf4s4OkKKJG+Zrjp/HOz1IrAepflC9YJ2d1XyWg4TpUZZ7XmY645
 +ocvicAL8VuwrtsgxsHL5QUCuvdlR42bmnLvle+dUsuwBfxFhYZLy6DkcyzhcULFTjIS
 PCUQ==
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
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, stable@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA3OjI1IEFNIFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtl
aW5lbkB0aS5jb20+IHdyb3RlOgo+Cj4gVGhlIE9NQVAzNnh4IGFuZCBBTS9ETTM3eCBUUk1zIHNh
eSB0aGF0IHRoZSBtYXhpbXVtIGRpdmlkZXIgZm9yIERTUyBmY2xrCj4gKGluIENNX0NMS1NFTF9E
U1MpIGlzIDMyLiBFeHBlcmltZW50YXRpb24gc2hvd3MgdGhhdCB0aGlzIGlzIG5vdAo+IGNvcnJl
Y3QsIGFuZCB1c2luZyBkaXZpZGVyIG9mIDMyIGJyZWFrcyBEU1Mgd2l0aCBhIGZsb29kIG9yIHVu
ZGVyZmxvd3MKPiBhbmQgc3luYyBsb3N0cy4gRGl2aWRlcnMgdXAgdG8gMzEgc2VlbSB0byB3b3Jr
IGZpbmUuCj4KPiBUaGVyZSBpcyBhbm90aGVyIHBhdGNoIHRvIHRoZSBEVCBmaWxlcyB0byBsaW1p
dCB0aGUgZGl2aWRlciBjb3JyZWN0bHksCj4gYnV0IGFzIHRoZSBEU1MgZHJpdmVyIGFsc28gbmVl
ZHMgdG8ga25vdyB0aGUgbWF4aW11bSBkaXZpZGVyIHRvIGJlIGFibGUKPiB0byBpdGVyYXRpdmVs
eSBmaW5kIGdvb2QgcmF0ZXMsIHdlIGFsc28gbmVlZCB0byBkbyB0aGUgZml4IGluIHRoZSBEU1MK
PiBkcml2ZXIuCj4KCldoZW4gY29tYmluZWQgd2l0aCB0aGUgY29jayBkaXZpZGVyIHBhdGNoIFsx
XSwgdGhpcyBmaXhlcyBhIGhhbmdpbmcKaXNzdWUgb24gYSBETTM3MzAgd2l0aCBhIDQ4MHgyNzIg
c2NyZWVuIHdoZXJlIHRoZSBwaXhlbCBjbG9jayBpcyBzZXQKdG8gOU1IeiBhbmQgdGhlIGNsb2Nr
IGRpdmlkZXIgYXR0ZW1wdHMgdG8gY2FsY3VsYXRlIGEgZmNsayBhbmQgaGFuZ3MuCkkgaGF2ZSBh
bHdheXMgaGFkIHRvIGhhY2sgdGhlIGRpdmlkZXIgdG8gcHJldmVudCB0aGUgaGFuZy4KCklmIHBv
c3NpYmxlLCBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgdGhpcyBhcHBsaWVkIHRvIDUuNCBicmFu
Y2ggc2luY2UKaXQgd2lsbCBiZSBhbiBMVFMga2VybmVsLgoKWzFdIC0gaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9jb3Zlci8xMTE3MDk1MS8KClRlc3RlZC1ieTogQWRhbSBGb3JkIDxhZm9y
ZDE3M0BnbWFpbC5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZh
bGtlaW5lbkB0aS5jb20+Cj4gQ2M6IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L2Rzcy9kc3MuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rz
cy5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5jCj4gaW5kZXggZTIyNjMyNGFk
YjY5Li40YmRkNjNiNTcxMDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2Rzcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5jCj4gQEAg
LTEwODMsNyArMTA4Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHNzX2ZlYXR1cmVzIG9tYXAz
NHh4X2Rzc19mZWF0cyA9IHsKPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRzc19mZWF0dXJlcyBv
bWFwMzYzMF9kc3NfZmVhdHMgPSB7Cj4gICAgICAgICAubW9kZWwgICAgICAgICAgICAgICAgICA9
ICAgICAgIERTU19NT0RFTF9PTUFQMywKPiAtICAgICAgIC5mY2tfZGl2X21heCAgICAgICAgICAg
ID0gICAgICAgMzIsCj4gKyAgICAgICAuZmNrX2Rpdl9tYXggICAgICAgICAgICA9ICAgICAgIDMx
LAo+ICAgICAgICAgLmZja19mcmVxX21heCAgICAgICAgICAgPSAgICAgICAxNzMwMDAwMDAsCj4g
ICAgICAgICAuZHNzX2Zja19tdWx0aXBsaWVyICAgICA9ICAgICAgIDEsCj4gICAgICAgICAucGFy
ZW50X2Nsa19uYW1lICAgICAgICA9ICAgICAgICJkcGxsNF9jayIsCj4gLS0KPiBUZXhhcyBJbnN0
cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KPiBZ
LXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxz
aW5raQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
