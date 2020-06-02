Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE161EB904
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 12:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2B16E190;
	Tue,  2 Jun 2020 10:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924366E190;
 Tue,  2 Jun 2020 10:00:00 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id a4so4825863pfo.4;
 Tue, 02 Jun 2020 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zp5PU9Twd2i2tzFPrLrjXtcDPzTLivpIOOvbhmocsuo=;
 b=dmnR1WvZuRPZ/6Vpb+2SuZ+t+QRjmdnWP4ZzKF3uTHDv6g1pEoMDEDg0XZp1RQS4Rc
 PcdwQZ29rNPnq3l2fjwqhuF7j/2HX+rBmez4tAy8HbfuXFzxbKgiqrjW/bkv/yD58r1Q
 RIPnaU6YMZn5W47hiL5Cwf7GTc+8XvqW2lhYOl2l6y2WsJw0EDbx5auoVaKZRGYT/MrW
 65P2sOwN8DsDt4Wk/Hj4ZI7jftv3djCsQ51f81pX/h2RYakYDO5iyWeC2mruTm4m/oAt
 spMKkoM1c0u9+ks+AAa++E4S2fyAHS2aD1Hvrb5vDAG2sKTV79mdr4NuETxL7Y2knUFA
 aapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zp5PU9Twd2i2tzFPrLrjXtcDPzTLivpIOOvbhmocsuo=;
 b=VQmVG5s9JvPFVRtg74qBjmx4SgX1uyY5MyjyDlbR0QqaAmXS2hxFXfkl+1XQDNlyzc
 Zqerbio7qweR18PgTcVQJQM9/ubvCl8j/WZ437pceUkQPp6WWTiRkZgQ/2FXD11+0iFD
 DWzR4CtrmjactiykCtCZa7f+o2T03J0n6fszNXRh0mzugLXmu9yC+tCR4U8gtZEyOo0t
 zc+sApHTpUPw6JyhiaBUVXGAVQpk0cT8Whyt2uf8ZUAozyuDB6DLq/RBEzVZGxlFItv6
 9z9Wrr6B8mrPd6Ii12OuBYcZeFvtyUdEMcp8qZUsyCtulkPj/2AB/Yr61bWTvHNCtmon
 MKXw==
X-Gm-Message-State: AOAM532qUbDf64XKpf6c5v1ADuymIzhUQg0jFI0eWeI0D9+U6ipP/Izj
 o4gj+fQji6bT4UwXccv/T410o5r/BCwwQuoG2HOeh3gYt04=
X-Google-Smtp-Source: ABdhPJyDp8msT2DNgjzkwwVUe+Cx8nDbX/Gkz2pS3jjzG2aw72oIk/YYF9TBdmXcCF3WA4qheLl5NIP1f08J9GZZI+k=
X-Received: by 2002:a63:545a:: with SMTP id e26mr22863595pgm.4.1591092000175; 
 Tue, 02 Jun 2020 03:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200602092030.31966-1-piotr.stankiewicz@intel.com>
 <CAHp75Ve9tdNB7s+gybsg-OUjA3HiZBgzxeOzw=qkx8t1Ybbmsg@mail.gmail.com>
 <CY4PR11MB1528E8F05A738675B0DC1A59F98B0@CY4PR11MB1528.namprd11.prod.outlook.com>
