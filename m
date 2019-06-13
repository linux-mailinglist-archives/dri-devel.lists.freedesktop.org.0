Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7CC43FFD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 18:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B062892E6;
	Thu, 13 Jun 2019 16:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D36892E6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 16:02:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c2so21376148wrm.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 09:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nd6aCrSjzkm1aMj9lM4ssykkYiRccO6zWy49Uehvbco=;
 b=Xtl4WdGvCrdlbjJHdi+eCQFqpWVRxgoZD+PMYClcKuwvGxSR/zFMBU8/sEllahF8iS
 vPcewngmrE7UJzYZ6MOU85V1MjFQA7nxsBIwk/13D9AqDZQ/hr5mq11nINm1xGyHz9zW
 dgpk2OxXACurW21VIvrn+p1Efhf/k7UXB2kKnNAMwl1AUSzDBFURAgvgEHU/ctLlQy3T
 XcljOY0i5twzOTjUAc8IoB+mwRBUAQVJXJzfy0oc76GYmbK+CG80wm0ptPdv4e4t2baR
 P92r8YogL9D1lAZbLu80+jAgU0cBDi5y/+wWPQMZ7o4f3mmF1g7+paYsRHBn7MXNtMJU
 rFNg==
X-Gm-Message-State: APjAAAUSxley3iSLHJit1bL/Rh+p8QOsQH3z4Jy6li79saZFVArB/QAi
 5qoNUq9D2J+nfJ0eAYUFmTf5bMuOlrSbDXB/fzo=
X-Google-Smtp-Source: APXvYqxklstUrCVZEl1VUef3v/R6i7njg2hNjeLXXhKtOb8qhxhCjhXDazqTZogY3rUjkKvHqdX1ZOlDh6IiYA968oU=
X-Received: by 2002:adf:f68f:: with SMTP id v15mr10246252wrp.4.1560441732659; 
 Thu, 13 Jun 2019 09:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190612170027.13dbb84b@canb.auug.org.au>
 <9b4f8e15-8f9f-51d9-c355-9c2e453921e3@infradead.org>
In-Reply-To: <9b4f8e15-8f9f-51d9-c355-9c2e453921e3@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Jun 2019 12:02:00 -0400
Message-ID: <CADnq5_PRoeCdriQgzV6yKUpFHxpWfHL2Xwd9VW=FRoNYj7H_kQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jun 12 (amdgpu: dcn10_hw_sequencer)
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nd6aCrSjzkm1aMj9lM4ssykkYiRccO6zWy49Uehvbco=;
 b=CSkroNIttf5ygpwSln0gQNWe5WrdTUnKsWGQygY3KEMqhMwh3P134Gc2auf/eb4mBx
 LisWgeOU85BPWmvQPgkxLPQFf1rHZtl/OuOJIFDzgNf4DOff+pVvSFehTEd5EaHF92fo
 tr/YC+MER9kS+oAnHJsy92hT+BeBXsKIY+w1lXfG+V300DwROLHFa8/AF4EcgAFmuldZ
 6efyDI9zq5ja1+FWDA1zIvC5VHAzEeFBQapVtTHLLAa4+IDEbMSA1/kcoOo3Ldbqeqts
 Om8CvV5KGB2rbs8My7Vod1OlIkxH8gTecLwfDYIJLspPGjtO0NPQiL/iddPgQfcD37ZN
 6P3w==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMzoyNyBBTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiA2LzEyLzE5IDEyOjAwIEFNLCBTdGVwaGVuIFJvdGh3
ZWxsIHdyb3RlOgo+ID4gSGkgYWxsLAo+ID4KPiA+IENoYW5nZXMgc2luY2UgMjAxOTA2MTE6Cj4g
Pgo+Cj4gb24geDg2XzY0Ogo+Cj4gLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYzogSW4gZnVuY3Rpb24g4oCYZGNuMTBf
YXBwbHlfY3R4X2Zvcl9zdXJmYWNl4oCZOgo+IC4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmM6MjM3ODozOiBlcnJvcjog
aW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdWRlbGF54oCZIFstV2Vycm9yPWlt
cGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgIHVkZWxheSh1bmRlcmZsb3dfY2hlY2tf
ZGVsYXlfdXMpOwo+ICAgIF4KCkZpeGVkIHdpdGg6Cmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC8zMTAwMTYvCgo+Cj4KPgo+IC0tCj4gflJhbmR5Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
