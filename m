Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E32EE586
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 18:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10546E626;
	Mon,  4 Nov 2019 17:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393066E626
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 17:05:33 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v2so18480138lji.4
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 09:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qJiFRAU1ANgQBEoCGJorJXFwWND9KhJu4ptLqqShZY=;
 b=ILpiXpR9HTWRjrcm1210vJTP9TO6R7wkPJo+Pm+/Ay/C/G5phYBkSR5xUGPHpELhP1
 cqjWaH3byFVrsgT0zUAxOBC17g80UiYSiiacK5Oo6Es1DxPDIWVEmuHjl39AWJCrKQOt
 PYYOzY/aekWWNy/Yt2xqohZ200wZqf7vWizVc+N/ozvOvI0WksqbefgL7nbnLnNPx8Yq
 ezoMfB+KvYp/nM/TbbTaRWI28XxSrdcjnM+5PqzsPhhVz//00OFOlBaHDYZnt+Hp5VQ1
 OhcYzs4OJmcp2ntOy02W8q5Bttc79r8KSLgCmEFfMPaa00PguKT7FzFkppBasgpOHzrS
 yafQ==
X-Gm-Message-State: APjAAAWagmBeWdLHG0Iy+1YBxzQYBXc+7xufrdg+cBT9V2ytn0wDWoJ5
 Z1g5TfcWMsuGR8mffhomSRwc+VTHV9ph3ZhJQi8=
X-Google-Smtp-Source: APXvYqwJDCfSR1r8hM4MJdBNSycomr3d/Yl4nSIe1J1+qFv3cbMoiF0nRwJfSkMA4D4BnhqwxP5Me1aU8/u2x0tDkVQ=
X-Received: by 2002:a2e:9e45:: with SMTP id g5mr2776409ljk.58.1572887131574;
 Mon, 04 Nov 2019 09:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20191016123342.19119-1-patrik.r.jakobsson@gmail.com>
 <87lftdfb4c.fsf@intel.com> <20191022084423.GB1531961@ulmo>
 <87imohf6rf.fsf@intel.com>
 <CAMeQTsYbY+2=w1m_zMo95vrR008otQESYQJ5K1PfyYOi_Ff2BQ@mail.gmail.com>
