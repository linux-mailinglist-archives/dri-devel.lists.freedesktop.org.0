Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1129243363
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC577892D7;
	Thu, 13 Jun 2019 07:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F08892F0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:27:28 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id w7so11991091oic.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3LdPS32Bq3qvJDgrevcGaWHw9JAMcU2yxroEN2OhfPc=;
 b=eP2LKrGJHM2vE4/OcDuby2/OMZTG3LZbfW8iHS6mOgslXzMzAVgZHsjyTzpQM2ocH+
 jY9eNnCdQ1Q0ZdRgDFvegWFWEGRWQI371yeuSS2nQbXrE1XdNy+Lbanu0NEKdSpbv1gE
 fSDw1fGCKAP/Of7O/RVxocU7GsPpqqLAgP91Q2V2lonh2j27DL8WhBvKTr+kTwvKl5u3
 ElEh+pDjXQIXeKdCsLnBaTM0NOROoVIwI6j+0Hj70icpHfACaTZLKKKFdLjywXdUCAa2
 PlyStEtHSl3p8zDTNX2JrDJ89stoDATky/9/x3t/uH5oEBDpvT6UbftociWn+kn6+XhV
 CeWQ==
X-Gm-Message-State: APjAAAVUgdTEWF/AOL584ENnzQvNNRtcsaKzYJgMou3xJL9GqY18m0/9
 ROYzIecwbPgIzhH2A4DFcyVqBOSmImZtlajkgOE=
X-Google-Smtp-Source: APXvYqwij48YppzKReAY3UmDK91LAvoz/nVHbTd7eOqRRuzcDAopOW5khrEO9fj0q+eaS0IvhF9I1vwqgkP/AALgcP0=
X-Received: by 2002:aca:e106:: with SMTP id y6mr20231156oig.77.1560353247087; 
 Wed, 12 Jun 2019 08:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXI-0001y0-S5@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1haeXI-0001y0-S5@rmk-PC.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 12 Jun 2019 11:27:16 -0400
Message-ID: <CAGngYiWT5xsVgP4R=LPozpxFwdoCtpGSn76fwWEDiNXtYzBA9g@mail.gmail.com>
Subject: Re: [PATCH 04/13] drm/i2c: tda998x: derive CTS_N value from aclk
 sample rate ratio
To: Russell King <rmk+kernel@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3LdPS32Bq3qvJDgrevcGaWHw9JAMcU2yxroEN2OhfPc=;
 b=aqBRh/T0xsBsUbUV+R+e53PJeaepPMVfV0IXfhh4Ld8S60rxzdNWZrV2HXtDNb6Vkd
 Tcqat4c0BJeILZTnnFfHGLqsmJduEGvk3265Fpii1YFSCyDjI9+/2we6BrrMfAjv4g3P
 p5gbQPxSF9F4YArqQJpNhK5Y66tcqbn40xv2SDpprySPBO0Q/P55E6HGIIFD+SB1DLIJ
 EnNJQHlIQQObZif+yrnzW0VznuUZ1oLO7Cf1P7JVP5gfhNJGLOwwEmu62GJklbjiJ+W7
 8qMfxQgoeGeS9QLjozyCAQuIEHiWb4tQp0irtsehs8IzDU6tXirx23v0YlDN/oZcLT5u
 ZKRw==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowMiBBTSBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxA
YXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IFRoZSBUREE5OTh4IGRlcml2ZXMgdGhlIENUUyB2
YWx1ZSB1c2luZyB0aGUgc3VwcGxpZWQgSTJTIGJpdCBjbG9jawo+IChBQ0xLLCBpbiBUREE5OTh4
IHBhcmxlbmNlKSByYXRoZXIgdGhhbiAxMjjCt2ZzLiAgVERBOTk4eCB1c2VzIHR3bwo+IGNvbnN0
YW50cyBuYW1lZCBtIGFuZCBrIGluIHRoZSBDVFMgZ2VuZXJhdG9yIHN1Y2ggdGhhdCB3ZSBoYXZl
IHRoaXMKPiByZWxhdGlvbnNoaXAgYmV0d2VlbiB0aGUgSTJTIHNvdXJjZSBBQ0xLIGFuZCB0aGUg
c2luayBmczoKPgo+ICAgICAgICAgMTI4wrdmc19zaW5rID0gQUNMS8K3bSAvIGsKPgo+IFdoZXJl
IEFDTEsgPSBhY2xrX3JhdGlvwrdmc19zb3VyY2UuCj4KPiBXaGVuIGF1ZGlvIHN1cHBvcnQgd2Fz
IG9yaWdpbmFsbHkgYWRkZWQsIHdlIHN1cHBvcnRlZCBhIGZpeGVkIHJhdGlvCj4gb2YgNjTCt2Zz
LCBpbnRlbmRpbmcgdG8gc3VwcG9ydCB0aGUgS2lya3dvb2QgSTJTIG9uIERvdmUuICBIb3dldmVy
LAo+IHdoZW4gaGRtaS1jb2RlYyBzdXBwb3J0IHdhcyBhZGRlZCwgdGhpcyB3YXMgY2hhbmdlZCB0
byBzY2FsZSB0aGUKPiByYXRpbyB3aXRoIHRoZSBzYW1wbGUgd2lkdGgsIHdoaWNoIHdvdWxkJ3Zl
IGJyb2tlbiBpdHMgdXNlIHdpdGgKPiBLaXJrd29vZCBJMlMuCj4KPiBXZSBhcmUgbm93IHN0YXJ0
aW5nIHRvIHNlZSBvdGhlciB1c2VycyB3aG9zZSBJMlMgYmxvY2tzIHNlbmQgYXQgNjTCt2ZzCj4g
Zm9yIDE2LWJpdCBzYW1wbGVzLCBzbyB3ZSBuZWVkIHRvIHJlaW5zdGF0ZSB0aGUgc3VwcG9ydCBm
b3IgdGhlIGZpeGVkCj4gcmF0aW8gSTJTIGJpdCBjbG9jay4KPgo+IFRoaXMgY29tbWl0IHRha2Vz
IGEgc3RlcCB0b3dhcmRzIHN1cHBvcnRpbmcgdGhlc2UgY29uZmlndXJhdGlvbnMgYnkKPiBzZWxl
Y3RpbmcgdGhlIENUU19OIHJlZ2lzdGVyIG0gYW5kIGsgdmFsdWVzIGJhc2VkIG9uIHRoZSBiaXQg
Y2xvY2sKPiByYXRpby4gIEhvd2V2ZXIsIGFzIHRoZSBkcml2ZXIgaXMgbm90IGdpdmVuIHRoZSBi
aXQgY2xvY2sgcmF0aW8gZnJvbQo+IEFMU0EsIGNvbnRpbnVlIGRlcml2aW5nIHRoaXMgZnJvbSB0
aGUgc2FtcGxlIHdpZHRoLiAgVGhpcyB3aWxsIGJlCj4gYWRkcmVzc2VkIGluIGEgbGF0ZXIgY29t
bWl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4
Lm9yZy51az4KPiAtLS0KCkBAIC0xNjU3LDkgKzE3MDEsMTcgQEAgc3RhdGljIHZvaWQgdGRhOTk4
eF9zZXRfY29uZmlnKHN0cnVjdCB0ZGE5OTh4X3ByaXYgKnByaXYsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAocC0+bWlycl9mID8gVklQX0NOVFJMXzJfTUlSUl9GIDogMCk7CgogICAgICAg
IGlmIChwLT5hdWRpb19wYXJhbXMuZm9ybWF0ICE9IEFGTVRfVU5VU0VEKSB7CisgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgcmF0aW87CisgICAgICAgICAgICAgICBib29sIHNwZGlmID0gcC0+
YXVkaW9fcGFyYW1zLmZvcm1hdCA9PSBBRk1UX1NQRElGOworCiAgICAgICAgICAgICAgICBwcml2
LT5hdWRpby5wYXJhbXMgPSBwLT5hdWRpb19wYXJhbXM7CiAgICAgICAgICAgICAgICBwcml2LT5h
dWRpby5pMnNfZm9ybWF0ID0gSTJTX0ZPUk1BVF9QSElMSVBTOworCisgICAgICAgICAgICAgICBy
YXRpbyA9IHNwZGlmID8gNjQgOiBwLT5hdWRpb19wYXJhbXMuc2FtcGxlX3dpZHRoICogMjsKKyAg
ICAgICAgICAgICAgIHJldHVybiB0ZGE5OTh4X2Rlcml2ZV9jdHNfbihwcml2LCAmcHJpdi0+YXVk
aW8sIHJhdGlvKTsKCldvbid0IHRoaXMgbWFrZSB0aGUgcGxhdGZvcm1fZGF0YSBwYXRoIGZhaWwg
YWxsIHRoZSB0aW1lPwpBbHNvLCB0aGUgcGxhdGZvcm1fZGF0YSBwYXRoIGRvZXNuJ3QgYXBwZWFy
IHRvIGluc3RhbnRpYXRlIHRoZSBIRE1JX0NPREVDLApzbyB0ZGEgYXVkaW8gc3VwcG9ydCB3b3Vs
ZCBiZSBjb21wbGV0ZWx5IG1pc3NpbmcgaW4gdGhpcyBjYXNlPwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
