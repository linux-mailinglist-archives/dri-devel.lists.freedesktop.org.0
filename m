Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C53F54A0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 20:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390266FA67;
	Fri,  8 Nov 2019 19:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9026FA67
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 19:44:16 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9628E207FA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 19:44:16 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id z16so6337742qkg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 11:44:16 -0800 (PST)
X-Gm-Message-State: APjAAAVrqXbG27QJWF+MtJ+Y0Ln0KadSMWuTh5dz1lmEtiOI15jxli1u
 5IWk3X/EtjYPD0CRymjRfB+ehC9dJBNhSPymvw==
X-Google-Smtp-Source: APXvYqyR6InH9U1ZQNnYFe7R+4+AwlzcFwQE6za+shn0A87ntD07L+I+SdXpy/7+IQlPo5d/oHQ/KPeWmY3Qvb44P8w=
X-Received: by 2002:a05:620a:205d:: with SMTP id
 d29mr10922713qka.152.1573242255720; 
 Fri, 08 Nov 2019 11:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20191108175935.29766-1-laurent.pinchart@ideasonboard.com>
 <20191108175935.29766-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20191108175935.29766-2-laurent.pinchart@ideasonboard.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 8 Nov 2019 13:44:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKiQGmMsDkk6WQZU2Q4TfuXfDqMp-iUs62t23dfqpxdBg@mail.gmail.com>
Message-ID: <CAL_JsqKiQGmMsDkk6WQZU2Q4TfuXfDqMp-iUs62t23dfqpxdBg@mail.gmail.com>
Subject: Re: [PATCH v10 1/4] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573242256;
 bh=CYTJ8EkCmbONgQ+gSSZpuuJnZdhj19ctWYnfS2790fg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K+fxwtzo8kpieI4ckDvG09ctQMVNVdEg2xHB6uGY8qoO16+TkaclAEXMknvQzSUhq
 T3gSkB2Srrtw+5R9AQEV7M7kTzvgWSG1jueqvZSFRDSzfl/rvrm1m4T2PFpdY0Mbti
 QTkLucRcdrqqJoD9VNV4Ydvnp5SG6zMsQOELwQm4=
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
Cc: devicetree@vger.kernel.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgOCwgMjAxOSBhdCAxMTo1OSBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogSHl1biBLd29uIDxo
eXVuLmt3b25AeGlsaW54LmNvbT4KPgo+IFRoZSBiaW5kaW5ncyBkZXNjcmliZSB0aGUgWnlucU1Q
IERQIHN1YnN5c3RlbS4gVGhleSBkb24ndCBzdXBwb3J0IHRoZQo+IGludGVyZmFjZSB3aXRoIHRo
ZSBwcm9ncmFtbWFibGUgbG9naWMgKEZQR0EpIG9yIGF1ZGlvIHlldC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEh5dW4gS3dvbiA8aHl1bi5rd29uQHhpbGlueC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IC0tLQo+
IENoYW5nZXMgc2luY2Ugdjk6Cj4KPiAtIEZpeCBjb25zdHJhaW50cyBvbiBjbG9jay1uYW1lcwo+
IC0gRG9jdW1lbnQgZHBfYXBiX2NsayBhcyB0aGUgQVBCIGNsb2NrLCBub3QgdGhlIEFYSSBjbG9j
awo+Cj4gQ2hhbmdlcyBzaW5jZSB2ODoKPgo+IC0gQ29udmVydCB0byB5YW1sCj4gLSBSZW5hbWUg
YWNsayB0byBkcF9hcGJfY2xrCj4gLS0tCj4gIC4uLi9kaXNwbGF5L3hsbngveGxueCx6eW5xbXAt
ZHBzdWIueWFtbCAgICAgICB8IDE2NCArKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDE2NCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS94bG54L3hsbngsenlucW1wLWRwc3ViLnlhbWwK
ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
