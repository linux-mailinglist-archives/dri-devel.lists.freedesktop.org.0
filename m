Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D75B6F1D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 23:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024037A74A;
	Wed, 18 Sep 2019 21:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E237A74A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 21:58:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r5so901654wrm.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7Yk/LhKlC9yyzk96g0CRN9M9s21vj9aWbidMXv5CoXQ=;
 b=W+pz+knYiXk8P04c3/FbsNlPMx7LsO3shUcpyzFRn/qLBjt3oF5e7DEI64/omQkls4
 niXCp4vTxHnnwiRPS5LmKJg28dhJlj8vs94uCR0LxbhOgbDF7TNNX6dCyHT38n7016Rq
 2lQk2D7h1X8qpxYrsZuViqbzm1OA0M8AjirXzsqILQJdbmMmChM7IicsdOcKeLC9fh72
 AZCZ72Z+cgdNL1D7MCmkGNcWw66CI7pgE02xA8Nowbn80PyRAEZPYVFefkN3piDQXcUW
 QYBoZ226a5C5HzR7L6LJFjC5trbNK1us06HbM8Eh161346gVROz5GhW4LmGFYeCGXAqq
 t+Jw==
X-Gm-Message-State: APjAAAWmIufmn4Gcv4Vb/Y5LhIfoerarFGoOv1wJqzvExWrU1hEu9/fH
 TLMA0uErM+eMTISLXkhuKSR+2nWFslMirXs0CVYGAw==
X-Google-Smtp-Source: APXvYqxp96q29FsGLS6G673S+nbto0zQFT5IWdR2pdrfGcfd4VN2hPWI4/iZHCnU33OGxJiom/qg4Eubahd6couutHo=
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr4383619wrw.314.1568843887347; 
 Wed, 18 Sep 2019 14:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190917191536.19105-1-john.stultz@linaro.org>
 <20190918214908.bnzhcs5sgnkslafb@engestrom.ch>
In-Reply-To: <20190918214908.bnzhcs5sgnkslafb@engestrom.ch>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 18 Sep 2019 14:57:55 -0700
Message-ID: <CALAqxLVLqx3yzt06Jpi8ywAzyo0Npkn=s7Jy5cZ_LPHSR9+VJg@mail.gmail.com>
Subject: Re: [RFC][PATCH] libdrm: Convert to Android.mk to Android.bp
To: Eric Engestrom <eric@engestrom.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7Yk/LhKlC9yyzk96g0CRN9M9s21vj9aWbidMXv5CoXQ=;
 b=nWL9H6XyiO0Lzgc2Ox5TS2vrkA/YZJialZDn1/E7OJo4xeiW7NEPQaIQXTGuN5kHVx
 QLT1WflKqF05rDF7OXtdwp3aSdQiqn061c9w6iMUeVl4c4ZjDZmRAeCYOwUzA5dVeQrW
 nkFjy7p91KRz8SHF30cY+GTSHkPRSV3+NrWT+NPMWwhYfDDsf9B8Gj8n6Hf2SIadlbyS
 hH+f5k9xqLozf+yKwcNjuEZGgcBMMJloxrcban+eIsuK4W6ZZ9NrC253C5fJRfovyWd2
 SeOfYh7cGcIsK5DrKSlwz8D33WXQ91GRZHOvXMKHEx6urkyM1r30vUrh/JNjD/ahg/UF
 ZNdQ==
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
Cc: Rob Clark <robdclark@chromium.org>, Jiyong Park <jiyong@google.com>,
 Robert Foss <robert.foss@collabora.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Eric Anholt <anholt@google.com>,
 Sean Paul <seanpaul@chromium.org>, Dan Willemsen <dwillemsen@google.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMjo0OSBQTSBFcmljIEVuZ2VzdHJvbSA8ZXJpY0Blbmdl
