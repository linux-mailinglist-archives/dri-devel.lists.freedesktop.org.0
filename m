Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87167265CE2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924106E9AE;
	Fri, 11 Sep 2020 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61E36E248
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 21:53:35 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n25so10163403ljj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZTz92FZRLYQUuL1AGrMY217U2x0D5xTTHk4tSTwZ26I=;
 b=P3SZ+1wII1hoifG4XlZEtd9JsxZ4/tEiGdEipNFTMxBw37+k0HJq9qm0gJWi/h2Snl
 oVjaJqZQKhl6qCxV3rLbYbdpM3zAYYJpoiw2kMRnNRVGN5O3ayGT3pvM5KUjidgguW66
 o62Sc7Fs20xtD+WRJxf03Vb5W24pdCYdWKJdR04WQH1OAFl0oQBlACGRu8ytakrn1Iv0
 ZiUMR6aPfNwE/VCt7UWamSe+LIosHJKc7wHClWT0oR3kpBvnox7jZ7bXUpyGH0UHUNen
 Wa1VtC2B3HoS8739wAzvdrcr8sU0RwzI417UYDvBy4SqJL1+UiQJU+VTvoTi8Izf6h59
 cPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZTz92FZRLYQUuL1AGrMY217U2x0D5xTTHk4tSTwZ26I=;
 b=dcEpHdSziK705ktpeuYuATs/E7eCsYoh4Be7zesXuz2XuOKHikMByghv1FwkaLsd5t
 PNfzcyv/UsNfMBW07YMi/gbU/HrcJ2x9IgmuZwDozxntQfTcNO/ZoehPj9t/6NoDtbwh
 iaglsGYGsZQlpzmT+33ELMvm+1xH2tEcws7SQcpZ02FJ2vaOKLbphe+P1ofO2dYptYDQ
 dug7vtifVkqeuBQTKYdqYiu/KEyiIiAvAcKcC4BYABYOr1W0kpz4IihX87ZDN2sluwbC
 LZKXgOPTw0EUmwI7uaDtlWskQ/QsTwl40OJaIydOumrZSLEDs7OyPiW7RAK0oJm9R++A
 GgCg==
X-Gm-Message-State: AOAM531ZDaNbf5Hch8O3aY3V/p0YABRZCg0uShe0AWbxqmZt46goeOWk
 nl+rftjee/2dTkNKe/KSSq0=
X-Google-Smtp-Source: ABdhPJzAtxOdImQW7Iwj61TpQ/70njlX6JUG7pEszRZjYGlGI0N+d8Ack9GN8s5OhVspUeQbOWzvBg==
X-Received: by 2002:a2e:90ca:: with SMTP id o10mr5756072ljg.155.1599774814213; 
 Thu, 10 Sep 2020 14:53:34 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id j127sm21998lfd.6.2020.09.10.14.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 14:53:33 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <963bb17d-9501-0118-b5c2-a06d68c3eb9f@gmail.com>
 <8fb335d3-5af9-5922-579c-e3575772732a@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ae922486-5e10-e795-54a7-565b87abfa4d@gmail.com>
Date: Fri, 11 Sep 2020 00:53:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8fb335d3-5af9-5922-579c-e3575772732a@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDkuMDkuMjAyMCAxMTo0NCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+PiBDb3Vs
ZCB5b3UgcGxlYXNlIGVudW1lcmF0ZSBhbGwgdGhlIGN1cnJlbnRseSBvcGVuZWQgcXVlc3Rpb25z
Pwo+Pgo+IAo+IFdoaWNoIG9wZW4gcXVlc3Rpb25zIGRvIHlvdSByZWZlciB0bz8KCkFueXRoaW5n
IHJlbGF0ZWQgdG8gdGhlIFVBUEkgZGVmaW5pdGlvbiB0aGF0IG5lZWRzIG1vcmUgdGhvdWdodC4g
SWYKdGhlcmUgaXMgbm90aGluZyBvdXRzdGFuZGluZywgdGhlbiBnb29kIQoKPiBUaGUgb3BlbiBp
dGVtcyBvZiB2MSBzaG91bGQgYmUKPiBjbG9zZWQgbm93OyBmb3IgZmVuY2VzIHdlIHNldHVwIGFu
IFNXIHRpbWVvdXQgdG8gcHJldmVudCB0aGVtIGZyb20KPiBzdGlja2luZyBhcm91bmQgZm9yZXZl
ciwgYW5kIHJlZ2FyZGluZyBHRU0gdGhlIEdFTSBJT0NUTHMgYXJlIGFnYWluCj4gYmVpbmcgdXNl
ZC4KPiAKCldlJ2xsIHNlZSBob3cgaXQgd2lsbCBiZSBpbiBwcmFjdGljZSEgRm9yIG5vdyBpdCdz
IGEgYml0IGRpZmZpY3VsdCB0bwpkZWNpZGUgd2hhdCBpcyBnb29kIGFuZCB3aGF0IG5lZWRzIG1v
cmUgaW1wcm92ZW1lbnQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
