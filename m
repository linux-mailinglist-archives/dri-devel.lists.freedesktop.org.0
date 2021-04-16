Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E26C361F3F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 14:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE0F6EB7B;
	Fri, 16 Apr 2021 12:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7B16EB7B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 12:02:10 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id w23so25951552ejb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 05:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cx3VVTqxL2siJLu1JWCTgXcZiMK9cUznSais4SHozjY=;
 b=a80VHwYhs8HkBppRrROPNtCcYs+1KeUCFpu5uHIaO0zmSoXcvcRelgq0449c2Smqz5
 zpxPJk06zHPdxl4cuDHlFEpPF2BZSv1OEioRC2logzdesZCRedhqfL4gIrwf+jHUsBrp
 SLdoIHeCG4nCigR/lu2kJdSietUsJ/gVUinWVsN5GEBjx5P/XYf7VZYH7EaBQpyMf6CA
 HCbl2a8fO+YyTCTIbQK6q+USMgSbLF2P/vP4yJTrowwwuTwmHi/seCEwIYaMCc4dpY/Z
 8LR8NckxVYbBz6scSvs7FspXR1PFgmf2dBPoOPJmgjFVMrct8br0OtczP4jUTPlr61RN
 S2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cx3VVTqxL2siJLu1JWCTgXcZiMK9cUznSais4SHozjY=;
 b=qzQX4+58t6uF9sSreWKYLYEbI83d55Y90cVK2kZzpOzmD1jzwXXaP7BIyaKUg+p6hO
 Qfg7JX1UcF0hUWZdHJg6ruL4Ho8NWKctWdToBmFFWpF7TfH03JVTlORqik8wH17K30Yp
 PwAStwrO3hdzjwm4x9BYZCEcdrehslM/DwZPXuPNLojCde79eE6fmu5Gf+4iR5lHkwoi
 ykNY+gZLaMpJKWOLUyzuZz15UXAvDbyPpvcslrRy1JrMsYPPTGZ2gBWe1baOFkYWCAL2
 v5XDWiZaFj/pm6asBxdiRvZpI0GcgvVq1ygP0fYLymmccRPryO9cVksx/lap7gIC0BCn
 xkpw==
X-Gm-Message-State: AOAM533N4HzYMV8dsW9wMN2BgOBim1kvxuFmpxKE/MNPGqPba6ppnXMl
 8++wMl7OKVWLkmtaXSCHSk4kJq3/VBP0pKz6wYo=
X-Google-Smtp-Source: ABdhPJw3pTjYPILXl6MDAqLPWhP5HQU8WlDcEM8rCz9N8kOrGWOYKeG3wVw3MswjKnzYJl6SralZCnNBoPnwlYpuiGw=
X-Received: by 2002:a17:906:7842:: with SMTP id
 p2mr8364396ejm.87.1618574528765; 
 Fri, 16 Apr 2021 05:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210331133313.411307-1-adrien.grassein@gmail.com>
 <20210331133313.411307-2-adrien.grassein@gmail.com>
 <20210331144230.GP2088@kadam>
In-Reply-To: <20210331144230.GP2088@kadam>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Fri, 16 Apr 2021 14:01:57 +0200
Message-ID: <CABkfQAH+3Ox9=JiYPkUiXT2soPv-FnCkqNtwvOj7EXvrMT4Z=w@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/bridge: lt8912b: fix incorrect handling of
 of_* return values
To: Robert Foss <robert.foss@linaro.org>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKQ291bGQgeW91IHBsZWFzZSBoYXZlIGEgbG9vayBhdCB0aGlzIHBhdGNoPwpJ
dCBoYXMgYmVlbiByZXZpZXdlZCBieSB0aGUgYnVnIHJlcG9ydGVyIGFuZCBhbm90aGVyIHBlcnNv
bi4KCkkgZG9uJ3QgcmVjZWl2ZSBhbnkgIm1lcmdlZCIgbWVzc2FnZS4KClRoYW5rcyBhIGxvdCwK
QWRyaWVuCgpMZSBtZXIuIDMxIG1hcnMgMjAyMSDDoCAxNjo0MiwgRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBvcmFjbGUuY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBXZWQsIE1hciAzMSwgMjAy
MSBhdCAwMzozMzoxM1BNICswMjAwLCBBZHJpZW4gR3Jhc3NlaW4gd3JvdGU6Cj4gPiBBIHN0YXRp
YyBhbmFseXNpcyBzaG93cyBzZXZlcmFsIGlzc3VlcyBpbiB0aGUgZHJpdmVyIGNvZGUgYXQKPiA+
IHByb2JpbmcgdGltZS4KPiA+Cj4gPiBEVCBwYXJzaW5nIGVycm9ycyB3ZXJlIGJhZCBoYW5kbGVk
IGFuZCBjb3VsZCBsZWFkIHRvIGJ1Z3M6Cj4gPiAgIC0gQmFkIGVycm9yIGRldGVjdGlvbjsKPiA+
ICAgLSBCYWQgcmVsZWFzZSBvZiByZXNzb3VyY2VzCj4gPgo+ID4gUmVwb3J0ZWQtYnk6IERhbiBD
YXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiA+IFN1Z2dlc3RlZC1ieTogRGFu
IENhcnBlbnRlciAgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6
IEFkcmllbiBHcmFzc2VpbiA8YWRyaWVuLmdyYXNzZWluQGdtYWlsLmNvbT4KPiA+IFJldmlld2Vk
LWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+Cj4gR3JlYXQhICBUaGFu
a3MhCj4KPiBSZXZpZXdlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUu
Y29tPgo+Cj4gcmVnYXJkcywKPiBkYW4gY2FycGVudGVyCj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
