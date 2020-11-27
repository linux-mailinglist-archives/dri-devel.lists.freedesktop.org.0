Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E15572C7C39
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BFE6E3F9;
	Mon, 30 Nov 2020 01:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA046EB8C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 13:12:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z5so941725wmf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 05:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rrtkGYOSLzR+T0+VO0vIc/zBIcxRJN0r5JpmICMLphw=;
 b=FDsHUe7i/4e/jxh4782Dqv7sPxbspu00OSmK6tMXL1Sbl75HzuN0tjbxrjgQgvR24d
 N5BM9sOCEPWDChEIo4Kh3XOJGjF4JnYJXxUnDWY5N0KzAcBEP5r8mjM7VIvi1pTegCOy
 sOomVz2H2G5N5ABfpL8uCPdEtaNAQUCUOm4FUYslZmuaGvRSEY42I/rV+qK/iJRKa/57
 eWZDP+jCbTOkKhAAdGfmiQD1ILH3lW1tomcO7hFJgNw+0Z/4rJeCRBL44jdKD04Z4Zq7
 uK8dEfFD3tCkh3pEp6eOHXOJX6CkA9a9U820cTrDnb6j1laoWyL0vzI1KnELEFzvYqbt
 9ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rrtkGYOSLzR+T0+VO0vIc/zBIcxRJN0r5JpmICMLphw=;
 b=IQPsmJ4E6ypWnlSTY7k+x2sz2F0yi054ambGgOTdMueNthay20VkKQNSeoJxaoTVqg
 53ef0ELd5yWflRyhR2zU0O4mnBYCpC6kWsYdlP+DEjQt9j00gDkhpaVx46iUyJcJSLQb
 TkxV3Pt0TokApcVXuuq9ToYNybdFBZgvzgKzVa0Ub7wbPPSYKBLFErCxEJp6KzS1V08/
 aysR8A5GASMcTnUWPmb6XLahK67BYlMp4I3h+FvW/HtknQfYFrXErlTRpFtoCJI3Biua
 +7HWbLuEYUkKFjXcY2FCvdGBwzHQsxFKOTVV0irsuLr4bOBTKxkZeubFF8VlYe6Uitdk
 wggQ==
X-Gm-Message-State: AOAM5324QMrmgCO64SpBl+ICFIpGZZ9RXmtV1quE1NQGDO6nMg8D8yeb
 iQ8h/aS0hd+tFNuFhhxtDG8=
X-Google-Smtp-Source: ABdhPJxRD3+6sGn7nB3ojyYoRG+XCb50zjvwetcPIQmkvVh7VF+hVxRrOEuUiW5edZkFy+yi9P3u7A==
X-Received: by 2002:a1c:ba56:: with SMTP id k83mr2376844wmf.128.1606482740515; 
 Fri, 27 Nov 2020 05:12:20 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id x4sm14694700wrv.81.2020.11.27.05.12.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Nov 2020 05:12:19 -0800 (PST)
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
 <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
 <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
 <1fe9fed7-f619-eb6a-6e31-b9eadbf09bad@ti.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <8010e452-745a-ac12-bc02-5537305c70ed@gmail.com>
