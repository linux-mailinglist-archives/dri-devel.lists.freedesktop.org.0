Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D62837956
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51992892E7;
	Thu,  6 Jun 2019 16:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA07892E3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:16:05 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id n2so1557149vso.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 09:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=buyIznzUbeiW8dQt0ygVHDZTYPuTKe+CvIY71ec9DJE=;
 b=ahWv/h1+qQFztouF3ylRIB+EDYxDM4TWkzspqPSMDLRrz2yIOrrrT7vlKBKJaX6LDP
 IYS0GZ+BwBy24hH9Ed4FDRmAXu+/R+mRG5kCa4fs+3P+maxbIL4EU0R5JtVLM6id9sfN
 rXGl/HaPwB+DVjl/tjfzU0gpE9IlqK+kJ5D1TKB3RVVgSdWPUuKNh7uMDBiWhkqi5B2d
 1wvA5xUn5Z2zOsWm2K8qNTDDHaRM3acC5s0H+kheVU7DEXUiODVuRAT/AxGG5K4OVJWI
 kuqcuNEKZEMl2Eg/lkXy505t4DNspx+llHtMHN6wwDIU6rry/u0B+hMU1gfn1wEqKxSt
 Nj6w==
X-Gm-Message-State: APjAAAWXxhgmPIlVN07C9hk66y1Mp/EQfwdaWdw5D51ChFbS0BngkDDo
 0Tz53dQ6GwDUBk2v6Rcqb99gNyKrNS82Tq9NVB4=
X-Google-Smtp-Source: APXvYqzgOeup9aJbNi7cXCBbep0JgaI3OGX2D+ydGTRr2hoejPkRssHBSfoVtRNSssi5+NkKl7ItO2m06HrEv+MloEE=
X-Received: by 2002:a67:ec15:: with SMTP id d21mr26435265vso.186.1559837764462; 
 Thu, 06 Jun 2019 09:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
 <20190603004017.7114-7-imirkin@alum.mit.edu>
 <CACvgo51bT7Ut+Bh3hi-QUG1YSmtrY-LVwF23Wdv39fEWZuiptQ@mail.gmail.com>
 <CAKb7UvggsQ4mT-Rs6+BJNUgcGBmi7MXuPeDedgG4Dro0VMFLLg@mail.gmail.com>
