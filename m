Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895DB341BF2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 13:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145846E9F6;
	Fri, 19 Mar 2021 12:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4A86E9F6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 12:06:10 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id q13so9601148lfu.8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 05:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8PEaxRIKLygOaEgMkzuJi7I5huOwDoYdniqBjKsADXw=;
 b=bAaniC1QAdS0rbs4tvED05sYJsdTCyqw3JPy/26JQGezuO0VYTGWavJoyODQhEIi6t
 OOq0iQqcBZpaadfXKAOTmzphaMCEA/ebfp5Aw0YBSGI09EUOdIcg6a2gEWWtKuCeW+fo
 T33wDpuy2QK2Jyxo69Kg2gg75nlZiV1ikqEWyixuOvxLJnRfsTVg3SZYq6cFxK8UTo9A
 iOVGRSEnKhmLTDuN1WGQGChG4eHLePgI2NUySIp9vdwqHB75PBt6G+SLTnZbNrR71445
 +QlBwnO1mE40AddN0fD5kkkv1cgbiRYtl2JKbuAXp4i9FTk8AmKIL9NHhFjhOw+g0RH3
 p5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8PEaxRIKLygOaEgMkzuJi7I5huOwDoYdniqBjKsADXw=;
 b=VM9J4wKj1SpzQq4jkIROq+TISaNkR3gGV3pvuwfH25QgBdqUJp26FMCQMq0sFuv1A2
 oXgQGTd6AJgc3ZXc5J6CkNkLZ8pnc2XoaGMNkKqUG+kN4TwrRqXwhJplr9/QFVOtxbSX
 4EEjvZw3K+kxOkfpURt3KHsfpggI55HEDTI5RiJmodKJtEAXFMtBYcu2T/YnuFzG84wl
 Tq76IiMaBU2RdTvnerrpghxZjVWgjHYuzJoZJY1Q5r7LUfEzy+B1m8wfK88CEEKg1Xrz
 HqK7n9vI95ErcaRrVujyq9U1jlK/atTrHzS8zreeBIe1AwPx3oRb6vH1YN1puRNCYYhU
 Q9TA==
X-Gm-Message-State: AOAM533pKDICj4LeDBiAJezyKv8GLQzvnmvtgXjpHLV4RmIDQl6yfEVx
 Icapj92LrTBRm+kuO/muhCE=
X-Google-Smtp-Source: ABdhPJyByNj82M6gK0E2xY0hiyKZS2oFW7jUEFYFq0Kyf4sXAHCyJpJNfcNI9K9tJ3euch3GuK3Orw==
X-Received: by 2002:ac2:41c5:: with SMTP id d5mr613048lfi.459.1616155568537;
 Fri, 19 Mar 2021 05:06:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id q24sm737244lji.40.2021.03.19.05.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 05:06:07 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: dc: Restore coupling of display controllers
To: Thierry Reding <thierry.reding@gmail.com>,
 Paul Fertser <fercerpav@gmail.com>
References: <20210319070637.675964-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4ec14b16-aa2a-5997-0b7f-d413377e93cb@gmail.com>
Date: Fri, 19 Mar 2021 15:06:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210319070637.675964-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTkuMDMuMjAyMSAxMDowNiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IENvdXBsaW5nIG9mIGRpc3BsYXkg
Y29udHJvbGxlcnMgdXNlZCB0byByZWx5IG9uIHJ1bnRpbWUgUE0gdG8gdGFrZSB0aGUKPiBjb21w
YW5pb24gY29udHJvbGxlciBvdXQgb2YgcmVzZXQuIENvbW1pdCBmZDY3ZTljNmVkNWEgKCJkcm0v
dGVncmE6IERvCj4gbm90IGltcGxlbWVudCBydW50aW1lIFBNIikgYWNjaWRlbnRhbGx5IGJyb2tl
IHRoaXMgd2hlbiBydW50aW1lIFBNIHdhcwo+IHJlbW92ZWQuCj4gCj4gUmVzdG9yZSB0aGlzIGZ1
bmN0aW9uYWxpdHkgYnkgcmV1c2luZyB0aGUgaGllcmFyY2hpY2FsIGhvc3QxeCBjbGllbnQKPiBz
dXNwZW5kL3Jlc3VtZSBpbmZyYXN0cnVjdHVyZSB0aGF0J3Mgc2ltaWxhciB0byBydW50aW1lIFBN
IGFuZCB3aGljaAo+IHBlcmZlY3RseSBmaXRzIHRoaXMgdXNlLWNhc2UuCj4gCj4gRml4ZXM6IGZk
NjdlOWM2ZWQ1YSAoImRybS90ZWdyYTogRG8gbm90IGltcGxlbWVudCBydW50aW1lIFBNIikKPiBS
ZXBvcnRlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+CgpIaSwKClRoaXMgYnVn
IHdhcyBvcmlnaW5hbGx5IHJlcG9ydGVkIGJ5IFBhdWwgRmVydHNlciwgSSByZWRpcmVjdGVkIGl0
IHRvIHlvdS4KClJlcG9ydGVkLWJ5OiBQYXVsIEZlcnRzZXIgPGZlcmNlcnBhdkBnbWFpbC5jb20+
CgpGb3JtYWxseSwgdGhlIHN0YWJsZSBrZXJuZWwgbmVlZHMgdG8gYmUgQ0NlZCBzaW5jZSB3ZSB3
YW50IHRvIGhhdmUgdGhpcwpwYXRjaCBhcHBsaWVkIHRvIHRoZSBzdGFibGUga2VybmVscy4KCkNj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCgpPdGhlcndpc2UgdGhpcyBpcyBnb29kIHRvIG1lLCB0
aGFuayB5b3UhCgpUZXN0ZWQtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
