Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5C8103430
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 07:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E116E134;
	Wed, 20 Nov 2019 06:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7435E6E134
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 06:11:25 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-xp1vYsagPxO_tbtl51aMsQ-1; Wed, 20 Nov 2019 01:11:22 -0500
Received: by mail-ot1-f72.google.com with SMTP id p1so13374240otq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 22:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dpJGfZx3Cj0lDz0Nl34BnLGPHmNtsdaIhy7QBlSYdNA=;
 b=AAsu1QDEdI809SBxyvoNbqm4PGLkLF7ARcHbPyNNDsUV0pFvL2bOZ71UsxFHaXIaIO
 phx5Na3AHpI3Q2CFvGbLa0VAiHGHAKaLtXgwD7jy6/GSpfvPEvkiQpa3V5/BYdjSjfEi
 gq05kcTSvQbYVeTcSxMaCcenQugsDMONlNN1yxq8Luc1LOE4j3z+DnnooeK95xqqUUcu
 7TPpsQa2AVZ9Boyr4NcjlZKqcs+PkbSG892VhFQQY/i4Jk6DcmKMt5S9TuMCz7E8R7JP
 ZhwtOt/dQ0Ue3zBRmj+0fAsuG2vrqJ62jSvS83HypZRL4DYfAcHWPbBvgzCAflQyAZ+x
 5BWw==
X-Gm-Message-State: APjAAAV5D+DDMfOScNBAPkN+TxkBGz5Es6tr0cX1M/vaWTqEKdTSos0a
 Dj4dugtPW5Cdofo2pQYqd/9gMXzxMO8TA8PnmzBiApxpo3eKgnS+aI9ujtLEfBuJ9xy8qhcPHfJ
 3tlIIlbPox+zjZYAJuTPiOust/1QlgVT8ubMbOQEEwDHi
X-Received: by 2002:aca:55d3:: with SMTP id j202mr1325401oib.152.1574230281887; 
 Tue, 19 Nov 2019 22:11:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyq+wH+KgxAVK0czEL+ebk7GljLn6+LLUP630iCkchv5lxYAyJQL9dIazj41yNNSbugAaDCvWwJ12nCjy+zSd0=
X-Received: by 2002:aca:55d3:: with SMTP id j202mr1325389oib.152.1574230281642; 
 Tue, 19 Nov 2019 22:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20191102175637.3065-1-thierry.reding@gmail.com>
 <20191118134449.GG2246533@ulmo>
