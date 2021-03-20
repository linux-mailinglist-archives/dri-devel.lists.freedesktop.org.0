Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36975342B5B
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 09:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BB76EB47;
	Sat, 20 Mar 2021 08:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFDD6EB47;
 Sat, 20 Mar 2021 08:54:14 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id h136so779687vka.7;
 Sat, 20 Mar 2021 01:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tJOHqcF9D/PSfpMLCzj4p9ALSWHGa7mLQmmAOiypWFE=;
 b=WWkf7RWJcsGZU0dYFxLvUa0lXlBHqfEF2cvFz6ujphXK/8lWpxcQ3BFU/PosbQb1Yt
 Ao1by88VHkc+Dvta7rCLER2olY/5AaiwOpV3CKX8oZoioqEaO3Q7DYV+3Yf6L0vbJRLW
 R0mgAwCZ/QpgC5vj3zGLSZU+WsFeT97Br8NCA1HuiEjdft7P/c+78kM+msj77vYziwf3
 f4U3Ap3JAot/CGXFS9LPE1hxzYqO0x2KuuYDuCDxTHjlaQSILBgluCmpDTLlIJ8VSmvc
 kAK4hBLH2nEfw+Y8nWchZHrIanzoDZL2fxQo6LIGaYP1rkyEaJfuHihC0030XR8Yed6t
 Czzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tJOHqcF9D/PSfpMLCzj4p9ALSWHGa7mLQmmAOiypWFE=;
 b=J5L4qC5OFzdz5xAQ7VrsOPNhEjVvg0x69k7KFJaNu/bAck+BLE5VpGyXecnGWqyGwq
 NrcevsQyts9iq/AJ64x2OWrCmAfGId+Dh561tC68x5I/X3dyOOx0uw/tgyNzzinZCUJZ
 /OBYYQv353PYf2ObG+psc7qNep5cpePM/zK2uip9WL1DJxguTCI72ORiFeuL1ivJ0PMe
 FAybx+5a03xrl24n/ubdc+IefGj0QLWCsSU9VazWnu/4uRTceI6Ue4ZSVQJ5av1sogYP
 wtkBkSKYxTvDSmDohymMsMG/deTCYpBFOUYtWr/AIKN7aXZIrAmHnjiT18LXxYjfbSnk
 caFQ==
X-Gm-Message-State: AOAM531x2CFThNOW68k4yt/+B3SfQnVXoR4dRQBIDV00mzDXnK2AmMTT
 /tfh8FBMtwDLIhHAGSMPkfGU8Xo2hlZUp7InF2k=
X-Google-Smtp-Source: ABdhPJwNzkteh+UuF9ldAoKBa0DmW5BpaRslCuVQhlZd1bV7uxv06atheXCrORuQicZwGbynCGPU3MvLXyc1pVGpnjY=
X-Received: by 2002:a1f:a449:: with SMTP id n70mr5040178vke.14.1616230453902; 
 Sat, 20 Mar 2021 01:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210319190202.2903140-1-l.stach@pengutronix.de>
In-Reply-To: <20210319190202.2903140-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 20 Mar 2021 09:54:02 +0100
Message-ID: <CAH9NwWdt=poqpDDo51AxqHQ8t9aVBL0kmgyooy=ppW6WwrCnMw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: add HWDB entry for GC7000 rev 6204
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnIuLCAxOS4gTcOkcnogMjAyMSB1bSAyMDowMiBVaHIgc2NocmllYiBMdWNhcyBTdGFjaCA8
bC5zdGFjaEBwZW5ndXRyb25peC5kZT46Cj4KPiBGcm9tOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJA
cGVuZ3V0cm9uaXguZGU+Cj4KPiBUaGlzIGlzIHRoZSAzRCBHUFUgZm91bmQgb24gdGhlIGkuTVg4
TVAgU29DLiBUaGUgZmVhdHVyZSBiaXRzIGFyZQo+IHRha2VuIGZyb20gdGhlIE5YUCBkb3duc3Ry
ZWFtIGtlcm5lbCBkcml2ZXIgNi40LjMucDEuMzA1NTcyLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2Fz
Y2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+IFNpZ25lZC1vZmYtYnk6IEx1Y2Fz
IFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBH
bWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+CgotLSAKZ3JlZXRzCi0tCkNocmlz
dGlhbiBHbWVpbmVyLCBNU2MKCmh0dHBzOi8vY2hyaXN0aWFuLWdtZWluZXIuaW5mby9wcml2YWN5
cG9saWN5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
