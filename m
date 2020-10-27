Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2101829C92B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 20:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26716E081;
	Tue, 27 Oct 2020 19:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15E26E081
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:45:02 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id v19so2687528edx.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UXr3lQx2eUfq+7HOUXuSZyZipQWceSUVylQzeIR2XHY=;
 b=g5wVkv2tm5SqM9klllZJsHlTPGrryDittWfmg/IC58N1ug4ChXbNSaphZkW7dhXrwT
 GR1TkSXnc9+fZ/bmJmRgb2RVjcRlCgAiziiOm7h5YhjFq5vL1KadlVmsKBXD+8P7U1AT
 8FOcMbgtRlAuj56CWEFoyw1ovXbtyiFUPG2Rp5RuRrpS6lxETAImtIcM5g8Tkub7yRLo
 Gkq+7z2fYg/YlOHN7FuGBfpEqknb30yYu1i/aWoInZ0Qlfs6IHz8iTqB8WxTSKNaSoII
 +9dzLpVf3TLLy2mZQH7zpcy+QcrC1uljAZzAQXfo/L1osoUCEvrSYTIHps8fkS61iyRz
 ngDw==
X-Gm-Message-State: AOAM533vrkkY4nN8VhdKiwO69N14p/Bml6tcQRDsUupfY0WcORzcUX/o
 +kRjpE/lJovpoLgqc4xDPAo=
X-Google-Smtp-Source: ABdhPJwaxWnGgOULlhmBmWWDlDdWjWRSKpmgBSzdn7UsD1QIbybKhpRsl5k1KJK25+ecpRYHlVMGNQ==
X-Received: by 2002:a05:6402:187:: with SMTP id
 r7mr3826580edv.360.1603827901570; 
 Tue, 27 Oct 2020 12:45:01 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id bx24sm1609885ejb.51.2020.10.27.12.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:44:59 -0700 (PDT)
Date: Tue, 27 Oct 2020 20:44:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 08/52] dt-bindings: memory: tegra20: emc: Document
 mfd-simple compatible and statistics sub-device
Message-ID: <20201027194457.GD140636@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-9-digetx@gmail.com>
 <20201027090212.GG4244@kozik-lap>
 <1cce314a-1eab-61c9-099d-54f987b03761@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cce314a-1eab-61c9-099d-54f987b03761@gmail.com>
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

T24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMTA6MjI6MTlQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI3LjEwLjIwMjAgMTI6MDIsIEtyenlzenRvZiBLb3psb3dza2kg0L/QuNGI0LXR
gjoKPiA+PiBAQCAtMzEsMTcgKzMyLDM0IEBAIEV4YW1wbGU6Cj4gPj4gIAkJLi4uCj4gPj4gIAl9
Owo+ID4+ICAKPiA+PiArCWVtY19id19kZnNfb3BwX3RhYmxlOiBlbWNfb3BwX3RhYmxlMSB7Cj4g
PiBIeXBoZW5zIGZvciBub2RlIG5hbWUuCj4gCj4gV2UgYWxyZWFkeSB1c2UgdW5kZXJzY29yZXMg
Zm9yIHRoZSBUZWdyYSBDUFUgT1BQIHRhYmxlLgo+IAo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y1LjEwLXJjMS9zb3VyY2UvYXJjaC9hcm0vYm9vdC9kdHMvdGVncmEyMC1jcHUt
b3BwLmR0c2kjTDQKPiAKPiBXaGF0IG1ha2VzIHlvdSB0aGluayB0aGF0IGh5cGhlbnMgd2lsbCBi
ZSBhIGJldHRlciBjaG9pY2U/IElzIGl0IGEKPiBkb2N1bWVudGVkIG5hbWluZyBjb252ZW50aW9u
PwoKVW5mb3J0dW5hdGVseSB0aGF0J3MgdGhlIHNvdXJjZSBvZiBjb25mdXNpb24gYWxzbyBmb3Ig
bWUgYmVjYXVzZQpEZXZpY2V0cmVlIHNwZWMgbWVudGlvbnMgYm90aCBvZiB0aGVtIChhbmQgZG9l
cyBub3Qgc3BlY2lmeSBwcmVmZXJlbmNlcykuCgpUaGUgY2hvaWNlIG9mIGRhc2hlcy9oeXBoZW5z
IGNvbWVzIG5vdyBleHBsaWNpdGx5IGZyb20gYWxsIGR0c2NoZW1hCmZpbGVzLiAgUHJldmlvdXNs
eSwgdGhlIGRvY3VtZW50YXRpb24gd2VyZSBlbWFpbHMgZnJvbSBSb2IuIDopCgpCZXN0IHJlZ2Fy
ZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
