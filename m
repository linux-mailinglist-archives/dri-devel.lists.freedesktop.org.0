Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE1221B0BB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B79889DA8;
	Fri, 10 Jul 2020 07:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FDD6EA23
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 09:28:50 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id t9so762601lfl.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 02:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kvgnhQF49mXlO2b9f/CHzVxzk2HkPNlcy9JXirtzMBk=;
 b=JfK+FQK5KNXLnavuVpluQImLVyGEas9CrGAp0Np1jeERhtymxB1I8qpbdSEI6/g3LR
 N9eZiJUDTMRsRQVIZI9TkUh4SGso2nUIE7ZzOQ9iA2Rh3IQUYXjRb01JIMruB6oo6s0g
 6jl3eEuMee6sEQ+SYgcq/cgwJGRtcEgr1ntRRKh5I9DqJ751lblMULdaKw3dt++dDCjj
 0INUL2kLx1Ip03rjwGdAlBrSTJklOz7vmH1h0GvSm/dGqFWG6YzFdL6WbYS0P4sjoHsM
 3pi2Jh9uXPRVL0lK02D98ZeXSnPbEUlnhKZZ1ThQbDzDYiV8KseC9DFpZfgLf1F6FKxD
 NTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kvgnhQF49mXlO2b9f/CHzVxzk2HkPNlcy9JXirtzMBk=;
 b=DX/lft9QsgUzxWxmhgWsnhpIrgHe2gSFnfij8Srr78UNJmBg2SyT7I3Ezx5qGwspwY
 CGun3y+5U+2YNeURozI5bVdFbNLW0lSGCwEY0+8fC/O0qUSDX7tiTt6fXOOTy+5ubidp
 12tena+zUwIM8/WUxM+2qBOtlIpXBXb+lJ3dhV0XYDdNOxv6yvAuoMyeafr11UsQaTiw
 zoytlphMhsLtzRQwRfPXeNmsnDs9dZQEFIz+f93iA7FUXcU07inGkrdSpT+ICab70mY1
 bwUGVtoldBv3fTKBhS6EBr5guUet+auMvKkwLHxVYb1e5o/Toi0hKtLZJBp4DSBO47Nl
 FWlg==
X-Gm-Message-State: AOAM532gjofNYZqAAT1XHvsOmus2Fhle5H9ANcRrjAkXh2LIRSie90FU
 XQ3UtY0jKirebJbh4Tg4Ojc=
X-Google-Smtp-Source: ABdhPJyQ0vMUncUz8kf6pJzFVa+LJ/TSbO0ixtuJScmjaERCykGUWnx+f7KOpFJSpWctrmduF4MbOA==
X-Received: by 2002:ac2:5e29:: with SMTP id o9mr37974535lfg.196.1594286929079; 
 Thu, 09 Jul 2020 02:28:49 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru.
 [91.79.162.105])
 by smtp.googlemail.com with ESMTPSA id o9sm606559ljh.78.2020.07.09.02.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 02:28:48 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
 <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
 <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
 <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
 <f1a88006-ab3e-9068-e220-15eee17aeba0@gmail.com>
 <3b058989-a93a-6796-8d94-f60ce39e3fba@kapsi.fi>
 <2190fe9d-6381-0b5e-39d8-a04daca9a1bf@gmail.com>
 <a1d6c789-4935-110f-f4fd-db86ae0e4fef@kapsi.fi>
 <a2b1f9cf-cc0b-1a0f-d0ac-addcb1f28502@gmail.com>
 <d3a6c005-0d85-e7b9-41a2-3d86595efbc1@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7feec6b2-3d00-04ac-92d0-dcc40751f9fa@gmail.com>
