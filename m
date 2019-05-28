Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30D52D07F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 22:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49926E062;
	Tue, 28 May 2019 20:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB626E062;
 Tue, 28 May 2019 20:37:10 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id l125so161061vsl.13;
 Tue, 28 May 2019 13:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=khgsL4zHXmHP6F1MadyNgdoEidU9Imdd1H0ZZf7hEJQ=;
 b=akuU5yFcDNAP21ktbhxvEOKmk6W6S+OKpHkqAtA3D3tGgC4QeJ1jNmre6DqD31VWhP
 qQpKrSK0Ej9TF8W3oR1hheO1WigKdVSwXfk3U238A6BM4EZ/QrltmrslUAHbwbtvGWJQ
 dBatLwRvZ76es4jjdpiWQzHlXGt0QRLVUCXbb9i7X7NyqnurVnoJg/XfWLiUcWycEUUn
 TQ08jx/CqobBrD2Y5uUS3Wl0EOYsrEkKTP0Xy5nHdeapM8XW6mxuGmMwDIA/k9Mqrd99
 5uZdOVQ6dOObWmV1OLnBGmU/+d/I+nIUkt6xRyyDVox61aKlM2sdqRwCRa3xIpA9lB3U
 vlxw==
X-Gm-Message-State: APjAAAW4n55wc3uVXbes3Vq7ET9qaDaMKp1o8RLHxPxJCjQ66t5FrxOS
 IqXuvImd8cMMQSsx8lwmZGZjXS7TNy2XW/r/LL8=
X-Google-Smtp-Source: APXvYqwPX168pHe0OC5u8BsdXGf5IL0NbkTTJv2r0tf1ggp1+R26lH+bE3N5RrkSw/VAjvi8uhgx1YedY1rZ9CDKdUA=
X-Received: by 2002:a05:6102:3ce:: with SMTP id
 n14mr2934947vsq.210.1559075829495; 
 Tue, 28 May 2019 13:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190525224149.4652-1-imirkin@alum.mit.edu>
 <CACAvsv76NmgiMtx+NrtbMrLo2EDU8nazgSvTmK19_Wz-XDVn8Q@mail.gmail.com>
In-Reply-To: <CACAvsv76NmgiMtx+NrtbMrLo2EDU8nazgSvTmK19_Wz-XDVn8Q@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 28 May 2019 16:36:58 -0400
Message-ID: <CAKb7UvgeyhTf3UfZ1rL4SsVn8PASvcM5TVipU_Sg8nRRB1K=rQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau/disp/nv50-: force scaler for
 any non-default LVDS/eDP modes
