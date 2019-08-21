Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF3C98454
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 21:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC72D6E97F;
	Wed, 21 Aug 2019 19:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2C36E17E;
 Wed, 21 Aug 2019 19:26:04 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id k18so3169492otr.3;
 Wed, 21 Aug 2019 12:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=31kAASnlmey7+VCJviKm6PqV+O7d5lyZM9klemAH6PU=;
 b=qvKYiEvsHpIRt9rPwDJ/a6NSQeJx8H9Z63K6laTp7RDX5qzzhYh/5eqassAWj71WND
 J69MVUP6QU2VFBxxvrjrgVFyJHlnUfSDR1lbIldKxVtilWTvzZthwfr/DZlpkU5Oi3PL
 reYXXMTdqJZmHnLCNuEzM4NfViYDJOcO6iN/CFbXklxEaw7zkS4ATp95R4W4RZIaA/YF
 w/LWz5Sz/+xrre4nYVbxZTk8Di4XlYo15QM+SZJ+SkRRhMvORYoM7JPgDUbNMVVbdgk3
 F9FZrmqGTHaw7l9nboHtYa1zFHExClisLvSOZrIFMWI1Rxa9/ZsfklI+ZnzzpPrfj3pl
 YviA==
X-Gm-Message-State: APjAAAX4E+knPT0Hl4hwdXCTqvDHkEJ+HbRLwB3CckixxbYJDzbW2rfx
 Nlrzseiuyfh7fuSEcWWhPQ==
X-Google-Smtp-Source: APXvYqzOtUjL/X6asaAboZrcr1v3bqEPjWihsqkP7DwCext8H0Eiet7bQrEZgyN6a2WJGFJwVFXJmQ==
X-Received: by 2002:a9d:68d1:: with SMTP id i17mr14908615oto.84.1566415563945; 
 Wed, 21 Aug 2019 12:26:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e22sm5992200oii.7.2019.08.21.12.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 12:26:03 -0700 (PDT)
Date: Wed, 21 Aug 2019 14:26:02 -0500
From: Rob Herring <robh@kernel.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: display: msm: gmu: add optional
 ocmem property
Message-ID: <20190821192602.GA16243@bogus>
References: <20190806002229.8304-1-masneyb@onstation.org>
 <20190806002229.8304-3-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806002229.8304-3-masneyb@onstation.org>
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDg6MjI6MjRQTSAtMDQwMCwgQnJpYW4gTWFzbmV5IHdy
b3RlOgo+IFNvbWUgQTN4eCBhbmQgQTR4eCBBZHJlbm8gR1BVcyBkbyBub3QgaGF2ZSBHTUVNIGlu
c2lkZSB0aGUgR1BVIGNvcmUgYW5kCj4gbXVzdCB1c2UgdGhlIE9uIENoaXAgTUVNb3J5IChPQ01F
TSkgaW4gb3JkZXIgdG8gYmUgZnVuY3Rpb25hbC4gQWRkIHRoZQo+IG9wdGlvbmFsIG9jbWVtIHBy
b3BlcnR5IHRvIHRoZSBBZHJlbm8gR3JhcGhpY3MgTWFuYWdlbWVudCBVbml0IGJpbmRpbmdzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgo+
IC0tLQo+IENoYW5nZXMgc2luY2UgdjQ6Cj4gLSBOb25lCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MzoK
PiAtIGNvcnJlY3QgbGluayB0byBxY29tLG9jbWVtLnlhbWwKPiAKPiBDaGFuZ2VzIHNpbmNlIHYy
Ogo+IC0gQWRkIGEzeHggZXhhbXBsZSB3aXRoIE9DTUVNCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MToK
PiAtIE5vbmUKPiAKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4
dCAgIHwgNTAgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tc20vZ211LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21zbS9nbXUudHh0Cj4gaW5kZXggOTBhZjViMGE1NmE5Li42NzJkNTU3Y2FiYTQg
MTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bXNtL2dtdS50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tc20vZ211LnR4dAo+IEBAIC0zMSw2ICszMSwxMCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVz
Ogo+ICAtIGlvbW11czogcGhhbmRsZSB0byB0aGUgYWRyZW5vIGlvbW11Cj4gIC0gb3BlcmF0aW5n
LXBvaW50cy12MjogcGhhbmRsZSB0byB0aGUgT1BQIG9wZXJhdGluZyBwb2ludHMKPiAgCj4gK09w
dGlvbmFsIHByb3BlcnRpZXM6Cj4gKy0gb2NtZW06IHBoYW5kbGUgdG8gdGhlIE9uIENoaXAgTWVt
b3J5IChPQ01FTSkgdGhhdCdzIHByZXNlbnQgb24gc29tZSBTbmFwZHJhZ29uCj4gKyAgICAgICAg
IFNvQ3MuIFNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3JhbS9xY29tLG9j
bWVtLnlhbWwuCgpTaWdoLCB0byByZXBlYXQgbXkgY29tbWVudCBvbiB2MSBhbmQgdjM6CgpXZSBh
bHJlYWR5IGhhdmUgYSBjb3VwbGUgb2Ygc2ltaWxhciBwcm9wZXJ0aWVzLiBMZXRzIHN0YW5kYXJk
aXplIG9uCidzcmFtJyBhcyB0aGF0IGlzIHdoYXQgVEkgYWxyZWFkeSB1c2VzLgoKUm9iCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
