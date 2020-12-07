Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAED2D263C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E246E992;
	Tue,  8 Dec 2020 08:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19CC6E8EE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 22:11:21 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 23so7292368lfg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 14:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6EwZVkyZDi8giolSpIEZVZKekJNvv34CCb0A7z+ogOo=;
 b=HHRSWZQViQ36MCqkFBdhwO5WZfuBerDebz8XYis8B/LNgFKFn2zXlsGa3gTscca12P
 Sk1cLU5iTaC3Ot6LInMNt9xDaBv0NdtLyoCcx5WvXlItb2zXrDUN/drRtvOI78V3IhaU
 V9HIVSRGLtcur4C3gWyIzH0d6ho6T7qTUnNMHiU96Oths/MkxyGMOM4IKPxE76zrSmQd
 rXz0O7YLQI5Lwl/Q6/bym18GTrERFgzA+iqUUNeMNi+O9aVtnEmpEe5P40jWpdAuFtaM
 vAZQvCGUGb3elZtjEfqRiGBDdAygx3UF+nQm58CgWxh0gW4Gqje2TM/DZXjxquKQom4m
 3FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6EwZVkyZDi8giolSpIEZVZKekJNvv34CCb0A7z+ogOo=;
 b=PlTYT5lQdl2HkStmm5vIeX//6EmSynmS8+SpKGbEbGRCEedzt70MbNF2jgVfmjsijZ
 lPM5pAOCsJhfvWRct+DH4Eggk+Ta01s+S9O+JVRbBmCbgd3UIDzmvgZesjScH1h2r0Oq
 TJqRcBk9dwXKNsD9io9XqZOKwRw2rg05i9QB4R1xTVtXg81SWysuWXgTfRgvyt+qEYpM
 AHVWD8MhqUtwJTjOYtvhzzcnpc8bwS7BAbSLATWhOmvrccpONY1vBesaghX6EW+CczWM
 KQ+lqJZjEf9qYS9nvqDbkqqGnIlBGBxhKVBXIIilCe5qD346DMF3NIvlUQUGYJdvv2os
 G5Jw==
X-Gm-Message-State: AOAM533ge3jDeVKHhBeU/5JUr/hSHvFzloBE5bGiyQ4liq5uAsBA6YC8
 39d89ZqOb6e1WfK+RG4sBrA=
X-Google-Smtp-Source: ABdhPJw+9jw+AR2uLqB2wed29KybJWtA5Z8pjqyAD8LWAYc2tJiLGiT58naimP05pyR1vLGlW03TAw==
X-Received: by 2002:a19:6d05:: with SMTP id i5mr8577181lfc.524.1607379080300; 
 Mon, 07 Dec 2020 14:11:20 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-53.dynamic.spd-mgts.ru.
 [109.252.192.53])
 by smtp.googlemail.com with ESMTPSA id y23sm11226ljc.119.2020.12.07.14.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 14:11:19 -0800 (PST)
Subject: Re: [PATCH v11 00/10] Introduce memory interconnect for NVIDIA Tegra
 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>, 
 Nicolas Chauvet <kwizart@gmail.com>, Georgi Djakov
 <georgi.djakov@linaro.org>, Peter Geis <pgwipeout@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Viresh Kumar <vireshk@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
References: <20201203192439.16177-1-digetx@gmail.com>
 <160717730565.9414.18193998919736710677.b4-ty@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2128b898-ee5f-fd71-77af-4a3d957088a5@gmail.com>
Date: Tue, 8 Dec 2020 01:11:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <160717730565.9414.18193998919736710677.b4-ty@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMTIuMjAyMCAxNzowOSwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIFRo
dSwgMyBEZWMgMjAyMCAyMjoyNDoyOSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiBU
aGlzIHNlcmllcyBicmluZ3MgaW5pdGlhbCBzdXBwb3J0IGZvciBtZW1vcnkgaW50ZXJjb25uZWN0
IHRvIFRlZ3JhMjAsCj4+IFRlZ3JhMzAgYW5kIFRlZ3JhMTI0IFNvQ3MuCj4+Cj4+IEZvciB0aGUg
c3RhcnRlciBvbmx5IGRpc3BsYXkgY29udHJvbGxlcnMgYW5kIGRldmZyZXEgZGV2aWNlcyBhcmUg
Z2V0dGluZwo+PiBpbnRlcmNvbm5lY3QgQVBJIHN1cHBvcnQsIG90aGVycyBjb3VsZCBiZSBzdXBw
b3J0ZWQgbGF0ZXIgb24uIFRoZSBkaXNwbGF5Cj4+IGNvbnRyb2xsZXJzIGhhdmUgdGhlIGJpZ2dl
c3QgZGVtYW5kIGZvciBpbnRlcmNvbm5lY3QgQVBJIHJpZ2h0IG5vdyBiZWNhdXNlCj4+IGR5bmFt
aWMgbWVtb3J5IGZyZXF1ZW5jeSBzY2FsaW5nIGNhbid0IGJlIGRvbmUgc2FmZWx5IHdpdGhvdXQg
dGFraW5nIGludG8KPj4gYWNjb3VudCBiYW5kd2lkdGggcmVxdWlyZW1lbnQgZnJvbSB0aGUgZGlz
cGxheXMuIEluIHBhcnRpY3VsYXIgdGhpcyBzZXJpZXMKPj4gZml4ZXMgZGlzdG9ydGVkIGRpc3Bs
YXkgb3V0cHV0IG9uIFQzMCBPdXlhIGFuZCBUMTI0IFRLMSBkZXZpY2VzLgo+Pgo+PiBbLi4uXQo+
IAo+IEFwcGxpZWQsIHRoYW5rcyEKPiAKPiBbMDEvMTBdIGR0LWJpbmRpbmdzOiBtZW1vcnk6IHRl
Z3JhMjA6IGVtYzogRG9jdW1lbnQgb3BwLXN1cHBvcnRlZC1odyBwcm9wZXJ0eQo+IFswMi8xMF0g
bWVtb3J5OiB0ZWdyYTIwOiBTdXBwb3J0IGhhcmR3YXJlIHZlcnNpb25pbmcgYW5kIGNsZWFuIHVw
IE9QUCB0YWJsZSBpbml0aWFsaXphdGlvbgo+IFswMy8xMF0gbWVtb3J5OiB0ZWdyYTMwOiBTdXBw
b3J0IGludGVyY29ubmVjdCBmcmFtZXdvcmsKPiAgICAgICAgIGNvbW1pdDogMDFhNTFmYWNiNzRm
YjMzN2ZmOWZlNzM0Y2FhODVkZDZlMjQ2ZWY0OAo+IAo+IEJlc3QgcmVnYXJkcywKPiAKCkF3ZXNv
bWUsIHRoYW5rcyEgR29vZCB0byBoYXZlIHRoZSB3YXJuaW5nIHNwbGF0IHNpbGVuY2VkLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
