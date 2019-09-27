Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A499AC051C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 14:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132AC89B97;
	Fri, 27 Sep 2019 12:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB3189B97
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 12:26:36 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id h33so2129592edh.12
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 05:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MLpaVux2E5Ma8rfAsYk3Q/0a9jF4YNQVNjLuUjERIwU=;
 b=HwGHkRkfARZuiLdJHGWmqkvqTUkptJTmsQiOqBk8kiR/nizL4VSH2/0R1jglmSkMVL
 /AlWh5CsMuQbbvsEtkzvDI6RrGvMGFkOSmdc8iV5+LzmL9NIGHNuO5N2XdmIz/1NJTVD
 5RtrIU2JUAKf4e3RDq/eNbL2qYXiE93bnpUiEegT4xuSDhXi8kc/64iFlD5FCKqJPRN0
 2s2nfGM/9nf9zXs9A5W+PCS2bolE+pFqsxrbR9mhjbrV6s5oYaPTvP8pkKIfIcty1Y0s
 7c45f0J9Sl4GoM3Z9RUzudjjtQH/ZsKrHBSqOoYd9ddPta8d9+MNmsUHS+SSbO3OzwA6
 sYrg==
X-Gm-Message-State: APjAAAXUbUK08Htp3u+oqKgNzGtSo/uuXb8FuKVUM/oce5G1Uxj+dpZG
 lFWeflThXC8FwOJFcgA9mPU+xw==
X-Google-Smtp-Source: APXvYqzv9a01DzZigIrxklIuOXJfyd+toe/1RrwfEGr3f1/wzZbbNkfR0iv1STW7wTw/jLxvMFgK8g==
X-Received: by 2002:a05:6402:2cb:: with SMTP id
 b11mr4179069edx.285.1569587194900; 
 Fri, 27 Sep 2019 05:26:34 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id j43sm500196eda.19.2019.09.27.05.26.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 05:26:34 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 147A7101F61; Fri, 27 Sep 2019 15:26:38 +0300 (+03)
