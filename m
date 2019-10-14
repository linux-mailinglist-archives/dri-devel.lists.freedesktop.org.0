Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA90D6FE9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02B488FD2;
	Tue, 15 Oct 2019 07:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FC989ECD
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:16:05 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id c6so35961845ioo.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 01:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t44CqyvdXypuwtzNTJ7ymJovfCkTaCpIACjq52B13FE=;
 b=FUh3/7L9ThiyiyEGurI2Vc16d5MxVOCBbot4atixd1fBVADhczZ5lyP/KO9TQ6cszJ
 LKHv7J/83ZUX54GkCqURRfSeHNDArmQ2syor1s3pi7rEck7iuT2wfhNyUVsZZtEdBgVO
 PG5lp0+207HqPDOqaDZ+FtKdme6hPPWTjeuEuwqGrBJvCM2hCXpYhoCO8gqNUMJjBIfL
 ufCojshBIQCmdpzpIDzhRyemDbfrAt58B/mxw5t+ZIBnovhP3qh3k3uAs3dCc67UKYIP
 QWEOhaAE+o14uaR1trKn5rv9PjzLDZ+LtoisiEL7cUQ2l+vt7clL0rh38gVBv8s6lc8w
 RPFA==
X-Gm-Message-State: APjAAAUSbefbi/a11VSk2/ii6F/9CZgkDMaOJN3WAoR/dim14hJYFw6H
 R4bDfIU9kWcY8UC25lB2WF5QyPZPTJWlfy4sF2wBfA==
X-Google-Smtp-Source: APXvYqwLQ8EL+87kFnJZAnOI6uFthuTZJqtrvmnMJN6wDA31bnQPrVHdctZs00tKOaFLcdTgP9uegvfD+UtrZuLktaY=
X-Received: by 2002:a05:6602:248e:: with SMTP id
 g14mr19829138ioe.6.1571040964440; 
 Mon, 14 Oct 2019 01:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191007033200.13443-1-brgl@bgdev.pl> <20191014081220.GK4545@dell>
