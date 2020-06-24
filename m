Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D023209A80
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508376E32F;
	Thu, 25 Jun 2020 07:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D486E852
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 23:11:25 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n24so4406691lji.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 16:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kQmsX+Vdu4EGjgpq9cDms5n1A/lNINB8dDevHiC6RUc=;
 b=R3nn64625vGAvKs8myny0FeOmYfpHqyUgCNpz4U6IKt+y6CBLtC3ILmpYuwRFoJaCK
 1PgHnuIZKMIQ5MtmPZve3jAN/HuN9zv4tytQDv01QjvwIqqxR4vcKmh1yBdM/4LkYOcv
 6DK00bPnyU0JXCGMzIrwux0mx4p0PpdjfLnmij3iIqyHlDOiZf1wOgaZbwV6P1EKKV27
 vzyycqOiXKZ5CjbdHoiItnwWgFA5BlIocqiZeVEPkCjJNpuYlpm5kAZPylszSh/qzeVw
 qpUg2NkEJoCyCyDgDukoh6JSt456S1p52rd2sXIgnDZvB2PgIwc0+sjI83GmGYkPjeFo
 rATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kQmsX+Vdu4EGjgpq9cDms5n1A/lNINB8dDevHiC6RUc=;
 b=TF0CZRuKsoQPVkZVmJ3pszO9O7xl8HX0AW3ukDacbAqjpiiyGIvGavsvNmRwlygsI1
 uAiVNdkrvHv7kG6LmrzgU+QkgEjCpJsb10YEdCSt4kHZ/uyzQpCkOxhPBk7LqcVc+QaR
 LN0pExA5fuSk2lU+f6ZHIxrKwDn62n+lGRJ+NfqFSXv/F0xmtHCdZicDcb0abyrzyc5R
 rsczmO/Yfwa1l3ihGvHwASqnsUWBJCwyUOVHaEXeKYvalb+VcG7nSnTA68y8Qkldbr87
 I6lJdVbzvbibvujqBwWA0HKW/e8kk62qbl+xtZtonZeyzo4H9X8D+HnrNxz4QQ3OMjxX
 8KUg==
X-Gm-Message-State: AOAM533AklWMnjXsPVhRocQk+RmQU4j08m7VZKgxgkIXr0NN9wAV02ti
 6FiY2Dh939tZitKWdt0LSzg=
X-Google-Smtp-Source: ABdhPJx65Uh8f3Z67/X/cBG/G6Xck+3qZo/ZVAUh9OU7HjeHp8x2TAATFJzkz7GLbKKfCdHgVB+eHg==
X-Received: by 2002:a2e:890a:: with SMTP id d10mr14729658lji.327.1593040283614; 
 Wed, 24 Jun 2020 16:11:23 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id d2sm5561521lfq.79.2020.06.24.16.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 16:11:22 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c6642ebd-c9f1-eab0-ff6d-109698af73e0@gmail.com>
Date: Thu, 25 Jun 2020 02:11:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:31:01 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gLyogQ29tbWFu
ZCBpcyBhbiBvcGNvZGUgZ2F0aGVyIGZyb20gYSBHRU0gaGFuZGxlICovCj4gI2RlZmluZSBEUk1f
VEVHUkFfU1VCTUlUX0NPTU1BTkRfR0FUSEVSwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAKPiAv
KiBDb21tYW5kIGlzIGFuIG9wY29kZSBnYXRoZXIgZnJvbSBhIHVzZXIgcG9pbnRlciAqLwo+ICNk
ZWZpbmUgRFJNX1RFR1JBX1NVQk1JVF9DT01NQU5EX0dBVEhFUl9VUFRSwqDCoMKgwqDCoMKgwqAg
MQoKSSdtIGEgYml0IGR1YmlvdXMgYWJvdXQgd2hldGhlciB3ZSByZWFsbHkgbmVlZCB0byByZXRh
aW4gdGhlIG5vbi1VUFRSCnZhcmlhbnQuIFRoZSBtZW1vcnktY29weWluZyBvdmVyaGVhZCBpcyBu
ZWdsaWdpYmxlIGJlY2F1c2UgY21kc3RyZWFtJ3MKZGF0YSB1c3VhbGx5IGlzIGhvdCBpbiBDUFUn
cyBjYWNoZQoKSUlSQywgdGhlIG1vc3QgKGlmIG5vdCBhbGwpIG9mIHRoZSBtb2Rlcm4gRFJNIGRy
aXZlcnMgZHJpdmVycyB1c2UgdGhlCnVzcnB0ci1vbmx5IGZvciB0aGUgY21kc3RyZWFtLgoKQXQg
bGVhc3QgdGhlcmUgaXMgbm8gYW55IHJlYWwtd29ybGQgdXNlcnNwYWNlIGV4YW1wbGUgdG9kYXkg
dGhhdCBjb3VsZApiZW5lZml0IGZyb20gYSBub24tVVBUUiB2YXJpYW50LgoKSSdtIHN1Z2dlc3Rp
bmcgdG8gbGVhdmUgb3V0IHRoZSBub24tVVBUUiBnYXRoZXIgdmFyaWFudCBmb3Igbm93LCBrZWVw
aW5nCml0IGluIG1pbmQgYXMgYSBwb3RlbnRpYWwgZnV0dXJlIGV4dGVuc2lvbiBvZiB0aGUgc3Vi
bWlzc2lvbiBVQVBJLiBBbnkKb2JqZWN0aW9ucz8KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
