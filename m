Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29483DCE32
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72406EBA0;
	Fri, 18 Oct 2019 18:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8106EA19
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 09:26:50 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id z10so1336365ilo.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 02:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRLZ7Rr8tp8Mq4v4Jt3Xijcjhr4FGUmBPYVDLUM8wn0=;
 b=KoQr5Mn60me63lwfnL8QIKHrQuoHT5x6kODpy7vgDIvKF2cyUss/Svek1+TloXSJId
 zLpcyHJY3oBUdphdWVYBGRGa3rSrHyNJPQ1HmCMTvDdo+7HiHi/rgswlsAAr/PUaOWdL
 rJbBqwvQDieRaLb/FMLihpt+TMhbo+C3+RLV6cC4sbTXpkIpCwswNPpS20HYbI5f68x8
 V9QNj8wH8f/2u/NvwKJcG1nOxP2+PYuCCPE748VxsDHd7QjWeE/DJg42+K4/lzMgekXN
 hJ9al7fkJlxUAi5Q+eJAUfW9b/jyaFlHWPaimFikefib6uXk2oYU3T4aNgpczANarDAW
 1XDw==
X-Gm-Message-State: APjAAAVUlG41EDHcTgD7A110I31eLC4VWW1a2gCAESiSU3q6p9Vwia+u
 HlMebsAmIhFbyzeAeEtBKxYieCuizBmOw0NIjiLeSw==
X-Google-Smtp-Source: APXvYqwvFnl1pJUCxBm3rg+u5BW+kRlRtJDNeCg3Rj2qz3EZm/jNzduKcJuBTKT6GmSwahOdkmLh6Y5KOuzDaf7WKdc=
X-Received: by 2002:a92:1507:: with SMTP id v7mr2313737ilk.37.1571304409584;
 Thu, 17 Oct 2019 02:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
 <20191016133916.21475-3-hverkuil-cisco@xs4all.nl>
 <20191016162232.GY25745@shell.armlinux.org.uk>