Date: Thu, 9 Jul 2020 12:28:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d3a6c005-0d85-e7b9-41a2-3d86595efbc1@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Erik Faye-Lund <kusmabite@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDguMDcuMjAyMCAxMzowNiwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gNy83LzIw
IDI6MDYgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDIuMDcuMjAyMCAxNToxMCwgTWlr
a28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+PiBPaywgc28gd2Ugd291bGQgaGF2ZSB0d28ga2lu
ZHMgb2Ygc3luY3BvaW50cyBmb3IgdGhlIGpvYjsgb25lCj4+PiBmb3Iga2VybmVsIGpvYiB0cmFj
a2luZzsgYW5kIG9uZSB0aGF0IHVzZXJzcGFjZSBjYW4KPj4+IG1hbmlwdWxhdGUgYXMgaXQgd2Fu
dHMgdG8uCj4+Pgo+Pj4gQ291bGQgd2UgaGFuZGxlIHRoZSBqb2IgdHJhY2tpbmcgc3luY3BvaW50
IGNvbXBsZXRlbHkgaW5zaWRlIHRoZSBrZXJuZWwsCj4+PiBpLmUuIGFsbG9jYXRlIGl0IGluIGtl
cm5lbCBkdXJpbmcgam9iIHN1Ym1pc3Npb24sIGFuZCBhZGQgYW4gaW5jcmVtZW50Cj4+PiBmb3Ig
aXQgYXQgdGhlIGVuZCBvZiB0aGUgam9iICh3aXRoIGNvbmRpdGlvbiBPUF9ET05FKT8gRm9yIE1M
T0NLaW5nLCB0aGUKPj4+IGtlcm5lbCBhbHJlYWR5IG5lZWRzIHRvIGluc2VydCBhIFNZTkNQVF9J
TkNSKE9QX0RPTkUpICsgV0FJVCArCj4+PiBNTE9DS19SRUxFQVNFIHNlcXVlbmNlIGF0IHRoZSBl
bmQgb2YgZWFjaCBqb2IuCj4+Cj4+IElmIHN5bmMgcG9pbnQgaXMgYWxsb2NhdGVkIHdpdGhpbiBr
ZXJuZWwsIHRoZW4gd2UnbGwgbmVlZCB0byBhbHdheXMKPj4gcGF0Y2ggYWxsIGpvYidzIHN5bmMg
cG9pbnQgaW5jcmVtZW50cyB3aXRoIHRoZSBJRCBvZiB0aGUgYWxsb2NhdGVkIHN5bmMKPj4gcG9p
bnQsIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBmaXJld2FsbCBlbmFibGVkIG9yIG5vdC4KPiAKPiBU
aGUgaWRlYSB3YXMgdGhhdCB0aGUgam9iIHRyYWNraW5nIGluY3JlbWVudCB3b3VsZCBhbHNvIGJl
IGFkZGVkIHRvIHRoZQo+IHB1c2hidWZmZXIgaW4gdGhlIGtlcm5lbCwgc28gZ2F0aGVycyB3b3Vs
ZCBvbmx5IGhhdmUgaW5jcmVtZW50cyBmb3IgdGhlCj4gInVzZXIgc3luY3BvaW50cyIsIGlmIGFu
eS4gSSB0aGluayB0aGlzIHNob3VsZCB3b3JrIGZvciBUSEktYmFzZWQKPiBlbmdpbmVzIChlLmcu
IFZJQyksIHlvdSBwcm9iYWJseSBoYXZlIGJldHRlciBpbmZvcm1hdGlvbiBhYm91dAo+IEdSMkQv
R1IzRC4gT24gbmV3ZXIgVGVncmFzIHdlIGNvdWxkIHVzZSBDSEFOTkVML0FQUElEIHByb3RlY3Rp
b24gdG8KPiBwcmV2ZW50IHRoZSBnYXRoZXJzIGZyb20gaW5jcmVtZW50aW5nIHRoZXNlIGpvYiB0
cmFja2luZyBzeW5jcG9pbnRzLgoKQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IHdoYXQgaXMgVEhJ
PwoKPj4gU2Vjb25kbHksIEknbSBub3cgcmVjYWxsaW5nIHRoYXQgb25seSBvbmUgc3luYyBwb2lu
dCBjb3VsZCBiZSBhc3NpZ25lZAo+PiB0byBhIGNoYW5uZWwgYXQgYSB0aW1lIG9uIG5ld2VyIFRl
Z3JhcyB3aGljaCBzdXBwb3J0IHN5bmMgcG9pbnQKPj4gcHJvdGVjdGlvbi4gU28gaXQgc291bmRz
IGxpa2Ugd2UgZG9uJ3QgcmVhbGx5IGhhdmUgdmFyaWFudHMgb3RoZXIgdGhhbgo+PiB0byBhbGxv
Y2F0ZSBvbmUgc3luYyBwb2ludCBwZXIgY2hhbm5lbCBmb3IgdGhlIGpvYnMgdXNhZ2UgaWYgd2Ug
d2FudCB0bwo+PiBiZSBhYmxlIHRvIHB1c2ggbXVsdGlwbGUgam9icyBpbnRvIGNoYW5uZWwncyBw
dXNoYnVmZmVyLCBjb3JyZWN0Pwo+Pgo+IAo+IFRoZSBvdGhlciB3YXkgYXJvdW5kOyBlYWNoIHN5
bmNwb2ludCBjYW4gYmUgYXNzaWduZWQgdG8gb25lIGNoYW5uZWwuIE9uZQo+IGNoYW5uZWwgbWF5
IGhhdmUgbXVsdGlwbGUgc3luY3BvaW50cy4KCk9rYXkhIFNvIHdlIGFjdHVhbGx5IGNvdWxkIHVz
ZSBhIHNpbmdsZSBzeW5jIHBvaW50IHBlci1qb2IgZm9yIHVzZXIKaW5jcmVtZW50cyArIGpvYiB0
cmFja2luZywgY29ycmVjdD8KCj4+IC4uLgo+Pj4+IEhtbSwgd2UgYWN0dWFsbHkgc2hvdWxkIGJl
IGFibGUgdG8gaGF2ZSBhIG9uZSBzeW5jIHBvaW50IHBlci1jaGFubmVsCj4+Pj4gZm9yCj4+Pj4g
dGhlIGpvYiBzdWJtaXNzaW9uLCBzaW1pbGFybHkgdG8gd2hhdCB0aGUgY3VycmVudCBkcml2ZXIg
ZG9lcyEKPj4+Pgo+Pj4+IEknbSBrZWVwIGZvcmdldHRpbmcgYWJvdXQgdGhlIHdhaXRiYXNlIGV4
aXN0ZW5jZSEKPj4+Cj4+PiBUZWdyYTE5NCBkb2Vzbid0IGhhdmUgd2FpdGJhc2VzLCBidXQgaWYg
d2UgYXJlIHJlc3VibWl0dGluZyBhbGwgdGhlIGpvYnMKPj4+IGFueXdheSwgY2FuJ3Qgd2UganVz
dCByZWNhbGN1bGF0ZSB3YWl0IHRocmVzaG9sZHMgYXQgdGhhdCB0aW1lPwo+Pgo+PiBZZXMsIHRo
cmVzaG9sZHMgY291bGQgYmUgcmVjYWxjdWxhdGVkICsgam9iIHNob3VsZCBiZSByZS1mb3JtZWQg
YXQgdGhlCj4+IHB1c2gtdGltZSB0aGVuLgo+Pgo+PiBJdCBhbHNvIG1lYW5zIHRoYXQgam9icyBh
bHdheXMgc2hvdWxkIGJlIGZvcm1lZCBvbmx5IGF0IHRoZSBwdXNoLXRpbWUgaWYKPj4gd2FpdC1j
b21tYW5kIGlzIHV0aWxpemVkIGJ5IGNtZHN0cmVhbSBzaW5jZSB0aGUgd2FpdHMgYWx3YXlzIG5l
ZWQgdG8gYmUKPj4gcGF0Y2hlZCBiZWNhdXNlIHdlIHdvbid0IGtub3cgdGhlIHRocmVzaG9sZHMg
dW50aWwgc2NoZWR1bGVyIGFjdHVhbGx5Cj4+IHJ1bnMgdGhlIGpvYi4KPiAKPiBDb3VsZCB3ZSBr
ZWVwIHRoZSBqb2IgdHJhY2tpbmcgc3luY3BvaW50cyBlbnRpcmVseSB3aXRoaW4gdGhlIGtlcm5l
bCwKPiBhbmQgaGF2ZSBhbGwgd2FpdCBjb21tYW5kcyBhbmQgb3RoZXIgc3R1ZmYgdGhhdCB1c2Vy
c3BhY2UgZG9lcyB1c2UgdGhlCj4gdXNlciBzeW5jcG9pbnRzPyBUaGVuIGtlcm5lbCBqb2IgdHJh
Y2tpbmcgYW5kIHVzZXJzcGFjZSBhY3Rpdml0eSB3b3VsZAo+IGJlIHNlcGFyYXRlIGZyb20gZWFj
aCBvdGhlci4KCkkgdGhpbmsgdGhpcyBzaG91bGQgd29yaywgYnV0IGl0J3Mgbm90IGNsZWFyIHRv
IG1lIHdoYXQgYmVuZWZpdHMgdGhpcwpicmluZ3MgdG8gdXMgaWYgd2UgY291bGQgcmUtdXNlIHRo
ZSBzYW1lIHVzZXItYWxsb2NhdGVkIHN5bmMgcG9pbnQgZm9yCmJvdGggdXNlciBpbmNyZW1lbnRz
ICsga2VybmVsIGpvYiB0cmFja2luZy4KCklzIHRoZSBpZGVhIHRvIHByb3RlY3QgZnJvbSB1c2Vy
c3BhY2UgaW5jcmVtZW50aW5nIHN5bmMgcG9pbnQgdG9vIG11Y2g/CkkuZS4gam9iIGNvdWxkIGJl
IHRyZWF0ZWQgYXMgY29tcGxldGVkIGJlZm9yZSBDRE1BIGlzIGFjdHVhbGx5IGRvbmUgd2l0aApp
dC4KCj4gQWx0ZXJuYXRpdmVseSwgaWYgd2Uga25vdyB0aGF0IGpvYnMgY2FuIG9ubHkgYmUgcmVt
b3ZlZCBmcm9tIHRoZSBtaWRkbGUKPiBvZiBwdXNoYnVmZmVycywgYW5kIG5vdCBhZGRlZCwgd2Ug
Y291bGQgcmVwbGFjZSBhbnkgcmVtb3ZlZCBqb2JzIHdpdGgKPiBzeW5jcG9pbnQgaW5jcmVtZW50
cyBpbiB0aGUgcHVzaGJ1ZmZlciBhbmQgYW55IHRocmVzaG9sZHMgd291bGQgc3RheQo+IGludGFj
dC4KCkEgYml0IHVubGlrZWx5IHRoYXQgam9icyBjb3VsZCBldmVyIGJlIHJlbW92ZWQgZnJvbSB0
aGUgbWlkZGxlIG9mCmhhcmR3YXJlIHF1ZXVlIGJ5IHRoZSBEUk0gc2NoZWR1bGVyLgoKQW55d2F5
cywgaXQgc2hvdWxkIGJlIG5pY2VyIHRvIHNob290IGRvd24gZXZlcnl0aGluZyBhbmQgcmVzdGFy
dCB3aXRoIGEKY2xlYW4gc2xhdGUgd2hlbiBuZWNlc3NhcnksIGxpa2UgaXQncyBhbHJlYWR5IHN1
cHBvc2VkIHRvIGhhcHBlbiBieSB0aGUKc2NoZWR1bGVyLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
