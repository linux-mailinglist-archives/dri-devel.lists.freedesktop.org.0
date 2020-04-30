Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B521C1BFBDD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 16:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63F66E906;
	Thu, 30 Apr 2020 14:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9BB6E906
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 14:02:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d17so7022807wrg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jiIaYsggpBakhnnkVBGSz6hk94HlfiIOcAoKKv2Pdv4=;
 b=RaBbh1/74+THrE0I7GBYuCU2D2ZyTALWrtlCwS014vR9U2ZTQ2c+yuPlvOa4MW8so8
 pCUHC2hWjhKygyps53np8y5eQme6MKti7DOj+7vWSSaGv06YBGI6zeNNy9AA21lcwQPS
 XT7vKMpETh14bxqnDsLRarkk/S4hiEyCrfd7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jiIaYsggpBakhnnkVBGSz6hk94HlfiIOcAoKKv2Pdv4=;
 b=CQ/NLCNzcA7diqRIFOTmBR8mPco2p3O+349b72/6kliFCgfK0SSUK19TAAPXX7RUAn
 OQd4+VYMtXts1zNSOIisKd/tucYXrvRPFFJwImzwgz6/6SamaZayshY749vzvarxs7WB
 94Vqar54IwJOQVi7ifg1b0Fr7fLBj0fB11Elvq/LQwrkaRL52IUfud0TuYAY0KTvCQgy
 nl0eQzdVUMqR3yNNexBut/iG5Y+5vH7jFbIwjeDzRvyZ151mnY8FMSiPAEO50dSkG/Zb
 J/eTavaAkDChxbeJDpSfrJ59cylpOECYorgs/38OqDuKvxreONsSDMxxTsFkfoZWkwYj
 5u/Q==
X-Gm-Message-State: AGi0PuYe58OtQCtBr2+MXmy0BEPXOdd4rlr6uSBpO0CPd0EvForKM84h
 qhNCL5+HuugzfCTUP5idQYavVlYN0QY=
X-Google-Smtp-Source: APiQypJ7g1twD4Ui5as4s0fdrh+ixOi5o4hbJUSnpWbZlMn/6MkO+MKUQclqQkHP4kH2mil3JygLgQ==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr3991201wrq.273.1588255365830; 
 Thu, 30 Apr 2020 07:02:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r18sm4133635wrj.70.2020.04.30.07.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 07:02:44 -0700 (PDT)
Date: Thu, 30 Apr 2020 16:02:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200430140242.GF10381@phenom.ffwll.local>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org>
 <20200430083219.GC3118@dell>
 <0fbc4eb5-cb39-5974-85bb-9f13278ecab4@tronnes.org>
 <20200430101529.GB298816@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430101529.GB298816@dell>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMzAsIDIwMjAgYXQgMTE6MTU6MjlBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIFRodSwgMzAgQXByIDIwMjAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPiAKPiA+IAo+
