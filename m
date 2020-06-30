Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBBF2104BF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345D96E832;
	Wed,  1 Jul 2020 07:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51EA6E332
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 15:32:52 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id a12so21466950ion.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 08:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fTZIk7o4I3v9sDO1ioQg65WFbAcbrwuzrZp6bqG2TZs=;
 b=SLNEacNnXUaOSknJvbz9ftmBYbhGROQqfmRN2jCu+oUjMlkNVC7L0DnsVQmrHBlaRI
 5t9+YaZ3fxK4ku6fb+GPJKRfCG+Gps1qplj+0digh8uJn+GB+1JCG9Wzyl02o25PGelP
 jjz8iA9Z0KkEkHWlrSiPsWZQGxioYTjb69FIRUrryO7BtD4wWSjN4SSDkRErIBuVuxNx
 0Er+SiLvwIuVSKl+6GUCUZEwRsO/ajwCcaiu8dXRPPfPul65ngxfwh8CITu5HLwJg6k5
 BnZwSlDfE/HqcS6lphCwBhiU+2Md/l2E9L4RXlcd7S2l5erQM1rZl/g1zIVhMlCkQRPN
 8Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fTZIk7o4I3v9sDO1ioQg65WFbAcbrwuzrZp6bqG2TZs=;
 b=Cp4ZdO1tcB4pzzOsoVf5uIn97McBEaCjGhD2oEnP/RiJSk/gbc3NhW13KpG4drUshh
 zFYPyv3hb7/fc3Zc3+Htyu+Oo9YrgM605ROv7bDqryttczY2+Q4EXBLuEvTmN2uHh/mr
 tugdIkDK/uzSl3sDc2JCb7ykx4vIDV734wSABD+IDJYUQDYLvoPM3jJa7tONGyrziMQW
 0vqYA79y1J+NOfw5Djoq+RzsFM4vb9667X13DR0uY1eDqvD4h+g7aHDzcl3u03rJomKE
 68y44PFDIRYTiJUHhi8BD8tbvjttt22tCaIQPyLSPakVVeMUDO1sztS6pceGW7Ezr4h8
 ZSKg==
X-Gm-Message-State: AOAM531miyH11k9LN2yEHlo0/cWtW7iSfuBgrGPyRpGj9neBqYdk2Xn2
 IlFZdqr2FTDxHKUNUvLQhknkRyp2V/zEPudTgvk=
X-Google-Smtp-Source: ABdhPJwmeqxFiF/UYomtYzSa1zyensrGB2NlVyhR0lNiVAk/rpt8vIaIoeUrWdkkS5pkKyqbHpik7IWOHz0pvwB/6Z8=
X-Received: by 2002:a02:6d27:: with SMTP id m39mr24703937jac.10.1593531171771; 
 Tue, 30 Jun 2020 08:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
 <CAHp75VebSZa6mwAETnM0t42RQCp4iM6_SNjmy3TB48ixsGKV8g@mail.gmail.com>
 <CAL9mu0+jmcivC6zAXxK0-oXy3n44pAU1QGD7BDq=CT2D7twROQ@mail.gmail.com>
 <c085e8f5-f626-28a9-1d3f-a1c277ec5052@tronnes.org>
