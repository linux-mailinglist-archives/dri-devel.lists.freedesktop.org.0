Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E96B2ECAA6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 07:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EF86E3E3;
	Thu,  7 Jan 2021 06:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938CE6E3E3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 06:49:21 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id cw27so6717855edb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jan 2021 22:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iluA/f+Nx9iV4l3x2XO+uEUXDpQareT2nFvYNJnsH5U=;
 b=r6tcrQG2/r/1bXPuM3no1kaZ76iN3GEwjWW/bK2ooP6Dysos6JF1c2RfN5OfXFqhLS
 K4daUnqvzUeN8ScOhnhRmY882C2r0ella8LhzTH6HqqZZZQdiUAM+Lc9rY8asQwizZxj
 4WTtRpysuaOKxbJXPlL4wlm7YxMxZlmdEpuvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iluA/f+Nx9iV4l3x2XO+uEUXDpQareT2nFvYNJnsH5U=;
 b=mLpwjp0jbY4EWbLS3HdygNIFJvTXlyuOoJ4O96E1PQtn9G2vZlehZz146t4gD9rNUx
 7W1vvqp0HA7uYfJHH3kZqHvTMIC4msEJ+4xzz6G7b0rm+lT2322ShQNbdwmsF/w3uZcE
 AuIwQEIbOtq4/jsy3rHM1jp6x5Cnvlk+ByQdxPwtBRzlGgTBvXLhXi1Xp/s5C7xaxwoX
 NwtfDZTLLznbis+zq8N9uO6BBzGksl/lKXJhEUKVait42GLFIDMMgyWXRPBMS/xShqiG
 4O2p4zqPO3zquuRU/eP44Bb4zVgvPo7kvO+siCwrhoYTc9zH5lh5HsUx9E70qXv5gHdo
 2gqA==
X-Gm-Message-State: AOAM530wSs2OFEQxjonjqF5C85PzMiUTAWdYgjl3QGGzjiaKic7VN5D0
 zpj1fMngl4kRMFGeUabyC+S/KEyG0ZKc3Q0rjnoMtQ==
X-Google-Smtp-Source: ABdhPJztcw6+ch3jIP1KsxwisrTgHXjVHJJf4yU30FjteHikhnzele/d/izfDLVgev1PeSNgdb48lclIc9s8z+pl29g=
X-Received: by 2002:a50:d80c:: with SMTP id o12mr558299edj.338.1610002159811; 
 Wed, 06 Jan 2021 22:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20201128125257.1626588-1-icenowy@aosc.io>
 <CAMty3ZCkEb9g5t6Hs5DN5yHXYvDhymriYqqV+6DZiC+Qb645ww@mail.gmail.com>
 <C1F366E9-0EDB-4679-BB93-92223F5B8C4A@aosc.io>
In-Reply-To: <C1F366E9-0EDB-4679-BB93-92223F5B8C4A@aosc.io>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 7 Jan 2021 12:19:08 +0530
Message-ID: <CAMty3ZBdQ=SipAPyQ0AKioYtW14BBgy0gZaq-F3x-Bhz4Wat6w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: feiyang-fy07024di26a30d: cleanup if panel
 attaching failed
To: Icenowy Zheng <icenowy@aosc.io>
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gNywgMjAyMSBhdCAxMDoxNiBBTSBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFv
c2MuaW8+IHdyb3RlOgo+Cj4KPgo+IOS6jiAyMDIx5bm0MeaciDbml6UgR01UKzA4OjAwIOS4i+WN
iDU6NDc6MjAsIEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiDlhpnliLA6
Cj4gPk9uIFNhdCwgTm92IDI4LCAyMDIwIGF0IDY6MjMgUE0gSWNlbm93eSBaaGVuZyA8aWNlbm93
eUBhb3NjLmlvPiB3cm90ZToKPiA+Pgo+ID4+IEF0dGFjaGluZyB0aGUgcGFuZWwgY2FuIGZhaWws
IHNvIGNsZWFudXAgd29yayBpcyBuZWNlc3NhcnksIG90aGVyd2lzZQo+ID4+IGEgcG9pbnRlciB0
byBmcmVlZCBzdHJ1Y3QgZHJtX3BhbmVsKiB3aWxsIHJlbWFpbiBpbiBkcm1fcGFuZWwgY29kZS4K
PiA+Pgo+ID4+IERvIHRoZSBjbGVhbnVwIGlmIHBhbmVsIGF0dGFjaGluZyBmYWlsZWQuCj4gPj4K
PiA+PiBGaXhlczogNjlkYzY3OGFiYzJiICgiZHJtL3BhbmVsOiBBZGQgRmVpeWFuZyBGWTA3MDI0
REkyNkEzMC1ECj4gPk1JUEktRFNJIExDRCBwYW5lbCIpCj4gPgo+ID5UaGUgZmFjdCB0aGF0IHRo
aXMgaGFzIGZhaWxlZCB0byBwcm9iZSBkdWUgdG8gcmVjZW50IGNoYW5nZXMgaW4KPiA+c3VuNmlf
bWlwaV9kc2kuYyBJIGRvbid0IGtub3cgaG93IHRvIHB1dCB0aGF0IGludG8gdGhlIGNvbW1pdCBt
ZXNzYWdlLgo+Cj4gSXQncyBub3QgcmVsYXRlZCwgd2Ugc2hvdWxkbid0IGFzc3VtZSB0aGlzIHBh
bmVsIGRyaXZlciB3aWxsIGFsd2F5cwo+IGJlIHVzZWQgd2l0aCBzdW54aSBTb0NzLgoKV2VsbCwg
SSdtIGF3YXJlIG9mIGl0LiBXaGF0IEknbSB0cnlpbmcgdG8gc2F5IGlzIHRoaXMgcGFuZWwgaGFz
CnJlZmVyZW5jZWQgd2l0aCBvbmUgb2YgZXhpdGluZyBwYW5lbCBpbiBhIHRyZWUgYW5kIHRoYXQg
aW5kZWVkIHJldHVybgptaXBpX2RzaV9hdHRhY2ggYW5kIGl0IHZlcmlmaWVkIHdpdGggRFNJIGhv
c3QgYXQgdGhhdCB0aW1lLgoKPgo+IEl0J3MgYSBwYW5lbCBkcml2ZXIgYnVnIHRoYXQgY2Fubm90
IGRlYWwgd2l0aCAtRVBST0JFX0RFRkVSIHdlbGwuCgpZZXMsIGllIHJlYXNvbiBJIGhhdmUgYWRk
ZWQgUmV2aWV3ZWQtYnkgdGFnIGFib3ZlLgoKSmFnYW4uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
