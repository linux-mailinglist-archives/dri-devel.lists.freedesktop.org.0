Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9AA20025
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 09:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F32089330;
	Thu, 16 May 2019 07:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 22032 seconds by postgrey-1.36 at gabe;
 Wed, 15 May 2019 10:46:13 UTC
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0EB892A5;
 Wed, 15 May 2019 10:46:13 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x4FAjl0x021834;
 Wed, 15 May 2019 19:45:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x4FAjl0x021834
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id p13so826018uaa.11;
 Wed, 15 May 2019 03:45:48 -0700 (PDT)
X-Gm-Message-State: APjAAAWmtV9xXVPn4BGrS2qaBF/i781miHTcpJV14mZwIr+EVEmmZ8ZR
 rJLikV/7JNhjgN1yJ2wBr/NR07t4U3VndzPhDVA=
X-Google-Smtp-Source: APXvYqwDVNyPwwpdaw6f2M7fafwG0m4Jii5pcqUyaOLnmQN7wgqEr8RPbyQkDpU8doGbsuNvlvLrp0iHMMgCf0GuYrY=
X-Received: by 2002:a9f:2d99:: with SMTP id v25mr15675392uaj.25.1557917147127; 
 Wed, 15 May 2019 03:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190515043753.9853-1-yamada.masahiro@socionext.com>
 <155790139253.21839.18331243986827594086@skylake-alporthouse-com>
In-Reply-To: <155790139253.21839.18331243986827594086@skylake-alporthouse-com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 15 May 2019 19:45:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNARu1vGhfzSU9k878H7=1cbD+mD99YOHOL4jBvrmoBTBmg@mail.gmail.com>
Message-ID: <CAK7LNARu1vGhfzSU9k878H7=1cbD+mD99YOHOL4jBvrmoBTBmg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: drop unneeded -Wall addition
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Approved-At: Thu, 16 May 2019 07:22:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1557917148;
 bh=Q7wclT0g9FT3toQkG7eWSJ6okxkqIUrkR+mIo/eNOQc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EVYU1NBJvSvo3cHNboRZMWz6awDo2izBd/KulfDDMk2PMeJ+c9hThFxnS6VrhkANH
 bfC4NOdJJuztGcKoQpnulmLhT+KTAWx7n8BMXZSctJIURepH0k6gfM9+a8HfLEn2Yb
 qGrlPXJCvlVRa9SZjGbo9aKv2R8FsckfdlVu2jdo53jTK3m5j9K2rddmBiOiXpPnPC
 8ZUgH9wAnx249Wx4w3wnPRoTKj6GgZfMyBTCn6qRzkdzTpNHFkEYkGUJ2PpeOQ4E3x
 nyWkrU3p6rF6g3dt4ZqMXybw+NvEPrEJmUvwBk7S5u8+fUkQ1xmQ2+646ugSki4vhd
 G2bAY/NQq6U4g==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMzoyNSBQTSBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4gd3JvdGU6Cj4KPiBRdW90aW5nIE1hc2FoaXJvIFlhbWFkYSAoMjAxOS0w
