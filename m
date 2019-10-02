Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458C9C8B71
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 16:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8486E04E;
	Wed,  2 Oct 2019 14:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5006E04E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 14:40:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b9so19991136wrs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 07:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xuPflzsn/0nMabRW/MT553ev9ccDXsf7U9hGD8MKLiQ=;
 b=IsPg1q0vWHh9Ckq5msuaKLx6/8TasBdcH5jXz5i+bU0D5qVSrS/b/tQ3VhmiZVhoCQ
 hsFKN4qwzeWEebzUkpGFTspE+crLz/+VMyjrgWWOr5Z4mXQz8w1IboAbNyq6/BqDB3av
 cAzAvB2NotZHiGCtkmBpeIwWVpjCsXOo3qYtJmtOkqsLYnSWV9nUgT5O5+sh+95lG4N9
 ZyzNqi+wJN5tAom+Ce03AhRTEjXS+WcZ0q+fM6K5hQuv4XV3LNpREtmuM3GarYStabWV
 fU4jug5F+LSsOQCgdo6oCMKHuna2aq2nhQHl0lIJDQPCxtkI+5qFstruTfgnrdfCaAc2
 ozQw==
X-Gm-Message-State: APjAAAVmJRbU6+R2723nS4QlmiuOT5SoVblG7jaEId5FgTNw4mVz1qMZ
 qCPYo7i1geDdPoqu0O6NTG46sA==
X-Google-Smtp-Source: APXvYqxQzBe+7CgqDzvsjEknR8XWWPUStRqOZFa+eeAeIp6SkL1kb0FfgkR6tRNbregbg88YHzUFfg==
X-Received: by 2002:adf:e64e:: with SMTP id b14mr3258477wrn.16.1570027231302; 
 Wed, 02 Oct 2019 07:40:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u10sm5853717wmm.0.2019.10.02.07.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 07:40:30 -0700 (PDT)
Date: Wed, 2 Oct 2019 15:40:28 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v4 7/7] backlight: gpio: pull
 gpio_backlight_initial_power_state() into probe
