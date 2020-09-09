Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EF82627F4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D1D6E9F0;
	Wed,  9 Sep 2020 07:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FB56E8F9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 02:20:03 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y2so722883lfy.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 19:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2Q2+kiu4EfZjMBUp16jDvji+ladlLRHIFkYixQGK8qs=;
 b=OD1KM/5vuuzXIdr/q6koklfVPGNZw81Na0cNlV+LKaBlN7D+c8w8Lo0HadgpmKdD1K
 5Hk0yIGRsQo+0m29qHtHRcmlDoefR5DMYp7JUQvpPbzmodCZ8YMyuKF+PlCDY5ako87B
 +N7hIrafYNITNUl2Umcde00tWfBACir9a8KN994KJVhjf7dHysKIt41sVWaONS6gjJyM
 Zm1mbhJH9aFyFAGZZA7No+JrDrd57mw4+0B/9fn+SBB18KVGl/fgcGgGDkyG2JAJ7IN5
 LR5iqQaLjurxWYlMtVVJOuFb6m80z9Wxf5E+P1EI5Ja0sZyMP03u9jJe1OBOd/7gLN4x
 hELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Q2+kiu4EfZjMBUp16jDvji+ladlLRHIFkYixQGK8qs=;
 b=tILUuVzFZiATj2lx9A3BYg4DraGWbf6Oxorz8iRC5YNk/Z6ok0SAsf1stKoKd8I8fx
 aGm+M26B0hroCrUl8rL3ZDWYaDVBr1IavNqF+MsWi9b7Eo4Jdjfr4NhZOeADx2MvivGJ
 OW8jFlmqOb7yisdMmI/1uK/oLL+yVSRPLZd/P6uoBHWBkOVPpm/m1RgdMQK8tq9bErVT
 NNhepaYnyJl2ceXWTulUn27FSYTeXOBjCTAky9p8ZJeEVenQgPEodZyHFcYhnJNEnxtJ
 CBP2VKE0RCbaZJLKhgD0dD9aRc2mKetEMKIc2zCKVFM+Nwce2/eVSC0EYMyXWhWUj0hP
 t5FQ==
X-Gm-Message-State: AOAM533H7ybv3CWkkfTQYPWWKOXlCceuxHM3UxamLlj2zPH2QMCT8T15
 t9MKTwbQ0t+Y8kA6jWBubH+eNyAUOIM=
X-Google-Smtp-Source: ABdhPJwzmNvEnX58PSsyVxtoj9TlEeeFHguJqsfbPwv8QpfV+EO7XJeopfJVlkSGo6sE1yxSK5Ezeg==
X-Received: by 2002:ac2:53a3:: with SMTP id j3mr838381lfh.86.1599618001679;
 Tue, 08 Sep 2020 19:20:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id z10sm260472lfa.10.2020.09.08.19.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 19:20:00 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <963bb17d-9501-0118-b5c2-a06d68c3eb9f@gmail.com>
Date: Wed, 9 Sep 2020 05:20:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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

MDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gSGkgYWxsLAo+
IAo+IGhlcmUncyBhIHNlY29uZCByZXZpc2lvbiBvZiB0aGUgSG9zdDF4L1RlZ3JhRFJNIFVBUEkg
cHJvcG9zYWwsCj4gaG9wZWZ1bGx5IHdpdGggbW9zdCBpc3N1ZXMgZnJvbSB2MSByZXNvbHZlZCwg
YW5kIGFsc28gd2l0aAo+IGFuIGltcGxlbWVudGF0aW9uLiBUaGVyZSBhcmUgc3RpbGwgb3BlbiBp
c3N1ZXMgd2l0aCB0aGUKPiBpbXBsZW1lbnRhdGlvbjoKPiAKPiAqIFJlbG9jcyBhcmUgbm93IGhh
bmRsZWQgb24gVGVncmFEUk0gc2lkZSBpbnN0ZWFkIG9mIEhvc3QxeCwKPiAgIHNvIHRoZSBmaXJl
d2FsbCBpcyBub3QgYXdhcmUgb2YgdGhlbSwgY2F1c2luZyBzdWJtaXNzaW9uCj4gICBmYWlsdXJl
IHdoZXJlIHRoZSBmaXJld2FsbCBpcyBlbmFibGVkLiBQcm9wb3NlZCBzb2x1dGlvbgo+ICAgaXMg
dG8gbW92ZSB0aGUgZmlyZXdhbGwgdG8gVGVncmFEUk0gc2lkZSwgYnV0IHRoaXMgaGFzbid0Cj4g
ICBiZWVuIGRvbmUgeWV0Lgo+ICogRm9yIHRoZSBuZXcgVUFQSSwgc3luY3BvaW50IHJlY292ZXJ5
IG9uIGpvYiB0aW1lb3V0IGlzCj4gICBkaXNhYmxlZC4gV2hhdCB0aGlzIG1lYW5zIGlzIHRoYXQg
dXBvbiBqb2IgdGltZW91dCwKPiAgIGFsbCBmdXJ0aGVyIGpvYnMgdXNpbmcgdGhhdCBzeW5jcG9p
bnQgYXJlIGNhbmNlbGxlZCwKPiAgIGFuZCB0aGUgc3luY3BvaW50IGlzIG1hcmtlZCB1bnVzYWJs
ZSB1bnRpbCBpdCBpcyBmcmVlZC4KPiAgIEhvd2V2ZXIsIHRoZXJlIGlzIGN1cnJlbnRseSBhIHJh
Y2UgYmV0d2VlbiB0aGUgdGltZW91dAo+ICAgaGFuZGxlciBhbmQgam9iIHN1Ym1pc3Npb24sIHdo
ZXJlIHN1Ym1pc3Npb24gY2FuIG9ic2VydmUKPiAgIHRoZSBzeW5jcG9pbnQgaW4gbm9uLWxvY2tl
ZCBzdGF0ZSBhbmQgeWV0IHRoZSBqb2IKPiAgIGNhbmNlbGxhdGlvbnMgd29uJ3QgY2FuY2VsIHRo
ZSBuZXcgam9iLgo+ICogV2FpdGluZyBmb3IgRE1BIHJlc2VydmF0aW9uIGZlbmNlcyBpcyBub3Qg
aW1wbGVtZW50ZWQgeWV0Lgo+ICogSSBoYXZlIG9ubHkgdGVzdGVkIG9uIFRlZ3JhMTg2Lgo+IAo+
IFRoZSBzZXJpZXMgY29uc2lzdHMgb2YgdGhyZWUgcGFydHM6Cj4gCj4gKiBUaGUgZmlyc3QgcGFy
dCBjb250YWlucyBzb21lIGZpeGVzIGFuZCBpbXByb3ZlbWVudHMgdG8KPiAgIHRoZSBIb3N0MXgg
ZHJpdmVyIG9mIG1vcmUgZ2VuZXJhbCBuYXR1cmUsCj4gKiBUaGUgc2Vjb25kIHBhcnQgYWRkcyB0
aGUgSG9zdDF4IHNpZGUgVUFQSSwgYXMgd2VsbCBhcwo+ICAgSG9zdDF4LXNpZGUgY2hhbmdlcyBu
ZWVkZWQgZm9yIHRoZSBuZXcgVGVncmFEUk0gVUFQSSwKPiAqIFRoZSB0aGlyZCBwYXJ0IGFkZHMg
dGhlIG5ldyBUZWdyYURSTSBVQVBJLgo+IAo+IEkgaGF2ZSB3cml0dGVuIHNvbWUgdGVzdHMgdG8g
dGVzdCB0aGUgbmV3IGludGVyZmFjZSwKPiBzZWUgaHR0cHM6Ly9naXRodWIuY29tL2N5bmRpcy91
YXBpLXRlc3QuIFBvcnRpbmcgb2YgcHJvcGVyCj4gdXNlcnNwYWNlIChlLmcuIG9wZW50ZWdyYSwg
dmRwYXUtdGVncmEpIHdpbGwgY29tZSBvbmNlCj4gdGhlcmUgaXMgc29tZSBkZWdyZWUgb2YgY29u
Y2x1c2lvbiBvbiB0aGUgVUFQSSBkZWZpbml0aW9uLgoKQ291bGQgeW91IHBsZWFzZSBlbnVtZXJh
dGUgYWxsIHRoZSBjdXJyZW50bHkgb3BlbmVkIHF1ZXN0aW9ucz8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