In-Reply-To: <CAKb7UvggsQ4mT-Rs6+BJNUgcGBmi7MXuPeDedgG4Dro0VMFLLg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 6 Jun 2019 17:14:13 +0100
Message-ID: <CACvgo517pOVY6jJ2VsLE2W84sAjJGAFXSQcvmBsfP8y3Aqug_g@mail.gmail.com>
Subject: Re: [PATCH libdrm 06/10] modetest: don't pretend that atomic mode
 includes a format
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=buyIznzUbeiW8dQt0ygVHDZTYPuTKe+CvIY71ec9DJE=;
 b=RCmbmDsiK1R/PCh/m66WPvMCKbi73SLZjxeFGmzMGrld6OgE2TCiXEMD3NSgJnCahq
 jXkF9XZvYJNSbotkFXbdyxyQ6TbKKoih2I5jFGw76CFv5bLci2n9HmpdmiGAlAcbneUO
 qytOJDEF18BSuOes8Fmu8NpsuPvqKSXB443uNSCGko2AZdOa11hKO4d58A1l+nhgM5DF
 gIDSJvryF0DeiYSr7oOV8mutNxJmxLOFLb+Up+0kCnkO6yoq7ug6ICTJNO50xRPxIjDC
 4kmOyHwAVKhY24S5YQUuQenMeVfLAXJtCzRdu2tCkvo/+eirRQqICYBWMKh5Ko48NbUI
 zvEg==
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA2IEp1biAyMDE5IGF0IDE2OjU4LCBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1p
dC5lZHU+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gNiwgMjAxOSBhdCAxMTo1MSBBTSBFbWlsIFZl
bGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCAz
IEp1biAyMDE5IGF0IDAxOjQwLCBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+IHdy
b3RlOgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVt
Lm1pdC5lZHU+Cj4gPiA+IC0tLQo+ID4gPiAgdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYyB8IDQg
KystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMgYi90
ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCj4gPiA+IGluZGV4IDljODVjMDdiLi5hMWM4MWY2YyAx
MDA2NDQKPiA+ID4gLS0tIGEvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYwo+ID4gPiArKysgYi90
ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCj4gPiA+IEBAIC0xMzM1LDggKzEzMzUsOCBAQCBzdGF0
aWMgdm9pZCBhdG9taWNfc2V0X21vZGUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcGlwZV9h
cmcgKnBpcGVzLCB1bnNpZ25lZAo+ID4gPiAgICAgICAgICAgICAgICAgaWYgKHBpcGUtPm1vZGUg
PT0gTlVMTCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+Cj4g
PiA+IC0gICAgICAgICAgICAgICBwcmludGYoInNldHRpbmcgbW9kZSAlcy0lZEh6QCVzIG9uIGNv
bm5lY3RvcnMgIiwKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICBwaXBlLT5tb2RlX3N0ciwg
cGlwZS0+bW9kZS0+dnJlZnJlc2gsIHBpcGUtPmZvcm1hdF9zdHIpOwo+ID4gPiArICAgICAgICAg
ICAgICAgcHJpbnRmKCJzZXR0aW5nIG1vZGUgJXMtJWRIeiBvbiBjb25uZWN0b3JzICIsCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgcGlwZS0+bW9kZV9zdHIsIHBpcGUtPm1vZGUtPnZyZWZy
ZXNoKTsKPiA+Cj4gPiBBRkFJQ1Qgd2UgY2FuIGRyb3AgdGhlIGZvcm1hdCBvbiBtb2Rlc2V0IGFs
bCB0b2dldGhlci4gSSBjYW5ub3Qgc2VlCj4gPiBhbnl0aGluZyB0aGF0IHdvdWxkIHJlcXVpcmUg
aXQgLSByZWdhcmRsZXNzIGlmIHRoZSBtb2Rlc2V0IGlzIGF0b21pYwo+ID4gb3Igbm90Lgo+ID4g
UGx1cyB3ZSBjYW4gcmVtb3ZlIHRoZSAtLWhlbHAgc3RyaW5nIGFuZCBhcmd1bWVudCBwYXJzaW5n
IGNvZGUuCj4gPgo+ID4gQ2FuIEkgaW50ZXJlc3QgeW91IGluIGRvaW5nIHRoYXQ/Cj4KPiBUaGUg
Zm9ybWF0IHBsYXlzIHdpdGggYSBub24tYXRvbWljIG1vZGVzZXQuIEl0J3MgdXNlZCBmb3IgdGhl
IGZiIHRoYXQKPiBnZXRzIGFkZGVkLgo+ClJpZ2h0IHdpdGggYXRvbWljIHdlIGRvIHRoZSBtb2Rl
c2V0IGFuZCB0aGVuIGF0dGFjaCBhIGZiIHdoZW4KYXBwbGljYWJsZS4gV2l0aCBsZWdhY3kgd2Ug
cGFzcyB0aGUgZmIgZHVyaW5nIG1vZGVzZXQuIFVzaW5nIGFuCmludmFsaWQgZmIgd2UgZW5kIHVw
IHJlLXVzaW5nIHRoZSBjdXJyZW50bHkgYm91bmQgb25lLgpBbmQgc2luY2UgdGhlcmUgaXMgbm9u
ZSAtIHdlIG5lZWQgdG8gcHJvdmlkZSBhIHZhbGlkIG9uZS4KClRoYW5rcyBmb3IgdGhlIGNvcnJl
Y3Rpb24gOi0pCkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