Message-ID: <20191002144028.6lljre76zxd52oui@holly.lan>
References: <20191001125837.4472-1-brgl@bgdev.pl>
 <20191001125837.4472-8-brgl@bgdev.pl>
 <20191002103318.6owxberhml6mbtxm@holly.lan>
 <CAMRc=Me8RmYLh9WKYma7XE1H7tEZ8Jd-wsFyKVv_etO0T92zwg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=Me8RmYLh9WKYma7XE1H7tEZ8Jd-wsFyKVv_etO0T92zwg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=xuPflzsn/0nMabRW/MT553ev9ccDXsf7U9hGD8MKLiQ=;
 b=fOezBZRIOhBkH0+vOGOc3bn1f17r8HHWo8A5N5YSHRzL4/NECJx88ValUy/FtgO38s
 wrpkjJPcQaNWYASNYWewe6y7sx5LBiDuBUM7dG+3P/DOmLVVVtfPpbzSc3lGVvsuitsH
 pt+zI5lzIvDBkRvauPQlVLyDxzXBETF5eU5vGfr6XVPiKCgbd1QHVop9rag2R7cTAXPr
 XO0RBqOh9es8AVuKG1hWJL4vtGMVZSb1P/uRxHo6L0B7y04cf8gvl+cpjIdE8uOkNlzo
 i8xMJi8/uES3znh5rQyWSpRNdcbndC0ts2GFvEQPTsvIksQQW3WsfUSbFFT20Srw8Q5R
 Kxcg==
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
Cc: Jacopo Mondi <jacopo@jmondi.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDE6NDY6MTdQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiDFm3IuLCAyIHBhxbogMjAxOSBvIDEyOjMzIERhbmllbCBUaG9tcHNvbiA8
ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+IG5hcGlzYcWCKGEpOgo+ID4KPiA+IE9uIFR1ZSwg
T2N0IDAxLCAyMDE5IGF0IDAyOjU4OjM3UE0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3Jv
dGU6Cj4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJy
ZS5jb20+Cj4gPiA+Cj4gPiA+IFRoZSBwcm9iZSBmdW5jdGlvbiBpbiB0aGUgZ3Bpby1iYWNrbGln
aHQgZHJpdmVyIGlzIHF1aXRlIHNob3J0LiBJZiB3ZQo+ID4gPiBwdWxsIGdwaW9fYmFja2xpZ2h0
X2luaXRpYWxfcG93ZXJfc3RhdGUoKSBpbnRvIHByb2JlIHdlIGNhbiBkcm9wIHR3bwo+ID4gPiBt
b3JlIGZpZWxkcyBmcm9tIHN0cnVjdCBncGlvX2JhY2tsaWdodCBhbmQgc2hyaW5rIHRoZSBkcml2
ZXIgY29kZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIHwgMzYgKysrKysrKystLS0tLS0tLS0tLS0tLS0t
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0p
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2Jh
Y2tsaWdodC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+ID4g
PiBpbmRleCA2MjQ3Njg3YjYzMzAuLjM3ZWMxODRmMGM1YyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+ID4gPiArKysgYi9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gPiA+IEBAIC0xNywxMSArMTcsOCBA
QAo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiA+ID4KPiA+ID4gIHN0cnVjdCBncGlv
X2JhY2tsaWdodCB7Cj4gPiA+IC0gICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKPiA+ID4gICAgICAg
c3RydWN0IGRldmljZSAqZmJkZXY7Cj4gPiA+IC0KPiA+ID4gICAgICAgc3RydWN0IGdwaW9fZGVz
YyAqZ3Bpb2Q7Cj4gPiA+IC0gICAgIGludCBkZWZfdmFsdWU7Cj4gPiA+ICB9Owo+ID4gPgo+ID4g
PiAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF91cGRhdGVfc3RhdHVzKHN0cnVjdCBiYWNrbGln
aHRfZGV2aWNlICpibCkKPiA+ID4gQEAgLTUzLDQxICs1MCwyNCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGJhY2tsaWdodF9vcHMgZ3Bpb19iYWNrbGlnaHRfb3BzID0gewo+ID4gPiAgICAgICAuY2hl
Y2tfZmIgICAgICAgPSBncGlvX2JhY2tsaWdodF9jaGVja19mYiwKPiA+ID4gIH07Cj4gPiA+Cj4g
PiA+IC1zdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3RhdGUoc3RydWN0
IGdwaW9fYmFja2xpZ2h0ICpnYmwpCj4gPgo+ID4gSSdtIGluY2xpbmVkIHRvIHZpZXcgZGVsZXRp
bmcgdGhpcyBmdW5jdGlvbiBhcyByZW1vdmluZyBhIGNvbW1lbnQgKGUuZy4KPiA+IHRoZSBmdW5j
dGlvbiBuYW1lIGhlbHBzIHVzIHRvIHJlYWQgdGhlIGNvZGUpIQo+ID4KPiAKPiBSaWdodCwgYnV0
IHdoeSBub3QganVzdCBhZGQgYSBjb21tZW50IHRoZW4/CgpJIGd1ZXNzIHlvdSBjb3VsZCBhZGQg
YSBjb21tZW50IGJ1dCBrZWVwaW5nIGl0IHB1bGxlZCBvdXQgaW4gYSBmdW5jdGlvbgptYWtlcyBp
dCBlYXNpZXIgdG8gY29tcGFyZSBhZ2FpbnN0IGVxdWl2YWxlbnQgY29kZSBpbiBvdGhlciBkcml2
ZXJzCihzdWNoIGFzIHB3bV9ibCkuCgoKRGFuaWVsLgoKCj4gVGhlIHByb2JlIGZ1bmN0aW9uIGlz
IDUwCj4gbGluZXMgbG9uZywgdGhlcmUncyByZWFsbHkgbm8gbmVlZCB0byBzcGxpdCBpdC4gVGhp
cyB3aWxsIGdldCBpbmxpbmVkCj4gYW55d2F5IHRvby4KPiAKPiBCYXJ0Cj4gCj4gPiBSZW1vdmlu
ZyB0aGUgdmFyaWFibGVzIGZyb20gdGhlIGNvbnRleHQgc3RydWN0dXJlIGlzIGdvb2QgYnV0IHdo
eSBub3QKPiA+IGp1c3QgcGFzcyB0aGVtIHRvIHRoZSBmdW5jdGlvbiBhbmQgbGV0IHRoZSBjb21w
aWxlciBkZWNpZGVkIHdoZXRoZXIgb3IKPiA+IG5vdCB0byBpbmxpbmUuCj4gPgo+ID4KPiA+IERh
bmllbC4KPiA+Cj4gPgo+ID4gPiAtewo+ID4gPiAtICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5v
ZGUgPSBnYmwtPmRldi0+b2Zfbm9kZTsKPiA+ID4gLQo+ID4gPiAtICAgICAvKiBOb3QgYm9vdGVk
IHdpdGggZGV2aWNlIHRyZWUgb3Igbm8gcGhhbmRsZSBsaW5rIHRvIHRoZSBub2RlICovCj4gPiA+
IC0gICAgIGlmICghbm9kZSB8fCAhbm9kZS0+cGhhbmRsZSkKPiA+ID4gLSAgICAgICAgICAgICBy
ZXR1cm4gZ2JsLT5kZWZfdmFsdWUgPyBGQl9CTEFOS19VTkJMQU5LIDogRkJfQkxBTktfUE9XRVJE
T1dOOwo+ID4gPiAtCj4gPiA+IC0gICAgIC8qIGlmIHRoZSBlbmFibGUgR1BJTyBpcyBkaXNhYmxl
ZCwgZG8gbm90IGVuYWJsZSB0aGUgYmFja2xpZ2h0ICovCj4gPiA+IC0gICAgIGlmIChncGlvZF9n
ZXRfdmFsdWVfY2Fuc2xlZXAoZ2JsLT5ncGlvZCkgPT0gMCkKPiA+ID4gLSAgICAgICAgICAgICBy
ZXR1cm4gRkJfQkxBTktfUE9XRVJET1dOOwo+ID4gPiAtCj4gPiA+IC0gICAgIHJldHVybiBGQl9C
TEFOS19VTkJMQU5LOwo+ID4gPiAtfQo+ID4gPiAtCj4gPiA+IC0KPiA+ID4gIHN0YXRpYyBpbnQg
Z3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ID4g
IHsKPiA+ID4gICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+ID4gICAg
ICAgc3RydWN0IGdwaW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0gZGV2X2dldF9w
bGF0ZGF0YShkZXYpOwo+ID4gPiArICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm9mX25vZGUgPSBk
ZXYtPm9mX25vZGU7Cj4gPiA+ICAgICAgIHN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcyBwcm9w
czsKPiA+ID4gICAgICAgc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsOwo+ID4gPiAgICAgICBz
dHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibDsKPiA+ID4gLSAgICAgaW50IHJldDsKPiA+ID4gKyAg
ICAgaW50IHJldCwgZGVmX3ZhbHVlOwo+ID4gPgo+ID4gPiAgICAgICBnYmwgPSBkZXZtX2t6YWxs
b2MoZGV2LCBzaXplb2YoKmdibCksIEdGUF9LRVJORUwpOwo+ID4gPiAgICAgICBpZiAoZ2JsID09
IE5VTEwpCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiA+Cj4gPiA+IC0g
ICAgIGdibC0+ZGV2ID0gZGV2Owo+ID4gPiAtCj4gPiA+ICAgICAgIGlmIChwZGF0YSkKPiA+ID4g
ICAgICAgICAgICAgICBnYmwtPmZiZGV2ID0gcGRhdGEtPmZiZGV2Owo+ID4gPgo+ID4gPiAtICAg
ICBnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZGVmYXVs
dC1vbiIpOwo+ID4gPiArICAgICBkZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29s
KGRldiwgImRlZmF1bHQtb24iKTsKPiA+ID4KPiA+ID4gICAgICAgZ2JsLT5ncGlvZCA9IGRldm1f
Z3Bpb2RfZ2V0KGRldiwgTlVMTCwgR1BJT0RfQVNJUyk7Cj4gPiA+ICAgICAgIGlmIChJU19FUlIo
Z2JsLT5ncGlvZCkpIHsKPiA+ID4gQEAgLTEwOSw3ICs4OSwxNSBAQCBzdGF0aWMgaW50IGdwaW9f
YmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ICAgICAg
ICAgICAgICAgcmV0dXJuIFBUUl9FUlIoYmwpOwo+ID4gPiAgICAgICB9Cj4gPiA+Cj4gPiA+IC0g
ICAgIGJsLT5wcm9wcy5wb3dlciA9IGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3RhdGUo
Z2JsKTsKPiA+ID4gKyAgICAgLyogTm90IGJvb3RlZCB3aXRoIGRldmljZSB0cmVlIG9yIG5vIHBo
YW5kbGUgbGluayB0byB0aGUgbm9kZSAqLwo+ID4gPiArICAgICBpZiAoIW9mX25vZGUgfHwgIW9m
X25vZGUtPnBoYW5kbGUpCj4gPiA+ICsgICAgICAgICAgICAgYmwtPnByb3BzLnBvd2VyID0gZGVm
X3ZhbHVlID8gRkJfQkxBTktfVU5CTEFOSwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA6IEZCX0JMQU5LX1BPV0VSRE9XTjsKPiA+ID4gKyAgICAgZWxzZSBp
ZiAoZ3Bpb2RfZ2V0X3ZhbHVlX2NhbnNsZWVwKGdibC0+Z3Bpb2QpID09IDApCj4gPiA+ICsgICAg
ICAgICAgICAgYmwtPnByb3BzLnBvd2VyID0gRkJfQkxBTktfUE9XRVJET1dOOwo+ID4gPiArICAg
ICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAgYmwtPnByb3BzLnBvd2VyID0gRkJfQkxBTktfVU5C
TEFOSzsKPiA+ID4gKwo+ID4gPiAgICAgICBibC0+cHJvcHMuYnJpZ2h0bmVzcyA9IDE7Cj4gPiA+
Cj4gPiA+ICAgICAgIGJhY2tsaWdodF91cGRhdGVfc3RhdHVzKGJsKTsKPiA+ID4gLS0KPiA+ID4g
Mi4yMy4wCj4gPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
