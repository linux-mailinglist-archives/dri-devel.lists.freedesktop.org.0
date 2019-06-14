Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6D7452DF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 05:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F4D89307;
	Fri, 14 Jun 2019 03:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8AA89307
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 03:24:43 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id k8so1281627edr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AfQZDv35ufBp3E88y1iMFldBKX1WcqrUozmSOVMRmA=;
 b=pZlZO+BYVICW6zdLeZ2wDjmdf59lJp+BNfUPhed8A7Ef8+8VzI4MCUb1YTfWBO+eCW
 Hg4/vYPPaVC6YOZVJH32Uhht8nwfDwPPQEJxjNfrn9AfKrjkJlfuh49PNaQZUoCI6DjK
 F45ZRzmTAMo8X5tv9J5vpV6el9JXKjewwtX9MgvjAvR+Zk2n7a7jELsbZ9y1vPz8Wa1z
 cusIuxkdi0MofQmuBgm8bHEwVBlb+Fr1/EKOm+5LTuyQ45RJ8MylWcy8f39R6k/5Ux2a
 JB6HVTgmvx7g0ESM9NsiZGCBgcQ9lyTQZHSsLIEYBKdc9BTA0/UObmzfxFA+ajlUPJmV
 FDyA==
X-Gm-Message-State: APjAAAUDRC87tkpPnsb22YaI8ilXXacMyGFkYK8pUI/lE3YnLSb4Vbt2
 i2iDms641VPuT10guDr/lryxdPybcrk=
X-Google-Smtp-Source: APXvYqw1JE45TH1K2t5QbRaPyQYDRuophKbluCTsxoq0ctQAwQTrKKmseclEyHub/cvjp3tS0tyeuQ==
X-Received: by 2002:a17:906:1306:: with SMTP id
 w6mr27351091ejb.2.1560482682262; 
 Thu, 13 Jun 2019 20:24:42 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id hk1sm322290ejb.36.2019.06.13.20.24.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 20:24:41 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id v14so891661wrr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:24:41 -0700 (PDT)
X-Received: by 2002:adf:fc85:: with SMTP id g5mr62039461wrr.324.1560482681552; 
 Thu, 13 Jun 2019 20:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-5-jagan@amarulasolutions.com>
In-Reply-To: <20190613185241.22800-5-jagan@amarulasolutions.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 14 Jun 2019 11:24:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v67eNu31pQExMTxAki1Wp4tdqRH87Oh+1j4Cb0cuK8pQRQ@mail.gmail.com>
Message-ID: <CAGb2v67eNu31pQExMTxAki1Wp4tdqRH87Oh+1j4Cb0cuK8pQRQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm/sun4i: tcon_top: Use clock name index macros
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMjo1NCBBTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBUQ09OIFRPUCBtdXggYmxvY2tzIGluIFI0MCBhcmUg
cmVnaXN0ZXJpbmcgY2xvY2sgdXNpbmcKPiB0Y29uIHRvcCBjbG9jayBpbmRleCBudW1iZXJzLgo+
Cj4gUmlnaHQgbm93IHRoZSBjb2RlIGlzIHVzaW5nLCByZWFsIG51bWJlcnMgc3RhcnQgd2l0aCAw
LCBidXQKPiB3ZSBoYXZlIHByb3BlciBtYWNyb3MgdGhhdCBkZWZpbmVkIHRoZXNlIG5hbWUgaW5k
ZXggbnVtYmVycy4KPgo+IFVzZSB0aGUgZXhpc3RpbmcgbWFjcm9zLCBpbnN0ZWFkIG9mIHJlYWwg
bnVtYmVycyBmb3IgbW9yZQo+IGNvZGUgcmVhZGFiaWxpdHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
YWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KClJldmlld2VkLWJ5OiBDaGVu
LVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+CgpIb3dldmVyLCB5b3UgbWlnaHQgd2FudCB0byByZW5h
bWUgdGhlIGNsb2NrIGZpcnN0LCB0aGVuIHN3aXRjaCB0bwp1c2luZyB0aGUgaW5kZXggbWFjcm9z
PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