In-Reply-To: <20191016162232.GY25745@shell.armlinux.org.uk>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Thu, 17 Oct 2019 11:26:38 +0200
Message-ID: <CALFZZQEL_YFEJWw557p-uV14APthSoTn61tY59yXZEPioxPSfw@mail.gmail.com>
Subject: Re: [PATCHv8 2/2] drm: tda998x: set the connector info
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nRLZ7Rr8tp8Mq4v4Jt3Xijcjhr4FGUmBPYVDLUM8wn0=;
 b=HGC/4O8Icx41ulssxVeEOoYJau1t6GHm/Xrxotkr1aNIpeevmJ/nc+CyzyNoiyljOl
 AeRNDlFi9FDGc6cN2BxFCoGJC7Juqs5uhV48AyvpknCzZ5iQxCX37HbvpLOTnEsIAYXp
 L0o8/WzW+KZg6A/h4/H008AFz2TWdsBtS96L40VwzfhFlo/iLLNdqCNWmtmRAH7mbqrL
 XNpgQqrcFX/9bIUjZrgVNRsRCAyA7bMyfquLgAJAM9Luz9L21ZoIYWFiM12jKBxwZeRD
 NeLRxZColvSufT8G4IP2VjmZ4n8scmLAc/kyDX29fY8yWbJo2RD5o7fF/NhyKyLXxWaE
 evXQ==
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUnVzc2VsLgoKT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgNjoyMiBQTSBSdXNzZWxsIEtpbmcg
LSBBUk0gTGludXggYWRtaW4KPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KLi4uCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMKPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwo+ID4gQEAgLTEzMzcsNiArMTMzNyw4IEBAIHN0
YXRpYyBpbnQgdGRhOTk4eF9jb25uZWN0b3JfaW5pdChzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtKQo+ID4gIHsKPiA+ICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IgPSAm
cHJpdi0+Y29ubmVjdG9yOwo+ID4gKyAgICAgc3RydWN0IGNlY19jb25uZWN0b3JfaW5mbyBjb25u
X2luZm87Cj4gPiArICAgICBzdHJ1Y3QgY2VjX25vdGlmaWVyICpub3RpZmllcjsKPiA+ICAgICAg
IGludCByZXQ7Cj4gPgo+ID4gICAgICAgY29ubmVjdG9yLT5pbnRlcmxhY2VfYWxsb3dlZCA9IDE7
Cj4gPiBAQCAtMTM1Myw2ICsxMzU1LDE3IEBAIHN0YXRpYyBpbnQgdGRhOTk4eF9jb25uZWN0b3Jf
aW5pdChzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2LAo+ID4gICAgICAgaWYgKHJldCkKPiA+ICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+Cj4gPiArICAgICBjZWNfZmlsbF9jb25uX2luZm9f
ZnJvbV9kcm0oJmNvbm5faW5mbywgY29ubmVjdG9yKTsKPiA+ICsKPiA+ICsgICAgIG5vdGlmaWVy
ID0gY2VjX25vdGlmaWVyX2Nvbm5fcmVnaXN0ZXIocHJpdi0+Y2VjX2dsdWUucGFyZW50LAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCAmY29ubl9p
bmZvKTsKPiA+ICsgICAgIGlmICghbm90aWZpZXIpCj4gPiArICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOwo+ID4gKwo+ID4gKyAgICAgbXV0ZXhfbG9jaygmcHJpdi0+Y2VjX25vdGlmeV9tdXRl
eCk7Cj4gPiArICAgICBwcml2LT5jZWNfbm90aWZ5ID0gbm90aWZpZXI7Cj4gPiArICAgICBtdXRl
eF91bmxvY2soJnByaXYtPmNlY19ub3RpZnlfbXV0ZXgpOwo+Cj4gQXMgcGVyIG15IHByZXZpb3Vz
IGNvbW1lbnRzLCB0aGlzIGlzIGEgc2luZ2xlLWNvcHkgYXRvbWljIG9wZXJhdGlvbi4KPiBFaXRo
ZXIgcHJpdi0+Y2VjX25vdGlmeSBpcyBzZXQgb3IgaXQgaXNuJ3Q7IHRoZXJlIGlzIG5vIGludGVy
bWVkaWF0ZQo+IHZhbHVlLiAgSXQgY2FuJ3QgYmUgc2V0IHRvIGEgdmFsdWUgdW50aWwgY2VjX25v
dGlmaWVyX2Nvbm5fcmVnaXN0ZXIoKQo+IGhhcyBjb21wbGV0ZWQuICBTbyB0aGUgbG9jayBkb2Vz
bid0IGhlbHAuCj4KLi4uLgo+ID4gKwo+ID4gICAgICAgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5j
b2RlcigmcHJpdi0+Y29ubmVjdG9yLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwcml2LT5icmlkZ2UuZW5jb2Rlcik7Cj4gPgo+ID4gQEAgLTEzNzIsNiArMTM4NSwxMSBA
QCBzdGF0aWMgdm9pZCB0ZGE5OTh4X2JyaWRnZV9kZXRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSkKLi4uCj4gPiArICAgICBtdXRleF9sb2NrKCZwcml2LT5jZWNfbm90aWZ5X211dGV4KTsK
PiA+ICsgICAgIGNlY19ub3RpZmllcl9jb25uX3VucmVnaXN0ZXIocHJpdi0+Y2VjX25vdGlmeSk7
Cj4gPiArICAgICBwcml2LT5jZWNfbm90aWZ5ID0gTlVMTDsKPiA+ICsgICAgIG11dGV4X3VubG9j
aygmcHJpdi0+Y2VjX25vdGlmeV9tdXRleCk7Cj4KPiBUaGlzIGlzIHRoZSBvbmx5IGNhc2Ugd2hl
cmUgdGhlIGxvY2sgbWFrZXMgc2Vuc2UgLSB0byBlbnN1cmUgdGhhdCBhbnkKPiBvZiB0aGUgY2Vj
X25vdGlmaWVyX3NldF9waHlzX2FkZHIqKCkgZnVuY3Rpb25zIGFyZW4ndCBjYWxsZWQKPiBjb25j
dXJyZW50bHkgd2l0aCBpdC4gIEhvd2V2ZXIsIHRoZXJlJ3Mgbm8gbG9ja2luZyBhcm91bmQgdGhl
IGluc3RhbmNlCj4gaW4gdGRhOTk4eF9jb25uZWN0b3JfZ2V0X21vZGVzKCksIHNvIGhhdmUgeW91
IGVuc3VyZWQgdGhhdCB0aGF0Cj4gZnVuY3Rpb24gY2FuJ3QgYmUgY2FsbGVkIGNvbmN1cnJlbnRs
eT8KPgpJIGFzc3VtZWQgdGhhdCB0ZGE5OTh4X2Nvbm5lY3Rvcl9nZXRfbW9kZXMgZG9lcyBub3Qg
bmVlZCB0byBiZQpzeW5jaHJvbml6ZWQgYXMgaXQgYmVsb25ncyB0byB0aGUgY29ubmVjdG9yIHRo
YXQgZ2V0cyBjbGVhbmVkIHVwIGhlcmUuCkJ1dCwgb24gYSBjbG9zZXIgbG9vaywgSSBkb24ndCB0
aGluayB0aGF0IHRoaXMgYXNzdW1wdGlvbiBuZWNlc3NhcmlseQpob2xkcy4KCklmIHRoaXMgcGF0
Y2ggaXMgdG8gYmUgbWVyZ2VkLCBJIGNhbiBzZW5kIGFuIHVwZGF0ZSB0aGF0OgotIHN0cmlwcyBs
b2NraW5nIGZyb20gdGRhOTk4eF9jb25uZWN0b3JfaW5pdCwKLSBpbiB0ZGE5OTh4X2Nvbm5lY3Rv
cl9nZXRfbW9kZXMgY2FsbHMgY2VjX25vdGlmaWVyKiB3aXRoIHRoZSBsb2NrIGhlbGQuCgpUaGFu
ayB5b3UhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
