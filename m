Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E8B8643B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 16:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D58A6E83E;
	Thu,  8 Aug 2019 14:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9A56E83E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 14:22:52 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D239921743
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 14:22:51 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id t12so3722822qtp.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 07:22:51 -0700 (PDT)
X-Gm-Message-State: APjAAAUjaZjLvXe1yIGhR0Zex6Eriqz/5D4k06z8awaoxJz9IDY8ih1X
 pK+iKFxul7MJUCq1Zujo7b7c+iKPqOvPEvW7MQ==
X-Google-Smtp-Source: APXvYqwuFDlDdhRjgs2OPhZLe+JL3U+8wBZdlI8Nkb5wYrKcFge+RCokmdszImo6kO7eQS5L3w25UCHbyuo3F8pjpiw=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr13538682qve.148.1565274171003; 
 Thu, 08 Aug 2019 07:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190808085522.21950-1-narmstrong@baylibre.com>
 <20190808085522.21950-3-narmstrong@baylibre.com>
In-Reply-To: <20190808085522.21950-3-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 8 Aug 2019 08:22:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJgjjPzb4uWaJ-M=11-LRjByyRcHmot6iRyK-dXMOnkxg@mail.gmail.com>
Message-ID: <CAL_JsqJgjjPzb4uWaJ-M=11-LRjByyRcHmot6iRyK-dXMOnkxg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: amlogic,meson-vpu: convert
 to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565274172;
 bh=tmkfuAM/VbXi3dTJBiWU5XaSo7kk4pDqqmiZFl+44xQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kh3Ota7Qb3KPespHWImHXoScmyw6mRjvw3gzIxKQaNgkH4K00LfA8hjq+Erq1NDhu
 HeYQg36E2zSdaPvivUShUYkHJ2g7lNAU77X1wjpmReEMRLqvYo8m0DWM3uOQf5n/1J
 KUgLP8ZJBYXrm3NSGOPHgk89AnAy/978NYu35e4c=
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

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCAyOjU1IEFNIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25n
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBOb3cgdGhhdCB3ZSBoYXZlIHRoZSBEVCB2YWxpZGF0
aW9uIGluIHBsYWNlLCBsZXQncyBjb252ZXJ0IHRoZSBkZXZpY2UgdHJlZQo+IGJpbmRpbmdzIGZv
ciB0aGUgQW1sb2dpYyBEaXNwbGF5IENvbnRyb2xsZXIgb3ZlciB0byBZQU1MIHNjaGVtYXMuCj4K
PiBUaGUgb3JpZ2luYWwgZXhhbXBsZSBoYXMgYSBsZWZ0b3ZlciAiZG1jIiBtZW1vcnkgY2VsbCwg
dGhhdCBoYXMgYmVlbgo+IHJlbW92ZWQgaW4gdGhlIHlhbWwgcmV3cml0ZS4KPgo+IFRoZSBwb3J0
IGNvbm5lY3Rpb24gdGFibGUgaGFzIGJlZW4gZHJvcHBlZCBpbiBmYXZvciBvZiBhIGRlc2NyaXB0
aW9uCj4gb2YgZWFjaCBwb3J0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5h
cm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9hbWxv
Z2ljLG1lc29uLXZwdS50eHQgICAgfCAxMjEgLS0tLS0tLS0tLS0tLS0tLQo+ICAuLi4vYmluZGlu
Z3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLXZwdS55YW1sICAgfCAxMzcgKysrKysrKysrKysrKysr
KysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTM3IGluc2VydGlvbnMoKyksIDEyMSBkZWxldGlvbnMo
LSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2FtbG9naWMsbWVzb24tdnB1LnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi12cHUu
eWFtbAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