In-Reply-To: <CAMeQTsYbY+2=w1m_zMo95vrR008otQESYQJ5K1PfyYOi_Ff2BQ@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 4 Nov 2019 18:05:20 +0100
Message-ID: <CAMeQTsZ5eXSS3OTG_uHUZpPj_=A4Uj_z5x0ZH-CwHRB2L5-YBg@mail.gmail.com>
Subject: Re: [PATCH] drm/scdc: Fix typo in bit definition of SCDC_STATUS_FLAGS
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4qJiFRAU1ANgQBEoCGJorJXFwWND9KhJu4ptLqqShZY=;
 b=geeqURtuQ0iMZyZU2JHAx0IIgyNxihwJ/tz8LlMhNGKscQrPvXfVI8M1H/YMxQWlFT
 qF16TQZ6/ZmOk8D9ptBrhEfRY5oamsNqOKOni0Gs51K/BAbboo/7TXPH9ivalonLHLUf
 DUEm+AD37BwvxAT03Aa2Po2MXd0Rerh4qM+7/4IYIv/6zP/OrZsfVnmUuWTwTeD/MgGu
 siSUtozk/md7BLOwWuE1gpANrNX2/T6ZV5bYQC7F04frd7IH/HozwBNqMkfvhYfYBANf
 ckkDHSv+dNqQAFmUDUIq9zbRBZFTjTtBWOtVzV/XQe5btPcwmCDS2RIL9zeX8C2Rg6Wl
 q3Rw==
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgNTo1MyBQTSBQYXRyaWsgSmFrb2Jzc29uCjxwYXRyaWsu
ci5qYWtvYnNzb25AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDIyLCAyMDE5IGF0
IDExOjUxIEFNIEphbmkgTmlrdWxhCj4gPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4gd3Jv
dGU6Cj4gPgo+ID4gT24gVHVlLCAyMiBPY3QgMjAxOSwgVGhpZXJyeSBSZWRpbmcgPHRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDEx
OjE2OjUxQU0gKzAzMDAsIEphbmkgTmlrdWxhIHdyb3RlOgo+ID4gPj4gT24gV2VkLCAxNiBPY3Qg
MjAxOSwgUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29uQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiA+PiA+IEZpeCB0eXBvIHdoZXJlIGJpdHMgZ290IGNvbXBhcmVkICh4IDwgeSkgaW5z
dGVhZCBvZiBzaGlmdGVkICh4IDw8IHkpLgo+ID4gPj4KPiA+ID4+IEZpeGVzOiAzYWQzM2FlMmJj
ODAgKCJkcm06IEFkZCBTQ0RDIGhlbHBlcnMiKQo+ID4gPj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0
cmVkaW5nQG52aWRpYS5jb20+Cj4gPiA+Cj4gPiA+IEknbSBub3Qgc3VyZSB3ZSByZWFsbHkgbmVl
ZCB0aGUgRml4ZXM6IHRhZyBoZXJlLiBUaGVzZSBkZWZpbmVzIGFyZW4ndAo+ID4gPiB1c2VkIGFu
eXdoZXJlLCBzbyB0ZWNobmljYWxseSB0aGVyZSdzIG5vIGJ1Zy4KPiA+Cj4gPiBZZWFoIHdlbGws
IEkganVzdCBsb2dnZWQgaXQgaGVyZSBhcyBJIGhhcHBlbmVkIHRvIGRvIHRoZSBkcml2ZS1ieSBn
aXQKPiA+IGJsYW1lLgo+Cj4gSSB0aGluayB3ZSBjYW4gc2tpcCB0aGUgZml4ZXMgdGFnIGhlcmUu
IFRoYW5rcyBmb3IgcmV2aWV3IQo+Cj4gRGlkIGFueW9uZSBhcHBseSB0aGlzIG9yIGNhbiBJIHRh
a2UgaXQgdGhyb3VnaCBkcm0tbWlzYy1uZXh0Pwo+Cj4gLVBhdHJpawoKQXBwbGllZCB0byBkcm0t
bWlzYy1uZXh0Cgo+Cj4gPgo+ID4gQlIsCj4gPiBKYW5pLgo+ID4KPiA+Cj4gPgo+ID4gPgo+ID4g
PiBUaGllcnJ5Cj4gPiA+Cj4gPiA+Pgo+ID4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWsgSmFr
b2Jzc29uIDxwYXRyaWsuci5qYWtvYnNzb25AZ21haWwuY29tPgo+ID4gPj4gPiAtLS0KPiA+ID4+
ID4gIGluY2x1ZGUvZHJtL2RybV9zY2RjX2hlbHBlci5oIHwgNiArKystLS0KPiA+ID4+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+PiA+Cj4g
PiA+PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fc2NkY19oZWxwZXIuaCBiL2luY2x1
ZGUvZHJtL2RybV9zY2RjX2hlbHBlci5oCj4gPiA+PiA+IGluZGV4IGY5MmViMjA5NGQ2Yi4uNmE0
ODM1MzNhYWU0IDEwMDY0NAo+ID4gPj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fc2NkY19oZWxw
ZXIuaAo+ID4gPj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fc2NkY19oZWxwZXIuaAo+ID4gPj4g
PiBAQCAtNTAsOSArNTAsOSBAQAo+ID4gPj4gPiAgI2RlZmluZSAgU0NEQ19SRUFEX1JFUVVFU1Rf
RU5BQkxFICgxIDw8IDApCj4gPiA+PiA+Cj4gPiA+PiA+ICAjZGVmaW5lIFNDRENfU1RBVFVTX0ZM
QUdTXzAgMHg0MAo+ID4gPj4gPiAtI2RlZmluZSAgU0NEQ19DSDJfTE9DSyAoMSA8IDMpCj4gPiA+
PiA+IC0jZGVmaW5lICBTQ0RDX0NIMV9MT0NLICgxIDwgMikKPiA+ID4+ID4gLSNkZWZpbmUgIFND
RENfQ0gwX0xPQ0sgKDEgPCAxKQo+ID4gPj4gPiArI2RlZmluZSAgU0NEQ19DSDJfTE9DSyAoMSA8
PCAzKQo+ID4gPj4gPiArI2RlZmluZSAgU0NEQ19DSDFfTE9DSyAoMSA8PCAyKQo+ID4gPj4gPiAr
I2RlZmluZSAgU0NEQ19DSDBfTE9DSyAoMSA8PCAxKQo+ID4gPj4gPiAgI2RlZmluZSAgU0NEQ19D
SF9MT0NLX01BU0sgKFNDRENfQ0gyX0xPQ0sgfCBTQ0RDX0NIMV9MT0NLIHwgU0NEQ19DSDBfTE9D
SykKPiA+ID4+ID4gICNkZWZpbmUgIFNDRENfQ0xPQ0tfREVURUNUICgxIDw8IDApCj4gPiA+Pgo+
ID4gPj4gLS0KPiA+ID4+IEphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKPiA+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPiA+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+PiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gPiA+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4KPiA+IC0tCj4gPiBKYW5pIE5pa3VsYSwgSW50ZWwg
T3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
