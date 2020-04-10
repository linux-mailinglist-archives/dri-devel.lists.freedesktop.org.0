Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3531A5225
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 14:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483766E093;
	Sat, 11 Apr 2020 12:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B696B6ED38
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 18:28:25 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m8so2819354lji.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q+S9FQcm44gCkUcVdVprrI4SiEYMw4o+DCvVDXTf1yI=;
 b=SwMy/QxroluHVUM/6FKQ9+IjMym0OdlVEJKFzpjegXVVqhuLuWEfr20uoodqRoOjw6
 uq+cxx0rfMJPB6s2le8gCs8JBuibGGUBV+UL3HQzGhtDGpSXSoijrdjL9ZNPMPhHwd5R
 YdUk53GHoolSl/2lIcXaByAF/ny4tC1WEYi3ppiPSOY9+g8nVM8+4kpvTQgvHoRYwaK0
 uBrSLTeQFZw+9gp9cQAPvUIvnnBeQl4YfWTF13D2e8h0N8KzEzCuTZZEzej3/KVmfvfd
 LEBwQRNlNzYStJK76cU/05M/P32BTPi90t2JfffuZzQ5nT407MJghhQu1deDjYOYKjLc
 mZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+S9FQcm44gCkUcVdVprrI4SiEYMw4o+DCvVDXTf1yI=;
 b=uPIPsLsVPeGpXRA8hMAhuhA0ceIfSbOIcrQeE9taHt9jACAMTATB7w1wGhJ/xnbHs9
 qYzlNrfYdVyEaDggFyu27laseRL59wtuj5AKlswiQaP3qqudaK9qAtnicG9MGe96N8gr
 MekXrNWCsOoIq8Oc3pC9J0zoCPo+L7yXOjEy987j/ip1NY/oeMz4k+L0rJ1+4C9OhDUQ
 jNQwY97ufd4BjL7t/yy6NpWyTFcEgfLc3upgN1Hu0N2lsWUGX8h/Jqza14UcXDwaQbaz
 50dNC5WgMd9g8xYHVzXK4v5rTTgucGMJRN2hGtOkaaymABhjczseeb+Z+7aK8yVxw4Gh
 gobw==
X-Gm-Message-State: AGi0PuZ1kUoMOb5QX7jP0j+sq1a/L50Qe/DgHh6r9g3LEeiVCEGfm0a/
 /bKCNhzEF221PhWtzQD+MMM=
X-Google-Smtp-Source: APiQypJDMRwiWxqCQIVoO1DjqAKbxN9a3USsG+5h8JhkdiiSyqW5X2ClXQ9wa/FUBYCazlrhcZe10w==
X-Received: by 2002:a2e:904b:: with SMTP id n11mr3658147ljg.171.1586543304167; 
 Fri, 10 Apr 2020 11:28:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id u13sm1487881lji.27.2020.04.10.11.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2020 11:28:23 -0700 (PDT)
Subject: Re: [PATCH v2 05/22] dt-bindings: host1x: Document new interconnect
 properties
To: Rob Herring <robh@kernel.org>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-6-digetx@gmail.com> <20200410170929.GA1498@bogus>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <98d28983-0c50-1155-adc0-8ddbd15cc701@gmail.com>
Date: Fri, 10 Apr 2020 21:28:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200410170929.GA1498@bogus>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 11 Apr 2020 12:53:57 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTAuMDQuMjAyMCAyMDowOSwgUm9iIEhlcnJpbmcg0L/QuNGI0LXRgjoKLi4uCj4+ICsgIE9wdGlv
bmFsIHByb3BlcnRpZXM6Cj4+ICsgIC0gaW50ZXJjb25uZWN0czogTXVzdCBjb250YWluIGVudHJ5
IGZvciB0aGUgTVBFIG1lbW9yeSBjbGllbnRzLgo+PiArICAtIGludGVyY29ubmVjdC1uYW1lczog
TXVzdCBpbmNsdWRlIG5hbWUgb2YgdGhlIGludGVyY29ubmVjdCBwYXRoIGZvciBlYWNoCj4+ICsg
ICAgaW50ZXJjb25uZWN0IGVudHJ5LiBDb25zdWx0IFRSTSBkb2N1bWVudGF0aW9uIGZvciBpbmZv
cm1hdGlvbiBhYm91dAo+PiArICAgIGF2YWlsYWJsZSBtZW1vcnkgY2xpZW50cy4KPiAKPiBJcyB0
aGUgVFJNIHB1YmxpYz8gUGVyaGFwcyByZWZlciB0byB0aGUgaGVhZGVyLgoKWWVzLCB5b3UgY2Fu
IGRvd25sb2FkIGl0IGZyb20gTlZJRElBIHdlYnNpdGUgKGFmdGVyIHJlZ2lzdHJhdGlvbikuCgpJ
J2xsIGFkZCAiQ29uc3VsdCBNZW1vcnkgQ29udHJvbGxlciBzZWN0aW9uIG9mIFRSTS4uLiIgaW4g
dGhlIG5leHQgdmVyc2lvbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
