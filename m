Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35DE29CEA5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B28F6EB6B;
	Wed, 28 Oct 2020 08:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2826EB81
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:31:34 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z2so4084227lfr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jZzHJ/7NeZExgsunyfO6ZfY1UAlL8FX3D4MJN37d8Kc=;
 b=dkprteH6MJaH2lEYyvuiY+KFy1bIfXVr/+v/dDO8RFt3TYQ15nqUdlrvqtbXlnuQyU
 hk44qbAj7JL7Zj25MKFgvK6wgde3kiQ1Z0XMr2LsTIzLhk6saIQhQ+aIOQslZ0S0Fz99
 Za4L6dgwZsJcGS2ZjIuR4y7JnESEokI6oynHLfsIFpncmk6UEia54Vj3A3ry3Gw9Z/Ts
 iKvVpE/D5/o2kLVRlSseU9x7YpdSXu693y1+NJetFFM+hfg/msVOYo9hrOU6GtiJgYxL
 sjbLmbv03VCbo4NmaDEcnCjDMlbt0KkGKjVxVINaWeGfJjwUdHvTPcT1UilN+vIJvte5
 jLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jZzHJ/7NeZExgsunyfO6ZfY1UAlL8FX3D4MJN37d8Kc=;
 b=iGe9UHVlSGuAEqlmBVzyTvfhX1z3XhAy9RPxs0x+pn3hzv/0GdYz12++0go9iZ7FwD
 LQ2JjbhqeiyxTZ49Crxwnakjmaluxd1d+l1ads+JWjdOw5FOGrInr+tb/d1O5/b7RqrJ
 usx/c94MSBMV/zCViXnFjM9xvisyNegq8UdNsAURzJFBYwBPZ9YfmuArfi2fQwPyESim
 FqbmYgieXNM65NdYowAbUh1H3jTA/hrCajU6KCDIJzJqG7yt7Y76DhOgBLRILBO26x5s
 KdwQu3eWiOuB3b9/7YNWUs0Um0tZYuNj9/Jsc5uc2q+9AgP+RusT2hGJYYV+G4i2OvfJ
 vR7Q==
X-Gm-Message-State: AOAM531R8yrpySlzUaWZo/VcROY6mwXNyhNb1H5/uywaWJqn/6WE/wP/
 uXfyNy4E/bCutvc2nZ0FIKQ=
X-Google-Smtp-Source: ABdhPJzNMj0LN6XhsMz5QH8AiE+1a+5eBjRU9XoZxefttcRzYbvUWa8NQCOCaELsI3+Laoc3yuReuw==
X-Received: by 2002:a19:cc8f:: with SMTP id c137mr1496095lfg.476.1603830693398; 
 Tue, 27 Oct 2020 13:31:33 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id m26sm284461lfq.296.2020.10.27.13.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 13:31:32 -0700 (PDT)
Subject: Re: [PATCH v6 00/52] Introduce memory interconnect for NVIDIA Tegra
 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201026150845.GA87050@kozik-lap>
 <48a5cfdd-c170-f6d3-001a-2d343ecb2c5e@gmail.com>
 <20201027085253.GC4244@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <42d78289-3438-88a2-ed7a-a8a15c5ea938@gmail.com>
