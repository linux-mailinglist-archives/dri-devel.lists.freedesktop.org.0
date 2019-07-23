Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B616D713F7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 10:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5BD6E27F;
	Tue, 23 Jul 2019 08:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2A96E27F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 08:27:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z28so40273463ljn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 01:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aQWbT+LvRZmTZPbHcNwKkhIKABtN7PWcJhZVigHFt6k=;
 b=cl7+JbjynvcxXVzf7ajfmJ/jN6LdOapLP5bcnAHhvh2MCuu7GWTMQIJeFv4K2jpqmx
 AbvN2BBN8byWXcKGS0J2W0wVPu300p4stQsGFk5jrg9hSKWK92bTd/DLJEaIjpx7AxI1
 t8vyLjerLYNs73Yp6a6ClpwKqbeCTOT9v8IwiL3OS2fYBlRlfuSeqe9d62lce9yVdMXj
 bDQMmlVjKVhJAAFZhFNXxkFEpBvcwJ30CdBMt7jlBtNythzbX9Uy3Z1pLLqsJsPLZW+S
 aKPzok2WMBBPgprBp0o01xQLCdysMlpgHA1zGEL3353yFPLKuFVduhgNxm2fletrt5P1
 +7ug==
X-Gm-Message-State: APjAAAWjDBmTm7dbYBjAr089A7J4VM0SrgH55MBDUhlQdaRrTut+2YpF
 5Zr5FaJ7vjw7GdeCj2sYp68IsTFsIwAux4lmdhw2RA==
X-Google-Smtp-Source: APXvYqz0HX8OQPx3GnS5yBtViFQ3wpO4poIOD2WGxx5DZxgrR64F2LQUSTYoiFWfPKuh/Y6BgHMP3tBxrfw7ADilUIk=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr21488965ljs.54.1563870461161; 
 Tue, 23 Jul 2019 01:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190722182439.44844-1-dianders@chromium.org>
 <20190722182439.44844-5-dianders@chromium.org>
In-Reply-To: <20190722182439.44844-5-dianders@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Jul 2019 10:27:30 +0200
Message-ID: <CACRpkdazAx_5rxwYbKwMs_a7G2K5ETnxj0nUQ7TGarsv6bAv5A@mail.gmail.com>
Subject: Re: [PATCH 4/4] video: amba-clcd: Spout an error if
 of_get_display_timing() gives an error
To: Douglas Anderson <dianders@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=aQWbT+LvRZmTZPbHcNwKkhIKABtN7PWcJhZVigHFt6k=;
 b=J1lPzwkO9q3MgVFAKEgQWTdHzLfR0r4/dqf8Q19MSVI88smbj773m6rwndjcBQKakb
 IY8TIqOd4v8dpT+r3Dzzl0fLN7WxVaVXMhHOvd2xdMTAhKTMEVCBZ1KooyYMEu0GQ5RC
 H8/NZxL6bNh4KE4mf9JhUuy16amuG3/nCp9E+T1GdkmvywkuZ7yfWQgjJmfSQWUSHpSK
 O0GR3MGZ7OtRjtdDMEDcl5xVVwSdxCOo+MFnvtCXuxiSQM0HuG7Av917+OltWBpMC35D
 vXRLmwzCgBpd8r/+gDYK8xAM3oEzqExKtlZvmxleii2S+GXaKtYCsmH0nmLqEwhTgy0B
 /MGw==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Russell King <linux@armlinux.org.uk>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgODoyNSBQTSBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVy
c0BjaHJvbWl1bS5vcmc+IHdyb3RlOgoKPiBJbiB0aGUgcGF0Y2ggKCJ2aWRlbzogb2Y6IGRpc3Bs
YXlfdGltaW5nOiBEb24ndCB5ZWxsIGlmIG5vIHRpbWluZyBub2RlCj4gaXMgcHJlc2VudCIpIHdl
J2xsIHN0b3Agc3BvdXRpbmcgYW4gZXJyb3IgZGlyZWN0bHkgaW4KPiBvZl9nZXRfZGlzcGxheV90
aW1pbmcoKSBpZiBubyBub2RlIGlzIHByZXNlbnQuICBQcmVzdW1hYmx5IGFtYmEtY2xjZAo+IHNo
b3VsZCB0YWtlIGNoYXJnZSBvZiBzcG91dGluZyBpdHMgb3duIGVycm9yIG5vdy4KPgo+IE5PVEU6
IHdlJ2xsIHByaW50IHR3byBlcnJvcnMgaWYgdGhlIG5vZGUgd2FzIHByZXNlbnQgYnV0IHRoZXJl
IHdlcmUKPiBwcm9ibGVtcyBwYXJzaW5nIHRoZSB0aW1pbmcgbm9kZSAob25lIGluIG9mX3BhcnNl
X2Rpc3BsYXlfdGltaW5nKCkgYW5kCj4gdGhpcyBuZXcgb25lKS4gIFNpbmNlIHRoaXMgaXMgYSBm
YXRhbCBlcnJvciBmb3IgdGhlIGRyaXZlcidzIHByb2JlCj4gKGFuZCBwcmVzdW1hYmx5IHNvbWVv
bmUgd2lsbCBiZSBkZWJ1Z2dpbmcpLCB0aGlzIHNob3VsZCBiZSBPSy4KPgo+IFNpZ25lZC1vZmYt
Ynk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KCkFja2VkLWJ5OiBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2Fs
bGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
