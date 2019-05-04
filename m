Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17CA13C1F
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 22:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDA089307;
	Sat,  4 May 2019 20:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B172E89307
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2019 20:43:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o189so64734wmb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 May 2019 13:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q7VTjVQy3LQQCBBMMEIcWAT75Jgeqmn8vdXa9ljuhRQ=;
 b=Anu/QwpXzt4u5b8ETS/2fMlKvb4BGWz9V6DzSrgGiM9BmsaiSMnlCz02b79flKK7Qk
 ZxvfYMcHidFHl8c2R0e8+OL2qNvnvhEgXvp/sbydx8xXSj0yspX2dikXkB6YsOF3Ulby
 MxIlZzfO3nxZxom3KmwyfdMjZ5OW41VKm3LPWt08BhlF7AjNqX9qnfJ91DHoupZbL9vN
 2oG1l3tAqUFT3oMcINz4yNq4RSODWSsHCUy9HwxGGuOdSgsiREW/fbaaEDZI9MRl+1S5
 ntKF1VrxW3RbyHwrnoP50q59R13AFuB4Pylw6zmwLCtb53MvM0rPW79JPnjuWVonbKDz
 ez3w==
X-Gm-Message-State: APjAAAV4RJdel8WmAdWKgq1+R351nfayBzZQfeoZ47Uh1Fye9hc1JIMa
 2wE8XgVCQ1IvVk5styGeqR+Fs32Tw8WHGA==
X-Google-Smtp-Source: APXvYqw+pUq0xsQLE3UeMBYFiwYEQaXsy37NFZF9oWvNIo2W8U2XNO9cR5R6uBrzhy5u6OYX+bntuA==
X-Received: by 2002:a1c:c287:: with SMTP id s129mr11225229wmf.63.1557002596342; 
 Sat, 04 May 2019 13:43:16 -0700 (PDT)
Received: from jrtc4a.trin.private.cam.ac.uk
 (global-184-8.nat-1.net.cam.ac.uk. [131.111.184.8])
 by smtp.gmail.com with ESMTPSA id f1sm5179702wrc.93.2019.05.04.13.43.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 04 May 2019 13:43:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH] drm: Fix drm.h uapi header for GNU/kFreeBSD
From: James Clarke <jrtc27@jrtc27.com>
In-Reply-To: <877ef5hifi.fsf@anholt.net>
Date: Sat, 4 May 2019 21:43:14 +0100
Message-Id: <C2E5BBDF-DD8B-4024-8995-8E21549385C7@jrtc27.com>
References: <20190115150418.68080-1-jrtc27@jrtc27.com>
 <20190115151723.GQ10517@phenom.ffwll.local> <877ef5hifi.fsf@anholt.net>
To: Eric Anholt <eric@anholt.net>
X-Mailer: Apple Mail (2.3445.102.3)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q7VTjVQy3LQQCBBMMEIcWAT75Jgeqmn8vdXa9ljuhRQ=;
 b=Jm3kiPhJHg1JukT48q15yjtyhO4wM38wmxMwnliwI362J4GxmXOr+zjtuRTs1CON8z
 4Qfn/odUEn6gaTEP2zdagiryCQdcY3ALafeiNA0PAKLPXvmOhKeONW7+EeRCRuw5QOeh
 +4NND/gze8oPlNOF3mm0ibWs8LyrO8Bh4yTpc=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTUgSmFuIDIwMTksIGF0IDE4OjQxLCBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PiB3
cm90ZToKPiAKPiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyaXRlczoKPiAKPj4g
T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDM6MDQ6MThQTSArMDAwMCwgSmFtZXMgQ2xhcmtlIHdy
b3RlOgo+Pj4gTGlrZSBHTlUvTGludXgsIEdOVS9rRnJlZUJTRCdzIHN5cy90eXBlcy5oIGRvZXMg
bm90IGRlZmluZSB0aGUgdWludFhfdAo+Pj4gdHlwZXMsIHdoaWNoIGRpZmZlcnMgZnJvbSB0aGUg
QlNEcycgaGVhZGVycy4gVGh1cyB3ZSBzaG91bGQgaW5jbHVkZQo+Pj4gc3RkaW50LmggdG8gZW5z
dXJlIHdlIGhhdmUgYWxsIHRoZSByZXF1aXJlZCBpbnRlZ2VyIHR5cGVzLgo+Pj4gCj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW1lcyBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29tPgo+PiAKPj4gV291bGQg
YmUgZ29vZCB0byBnZXQgYW4gYWNrIGZyb20gc29tZSBvdGhlciAqYnNkIHRoYXQgdGhpcyBpcyBz
dGlsbCBhbGwKPj4gZmluZS4gbGd0bSBvdGhlcndpc2UuCj4+IC1EYW5pZWwKPiAKPiBJIHRoaW5r
IHRoZXJlIHdhcyBzb21lIG5lZWQgZm9yIGludHR5cGVzLmggaW5zdGVhZCBvZiBzdGRpbnQgbGlr
ZSBhCj4gZGVjYWRlIGFnbyB3aGVuIEkgd2FzIHdvcmtpbmcgb24gQlNEcywgYnV0IHRoYXQgd2Fz
IGFscmVhZHkgYWxtb3N0Cj4gaXJyZWxldmFudCB0aGVuLgoKSGksIGp1c3QgZm9sbG93aW5nIHVw
IG9uIHRoaXM7IGlzIHRoZXJlIHN0aWxsIHRoZSBuZWVkIGZvciBhbiBBQ0s/CgpSZWdhcmRzLApK
YW1lcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