Date: Fri, 27 Sep 2019 15:26:38 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
Message-ID: <20190927122638.wtn5idrt4btir6be@box>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
 <c58cdb3d-4f5e-7bfc-06b3-58c27676d101@shipmail.org>
 <CAHk-=wh_+Co=T8wG8vb5akMP=7H4BN=Qpq6PsKh8rcmT8MCV+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wh_+Co=T8wG8vb5akMP=7H4BN=Qpq6PsKh8rcmT8MCV+Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=MLpaVux2E5Ma8rfAsYk3Q/0a9jF4YNQVNjLuUjERIwU=;
 b=Js5q4lD+A5EtYma3P8PemetzNBMs7ohd2kxsZRV/XUHWHotVYaRs6vDe1pWcT7zE7J
 54Hyer007sKbB3MNGI+y38bGmLRx7Nq7UkQO10kupTbe1Z8xWZAORHKu7jntTtMN4Yv6
 IHTBdlDrR1iuNBsPF3XlddLM7fOWrvUnB0PPEvNnBnyPv/UqxhJpyG70UqtCxCoM8Jud
 BB9LzNMy6kmbYjTU7r2uP4oO8nJw2StVOGWSNb9PvsWzmsuwG+mWIdbQKCnIPqqq1eO3
 s6/c+36AJgA9/dM0ncR//xpZ7s1mJgkuVFDb6OJYucA/EOyBE4tGQRsc1ZPP6jjrxvvY
 1UHg==
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDM6MjA6NDJQTSAtMDcwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTo1NSBQTSBUaG9tYXMgSGVsbHN0csO2
bSAoVk13YXJlKQo+IDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToKPiA+Cj4gPiBXZWxs
LCB3ZSdyZSB3b3JraW5nIG9uIHN1cHBvcnRpbmcgaHVnZSBwdWRzIGFuZCBwbWRzIGluIHRoZSBn
cmFwaGljcwo+ID4gVk1BcywgYWx0aG91Z2ggaW4gdGhlIHdyaXRlLW5vdGlmeSBjYXNlcyB3ZSdy
ZSBsb29raW5nIGF0IGhlcmUsIHdlIHdvdWxkCj4gPiBwcm9iYWJseSB3YW50IHRvIHNwbGl0IHRo
ZW0gZG93biB0byBQVEUgbGV2ZWwuCj4gCj4gV2VsbCwgdGhhdCdzIHdoYXQgdGhlIGV4aXN0aW5n
IHdhbGtlciBjb2RlIGRvZXMgaWYgeW91IGRvbid0IGhhdmUgdGhhdAo+ICJwdWRfZW50cnkoKSIg
Y2FsbGJhY2suCj4gCj4gVGhhdCBzYWlkLCBJIGFzc3VtZSB5b3Ugd291bGQgKm5vdCogd2FudCB0
byBkbyB0aGF0IGlmIHRoZSBodWdlCj4gcHVkL3BtZCBpcyBhbHJlYWR5IGNsZWFuIGFuZCByZWFk
LW9ubHksIGJ1dCBqdXN0IGNvbnRpbnVlLgo+IAo+IFNvIHlvdSBtYXkgd2FudCB0byBoYXZlIGEg
c3BlY2lhbCBwdWRfZW50cnkoKSB0aGF0IGhhbmRsZXMgdGhhdCBjYXNlLgo+IEV2ZW50dWFsbHku
IE1heWJlLiBBbHRob3VnaCBob25lc3RseSwgaWYgeW91J3JlIGRvaW5nIGRpcnR5IHRyYWNraW5n
LAo+IEkgZG91YnQgaXQgbWFrZXMgbXVjaCBzZW5zZSB0byB1c2UgbGFyZ2VwYWdlcy4KPiAKPiA+
IExvb2tpbmcgYXQgemFwX3B1ZF9yYW5nZSgpIHdoaWNoIHdoZW4gY2FsbGVkIGZyb20gdW5tYXBf
bWFwcGluZ19wYWdlcygpCj4gPiB1c2VzIGlkZW50aWNhbCBsb2NraW5nIChubyBtbWFwX3NlbSks
IGl0IHNlZW1zIHdlIHNob3VsZCBiZSBhYmxlIHRvIGdldAo+ID4gYXdheSB3aXRoIGlfbW1hcF9s
b2NrKCksIG1ha2luZyBzdXJlIHRoZSB3aG9sZSBwYWdlIHRhYmxlIGRvZXNuJ3QKPiA+IGRpc2Fw
cGVhciB1bmRlciB1cy4gU28gaXQncyBub3QgY2xlYXIgdG8gbWUgd2h5IHRoZSBtbWFwX3NlbSBp
cyBzdHJpY3RseQo+ID4gbmVlZGVkIGhlcmUuIEJldHRlciB0byBzb3J0IHRob3NlIHJlc3RyaWN0
aW9ucyBvdXQgbm93IHJhdGhlciB0aGFuIHdoZW4KPiA+IGh1Z2UgZW50cmllcyBzdGFydCBhcHBl
YXJpbmcuCj4gCj4gemFwX3B1ZF9yYW5nZSgpYWN0dWFsbHkgZG9lcyBoYXZlIHRoYXQKPiAKPiAg
ICAgICAgICAgICAgICBWTV9CVUdfT05fVk1BKCFyd3NlbV9pc19sb2NrZWQoJnRsYi0+bW0tPm1t
YXBfc2VtKSwgdm1hKTsKClRoZSBWTV9CVUcgaXMgYSBibGluZCBjb3B5IGZyb20gUE1EIGxheWVy
IGFuZCBpdCdzIGJvZ3VzLiBpX21tYXBfbG9jaygpCndvcmtzIGZpbmUgZm9yIGZpbGUgbWFwcGlu
Z3MuCgpUaGUgUE1EIHdhcyBpbnRlbmRlZCBmb3IgVEhQIGNhc2UgYXQgdGhlIHRpbWUgd2hlbiB0
aGVyZSB3ZXJlIG9ubHkKYW5vbi1USFAuIFRoZSBjaGVjayB3YXMgcmVsYXhlZCBhbmQgbGF0ZXIg
ZHJvcHBlZCBmb3IgZmlsZS1USFAgb24gUE1ECmxldmVsLiBJdCBoYXMgdG8gYmUgZHJvcHBlZCBv
biBQVUQgdG9vLiBXZSBkb24ndCBoYXZlIGFub24tVEhQIG9uIFBVRApsZXZlbCBhdCBhbGwsIG9u
bHkgREFYIHBsYXllZCB3aXRoIHRoZW0uCiAKLS0gCiBLaXJpbGwgQS4gU2h1dGVtb3YKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
