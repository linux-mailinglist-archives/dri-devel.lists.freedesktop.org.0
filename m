Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804081952E8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 09:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7B56E06B;
	Fri, 27 Mar 2020 08:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F376E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 08:31:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f6so4769910wmj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 01:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/8e1khbt3xy4ZUf34DU6Fxze93y8M47+3udr0iQSRsI=;
 b=LHWAWHzmrgJi6sjgnjoGfbv7/nunVx19vgyHo/Iys+J47ldqjn8fGNWukWARkju+5I
 vxbxj1NSvZ3VbfxweyHPqh6Dl1Ho/ppvvxSzYAun432P1qgCZD6dOCKJFmKI6uwd6wc0
 o5bjDLooHalwWV9R8YtQ62qyeotsUIkiZl85Z4bpwT5LcRPhRZZXVI8vDevR0jT6RL/A
 dNFry0CzpNV4ae7f5kjFirmvM+Lw7yrn81OFB0G15fzV2kHfMmi9DVpiOd4BQsfTBM74
 jIUN9CTbrlLpgMk3oecrzVR0NLzrIAKFVi7HJ2Yuxpy5IyW5hHCabCi2m9dSFDAUUPsP
 N1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/8e1khbt3xy4ZUf34DU6Fxze93y8M47+3udr0iQSRsI=;
 b=dmk/mNET24pRISo9uKhXGGjVSTp/HYfXxVYArAE7lO+TdGE4xyRwu7wE26vkCtvuvg
 QErnJnnqDVqZtWPOU+ZiEQLVCCobm0NhDNyr3xOpleYgIxr9esl35+EN+VV11K27zsKe
 nXOmmKFOGPmStjhRi1PuJK/9USGEWalFGDS4aUxartDZQZ96576ZUfHPz+C9H+DzqYMo
 ZqGY/ddv+3W/W5l8jvVSnchEGu8U5Zh/Y15/qQwg5YtlQK6rm4if2yrdtiwHCOs8379J
 EESSNeIJGu5jfdJTIaMhdj0aKoMm/H2W3R5J5teCurdiPlUQefgQUOXs09PeN8wLa6J5
 yU2w==
X-Gm-Message-State: ANhLgQ2/elVrofHldX0gh302KhJkzarjKs1ulCSUCbL8ckbOBrmAwYVl
 D+HkTmngfsS+40AKmOpKddaqyg==
X-Google-Smtp-Source: ADFU+vshlFLkzjFGLqZWToyKEwofbRxD/jsH8lC+uHzFVX7qI4umf//ndsbal5w8KkGL0SIvWV2zCg==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr4129403wma.158.1585297917089; 
 Fri, 27 Mar 2020 01:31:57 -0700 (PDT)
Received: from dell ([95.149.164.95])
 by smtp.gmail.com with ESMTPSA id w67sm7008731wmb.41.2020.03.27.01.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 01:31:56 -0700 (PDT)
Date: Fri, 27 Mar 2020 08:32:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: Clean-up schema errors due to missing
 'addtionalProperties: false'
Message-ID: <20200327083246.GJ603801@dell>
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-4-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325220542.19189-4-robh@kernel.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-clk@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hartmut Knaack <knaack.h@gmx.de>, linux-media@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNSBNYXIgMjAyMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IE51bWVyb3VzIHNjaGVt
YXMgYXJlIG1pc3NpbmcgJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZScgc3RhdGVtZW50cyB3
aGljaAo+IGVuc3VyZXMgYSBiaW5kaW5nIGRvZXNuJ3QgaGF2ZSBhbnkgZXh0cmEgdW5kb2N1bWVu
dGVkIHByb3BlcnRpZXMgb3IgY2hpbGQKPiBub2Rlcy4gRml4aW5nIHRoaXMgcmV2ZWFscyB2YXJp
b3VzIG1pc3NpbmcgcHJvcGVydGllcywgc28gbGV0J3MgZml4IGFsbAo+IHRob3NlIG9jY3VycmVu
Y2VzLgo+IAo+IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4gQ2M6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBDYzogQmFydG9zeiBHb2xhc3pl
d3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiBDYzogTWFzYWhpcm8gWWFtYWRhIDx5
YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiBDYzogSm9uYXRoYW4gQ2FtZXJvbiA8amlj
MjNAa2VybmVsLm9yZz4KPiBDYzogSGFydG11dCBLbmFhY2sgPGtuYWFjay5oQGdteC5kZT4KPiBD
YzogTGFycy1QZXRlciBDbGF1c2VuIDxsYXJzQG1ldGFmb28uZGU+Cj4gQ2M6IFBldGVyIE1lZXJ3
YWxkLVN0YWRsZXIgPHBtZWVyd0BwbWVlcncubmV0Pgo+IENjOiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhh
YkBrZXJuZWwub3JnPgo+IENjOiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgo+
IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IENjOiAiRGF2aWQgUy4gTWls
bGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KPiBDYzogTGlhbSBHaXJkd29vZCA8bGdpcmR3b29k
QGdtYWlsLmNvbT4KPiBDYzogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+IENjOiBH
dWlsbGF1bWUgTGEgUm9xdWUgPGdsYXJvcXVlQGJheWxpYnJlLmNvbT4KPiBDYzogWmhhbmcgUnVp
IDxydWkuemhhbmdAaW50ZWwuY29tPgo+IENjOiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNh
bm9AbGluYXJvLm9yZz4KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
Cj4gQ2M6IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtZ3Bpb0B2Z2VyLmtl
cm5lbC5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtaWlvQHZnZXIua2Vy
bmVsLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcKPiBD
YzogbGludXgtcG1Admdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2sv
ZnNsLHBsbGRpZy55YW1sIHwgIDMgKysrCj4gIC4uLi9ncGlvL3NvY2lvbmV4dCx1bmlwaGllci1n
cGlvLnlhbWwgICAgICAgICB8ICAyICsrCj4gIC4uLi9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlm
cm9zdC55YW1sICAgICAgICB8ICA2ICsrLS0tCj4gIC4uLi9iaW5kaW5ncy9ncHUvYXJtLG1hbGkt
bWlkZ2FyZC55YW1sICAgICAgICB8ICAzICsrKwo+ICAuLi4vYmluZGluZ3MvaWlvL2FkYy9hZGks
YWQ3MTkyLnlhbWwgICAgICAgICAgfCAgMSAtCj4gIC4uLi9iaW5kaW5ncy9paW8vcHJlc3N1cmUv
Ym1wMDg1LnlhbWwgICAgICAgICB8ICAzICsrKwo+ICAuLi4vbWVkaWEvYW1sb2dpYyxtZXNvbi1n
eC1hby1jZWMueWFtbCAgICAgICAgfCAgOSArKysrKy0tLQoKPiAgLi4uL2JpbmRpbmdzL21mZC9y
b2htLGJkNzE4MjgtcG1pYy55YW1sICAgICAgIHwgIDMgKysrCgpBY2tlZC1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJv
IFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
