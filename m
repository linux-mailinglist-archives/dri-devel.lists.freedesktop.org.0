Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D67BE1BADF1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 21:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDCA6E169;
	Mon, 27 Apr 2020 19:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3DC6E130;
 Mon, 27 Apr 2020 19:31:09 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x25so192819wmc.0;
 Mon, 27 Apr 2020 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HK4ed8QncVCh1Vo6RkjCKVWlusnpc0yRSsJhSHttXjo=;
 b=IpTOEHL2igQRISoLq54oPFIyUCM/vlFDLK8fOD2SZsOKO7PJJpFtKkHoCHVXZlXJP7
 73g4hx79fWeVCiHrCHgX8g5TbEP4wxYEvD3TixvNDrvJLxlF+Eyg2euAR1vRcSu7nSzn
 Tz+SV96JIFZrG4THpscLqBiY6VJotLXmuMBmvZIV4LMKID4De0Zq0gwLtnfIQ+8HNfK4
 Xc3t7BG5r8mO6hTF/7PuxU0BntY/RJeD12UqHOVhZQ1kRWfl0IfXY/zWgLftfy1TWO5R
 VhgRcvrZzquG7+z/1NL6NcJHHQR6yAxjM+QNKvsPHMKbMyCD01KlMHoKChRu2x9w385V
 Ljjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HK4ed8QncVCh1Vo6RkjCKVWlusnpc0yRSsJhSHttXjo=;
 b=Dr9S4ThFpNpTmehHmJjs7A2AbvTzfNmyRkEeOG1v7foNNtRRWl1FnfIbKmoNxwCGoi
 wkS+y1GqkqXx1vi+JZ/QXb1KI5ui/oFM3RRo1VklPE2mHtzPuLBU9ur1MoQqU3GAyQt7
 CN6J1QKtIXeQvAPMuCy8E4XlKvIfLPl92J4nq3mD+pGBk4htTrRtP+TpcnH7tupM7ofB
 IOBootDkztfnQzuuGCcvaLL1YjuN7e1AP5MlLsR00ss3YTeRc0Ap6vOlwyuuxsrUOmaL
 YMCN21OJ7IApxOdXpNiM1aaPaysPo5XbaB/YeIChG79JcBJ9gOlag9HHmt6K6eUz0v9s
 Fahw==
X-Gm-Message-State: AGi0PuZdDUWZnKtSOqfkoen19H0il/lKmhT5s9lmTFHTWUmM7Yn5gxWK
 +Tc3nwTshM8qyyzNOh2CZpQ4rENFJCcJEP4gzqA=
X-Google-Smtp-Source: APiQypIB/XGkXii6L27d5qf83YyxYGAbhK8c1MrsYRHdgjJbWhupl2AuXbKYhWqnRF9Fu63Y3D4QathCLMexhIHAI08=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr284093wmb.56.1588015867738;
 Mon, 27 Apr 2020 12:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200427063655.21169-1-yanaijie@huawei.com>
 <69374bbb-7e17-8b3a-8a24-591de2c55ee3@amd.com>
In-Reply-To: <69374bbb-7e17-8b3a-8a24-591de2c55ee3@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Apr 2020 15:30:56 -0400
Message-ID: <CADnq5_OK-uhUgxuemTy4gzYWZuoYJsYRgR+t5k7bC0CMXAKF+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove conversion to bool in amdgpu_device.c
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
Cc: Jason Yan <yanaijie@huawei.com>, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgQXByIDI3LCAyMDIwIGF0IDQ6MDIgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDI3LjA0LjIwIHVtIDA4OjM2IHNjaHJpZWIgSmFzb24gWWFuOgo+ID4gVGhlICc+JyBleHByZXNz
aW9uIGl0c2VsZiBpcyBib29sLCBubyBuZWVkIHRvIGNvbnZlcnQgaXQgdG8gYm9vbCBhZ2Fpbi4K
PiA+IFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyBjb2NjaWNoZWNrIHdhcm5pbmc6Cj4gPgo+ID4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jOjMwMDQ6NjgtNzM6IFdB
Uk5JTkc6Cj4gPiBjb252ZXJzaW9uIHRvIGJvb2wgbm90IG5lZWRlZCBoZXJlCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogSmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgo+Cj4gUmV2aWV3ZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+ID4gLS0t
Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDIgKy0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ID4gaW5kZXgg
M2Q2MDFkNWRkNWFmLi5hZDk0ZGUzNjMyZDggMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ID4gQEAgLTMwMDAsNyArMzAwMCw3IEBAIGludCBh
bWRncHVfZGV2aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gPiAgICAgICBJ
TklUX1dPUksoJmFkZXYtPnhnbWlfcmVzZXRfd29yaywgYW1kZ3B1X2RldmljZV94Z21pX3Jlc2V0
X2Z1bmMpOwo+ID4KPiA+ICAgICAgIGFkZXYtPmdmeC5nZnhfb2ZmX3JlcV9jb3VudCA9IDE7Cj4g
PiAtICAgICBhZGV2LT5wbS5hY19wb3dlciA9IHBvd2VyX3N1cHBseV9pc19zeXN0ZW1fc3VwcGxp
ZWQoKSA+IDAgPyB0cnVlIDogZmFsc2U7Cj4gPiArICAgICBhZGV2LT5wbS5hY19wb3dlciA9IHBv
d2VyX3N1cHBseV9pc19zeXN0ZW1fc3VwcGxpZWQoKSA+IDA7Cj4gPgo+ID4gICAgICAgLyogUmVn
aXN0ZXJzIG1hcHBpbmcgKi8KPiA+ICAgICAgIC8qIFRPRE86IGJsb2NrIHVzZXJzcGFjZSBtYXBw
aW5nIG9mIGlvIHJlZ2lzdGVyICovCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
