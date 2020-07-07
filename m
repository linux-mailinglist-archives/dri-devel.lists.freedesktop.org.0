Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E7218078
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99C46E87B;
	Wed,  8 Jul 2020 07:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D770189CD9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 11:06:49 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y18so24456468lfh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 04:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xFoSuxpGFGrT7m2qOPFkoZEgsAUN6G+H/xhCcVxI1GI=;
 b=tPXUfONFx1O3VJ1NqbRPNLxYLmmiOfz3bKJV8rmbcK2mLYUAcIZvdY59jVPDEqHlLe
 O5wr5E3XOVtvBCcNIsO3OA7RFYBa8kacVjzlSHV4SBtLcKxZsl/j2cscr6odn3tRxzvC
 yHUvR0mEr19z00ffT6g7hYQ2rxcGLmZCvkXshQM8HyrKw2fbFQve8Lr8Dw2vn8yqK928
 1oYJ/NkXHJpp5hGuaWg0x+qhaynJwmogRYRlAR+wT5wBByAFAppWB5kIlMrj1tFlaGCl
 2wmkzV1Gwdqz8njpF6svRaIL+liQZEhJqfAQhBUnFSBQ1S8MhxEZ4LI+cS7wEWsLIZRP
 qlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xFoSuxpGFGrT7m2qOPFkoZEgsAUN6G+H/xhCcVxI1GI=;
 b=nEI8SapJTS7ZOzg4SzFsQU6GqL+jmwjOvLFgyjdEM6MyiMxkLPU1naySGXHSb5vrwT
 +/3tFaYIbh8/WFZXSXBYPEpvQxDmXLO6Iuhgd1wTxnjjitH3drtouqOV0RjwF3IADzmH
 K93Z2Uj+nLrAjxqrJH1pxIKWLzDF0zhasTfNZZ1QPrB+3c9jU+GwdcCkDrwc5yiDGLiU
 a1j5CEHDfjzwUnrRWQ1+gR2iq1yETy+Kz6sZzn2ZitwYolScTfxCc2+eK4ogkFVI4C0R
 cHzSPISC0yF3TbnVzfmbsxXs7qSLu+7dqwNGGoa4jYIMXPw1+yUF0jHBFzhSBPH20WVW
 YKdQ==
X-Gm-Message-State: AOAM5335JIq8mkXtJhWmOUcMJcr6GGAk5CqGvFo39l2mk0rbvwuFTN1t
 LUu4NdJJ3ZogY2tovSN3uAQ=
X-Google-Smtp-Source: ABdhPJwgBagUDLrWSy6j9636Y8+jdO+3yOL5MaUakEqcNPHNwWgZLIOIvNYPEWcSjbQeHhfpH0fl6Q==
X-Received: by 2002:a19:50b:: with SMTP id 11mr18496347lff.154.1594120008224; 
 Tue, 07 Jul 2020 04:06:48 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru.
 [91.79.162.105])
 by smtp.googlemail.com with ESMTPSA id s12sm87168ljd.116.2020.07.07.04.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 04:06:46 -0700 (PDT)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a2b1f9cf-cc0b-1a0f-d0ac-addcb1f28502@gmail.com>
Date: Tue, 7 Jul 2020 14:06:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a1d6c789-4935-110f-f4fd-db86ae0e4fef@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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

MDIuMDcuMjAyMCAxNToxMCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT2ssIHNvIHdl
IHdvdWxkIGhhdmUgdHdvIGtpbmRzIG9mIHN5bmNwb2ludHMgZm9yIHRoZSBqb2I7IG9uZQo+IGZv
ciBrZXJuZWwgam9iIHRyYWNraW5nOyBhbmQgb25lIHRoYXQgdXNlcnNwYWNlIGNhbgo+IG1hbmlw
dWxhdGUgYXMgaXQgd2FudHMgdG8uCj4gCj4gQ291bGQgd2UgaGFuZGxlIHRoZSBqb2IgdHJhY2tp
bmcgc3luY3BvaW50IGNvbXBsZXRlbHkgaW5zaWRlIHRoZSBrZXJuZWwsCj4gaS5lLiBhbGxvY2F0
ZSBpdCBpbiBrZXJuZWwgZHVyaW5nIGpvYiBzdWJtaXNzaW9uLCBhbmQgYWRkIGFuIGluY3JlbWVu
dAo+IGZvciBpdCBhdCB0aGUgZW5kIG9mIHRoZSBqb2IgKHdpdGggY29uZGl0aW9uIE9QX0RPTkUp
PyBGb3IgTUxPQ0tpbmcsIHRoZQo+IGtlcm5lbCBhbHJlYWR5IG5lZWRzIHRvIGluc2VydCBhIFNZ
TkNQVF9JTkNSKE9QX0RPTkUpICsgV0FJVCArCj4gTUxPQ0tfUkVMRUFTRSBzZXF1ZW5jZSBhdCB0
aGUgZW5kIG9mIGVhY2ggam9iLgoKSWYgc3luYyBwb2ludCBpcyBhbGxvY2F0ZWQgd2l0aGluIGtl
cm5lbCwgdGhlbiB3ZSdsbCBuZWVkIHRvIGFsd2F5cwpwYXRjaCBhbGwgam9iJ3Mgc3luYyBwb2lu
dCBpbmNyZW1lbnRzIHdpdGggdGhlIElEIG9mIHRoZSBhbGxvY2F0ZWQgc3luYwpwb2ludCwgcmVn
YXJkbGVzcyBvZiB3aGV0aGVyIGZpcmV3YWxsIGVuYWJsZWQgb3Igbm90LgoKU2Vjb25kbHksIEkn
bSBub3cgcmVjYWxsaW5nIHRoYXQgb25seSBvbmUgc3luYyBwb2ludCBjb3VsZCBiZSBhc3NpZ25l
ZAp0byBhIGNoYW5uZWwgYXQgYSB0aW1lIG9uIG5ld2VyIFRlZ3JhcyB3aGljaCBzdXBwb3J0IHN5
bmMgcG9pbnQKcHJvdGVjdGlvbi4gU28gaXQgc291bmRzIGxpa2Ugd2UgZG9uJ3QgcmVhbGx5IGhh
dmUgdmFyaWFudHMgb3RoZXIgdGhhbgp0byBhbGxvY2F0ZSBvbmUgc3luYyBwb2ludCBwZXIgY2hh
bm5lbCBmb3IgdGhlIGpvYnMgdXNhZ2UgaWYgd2Ugd2FudCB0bwpiZSBhYmxlIHRvIHB1c2ggbXVs
dGlwbGUgam9icyBpbnRvIGNoYW5uZWwncyBwdXNoYnVmZmVyLCBjb3JyZWN0PwoKLi4uCj4+IEht
bSwgd2UgYWN0dWFsbHkgc2hvdWxkIGJlIGFibGUgdG8gaGF2ZSBhIG9uZSBzeW5jIHBvaW50IHBl
ci1jaGFubmVsIGZvcgo+PiB0aGUgam9iIHN1Ym1pc3Npb24sIHNpbWlsYXJseSB0byB3aGF0IHRo
ZSBjdXJyZW50IGRyaXZlciBkb2VzIQo+Pgo+PiBJJ20ga2VlcCBmb3JnZXR0aW5nIGFib3V0IHRo
ZSB3YWl0YmFzZSBleGlzdGVuY2UhCj4gCj4gVGVncmExOTQgZG9lc24ndCBoYXZlIHdhaXRiYXNl
cywgYnV0IGlmIHdlIGFyZSByZXN1Ym1pdHRpbmcgYWxsIHRoZSBqb2JzCj4gYW55d2F5LCBjYW4n
dCB3ZSBqdXN0IHJlY2FsY3VsYXRlIHdhaXQgdGhyZXNob2xkcyBhdCB0aGF0IHRpbWU/CgpZZXMs
IHRocmVzaG9sZHMgY291bGQgYmUgcmVjYWxjdWxhdGVkICsgam9iIHNob3VsZCBiZSByZS1mb3Jt
ZWQgYXQgdGhlCnB1c2gtdGltZSB0aGVuLgoKSXQgYWxzbyBtZWFucyB0aGF0IGpvYnMgYWx3YXlz
IHNob3VsZCBiZSBmb3JtZWQgb25seSBhdCB0aGUgcHVzaC10aW1lIGlmCndhaXQtY29tbWFuZCBp
cyB1dGlsaXplZCBieSBjbWRzdHJlYW0gc2luY2UgdGhlIHdhaXRzIGFsd2F5cyBuZWVkIHRvIGJl
CnBhdGNoZWQgYmVjYXVzZSB3ZSB3b24ndCBrbm93IHRoZSB0aHJlc2hvbGRzIHVudGlsIHNjaGVk
dWxlciBhY3R1YWxseQpydW5zIHRoZSBqb2IuCgo+IE1heWJlIGEgbW9yZSBkZXRhaWxlZCBzZXF1
ZW5jZSBsaXN0IG9yIGRpYWdyYW0gb2Ygd2hhdCBoYXBwZW5zIGR1cmluZwo+IHN1Ym1pc3Npb24g
YW5kIHJlY292ZXJ5IHdvdWxkIGJlIHVzZWZ1bC4KClRoZSB0ZXh0dWFsIGZvcm0gKyBjb2RlIGlz
IGFscmVhZHkgZ29vZCBlbm91Z2ggdG8gbWUuIEEgZGlhZ3JhbSBjb3VsZCBiZQpuaWNlIHRvIGhh
dmUsIGFsdGhvdWdoIGl0IG1heSB0YWtlIGEgYml0IHRvbyBtdWNoIGVmZm9ydCB0byBjcmVhdGUg
KwptYWludGFpbiBpdC4gQnV0IEkgZG9uJ3QgbWluZCBhdCBhbGwgaWYgeW91J2Qgd2FudCB0byBt
YWtlIG9uZSA6KQoKLi4uCj4+PiAqIFdlIHNob3VsZCBiZSBhYmxlIHRvIGtlZXAgdGhlIHN5bmNw
b2ludCByZWZjb3VudGluZyBiYXNlZCBvbiBmZW5jZXMuCj4+Cj4+IFRoZSBmZW5jZSBkb2Vzbid0
IG5lZWQgdGhlIHN5bmMgcG9pbnQgaXRzZWxmLCBpdCBvbmx5IG5lZWRzIHRvIGdldCBhCj4+IHNp
Z25hbCB3aGVuIHRoZSB0aHJlc2hvbGQgaXMgcmVhY2hlZCBvciB3aGVuIHN5bmMgcG9pbnQgaXMg
Y2Vhc2VkLgo+Pgo+PiBJbWFnaW5lOgo+Pgo+PiDCoMKgIC0gUHJvY2VzcyBBIGNyZWF0ZXMgc3lu
YyBwb2ludAo+PiDCoMKgIC0gUHJvY2VzcyBBIGNyZWF0ZXMgZG1hLWZlbmNlIGZyb20gdGhpcyBz
eW5jIHBvaW50Cj4+IMKgwqAgLSBQcm9jZXNzIEEgZXhwb3J0cyBkbWEtZmVuY2UgdG8gcHJvY2Vz
cyBCCj4+IMKgwqAgLSBQcm9jZXNzIEEgZGllcwo+Pgo+PiBXaGF0IHNob3VsZCBoYXBwZW4gdG8g
cHJvY2VzcyBCPwo+Pgo+PiDCoMKgIC0gU2hvdWxkIGRtYS1mZW5jZSBvZiB0aGUgcHJvY2VzcyBC
IGdldCBhIGVycm9yIHNpZ25hbCB3aGVuIHByb2Nlc3MgQQo+PiBkaWVzPwo+PiDCoMKgIC0gU2hv
dWxkIHByb2Nlc3MgQiBnZXQgc3R1Y2sgd2FpdGluZyBlbmRsZXNzbHkgZm9yIHRoZSBkbWEtZmVu
Y2U/Cj4+Cj4+IFRoaXMgaXMgb25lIGV4YW1wbGUgb2Ygd2h5IEknbSBwcm9wb3NpbmcgdGhhdCBm
ZW5jZSBzaG91bGRuJ3QgYmUgY291cGxlZAo+PiB0aWdodGx5IHRvIGEgc3luYyBwb2ludC4KPiAK
PiBBcyBhIGJhc2VsaW5lLCB3ZSBzaG91bGQgY29uc2lkZXIgcHJvY2VzcyBCIHRvIGdldCBzdHVj
ayBlbmRsZXNzbHkKPiAodW50aWwgYSB0aW1lb3V0IG9mIGl0cyBjaG9vc2luZykgZm9yIHRoZSBm
ZW5jZS4gSW4gdGhpcyBjYXNlIGl0IGlzCj4gYXZvaWRhYmxlLCBidXQgaWYgdGhlIElEL3RocmVz
aG9sZCBwYWlyIGlzIGV4cG9ydGVkIG91dCBvZiB0aGUgZmVuY2UgYW5kCj4gaXMgd2FpdGVkIGZv
ciBvdGhlcndpc2UsIGl0IGlzIHVuYXZvaWRhYmxlLiBJLmUuIG9uY2UgdGhlIElEL3RocmVzaG9s
ZAo+IGFyZSBleHBvcnRlZCBvdXQgb2YgYSBmZW5jZSwgdGhlIHdhaXRlciBjYW4gb25seSBzZWUg
dGhlIGZlbmNlIGJlaW5nCj4gc2lnbmFsZWQgYnkgdGhlIHRocmVzaG9sZCBiZWluZyByZWFjaGVk
LCBub3QgYnkgdGhlIHN5bmNwb2ludCBnZXR0aW5nCj4gZnJlZWQuCgpUaGlzIGlzIGNvcnJlY3Qu
IElmIHN5bmMgcG9pbnQncyBGRCBpcyBleHBvcnRlZCBvciBvbmNlIHN5bmMgcG9pbnQgaXMKcmVz
b2x2ZWQgZnJvbSBhIGRtYS1mZW5jZSwgdGhlbiBzeW5jIHBvaW50IHdpbGwgc3RheSBhbGl2ZSB1
bnRpbCB0aGUKbGFzdCByZWZlcmVuY2UgdG8gdGhlIHN5bmMgcG9pbnQgaXMgZHJvcHBlZC4gSS5l
LiBpZiBQcm9jZXNzIEEgZGllcwoqYWZ0ZXIqIHByb2Nlc3MgQiBzdGFydGVkIHRvIHdhaXQgb24g
dGhlIHN5bmMgcG9pbnQsIHRoZW4gaXQgd2lsbCBnZXQgc3R1Y2suCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
