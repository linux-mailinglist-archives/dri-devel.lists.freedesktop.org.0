Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6B03070DF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451F96E907;
	Thu, 28 Jan 2021 08:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AE089CBE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 21:26:56 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p21so4714747lfu.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 13:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PkkTYvfWyANciuqV75npJ/gFbUncXc5JjD+XYOH0VH8=;
 b=BoTOvXdu3swqZb2+lsk9WlhzPZXwfhI0WIxDCA1OMC3oHJSMsL1Zh31Dw1l3Zdxb4q
 MMN90OsKTnEdbi0aHFmA9tRnjbanvZU+JmL1+/GLsWujC2m5oxLBaS9EUv44CgxaXTsX
 zFOVDhw+I7SE5LIVzDMgnhED4Kx/zqvWwwpCTqSfJvbBLg9ZsVPPJPuuKIxMWFHkUnAu
 5Iv9e80z+3WGVPpj5FAFTn7k3RaSbMc6fmyxTe29aAln4dwrjABSJ/0h/8Hba5eEX2zz
 vwFrXxIm2d9WTNUuXgfFAdgbO8ayBDEjiR2q0zHB48CBdtSyhL+4tLM6zdErCvdcEm+p
 vj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PkkTYvfWyANciuqV75npJ/gFbUncXc5JjD+XYOH0VH8=;
 b=KXEulPXNoc9YgufkTz675vIBYdV7DqmFDq3fvfa6BTL8g/PFE+UO40kwvl/BM6a3vn
 XrOndqrrwscTdaWpCrG4LBuHJEiN0BV4fyZJG66unRGUB/kwMQ6Xj/Me2aNbFJaotroW
 TTt+/ZuiioGBJCeqmMiwod61SLEScC8pPCf9LZGaksjoz/kMAEeFnIHjy+/I3OoIhCM1
 vmfUJQ3HPImgMZXS5QPV7xeMotc9rvIZBQH68l1oBMVZR2oZpxxEgkprmzoPCs9Z5Qtd
 h8Pi1/fNZ6ITODITwP5NBrd+Iz29Rrpis3WAUppMIEf9PSuQBoX/zi1xW2+0YIINot+X
 37rw==
X-Gm-Message-State: AOAM533vay6lzOA8VSU6daE48mh6oAqg1NlBq76X2/q0vVPPlGF4Sc8v
 RccfV0N4eSF55guWd7CUdTw=
X-Google-Smtp-Source: ABdhPJwMOh5Zbzn5jlQDDiionvaHND6cl6YEMpkKIEYnDhyiUHbvJwqooKTYa8uuAqSnKJskJJ6wiQ==
X-Received: by 2002:ac2:4907:: with SMTP id n7mr3247719lfi.213.1611782814893; 
 Wed, 27 Jan 2021 13:26:54 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id b18sm823875lfj.140.2021.01.27.13.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 13:26:54 -0800 (PST)
Subject: Re: [PATCH v5 00/21] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <638c1aeb-921b-0ea2-5258-16c6d3183306@gmail.com>
Date: Thu, 28 Jan 2021 00:26:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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

MjYuMDEuMjAyMSAwNTo0NSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IDUuIFRoZSBo
YXJkd2FyZSBzdGF0ZSBvZiBzeW5jIHBvaW50cyBzaG91bGQgYmUgcmVzZXQgd2hlbiBzeW5jIHBv
aW50IGlzCj4+IHJlcXVlc3RlZCwgbm90IHdoZW4gaG9zdDF4IGRyaXZlciBpcyBpbml0aWFsaXpl
ZC4KPiAKPiBUaGlzIG1heSBiZSBkb2FibGUsIGJ1dCBJIGRvbid0IHRoaW5rIGl0IGlzIGNyaXRp
Y2FsIGZvciB0aGlzIFVBUEksIHNvCj4gbGV0J3MgY29uc2lkZXIgaXQgYWZ0ZXIgdGhpcyBzZXJp
ZXMuCj4gCj4gVGhlIHVzZXJzcGFjZSBzaG91bGQgYW55d2F5IG5vdCBiZSBhYmxlIHRvIGFzc3Vt
ZSB0aGUgaW5pdGlhbCB2YWx1ZSBvZgo+IHRoZSBzeW5jcG9pbnQgdXBvbiBhbGxvY2F0aW9uLiBU
aGUga2VybmVsIHNob3VsZCBzZXQgaXQgdG8gc29tZSBoaWdoCj4gdmFsdWUgdG8gY2F0Y2ggYW55
IGlzc3VlcyByZWxhdGVkIHRvIHdyYXBhcm91bmQuCgpUaGlzIGlzIGNyaXRpY2FsIGJlY2F1c2Ug
bWluICE9IG1heCB3aGVuIHN5bmMgcG9pbnQgaXMgcmVxdWVzdGVkLgoKPiBBbHNvLCB0aGlzIG1h
a2VzIGNvZGUgbW9yZSBjb21wbGljYXRlZCBzaW5jZSBpdCBub3cgbmVlZHMgdG8gZW5zdXJlIGFs
bAo+IHdhaXRzIG9uIHRoZSBzeW5jcG9pbnQgaGF2ZSBjb21wbGV0ZWQgYmVmb3JlIGZyZWVpbmcg
dGhlIHN5bmNwb2ludCwKPiB3aGljaCBjYW4gYmUgbm9udHJpdmlhbCBlLmcuIGlmIHRoZSB3YWl0
ZXIgaXMgaW4gYSBkaWZmZXJlbnQgdmlydHVhbAo+IG1hY2hpbmUgb3Igc29tZSBvdGhlciBkZXZp
Y2UgY29ubmVjdGVkIHZpYSBQQ0llIChhIHJlYWwgdXNlY2FzZSkuCgpJdCBzb3VuZHMgdG8gbWUg
dGhhdCB0aGVzZSBWTSBzeW5jIHBvaW50cyBzaG91bGQgYmUgdHJlYXRlZCB2ZXJ5CnNlcGFyYXRl
bHkgZnJvbSBhIGdlbmVyaWMgc3luYyBwb2ludHMsIGRvbid0IHlvdSB0aGluayBzbz8gTGV0J3Mg
bm90IG1peAp0aGVtIGFuZCBnZXQgdGhlIGdlbmVyaWMgc3luYyBwb2ludHMgdXNhYmxlIGZpcnN0
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
