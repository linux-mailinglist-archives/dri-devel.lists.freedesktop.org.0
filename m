Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4D12543
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 01:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05AD89483;
	Thu,  2 May 2019 23:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D525D89483
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 23:54:47 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id i31so4788527qti.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 16:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8NF/HaBV7PUeVN04H2ZTJPEeduySqLW5r68DgJ6nm6Q=;
 b=Xo0ZLd08y1f/jVcpq52QT1xN0qpC1kNF+kyLaG+DCBs2YfWrE67ZyH5QhNMg3A7gun
 roleSIdKqnnHRNa1BPE5/LEUI7N0S+LpF00CJNj3Zlu79cTBcFeuVHkB69UAnAacpLvX
 AKqB303O0vurvq9G4tJcJt5wPEAnnxH/hUD+y2O0zNyNwvVrskx8a8zioTMrlh9AUpce
 NhMzjCXbcwWFDbGjdbu+zRN0UHc8DuXx24+9HsoZYsN2b22MD3GqZqUwPv1l6DmLKK5U
 EJS281f4HTxNb4W7IGpEt0pxWJh0lhWdFSkHPTu6EWDbPUMO/6uYFP+s4NKL2tibkiFm
 QAAw==
X-Gm-Message-State: APjAAAWZNof2dLTw4U4pfYc0yVfeCgcPUiQeNC7WvGbktc00Y2K2e0Dl
 /SDwsEuQS147ZYGXXa4tkXMZ+gjPImw9TlVfIf0=
X-Google-Smtp-Source: APXvYqy6yl9eFPpMxR4pBzXxUnt9cxiGJ8t6jUyn7dXv+ea5C9j+XlhptTK/PfRqiJH6Tj2uYePUvcz3C3c3WiKhx1I=
X-Received: by 2002:ac8:2728:: with SMTP id g37mr6007251qtg.264.1556841286845; 
 Thu, 02 May 2019 16:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190502104548.GX15144@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190502104548.GX15144@e110455-lin.cambridge.arm.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 May 2019 09:54:35 +1000
Message-ID: <CAPM=9txjGu8NxGROVcfRuZ_PhqY8Q2VHZaA_1cuwO9K3wccG6g@mail.gmail.com>
Subject: Re: [PULL] 2nd pull for malidp-next
To: Liviu Dudau <Liviu.Dudau@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8NF/HaBV7PUeVN04H2ZTJPEeduySqLW5r68DgJ6nm6Q=;
 b=iF/HocDuJWVivTkAjsKERsmYHjeEMw5n7am0JejpLpxoZL9fXgjdw/9TG5Phl7gJDk
 UmbQbwCXuhQY+YpX2p26g6HYFyfxSq2qr594qk5itcvSElOSbfd2CS+p2B8+UKYEazpb
 zgu2ygoR6inpC+kpc+uRgfUZxVvkZNu9hBfuORGALNIuORt5C0RtR4G/dKmoOkj9eQXV
 4FmDD1tTffGnIhqCro8tHmLxLvAHLNSPxRLl6N5cj1LzVXot6XGK3BEU/nZ5rwwu576p
 eV4XmZiNR5R/4w1s/9n/NpTpI2cV5FWZtPovIQRfQV7cg866hyD0+Cfuu+0EuW/jQw1b
 XDBQ==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 James Qian Wang <james.qian.wang@arm.com>,
 DRI devel <dri-devel@lists.freedesktop.org>,
 MaliDP Maintainers <malidp@foss.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyIE1heSAyMDE5IGF0IDIwOjQ1LCBMaXZpdSBEdWRhdSA8TGl2aXUuRHVkYXVAYXJt
LmNvbT4gd3JvdGU6Cj4KPiBIaSBEUk0gbWFpbnRhaW5lcnMsCj4KPiBUaGlzIGlzIHRoZSAybmQg
cHVsbCByZXF1ZXN0IGZvciB0aGUgbWFsaWRwLW5leHQuIFRoZSBuZXcgcGF0Y2hlcyBhZGQKPiBh
ZGRpdGlvbmFsIHN1cHBvcnQgZm9yIEFybSBNYWxpIEQ3MSBzbyB0aGF0IGl0IGNhbiBub3cgYmUg
ZW5hYmxlZAo+IGNvcnJlY3RseSBhbmQgYnJvdWdodCB1cCBvbiBhbnkgU29DIHRoYXQgY29udGFp
bnMgdGhlIElQLiBGcm9tIG5vdyBvbgo+IHdlIHdpbGwgc3RhcnQgZm9jdXNpbmcgb24gYWRkaW5n
IHdyaXRlYmFjaywgc2NhbGluZyBhbmQgb3RoZXIgdXNlZnVsCj4gZmVhdHVyZXMgdG8gYnJpbmcg
dGhlIGRyaXZlciB0byB0aGUgc2FtZSBsZXZlbCBvZiBtYXR1cml0eSBhcyBtYWxpLWRwLgo+Cj4g
UGxlYXNlIHB1bGwsCj4gTGl2aXUKPgo+Cj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2Ug
Y29tbWl0IDdjMTNlNWNjMjM5MTk1MDU0MWY0MWZjOWFiMDMzNmFhZTc3YzdmNjM6Cj4KPiAgIE1l
cmdlIHRhZyAnZHJtLWludGVsLW5leHQtZml4ZXMtMjAxOS0wNC0yNScgb2YgZ2l0Oi8vYW5vbmdp
dC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1pbnRlbCBpbnRvIGRybS1uZXh0ICgyMDE5LTA0LTI2
IDExOjM1OjU5ICsxMDAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6Cj4KPiAgIGdpdDovL2xpbnV4LWFybS5vcmcvbGludXgtbGQuZ2l0IGZvci11cHN0cmVhbS9t
YWxpLWRwCgpUaGlzIGJyYW5jaCBjb250YWluczoKY29tbWl0IDA0YzhhMWVjMzk1YjIyZjA2MGI4
MzZiNzJkMmQ0NDgwZTdlODU5ZjgKQXV0aG9yOiBMaXZpdSBEdWRhdSA8TGl2aXUuRHVkYXVAYXJt
LmNvbT4KRGF0ZTogICBUdWUgTWFyIDI2IDEwOjIzOjQwIDIwMTkgKzAwMDAKCiAgICBNQUlOVEFJ
TkVSUzogRml4IHBhdHRlcm4gZm9yIERvY3VtZW50YXRpb24gcGF0aCBmb3IgQXJtIE1hbGkgS29t
ZWRhCgphcyBpdCdzIGhlYWQsIGRpZCB5b3UgZm9yZ2V0IHRvIHB1c2g/CgpEYXZlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
