Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1158D3460C4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 15:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833116E069;
	Tue, 23 Mar 2021 14:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684456E069
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:00:33 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id 15so25811321ljj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6kMwyvk3PqnCYTAEX+fT1GEBQ4EBnaqGRGP9Fon/5iY=;
 b=Jp7zFpw0wiHpMHVIU0jDDV6ArGe1naCyxm8D+4T+MhHKHZRVcQoBHU7WJ2y8blRwFw
 wzK7UTetOk8/k8fFvgCaHvLNLIkwcoPFAoTTUFGtg5+0zqbpXnNUY4yHayZypaTmxJoy
 3GvKWGUQWTU6qkxxbSydC2p+ZasR2vHAiHLg+OCy5I4qw7+e41Tay5yFlIaH99/rJVi1
 U9ZuSHeG+zPfdXeOtks38o2t73XCemxHoSF2FzY1NUHqwd3qQ9QrGn+oWJnkvxW4pZRn
 QEInmhy0H5eqLxjSlqvkbNu97YzszUPhdXmzOAWbhvlV1wBG8O9KxbbysLxTM349VR4R
 9M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6kMwyvk3PqnCYTAEX+fT1GEBQ4EBnaqGRGP9Fon/5iY=;
 b=QnbyAKnvvV2Ime1R/PIqUKvY5GtCTHMr+mF84G7bnzHHixxJRy9KjcCzfQ4ASiKRxj
 BIcxydszqDeb14BCDYSli1TwmTwZ1AGJR+e/FtwHTLPfog6Wfo9NZuWFqXfpYuINGMiw
 /swy61FNk1NaxVRrOHLRJ4gCWKeFhcYL8hV9A3lgiDT844iOlKNWXCoZCczj96sodcgP
 5aqVlKlKFlx5AoQ47x3hMsqCUom31XRfkr6hY4bh1/GpD+71gGU3hTugYEzjGyGkX4CW
 SsIZOscvBwHIu9Ce3GYgH01rwKyd6lwvzpHKyPKAioyd0Wb4IQdd3E5rdNJeofv6MO2h
 E+aQ==
X-Gm-Message-State: AOAM533rPoyrLB7OpiQDxqvX2Vfvv0vZyPI22wcwLlTBnIAmhIoMTQse
 VoqSFULul+IdEem4BzYwCXj2gcn0YFE=
X-Google-Smtp-Source: ABdhPJy7Ef0gPGVxmUmytvgXlLT6lRUG29YrcvOI+ibuQOkAtFJEuH9MFZfVY/ZOsCMtw03ynNdUjg==
X-Received: by 2002:a2e:508:: with SMTP id 8mr3269597ljf.207.1616508031506;
 Tue, 23 Mar 2021 07:00:31 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru.
 [109.252.193.60])
 by smtp.googlemail.com with ESMTPSA id b28sm1723988lfv.109.2021.03.23.07.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 07:00:30 -0700 (PDT)
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <cyndis@kapsi.fi>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
 <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
 <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
 <d76c465a-7f07-88c4-0dc3-4be3cb212fcf@kapsi.fi>
 <YFnfYsfYaKfSGhon@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0cc2ec5c-f8aa-ed45-92b6-32f9eadbdc5a@gmail.com>
