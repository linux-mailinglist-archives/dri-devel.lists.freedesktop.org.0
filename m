Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9B0B5516
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 20:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0B16ECB1;
	Tue, 17 Sep 2019 18:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400FE6ECB1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 18:14:47 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id b2so3889861otq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 11:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XSRRd5vWW2vpEVhgOqafpOwtu1MzJvFddnvMtX5f1Nk=;
 b=qXBXaP5wMcISv3Vs87gKCJeHgL6PepSbUIxkMpICkRJKQl8QaZR5fJ2vIE4JdnzCsK
 mu+VcTB089s9lar2Lvxjh3V6uEFjfd2O4atv/juDZB9c01QKJWbqRQlqmNn+MsbjbkIN
 T3dMDrEl1Mite5GhbJHenOxBxD3Uzkz+5hLCE/PPPo+X12LX36zi0GNHfD5w6ckpS4z6
 6M0YVP4xOghHvr8T5RIgqOXSRO1bcYggQYPpJ5P1NMCJ7hOo0pkQVGr8pofGOn78YkZJ
 21eoEbvaSsvj/+vjh4Fe/krWcSL5yfPZ0OJi3FNaQPxK9tTidDCGziaXLJJrsvtb0B50
 SUZA==
X-Gm-Message-State: APjAAAXz69k+NlfBRlTxJCvTxys5GrLATIBKqRQVztLusx3ui7qm9Fyl
 wSj7IuVttY/D15J0ATk2ZQ==
X-Google-Smtp-Source: APXvYqww8yJFPN4q1LhdZYjt+nN+vXnbu55jZRHBuSazrmBQs+/z3xJkghpDdj5UB0GrxG9TOlHVUQ==
X-Received: by 2002:a9d:d28:: with SMTP id 37mr110445oti.279.1568744086440;
 Tue, 17 Sep 2019 11:14:46 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 60sm347183oto.27.2019.09.17.11.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 11:14:45 -0700 (PDT)
Date: Tue, 17 Sep 2019 13:14:45 -0500
From: Rob Herring <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Message-ID: <20190917181445.GA2875@bogus>
References: <20190912213257.24147-1-andreas@kemnade.info>
 <20190912213257.24147-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190912213257.24147-2-andreas@kemnade.info>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, Andreas Kemnade <andreas@kemnade.info>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMiBTZXAgMjAxOSAyMzozMjo1NiArMDIwMCwgQW5kcmVhcyBLZW1uYWRlIHdyb3Rl
Ogo+IGFkZCBlbmFibGUtZ3Bpb3MgdG8gZGVzY3JpYmUgSFdFTiBwaW4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5pbmZvPgo+IEFja2VkLWJ5OiBE
YW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IC0tLQo+IGNoYW5n
ZXMgaW4gdjI6IGFkZGVkIGV4YW1wbGUKPiBjaGFuZ2VzIGluIHYzOiBhZGRlZCBBY2tlZC1ieQo+
IGNoYW5nZXMgaW4gdjQ6IG1vdmVkIGVuYWJsZS1ncGlvcyB0byB0aGUgcmlnaHQgcG9zaXRpb24K
PiAgIGluIHRoZSBleGFtcGxlCj4gIC4uLi9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBh
LWJhY2tsaWdodC55YW1sICAgICAgICAgICB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
