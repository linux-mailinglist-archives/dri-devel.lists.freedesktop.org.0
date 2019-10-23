Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A142E13BC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1286F6E9B1;
	Wed, 23 Oct 2019 08:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DD66E860
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 00:17:51 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 195so14516019lfj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 17:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TZ6PtzJKXyCbE4QgSRCknBL+ktlMMVZMJTZlai7sfRo=;
 b=kmoqfuUdNDEz8NBI+dG5qC2orBR4XxlBEKr2dM9DQOdKBJjbjzqo9h3bm1NUC9Fmt0
 8xr28EbOEdzzSdGkLFM2vRAEL3egJ+YCJqGsIzggmNZ9dRLuXFTWOw9crJOhqLJ1Fh7z
 y8ndOqkAguzNl1sqX9hZH4an+BDz7x6ONOkHwUiKDorWT3YB7j1SFroGc95aLoX9zU87
 PoT/RXczdPtfH9cq4ULJp2EBxI7d4Xu295UxeyagjI5xoK2BlvoHRe46twt0Km/CtPxc
 HBum2+koF2suSIQJKksCGqFW1WPTXuQ0PAjxG3GqTlRrf2v67D0rWiip5ow8DpVS3kwv
 b6Pw==
X-Gm-Message-State: APjAAAWNWbunCfdNBouMg4ksSeFU3WerdTioT/s8O0BICRFPFnnQ4KR7
 mvKZbashFLGNJIWIZ7ihdERb+4FfuXnAJviLUFOvyQ==
X-Google-Smtp-Source: APXvYqwhSkU3gwfa43CMQGaP9gD4LGrcVgE0palW4Riaoh2ocwxqd4w/qH5N/y3ru9WcGBG8F34YEwRT55n9prtCGRQ=
X-Received: by 2002:a19:ed16:: with SMTP id y22mr9369612lfy.166.1571789869408; 
 Tue, 22 Oct 2019 17:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <87h84rbile.fsf@intel.com> <20191002102428.zaid63hp6wpd7w34@holly.lan>
 <8736gbbf2b.fsf@intel.com>
 <CAL_quvQkFjkBjJC5wH2t5XmyEq9OKWYSbAv39BJWT1hrKO7j8g@mail.gmail.com>
 <87h84q9pcj.fsf@intel.com>
 <CAL_quvQoWnWqS5OQAqbLcBO-bR9_obr1FBc6f6mA1T00n1DJNQ@mail.gmail.com>
 <CAOw6vbJ7XX8=nrJDENfn2pacf4MqQOkP+x8JV0wbqzoMfLvZWQ@mail.gmail.com>
 <CAL_quvTe_v9Vsbd0u4URitojmD-_VFeaOQ1BBYZ_UGwYWynjVA@mail.gmail.com>
 <87sgo3dasg.fsf@intel.com>
 <CACK8Z6FF1CBmti797sYWS51j-8ag-pSL9RJ2r9NDibXk2M=tEQ@mail.gmail.com>
In-Reply-To: <CACK8Z6FF1CBmti797sYWS51j-8ag-pSL9RJ2r9NDibXk2M=tEQ@mail.gmail.com>
From: Rajat Jain <rajatja@google.com>
Date: Tue, 22 Oct 2019 17:17:12 -0700
Message-ID: <CACK8Z6HvekrGkFpQ-gmSvZRrS3gq-B2P-T1ihmF3JhK5v4QboQ@mail.gmail.com>
Subject: Re: New sysfs interface for privacy screens
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TZ6PtzJKXyCbE4QgSRCknBL+ktlMMVZMJTZlai7sfRo=;
 b=OePzI0s07XRspjzP6hpHptPYAZ91ykwFW/MOU3dwmxa7O3VXV8/w4u208iiiZRWJo7
 BF43iGHf6LVzyZbesaFS3xHd5qc3HWFUOcbJ/HwRDjUC2RoC3eGnfk2OmLfKkUjhDfs7
 pfeNOEQpIk2/TkZSNHdGXDE3Jpqmc3g4UtRqDHN5XfKtq/jMFSGLdA/DfuQ5uP2F4e70
 1iLnf+8oLxq6wsQwckvOMn6mkTVypJgxcw/tnv5eLJAB0DrznANAlyO04e3rnzau22oQ
 VTJl4vTTxCHgrmWHL9HTafweWh/kq0pzAX7RDMA8uY7gTVEQTtFKwuzknOPUI3+G0jv/
 phIg==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Ross Zwisler <zwisler@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Mat King <mathewk@google.com>,
 Sean Paul <seanpaul@chromium.org>, Jingoo Han <jingoohan1@gmail.com>,
 David Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Alexander Schremmer <alex@alexanderweb.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgNToxNCBQTSBSYWphdCBKYWluIDxyYWphdGphQGdvb2ds
ZS5jb20+IHdyb3RlOgo+Cj4gSGkgRm9sa3MsCj4KPiBPbiBNb24sIE9jdCA3LCAyMDE5IGF0IDEx
OjEzIFBNIEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+
Pgo+PiBPbiBNb24sIDA3IE9jdCAyMDE5LCBNYXQgS2luZyA8bWF0aGV3a0Bnb29nbGUuY29tPiB3
cm90ZToKPj4gPiBUaGF0IG1ha2VzIHNlbnNlOyBqdXN0IHRvIGNvbmZpcm0gY2FuIGEgcHJvcGVy
dHkgYmUgYWRkZWQgb3IgcmVtb3ZlZAo+PiA+IGFmdGVyIHRoZSBjb25uZWN0b3IgaXMgcmVnaXN0
ZXJlZD8KPj4KPj4gWW91IG5lZWQgdG8gY3JlYXRlIHRoZSBwcm9wZXJ0eSBiZWZvcmUgcmVnaXN0
ZXJpbmcgdGhlIGRybSBkZXZpY2UuIFlvdQo+PiBjYW4gYXR0YWNoL2RldGFjaCB0aGUgcHJvcGVy
dHkgbGF0ZXIsIGJ1dCBJIHNob3VsZCB0aGluayB5b3Uga25vdyBieSB0aGUKPj4gdGltZSB5b3Un
cmUgcmVnaXN0ZXJpbmcgdGhlIGNvbm5lY3RvciB3aGV0aGVyIGl0IHN1cHBvcnRzIHRoZSBwcml2
YWN5Cj4+IHNjcmVlbiBvciBub3QuCj4KPgoKSSBqdXN0IHBvc3RlZCBhIHBhdGNoIGZvciB0aGlz
IGhlcmU6CgpodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMC8yMi85NjcKCldvdWxkIGFwcHJl
Y2lhdGUgcmV2aWV3IGFuZCBjb21tZW50cy4KClRoYW5rcyAmIEJlc3QgUmVnYXJkcywKClJhamF0
Cj4KPj4KPj4KPj4gQlIsCj4+IEphbmkuCj4+Cj4+IC0tCj4+IEphbmkgTmlrdWxhLCBJbnRlbCBP
cGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
