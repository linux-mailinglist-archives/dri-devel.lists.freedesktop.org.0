Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0292DDFC4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EA089C96;
	Fri, 18 Dec 2020 08:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2AF89911
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 19:36:16 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r7so27769308wrc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 11:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6oOm24In2gplgsGMpCabJu/CznURFMD1RnI7ZTKSVZA=;
 b=EYxCU38suOXjV47ydNpqlSUba1JRYG/aaI35yaJpn1UB+BtzvlRpADO93fzVKy4t36
 GXDLRzlEn1BYLHTJGeAeqCidRcIMChrWngyKaOn4n3Lo29932Dg9omdUJcjDTAwCVkgh
 ta58l29XjSHsRigG3HpDtBAEBVaBmuzih2JNgRoFRFYXa9bEBvBJ5hZC2Srp8gPI8mVa
 uxVtLO0NA79ZScJlXdTUzkgYBE8Tqjur0dClttztc+oLkYcGroJOHdhhPsrsjuIEAO0T
 /5F6Wcrc0LxkQR8X/uEnQJlAqKc4CbCNzPl9TN1TZtQafiA6+T03sTUGb4huYEgjoWFX
 KmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6oOm24In2gplgsGMpCabJu/CznURFMD1RnI7ZTKSVZA=;
 b=btHYdr30hhQLGoW3MOM2krsALeV5+UltRPfBfBbVXosAnC6U13t8RfxjCFoFTAJ8wc
 NONH7+TP4t5/yRNlEO+OvzG76yfL5HXDuag7oJPS/6N9EmpemiR14d2dfg2rCM2KPquc
 CSU9qR63oOA/TijUio3eMdMknvV3Y0NXWTd1kNjAWUquXA+8GU2w7MpImU/uDyddBJzr
 +Mii1BybOYXjrm0ceo5IjF1AheybKyd4siYDKJra7K/EMzqijIJ5zU7uTIxvwpvQKkmI
 MzNcLqNpgm1cZKgOA2Qc6mPu3KvCvWpJz49d2F5k9I1ukxtNouVFBkCntJVTgafgv1tc
 6Svg==
X-Gm-Message-State: AOAM530TdclYO0Mc2Mf5KI+ydPaHHd+7NTAlLcX6vMj/zYLsCOkYxKM9
 sHVFVxJc2n41Ig7AWyjefGDfGw==
X-Google-Smtp-Source: ABdhPJwHDhE2wDWtfE222MozA7wYeHiNXM83hTZa8A1agC08CnIBpdJflfgPV5DnqVW7VF1brOPhmg==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr433624wrt.46.1608233775160;
 Thu, 17 Dec 2020 11:36:15 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead?
 ([2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead])
 by smtp.googlemail.com with ESMTPSA id o124sm6076543wmb.5.2020.12.17.11.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 11:36:14 -0800 (PST)
Subject: Re: [PATCH v2 47/48] ARM: tegra: ventana: Support CPU voltage scaling
 and thermal throttling
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-48-digetx@gmail.com>
 <91139f8b-0b83-dd8a-ba53-8e7a499e6344@linaro.org>
 <b39ebfc1-42b3-1fa7-efe4-6ecbc8cfcb50@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <776e0e84-e395-2bfb-f1ee-c34864b1cf16@linaro.org>
