Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5CF33F74D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 18:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADDA6E83D;
	Wed, 17 Mar 2021 17:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D676E83D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 17:44:18 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 184so4220917ljf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 10:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mSBxrt8q9DwvAyZBfywSCWXzmfoomEQKl5omuxCNzII=;
 b=Idr/9rQLPqul7i01/KOaoymxiOPXrsLsOEqDPuJlyYc69QQ0ilUZ/lTwIRF2RruyW7
 cjzQMlgAlGYFMbj+Ph1Miujbudm8NavramFluaxtMEeGhXhRLaHlcyfHKkwv4SYsJJtI
 rF460YQL76wItNdfmvRSQRNdaFQNlOfea0HS3OvY3SWyDSM9R6pfZk1JRGFn3CODDelv
 D4t/Zm3j77R/3T9x9aQyBrH4ojRtrEHYGknz4xxPBmwlRBXIR3q+MdokSnhqmJ7DetOX
 ytHJAav4qxCbQaOQynFcx0BHD/7Jhl+U1XAhKuKt9olpFKCGkFf23Y//hSJGI1LciqB5
 Dpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mSBxrt8q9DwvAyZBfywSCWXzmfoomEQKl5omuxCNzII=;
 b=bXkVrecX8TSnSXjXbQZpSHC70NHLSdq3eIxs8+TUaezuwJtwa3q5c22wu1CHBf/X+o
 LdcDKoO5n+E8XQWj7i9/OMfW4YAEU9AT7oOGe3PSScwBCaA6XYuJVd91rhmUYXmFBVJq
 jYR3yFi+VkcPYvMOPRJkfC5RxNevXF8P1YE7YvUHIhXMQaBjDQd3hfCmGIldFqy2CBBB
 eoD71xzwWYAQqARhU2ZMwZPpu3U9zsiu+E4G6/2TSLA2K7bYuZXP77/l6ey0a9Im7OTc
 uDUGqKVHrxCazTRozG5Luulg11PgyXdcI921r62ltKQyj6A6irekTxiJL4nIo9eVehLN
 ptGg==
X-Gm-Message-State: AOAM533DubeidfCRglLurt+MFqFJRgF+rSKe7qzaGbNtE/pFoGVaefIV
 VNdbO20L8hjdKGzSNRS0uihKHqcwRQ0=
X-Google-Smtp-Source: ABdhPJyFL0v6HaUzAfe1jE2ZqT9UQc02bio2NiVOkXwzCpQ/IQUCZdf2mELXuzdVML9HSEFCkVdvJg==
X-Received: by 2002:a2e:557:: with SMTP id 84mr3075252ljf.480.1616003056785;
 Wed, 17 Mar 2021 10:44:16 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id f25sm3448156lfh.226.2021.03.17.10.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 10:44:16 -0700 (PDT)
Subject: Re: [PATCH v15 2/2] drm/tegra: dc: Extend debug stats with total
 number of events
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20210311172255.25213-1-digetx@gmail.com>
 <20210311172255.25213-3-digetx@gmail.com>
 <20210314221130.GB2733@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c68ea34c-6b9f-61ce-a58a-8def27a1127a@gmail.com>
Date: Wed, 17 Mar 2021 20:44:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210314221130.GB2733@qmqm.qmqm.pl>
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTUuMDMuMjAyMSAwMToxMSwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBUaHUs
IE1hciAxMSwgMjAyMSBhdCAwODoyMjo1NVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+IEl0J3MgdXNlZnVsIHRvIGtub3cgdGhlIHRvdGFsIG51bWJlciBvZiB1bmRlcmZsb3cgZXZl
bnRzIGFuZCBjdXJyZW50bHkKPj4gdGhlIGRlYnVnIHN0YXRzIGFyZSBnZXR0aW5nIHJlc2V0IGVh
Y2ggdGltZSBDUlRDIGlzIGJlaW5nIGRpc2FibGVkLiBMZXQncwo+PiBhY2NvdW50IHRoZSBvdmVy
YWxsIG51bWJlciBvZiBldmVudHMgdGhhdCBkb2Vzbid0IGdldCBhIHJlc2V0Lgo+IFsuLi5dCj4g
Cj4gTG9va3MgZ29vZC4gSXQgc2VlbXMgaW5kZXBlbmRlbnQgZnJvbSB0aGUgb3RoZXIgcGF0Y2gu
Cj4gCj4gUmV2aWV3ZWQtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4QHJlcmUucW1x
bS5wbD4KPiAKClRoaXMgcGF0Y2ggd2FzIGNyZWF0ZWQgaW4gb3JkZXIgdG8gaGVscCB3aXRoIGRl
YnVnZ2luZyBvZiB0aGUgYmFuZHdpZHRoCm1hbmFnZW1lbnQsIGJ1dCB0ZWNobmljYWxseSBpdCdz
IGluZGVwZW5kZW50LiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