c3Ryb20uY2g+IHdyb3RlOgo+IE9uIFR1ZXNkYXksIDIwMTktMDktMTcgMTk6MTU6MzYgKzAwMDAs
IEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gVGhpcyBwYXRjaCByZW1vdmVzIHRoZSBkZXByZWNhdGVk
IEFuZHJvaWQubWsgZmlsZXMgYW5kIHJlcGxhY2VzCj4gPiB0aGVtIHdpdGggQW5kcm9pZC5icCBm
aWxlcy4KPiA+Cj4gPiBUaGlzIGlzIG5lZWRlZCBpbiBvcmRlciB0byBidWlsZCBsaWJkcm0vbWFz
dGVyIGFnYWluc3QgcmVjZW50Cj4gPiBBbmRyb2lkIHJlbGVhc2VzIGFuZCBBT1NQL21hc3Rlciwg
YXMgc29tZSBvZiB0aGUgVHJlYmxlIGJ1aWxkCj4gPiBvcHRpb25zIHJlcXVpcmVkIHNpbmNlIEFu
ZHJvaWQgTyBjYW5ub3QgYmUgZXhwcmVzc2VkIGluCj4gPiBBbmRvcmlkLm1rIGZpbGVzLgo+ID4K
PiA+IFBhdGNoIG9yaWdpbmFsbHkgYnkgRGFuIFdpbGxlbXNlbiB3aXRoIGZpeGVzIGZvbGRlZCBp
biBieToKPiA+ICBKZXJyeSBaaGFuZywgRWxpb3R0IEh1Z2hlcyBhbmQgbXlzZWxmLgo+ID4KPiA+
IFdpdGggdGhpcyBjaGFuZ2UsIHRoZSBvbmx5IHBhdGNoZXMgY2FycmllZCBieSBBbmRyb2lkIGZv
ciBsaWJkcm0KPiA+IHdvdWxkIGJlIHRoZSBnZXJyaXQgT1dORVJTIG1ldGEtZGF0YSBmaWxlLgo+
ID4KPiA+IENjOiBNYXVybyBSb3NzaSA8aXNzb3Iub3J1YW1AZ21haWwuY29tPgo+ID4gQ2M6IENo
aWgtV2VpIEh1YW5nIDxjd2h1YW5nQGFuZHJvaWQteDg2Lm9yZz4KPiA+IENjOiBSb2JlcnQgRm9z
cyA8cm9iZXJ0LmZvc3NAY29sbGFib3JhLmNvbT4KPiA+IENjOiBUYXBhbmkgUMOkbGxpIDx0YXBh
bmkucGFsbGlAaW50ZWwuY29tPgo+ID4gQ2M6IENoaWgtV2VpIEh1YW5nIDxjd2h1YW5nQGFuZHJv
aWQteDg2Lm9yZz4KPiA+IENjOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgo+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4gQ2M6IFJv
YiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+IENjOiBFcmljIEFuaG9sdCA8YW5o
b2x0QGdvb2dsZS5jb20+Cj4gPiBDYzogSml5b25nIFBhcmsgPGppeW9uZ0Bnb29nbGUuY29tPgo+
ID4gQ2M6IEFsaXN0YWlyIFN0cmFjaGFuIDxhc3RyYWNoYW5AZ29vZ2xlLmNvbT4KPiA+IENjOiBE
YW4gV2lsbGVtc2VuIDxkd2lsbGVtc2VuQGdvb2dsZS5jb20+Cj4gPiBDYzogU3VtaXQgU2Vtd2Fs
IDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiA+IENjOiBWaXNoYWwgQmhvaiA8dmlzaGFsLmJo
b2pAbGluYXJvLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0
ekBsaW5hcm8ub3JnPgo+ID4gLS0tCj4gPiBJIGtub3cgbGFzdCB0aW1lIHRoaXMgd2FzIHByb3Bv
c2VkLCB0aGVyZSB3YXMgc29tZSBjb25jZXJuIGFib3V0Cj4gPiBtYWludGFpbmluZyBzdXBwb3J0
IGZvciBvbGQgQU9TUCByZWxlYXNlcyAtIGFuZCB3aGlsZSB3ZSBjb3VsZAo+ID4gc3RpbGwgc3Vw
cG9ydCBib3RoIHdpdGggQW5kcm9pZC5tayB0aGF0IHdhcyBhIGZhaXIgY29uY2Vybi4KPiA+Cj4g
PiBIb3dldmVyLCBub3cgdGhhdCBpdCBpcyBhIHJlcXVpcmVtZW50IGZvciBuZXdlciByZWxlYXNl
cywgSSdkCj4gPiBjb250ZW5kIHRoYXQgYmVpbmcgYWJsZSB0byBidWlsZC90ZXN0IGxpYmRybS9t
YXN0ZXIgYWdhaW5zdAo+ID4gQU9TUC9tYXN0ZXIgYW5kIHJlY2VudCByZWxlYXNlcyBpcyBtb3Jl
IHZhbHVhYmxlIHRoZW4gc29sZXkKPiA+IG1haW50YWluaW5nIHN1cHBvcnQgZm9yIG9sZCBhbmQg
dW5zdXBwb3J0ZWQgQW5kcm9pZCByZWxlYXNlcy4KPgo+IEFja2VkLWJ5OiBFcmljIEVuZ2VzdHJv
bSA8ZXJpY0Blbmdlc3Ryb20uY2g+Cj4KPiBCdXQgdG8gYmUgY2xlYXIsIHdoYXQncyB0aGUgZWFy
bGllc3QgYW5kcm9pZCB2ZXJzaW9uIHRoYXQgc3VwcG9ydHMKPiBibHVlcHJpbnQ/IChtaWdodCBi
ZSB3b3J0aCBhZGRpbmcgdGhhdCB0byB0aGUgY29tbWl0IG1lc3NhZ2UpCgpJIGJlbGlldmUgaXQg
d2FzIEFuZHJvaWQgTiB3aGljaCB3YXMgdGhlIGZpcnN0IHRvIHVzZSBibHVlcHJpbnQuCgpUaGFu
a3MgZm9yIHRoZSByZXZpZXcsIEknbGwgYWRkIHN1Y2ggYSBub3RlIHRvIHRoZSBjb21taXQgYW5k
IHJlc3VibWl0CncvbyBSRkMgaW4gYSBmZXcgZGF5cy4KCnRoYW5rcwotam9obgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