Date: Fri, 27 Nov 2020 15:10:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1fe9fed7-f619-eb6a-6e31-b9eadbf09bad@ti.com>
Content-Language: en-GB
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyNy4xMS4yMCDQsy4gMTM6NDUg0YcuLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiBPbiAy
Ny8xMS8yMDIwIDAxOjE3LCBJdmF5bG8gRGltaXRyb3Ygd3JvdGU6Cj4+IEhpIFRvbWksCj4+Cj4+
IE9uIDI2LjExLjIwINCzLiAxNjoxMSDRhy4sIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+Pj4gSGkg
QWFybywgSXZheWxvLAo+Pj4KPj4+IE9uIDI0LzExLzIwMjAgMjM6MDMsIEl2YXlsbyBEaW1pdHJv
diB3cm90ZToKPj4+Cj4+Pj4gSXMgdGhlcmUgYW55IHByb2dyZXNzIG9uIHRoZSBpc3N1ZT8gSSB0
cmllZCA1LjkuMSBhbmQgc3RpbGwgbm90aGluZyBkaXNwbGF5ZWQuCj4+Pgo+Pj4gQ2FuIHlvdSB0
ZXN0IHRoZSBhdHRhY2hlZCBwYXRjaD8KPj4+Cj4+Cj4+IFdpdGggdGhpcyBwYXRjaCBJIGRvbid0
IHNlZSBvb3BzIHRoYXQgQWFybyByZXBvcnRlZCwgc286Cj4+Cj4+IFRlc3RlZC1ieTogSXZheWxv
IERpbWl0cm92IDxpdm8uZy5kaW1pdHJvdi43NUBnbWFpbC5jb20+Cj4+Cj4+IFNlZW1zIHRvIGZp
eCB0aGUgcGFydGljdWxhciBpc3N1ZSwgaG93ZXZlciwgbm93IHdlIGdldCBhbm90aGVyIG9vcHMu
IEFzIHRoaXMgaXMgbm90IHVwc3RyZWFtIGtlcm5lbAo+PiBidXQgb25lIHdpdGggUFZSIHJlbGF0
ZWQgcGF0Y2hlcywgSSB3aWxsIHRyeSBhZ2FpbiB3aXRoIHZhbmlsbGEgNS45Lgo+Pgo+PiBKdXN0
IGluIGNhc2Ugb29wcyByaW5ncyBhbnkgYmVsbHMgKHRoZSBsaW5lIGluIHF1ZXN0aW9uIGlzCj4+
IGh0dHBzOi8vZ2l0aHViLmNvbS9tYWVtby1sZXN0ZS9kcm9pZDQtbGludXgvYmxvYi9tYWVtby01
LjkvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyNMODAxKQo+IAo+IERvIHRoZSBQ
VlIgcGF0Y2hlcyB0b3VjaCBvbWFwZHJtPyBUaGUgY2FsbCBzdGFjayBsb29rcyBsaWtlIG5vcm1h
bCBib290IHRpbWUgcHJvYmluZyBzdHVmZiwgbm90Cj4gc29tZXRoaW5nIGhhcHBlbmluZyBsYXRl
ciAocG9zc2libHkgZnJvbSBQVlIpLgo+IAoKcHZyIGRyaXZlciBpcyBub3QgZXZlbiBlbmFibGVk
IGluIHRoYXQgcGFydGljdWxhciBjb25maWcsIGhvd2V2ZXIsIEkgc2VlIAoiSEFDSzogZHJtL29t
YXA6IEFkZCBvbWFwZHJtIHBsdWdpbiBBUEkiIHBhdGNoIGluIHRoZSB0cmVlIHRoYXQgdG91Y2hl
cyAKb21hcC1nZW0uYywgSSBkb24ndCByZWFsbHkgd2FudCB0byBqdXN0IGNyZWF0ZSBzb21lIG5v
aXNlIGZvciBwcm9ibGVtcyAKdGhhdCBhcmUgY3JlYXRlZCBieSBvdXQtb2YtdHJlZSBwYXRjaGVz
LiBBbmQgeWVhaCwgaXQgbG9va3MgbGlrZSBhIApub3JtYWwgYm9vdCB0aW1lIHByb2Jpbmcgc3R1
ZmYuIEFzIHNvb24gYXMgSSBoYXZlIHNvbWUgc3BhcmUgdGltZSAKKGhvcGVmdWxseSBsYXRlciB0
b2RheSkgSSB3aWxsIHRyeSB2YW5pbGxhIDUuOS54IHdpdGggCm9tYXAycGx1c19kZWZjb25maWcg
YW5kIHdpbGwgcmVwb3J0LgoKSXZvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