Date: Tue, 27 Oct 2020 23:31:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027085253.GC4244@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAxMTo1MiwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIE1v
biwgT2N0IDI2LCAyMDIwIGF0IDEwOjE0OjEwUE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gMjYuMTAuMjAyMCAxODowOCwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+
Pj4gT24gTW9uLCBPY3QgMjYsIDIwMjAgYXQgMDE6MTY6NDNBTSArMDMwMCwgRG1pdHJ5IE9zaXBl
bmtvIHdyb3RlOgo+Pj4+IEhlbGxvLAo+Pj4+Cj4+Pj4gVGhpcyBzZXJpZXMgYnJpbmdzIGluaXRp
YWwgc3VwcG9ydCBmb3IgbWVtb3J5IGludGVyY29ubmVjdCB0byBUZWdyYTIwLAo+Pj4+IFRlZ3Jh
MzAgYW5kIFRlZ3JhMTI0IFNvQ3MuCj4+Pj4KPj4+PiBGb3IgdGhlIHN0YXJ0ZXIgb25seSBkaXNw
bGF5IGNvbnRyb2xsZXJzIGFuZCBkZXZmcmVxIGRldmljZXMgYXJlIGdldHRpbmcKPj4+PiBpbnRl
cmNvbm5lY3QgQVBJIHN1cHBvcnQsIG90aGVycyBjb3VsZCBiZSBzdXBwb3J0ZWQgbGF0ZXIgb24u
IFRoZSBkaXNwbGF5Cj4+Pj4gY29udHJvbGxlcnMgaGF2ZSB0aGUgYmlnZ2VzdCBkZW1hbmQgZm9y
IGludGVyY29ubmVjdCBBUEkgcmlnaHQgbm93IGJlY2F1c2UKPj4+PiBkeW5hbWljIG1lbW9yeSBm
cmVxdWVuY3kgc2NhbGluZyBjYW4ndCBiZSBkb25lIHNhZmVseSB3aXRob3V0IHRha2luZyBpbnRv
Cj4+Pj4gYWNjb3VudCBiYW5kd2lkdGggcmVxdWlyZW1lbnQgZnJvbSB0aGUgZGlzcGxheXMuIElu
IHBhcnRpY3VsYXIgdGhpcyBzZXJpZXMKPj4+PiBmaXhlcyBkaXN0b3J0ZWQgZGlzcGxheSBvdXRw
dXQgb24gVDMwIE91eWEgYW5kIFQxMjQgVEsxIGRldmljZXMuCj4+Pgo+Pj4gSGksCj4+Pgo+Pj4g
WW91IGludHJvZHVjZWQgaW4gdjYgbXVsdGlwbGUgbmV3IHBhdGNoZXMuIENvdWxkIHlvdSBkZXNj
cmliZSB0aGUKPj4+IGRlcGVuZGVuY2llcywgaWYgYW55Pwo+Pgo+PiBIZWxsbywKPj4KPj4gVGhl
IHY2IGRyb3BwZWQgc29tZSBvbGRlciBwYXRjaGVzIGFuZCByZXBsYWNlZCB0aGVtIHdpdGggdGhl
IG5ldwo+PiBwYXRjaGVzLiBQcmV2aW91c2x5IEkgd2FudGVkIHRvIHBvc3Rwb25lIHRoZSBtb3Jl
IGNvbXBsZXggY2hhbmdlcyBmb3IKPj4gbGF0ZXIgdGltZXMsIGxpa2Ugc3VwcG9ydGluZyBPUFAg
dGFibGVzIGFuZCBEVkZTLCBidXQgdGhlbiB0aGUgcmV2aWV3Cj4+IHN0YXJ0ZWQgdG8gdGFrZSBt
b3JlIHRpbWUgdGhhbiB3YXMgZXhwZWN0ZWQgYW5kIHRoZXJlIHdhcyBlbm91Z2ggdGltZSB0bwo+
PiBjb21wbGV0ZSB0aG9zZSBmZWF0dXJlcy4KPj4KPj4gVGhlcmUgYXJlIGZpdmUgYmFzaWMgc2V0
cyBvZiBwYXRjaGVzOgo+Pgo+PiAJMS4gRFQgYmluZGluZ3MKPj4gCTIuIERUIGNoYW5nZXMKPj4g
CTMuIFNvQywgY2xrIGFuZCBtZW1vcnkKPj4gCTQuIGRldmZyZXEKPj4gCTUuIERSTQo+Pgo+PiBF
YWNoIHNldCBjb3VsZCBiZSBhcHBsaWVkIHNlcGFyYXRlbHkuCj4+Cj4+IE1lbW9yeSBwYXRjaGVz
IGhhdmUgYSBidWlsZCBkZXBlbmRlbmN5IG9uIHRoZSBTb0MgYW5kIGNsayBwYXRjaGVzLgo+Pgo+
PiBUaGUgInRlZ3JhLW1jOiBBZGQgaW50ZXJjb25uZWN0IGZyYW1ld29yayIgYW5kICJBZGQgYW5k
IHVzZQo+PiBkZXZtX3RlZ3JhX2dldF9tZW1vcnlfY29udHJvbGxlcigpIiBhcmUgdGhlIHJvb3Qg
YnVpbGQgZGVwZW5kZW5jaWVzIGZvcgo+PiBhbGwgbWVtb3J5LyBwYXRjaGVzLiBPdGhlciBwYXRj
aGVzIGFyZSBncm91cGVkIHBlciBTb0MgZ2VuZXJhdGlvbgo+PiAoVGVncmEyMC8zMC8xMjQpLCBw
YXRjaGVzIHdpdGhpbiBhIFNvQy1nZW4gZ3JvdXAgYXJlIGludGVyZGVwZW5kZW50Lgo+Pgo+PiBJ
IHN1cHBvc2UgdGhlIGJlc3QgdmFyaWFudCB3b3VsZCBiZSB0byBtZXJnZSB0aGUgd2hvbGUgc2Vy
aWVzIHZpYQo+PiB0ZWdyYS10cmVlIGluIG9yZGVyIHRvIHByZXNlcnZlIGxvZ2ljYWwgb3JkZXIg
b2YgdGhlIHBhdGNoZXMuIEFsdGhvdWdoLAo+PiBtZXJnaW5nIGVhY2ggc2V0IG9mIHBhdGNoZXMg
c2VwYXJhdGVseSBhbHNvIHNob3VsZCBiZSBva2F5IHRvIGRvLgo+IAo+IFRoYW5rcyBmb3IgZXhw
bGFuYXRpb24uIEkgYWxyZWFkeSBoYXZlIHRocmVlIHBhdGNoZXMgZm9yIFRlZ3JhIE1DIChhbmQK
PiBwcm9iYWJseSB0d28gbW9yZSB3aWxsIGJlIHJlc3B1bikgc28gdGhpcyBtaWdodCBiZSBjb25m
bGljdC1wcm9uZS4gVGhlCj4gZWFzaWVzdCBpbiBzdWNoIGNhc2UgaXMgdG8gcHJvdmlkZSBtZSBz
b2MgYW5kIGNsayBwYXRjaGVzIG9uIHRoZSBicmFuY2gsCj4gc28gSSBjb3VsZCBrZWVwIGFsbCBU
ZWdyYSBNQyB0b2dldGhlci4KCk9rYXksIGJ1dCB0aG9zZSBUMjEwIHBhdGNoZXMgZG9uJ3QgdG91
Y2ggdGhlIHNhbWUgY29kZSwgbmVpdGhlciBzYW1lCnNvdXJjZSBmaWxlcy4gRm9yIG5vdyB0aGVy
ZSBzaG91bGQgYmUgbm8gbWVyZ2UgY29uZmxpY3RzLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
