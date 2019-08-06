Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA91834B3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 17:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488226E3C1;
	Tue,  6 Aug 2019 15:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F796E3C1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 15:06:49 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4B9C20C01
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 15:06:48 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id t8so63122595qkt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 08:06:48 -0700 (PDT)
X-Gm-Message-State: APjAAAU5Oq6VCnDBV7otEYfjGUVe5GyKi3VWyTHe7gI3GA3EJY3Rh22J
 UWF12MOCeYMifcDk+Dh/LG9tH+TbOf6fntZpvQ==
X-Google-Smtp-Source: APXvYqwskMcAR/Gsy/TuAZnM+fL3o5yfNberLPPVu7PiOwhuQEN3u4auDF91Qxvn22wdqNF9i/GNEobuyrXTHoTDJJE=
X-Received: by 2002:a37:a48e:: with SMTP id n136mr3748098qke.223.1565104007836; 
 Tue, 06 Aug 2019 08:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190806124416.15561-1-narmstrong@baylibre.com>
 <20190806124416.15561-2-narmstrong@baylibre.com>
In-Reply-To: <20190806124416.15561-2-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 6 Aug 2019 09:06:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZoS-nsH56BdcUYe-4sw1=ESZJH_3S2Y0mMwT701wuyw@mail.gmail.com>
Message-ID: <CAL_JsqKZoS-nsH56BdcUYe-4sw1=ESZJH_3S2Y0mMwT701wuyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: amlogic,meson-dw-hdmi:
 convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565104008;
 bh=dCfRxSTdrclRoNkv/xjg9SIPiioXv6oSzqoCo0lY4ek=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=01L8WhCkW8n+jhUFCT8+O5Ij4fFbVH+cRrQSdmvUox2Sbs7D26uOfBSdHxqj3eGcZ
 mHqq6j+uc8anmZpBgxvOFxS6tuFzwI65nYnglCRU+iSHXzju2d4fxZf+npKD7LnXWt
 FH0GT4LrVfCqJWrTzy+i/nlAlIwTtlu4MI00TbWU=
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCA2OjQ0IEFNIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25n
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBOb3cgdGhhdCB3ZSBoYXZlIHRoZSBEVCB2YWxpZGF0
aW9uIGluIHBsYWNlLCBsZXQncyBjb252ZXJ0IHRoZSBkZXZpY2UgdHJlZQo+IGJpbmRpbmdzIGZv
ciB0aGUgQW1sb2dpYyBTeW5vcHN5cyBEVy1IRE1JIHNwZWNpZmljcyBvdmVyIHRvIFlBTUwgc2No
ZW1hcy4KPgo+IFRoZSBvcmlnaW5hbCBleGFtcGxlIGFuZCB1c2FnZSBvZiBjbG9jay1uYW1lcyB1
c2VzIGEgcmV2ZXJzZWQgImlzZnIiCj4gYW5kICJpYWhiIiBjbG9jay1uYW1lcywgdGhlIHJld3Jp
dHRlbiBZQU1MIGJpbmRpbmdzIHVzZXMgdGhlIHJldmVyc2VkCj4gaW5zdGVhZCBvZiBmaXhpbmcg
dGhlIGRldmljZSB0cmVlcyBvcmRlci4KPgo+IFRoZSAjc291bmQtZGFpLWNlbGxzIG9wdGlvbmFs
IHByb3BlcnR5IGhhcyBiZWVuIGFkZGVkIHRvIG1hdGNoIHRoaXMgbm9kZQo+IGFzIGEgc291bmQg
ZGFpLgo+Cj4gVGhlIHBvcnQgY29ubmVjdGlvbiB0YWJsZSBoYXMgYmVlbiBkcm9wcGVkIGluIGZh
dm9yIG9mIGEgZGVzY3JpcHRpb24KPiBvZiBlYWNoIHBvcnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBO
ZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIC4uLi9kaXNw
bGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS50eHQgICAgICAgICB8IDExOSAtLS0tLS0tLS0tLS0t
LQo+ICAuLi4vZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFtbCAgICAgICAgfCAxNTAg
KysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUwIGluc2VydGlvbnMoKyks
IDExOSBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS50eHQKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