Date: Tue, 23 Mar 2021 17:00:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFnfYsfYaKfSGhon@orome.fritz.box>
Content-Language: en-US
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDMuMjAyMSAxNTozMCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBUaHUsIEph
biAxNCwgMjAyMSBhdCAxMjozNDoyMlBNICswMjAwLCBNaWtrbyBQZXJ0dHVuZW4gd3JvdGU6Cj4+
IE9uIDEvMTQvMjEgMTA6MzYgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDEzLjAxLjIw
MjEgMjE6NTYsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4+IE9uIDEvMTMvMjEgODox
NCBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+PiAxMS4wMS4yMDIxIDE2OjAwLCBNaWtr
byBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4+Pj4+ICtzdHJ1Y3QgZHJtX3RlZ3JhX3N1Ym1pdF9i
dWYgewo+Pj4+Pj4gK8KgwqDCoCAvKioKPj4+Pj4+ICvCoMKgwqDCoCAqIEBtYXBwaW5nX2lkOiBb
aW5dCj4+Pj4+PiArwqDCoMKgwqAgKgo+Pj4+Pj4gK8KgwqDCoMKgICogSWRlbnRpZmllciBvZiB0
aGUgbWFwcGluZyB0byB1c2UgaW4gdGhlIHN1Ym1pc3Npb24uCj4+Pj4+PiArwqDCoMKgwqAgKi8K
Pj4+Pj4+ICvCoMKgwqAgX191MzIgbWFwcGluZ19pZDsKPj4+Pj4KPj4+Pj4gSSdtIG5vdyBpbiBw
cm9jZXNzIG9mIHRyeWluZyBvdXQgdGhlIFVBUEkgdXNpbmcgZ3JhdGUgZHJpdmVycyBhbmQgdGhp
cwo+Pj4+PiBiZWNvbWVzIHRoZSBmaXJzdCBvYnN0YWNsZS4KPj4+Pj4KPj4+Pj4gTG9va3MgbGlr
ZSB0aGlzIGlzIG5vdCBnb2luZyB0byB3b3JrIHdlbGwgZm9yIG9sZGVyIFRlZ3JhIFNvQ3MsIGlu
Cj4+Pj4+IHBhcnRpY3VsYXIgZm9yIFQyMCwgd2hpY2ggaGFzIGEgc21hbGwgR0FSVC4KPj4+Pj4K
Pj4+Pj4gR2l2ZW4gdGhhdCB0aGUgdXNlZnVsbmVzcyBvZiB0aGUgcGFydGlhbCBtYXBwaW5nIGZl
YXR1cmUgaXMgdmVyeQo+Pj4+PiBxdWVzdGlvbmFibGUgdW50aWwgaXQgd2lsbCBiZSBwcm92ZW4g
d2l0aCBhIHJlYWwgdXNlcnNwYWNlLCB3ZSBzaG91bGQKPj4+Pj4gc3RhcnQgd2l0aCBhIGR5bmFt
aWMgbWFwcGluZ3MgdGhhdCBhcmUgZG9uZSBhdCBhIHRpbWUgb2Ygam9iIHN1Ym1pc3Npb24uCj4+
Pj4+Cj4+Pj4+IERSTSBhbHJlYWR5IHNob3VsZCBoYXZlIGV2ZXJ5dGhpbmcgbmVjZXNzYXJ5IGZv
ciBjcmVhdGluZyBhbmQgbWFuYWdpbmcKPj4+Pj4gY2FjaGVzIG9mIG1hcHBpbmdzLCBncmF0ZSBr
ZXJuZWwgZHJpdmVyIGhhcyBiZWVuIHVzaW5nIGRybV9tbV9zY2FuIGZvciBhCj4+Pj4+IGxvbmcg
dGltZSBub3cgZm9yIHRoYXQuCj4+Pj4+Cj4+Pj4+IEl0IHNob3VsZCBiZSBmaW5lIHRvIHN1cHBv
cnQgdGhlIHN0YXRpYyBtYXBwaW5nIGZlYXR1cmUsIGJ1dCBpdCBzaG91bGQKPj4+Pj4gYmUgZG9u
ZSBzZXBhcmF0ZWx5IHdpdGggdGhlIGRybV9tbSBpbnRlZ3JhdGlvbiwgSU1PLgo+Pj4+Pgo+Pj4+
PiBXaGF0IGRvIHRoaW5rPwo+Pj4+Pgo+Pj4+Cj4+Pj4gQ2FuIHlvdSBlbGFib3JhdGUgb24gdGhl
IHJlcXVpcmVtZW50cyB0byBiZSBhYmxlIHRvIHVzZSBHQVJUPyBBcmUgdGhlcmUKPj4+PiBhbnkg
b3RoZXIgcmVhc29ucyB0aGlzIHdvdWxkIG5vdCB3b3JrIG9uIG9sZGVyIGNoaXBzPwo+Pj4KPj4+
IFdlIGhhdmUgYWxsIERSTSBkZXZpY2VzIGluIGEgc2luZ2xlIGFkZHJlc3Mgc3BhY2Ugb24gVDMw
KywgaGVuY2UgaGF2aW5nCj4+PiBkdXBsaWNhdGVkIG1hcHBpbmdzIGZvciBlYWNoIGRldmljZSBz
aG91bGQgYmUgYSBiaXQgd2FzdGVmdWwuCj4+Cj4+IEkgZ3Vlc3MgdGhpcyBzaG91bGQgYmUgcHJl
dHR5IGVhc3kgdG8gY2hhbmdlIHRvIG9ubHkga2VlcCBvbmUgbWFwcGluZyBwZXIKPj4gR0VNIG9i
amVjdC4KPiAKPiBUaGUgaW1wb3J0YW50IHBvaW50IGhlcmUgaXMgdGhlIHNlbWFudGljczogdGhp
cyBJT0NUTCBlc3RhYmxpc2hlcyBhCj4gbWFwcGluZyBmb3IgYSBnaXZlbiBHRU0gb2JqZWN0IG9u
IGEgZ2l2ZW4gY2hhbm5lbC4gSWYgdGhlIHVuZGVybHlpbmcKPiBpbXBsZW1lbnRhdGlvbiBpcyBz
dWNoIHRoYXQgdGhlIG1hcHBpbmcgZG9lc24ndCBmaXQgaW50byB0aGUgR0FSVCwgdGhlbgo+IHRo
YXQncyBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgdGhhdCB0aGUgZHJpdmVyIG5lZWRzIHRvIHRh
a2UgY2FyZSBvZi4KPiBTaW1pbGFybHksIGlmIG11bHRpcGxlIGRldmljZXMgc2hhcmUgYSBzaW5n
bGUgYWRkcmVzcyBzcGFjZSwgdGhhdCdzCj4gc29tZXRoaW5nIHRoZSBkcml2ZXIgYWxyZWFkeSBr
bm93cyBhbmQgY2FuIHRha2UgYWR2YW50YWdlIG9mIGJ5IHNpbXBseQo+IHJldXNpbmcgYW4gZXhp
c3RpbmcgbWFwcGluZyBpZiBvbmUgYWxyZWFkeSBleGlzdHMuIEluIGJvdGggY2FzZXMgdGhlCj4g
c2VtYW50aWNzIHdvdWxkIGJlIGNvcnJlY3RseSBpbXBsZW1lbnRlZCBhbmQgdGhhdCdzIHJlYWxs
eSBhbGwgdGhhdAo+IG1hdHRlcnMuCj4gCj4gT3ZlcmFsbCB0aGlzIGludGVyZmFjZSBzZWVtcyBz
b3VuZCBmcm9tIGEgaGlnaC1sZXZlbCBwb2ludCBvZiB2aWV3IGFuZAo+IGFsbG93cyB0aGVzZSBt
YXBwaW5ncyB0byBiZSBwcm9wZXJseSBjcmVhdGVkIGV2ZW4gZm9yIHRoZSBjYXNlcyB3ZSBoYXZl
Cj4gd2hlcmUgZWFjaCBjaGFubmVsIG1heSBoYXZlIGEgc2VwYXJhdGUgYWRkcmVzcyBzcGFjZS4g
SXQgbWF5IG5vdCBiZSB0aGUKPiBvcHRpbWFsIGludGVyZmFjZSBmb3IgYWxsIHVzZS1jYXNlcyBv
ciBhbnkgb25lIGluZGl2aWR1YWwgY2FzZSwgYnV0IHRoZQo+IHZlcnkgbmF0dXJlIG9mIHRoZXNl
IGludGVyZmFjZXMgaXMgdG8gYWJzdHJhY3QgYXdheSBjZXJ0YWluIGRpZmZlcmVuY2VzCj4gaW4g
b3JkZXIgdG8gcHJvdmlkZSBhIHVuaWZpZWQgaW50ZXJmYWNlIHRvIGEgY29tbW9uIHByb2dyYW1t
aW5nIG1vZGVsLgo+IFNvIHRoZXJlIHdpbGwgYWx3YXlzIGJlIGNlcnRhaW4gdHJhZGVvZmZzLgoK
Rm9yIG5vdyB0aGlzIElPQ1RMIGlzbid0IHVzZWZ1bCBmcm9tIGEgdXNlcnNwYWNlIHBlcnNwZWN0
aXZlIG9mIG9sZGVyClNvQ3MgYW5kIEknbGwgbmVlZCB0byBhZGQgYSBsb3Qgb2YgY29kZSB0aGF0
IHdvbid0IGRvIGFueXRoaW5nIHVzZWZ1bApqdXN0IHRvIGNvbmZvcm0gdG8gdGhlIHNwZWNpZmlj
IG5lZWRzIG9mIHRoZSBuZXdlciBTb0NzLiBUcnlpbmcgdG8gdW5pZnkKZXZlcnl0aGluZyBpbnRv
IGEgc2luZ2xlIEFQSSBkb2Vzbid0IHNvdW5kIGxpa2UgYSBnb29kIGlkZWEgYXQgdGhpcwpwb2lu
dCBhbmQgSSBhbHJlYWR5IHN1Z2dlc3RlZCB0byBNaWtrbyB0byB0cnkgb3V0IHZhcmlhbnQgd2l0
aCBhCnNlcGFyYXRlZCBwZXItU29DIGNvZGUgcGF0aHMgaW4gdGhlIG5leHQgdmVyc2lvbiwgdGhl
biB0aGUgbWFwcGluZ3MKY291bGQgYmUgaGFuZGxlZCBzZXBhcmF0ZWx5IGJ5IHRoZSBUMTg2KyBw
YXRocy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
