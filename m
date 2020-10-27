Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF2F29CEC0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954B66EC96;
	Wed, 28 Oct 2020 08:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80536EC1B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:18:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 184so3784482lfd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rRmJEoczOaPt5oIq8pBYfrOwwnQx9zBhEX8LjsvLjPU=;
 b=eaFIazKFNB5vyc1tXwMSYIlIFQxt6JNrRMyBSHpb7iU0RRmO77n4dc1iUE32UC4l5Y
 ZGr96oD5UyzDGZUvJDqXU/yGz+us6hS0pomjhWv9z6Wf7KslMSImDcTLqNZhThgDPkuV
 9zTHIVk9mkeHWhow/fn6FJE58nRSHHmZxFMDLLUnTnAzK4BRE1NrtwyF60Ms7YuBR/01
 lsR2ZiwIrnPgwpUvIqx8l+VnyS3qKhIB71QRirpTh1Q3pe8XUZhexHWEWRFYcHxtflHm
 Es08TcFSdBLKRYTUkSAetPSJtGJk1dhCDazar1+WDc8X+FMV3dzmzEq5iAKiJ/U2Rd0I
 G3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rRmJEoczOaPt5oIq8pBYfrOwwnQx9zBhEX8LjsvLjPU=;
 b=TuuWLqO3ispfNLU2dtcuTIA2gL0rANzZjXLxETH9yJ47Zn+GJmKyjXS41a3tfzZD6f
 ahHMcPnRYH9URQAdk0pcXxn/dOvAOuLXdPg/O0G9x6ol0cRZHtvM5ncKqE9uafu+Fz2e
 D9HGpvRGaWSkTqHJlWp/Ii+pM93LizL5y2+ZJRKr4t8CDgvpSxGQm/lPM2oNo1lJDDr/
 Ndp+jM7FWfJqFQ7G5BXpZ+9cmMdyrJ3NLv8pFqjzxwM6MMoKZ7d8kIRfFrlRcucHW2/T
 fEzE+PZ3Gu5zo5K/EtoTFTOLH3VYPww6lWDySA/JqRBihpCLaizKQTsPW5JvzmfY29aO
 6SDQ==
X-Gm-Message-State: AOAM532Mg5y4mh1ZfccBY7V5RkpFouCuCNji8926rb+PqQ6Me3A1lJMU
 EXCJ2qzdFcETCzY8e597aWY=
X-Google-Smtp-Source: ABdhPJwIxxkDDHFxByTXYZCyDddCnWVGWPKWYwM/m33Y+OUz7VXxGlN+z1qlQDVq2IYrih/LUJUV3A==
X-Received: by 2002:a19:3f57:: with SMTP id m84mr1532664lfa.17.1603826317134; 
 Tue, 27 Oct 2020 12:18:37 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id x19sm265377lff.189.2020.10.27.12.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 12:18:36 -0700 (PDT)
Subject: Re: [PATCH v6 09/52] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-10-digetx@gmail.com> <20201027090550.GI4244@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7770b89e-f30b-3bfd-1e21-8ebbe905efcd@gmail.com>
Date: Tue, 27 Oct 2020 22:18:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027090550.GI4244@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:30 +0000
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

MjcuMTAuMjAyMCAxMjowNSwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIE1v
biwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjUyQU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gTWVtb3J5IGNvbnRyb2xsZXIgaXMgaW50ZXJjb25uZWN0ZWQgd2l0aCBtZW1vcnkgY2xp
ZW50cyBhbmQgd2l0aCB0aGUKPj4gRXh0ZXJuYWwgTWVtb3J5IENvbnRyb2xsZXIuIERvY3VtZW50
IG5ldyBpbnRlcmNvbm5lY3QgcHJvcGVydHkgd2hpY2gKPj4gdHVybnMgbWVtb3J5IGNvbnRyb2xs
ZXIgaW50byBpbnRlcmNvbm5lY3QgcHJvdmlkZXIuCj4+Cj4+IEFja2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRp
Z2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVy
cy9udmlkaWEsdGVncmEzMC1tYy55YW1sICAgICAgIHwgNSArKysrKwo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEzMC1tYy55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9u
dmlkaWEsdGVncmEzMC1tYy55YW1sCj4+IGluZGV4IDg0ZmQ1N2JjZjBkYy4uNTQzNmU2ZDQyMGJj
IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5
LWNvbnRyb2xsZXJzL252aWRpYSx0ZWdyYTMwLW1jLnlhbWwKPj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEzMC1t
Yy55YW1sCj4+IEBAIC01Nyw2ICs1Nyw5IEBAIHByb3BlcnRpZXM6Cj4+ICAgICIjaW9tbXUtY2Vs
bHMiOgo+PiAgICAgIGNvbnN0OiAxCj4+ICAKPj4gKyAgIiNpbnRlcmNvbm5lY3QtY2VsbHMiOgo+
PiArICAgIGNvbnN0OiAxCj4+ICsKPj4gIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+PiAgICAiXmVtYy10
aW1pbmdzLVswLTldKyQiOgo+PiAgICAgIHR5cGU6IG9iamVjdAo+PiBAQCAtMTIwLDYgKzEyMyw3
IEBAIHJlcXVpcmVkOgo+PiAgICAtIGNsb2NrLW5hbWVzCj4+ICAgIC0gIiNyZXNldC1jZWxscyIK
Pj4gICAgLSAiI2lvbW11LWNlbGxzIgo+PiArICAtICIjaW50ZXJjb25uZWN0LWNlbGxzIgo+IAo+
IFJvYiwKPiAKPiBZb3Ugd2VyZSBmaW5lIHdpdGggYWRkaW5nIGEgbmV3IHJlcXVpcmVkIHByb3Bl
cnR5IHdoaWNoIGJyZWFrcyBhbGwKPiBleGlzdGluZyBEVEJzPwoKVGhpcyBpcyBhIHJlcXVpcmVk
IHByb3BlcnR5IGZvciB0aGUgbmV3IGJpbmRpbmdzIGFuZCBvcHRpb25hbCBmb3IgdGhlCm9sZGVy
LiBEb2VzIGl0IHJlYWxseSBuZWVkIHRvIGJlIG1hZGUgb3B0aW9uYWwgaW4gdGhlIGJpbmRpbmc/
Cgo+IFdlcmUgdGhlc2UgYmluZGluZ3MgbWFya2VkIGFzIHVuc3RhYmxlPyBUaGUgcGF0Y2hzZXQg
ZG9lcyBub3QgZXZlbgo+IHNheS9zY3JlYW0gdGhhdCBpdCBicmVha3MgdGhlIEFCSSwgc28gdGhp
cyBtaWdodCBiZSBxdWl0ZSBhIHN1cnByaXNlIGZvcgo+IHNvbWVvbmUuLi4KClBsZWFzZSBzZWUg
dGVncmFfbWNfaW50ZXJjb25uZWN0X3NldHVwKCkgaW4gIm1lbW9yeTogdGVncmEtbWM6IEFkZApp
bnRlcmNvbm5lY3QgZnJhbWV3b3JrIiBwYXRjaCwgd2hpY2ggY2hlY2sgcHJlc2VuY2Ugb2YgdGhl
IG5ldyBJQ0MgRFQKcHJvcGVydHkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
