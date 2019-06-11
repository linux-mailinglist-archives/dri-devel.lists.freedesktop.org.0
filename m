Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F264172E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 23:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E05D891F2;
	Tue, 11 Jun 2019 21:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF4C891F2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 21:52:10 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d23so16480532qto.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3r12qJQBXAuvMT4EwoDNzavCtWYu4iRZchiufeeQkDA=;
 b=Pp0M67rsJAa/OW7ZqOCMFECnngjkAjtjnSx43BCpWmBF1yi59EQ0w1bj/k8lNtbVE2
 yHSnqwbRFAywQW52dQ7HsQAkxXLCCwC77/ZpLxbAkuwpNrDQn+JF2c/jSU50UbRi4C0n
 UcgkIwoW13sQ3jb5766o7s1gOLatLSlIeMwfysgQ+9fS5wcioWXOLmgN/pOZ1cP3aScy
 8hJ4szN+cYmRReKlApwdnVU/c/zqfhnmgbUAjh+ZBnbS2UCtlXzjiS6Ogy1dOCTuKSx9
 9NhhcwUFG7zqUVtUagUXVOA/LvVFu03Bf6NDq1KZIynPI9FbBuE9d31M2GIDxJbSN4Sh
 UUbA==
X-Gm-Message-State: APjAAAVunhC3k8ol/f+sponZ/kv2VHLWN6OG4sk2Ravod8b10niigUpE
 LbWqSXwrg1Y4fzYGgo/MWA==
X-Google-Smtp-Source: APXvYqwYg7O90+eWMBJqzuTqXctWOHI40/oJ0GPlNFDUVF6CgMDfl7e03c/8RDgTcCt1Q9vjJvfAkA==
X-Received: by 2002:a0c:b997:: with SMTP id v23mr62799346qvf.128.1560289929520; 
 Tue, 11 Jun 2019 14:52:09 -0700 (PDT)
Received: from localhost ([64.188.179.199])
 by smtp.gmail.com with ESMTPSA id j26sm8645067qtj.70.2019.06.11.14.52.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 14:52:09 -0700 (PDT)
Date: Tue, 11 Jun 2019 15:52:06 -0600
From: Rob Herring <robh@kernel.org>
To: megous@megous.com
Subject: Re: [PATCH v6 4/6] dt-bindings: display: hdmi-connector: Support DDC
 bus enable
Message-ID: <20190611215206.GA17759@bogus>
References: <20190527162237.18495-1-megous@megous.com>
 <20190527162237.18495-5-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527162237.18495-5-megous@megous.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Ondrej Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyNyBNYXkgMjAxOSAxODoyMjozNSArMDIwMCwgbWVnb3VzQG1lZ291cy5jb20gd3Jv
dGU6Cj4gRnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+Cj4gCj4gU29tZSBB
bGx3aW5uZXIgU29DIHVzaW5nIGJvYXJkcyAoT3JhbmdlIFBpIDMgZm9yIGV4YW1wbGUpIG5lZWQg
dG8gZW5hYmxlCj4gb24tYm9hcmQgdm9sdGFnZSBzaGlmdGluZyBsb2dpYyBmb3IgdGhlIEREQyBi
dXMgdXNpbmcgYSBncGlvIHRvIGJlIGFibGUKPiB0byBhY2Nlc3MgRERDIGJ1cy4gVXNlIGRkYy1l
bi1ncGlvcyBwcm9wZXJ0eSBvbiB0aGUgaGRtaS1jb25uZWN0b3IgdG8KPiBtb2RlbCB0aGlzLgo+
IAo+IEFkZCBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIG9wdGlvbmFsIGRkYy1lbi1ncGlvcyBw
cm9wZXJ0eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3Vz
LmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9jb25uZWN0b3Iv
aGRtaS1jb25uZWN0b3IudHh0ICAgICB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKClBsZWFzZSBhZGQgQWNrZWQtYnkvUmV2aWV3ZWQtYnkgdGFncyB3aGVuIHBvc3Rp
bmcgbmV3IHZlcnNpb25zLiBIb3dldmVyLAp0aGVyZSdzIG5vIG5lZWQgdG8gcmVwb3N0IHBhdGNo
ZXMgKm9ubHkqIHRvIGFkZCB0aGUgdGFncy4gVGhlIHVwc3RyZWFtCm1haW50YWluZXIgd2lsbCBk
byB0aGF0IGZvciBhY2tzIHJlY2VpdmVkIG9uIHRoZSB2ZXJzaW9uIHRoZXkgYXBwbHkuCgpJZiBh
IHRhZyB3YXMgbm90IGFkZGVkIG9uIHB1cnBvc2UsIHBsZWFzZSBzdGF0ZSB3aHkgYW5kIHdoYXQg
Y2hhbmdlZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
