Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1358E1B01E9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FF56E1C0;
	Mon, 20 Apr 2020 06:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B19D6EC8A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 14:16:38 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id m2so4127288lfo.6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CtYfK4CE3m9SojcTQ69RrpQQShVpfpzhUE+XBnEE8Ns=;
 b=kpS0y2qIcT97Y4zX+4GPyWoqZIQ0t9uTvPgVAF552Zrz1kyWsn9/JXEOjz0jAsLcyJ
 XLAiBoy0fONyRAjaTWtztkR+pSkPLHGZ6HKPaOdKTEtpUh40Q+adLmVYV+sd0vcoNL0P
 0Yg90yduiX9IKV/bOlglBzYbscblNd+qDt5G4gTvN5rIKedhSgdkSey9x3b/eKjMZlO4
 +eL8r9nMv09q4k2DtWANfz3VxTKN8Ev0cPLB529LTeb+6FGwvAr69xTy/0GL15OKQH3n
 BPuBE2ymuSE/RSYagqACkuLUI6orIh8lDohVgpQ38w+FylHNT/gxGgkAWkWwVoxAkv2z
 SgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CtYfK4CE3m9SojcTQ69RrpQQShVpfpzhUE+XBnEE8Ns=;
 b=t48SQ2pIj4iQAEDf6eVqDDyJp3FCxw+wlKhzQmBk4Omb7/fldxSWYRpsp2ZKZQiPPm
 L91x0Md+17RHaaxBBjuf3/bWONyqEhefwZiaxa3rEyZpYQSxZNuOZXtUet6UzCDk5boL
 V0eYtG5iN6gnHcXx/zEIcTSpGUzGMqF15gX67FodYEKZo9xbi4nf7YUAwRxCuk7Av2ut
 jT+19rkzwrPzEsmNQp+sZ1IK/BzqpAkxICzOscdlCLHBzgrLY2V8bhiymzwkktBCdNMa
 4z8bU+ehFjtmgjMpo4wAZf5KEGW6Sp8jmiC1eTCnFOj3MvClG5lP+Yuy96x4TM/BgqIH
 V9dQ==
X-Gm-Message-State: AGi0PubTOrYCEyudRxnyz16zfO4pvS1h1lPp76RdLAaVa5iO663PHTUm
 jImYLLxi3RWqEM9qodgPHzA=
X-Google-Smtp-Source: APiQypI9nP1XkKZsUEHvhJZW9uMeP8C+TQ6ugh2nhU8vtD0YNWqu5zwhDUJXVZ8F8N+ampfzRRMcBw==
X-Received: by 2002:a19:88a:: with SMTP id 132mr5107417lfi.130.1587219396489; 
 Sat, 18 Apr 2020 07:16:36 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id z23sm19102435ljh.55.2020.04.18.07.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Apr 2020 07:16:35 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-3-digetx@gmail.com>
 <20200417193018.GI5861@pendragon.ideasonboard.com>
 <0acc35fd-a74b-e726-7a16-55db13265c39@gmail.com>
 <20200417203154.GK5861@pendragon.ideasonboard.com>
 <15002e6e-de36-899f-0d28-896c67a29a49@gmail.com>
 <20200417205828.GM5861@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7978ed3b-7dcc-2219-c42d-740e3ce64189@gmail.com>