In-Reply-To: <c085e8f5-f626-28a9-1d3f-a1c277ec5052@tronnes.org>
From: dillon min <dillon.minfei@gmail.com>
Date: Tue, 30 Jun 2020 23:32:15 +0800
Message-ID: <CAL9mu0LPuqRn-tKWWzyUWnOE2h-w7F3-6HTYv15QcUYWBroXZw@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] drm/panel: Add ilitek ili9341 panel driver
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5keSwgTm9yYWxmLAoKZ2VudGxlIHBpbmcgZm9yIHRoaXMgcGF0Y2ggc2V0LApkbyB3ZSBo
YXZlIGFueSBuZXcgc3RydWN0dXJlLCBvciBpZGVhIHRvIHN1cHBvcnQgYm90aCBkcGkgYW5kIGRi
aQppbnRlcmZhY2UgYnkgb25lIGRybSBwYW5lbCBkcml2ZXI/CmZyb20gdGhpcyB0aHJlYWQKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMjAtTWF5LzI2
NzAzMS5odG1sCiwgaXQncyBzZWVtcwpkaXNjdXNzaW5nIHdhcyBzdG9wcGVkIGF0IG1heSAyNS4K
CmlmIHRoZXJlIGFyZSBhbnkgbmV3IGluZm9ybWF0aW9uIGFib3V0IHRoaXMgdG9waWMsIHBsZWFz
ZSBmZWVsIGZyZWUgdG8KbGV0IG1lIGtub3cuIGhvcGUgaSBjYW4gbWFrZSBzb21lCnByb2dyZXNz
IG9uIGl0LgoKdGhhbmtzLAoKRGlsbG9uLAoKYmVzdCByZWdhcmRzCgpPbiBUdWUsIE1heSAyNiwg
MjAyMCBhdCA2OjM4IFBNIE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPiB3cm90
ZToKPgo+Cj4KPiBEZW4gMjYuMDUuMjAyMCAxMS4wOCwgc2tyZXYgZGlsbG9uIG1pbjoKPiA+IEhp
IEFuZHksCj4gPgo+ID4gVGhhbmtzIGZvciBpbnB1dC4KPiA+Cj4gPiBPbiBUdWUsIE1heSAyNiwg
MjAyMCBhdCAzOjQ2IFBNIEFuZHkgU2hldmNoZW5rbwo+ID4gPGFuZHkuc2hldmNoZW5rb0BnbWFp
bC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gTW9uLCBNYXkgMjUsIDIwMjAgYXQgNjo0NiBBTSA8
ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+PiBGcm9tOiBkaWxsb24g
bWluIDxkaWxsb24ubWluZmVpQGdtYWlsLmNvbT4KPiA+Pj4KPiA+Pj4gICAgIFRoaXMgZHJpdmVy
IGNvbWJpbmUgdGlueS9pbGk5MzQxLmMgbWlwaV9kYmlfaW50ZXJmYWNlIGRyaXZlcgo+ID4+PiAg
ICAgd2l0aCBtaXBpX2RwaV9pbnRlcmZhY2UgZHJpdmVyLCBjYW4gc3VwcG9ydCBpbGk5MzQxIHdp
dGggc2VyaWFsCj4gPj4+ICAgICBtb2RlIG9yIHBhcmFsbGVsIHJnYiBpbnRlcmZhY2UgbW9kZSBi
eSByZWdpc3RlciBjb25maWd1cmF0aW9uLgo+ID4+Cj4gPj4gTm9yYWxmIHRvbGQgb25jZSB0aGF0
IHRoaXMgZHJpdmVyIHNob3VsZCBiZSB1bmlmaWVkIHdpdGggbWkwMjgzcXQuYy4KPiA+Pgo+ID4+
IFNvLCB3aGF0IHNob3VsZCB3ZSBkbyBoZXJlPwo+ID4+Cj4gPj4gLS0KPiA+PiBXaXRoIEJlc3Qg
UmVnYXJkcywKPiA+PiBBbmR5IFNoZXZjaGVua28KPiA+Cj4gPiBmcm9tIHNhbSdzIHN1Z2dlc3Rp
b24sIHdlIGNhbid0IHNldHVwIHR3byBkcml2ZXJzIHRvIHN1cHBvcnQgb25lIHBhbmVsCj4gPiBp
biB0aGUgdHJlZS4gc28sIGkgY29weSB0aGUgbWlwaSBkYmkgcGFydCBmcm9tIHRpbnkvaWxpOTM0
MS5jLiB0byB0aGlzIGRyaXZlcgo+ID4gZnJvbSByZWdpc3RlciBzZXR0aW5ncyBhbmQgZHRzIGJp
bmRpbmcgaXMga2VlcCB0aGUgc2FtZSB0byB0aW55L2lsaTkzNDEuYy4KPiA+Cj4gPiBzbywgaW4g
bXkgb3BpbmlvbiBpZiB0aW55L2lsaTkzNDEuYyBpcyB1bmlmaWVkIHdpdGggbWkwMjgzcXQuYywg
dGhpcwo+ID4gZHJpdmVyIHNob3VsZCBiZQo+ID4gdG9vLgo+ID4KPgo+IFRoZXJlJ3MgYSBkaXNj
dXNzaW9uIGFib3V0IE1JUEkgREJJIHBhbmVscyBoZXJlOgo+Cj4gTUlQSSBEU0ksIERCSSwgYW5k
IHRpbnlkcm0gZHJpdmVycwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVz
L2RyaS1kZXZlbC8yMDIwLU1heS8yNjcwMzEuaHRtbAo+Cj4gTm9yYWxmLgo+Cj4gPiB0aGFua3Mu
Cj4gPgo+ID4gYmVzdCByZWdhcmRzLAo+ID4KPiA+IERpbGxvbiwKPiA+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
