Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8A51AB5C
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 10:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72857893DB;
	Sun, 12 May 2019 08:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD01893DB
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 08:55:33 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id g187so6201637vsc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 01:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ow848t2u3LpAUpqXAKwtt4Cf+vUELYwh7/Zxrs8pkng=;
 b=FzAcBQAj6vdVOsnyK5qcQE5x9tuC4taxFejPXnhTwKiQ3IdYSaFpsiIk3AZF6Bf38F
 0cQ9No+O+6/JH8MWnMJD063TzR1O9IrulhyVh0yMOp6p8GdiQ7p7d1isBlI0xjEdX3sa
 gfZekLAJUZr5AxRgAzjJSzjAbUS6VzxtGMGXrJ6lyakQrgIdihC1Z5lVFcT+6UjHtjsk
 WE23EAXHYuzsAREo8/HXREJKFK2yW0AExv6sqMkBK8GxA7F3vC68dDRCXtR+L+AOMGmE
 ZFvre2qG+i1caEaRi2UPKV3KZLF/nyyL4f5F2EyOw94HNxs3L5aEzSBzMPm0lQBh2i3B
 ST/Q==
X-Gm-Message-State: APjAAAUWS24gaE44b6EE5gl1TxU+csRXnYoQ6lbHqedn5A4eisgePq1t
 HY3dG7P305JnxWAwDkPGObpGZQBSpnkYZkK6rCQ=
X-Google-Smtp-Source: APXvYqx8fhpnx1jG+o7RUM+RTlx+K0ybPOaIQnf4viZNAVVaLQuRbMeV3I8lNMmlRdaz08KipNvdU5CIqkDnaX3zHLQ=
X-Received: by 2002:a67:fdd4:: with SMTP id l20mr7036223vsq.63.1557651332429; 
 Sun, 12 May 2019 01:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 May 2019 10:55:20 +0200
Message-ID: <CAMuHMdWqvKXXfjSAk3GRyk8fwa2TS+EwcV_n0YwcEU9d8XohUA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] R-Car DU: LVDS dual-link mode support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIFNhdCwgTWF5IDExLCAyMDE5IGF0IDExOjA3IFBNIExhdXJlbnQgUGlu
Y2hhcnQKPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPiB3cm90ZToK
PiBPbiB0aGUgcmVjZWl2aW5nIHNpZGUsIHRoZSBUSEM2M0xWRDEwMjQgTFZEUy10by1wYXJhbGxl
bCBicmlkZ2UgaGFzIHR3bwo+IExWRFMgaW5wdXRzIGFuZCB0d28gcGFyYWxsZWwgb3V0cHV0cy4g
SXQgY2FuIG9wZXJhdGUgaW4gZm91ciBkaWZmZXJlbnQKPiBtb2RlczoKPgo+IC0gU2luZ2xlLWlu
LCBzaW5nbGUtb3V0OiBUaGUgZmlyc3QgTFZEUyBpbnB1dCByZWNlaXZlcyB0aGUgdmlkZW8gc3Ry
ZWFtLAo+ICAgYW5kIHRoZSBicmlkZ2Ugb3V0cHV0cyBpdCBvbiB0aGUgZmlyc3QgcGFyYWxsZWwg
b3V0cHV0LiBUaGUgc2Vjb25kCj4gICBMVkRTIGlucHV0IGFuZCB0aGUgc2Vjb25kIHBhcmFsbGVs
IG91dHB1dCBhcmUgbm90IHVzZWQuCj4KPiAtIFNpbmdsZS1pbiwgZHVhbC1vdXQ6IFRoZSBmaXJz
dCBMVkRTIGlucHV0IHJlY2VpdmVzIHRoZSB2aWRlbyBzdHJlYW0sCj4gICBhbmQgdGhlIGJyaWRn
ZSBzcGxpdHMgZXZlbi0gYW5kIG9kZC1udW1iZXJlZCBwaXhlbHMgYW5kIG91dHB1dHMgdGhlbQo+
ICAgb24gdGhlIGZpcnN0IGFuZCBzZWNvbmQgcGFyYWxsZWwgb3V0cHV0cy4gVGhlIHNlY29uZCBM
VkRTIGlucHV0IGlzIG5vdAo+ICAgdXNlZC4KPgo+IC0gRHVhbC1pbiwgc2luZ2xlLW91dDogVGhl
IHR3byBMVkRTIGlucHV0cyBhcmUgdXNlZCBpbiBkdWFsLWxpbmsgbW9kZSwKPiAgIGFuZCB0aGUg
YnJpZGdlIGNvbWJpbmVzIHRoZSBldmVuLSBhbmQgb2RkLW51bWJlcmVkIHBpeGVscyBhbmQgb3V0
cHV0cwo+ICAgdGhlbSBvbiB0aGUgZmlyc3QgcGFyYWxsZWwgb3V0cHV0LiBUaGUgc2Vjb25kIHBh
cmFsbGVsIG91dHB1dCBpcyBub3QKPiAgIHVzZWQuCj4KPiAtIER1YWwtaW4sIGR1YWwtb3V0OiBU
aGUgdHdvIExWRFMgaW5wdXRzIGFyZSB1c2VkIGluIGR1YWwtbGluayBtb2RlLAo+ICAgYW5kIHRo
ZSBicmlkZ2Ugb3V0cHV0cyB0aGUgZXZlbi0gYW5kIG9kZC1udW1iZXJlZCBwaXhlbHMgb24gdGhl
IGZpcnN0Cj4gICBwYXJhbGxlbCBvdXRwdXQuCgphbmQgdGhlIHNlY29uZD8KCj4gVGhlIG9wZXJh
dGluZyBtb2RlIGlzIHNlbGVjdGVkIGJ5IHR3byBpbnB1dCBwaW5zIG9mIHRoZSBicmlkZ2UsIHdo
aWNoCj4gYXJlIGNvbm5lY3RlZCB0byBESVAgc3dpdGNoZXMgb24gdGhlIGRldmVsb3BtZW50IGJv
YXJkcyBJIHVzZS4gVGhlIG1vZGUKPiBpcyB0aHVzIGZpeGVkIGZyb20gYSBMaW51eCBwb2ludCBv
ZiB2aWV3LgoKQ2FuIHRoZSBzdGF0ZSBvZiB0aGVzZSBzd2l0Y2hlcyBiZSByZWFkIGZyb20gc29m
dHdhcmU/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
