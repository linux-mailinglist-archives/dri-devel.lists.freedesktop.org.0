Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA22529CEB8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127006EB41;
	Wed, 28 Oct 2020 08:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46D06EC48
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:43:21 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x16so3349523ljh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VlRzTBC/wBfxIpRQ0M8e1w6Q9iv9Exe50KxjDSUm4w4=;
 b=G1BlqOi2pjvzRVs3HvfPFPkqbhpWnWCJiikVWY0XuAuqM2kF+Ylp+lx+m8xXO8j3tc
 FfClw88SUXnmRYXe0FMsD6HQAG4SRghdehMeuK0zJVRl3sjwXsM6bb9yEFtD4bmGCJgA
 +DWETyLdbSMC8wm7X0rtyDEf6+L9sxL2MWju8h/QC1mLgPSp1wQHq1hJ7A24lKZM61UH
 EHukawD/+jWnvnkhA++W0M7yz9LqwPpOxeaJhv2IfZ8tgabsj9J/XOwQ9qD+le2+Ebaz
 fC6W/2k8GNKYtMgPj2q/p7ic1/0HiJIHyhwtyTtES3vbiTPy5x+kYvyiyaWnRdZgT9W0
 e/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VlRzTBC/wBfxIpRQ0M8e1w6Q9iv9Exe50KxjDSUm4w4=;
 b=btMAvR1rXxZ6cH98Afy20oazwCBOv7QX26NGed2tZmDDARTmLNHHudRq2qE0KLwmXg
 5kv+r6PvJE4QCbgny01pwvNp3m6qvz4ad/xPlFkL0yNyJMMR7QT0+fkcqw2oxARwOy9/
 FXTcdzRnoSPxPZSe7tw/AOlB2XMgiv6A7sY7WCtws3ecxYM/SF3cFz77QWfdeAaoLjHr
 vjv7FQmdzfeqiu+DIbzrDmxb54fSNuLg70tT2cyazhNA+72/H7sv5iAhglJodXnQwXyQ
 CMCD9VgFFJAGq8LZnuOm6GZ9oEp07G6ZwQ9YKpm4gz2fQs2VCb14QIgL91Ii1kIhPraK
 K7Vg==
X-Gm-Message-State: AOAM531Zqizw0c+/jg6jLpSatz5NMPs7d4VXWwlcjwWSQn4t3M2mz5zy
 WAcSjkeAbCNtiJllsHVa3qM=
X-Google-Smtp-Source: ABdhPJwV7piP5X+R0inxjR4SPntPEKhqLLUshXb2nOipuobs7nneYkUyh3iE9F/yaRbx+xb1ibcoxQ==
X-Received: by 2002:a2e:7018:: with SMTP id l24mr1904408ljc.313.1603831400162; 
 Tue, 27 Oct 2020 13:43:20 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id b2sm313232ljo.5.2020.10.27.13.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 13:43:19 -0700 (PDT)
Subject: Re: [PATCH v6 20/52] ARM: tegra: Correct EMC registers size in
 Tegra20 device-tree
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-21-digetx@gmail.com> <20201027091043.GJ4244@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <42802a15-734e-5531-88fc-c82f0248a9d8@gmail.com>
Date: Tue, 27 Oct 2020 23:43:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027091043.GJ4244@kozik-lap>
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

MjcuMTAuMjAyMCAxMjoxMCwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIE1v
biwgT2N0IDI2LCAyMDIwIGF0IDAxOjE3OjAzQU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gVGhlIFRlZ3JhMjAgRU1DIHJlZ2lzdGVycyBzaXplIHNob3VsZCBiZSB0d2ljZSBiaWdn
ZXIuIFRoaXMgcGF0Y2ggZml4ZXMKPj4gdGhlIHNpemUuCj4gCj4gRG9uJ3QgdXNlICJUaGlzIHBh
dGNoIiAodGhpcyBhcHBlYXJzIGhlcmUpLiBCZXR0ZXIgdG8gdXNlOgo+ICJGaXggdGhlIHNpemUg
b2YgLi4uIiBvciBqdXN0ICJUaGUgc2l6ZSBzaG91bGQgYmUgdHdpY2UgYmlnZ2VyIiBhcyBpdCBp
cwo+IG9idmlvdXMgdGhhdCB5b3UgZml4IGl0Lgo+IAo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmct
cGF0Y2hlcy5yc3QjTDE1MQo+IAo+IEFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+CgpUaGFua3MsIEkgd2Fzbid0IGF3YXJlIHRoYXQgaXQncyBhIHByZWZlcnJl
ZCB3b3JkaW5nIHN0eWxlIG5vdy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
