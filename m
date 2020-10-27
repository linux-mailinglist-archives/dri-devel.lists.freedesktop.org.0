Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E2E29CEC4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E9E6EC66;
	Wed, 28 Oct 2020 08:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFB06EC20
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:23:25 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h6so3835782lfj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OFeC1CtOzMgLJVc4bc3YLVqRdX5EEq2f1kDG30jsGew=;
 b=GsGzkw+whcBAy310+2NrYkyda+y5HtVgZPLk6L2HtDsITYHr7DvjGFng3ghy3fucRc
 TRX8olu54JANer1GN2PQ+aZQrLRSrLeo95uRegPlAhUZ4PnMEntVwjbW7/txByf8iUbt
 mz9ELt5DSMp+MZAWlbY/30OKQkPBPldk372ta8ur5OUSa9KV/KcVTCEQpIMgyAgWPz0A
 V6LYL0RQmBMrpigUrfMzFShDXlUUP4ecqD0sC4+nulvQOSyBsz8q7XhLhQ/1EIfhXdww
 OXf/pPWqx7zZtO62GMvNICWKwNuPriPaaqb68xMAp/bT/QAM58yl7rpPO7R2GjGCDWmr
 k3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OFeC1CtOzMgLJVc4bc3YLVqRdX5EEq2f1kDG30jsGew=;
 b=WfaT1/jHvS1TqcGG3aSG+LZiGE2+trRb2me8IKur/D//iK9YK+7OLWGcvCeJ/NyPKr
 v108DbvwxqwRI8IKUJdjOABbemOpCdNx4hjfaZITGq/sPyY0E06gud5fC7igmRfsbSkD
 rKEj777jGpI1xmsFH651yFM3K1cg3FODZBas6/nXrqt+W/969eIEdfVXILKEMoZfp77m
 8Rn5B6LpwuJA1DAncCZ2O5u+S/uHr6+3+Z74Ostc9gCPXjlayTGn42LhwGQ7VHJlBevN
 7bCnzf1Jk37jT9oK3+1FHzrrAGakF8J5ta4JniOYknNXHrVNuZNIwSVE28dPFfw7tp0n
 WW6Q==
X-Gm-Message-State: AOAM530vL8Xf7RchYa1SUoE6pEla/Rd+mLAhYUudsfBy2EDYKNwyuNqM
 u3NzvGVbMlk3hx+UwIVCi8w=
X-Google-Smtp-Source: ABdhPJx10YPJeQ857EsWYyVLQuMavOWrFwdTDPW1oJMMHhLrhJH9XKs2nZRmDYuSHJ4+oAxFeZALRw==
X-Received: by 2002:a19:3f52:: with SMTP id m79mr1323112lfa.58.1603826604035; 
 Tue, 27 Oct 2020 12:23:24 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id z14sm287943lji.84.2020.10.27.12.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 12:23:23 -0700 (PDT)
Subject: Re: [PATCH v6 08/52] dt-bindings: memory: tegra20: emc: Document
 mfd-simple compatible and statistics sub-device
To: Thierry Reding <thierry.reding@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-9-digetx@gmail.com> <20201027132241.GG1822510@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0a619270-b301-4eeb-6216-0ad5fed6a20a@gmail.com>
Date: Tue, 27 Oct 2020 22:23:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027132241.GG1822510@ulmo>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAxNjoyMiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBNb24sIE9j
dCAyNiwgMjAyMCBhdCAwMToxNjo1MUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IEV4dGVybmFsIE1lbW9yeSBDb250cm9sbGVyIGNhbiBnYXRoZXIgdmFyaW91cyBoYXJkd2FyZSBz
dGF0aXN0aWNzIHRoYXQKPj4gYXJlIGludGVuZGVkIHRvIGJlIHVzZWQgZm9yIGRlYnVnZ2luZyBw
dXJwb3NlcyBhbmQgZm9yIGR5bmFtaWMgZnJlcXVlbmN5Cj4+IHNjYWxpbmcgb2YgbWVtb3J5IGJ1
cy4KPj4KPj4gRG9jdW1lbnQgdGhlIG5ldyBtZmQtc2ltcGxlIGNvbXBhdGlibGUgYW5kIEVNQyBz
dGF0aXN0aWNzIHN1Yi1kZXZpY2UuCj4+IFRoZSBzdWJkZXYgY29udGFpbnMgRU1DIERGUyBPUFAg
dGFibGUgYW5kIGludGVyY29ubmVjdCBwYXRocyB0byBiZSB1c2VkCj4+IGZvciBkeW5hbWljIHNj
YWxpbmcgb2Ygc3lzdGVtJ3MgbWVtb3J5IGJhbmR3aWR0aCBiYXNlZCBvbiBFTUMgdXRpbGl6YXRp
b24KPj4gc3RhdGlzdGljcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxk
aWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4gIC4uLi9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlh
LHRlZ3JhMjAtZW1jLnR4dCB8IDQzICsrKysrKysrKysrKysrKysrLS0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCA0MCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IFdoeSBkb2VzIHRoaXMg
aGF2ZSB0byBiZSBtb2RlbGxlZCBhcyBhIHNlcGFyYXRlIGRldmljZT8gSXNuJ3QgdGhpcyBqdXN0
Cj4gdXNpbmcgYSBjb3VwbGUgb2YgcmVnaXN0ZXJzIG91dCBvZiB0aGUgRU1DIHJlZ2lzdGVyIHJh
bmdlPyBJZiBzbywgdGhpcwo+IHdvdWxkIGJldHRlciBqdXN0IGJlIGludGVncmF0ZWQgaW50byB0
aGUgcGFyZW50IG5vZGUgYW5kIGltcGxlbWVudGVkIGFzCj4gcGFydCBvZiB0aGUgRU1DIGRyaXZl
ci4gTm8gbmVlZCB0byBmdXJ0aGVyIGNvbXBsaWNhdGUgdGhpbmdzIGJ5IGFkZGluZwo+IGEgZHVt
bXkgY2hpbGQuCgpNYXliZSB0cnVlLCBJJ2xsIHRha2UgYSBjbG9zZXIgbG9vay4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
