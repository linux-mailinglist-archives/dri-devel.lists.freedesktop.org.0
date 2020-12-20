Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B02DFA50
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 10:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB0A6E486;
	Mon, 21 Dec 2020 09:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9216E081
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 18:34:40 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id s26so18394175lfc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 10:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SVuAJrANiRaA9JvhqiN+Qpg12pt/XXaO5N8Q251ZVXo=;
 b=g0YfBv9Y+Z4Ov6uvvyMmMSO8QAxEodnSGt1Q/xrtSeNlNNvJ6Ei1bxSeMtyZFxaS32
 GMwB4oYAfVNQf3wXSpVheHoh3hMtvQ+WUqfdkBuyyXBmUnV+RW0pU3nTdQfpXMH29oWO
 wHrVouS3H6dIYVB0SEnAXa/QscIJsEHYk+A14ko1+NqCFxl3tbY87Q+4nt70E5RFaUit
 9Avj1QU3w1reztQzSCkIKGo4lWQXodMzg1ETMVsg3/4j1v1iFnPb/KcnypCyrHVFB7kf
 KC7pvLRBNrazpYLxKOXxLwabcFIY8JQIUecHoWVbMfurUqxJhtY3Jsr7ovlkuNPblO76
 1qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SVuAJrANiRaA9JvhqiN+Qpg12pt/XXaO5N8Q251ZVXo=;
 b=m+x83xUqn3zqsxVqwaQqQvJdrwmwPr2KTKbqo8mAHALPFP/cCRu+cehTMDACzMlOD2
 w2uTqK4YQk78IwqnlZeJQI2gLkl497JpBf05ZMlIupXs8fRUAbvRtdOoUpOd9w54IY8r
 D+3joR7cdc2ZZ9unC2wvtdgGrzOMppgkvLeNMWafurKc0uFB9E8pFQJQ73aCk0W1glSE
 vA01RjjK0sxE47G/hhm8qnN4maXgtcnP4JoiVJ0CsXy/nhRAQQoSerbi512gjSJWt6yo
 LOKINqE/WfFEvaBdRfWwt7GdwprT82TXqw4Vn0lK3+ZwJAIHkqnluPvEel1RRU7kzeqf
 5LYQ==
X-Gm-Message-State: AOAM530wOpxK8uTBxPpz48ohwHr/vG3oob3E4F8sWB1Uvvj7ik2n2SZ0
 cXPQP1hGZDd8pBVIjHTWZS8=
X-Google-Smtp-Source: ABdhPJysdwKJBGLnQ8yhCh1b1/dODKQ+0Vt3EPS6VcrkoitE53cyd/UT9rBF7QWyBhAxqnAW0Mp/1A==
X-Received: by 2002:a2e:240f:: with SMTP id k15mr5679769ljk.506.1608489278886; 
 Sun, 20 Dec 2020 10:34:38 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id z26sm1890253ljn.98.2020.12.20.10.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 10:34:38 -0800 (PST)
Subject: Re: [PATCH v2 41/48] memory: tegra20-emc: Use
 devm_tegra_core_dev_init_opp_table()
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-42-digetx@gmail.com> <20201219110216.GB5323@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea983cb9-c15a-2de2-ba14-35597bdcb2b8@gmail.com>
Date: Sun, 20 Dec 2020 21:34:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201219110216.GB5323@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 21 Dec 2020 09:36:19 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTkuMTIuMjAyMCAxNDowMiwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIFRo
dSwgRGVjIDE3LCAyMDIwIGF0IDA5OjA2OjMxUE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gVXNlIGNvbW1vbiBkZXZtX3RlZ3JhX2NvcmVfZGV2X2luaXRfb3BwX3RhYmxlKCkgaGVs
cGVyIGZvciB0aGUgT1BQIHRhYmxlCj4+IGluaXRpYWxpemF0aW9uLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVy
cy9tZW1vcnkvdGVncmEvdGVncmEyMC1lbWMuYyB8IDU3ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25z
KC0pCj4gCj4gSWYgdGhlcmUgd2FzIG5vIG1vcmUgVGVncmEgTUMgd29yayBwbGFubmVkLCB0aGlz
IGNvdWxkIGVhc2lseSBnbyB2aWEKPiBUZWdyYSBTb0MgdHJlZS4gSG93ZXZlciBJIGV4cGVjdCBz
dGlsbCB3b3JrIG9mIHlvdXIgaW50ZXJjb25uZWN0Cj4gcGF0Y2hlcywgc28gbWF5YmUgaXQncyBi
ZXR0ZXIgdG8gc3RpY2sgdGhlc2UgaW4gc2FtZSB0cmVlLgoKSSdsbCByZS1zZW5kIHRoZSByZW1h
aW5pbmcgaW50ZXJjb25uZWN0IHBhdGNoZXMgc29vbi4KCj4gSW4gc3VjaCBjYXNlIEkgd291bGQg
bmVlZCBhIHN0YWJsZSB0YWcgd2l0aCB0aGUKPiBkZXZtX3RlZ3JhX2NvcmVfZGV2X2luaXRfb3Bw
X3RhYmxlKCkgaGVscGVyIGZvciBtZW1vcnkgY29udHJvbGxlciB0cmVlLgoKUGVyaGFwcyB3aWxs
IGJlIGJldHRlciB0byBkcm9wIHRoZXNlIG1lbW9yeSBjaGFuZ2VzIGZvciBub3cgZnJvbSB0aGlz
CnNlcmllcyBzaW5jZSB0aGV5IGFyZSBvcHRpb25hbCwgaS5lLiBtZW1vcnkgZHJpdmVycyB3aWxs
IHdvcmsgcHJvcGVybHkKYmVjYXVzZSB2b2x0YWdlIGNoYW5nZXMgYXJlIGRvbmUgYnkgdGhlIE9Q
UCBjb3JlIGFuZCB0aGVzZSBwYXRjaGVzIGp1c3QKcmVwbGFjZSB0aGUgZHVwbGljYXRlZCBjb2Rl
IHdpdGggYSBuZXcgY29tbW9uIGhlbHBlciB3aGljaCBkb2Vzbid0IGFkZApuZXcgZmVhdHVyZXMg
dG8gdGhlIG1lbW9yeSBkcml2ZXJzLiBJdCBzaG91bGQgYmUgZmluZSB0byBnZXQgYmFjayB0bwp0
aGVzZSBtZW1vcnkgcGF0Y2hlcyBvbmNlIGludGVyY29ubmVjdCBwYXRjaHNldCB3aWxsIGJlIGZ1
bGx5IG1lcmdlZC4KSSdsbCB0YWtlIGl0IGludG8gYWNjb3VudCBpbiB2MywgdGhhbmtzLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
