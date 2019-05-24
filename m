Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8D62A0BC
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 23:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C536E0B3;
	Fri, 24 May 2019 21:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725816E0B3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 21:55:51 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id l17so10042207otq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 14:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1Hd5HUE8FtAVIHZ0zOMuprsDH1qucHlAidVwNXNR0kE=;
 b=VdUNvV8AcTlHhJPs/jraV/R8bOy+kSYMip4wJQHksdKuE1Yjd7oZ6BNl/zzkCP1HRw
 jG1zF0Yw/6u1QXXMJJfTC/qy2BJL4O76ASu4GrXaj02YON8aH/xy8RLYD+eohUsny9oy
 ShljP28Gk4oC0Hn681YJjxX2WsKi63tO/hTk5uKft+cMRpKau6OB6+Oabf+NmrjAcZJk
 kEyCi7Q98PXZXc4u7oBLlxk/SL/7+WVjHX6K2hCexpuk7KLo+/ekNWJWHcAcvHCeKSGM
 vuUuLa3DYMBb9nQGYYjI1RmVYaWE/1j7g0v5VDglfDi/S25kE+rtBMISpi+txy1O2ucT
 SsUw==
X-Gm-Message-State: APjAAAVNYWxuAIEhjBVX6aXiUkWfVFbsC2FF8oQ87ezpI1r9s4DT4gMP
 rTixThfFQ6BAbf9JhDOIyw==
X-Google-Smtp-Source: APXvYqx38nwGxFFCwmvC358jGtt2sCWNYPbMOthN/1AGAmXZzhMX9GG7akLemxmhb6zk5JKBh2ArBw==
X-Received: by 2002:a9d:6312:: with SMTP id q18mr14150968otk.45.1558734950429; 
 Fri, 24 May 2019 14:55:50 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b25sm1193569otq.65.2019.05.24.14.55.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 14:55:49 -0700 (PDT)
Date: Fri, 24 May 2019 16:55:49 -0500
From: Rob Herring <robh@kernel.org>
To: megous@megous.com
Subject: Re: [PATCH v5 4/6] dt-bindings: display: hdmi-connector: Support DDC
 bus enable
Message-ID: <20190524215549.GA13928@bogus>
References: <20190520235009.16734-1-megous@megous.com>
 <20190520235009.16734-5-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520235009.16734-5-megous@megous.com>
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

T24gVHVlLCAyMSBNYXkgMjAxOSAwMTo1MDowNyArMDIwMCwgbWVnb3VzQG1lZ291cy5jb20gd3Jv
dGU6Cj4gRnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+Cj4gCj4gU29tZSBB
bGx3aW5uZXIgU29DIHVzaW5nIGJvYXJkcyAoT3JhbmdlIFBpIDMgZm9yIGV4YW1wbGUpIG5lZWQg
dG8gZW5hYmxlCj4gb24tYm9hcmQgdm9sdGFnZSBzaGlmdGluZyBsb2dpYyBmb3IgdGhlIEREQyBi
dXMgdXNpbmcgYSBncGlvIHRvIGJlIGFibGUKPiB0byBhY2Nlc3MgRERDIGJ1cy4gVXNlIGRkYy1l
bi1ncGlvcyBwcm9wZXJ0eSBvbiB0aGUgaGRtaS1jb25uZWN0b3IgdG8KPiBtb2RlbCB0aGlzLgo+
IAo+IEFkZCBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIG9wdGlvbmFsIGRkYy1lbi1ncGlvcyBw
cm9wZXJ0eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3Vz
LmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9jb25uZWN0b3Iv
aGRtaS1jb25uZWN0b3IudHh0ICAgICB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