Date: Thu, 17 Dec 2020 20:36:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b39ebfc1-42b3-1fa7-efe4-6ecbc8cfcb50@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMTIvMjAyMCAyMDowMSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDE3LjEyLjIwMjAg
MjE6MjgsIERhbmllbCBMZXpjYW5vINC/0LjRiNC10YI6Cj4+IE9uIDE3LzEyLzIwMjAgMTk6MDYs
IERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IEVuYWJsZSBDUFUgdm9sdGFnZSBzY2FsaW5nIGFu
ZCB0aGVybWFsIHRocm90dGxpbmcgb24gVGVncmEyMCBWZW50YW5hIGJvYXJkLgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4+IC0tLQo+
Pj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMjAtdmVudGFuYS5kdHMgfCA0MCArKysrKysrKysr
KysrKysrKysrKysrKysrKy0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy90ZWdy
YTIwLXZlbnRhbmEuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvdGVncmEyMC12ZW50YW5hLmR0cwo+
Pj4gaW5kZXggMTRhY2UyZWY3NDljLi5jMmQ5ZjM4OTYwYmMgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy90ZWdyYTIwLXZlbnRhbmEuZHRzCj4+PiArKysgYi9hcmNoL2FybS9ib290
L2R0cy90ZWdyYTIwLXZlbnRhbmEuZHRzCj4+PiBAQCAtMiw4ICsyLDEwIEBACj4+PiAgL2R0cy12
MS87Cj4+PiAgCj4+PiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lucHV0L2lucHV0Lmg+Cj4+PiAr
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC5oPgo+Pj4gICNpbmNsdWRlICJ0
ZWdyYTIwLmR0c2kiCj4+PiAgI2luY2x1ZGUgInRlZ3JhMjAtY3B1LW9wcC5kdHNpIgo+Pj4gKyNp
bmNsdWRlICJ0ZWdyYTIwLWNwdS1vcHAtbWljcm92b2x0LmR0c2kiCj4+PiAgCj4+PiAgLyB7Cj4+
PiAgCW1vZGVsID0gIk5WSURJQSBUZWdyYTIwIFZlbnRhbmEgZXZhbHVhdGlvbiBib2FyZCI7Cj4+
PiBAQCAtNTI3LDkgKzUyOSwxMCBAQCBsZG9fcnRjIHsKPj4+ICAJCQl9Owo+Pj4gIAkJfTsKPj4+
ICAKPj4+IC0JCXRlbXBlcmF0dXJlLXNlbnNvckA0YyB7Cj4+PiArCQluY3QxMDA4OiB0ZW1wZXJh
dHVyZS1zZW5zb3JANGMgewo+Pj4gIAkJCWNvbXBhdGlibGUgPSAib25ubixuY3QxMDA4IjsKPj4+
ICAJCQlyZWcgPSA8MHg0Yz47Cj4+PiArCQkJI3RoZXJtYWwtc2Vuc29yLWNlbGxzID0gPDE+Owo+
Pj4gIAkJfTsKPj4+ICAJfTsKPj4+ICAKPj4+IEBAIC02MTUsMTAgKzYxOCwxMyBAQCBjbGszMmtf
aW46IGNsb2NrQDAgewo+Pj4gIAo+Pj4gIAljcHVzIHsKPj4+ICAJCWNwdTA6IGNwdUAwIHsKPj4+
ICsJCQljcHUtc3VwcGx5ID0gPCZ2ZGRfY3B1PjsKPj4+ICAJCQlvcGVyYXRpbmctcG9pbnRzLXYy
ID0gPCZjcHUwX29wcF90YWJsZT47Cj4+PiArCQkJI2Nvb2xpbmctY2VsbHMgPSA8Mj47Cj4+PiAg
CQl9Owo+Pj4gIAo+Pj4gIAkJY3B1QDEgewo+Pj4gKwkJCWNwdS1zdXBwbHkgPSA8JnZkZF9jcHU+
Owo+Pj4gIAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmNwdTBfb3BwX3RhYmxlPjsKPj4+ICAJ
CX07Cj4+PiAgCX07Cj4+PiBAQCAtNzE3LDQgKzcyMywzNiBAQCBzb3VuZCB7Cj4+PiAgCQkJIDwm
dGVncmFfY2FyIFRFR1JBMjBfQ0xLX0NERVYxPjsKPj4+ICAJCWNsb2NrLW5hbWVzID0gInBsbF9h
IiwgInBsbF9hX291dDAiLCAibWNsayI7Cj4+PiAgCX07Cj4+PiArCj4+PiArCXRoZXJtYWwtem9u
ZXMgewo+Pj4gKwkJY3B1LXRoZXJtYWwgewo+Pj4gKwkJCXBvbGxpbmctZGVsYXktcGFzc2l2ZSA9
IDwxMDAwPjsgLyogbWlsbGlzZWNvbmRzICovCj4+PiArCQkJcG9sbGluZy1kZWxheSA9IDw1MDAw
PjsgLyogbWlsbGlzZWNvbmRzICovCj4+PiArCj4+PiArCQkJdGhlcm1hbC1zZW5zb3JzID0gPCZu
Y3QxMDA4IDE+Owo+Pj4gKwo+Pj4gKwkJCXRyaXBzIHsKPj4+ICsJCQkJdHJpcDA6IGNwdS1hbGVy
dDAgewo+Pj4gKwkJCQkJLyogc3RhcnQgdGhyb3R0bGluZyBhdCA1MEMgKi8KPj4+ICsJCQkJCXRl
bXBlcmF0dXJlID0gPDUwMDAwPjsKPj4+ICsJCQkJCWh5c3RlcmVzaXMgPSA8MjAwPjsKPj4KPj4g
RGlkIHlvdSBtZWFuIDwyMDAwPiA/Cj4gCj4gVGhlIDwyMDA+IGlzIGNvcnJlY3QuCj4gCj4gUGxl
YXNlIHNlZSB0aGlzIGNvbW1pdCBmb3IgZXhhbXBsZToKPiAKPiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9p
ZD0yYjIyMzkzYjI3NjcwYjQ1YTJjODcwYmNlM2RmNjU3OWVmZDlhODZhCgpPaywgdGhhbmtzIGZv
ciB0aGUgcG9pbnRlci4KCj4+PiArCQkJCQl0eXBlID0gInBhc3NpdmUiOwo+Pj4gKwkJCQl9Owo+
Pj4gKwo+Pj4gKwkJCQl0cmlwMTogY3B1LWNyaXQgewo+Pj4gKwkJCQkJLyogc2h1dCBkb3duIGF0
IDYwQyAqLwo+Pj4gKwkJCQkJdGVtcGVyYXR1cmUgPSA8NjAwMDA+Owo+Pj4gKwkJCQkJaHlzdGVy
ZXNpcyA9IDwyMDAwPjsKPj4KPj4gSSB0aGluayB5b3UgY2FuIGRyb3AgdGhlIGh5c3RlcmVzaXMg
aGVyZSwgd2hlbiB0aGUgY3JpdGljYWwgdGVtcGVyYXR1cmUKPj4gaXMgcmVhY2hlZCwgdGhlcmUg
aXMgYW4gZW1lcmdlbmN5IHNodXRkb3duLgo+IAo+IFllcywgcGVyaGFwcyB5b3UncmUgcmlnaHQu
IEh5c3RlcmVzaXMgZG9lc24ndCBtYWtlIHNlbnNlIGZvciBhIGNyaXRpY2FsCj4gdHJpcC4gSSds
bCBpbXByb3ZlIGl0IGluIHRoZSBuZXh0IHJldmlzaW9uLCB0aGFua3MuCj4gCj4+IDUwwrBDIGFu
ZCA2MMKwQyBzb3VuZCB2ZXJ5IGxvdyB2YWx1ZXMsIG5vID8KPiAKPiBUZWdyYTIwIENQVSBpcyB2
ZXJ5IGNvbGQgaW4gY29tcGFyaXNvbiB0byBsYXRlciBnZW5lcmF0aW9ucywgaXQgc2hvdWxkCj4g
c3RheSB1bmRlciA1MMKwQyBldmVuIGF0IGEgZnVsbCBsb2FkLgoKSW50ZXJlc3RpbmcsIHRoYW5r
cy4KCj4+PiArCQkJCQl0eXBlID0gImNyaXRpY2FsIjsKPj4+ICsJCQkJfTsKPj4+ICsJCQl9Owo+
Pj4gKwo+Pj4gKwkJCWNvb2xpbmctbWFwcyB7Cj4+PiArCQkJCW1hcDAgewo+Pj4gKwkJCQkJdHJp
cCA9IDwmdHJpcDA+Owo+Pj4gKwkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9O
T19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsKPj4KPj4gWW91IHNob3VsZCBhZGQgYWxsIENQVXMg
aGVyZS4KPiAKPiAKPiBBbGwgQ1BVIGNvcmVzIGFyZSBjb3VwbGVkIG9uIFRlZ3JhIGluIHJlZ2Fy
ZHMgdG8gQ1BVRnJlcSwgaGVuY2UgSSB0aGluawo+IGl0IHdvbid0IG1ha2UgYW55IGRpZmZlcmVu
Y2UgaWYgc2Vjb25kYXJ5IENQVSBjb3JlcyB3aWxsIGJlIGFkZGVkIGhlcmUsCj4gaXNuJ3QgaXQ/
CgpUaGUgZXhwbGFuYXRpb24gaXMgaW4gdGhlIGRlc2NyaXB0aW9uIG9mIGNvbW1pdCBlZjQ3MzQ1
MDA0MDdjZTRkCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDov
L3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRl
ci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5h
cm8tYmxvZy8+IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
