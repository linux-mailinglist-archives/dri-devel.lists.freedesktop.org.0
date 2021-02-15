Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4A731BB41
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 15:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925C16E2DE;
	Mon, 15 Feb 2021 14:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBAF6E878;
 Mon, 15 Feb 2021 14:39:42 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id fa16so3854210pjb.1;
 Mon, 15 Feb 2021 06:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4k/YlfJBwWB/CB9z3j4IwxeWRKuiJsOpEaK3C24WkHk=;
 b=k0cKC4YN6xyUE2B/OZFXTOW9hvFzaOa/URb+GHSCBxTTmvHlMC9Eta86bh6fCS9h2p
 y66p0KfJrrfzJdHwjKlIKVB09VTVbd8uO5LXSTfEckTSNA43ibpSr8FxWBvDdzmW/BWP
 D111hPR6Xc8SNuwH0bo7QeN6FPMIDV5Y47SI04WrnHpsqUW7Pn19GxIBUPAD78SOfWtE
 LysnRjPtGWRF1ja99qJEZ6qCT91Y+1p89jqnovBYM8L3YBS6mmwrAIHWcWUHvpfD2Por
 THlYbftsWLvbsoIK6qHMb55DNXsFpGqLgZr/IxGSdJOXdfxUNuqxPX8Wt22SgCOeFLSW
 hJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4k/YlfJBwWB/CB9z3j4IwxeWRKuiJsOpEaK3C24WkHk=;
 b=huG5sf5ReJ9801xVyMp8Ap0zEFHqepsB7SBWbnRGk8KChZC4AAd1O2fh2ehMe/eTV8
 wiV1/aU7twXaYDujnIsiCGADXyPaMnuif3AJu4zcM/SxTITxalLWd17QuRbGcUdDsW12
 EnslVZs9fCktVkl1nANlhN2ophpCrTunrWdcaxLIk9kfyxLKMoy9OIHEjRBt6884xOqH
 9cM8sx/madmb1/0IUz/maZoqtzrvhuOk5UqyZzFfvWDsqJN2plxONSAoCwvPKqvlAoO6
 gQ4wws3zvmYZoEO8gIPAlDDtrraTbBG985Fl/DeFEkFdSrqsg2ajuwTQYWj9PpWuyC34
 Lghg==
X-Gm-Message-State: AOAM5333wNrFvuCDeZENOG+iOaZPzHwRZQI0AIvFkMHYzVL7w1X4SUSL
 6ofaxEup1cEUEMjse7G4FOPCvvAyWftSAMco1JI=
X-Google-Smtp-Source: ABdhPJy9SDAXtfrqtid4Hgf/WmX56bcIzMX0hLwcVyFTihSbcDK6SFjwAfBNq9cDuyKpg4C7ydYrGf9glnfzwN5MZwk=
X-Received: by 2002:a17:90a:1b23:: with SMTP id
 q32mr16831579pjq.181.1613399982663; 
 Mon, 15 Feb 2021 06:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20210215142137.64476-1-andriy.shevchenko@linux.intel.com>
 <43456ba7-c372-84cc-4949-dcb817188e21@amd.com>
In-Reply-To: <43456ba7-c372-84cc-4949-dcb817188e21@amd.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Feb 2021 16:39:26 +0200
Message-ID: <CAHp75VfVXnqdVRAPQ36vZeD-ZMCjWmjA_-6T=jnOEVMne4bv0g@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] string: Consolidate yesno() helpers under string.h
 hood
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Mladek <pmladek@suse.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Mikita Lipski <mikita.lipski@amd.com>, amd-gfx@lists.freedesktop.org,
 Jakub Kicinski <kuba@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Eryk Brol <eryk.brol@amd.com>, netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Raju Rangoju <rajur@chelsio.com>, Alex Deucher <alexander.deucher@amd.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K0NjOiBTYWthcmkgYW5kIHByaW50ayBwZW9wbGUKCk9uIE1vbiwgRmViIDE1LCAyMDIxIGF0IDQ6
MjggUE0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToK
PiBBbSAxNS4wMi4yMSB1bSAxNToyMSBzY2hyaWViIEFuZHkgU2hldmNoZW5rbzoKPiA+IFdlIGhh
dmUgYWxyZWFkeSBmZXcgc2ltaWxhciBpbXBsZW1lbnRhdGlvbiBhbmQgYSBsb3Qgb2YgY29kZSB0
aGF0IGNhbiBiZW5lZml0Cj4gPiBvZiB0aGUgeWVzbm8oKSBoZWxwZXIuICBDb25zb2xpZGF0ZSB5
ZXNubygpIGhlbHBlcnMgdW5kZXIgc3RyaW5nLmggaG9vZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPgo+
IExvb2tzIGxpa2UgYSBnb29kIGlkZWEgdG8gbWUsIGZlZWwgZnJlZSB0byBhZGQgYW4gQWNrZWQt
Ynk6IENocmlzdGlhbgo+IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB0byB0aGUg
c2VyaWVzLgoKVGhhbmtzLgoKPiBCdXQgbG9va2luZyBhdCB0aGUgdXNlIGNhc2VzIGZvciB0aGlz
LCB3b3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2UgdG8KPiB0ZWFjaCBrcHJpbnRmIHNvbWUgbmV3
IGZvcm1hdCBtb2RpZmllciBmb3IgdGhpcz8KCkFzIGEgbmV4dCBzdGVwPyBJSVJDIFNha2FyaSBo
YXMgYXQgc29tZSBwb2ludCB0aGUgc2VyaWVzIGNvbnZlcnRlZAp5ZXNubyBhbmQgQ28uIHRvIHNv
bWV0aGluZyB3aGljaCBJIGRvbid0IHJlbWVtYmVyIHRoZSBkZXRhaWxzIG9mLgoKR3V5cywgd2hh
dCBkbyB5b3UgdGhpbms/CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
