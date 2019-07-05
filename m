Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B9D60478
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 12:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB6F6E483;
	Fri,  5 Jul 2019 10:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6EB6E483
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 10:30:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z23so8812490wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 03:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MR8qrrLzz1ee0JQetWcmCrqB1Zhi9MpQBveeGBxIzn8=;
 b=nCv/wTt+B5cBmax99qEnJM91hOPpOyH85JXMU8RMCKNZAOsFW/ipbidGZ1F+KjMPmd
 XV/if6fnjAYuWSDHlf+E753w2ietfD81mNxH96wH6BlPxVSiKLPrhMjcIicKW6n4ctXG
 d3p1BnuwCklNvrSYd13KQwEuQpWuC55X/bpH68+H1VbqY//ylWv8MxuaqkpqffqNKfo7
 H0Wv5NBStzfa0UJLUC3KHlDnLJ35f+fMaFSi6YT4vNO0p/4pBwQGTrdU0L3+uRlyqTm7
 V2Tws46vNJB3WG1Ye1v8wYnEa6keaNSmaaDVRMugl14hTBdNFdp75qtDFRUuOfZ+Rl9i
 NjoQ==
X-Gm-Message-State: APjAAAVbUyYKK2MDn7p3+kpdS4zijbC0/vpAhWV53b+uMbuojtrg/y9F
 nDgj90e7RW1oRotE8NPQGDoSfg==
X-Google-Smtp-Source: APXvYqxY2gEpA+xkxp2cQs9p2kb6x6zZLLaKq7ZvIatk9EblUmS/qLnLyEGcoK/mMsScXPadH1rv9w==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr2991912wme.177.1562322607796; 
 Fri, 05 Jul 2019 03:30:07 -0700 (PDT)
Received: from holly.lan (82-132-213-94.dab.02.net. [82.132.213.94])
 by smtp.gmail.com with ESMTPSA id y10sm5524508wmj.2.2019.07.05.03.30.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 03:30:07 -0700 (PDT)
