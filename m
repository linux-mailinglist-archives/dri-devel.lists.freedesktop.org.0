Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E723F5C36B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 21:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5DF89C89;
	Mon,  1 Jul 2019 19:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CB789C6C;
 Mon,  1 Jul 2019 19:05:56 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k21so6269533edq.3;
 Mon, 01 Jul 2019 12:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uaBxrrwWEMoWcE/TKYta3qQurdqfNb+UbR5U1Wpm70o=;
 b=JfJYD4dEbcLosVpXFYkaDUKYzxl4KJsf0nNxteZF3G3scmqOAG8b89ICtUeWEhdfzR
 Hr6O1Eh2Ihrv2qn+GkryhQ95q3EOykTerH2pPeMVU2/km9doz16oFRcBufu0Z2GJPrU8
 IB8eX5xJMlIGO/uIFoF7EnWg2MV0FKcfWfa/3q120Sw3phhoipWJrN5j8pg8kHQdR2Ix
 3JYDTXQEs6NsUCPTxOeexf+iukTIFezBTl3zabxZHhv1xZf9o6WcuE6UabKpmMh+7/Tb
 4vyt+YFmERiHkUAmNilwv/nLAR0wTR7Yi7ildB2hw4x1gRhpctcmUnU5Dt6+jTTAAXvY
 cWhQ==
X-Gm-Message-State: APjAAAXfB/E1E39DAPbtO7DF4XMA03c9c5DNFhALclf3zVkJxdLi3boL
 ljTLsHDgdLI2+LN2Iuel/DN1Nl7ajxxgfYXEpT0=
X-Google-Smtp-Source: APXvYqxYbuvclvyrQ0SbXxpdlubN12DcA0TqYY/yihrddm5HorGF5u28XbFd2vGLRNP7JC3f0GMBXMvTn31wQhAzS5I=
X-Received: by 2002:a50:9468:: with SMTP id q37mr30825087eda.163.1562007955479; 
 Mon, 01 Jul 2019 12:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-2-robdclark@gmail.com>
 <8736jpzk67.fsf@anholt.net>
In-Reply-To: <8736jpzk67.fsf@anholt.net>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Jul 2019 12:05:40 -0700
Message-ID: <CAF6AEGs7n0w0y9067wWkE+fc6zWqqX+b80Yjr8pXDRrkLfKBFg@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: inherit clocks enabled by bootloader
To: Eric Anholt <eric@anholt.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uaBxrrwWEMoWcE/TKYta3qQurdqfNb+UbR5U1Wpm70o=;
 b=VBB2XGeIB4/fvXrovvgQ9H45CCTnVVzGhLc8tfUT5hM1KiF1epOn11+rpPgaoAiBaw
 L2X4IRusSjkr8N98Y03yOtubmeAiQNWRLtYrTHrm69DOZbmxLiRTlylsWPaKjhOcE22i
 yhPCNF3jcLw6DvtdIOZGTrnqrbTj2ZBgKo+AloJb8Jff8J/FkXXiYNL9Sje6kDSbE951
 qNH8si8I5xASyFA0qRaJczNeqnE3r4290p1zaJ9BGwaJVPMDKQoj9EtdmZfBykus5L8E
 0r7VoUuNEeqep5NvcsKIrpw5Vboh/S/S4aB9utLluxGbyiLqn457LvG/vBemDYG892cb
 wZLw==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Linux PM <linux-pm@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Andy Gross <agross@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMSwgMjAxOSBhdCAxMToyNSBBTSBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQu
bmV0PiB3cm90ZToKPgo+IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4gd3JpdGVzOgo+
Cj4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gPgo+ID4gVGhl
IGdvYWwgaGVyZSBpcyB0byBzdXBwb3J0IGluaGVyaXRpbmcgYSBkaXNwbGF5IHNldHVwIGJ5IGJv
b3Rsb2FkZXIsCj4gPiBhbHRob3VnaCB0aGVyZSBtYXkgYWxzbyBiZSBzb21lIG5vbi1kaXNwbGF5
IHJlbGF0ZWQgdXNlLWNhc2VzLgo+ID4KPiA+IFJvdWdoIGlkZWEgaXMgdG8gYWRkIGEgZmxhZyBm
b3IgY2xrcyBhbmQgcG93ZXIgZG9tYWlucyB0aGF0IG1pZ2h0Cj4gPiBhbHJlYWR5IGJlIGVuYWJs
ZWQgd2hlbiBrZXJuZWwgc3RhcnRzLCBhbmQgd2hpY2ggc2hvdWxkIG5vdCBiZQo+ID4gZGlzYWJs
ZWQgYXQgbGF0ZV9pbml0Y2FsbCBpZiB0aGUga2VybmVsIHRoaW5rcyB0aGV5IGFyZSAidW51c2Vk
Ii4KPiA+Cj4gPiBJZiBib290bG9hZGVyIGlzIGVuYWJsaW5nIGRpc3BsYXksIGFuZCBrZXJuZWwg
aXMgdXNpbmcgZWZpZmIgYmVmb3JlCj4gPiByZWFsIGRpc3BsYXkgZHJpdmVyIGlzIGxvYWRlZCAo
cG90ZW50aWFsbHkgZnJvbSBrZXJuZWwgbW9kdWxlIGFmdGVyCj4gPiB1c2Vyc3BhY2Ugc3RhcnRz
LCBpbiBhIHR5cGljYWwgZGlzdHJvIGtlcm5lbCksIHdlIGRvbid0IHdhbnQgdG8ga2lsbAo+ID4g
dGhlIGNsb2NrcyBhbmQgcG93ZXIgZG9tYWlucyB0aGF0IGFyZSB1c2VkIGJ5IHRoZSBkaXNwbGF5
IGJlZm9yZQo+ID4gdXNlcnNwYWNlIHN0YXJ0cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4KPiBSYXNwYmVycnkgUGkgaXMgY2Fycnlp
bmcgZG93bnN0cmVhbSBoYWNrcyB0byBkbyBzaW1pbGFyIHN0dWZmLCBhbmQgaXQKPiB3b3VsZCBi
ZSBncmVhdCB0byBzZWUgQ0NGIGZpbmFsbHkgc3VwcG9ydCB0aGlzLgoKeWVhaCwgYm90aCB0aGlz
IGFuZCB0aGUgbXVsdGlwbGUtcG9zc2libGUtcGFuZWwgdGhpbmcgYXJlIGEgYmlnIHNvdXJjZQpv
ZiBkb3duc3RyZWFtIGhhY2tzIG9uIGJhc2ljYWxseSBldmVyeSBhbmRyb2lkIGRldmljZSB0b28u
LiA6LS8KCml0IGNlcnRhaW5seSB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgdXBzdHJlYW0gc29sdXRp
b25zIGZvciB0aGVzZQpwcm9ibGVtcyB0byBnaXZlIGRvd25zdHJlYW0gaGFja3MgYSByZWFzb24g
bm90IHRvIGV4aXN0CgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
