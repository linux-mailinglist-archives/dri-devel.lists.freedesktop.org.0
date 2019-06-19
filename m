Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE054B2A3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6910D6E2AF;
	Wed, 19 Jun 2019 07:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9976E287
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 04:33:47 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id i10so34973235iol.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 21:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8r8ZWpOUsPGwi3ewR/uZDqYnd+4gRdP70o2Ut3enZJg=;
 b=TnqHHwYW9YWWQrYP1PHFV1emeXS1xgD+kcKKvxOaBhwUtD5m5vk+6v8PYH+n39TmRg
 nT+3ircVK0ImlNVjRHlRMAaS9GnDBPXmVNoHWcZt39f+FwdF+M3WzMStV9uvXYulhxhs
 KfFpXCsJXtrjqc+ExZLIZMhuXs5HbYkd+WW3nB7Pfg3DX/PFnFweWty6i476c1XB0P/A
 y7xGoVF67KkdF6dBwWdNk51ymyd8iK21LcUKUhELtw8V1SbsYWp+zYbgkzlfqKUrguRH
 YgoPtAOWxUSQBsUBEG5Q5s20laY6b/G79anqf4kMzLi4FBqtctcM0BV36ElfAwWwBp1W
 vAEQ==
X-Gm-Message-State: APjAAAXx9x2AHwJBiETH3umYqFpBLV3x6W2sAdcl8FUTxccO/z1w93P1
 DWUvtU79Zw62fTz1GJ4JbUWonozUnbghVV7tucY=
X-Google-Smtp-Source: APXvYqx6xw2EDD9sCd3KCvYIrcjzDch4J14Pw2Z3x8SzAI62kqWkXMh+hm66heZf/sm4Fj9RMl5vuOayteOlsoAfMZU=
X-Received: by 2002:a6b:4107:: with SMTP id n7mr26327566ioa.12.1560918826241; 
 Tue, 18 Jun 2019 21:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
 <20190612083252.15321-11-andrew.smirnov@gmail.com>
 <a1c125d2-1c7a-c190-8b7e-845a2ec1d2ea@ti.com>
 <CAHQ1cqG7dPFarphmBWSSqYAuO=6Kev4eFsBM09zUDJFek3UaOg@mail.gmail.com>
In-Reply-To: <CAHQ1cqG7dPFarphmBWSSqYAuO=6Kev4eFsBM09zUDJFek3UaOg@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 18 Jun 2019 21:33:34 -0700
Message-ID: <CAHQ1cqEG=Y+PKTV8it-qXzhmGskY2Uy=72VA8rKZu_ho9+4LcA@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] drm/bridge: tc358767: Add support for
 address-only I2C transfers
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8r8ZWpOUsPGwi3ewR/uZDqYnd+4gRdP70o2Ut3enZJg=;
 b=UaWBShTrnYRsceDDBA363Lc64o0CaKQi+IpRCeWxVUAMHn+rsf9Y49HflQ4pogw8JV
 p4KbowerxNYdpuDV/r8hx0nMpySOiQK1ZhlSeD9rnXyP+6ZWzznl3soHOCa29wRPCkYz
 +enC0VXBGqv2+7HP99/L/ymzjlqHph50BdfuPSb82+OcqVTCwjYJdMdgNmE90DjYweoh
 +2xREyWppruclvZC7UTEW8skfjqAtSSv13g/5WmosUzrdBdA06Er1sZ/3OqrCSgGbxC1
 b4KUnHPhpK9sl4Rq+m5G5MpalDdSEr4b9MnIR7usJP0VX9edYDcD4l4EUjTMHkwPdKbj
 14uw==
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

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgOToyMiBBTSBBbmRyZXkgU21pcm5vdiA8YW5kcmV3LnNt
aXJub3ZAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDU6NDgg
QU0gVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
SGksCj4gPgo+ID4gT24gMTIvMDYvMjAxOSAxMTozMiwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4g
PiA+IFRyYW5zZmVyIHNpemUgb2YgemVybyBtZWFucyBhIHJlcXVlc3QgdG8gZG8gYW4gYWRkcmVz
cy1vbmx5Cj4gPiA+IHRyYW5zZmVyLiBTaW5jZSB0aGUgSFcgc3VwcG9ydCB0aGlzLCB3ZSBwcm9i
YWJseSBzaG91bGRuJ3QgYmUganVzdAo+ID4gPiBpZ25vcmluZyBzdWNoIHJlcXVlc3RzLiBXaGls
ZSBhdCBpdCBhbGxvdyBEUF9BVVhfSTJDX01PVCBmbGFnIHRvIHBhc3MKPiA+ID4gdGhyb3VnaCwg
c2luY2UgaXQgaXMgc3VwcG9ydGVkIGJ5IHRoZSBIVyBhcyB3ZWxsLgo+ID4KPiA+IEkgYmlzZWN0
ZWQgdGhlIEVESUQgcmVhZCBpc3N1ZSB0byB0aGlzIHBhdGNoLi4uCj4gPgo+Cj4gSSBkb24ndCB0
aGluayBJJ3ZlIGhhZCBhbnkgcHJvYmxlbXMgb24gbXkgZW5kIHdpdGggdGhpcy4gSSdsbCBkb3Vi
bGUKPiBjaGVjay4gSXQgbWlnaHQgYmUgdGhlIGNhc2UgdGhhdCB5b3VycyBpcyB0aGUgb25seSBz
ZXR1cCB3aGVyZSB0aGUKPiBwcm9ibGVtIGNhbiBiZSByZXBybydkLCB0aG91Z2guIFdlIGNhbiBk
cm9wIHRoaXMgcGF0Y2ggaWYgeW91IGRvbid0Cj4gaGF2ZSB0aW1lL3dvdWxkIHJhdGhlciBub3Qg
ZGlnIGludG8gdGhpcy4KPgoKVHVybnMgb3V0IEkgZG8gaGF2ZSB0aGlzIHByb2JsZW0uIEp1c3Qg
ZGlkbid0IHBheSBlbm91Z2ggYXR0ZW50aW9uIHRvCm5vdGljZS4gV2lsbCBmaXggaW4gdjYuCgpU
aGFua3MsCkFuZHJleSBTbWlybm92Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