To: Ben Skeggs <skeggsb@gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnaCAuLi4gbG9va3MgbGlrZSB0aGlzIGRvZXNuJ3QgYWN0dWFsbHkgZG8gd2hhdCB3ZSB3YW50
LiBTZWUgdGhlCmxhc3QgY291cGxlIGNvbW1lbnRzIGluOgoKaHR0cHM6Ly9idWdzLmZyZWVkZXNr
dG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEwNjYwCgpJdCBzZWVtcyB0byB3b3JrIGFzIGV4cGVj
dGVkIHdpdGggIm1vZGUiIGluc3RlYWQgb2YgImFkanVzdGVkX21vZGUiLgpEb2VzIHRoYXQgbWFr
ZSBzZW5zZT8gSXQga2luZGEgZG9lcyBiYXNlZCBvbiB0aGUgbGF0ZXIgY29kZSwgd2hpY2gKY29w
aWVzIG1vZGUgaW50byBhZGp1c3RlZF9tb2RlLi4uCgpBc3N1bWluZyBpdCBtYWtlcyBzZW5zZSB0
byB1c2UgIm1vZGUiLCBCZW4sIHdhbnQgdG8ganVzdCBkbyBhIGZpeHVwCmxvY2FsbHksIG9yIHdh
bnQgbWUgdG8gc2VuZCBhIHJldmVydCArIG5ldyBwYXRjaD8KCiAgLWlsaWEKCk9uIE1vbiwgTWF5
IDI3LCAyMDE5IGF0IDI6MjQgQU0gQmVuIFNrZWdncyA8c2tlZ2dzYkBnbWFpbC5jb20+IHdyb3Rl
Ogo+Cj4gT24gU3VuLCAyNiBNYXkgMjAxOSBhdCAwODo0MSwgSWxpYSBNaXJraW4gPGltaXJraW5A
YWx1bS5taXQuZWR1PiB3cm90ZToKPiA+Cj4gPiBIaWdoZXIgbGF5ZXJzIHRlbmQgdG8gYWRkIGEg
bG90IG9mIG1vZGVzIG5vdCBhY3R1YWxseSBpbiB0aGUgRURJRCwgc3VjaAo+ID4gYXMgdGhlIHN0
YW5kYXJkIERNVCBtb2Rlcy4gQ2hhbmdpbmcgdGhpcyB3b3VsZCBiZSBleHRyZW1lbHkgaW50cnVz
aXZlIHRvCj4gPiBldmVyeW9uZSwgc28ganVzdCBmb3JjZSB0aGUgc2NhbGVyIG1vcmUgb2Z0ZW4u
IFRoZXJlIGFyZSBubyBwcmFjdGljYWwKPiA+IGNhc2VzIHdlJ3JlIGF3YXJlIG9mIHdoZXJlIGEg
TFZEUy9lRFAgcGFuZWwgaGFzIG11bHRpcGxlIHJlc29sdXRpb25zCj4gPiBleHBvc2VkLCBhbmQg
aTkxNSBhbHJlYWR5IGRvZXMgaXQgdGhpcyB3YXkuCj4gPgo+ID4gQnVnemlsbGE6IGh0dHBzOi8v
YnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMDY2MAo+ID4gU2lnbmVkLW9m
Zi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1Pgo+IFRoYW5rcyBJbGlhLCBn
cmFiYmVkIGJvdGggcGF0Y2hlcy4KPgo+ID4gLS0tCj4gPgo+ID4gVW50ZXN0ZWQgZm9yIG5vdywg
aG9waW5nIHRoYXQgdGhlIGJ1Z3ppbGxhIGZpbGVyIHdpbGwgdGVzdCBpdCBvdXQuIFNlZW1zCj4g
PiBvYnZpb3VzIHRob3VnaC4KPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52
NTAvZGlzcC5jIHwgOSArKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1
MC9kaXNwLmMKPiA+IGluZGV4IDEzNDcwMWE4MzdjOC4uZWY4ZDdhNzE1NjRhIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiA+IEBAIC0zMjIsOCArMzIy
LDEzIEBAIG52NTBfb3V0cF9hdG9taWNfY2hlY2tfdmlldyhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIsCj4gPiAgICAgICAgICAgICAgICAgc3dpdGNoIChjb25uZWN0b3ItPmNvbm5lY3Rvcl90
eXBlKSB7Cj4gPiAgICAgICAgICAgICAgICAgY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfTFZEUzoK
PiA+ICAgICAgICAgICAgICAgICBjYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9lRFA6Cj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAvKiBGb3JjZSB1c2Ugb2Ygc2NhbGVyIGZvciBub24tRURJRCBt
b2Rlcy4gKi8KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChhZGp1c3RlZF9tb2RlLT50
eXBlICYgRFJNX01PREVfVFlQRV9EUklWRVIpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAv
KiBEb24ndCBmb3JjZSBzY2FsZXIgZm9yIEVESUQgbW9kZXMgd2l0aAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICogc2FtZSBzaXplIGFzIHRoZSBuYXRpdmUgb25lIChlLmcuIGRpZmZlcmVu
dAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICogcmVmcmVzaCByYXRlKQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoYWRq
dXN0ZWRfbW9kZS0+aGRpc3BsYXkgPT0gbmF0aXZlX21vZGUtPmhkaXNwbGF5ICYmCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYWRqdXN0ZWRfbW9kZS0+dmRpc3BsYXkgPT0gbmF0aXZl
X21vZGUtPnZkaXNwbGF5ICYmCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgYWRqdXN0
ZWRfbW9kZS0+dHlwZSAmIERSTV9NT0RFX1RZUEVfRFJJVkVSKQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIG1vZGUg
PSBuYXRpdmVfbW9kZTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGFzeWMtPnNjYWxlci5m
dWxsID0gdHJ1ZTsKPiA+IC0tCj4gPiAyLjIxLjAKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTm91dmVhdSBtYWlsaW5nIGxpc3QKPiA+
IE5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
