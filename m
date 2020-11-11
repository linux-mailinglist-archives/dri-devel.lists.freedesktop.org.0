Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E52292AEA89
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC5189F63;
	Wed, 11 Nov 2020 07:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4314F89BBE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 06:18:58 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id j5so442984plk.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 22:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Zz+u4O/ExV+I0XfrOYfMwrWHftV4MOlXgA3EL9hIHsg=;
 b=Pw4a1V3nK4X2DgxHAQTdRmNKbd1BmJuxzNI33tTM8sIXZTP8qajX3ww4DaPPdFo6Zs
 5K09iJmEHBSCQeWWkFgm1Kdw94Lntwqu29hIgeB9q5TcfhzffDjNRF91zjtINBTnbBau
 fTjqe//5KYelMUFY+/ziAiHibl5AyvjTV+nKbiI3UNVy4omo3Z0iw25Yu0f3sGCVv13Q
 RfsqZ11ODtWL/A6yfCI8eBLJ3ndC1X9lI1YrBO+uIvqt1xHD4VEkDElC5Txxt+/arELA
 eTxq92w5zzdCAnEdx70ezELIxdZfJQKNBEMXwxTWa1u/BMYHRGpcWR9hIm0FaCV9vG3f
 IRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Zz+u4O/ExV+I0XfrOYfMwrWHftV4MOlXgA3EL9hIHsg=;
 b=PHmdzZrArfVDDYY+HN8OpkNcQFqy9ngkcZbKSxC/v2z9uiwoGqXu94szfNR9RmnPDm
 0dBIt5T/dnJ69sw4xNLLJlkceq5dzwx48MPm6wwrq3l8/OahH49IG5x1MbvnWujkZeDe
 ha1e8KfGB7CoIOw9W0rNeUX15Da/YXXCBwHLrmz3LrMypilP0+jJH0hfR77Z79xXEJV8
 ZY4Jwa77NUZR81XTZfGkbpY0sdIN8CGdGrP9hPnThlh7CWS3e5xt8xkNi/c/sCIX2s3O
 HdfVRYhjTpbVp18gGI4Aa8drttp0djLNDkeDYbSB8B7OAs0/TRpzc9EA4f15laLbk1HM
 fcPA==
X-Gm-Message-State: AOAM5316nWTkx1etbdxXuF5nA3uC8wbU/Tw471Nk4N/FiFdEqF/ktYJ2
 k37mZSJU6fvRj1Ncna+4VSMvFw==
X-Google-Smtp-Source: ABdhPJx2Np21K4nEJMcurse4ukZe7jVo8P4Kg57gCpQvT0frJjcTL8LmeWw4PX37zBAzAgIYqahjpQ==
X-Received: by 2002:a17:902:59cf:b029:d7:e216:9260 with SMTP id
 d15-20020a17090259cfb02900d7e2169260mr11119815plj.74.1605075537774; 
 Tue, 10 Nov 2020 22:18:57 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id j19sm1091459pfd.189.2020.11.10.22.18.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Nov 2020 22:18:57 -0800 (PST)
Date: Wed, 11 Nov 2020 11:48:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 09/26] memory: tegra30: Support interconnect framework
Message-ID: <20201111061855.2azilyhfoxwzpoir@vireshk-i7>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-10-digetx@gmail.com>
 <20201111055313.tefidnmc7f4yb3jk@vireshk-i7>
 <185e9140-fdce-29ef-68c3-aa7da02b249d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <185e9140-fdce-29ef-68c3-aa7da02b249d@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEtMTEtMjAsIDA5OjE0LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTEuMTEuMjAyMCAw
ODo1MywgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPj4gK3N0YXRpYyBpbnQgdGVncmFfZW1j
X29wcF90YWJsZV9pbml0KHN0cnVjdCB0ZWdyYV9lbWMgKmVtYykKPiA+PiArewo+ID4+ICsJc3Ry
dWN0IG9wcF90YWJsZSAqcmVnX29wcF90YWJsZSA9IE5VTEwsICpjbGtfb3BwX3RhYmxlLCAqaHdf
b3BwX3RhYmxlOwo+ID4+ICsJdTMyIGh3X3ZlcnNpb24gPSBCSVQodGVncmFfc2t1X2luZm8uc29j
X3NwZWVkb19pZCk7Cj4gPj4gKwljb25zdCBjaGFyICpybmFtZSA9ICJjb3JlIjsKPiA+PiArCWlu
dCBlcnI7Cj4gPj4gKwo+ID4+ICsJLyoKPiA+PiArCSAqIExlZ2FjeSBkZXZpY2UtdHJlZXMgZG9u
J3QgaGF2ZSBPUFAgdGFibGUgYW5kIEVNQyBkcml2ZXIgaXNuJ3QKPiA+PiArCSAqIHVzZWZ1bCBp
biB0aGlzIGNhc2UuCj4gPj4gKwkgKi8KPiA+PiArCWlmICghZGV2aWNlX3Byb3BlcnR5X3ByZXNl
bnQoZW1jLT5kZXYsICJvcGVyYXRpbmctcG9pbnRzLXYyIikpIHsKPiA+IEkgZG9uJ3QgdW5kZXJz
dGFuZCB3aHkgeW91IHdhbnQgdG8gY2hlY2sgdGhpcyA/IFRoZSBiZWxvdyBjYWxsIHRvCj4gPiBk
ZXZfcG1fb3BwX29mX2FkZF90YWJsZSgpIHdpbGwgZmFpbCBhbnl3YXkgYW5kIHRoYXQgc2hvdWxk
IGJlIGdvb2QgZm9yCj4gPiB5b3UuCj4gPiAKPiAKPiBUaGUgZGV2X3BtX29wcF9vZl9hZGRfdGFi
bGUoKSB3aWxsIHByb2R1Y2UgYSBlcnJvciBtZXNzYWdlIHdoaWNoIGRvZXNuJ3QKPiBnaXZlIGEg
Y2x1ZSBhYm91dCB3aGF0J3Mgd3JvbmcsIGkuZS4gdGhhdCBkZXZpY2UtdHJlZSBuZWVkcyB0byBi
ZSB1cGRhdGVkLgoKSWYgeW91IHRoaW5rIHRoYXQgeW91IG5lZWQgdG8gcHJpbnQgc29tZXRoaW5n
IG1vcmUsIHRoZW4geW91IGNhbiBkbwp0aGF0IGluIHRoZSBlcnJvciBtZXNzYWdlIHlvdSBwcmlu
dCB3aGVuIGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKCkKZmFpbHMuIEkgd291bGQgc3VnZ2VzdCB0
byBkcm9wIHRoaXMgcmVkdW5kYW50IGNoZWNrIGhlcmUuCgotLSAKdmlyZXNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