In-Reply-To: <20191118134449.GG2246533@ulmo>
From: Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 20 Nov 2019 16:11:10 +1000
Message-ID: <CABDvA==b3g0S1i1xG_Ycjs15LbGUAgKmrLm6pqf+QFdv_qQk9A@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] drm/nouveau: Various fixes for GP10B
To: Thierry Reding <thierry.reding@gmail.com>
X-MC-Unique: xp1vYsagPxO_tbtl51aMsQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574230284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHQgPT52W5BFw9nmU9WAz3e2f1ymk2wUifEnHSUCrRo=;
 b=hogL6FLJKxw4H0dMXy12A8QfzWtX9QHT7yqImZtnV+8s4BpWbuLeafv5x2/bbuStirQZew
 oIG2y6SeGWjiUngoX9xT6l2XnYLjFKIzjqJ1djHtjdbFDoGyG4G2DBbqNkisu2ItvnGBQt
 2A49tW10tLVcLQeqm91U7YGITWySws0=
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTE6NDUgUE0gVGhpZXJyeSBSZWRpbmcKPHRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIE5vdiAwMiwgMjAxOSBhdCAwNjo1
NjoyOFBNICswMTAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToKPiA+IEZyb206IFRoaWVycnkgUmVk
aW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gPgo+ID4gSGkgQmVuLAo+ID4KPiA+IGhlcmUncyBh
IHJldmlzZWQgc3Vic2V0IG9mIHRoZSBwYXRjaGVzIEkgaGFkIHNlbnQgb3V0IGEgY291cGxlIG9m
IHdlZWtzCj4gPiBhZ28uIEkndmUgcmV3b3JrZWQgdGhlIEJBUjIgYWNjZXNzZXMgaW4gdGhlIHdh
eSB0aGF0IHlvdSBoYWQgc3VnZ2VzdGVkLAo+ID4gd2hpY2ggYXQgbGVhc3QgZm9yIEdQMTBCIHR1
cm5lZCBvdXQgdG8gYmUgZmFpcmx5IHRyaXZpYWwgdG8gZG8uIEkgaGF2ZQo+ID4gbm90IGxvb2tl
ZCBpbiBkZXRhaWwgYXQgdGhpcyBmb3IgR1YxMUIgeWV0LCBidXQgYSBjdXJzb3J5IGxvb2sgc2hv
d2VkCj4gPiB0aGF0IEJBUjIgaXMgYWNjZXNzZWQgaW4gbW9yZSBwbGFjZXMsIHNvIHRoZSBlcXVp
dmFsZW50IGZvciBHVjExQiBtaWdodAo+ID4gYmUgYSBiaXQgbW9yZSBpbnZvbHZlZC4KPiA+Cj4g
PiBPdGhlciB0aGFuIHRoYXQsIG5vdCBhIGxvdCBoYXMgY2hhbmdlZCBzaW5jZSB0aGVuLiBJJ3Zl
IGFkZGVkIGEgY291cGxlCj4gPiBvZiBwcmVjdXJzb3J5IHBhdGNoZXMgdG8gYWRkIElPTU1VIGhl
bHBlciBkdW1taWVzIGZvciB0aGUgY2FzZSB3aGVyZQo+ID4gSU9NTVUgaXMgZGlzYWJsZWQgKGFz
IHN1Z2dlc3RlZCBieSBCZW4gRG9va3MpLgo+ID4KPiA+IEpvZXJnLCBpdCdkIGJlIGdyZWF0IGlm
IHlvdSBjb3VsZCBnaXZlIGFuIEFja2VkLWJ5IG9uIHRob3NlIHR3byBwYXRjaGVzCj4gPiBzbyB0
aGF0IEJlbiBjYW4gcGljayB0aGVtIGJvdGggdXAgaW50byB0aGUgTm91dmVhdSB0cmVlLiBBbHRl
cm5hdGl2ZWx5IEkKPiA+IGNhbiBwdXQgdGhlbSBib3RoIGludG8gYSBzdGFibGUgYnJhbmNoIGFu
ZCBzZW5kIGEgcHVsbCByZXF1ZXN0IHRvIGJvdGgKPiA+IG9mIHlvdS4gT3IgeWV0IGFub3RoZXIg
YWx0ZXJuYXRpdmUgd291bGQgYmUgZm9yIEpvZXJnIHRvIGFwcGx5IHRoZW0gbm93Cj4gPiBhbmQg
QmVuIHRvIHdhaXQgZm9yIHY1LjUtcmMxIHVudGlsIGhlIHBpY2tzIHVwIHRoZSByZXN0LiBBbGwg
b2YgdGhvc2UKPiA+IHdvcmsgZm9yIG1lLgo+Cj4gSGkgSm9lcmcsIEJlbiwKPgo+IGRvIHlvdSBn
dXlzIGhhdmUgYW55IGZ1cnRoZXIgY29tbWVudHMgb24gdGhpcyBzZXJpZXM/IEkndmUgZ290IGFu
Cj4gdXBkYXRlZCBwYXRjaCB0byBzaWxlbmNlIHRoZSB3YXJuaW5nIHRoYXQgdGhlIGtidWlsZCBy
b2JvdCBmbGFnZ2VkLCBzbwo+IGlmIHRoZXJlIGFyZSBubyBvdGhlciBjb21tZW50cyBJIGNhbiBz
ZW5kIGEgZmluYWwgdjMgb2YgdGhlIHNlcmllcy4KSSdtIG9uIGxlYXZlIGF0IHRoZSBtb21lbnQu
ICBCdXQgdGhlIG5vdXZlYXUgZml4ZXMgbG9vayBmaW5lIHRvIG1lIGFuZApJJ20gaGFwcHkgdG8g
cGljayB0aGVtIHVwIG9uY2UgeW91IHNlbmQgYSB2MywgYW5kIGFsbG93IEplb3JnIHRvIGFwcGx5
CnRoZSByZXN0IHRocm91Z2ggaGlzIHRyZWUuCgpUaGFua3MsCkJlbi4KCj4KPiBUaGllcnJ5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