ID4gCj4gPiBEZW4gMzAuMDQuMjAyMCAxMC4zMiwgc2tyZXYgTGVlIEpvbmVzOgo+ID4gPiBPbiBX
ZWQsIDI5IEFwciAyMDIwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gPiA+IAo+ID4gPj4gQWRk
IGEgd2F5IHRvIGxvb2t1cCBhIGJhY2tsaWdodCBkZXZpY2UgYmFzZWQgb24gaXRzIG5hbWUuCj4g
PiA+PiBXaWxsIGJlIHVzZWQgYnkgYSBVU0IgZGlzcGxheSBnYWRnZXQgZ2V0dGluZyB0aGUgbmFt
ZSBmcm9tIGNvbmZpZ2ZzLgo+ID4gPj4KPiA+ID4+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgo+ID4gPj4gQ2M6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxp
bmFyby5vcmc+Cj4gPiA+PiBDYzogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+Cj4g
PiA+PiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4K
PiA+ID4+IC0tLQo+ID4gPj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2JhY2tsaWdodC5jIHwg
MjEgKysrKysrKysrKysrKysrKysrKysrCj4gPiA+PiAgaW5jbHVkZS9saW51eC9iYWNrbGlnaHQu
aCAgICAgICAgICAgfCAgMSArCj4gPiA+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25z
KCspCj4gPiA+IAo+ID4gPiBPbmNlIHJldmlld2VkLCBjYW4gdGhpcyBwYXRjaCBiZSBhcHBsaWVk
IG9uIGl0cyBvd24/Cj4gPiA+IAo+ID4gCj4gPiBJZiB5b3UgY2FuIGFwcGx5IGl0IGZvciA1Ljgs
IHRoZW4gd2UncmUgZ29vZC4gRFJNIGhhcyBjdXRvZmYgYXQgLXJjNSBhbmQKPiA+IHRoZSBkcml2
ZXIgd29uJ3QgYmUgcmVhZHkgZm9yIHRoYXQuIFRoaXMgcGF0Y2ggaGFzIHRoaXMgZGVwZW5kZW5j
eQo+ID4gY2hhaW46IHVzYiAtPiBkcm0gLT4gYmFja2xpZ2h0LiBTbyBpZiB5b3UgY2FuIGFwcGx5
IGl0IGZvciA1LjgsIHRoaW5ncwo+ID4gZ2V0cyBlYXNpZXIuCj4gPiAKPiA+ID4gTXkgZ3Vlc3Mg
aXMgdGhhdCBpdCBjYW4ndCwgYXMgdGhlIG90aGVyIHBhdGNoZXMgaW4gdGhpcyBzZXQgZGVwZW5k
IG9uCj4gPiA+IGl0LCByaWdodD8gIElmIHRoaXMgYXNzdW1wdGlvbiBpcyB0cnVlLCB5b3UgbmVl
ZCB0byBzZW5kIG1lIHRoZSByZXN0Cj4gPiA+IG9mIHRoZSBzZXQuCj4gPiA+IAo+ID4gPiBGWUk6
IEl0J3Mgbm9ybWFsbHkgYmV0dGVyIHRvIHNlbmQgdGhlIHdob2xlIHNldCB0byBldmVyeW9uZSwg
YXMgaXQKPiA+ID4gcHJvdmlkZXMgdmlzaWJpbGl0eSBvbiBjdXJyZW50IHJldmlldyAob3IgbGFj
ayB0aGVyZSBvZikgc3RhdHVzIG9mIHRoZQo+ID4gPiBvdGhlciBwYXRjaGVzIGFuZCBhbGxvd3Mg
ZWFjaCBvZiB0aGUgbWFpbnRhaW5lcnMgdG8gZGlzY3VzcyBwb3NzaWJsZQo+ID4gPiBtZXJnZSBz
dHJhdGVnaWVzLgoKVW5mb3J0dW5hdGVseSB0aGlzIGRvZXNuJ3QgaG9sZCB1bml2ZXJzYWxseSwg
c2luY2Ugb25jZSB5b3UgY2MgdG9vIG1hbnkKcGVvcGxlIHNtdHAgc2VydmVycyBzdGFydCB0aHJv
d2luZyB5b3VyIG1haWxzIGF3YXkuIEdlbmVyYWxseSBvbmx5IGhhcHBlbnMKZm9yIGJpZ2dlciBy
ZWZhY3RvcmluZ3MsIHNvIHByZXR0eSBtdWNoIGFueW9uZSB3b3JraW5nIGNyb3NzLXRyZWUgZG9l
c24ndApkbyB0aGlzIGJlY2F1c2UgaXQgZG9lc24ndCB3b3JrLgoKPiA+IGRyaS1kZXZlbCBpcyB0
aGUgTUwgZm9yIGJhY2tsaWdodCBzbyBJIGFzc3VtZWQgeW91IGdvdCB0aGUgZnVsbCBzZXQuCj4g
Cj4gZHJpLWRldmVsIGlzbid0IHRoZSBNTCBmb3IgQmFja2xpZ2h0LiAgSXQncyBhbiBpbnRlcmVz
dGVkIHBhcnR5Lgo+IAo+IEkgY2VydGFpbmx5IGhhdmUgbm8gaW50ZW50aW9uIG9mIHN1YnNjcmli
aW5nIHRvIGl0LgoKZHJpLWRldmVsIGlzIG9uIGxvcmUgc28gdGhhdCB5b3UgY2FuIGdyYWIgbWlz
c2luZyBwYXRjaGVzLiBObyBuZWVkIHRvCnN1YnNjcmliZS4gSSd2ZSBvbmx5IG1hbmdlZCB0byBn
ZXQgdGhpcyBzb3J0ZWQgcmVjZW50bHkgKGxhc3QgYXV0dW1uIG9yCnNvKSwgYnV0IGl0J3MgZmlu
YWxseSBkb25lLgotRGFuaWVsCgo+ID4gSSBoYXZlIGhhZCB0cm91YmxlIGluIHRoZSBwYXN0IHdp
dGggbXkgZW1haWwgcHJvdmlkZXIgZHJvcHBpbmcgcGFydHMgb2YKPiA+IGEgc2VyaWVzIHdoZW4g
SSBoYWQgdG8gbWFueSByZWNpcGllbnRzLgo+IAo+IFdpdGhvdXQgdmlzaWJpbGl0eSBpbnRvIHRo
ZSBvdGhlciBwYXRjaGVzIGluIHRoZSBzZXQsIHRoaW5ncyBiZWNvbWUKPiBtb3JlIGRpZmZpY3Vs
dC4gIE1heWJlIHVzZSBhIGRpZmZlcmVudC9iZXR0ZXIgZW1haWwgcHJvdmlkZXIuCj4gCj4gLS0g
Cj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dCj4gTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFk
Cj4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCj4gRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
