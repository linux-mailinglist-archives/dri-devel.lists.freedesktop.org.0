Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4D22B4D0B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC9A89FA0;
	Mon, 16 Nov 2020 17:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2DC89FA0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:33:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m6so2441428wrg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QQ0Y0HjWuKkF/yI1XhFJjLETVzYo8oJjFXZUGQZAiWk=;
 b=BV/xWrUd/fIFABPjkFm2ZT6D5AYrHNqpqMcuOwAaHo4h/21ltS0feo5aMprbhoAn3H
 LLf92/Sv4s5MbbeAOOoMGpsT0gdOmZ/Yz4siVcbyT/bxmytb0IkHFBtEoXdbHVEBJsGB
 xT0gB8m+0Rm2QIdd2Fowc9T6xLVFCMVyPxtogxhCpSZCA5cwnApeSPJf1Rcl7k1QIHgj
 fUUA+tq0THkHI9YX5RTXoABdRJTOffUOlf1ay3MBeX03m8hWvs/MnSPKzph7u/EroDCp
 JljYfvVppcxQPIW32qy5G1PwFpiNEfbt/z1BjJ+xRxou0r5VfC35bRcSSdFBPSrwsuwl
 1pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QQ0Y0HjWuKkF/yI1XhFJjLETVzYo8oJjFXZUGQZAiWk=;
 b=mw583pw6uKP81Lf/p0HgkVVQ6BwtKV1w3wb5E5WYTypwM91JFvNNgUoJ7lrNdTtnTm
 PF4No/F2Wl+8EoeOb2BaLGt8nwIgE1eBTrxQIDrX49f+pqOKRVVOMfmoZIxZhi2zqlqf
 me7qi6k5KAEAgK0X0SRSXY7D5dVZVFD7Z0QdljAgm2UdsDxBkKzTBXFo49IEYqvLBA3s
 D2vGPTpHmqgJOuxz8Kk3ZBc5Q4kDenEmm2S7xa+pbw7NOPpriRur2GegXfi0FgGmjEfH
 Q9+2vzjJqvtQDywIDOS84AHsjRJYhrOuSPvcyxNPtXe53XlVyLRm6XsPfqhKHiCb74iQ
 AQ3A==
X-Gm-Message-State: AOAM532CE6bTVNghzOpf+dbcqMoR+zOs4j2LxoOPEu6IcXoN2DVmTE1/
 46tR3tMj3gNhfSptlQ2rlk8RaeHukboufTJX
X-Google-Smtp-Source: ABdhPJyDe42mcoiLj3IUWc1BkQI6esqikQ5pfG4c1j5rokQQAfmHxfIwCFaouQMwqTq0KbGhQ20Rbg==
X-Received: by 2002:adf:f181:: with SMTP id h1mr20116998wro.267.1605548022184; 
 Mon, 16 Nov 2020 09:33:42 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p12sm23389482wrw.28.2020.11.16.09.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:33:41 -0800 (PST)
Date: Mon, 16 Nov 2020 17:33:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 02/30] include: drm: drm_atomic: Artificially use 'crtc'
 to avoid 'not used' warning
Message-ID: <20201116173339.GQ3718728@dell>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-3-lee.jones@linaro.org>
 <20201112202516.GA3340631@ravnborg.org>
 <20201113204959.GW401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113204959.GW401619@phenom.ffwll.local>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMyBOb3YgMjAyMCwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gVGh1LCBOb3Yg
MTIsIDIwMjAgYXQgMDk6MjU6MTZQTSArMDEwMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gSGkg
TGVlLAo+ID4gCj4gPiBPbiBUaHUsIE5vdiAxMiwgMjAyMCBhdCAwNzowMDoxMVBNICswMDAwLCBM
ZWUgSm9uZXMgd3JvdGU6Cj4gPiA+IFRoZSBwcmVjZWRlbnQgaGFzIGFscmVhZHkgYmVlbiBzZXQg
Ynkgb3RoZXIgbWFjcm9zIGluIHRoZSBzYW1lIGZpbGUuCj4gPiA+IAo+ID4gPiBGaXhlcyB0aGUg
Zm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiA+ID4gCj4gPiA+ICBkcml2
ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jOjU1OjE5OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhj
cnRj4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gPiA+
ICA1NSB8IHN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKPiA+ID4gIHwgXn5+fgo+ID4gPiAKPiA+ID4g
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
Cj4gPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gPiA+IENjOiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiA+ID4gQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiA+ID4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiA+ID4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gU2lnbmVkLW9mZi1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IAo+ID4gQWxzbyBhcHBsaWVkIHRv
IGRybS1taXNjLW5leHQuCj4gPiBUaGlzIHdhcyB0aGUgbGFzdCBwYXRjaCBmcm9tIHRoaXMgYmF0
Y2ggSSB3aWxsIHByb2Nlc3MuCj4gPiBUaGUgb3RoZXJzIGFyZSBsZWZ0IGZvciB0aGUgbWFpbnRh
aW5lcnMgdG8gcGljayB1cC4KPiAKPiBidHcgZm9yIHBhdGNoZXMgdGhhdCBtYWludGFpbmVycyBk
b24ndCBwaWNrIHVwLCB0aGUgdXN1YWwgcHJvY2VzcyBpcyB0aGF0Cj4gd2UgZ2l2ZSB0aGVtIDIg
d2Vla3MsIHRoZW4ganVzdCBtYXNzIGFwcGx5LiBOb3cgeW91J3JlIHByb2R1Y2luZyBhIGxvdCBv
Zgo+IHBhdGNoZXMsIHRvbyBtdWNoIGZvciBtZSB0byBrZWVwIHRyYWNrLCBzbyBwbGVhc2UganVz
dCBwaW5nIG1lIHdpdGggYQo+IHJlc2VuZCBmb3IgdGhvc2UgdGhhdCBleHBpcmVkIGFuZCBJJ2xs
IGdvIHRocm91Z2ggYW5kIHBpY2sgdGhlbSBhbGwgdXAuCgpPa2F5LCBJIGhhdmUgc3BsaXQgdGhl
IHJlbWFpbmluZyBwYXRjaGVzIGludG8gMiBuZXcgc2V0cy4KCk9uZSBmb3IgUmFkZW9uLCB0aGUg
b3RoZXIgZm9yIGV2ZXJ5dGhpbmcgZWxzZS4KCkhvcGVmdWxseSB0aGF0IG1ha2VzIHRoaW5ncyBl
YXNpZXIvbW9yZSBvYnZpb3VzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVj
aG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRl
ciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