Date: Sat, 18 Apr 2020 17:16:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417205828.GM5861@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMDQuMjAyMCAyMzo1OCwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IEhpIERtaXRy
eSwKPiAKPiBPbiBGcmksIEFwciAxNywgMjAyMCBhdCAxMTo1MjoxMVBNICswMzAwLCBEbWl0cnkg
T3NpcGVua28gd3JvdGU6Cj4+IDE3LjA0LjIwMjAgMjM6MzEsIExhdXJlbnQgUGluY2hhcnQg0L/Q
uNGI0LXRgjoKPj4+IE9uIEZyaSwgQXByIDE3LCAyMDIwIGF0IDEwOjQxOjU5UE0gKzAzMDAsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+PiAxNy4wNC4yMDIwIDIyOjMwLCBMYXVyZW50IFBpbmNo
YXJ0INC/0LjRiNC10YI6Cj4+Pj4gLi4uCj4+Pj4+PiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWlj
Lmg+Cj4+Pj4+PiArI2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlLmg+Cj4+Pj4+Cj4+Pj4+IFlvdSBj
b3VsZCBhZGQgYSBmb3J3YXJkIGRlY2xhcmF0aW9uIG9mIHN0cnVjdCBkcm1fYnJpZGdlIGluc3Rl
YWQsIHRoYXQKPj4+Pj4gY2FuIGxvd2VyIHRoZSBjb21waWxhdGlvbiB0aW1lIGEgbGl0dGxlIGJp
dC4KPj4+Pgo+Pj4+IFRoaXMgaW5jbHVkZSBpcyBub3Qgb25seSBmb3IgdGhlIHN0cnVjdCwgYnV0
IGFsc28gZm9yIHRoZQo+Pj4+IGRybV9icmlkZ2VfYXR0YWNoKCkuIEl0IGxvb2tzIHRvIG1lIHRo
YXQgaXQgc2hvdWxkIGJlIG5pY2VyIHRvIGtlZXAgdGhlCj4+Pj4gaW5jbHVkZSBoZXJlLgo+Pj4K
Pj4+IGRybV9icmlkZ2VfYXR0YWNoKCkgaXMgY2FsbGVkIGZyb20gLmMgZmlsZXMuIEluIHRoZSAu
aCBmaWxlIHlvdSBjYW4gdXNlCj4+PiBhIGZvcndhcmQgZGVjbGFyYXRpb24uIEl0J3MgZW50aXJl
bHkgdXAgdG8geW91LCBidXQgYXMgYSBnZW5lcmFsIHJ1bGUsIEkKPj4+IHBlcnNvbmFsbHkgdHJ5
IHRvIHVzZSBmb3J3YXJkIHN0cnVjdHVyZSBkZWNsYXJhdGlvbnMgaW4gLmggZmlsZXMgYXMgbXVj
aAo+Pj4gYXMgcG9zc2libGUuCj4+Cj4+IFRoZSBjdXJyZW50IFRlZ3JhIERSTSBjb2RlIGlzIGEg
Yml0IGluY29uc2lzdGVudCBpbiByZWdhcmRzIHRvIGhhdmluZwo+PiBmb3J3YXJkIGRlY2xhcmF0
aW9ucywgaXQgZG9lc24ndCBoYXZlIHRoZW0gbW9yZSB0aGFuIGhhdmUuCj4+Cj4+IEknbGwgYWRk
IGEgZm9yd2FyZCBkZWNsYXJhdGlvbiBpZiB0aGVyZSB3aWxsIGJlIG5lZWQgdG8gbWFrZSBhIHY1
LCBvaz8KPiAKPiBJdCdzIHVwIHRvIHlvdSwgeW91IGRvbid0IGhhdmUgdG8gdXNlIGEgZm9yd2Fy
ZCBkZWNsYXJhdGlvbiBpZiB5b3UgZG9uJ3QKPiB3YW50IHRvLCBJIHdhcyBqdXN0IHBvaW50aW5n
IG91dCB3aGF0IEkgdGhpbmsgaXMgYSBiZXN0IHByYWN0aWNlIHJ1bGUKPiA6LSkKCkFscmlnaHQs
IHRoZW4gSSdsbCBsZWF2ZSB0aGUgaW5jbHVkZSBhcy1pcyBpbiB0aGlzIHBhdGNoIHNpbmNlIGl0
IHNob3VsZApiZSBiZXR0ZXIgdG8ga2VlcCB0aGUgY29kZSBjb25zaXN0ZW50IGV2ZW4gaWYgaXQn
cyBhIGJpdCBsZXNzIG9wdGltYWwKdGhhbiBpdCBjb3VsZCBiZSwgSU1PLgoKV2UgbWF5IHJldHVy
biB0byBjbGVhbmluZyB1cCBvZiBkcml2ZXIgaW5jbHVkZXMgbGF0ZXIgb24uCgo+Pj4+IC4uLgo+
Pj4+Pj4gKwlwb3J0ID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUob3V0cHV0LT5vZl9ub2RlLCAicG9y
dCIpOwo+Pj4+Pgo+Pj4+PiBEbyB5b3UgbmVlZCB0byBjaGVjayBmb3IgdGhlIHByZXNlbmNlIG9m
IGEgcG9ydCBub2RlIGZpcnN0ID8gQ2FuIHlvdQo+Pj4+PiBqdXN0IGNoZWNrIHRoZSByZXR1cm4g
dmFsdWUgb2YgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCksIGFuZCBmYWxsCj4+Pj4+IGJh
Y2sgdG8gIm52aWRpYSxwYW5lbCIgaWYgaXQgcmV0dXJucyAtRU5PREVWID8KPj4+Pgo+Pj4+IFdp
dGhvdXQgdGhlIGNoZWNrLCB0aGUgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCkgcHJpbnRz
IGEgdmVyeSBub2lzeQo+Pj4+IGVycm9yIG1lc3NhZ2UgYWJvdXQgbWlzc2luZyBwb3J0IG5vZGUg
Zm9yIGV2ZXJ5IG91dHB1dCB0aGF0IGRvZXNuJ3QgaGF2ZQo+Pj4+IGEgZ3JhcGggc3BlY2lmaWVk
IGluIGEgZGV2aWNlLXRyZWUgKEhETUksIERTSSBhbmQgZXRjKS4KPj4+Pgo+Pj4+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjctcmMxL3NvdXJjZS9kcml2ZXJzL29mL3Byb3Bl
cnR5LmMjTDYyMQo+Pj4KPj4+IEFoIHllcyBpbmRlZWQuIFRoYXQncyBub3QgdmVyeSBuaWNlLgo+
Pgo+PiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91J2xsIGhhdmUgYSBiZXR0ZXIgaWRlYSBhYm91
dCBob3cgdGhpcyBjb3VsZCBiZQo+PiBoYW5kbGVkLgo+IAo+IEl0IHNob3VsZCBiZSBnb29kIGVu
b3VnaCBhcy1pcyBJIHRoaW5rLiBZb3UgbWF5IGhvd2V2ZXIgd2FudCB0byBzdXBwb3J0Cj4gYm90
aCAicG9ydCIgYW5kICJwb3J0cyIsIGFzIGV2ZW4gd2hlbiB0aGVyZSdzIGEgc2luZ2xlIHBvcnQg
bm9kZSwgaXQKPiBjb3VsZCBiZSBwdXQgaW5zaWRlIGEgcG9ydHMgbm9kZS4KPiAKCkknbGwgbWFr
ZSBhIHY1IHRoYXQgd2lsbCBoYXZlIGFkZGl0aW9uYWwgcGF0Y2hlcyBmb3IgbWFraW5nCmRybV9v
Zl9maW5kX3BhbmVsX29yX2JyaWRnZSgpIHRvIGJldHRlciBoYW5kbGUgdGhhdCBjYXNlLgoKV2hp
bGUgYXQgaXQsIEknbGwgYWxzbyBhZGQgYSBwYXRjaCB0aGF0IHdpbGwgd3JhcCBSR0IgcGFuZWwg
aW50byBicmlkZ2UuCgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgcmV2aWV3cyEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
