Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FE9D07F3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49F16E8F6;
	Wed,  9 Oct 2019 07:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837DD6E78E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 10:02:11 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f5so16856499ljg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 03:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GqzTqyowvPAvUQbXgGnvR7I0v85sKzoqVofmPdE4wrQ=;
 b=U76YhoSfgnV8kG59jrT296F8OXcEfS8UhNW+mrXG0/iUuODPJ04Rcdo+/HnxsmKlog
 kcQAZd7l/sj8AwCkDAkLmUR+pB3IXRAvIdu6vVLViFjZuSI2ASL1Smzf2FFNAfopxww6
 Rknc6zZ7HthPWQwaAVGxbC6eWVwdy2u3Dtxa9HoIk5ZBiif6eBYj4S3qG9y235O9V4K8
 SDuCKk0wIHCcxarfQaXKOLHaOfsctBd61Qm4Pl4l8O1goCqMh9IhwQ6uzzbHGQW9637Z
 5Kni8mXZLvMt0M1amcTmLbSePQ2QhEGsnK9izEy12+TX2DiZmXWRtvP7bctFWpZeQlh8
 2aJw==
X-Gm-Message-State: APjAAAVehmtlgmnAJQsUrU1oYGqfjIurw8A/P0oAljOh6TI+huUM5Cul
 KwGHcyT4u6Rs54ghTcDZNj3R1A==
X-Google-Smtp-Source: APXvYqwvUV0ApYMZHzivst3YYWRXTTQ6OC4spgiYQAFuQFqWZDioKWemwjZ7KV+AIcEc9czHUR3KkQ==
X-Received: by 2002:a2e:7c17:: with SMTP id x23mr15734325ljc.210.1570528929703; 
 Tue, 08 Oct 2019 03:02:09 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id f21sm4366420lfm.90.2019.10.08.03.02.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 03:02:09 -0700 (PDT)
Subject: Re: [PATCH 3/5] backlight: pwm_bl: drop use of int_pow()
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
 <20190919140620.32407-3-linux@rasmusvillemoes.dk>
 <20191007152800.3nhbf7h7knumriz4@holly.lan>
 <5f19e307-29c4-f077-568d-b2bd6ae74608@rasmusvillemoes.dk>
 <20191008093145.kgx6ytkbycmmkist@holly.lan>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <9bf6baf9-46be-771c-7e26-527b117c998a@rasmusvillemoes.dk>
Date: Tue, 8 Oct 2019 12:02:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008093145.kgx6ytkbycmmkist@holly.lan>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GqzTqyowvPAvUQbXgGnvR7I0v85sKzoqVofmPdE4wrQ=;
 b=Wq+k9y3cqefVkZ1tL1Y6xqcaD3CqIz8/tHswdPC7vEhgEGm1vMawqMRWqG0DJywGT4
 8fmOpR2baz2OYprCPC1aEY2/tk0YjGKyKnNmrKJqXnyYPhOuLyW9yuN/Nl6uxfwS4oBi
 k7PN8yNJCpnN5dt7uymncpWz1kmBiGAfGidf4=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMTAvMjAxOSAxMS4zMSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IE9uIE1vbiwgT2N0
IDA3LCAyMDE5IGF0IDA4OjQzOjMxUE0gKzAyMDAsIFJhc211cyBWaWxsZW1vZXMgd3JvdGU6Cj4+
IE9uIDA3LzEwLzIwMTkgMTcuMjgsIERhbmllbCBUaG9tcHNvbiB3cm90ZToKPj4+IE9uIFRodSwg
U2VwIDE5LCAyMDE5IGF0IDA0OjA2OjE4UE0gKzAyMDAsIFJhc211cyBWaWxsZW1vZXMgd3JvdGU6
Cj4+Pgo+Pj4gSXQgZmVlbHMgbGlrZSB0aGVyZSBpcyBzb21lIHJhdGlvbmFsZSBtaXNzaW5nIGlu
IHRoZSBkZXNjcmlwdGlvbiBoZXJlLgo+Pj4KPj4KPj4gQXBhcnQgZnJvbSB0aGUgZnVuY3Rpb24g
Y2FsbCBvdmVyaGVhZCAoYW5kIHJlc3VsdGluZyByZWdpc3RlciBwcmVzc3VyZQo+PiBldGMuKSwg
dXNpbmcgaW50X3BvdyBpcyBsZXNzIGVmZmljaWVudCAoZm9yIGFuIGV4cG9uZW50IG9mIDMsIGl0
IGVuZHMgdXAKPj4gZG9pbmcgZm91ciA2NHg2NCBtdWx0aXBsaWNhdGlvbnMgaW5zdGVhZCBvZiBq
dXN0IHR3bykuIEJ1dCBmZWVsIGZyZWUgdG8KPj4gZHJvcCBpdCwgSSdtIG5vdCBnb2luZyB0byBw
dXJzdWUgaXQgZnVydGhlciAtIGl0IGp1c3Qgc2VlbWVkIGxpa2UgYQo+PiBzZW5zaWJsZSB0aGlu
ZyB0byBkbyB3aGlsZSBJIHdhcyBvcHRpbWl6aW5nIHRoZSBjb2RlIGFueXdheS4KPj4KPj4gW0F0
IHRoZSB0aW1lIEkgd3JvdGUgdGhlIHBhdGNoLCB0aGlzIHdhcyBhbHNvIHRoZSBvbmx5IHVzZXIg
b2YgaW50X3Bvdwo+PiBpbiB0aGUgdHJlZSwgc28gaXQgYWxzbyBhbGxvd2VkIHJlbW92aW5nIGlu
dF9wb3cgYWx0b2dldGhlci5dCj4gCj4gVG8gYmUgaG9uZXN0IHRoZSBjaGFuZ2UgaXMgZmluZSBi
dXQgdGhlIHBhdGNoIGRlc2NyaXB0aW9uIGRvZXNuJ3QgbWFrZQo+IHNlbnNlIGlmIHRoZSBvbmx5
IGN1cnJlbnQgcHVycG9zZSBvZiB0aGUgcGF0Y2ggaXMgYXMgYSBvcHRpbWl6YXRpb24uCgpBZ3Jl
ZWQuIERvIHlvdSB3YW50IG1lIHRvIHJlc2VuZCB0aGUgc2VyaWVzIHdpdGggcGF0Y2ggMyB1cGRh
dGVkIHRvIHJlYWQKCiJGb3IgYSBmaXhlZCBzbWFsbCBleHBvbmVudCBvZiAzLCBpdCBpcyBtb3Jl
IGVmZmljaWVudCB0byBzaW1wbHkgdXNlIHR3bwpleHBsaWNpdCBtdWx0aXBsaWNhdGlvbnMgcmF0
aGVyIHRoYW4gY2FsbGluZyB0aGUgaW50X3BvdygpIGxpYnJhcnkKZnVuY3Rpb246IEFzaWRlIGZy
b20gdGhlIGZ1bmN0aW9uIGNhbGwgb3ZlcmhlYWQsIGl0cyBpbXBsZW1lbnRhdGlvbgp1c2luZyBy
ZXBlYXRlZCBzcXVhcmluZyBtZWFucyBpdCBlbmRzIHVwIGRvaW5nIGZvdXIgNjR4NjQgbXVsdGlw
bGljYXRpb25zLiIKCihhbmQgb2J2aW91c2x5IHBhdGNoIDUgZHJvcHBlZCk/CgpSYXNtdXMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