Date: Fri, 5 Jul 2019 11:29:59 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/4] Add a generic driver for LED-based backlight
Message-ID: <20190705102959.cmqhzpzikqjsydlx@holly.lan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190705101434.fw5rpctnqt6dwg6e@devuan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705101434.fw5rpctnqt6dwg6e@devuan>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MR8qrrLzz1ee0JQetWcmCrqB1Zhi9MpQBveeGBxIzn8=;
 b=OZa6F+Ua55bJVrO2vEtkAOaJIkayk3hKsgKXfjMjIEqrl21aUvdj0yr81GuNGWuUn+
 X6okF+VgbwxcQjKD44wbj7XJO1UGOzBsE7A9xQ4xJNVV1KZrBSi7tPSWgxDxC85AI11W
 qQE9PlaSMJz8oQiQv6nL+hdwDqyWPV9c89RTpvKcvDQCGO2PmOmusRVZ0HowA2bJ9XM9
 RLR8t3DTMADduoe+uYn4EXsRdQPP08xx6yFfoVE5jXIDpwW4H2M3YwawkXB6c9ZfyJfs
 rTrXzsguklz4vk8ZCE0AdWTXLGS1JyUpD0U01f4QA9RkiYYPNtr3BeKQitVC+gKSuiyH
 uVrA==
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
Cc: mark.rutland@arm.com, jingoohan1@gmail.com, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMTI6MTQ6MzRQTSArMDIwMCwgUGF2ZWwgTWFjaGVrIHdy
b3RlOgo+IE9uIE1vbiAyMDE5LTA3LTAxIDE3OjE0OjE5LCBKZWFuLUphY3F1ZXMgSGlibG90IHdy
b3RlOgo+ID4gVGhpcyBzZXJpZXMgYWltcyB0byBhZGQgYSBsZWQtYmFja2xpZ2h0IGRyaXZlciwg
c2ltaWxhciB0byBwd20tYmFja2xpZ2h0LAo+ID4gYnV0IHVzaW5nIGEgTEVEIGNsYXNzIGRldmlj
ZSB1bmRlcm5lYXRoLgo+ID4gCj4gPiBBIGZldyB5ZWFycyBhZ28gKDIwMTUpLCBUb21pIFZhbGtl
aW5lbiBwb3N0ZWQgYSBzZXJpZXMgaW1wbGVtZW50aW5nIGEKPiA+IGJhY2tsaWdodCBkcml2ZXIg
b24gdG9wIG9mIGEgTEVEIGRldmljZToKPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvNzI5Mzk5MS8KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNzI5
NDAwMS8KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNzI5Mzk4MS8KPiA+
IAo+ID4gVGhlIGRpc2N1c3Npb24gc3RvcHBlZCBiZWNhdXNlIFRvbWkgbGFja2VkIHRoZSB0aW1l
IHRvIHdvcmsgb24gaXQuCj4gPiAKPiA+IFRoaXMgc2VyaWVzIHRha2VzIGl0IGZyb20gdGhlcmUg
YW5kIGltcGxlbWVudHMgdGhlIGJpbmRpbmcgdGhhdCB3YXMKPiA+IGRpc2N1c3NlZCBpbiBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzcyOTM5OTEvLiBJbiB0aGlzIG5ldwo+ID4g
YmluZGluZyB0aGUgYmFja2xpZ2h0IGRldmljZSBpcyBhIGNoaWxkIG9mIHRoZSBMRUQgY29udHJv
bGxlciBpbnN0ZWFkIG9mCj4gPiBiZWluZyBhbm90aGVyIHBsYXRmb3JtIGRldmljZSB0aGF0IHVz
ZXMgYSBwaGFuZGxlIHRvIHJlZmVyZW5jZSBhIExFRC4KPiAKPiBPdGhlciBvcHRpb24gd291bGQg
YmUgdG8gaGF2ZSBiYWNrbGlnaHQgdHJpZ2dlci4gV2hhdCBhcmUKPiBhZHZhbnRhZ2VzL2Rpc2Fk
dmFudGFnZXMgcmVsYXRpdmUgdG8gdGhhdD8KCkkgc3BlbnQgYSBsaXR0bGUgdGltZSB0aGlua2lu
ZyBhYm91dCB0aGF0IGR1cmluZyB0aGUgcmVjZW50IHJvdW5kIG9mCnJldmlld3MuCgpNeSByb3Vn
aCB0aG91Z2h0cyB3ZXJlIHRoYXQgTEVEIHRyaWdnZXJzIHdvdWxkIGJlIGEgZ29vZCB3YXkgdG8K
aGFuZGxlIGl0IGluIHRoZSBrZXJuZWwgY29kZSBhbmQgd291bGQgdHJpdmlhbGx5IHNvbHZlIGEg
YmFja2xpZ2h0CmNvbXBvc2VkIG9mIG11bHRpcGxlIExFRCBkZXZpY2VzIChzaW5jZSBhbGwgY291
bGQgYXR0YWNoIHRvIHRoZSBzYW1lCnRyaWdnZXIpLiBIb3dldmVyIEkgdGhpbmsgaXQgd291bGQg
YmUgZGlmZmljdWx0IHRvIHVzZSB0aGUgZXhpc3RpbmcgRFQKYmluZGluZ3MgZm9yIHRyaWdnZXJz
IHRvIGV4cHJlc3MgdGhpbmdzIGxpa2UgYnJpZ2h0bmVzcyBjdXJ2ZXMgYW5kIHRvCmhhbmRsZSBz
eXN0ZW1zIHdpdGggbXVsdGlwbGUgaGVhZHMuCgpJJ20gbm90ICp0b28qIHdvcnJpZWQgYWJvdXQg
Y29uZmxpY3Qgd2l0aCB0aGUgZXhpc3RpbmcgYmFja2xpZ2h0IHRyaWdnZXIKKHdoaWNoIGlzbid0
IGFjdHVhbGx5IGEgYmFja2xpZ2h0Li4uIGp1c3QgYSBob29rIGludG8gdGhlIGZyYW1lYnVmZmVy
CmNvZGUgdG8gb3BlcmF0ZSBhIGJpbmFyeSBMRUQpLiBQZW9wbGUgbGlrZSBEYW5pZWwgVmV0dGVy
IGFyZQpsYWJvdXJpbmcgZGlsaWdlbnRseSB0byBnZXQgcmlkIG9mIHRoZSBub3RpZmllciBpdCBk
ZXBlbmRzIG9uIHNvIHR1cm5pbmcKaXQgaW50byBhIHByb3BlciBiYWNrbGlnaHQgZGV2aWNlIHdv
dWxkIHByb2JhYmx5IGhlbHAgd2l0aCB0aGF0IGVmZm9ydC4KCkFueWhvdy4uLiBoYXZpbmcgdGhv
dWdodCB0aGUgYWJvdmUgSSB0aGVuIHNob29rIG15c2VsZiBhIGJpdCBhbmQKZmlndXJlZCBpdCB3
YXMgbW9yZSBpbXBvcnRhbnQgdG8gZm9jdXMgb24gc2FuZSBiaW5kaW5ncyB0aGF0IG9uIHdoYXQK
dGhlIGtlcm5lbCBkb2VzIHVuZGVyIHRoZSBjb3ZlcnMgdG8gcmVhbGl6ZSB0aGVtIDstKSBhbmQg
ZGVjaWRlZCB0byBrZWVwCnF1aWV0IHVudGlsIHRoZSBuZXh0IHNldCBvZiBiaW5kaW5ncyBpcyBw
cm9wb3NlZC4KCkhvd2V2ZXIuLi4gc2luY2UgeW91IGFza2VkLi4uCgoKCkRhbmllbC4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
