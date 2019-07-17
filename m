Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCC06B72D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BF86E264;
	Wed, 17 Jul 2019 07:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC0E6E21D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 02:17:53 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id a186so13740289vsd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 19:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yeo9/78yIZ/9VC2V6OzC4jD48Q2tlshLhO2xlpzyNJY=;
 b=UbnmIcLGp0PVjNOep7sVzW8pXqpSCtg55PK514/2kRbkwCSUtcGt3hYQ7eC6XyUPjS
 Qbu3VnOsMoMc3NRg33+LrDHd2P2Si59pJgrAbJbktPHG1svrreNUXXX5IrNqg+y2CbL5
 VReWwyu2is8vo/3jc73XR5PZyc0U80n7Ki0QwlO0nKsFKXjwSq7zQkRC+BdEBFYw35Jn
 2o7Qo7IUEOsDZ6OQhZpx0RHa/UbxtEUtTDYy+AtYjl2so1HkKWVCOt7B0ZMGIU6xLu5v
 Itm3hqkwbnhyBvN5jotUoOqr8RBbE+DtipNzUNuC7+HmcsvViurhy5DkW9vSR/WvimXq
 b8oA==
X-Gm-Message-State: APjAAAWe0Y8fJkfrNYRONIc1Zdu9TlrPNxPHj84eL5nBsQWnk7NxQcOP
 WDYsFbli/jp/kEkNCEtwHju8MWS22LeEhfk9Plv+nA==
X-Google-Smtp-Source: APXvYqxWnVBbK8jRKVsd6t2y7gQJuZMs4DlVLf7zXq9OOaLMsZSZoBF8H9LF78AxDMSny/dXL5TfEDzdnilbzMthY7M=
X-Received: by 2002:a67:ebcb:: with SMTP id y11mr13049180vso.138.1563329872293; 
 Tue, 16 Jul 2019 19:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-3-cychiang@chromium.org>
 <CA+Px+wWuCBvWra8+=szQOrvr3iv2YPMeoHHVtJ1vmaZWEEQ44A@mail.gmail.com>
In-Reply-To: <CA+Px+wWuCBvWra8+=szQOrvr3iv2YPMeoHHVtJ1vmaZWEEQ44A@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 17 Jul 2019 10:17:25 +0800
Message-ID: <CAFv8NwKVEpnUi=+Hvi1_2vdYqWFd49zu8eoQbMwnjg6i_PGhcA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm: bridge: dw-hdmi: Report connector status
 using callback
To: Tzung-Bi Shih <tzungbi@google.com>
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Yeo9/78yIZ/9VC2V6OzC4jD48Q2tlshLhO2xlpzyNJY=;
 b=nUiqNxzKLCH4uh7Rdk28OYJeCqZg+QKn/Ua3o40RM8WpdDaG3iflhnr8M/qkqbKcgw
 MB6O6mEn6WPNEgokSircT8LHVL2pkHwIAhiObF6mtO0l5foVBQDuDCYQgfQ/yKy2vod1
 EiRO1lNXlRxUc2xtXifWRV0NCnbRPoBSHfW0o=
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTA6MTMgUE0gVHp1bmctQmkgU2hpaCA8dHp1bmdiaUBn
b29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVsIDE2LCAyMDE5IGF0IDc6NTcgUE0gQ2hl
bmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IENoYW5n
ZSB0aGUgS2NvbmZpZyBvZiBEUk1fRFdfSERNSSBzbyBpdCBzZWxlY3RzIFNORF9TT0NfSERNSV9D
T0RFQy4KPiA+IFRoaXMgaXMgZm9yIHRoZSB0eXBlZGVmIG9mIGhkbWlfY29kZWNfcGx1Z2dlZF9j
YiB0byBiZSB1c2VkIGluIGR3LWhkbWkuYy4KPiBOb3Qgc3VyZSB3aHkgeW91IHNlbGVjdCBTTkRf
U09DX0hETUlfQ09ERUMgaW4gdGhpcyBwYXRjaC4gIFRvIGhhdmUKPiBkZWZpbml0aW9uIG9mIGhk
bWlfY29kZWNfcGx1Z2dlZF9jYiwgaW5jbHVkZSBoZG1pLWNvZGVjLmggc2hvdWxkIGJlCj4gc3Vm
ZmljaWVudC4KPgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXchCkkgbWlzdW5kZXJzdG9vZCB3aGVu
IHRvIGNoYW5nZSBLY29uZmlnLgpXaWxsIGZpeCBpbiB2NS4KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9LY29uZmlnCj4gPiBpbmRleCAyMWExYmUzY2VkMGYuLjMwOWRhMDUy
ZGI5NyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvS2Nv
bmZpZwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9LY29uZmlnCj4g
PiBAQCAtNCw2ICs0LDcgQEAgY29uZmlnIERSTV9EV19IRE1JCj4gPiAgICAgICAgIHNlbGVjdCBE
Uk1fS01TX0hFTFBFUgo+ID4gICAgICAgICBzZWxlY3QgUkVHTUFQX01NSU8KPiA+ICAgICAgICAg
c2VsZWN0IENFQ19DT1JFIGlmIENFQ19OT1RJRklFUgo+ID4gKyAgICAgICBzZWxlY3QgU05EX1NP
Q19IRE1JX0NPREVDCj4gU28gdGhhdCBpdCBpcyB3ZWlyZCB0byBzZWxlY3QgdGhpcyBvcHRpb24u
Cj4KV2lsbCBiZSByZW1vdmVkIGluIHY1LgpUaGFua3MhCj4gPgo+ID4gIGNvbmZpZyBEUk1fRFdf
SERNSV9BSEJfQVVESU8KPiA+ICAgICAgICAgdHJpc3RhdGUgIlN5bm9wc3lzIERlc2lnbndhcmUg
QUhCIEF1ZGlvIGludGVyZmFjZSIKPiA+IEBAIC0yMCw3ICsyMSw2IEBAIGNvbmZpZyBEUk1fRFdf
SERNSV9JMlNfQVVESU8KPiA+ICAgICAgICAgdHJpc3RhdGUgIlN5bm9wc3lzIERlc2lnbndhcmUg
STJTIEF1ZGlvIGludGVyZmFjZSIKPiA+ICAgICAgICAgZGVwZW5kcyBvbiBTTkRfU09DCj4gPiAg
ICAgICAgIGRlcGVuZHMgb24gRFJNX0RXX0hETUkKPiA+IC0gICAgICAgc2VsZWN0IFNORF9TT0Nf
SERNSV9DT0RFQwo+IEFsc28gc3RyYW5nZSBmb3IgZGVzZWxlY3RpbmcgdGhlIG9wdGlvbi4gIFNo
b3VsZCBiZSBpbiBhbm90aGVyIGNvbW1pdAo+IGZvciBhbm90aGVyIHJlYXNvbj8KV2lsbCBiZSBy
ZW1vdmVkIGluIHY1LgpUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