In-Reply-To: <20191014081220.GK4545@dell>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2019 10:15:53 +0200
Message-ID: <CAMRc=MfSiJY-85ZHM_aSxUDc6LkbG1FidRFgTHtbZy6hHiQ+iw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] backlight: gpio: simplify the driver
To: Lee Jones <lee.jones@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t44CqyvdXypuwtzNTJ7ymJovfCkTaCpIACjq52B13FE=;
 b=JK9+D8JY6bxWRDbYtmDx//zrK7L0P5ZaJiOA1u2JTy/ek0rC1FVjF5jbx8SF6OPnwM
 y36p/5at+welqaHGrpeciApYazXiC0HEwjfvfqfT75fnauattpvVQgA5+JjHIIw5Epe+
 BFm5EzGuJgp3mNjZOZTQrvS0bqwWhoOVOOhDa7eYnntod0vH1L3sRwunV3OTS7MhWLLR
 bdBgCHLnxqmC6n+VjUzcb/2EDArfWypGehE2YtuxWMKu51XpQg4M8+T5JmjUUPVxT/eV
 scRYIVaE5rhUNQtV8KHYgGmvdShVcQqKfqdI907x6Kf447HKopmeuc22GHcH8S+3lmxp
 6hfA==
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
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cG9uLiwgMTQgcGHFuiAyMDE5IG8gMTA6MTIgTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4gbmFwaXNhxYIoYSk6Cj4KPiBPbiBNb24sIDA3IE9jdCAyMDE5LCBCYXJ0b3N6IEdvbGFzemV3
c2tpIHdyb3RlOgo+Cj4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lA
YmF5bGlicmUuY29tPgo+ID4KPiA+IFdoaWxlIHdvcmtpbmcgb24gbXkgb3RoZXIgc2VyaWVzIHJl
bGF0ZWQgdG8gZ3Bpby1iYWNrbGlnaHRbMV0gSSBub3RpY2VkCj4gPiB0aGF0IHdlIGNvdWxkIHNp
bXBsaWZ5IHRoZSBkcml2ZXIgaWYgd2UgbWFkZSB0aGUgb25seSB1c2VyIG9mIHBsYXRmb3JtCj4g
PiBkYXRhIHVzZSBHUElPIGxvb2t1cHMgYW5kIGRldmljZSBwcm9wZXJ0aWVzLiBUaGlzIHNlcmll
cyB0cmllcyB0byBkbwo+ID4gdGhhdC4KPiA+Cj4gPiBUaGUgZmlyc3QgcGF0Y2ggYWRkcyBhbGwg
bmVjZXNzYXJ5IGRhdGEgc3RydWN0dXJlcyB0byBlY292ZWMyNC4gUGF0Y2gKPiA+IDIvNyB1bmlm
aWVzIG11Y2ggb2YgdGhlIGNvZGUgZm9yIGJvdGggcGRhdGEgYW5kIG5vbi1wZGF0YSBjYXNlcy4g
UGF0Y2hlcwo+ID4gMy00LzcgcmVtb3ZlIHVudXNlZCBwbGF0Zm9ybSBkYXRhIGZpZWxkcy4gTGFz
dCB0aHJlZSBwYXRjaGVzIGNvbnRhaW4KPiA+IGFkZGl0aW9uYWwgaW1wcm92ZW1lbnRzIGZvciB0
aGUgR1BJTyBiYWNrbGlnaHQgZHJpdmVyIHdoaWxlIHdlJ3JlIGFscmVhZHkKPiA+IG1vZGlmeWlu
ZyBpdC4KPiA+Cj4gPiBJIGRvbid0IGhhdmUgYWNjZXNzIHRvIHRoaXMgSFcgYnV0IGhvcGVmdWxs
eSB0aGlzIHdvcmtzLiBPbmx5IGNvbXBpbGUKPiA+IHRlc3RlZC4KPiA+Cj4gPiBbMV0gaHR0cHM6
Ly9sa21sLm9yZy9sa21sLzIwMTkvNi8yNS85MDAKPiA+Cj4gPiB2MSAtPiB2MjoKPiA+IC0gcmVi
YXNlZCBvbiB0b3Agb2YgdjUuMy1yYzEgYW5kIGFkanVzdGVkIHRvIHRoZSByZWNlbnQgY2hhbmdl
cyBmcm9tIEFuZHkKPiA+IC0gYWRkZWQgYWRkaXRpb25hbCB0d28gcGF0Y2hlcyB3aXRoIG1pbm9y
IGltcHJvdmVtZW50cwo+ID4KPiA+IHYyIC0+IHYzOgo+ID4gLSBpbiBwYXRjaCA3Lzc6IHVzZWQg
aW5pdGlhbGl6ZXJzIHRvIHNldCB2YWx1ZXMgZm9yIHBkYXRhIGFuZCBkZXYgbG9jYWwgdmFycwo+
ID4KPiA+IHYzIC0+IHY0Ogo+ID4gLSByZWJhc2VkIG9uIHRvcCBvZiB2NS40LXJjMQo+ID4gLSBy
ZW1vdmVkIGNoYW5nZXMgdGhhdCBhcmUgbm8gbG9uZ2VyIHJlbGV2YW50IGFmdGVyIGNvbW1pdCBl
YzY2NWI3NTZlNmYKPiA+ICAgKCJiYWNrbGlnaHQ6IGdwaW8tYmFja2xpZ2h0OiBDb3JyZWN0IGlu
aXRpYWwgcG93ZXIgc3RhdGUgaGFuZGxpbmciKQo+ID4gLSBhZGRlZCBwYXRjaCA3LzcKPiA+Cj4g
PiB2NCAtPlY1Ogo+ID4gLSBpbiBwYXRjaCA3Lzc6IGFkZGVkIGEgY29tbWVudCByZXBsYWNpbmcg
dGhlIG5hbWUgb2YgdGhlIGZ1bmN0aW9uIGJlaW5nCj4gPiAgIHB1bGxlZCBpbnRvIHByb2JlKCkK
PiA+Cj4gPiBCYXJ0b3N6IEdvbGFzemV3c2tpICg3KToKPiA+ICAgYmFja2xpZ2h0OiBncGlvOiBy
ZW1vdmUgdW5uZWVkZWQgaW5jbHVkZQo+ID4gICBzaDogZWNvdmVjMjQ6IGFkZCBhZGRpdGlvbmFs
IHByb3BlcnRpZXMgdG8gdGhlIGJhY2tsaWdodCBkZXZpY2UKPiA+ICAgYmFja2xpZ2h0OiBncGlv
OiBzaW1wbGlmeSB0aGUgcGxhdGZvcm0gZGF0YSBoYW5kbGluZwo+ID4gICBzaDogZWNvdmVjMjQ6
IGRvbid0IHNldCB1bnVzZWQgZmllbGRzIGluIHBsYXRmb3JtIGRhdGEKPiA+ICAgYmFja2xpZ2h0
OiBncGlvOiByZW1vdmUgdW51c2VkIGZpZWxkcyBmcm9tIHBsYXRmb3JtIGRhdGEKPiA+ICAgYmFj
a2xpZ2h0OiBncGlvOiB1c2UgYSBoZWxwZXIgdmFyaWFibGUgZm9yICZwZGV2LT5kZXYKPiA+ICAg
YmFja2xpZ2h0OiBncGlvOiBwdWxsIGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3RhdGUo
KSBpbnRvIHByb2JlCj4gPgo+ID4gIGFyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAu
YyAgICAgICAgIHwgIDMzICsrKystLQo+Cj4gSSBndWVzcyB3ZSdyZSBqdXN0IHdhaXRpbmcgZm9y
IHRoZSBTSCBBY2tzIG5vdz8KPgoKV2UndmUgYmVlbiB3YWl0aW5nIGZvciB0aGVtIGZvciBhIGNv
dXBsZSBtb250aHMgbm93IC0gdGhlIHNoIHBhdGNoZXMKaGF2ZW4ndCBjaGFuZ2VkIHNpbmNlIHYx
Li4uCgpSaWNoLCBZb3NoaW5vcmkgLSBjb3VsZCB5b3UgYWNrIHRoaXMgc28gdGhhdCBpdCBjYW4g
Z28gaW4gZm9yIHY1LjU/CgpUaGFua3MsCkJhcnRvc3oKCj4gPiAgZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyAgICAgfCAxMDggKysrKystLS0tLS0tLS0tLS0tLQo+ID4g
IGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5oIHwgICAzIC0KPiA+
ICAzIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDkxIGRlbGV0aW9ucygtKQo+ID4K
Pgo+IC0tCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dCj4gTGluYXJvIFNlcnZpY2VzIFRlY2huaWNh
bCBMZWFkCj4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0Nz
Cj4gRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