NS0xNSAwNTozNzo1MykKPiA+IFRoZSB0b3AgbGV2ZWwgTWFrZWZpbGUgYWRkcyAtV2FsbCBnbG9i
YWxseToKPiA+Cj4gPiAgIEtCVUlMRF9DRkxBR1MgICA6PSAtV2FsbCAtV3VuZGVmIC1XZXJyb3I9
c3RyaWN0LXByb3RvdHlwZXMgLVduby10cmlncmFwaHMgXAo+ID4KPiA+IEkgc2VlIHR3byAiLVdh
bGwiIGFkZGVkIGZvciBjb21waWxpbmcgdW5kZXIgZHJpdmVycy9ncHUvZHJtL2k5MTUvLgo+Cj4g
RG9lcyBpdCBtYXR0ZXI/IElzIHRoZSBzdGF0ZW1lbnQgaW4gaTkxNS9NYWtlZmlsZSBub3QgbW9y
ZSBjb21wbGV0ZSBmb3IKPiBzYXlpbmcgIi1XYWxsIC1XZXh0cmEgLVdlcnJvciI/CgoKTm90IGZh
dGFsLCBidXQgYmV0dGVyIHRvIGZpeC4KCldoeSBub3QgZml4IHRoZSBjb21tZW50IGlmIHlvdSBt
aW5kCiItV2FsbCIgaW4gdGhlIGNvbW1lbnQ/CgpJdCB3aWxsIGJlIGVhc3kgdG8gcmVwaHJhc2Ug
dGhlIGNvbW1lbnRzCndpdGhvdXQgZXhwbGljaXRseSBtZW50aW9uaW5nIC1XYWxsIG9yIC1XZXh0
cmEuCgoKSSByZXdvcmRlZCBpdCBtb3JlIGNvbmNpc2VseToKCiMgV2UgYWdncmVzc2l2ZWx5IGVs
aW1pbmF0ZSB3YXJuaW5ncywKIyBzbyBoZXJlIGFyZSBtb3JlIHdhcm5pbmcgb3B0aW9ucyB0aGFu
IGRlZmF1bHQuCgpUaGF0J3MgaXQuCgoKVGhlIENJIGlzIHlvdXIgbG9jYWwgbWF0dGVyLgpEaXN0
cmFjdGluZyBjb21tZW50cyBzaG91bGQgbm90IGJlIGFkZGVkIGluIHRoZSB1cHN0cmVhbSBjb2Rl
CmluIHRoZSBmaXJzdCBwbGFjZS4KCgo+ID4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRh
IDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiA+IC0tLQo+ID4KPiA+IEJUVywgSSBo
YXZlIGEgcXVlc3Rpb24gaW4gdGhlIGNvbW1lbnQ6Cj4gPgo+ID4gICJOb3RlIHRoZSBkYW5nZXIg
aW4gdXNpbmcgLVdhbGwgLVdleHRyYSBpcyB0aGF0IHdoZW4gQ0kgdXBkYXRlcyBnY2Mgd2UKPiA+
ICAgd2lsbCBtb3N0IGxpa2VseSBnZXQgYSBzdWRkZW4gYnVpbGQgYnJlYWthZ2UuLi4gSG9wZWZ1
bGx5IHdlIHdpbGwgZml4Cj4gPiAgIG5ldyB3YXJuaW5ncyBiZWZvcmUgQ0kgdXBkYXRlcyEiCj4g
Pgo+ID4gRW5hYmxpbmcgd2hhdGV2ZXIgd2FybmluZyBvcHRpb25zIGRvZXMgbm90IGNhdXNlIGJ1
aWxkIGJyZWFrYWdlLgo+ID4gLVdlcnJvciBkb2VzLgo+ID4KPiA+IFNvLCBJIHRoaW5rIHRoZSBj
b3JyZWN0IHN0YXRlbWVudCBpczoKPiA+Cj4gPiAgIk5vdGUgdGhlIGRhbmdlciBpbiB1c2luZyAt
V2Vycm9yIGlzIHRoYXQgd2hlbiBDSSB1cGRhdGVzIGdjYyB3ZSAuLi4KPgo+IE5vLgoKCkhlaCwg
SSB0aG91Z2h0IHRoZSBhbnN3ZXIgd2FzIFllcywKc2luY2UgSSBzYXcgdGhlIGZvbGxvd2luZyBp
biB0aGlzIE1ha2VmaWxlLgoKIyBBZGQgYSBzZXQgb2YgdXNlZnVsIHdhcm5pbmcgZmxhZ3MgYW5k
IGVuYWJsZSAtV2Vycm9yIGZvciBDSSB0byBwcmV2ZW50CgoKCgo+IENJIGVuZm9yY2VzIC1XZXJy
b3IgYW5kIHRoYXQgaXMgY29uc3RhbnQsIHNvIHRoZSB1bmNvbnRyb2xsZWQKPiB2YXJpYWJsZSwg
dGhlIGRhbmdlciwgbGllcyBpbiB1c2luZyB0aGUgdW5yZWxpYWJsZSBoZXVyaXN0aWNzIGdjYyBt
YXkKPiBhcmJpdHJhcnkgZW5hYmxlIGJldHdlZW4gdmVyc2lvbnMuIFRoYXQgdGhlIHNldCBvZiB3
YXJuaW5ncyBjYXVzaW5nIGFuCj4gZXJyb3IgbWF5IGJlIGRpZmZlcmVudCBiZXR3ZWVuIENJIGFu
ZCB0aGUgZGV2ZWxvcGVyLgo+IC1DaHJpcwoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlh
bWFkYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
