Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F89433AB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC968957D;
	Thu, 13 Jun 2019 07:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152F2896A5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 16:22:40 +0000 (UTC)
Received: by mail-it1-x144.google.com with SMTP id q14so11521851itc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 09:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5VQVkJNfEyEKYicf2dfqO23vhFLeo5KbOT0Pge8qD5k=;
 b=T55Q+c6E+NNu1XG8hAbKz/Kf1vEKswxbxQBAt0vyzT2wIoOWLtbyUiCqDq4u6yKLZD
 DkYUxlr9YynX0CaxX0FZHp4B2eBsnEmZuz/xH3d1NGl0tSIpay+GAZapLeE+rlnglCtK
 vhyxHR+FiXdAIYadftWoMTTHnUibUulSRRiClWiox+8ADCbK8YAmY8D2REuUE0y74zlr
 zd5edGt7oIAwxTsSrIEDW68o5IRwPNu+xgSBaZCoOEmENgwwN7Y4S1QI4OxKCQyJ9Qhm
 dBT3e5qdgbJ/TEzls36S0jTfGMWfDS1HxKyYAf5piKlToza1YdsCQk+4U7GZ/qKtH/nN
 S11A==
X-Gm-Message-State: APjAAAXw44goXGCcduhbHXwlT08QlEmIiRhg66daPcHjXGOMlHNaSokQ
 hPMoc53V9ScNv+jJ9/Kn0OTsf8QKBsbqjpT6sZ8=
X-Google-Smtp-Source: APXvYqwJ0MYlKH9ylDg0uGfTVYrhpe5COb1pxSEhCro/xeeSsds/sB0chvu2MbiYoozMHJiPzGWSlb/fcIQn+jkSkRM=
X-Received: by 2002:a02:5b05:: with SMTP id g5mr51762515jab.114.1560356559206; 
 Wed, 12 Jun 2019 09:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
 <20190612083252.15321-11-andrew.smirnov@gmail.com>
 <a1c125d2-1c7a-c190-8b7e-845a2ec1d2ea@ti.com>
In-Reply-To: <a1c125d2-1c7a-c190-8b7e-845a2ec1d2ea@ti.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 12 Jun 2019 09:22:27 -0700
Message-ID: <CAHQ1cqG7dPFarphmBWSSqYAuO=6Kev4eFsBM09zUDJFek3UaOg@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] drm/bridge: tc358767: Add support for
 address-only I2C transfers
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5VQVkJNfEyEKYicf2dfqO23vhFLeo5KbOT0Pge8qD5k=;
 b=Dr6gh8r6rHt2ovOQ17NVfETX5nAu6deuvULXQJMdqjzr7EjnhjYqwZoxKFwwkT4fuY
 xfv4j1I+6MKhbF0s0WKeU6Et+/+WQtZe2OLPsh6lABzCsrOfbbEn1klyezkXcEzuBrBJ
 eCQuj1vCDq4ezpiVllUz06Iav7AVt5WR+1CI7DCc6yBdMvI4ULqFnV6Kgdlnm/LTqu1o
 o6uipJCmYhAQBAIkQd9xb0a6e12eUyOXZ2DyggVLFmSV8jn7UQIJ9ORlyG0Gw6cIy3Aq
 XUGr7sr5QpIa5M8AbT8WauHAtAxd0uq1gE/LAlfq+npJ/79Pfd28ddMF2DILbshU3Kk/
 W4WA==
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgNTo0OCBBTSBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMTIvMDYvMjAxOSAxMTozMiwgQW5k
cmV5IFNtaXJub3Ygd3JvdGU6Cj4gPiBUcmFuc2ZlciBzaXplIG9mIHplcm8gbWVhbnMgYSByZXF1
ZXN0IHRvIGRvIGFuIGFkZHJlc3Mtb25seQo+ID4gdHJhbnNmZXIuIFNpbmNlIHRoZSBIVyBzdXBw
b3J0IHRoaXMsIHdlIHByb2JhYmx5IHNob3VsZG4ndCBiZSBqdXN0Cj4gPiBpZ25vcmluZyBzdWNo
IHJlcXVlc3RzLiBXaGlsZSBhdCBpdCBhbGxvdyBEUF9BVVhfSTJDX01PVCBmbGFnIHRvIHBhc3MK
PiA+IHRocm91Z2gsIHNpbmNlIGl0IGlzIHN1cHBvcnRlZCBieSB0aGUgSFcgYXMgd2VsbC4KPgo+
IEkgYmlzZWN0ZWQgdGhlIEVESUQgcmVhZCBpc3N1ZSB0byB0aGlzIHBhdGNoLi4uCj4KCkkgZG9u
J3QgdGhpbmsgSSd2ZSBoYWQgYW55IHByb2JsZW1zIG9uIG15IGVuZCB3aXRoIHRoaXMuIEknbGwg
ZG91YmxlCmNoZWNrLiBJdCBtaWdodCBiZSB0aGUgY2FzZSB0aGF0IHlvdXJzIGlzIHRoZSBvbmx5
IHNldHVwIHdoZXJlIHRoZQpwcm9ibGVtIGNhbiBiZSByZXBybydkLCB0aG91Z2guIFdlIGNhbiBk
cm9wIHRoaXMgcGF0Y2ggaWYgeW91IGRvbid0CmhhdmUgdGltZS93b3VsZCByYXRoZXIgbm90IGRp
ZyBpbnRvIHRoaXMuCgpUaGFua3MsCkFuZHJleSBTbWlybm92Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
