Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C532044CBC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 21:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B535890BD;
	Thu, 13 Jun 2019 19:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4309890BD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 19:59:05 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n11so21911086qtl.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mABGHTQ4GLxORx7oxP2Dku+ogME6hgTlBgqCUM3jgVM=;
 b=A/r6EzJru7uauPoNX5j7Kac6CAaWzw0G04n4R9zwbinWU9+3YICObShiOHRVKdBcq0
 aFWBD/UAXBy1pOjk0K8pH4Cc1i3nYViK6im9K2EijaUuQG3Bh/NxTGxOqzonrKn8SbWj
 5KtM+hktun98FtZ+ASjyuQrRvnAFr8M58dlV971u8qO6jITne6f59KND8fzSdqRiQMZ4
 YtexkV7fEv7l16ucOkKTncdMOZVbL3W0mZv1pSKUXLGGSBOLvHYmITQaLnq0IFDKSFzE
 ArFEZ3IG+cew9pTwfF5ol2XjjTXnCl04/R2Zq4LsNwOKc3GG4HmgS5hdDtjRO4UJ/G9F
 gUeg==
X-Gm-Message-State: APjAAAXYnZJNa/7KCgdZG6Q6ndUqrjuyvibbUJPmnkfhbSgBuyfjcEC2
 SEPNqT2taqfQM28ap23QyQ==
X-Google-Smtp-Source: APXvYqwyWBDaFVyAkanoZ+1z164tB8nWMUvp9oZM0IcqpT3ialpFjN8XMhTphktzom9B4B87tNVOng==
X-Received: by 2002:aed:218b:: with SMTP id l11mr57399228qtc.66.1560455944697; 
 Thu, 13 Jun 2019 12:59:04 -0700 (PDT)
Received: from localhost ([64.188.179.243])
 by smtp.gmail.com with ESMTPSA id f20sm233551qkh.15.2019.06.13.12.59.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 12:59:04 -0700 (PDT)
Date: Thu, 13 Jun 2019 13:59:03 -0600
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH 1/3] dt-bindings: Add binding for IT6505.
Message-ID: <20190613195903.GA23650@bogus>
References: <1557307985-21228-1-git-send-email-allen.chen@ite.com.tw>
 <1557307985-21228-2-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557307985-21228-2-git-send-email-allen.chen@ite.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ben Whitten <ben.whitten@gmail.com>,
 Michal Simek <monstr@monstr.eu>,
 Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Nickey Yang <nickey.yang@rock-chips.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDU6MzE6NTZQTSArMDgwMCwgYWxsZW4gd3JvdGU6Cj4g
RnJvbTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3Pgo+IAo+IEFkZCBhIERUIGJp
bmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgSVQ2NTA1Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsbGVu
IENoZW4gPGFsbGVuLmNoZW5AaXRlLmNvbS50dz4KPiAKPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUudHh0ICAgICAgICAgfCAzMCArKysrKysrKysrKysrKysr
KysrKysrCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy50eHQgICAg
ICAgIHwgIDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9pdGUsaXQ2NTA1LnR4dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS50eHQKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAuLmMzNTA2YWMKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL2l0ZSxpdDY1MDUudHh0Cj4gQEAgLTAsMCArMSwzMCBAQAo+ICtpVEUgaXQ2NTA1IERQIGJy
aWRnZSBiaW5kaW5ncwo+ICsKPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiArICAgICAgICAtIGNv
bXBhdGlibGU6ICJpdGUsaXQ2NTA1Igo+ICsgICAgICAgIC0gcmVnOiBpMmMgYWRkcmVzcyBvZiB0
aGUgYnJpZGdlCj4gKyAgICAgICAgLSBvdmRkLXN1cHBseTogSS9PIHZvbHRhZ2UKPiArICAgICAg
ICAtIHB3cjE4LXN1cHBseTogQ29yZSB2b2x0YWdlCj4gKyAgICAgICAgLSBpbnRlcnJ1cHRzOiBp
bnRlcnJ1cHQgc3BlY2lmaWVyIG9mIElOVCBwaW4KPiArICAgICAgICAtIHJlc2V0LWdwaW9zOiBn
cGlvIHNwZWNpZmllciBvZiBSRVNFVCBwaW4KPiArCj4gK0V4YW1wbGU6Cj4gKwlpdDY1MDVkcHR4
OiBpdDY1MDVkcHR4QDVjIHsKPiArICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiaXRlLGl0
NjUwNSI7Cj4gKyAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gKyAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwaW8+Owo+ICsgICAgICAgICAgICAgICAgaW50ZXJy
dXB0cyA9IDwxNTIgSVJRX1RZUEVfRURHRV9SSVNJTkcgMTUyIDA+Owo+ICsgICAgICAgICAgICAg
ICAgcmVnID0gPDB4NWM+Owo+ICsgICAgICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsKPiArICAgICAgICAgICAgICAgIHBpbmN0cmwtMCA9IDwmaXQ2NTA1X3BpbnM+Owo+ICsg
ICAgICAgICAgICAgICAgb3ZkZC1zdXBwbHkgPSA8Jm10NjM1OF92c2ltMV9yZWc+Owo+ICsgICAg
ICAgICAgICAgICAgcHdyMTgtc3VwcGx5ID0gPCZpdDY1MDVfcHAxOF9yZWc+Owo+ICsgICAgICAg
ICAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JnBpbyAxNzkgMT47Cj4gKyAgICAgICAgICAgICAgICBo
cGQtZ3Bpb3MgPSA8JnBpbyA5IDA+OwoKSFBEIHdvdWxkIGJlIHBhcnQgb2YgdGhlIGNvbm5lY3Rv
ciwgbm90IHRoaXMgYnJpZGdlIGNoaXAgaWYgYSBHUElPIGlzIAp1c2VkLgoKPiArICAgICAgICAg
ICAgICAgIGV4dGNvbiA9IDwmdXNiY19leHRjb24+OwoKVGhpcyBzaG91bGQgdXNlIHRoZSB1c2It
Y29ubmVjdG9yIGJpbmRpbmcgaWYgdGhpcyBpcyBhIFR5cGUgQyBjb25uZWN0b3IuIApPciBpdCBz
aG91bGQgaGF2ZSBhIGRwLWNvbm5lY3RvciBub2RlIGNvbm5lY3Rpb24gaWYganVzdCBhIERQIGNv
bm5lY3Rvci4KCgo+ICsgICAgICAgICAgICAgICAgcG9ydCB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgIGl0NjUwNV9pbjogZW5kcG9pbnQgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmZHBpX291dD47Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgICB9Owo+ICsgICAgICAgIH07Cj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy50eHQK
PiBpbmRleCAyYzNmYzUxLi5jMDg4NjQ2IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy50eHQKPiBAQCAtMTg0LDYgKzE4
NCw3IEBAIGlvbQlJb21lZ2EgQ29ycG9yYXRpb24KPiAgaXNlZQlJU0VFIDIwMDcgUy5MLgo+ICBp
c2lsCUludGVyc2lsCj4gIGlzc2kJSW50ZWdyYXRlZCBTaWxpY29uIFNvbHV0aW9ucyBJbmMuCj4g
K2l0ZQlpVEUgVGVjaC4gSW5jLgoKVGhpcyBmaWxlIGlzIGEgc2NoZW1hIG5vdywgc28geW91J2xs
IGhhdmUgdG8gdXBkYXRlIHRoaXMuCgo+ICBpdGVhZAlJVEVBRCBJbnRlbGxpZ2VudCBTeXN0ZW1z
IENvLkx0ZAo+ICBpd2F2ZSAgaVdhdmUgU3lzdGVtcyBUZWNobm9sb2dpZXMgUHZ0LiBMdGQuCj4g
IGpkaQlKYXBhbiBEaXNwbGF5IEluYy4KPiAtLSAKPiAxLjkuMQo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