In-Reply-To: <CY4PR11MB1528E8F05A738675B0DC1A59F98B0@CY4PR11MB1528.namprd11.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jun 2020 12:59:48 +0300
Message-ID: <CAHp75VdmaGchzGCQ1ch4-9nj=5EKFAndUCKRZKhhiSRrbTwnnA@mail.gmail.com>
Subject: Re: [PATCH 07/15] drm/amdgpu: use PCI_IRQ_MSI_TYPES where appropriate
To: "Stankiewicz, Piotr" <piotr.stankiewicz@intel.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMiwgMjAyMCBhdCAxMjo1OCBQTSBTdGFua2lld2ljeiwgUGlvdHIKPHBpb3Ry
LnN0YW5raWV3aWN6QGludGVsLmNvbT4gd3JvdGU6Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQo+ID4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29t
Pgo+ID4gU2VudDogVHVlc2RheSwgSnVuZSAyLCAyMDIwIDExOjQ5IEFNCj4gPiBUbzogU3Rhbmtp
ZXdpY3osIFBpb3RyIDxwaW90ci5zdGFua2lld2ljekBpbnRlbC5jb20+Cj4gPiBDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPjsgQ2hyaXN0aWFuIEvDtm5pZwo+ID4g
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47IERhdmlkIFpob3UgPERhdmlkMS5aaG91QGFtZC5j
b20+OyBEYXZpZAo+ID4gQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPjsgYW1kLQo+ID4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJp
LWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgTGludXgKPiA+IEtlcm5l
bCBNYWlsaW5nIExpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gPiBTdWJqZWN0
OiBSZTogW1BBVENIIDA3LzE1XSBkcm0vYW1kZ3B1OiB1c2UgUENJX0lSUV9NU0lfVFlQRVMgd2hl
cmUKPiA+IGFwcHJvcHJpYXRlCj4gPiBPbiBUdWUsIEp1biAyLCAyMDIwIGF0IDEyOjI0IFBNIFBp
b3RyIFN0YW5raWV3aWN6Cj4gPiA8cGlvdHIuc3RhbmtpZXdpY3pAaW50ZWwuY29tPiB3cm90ZToK
Ci4uLgoKPiA+ID4gICAgICAgICAgICAgICAgIGludCBudmVjID0gcGNpX21zaXhfdmVjX2NvdW50
KGFkZXYtPnBkZXYpOwo+ID4gPiAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzOwo+
ID4gPgo+ID4gPiAtICAgICAgICAgICAgICAgaWYgKG52ZWMgPD0gMCkgewo+ID4gPiArICAgICAg
ICAgICAgICAgaWYgKG52ZWMgPiAwKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBmbGFn
cyA9IFBDSV9JUlFfTVNJX1RZUEVTOwo+ID4gPiArICAgICAgICAgICAgICAgZWxzZQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBmbGFncyA9IFBDSV9JUlFfTVNJOwo+ID4gPiAtICAgICAg
ICAgICAgICAgfSBlbHNlIHsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgPSBQ
Q0lfSVJRX01TSSB8IFBDSV9JUlFfTVNJWDsKPiA+ID4gLSAgICAgICAgICAgICAgIH0KPiA+ID4g
Kwo+ID4gPiAgICAgICAgICAgICAgICAgLyogd2Ugb25seSBuZWVkIG9uZSB2ZWN0b3IgKi8KPiA+
ID4gICAgICAgICAgICAgICAgIG52ZWMgPSBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMoYWRldi0+cGRl
diwgMSwgMSwgZmxhZ3MpOwo+ID4KPiA+IEknbSBub3Qgc3VyZSBpZiB5b3UgaGF2ZSBzZWVuIG15
IGxhc3QgY29tbWVudCBpbnRlcm5hbGx5IGFib3V0IHRoaXMgcGF0Y2guCj4gPgo+ID4gSSBkb24n
dCB1bmRlcnN0YW5kIHdoeSB3ZSBuZWVkIHRoZXNlIHBjaV9tc2l4X3ZlY19jb3VudCgpIGZvbGxv
d2VkIGJ5Cj4gPiBjb25kaXRpb25hbCBhdCBhbGwuCj4gPiBQZXJoYXBzIHdlIG1heSBzaW1wbGUg
ZHJvcCBhbGwgdGhlc2UgYW5kIHN1cHBseSBmbGFnIGRpcmVjdGx5Pwo+ID4KPiA+IEJ1dCBPVE9I
LCBJIGRvbid0IGtub3cgdGhlIGluaXRpYWwgbW90aXZhdGlvbiwgc28sIHRoZSBhYm92ZSBwYXRj
aCBpcwo+ID4gbm9uLWludHJ1c2l2ZSBhbmQga2VlcHMgb3JpZ2luYWwgbG9naWMuCj4gPgo+Cj4g
U29ycnksIEkgbXVzdCBoYXZlIG1pc3VuZGVyc3Rvb2Qgb3IgbWlzc2VkIHRoYXQgY29tbWVudC4g
SSBhbSBoYXBweQo+IHRvIGRvIGEgVjIgaWYgZHJvcHBpbmcgdGhlIGNvbmRpdGlvbmFsIGlzIHBy
ZWZlcmFibGUuCgpMZXQncyB3YWl0IGZvciBBTUQgcGVvcGxlIHRvIGNvbmZpcm0gZWl0aGVyLgoK
LS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
