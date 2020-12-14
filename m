Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67692D9A53
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 15:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D823189580;
	Mon, 14 Dec 2020 14:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BA66E218
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:54:28 +0000 (UTC)
X-Gm-Message-State: AOAM5319ajHYS3l0ogBC0WDMYt2vS2V63lviHOxgTfcEazXtQj4Jt5T6
 wxC71XXNoQlmoChiUPIciLMQlVIA7j+MEnQ+DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607957668;
 bh=lx5LcB4r8kThhsWgyjSZ+LWhuKJpQwGa8oXjjRjm8yY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RS3eYjNQYmDFQA7FmdEX3nxqALFkO77gC8VpWHirjJClhd+5Dwy0yRNu1+KhTfH4a
 cqLZgg/Kkskv4JPmU7JM+DynYOaMl3h0zivY/hoPC+ErlcrFlPH/ad04c1d+5YQ5Ma
 rZhVtTeWMyp9ZI3yoPEaQYE6IZmJsOf3Diyl2l8fuvOsYYoia+bs9NqJlPn6agoKZ1
 bIfwzohw/9gHciYqVku6BHJ8LazxVQiEexyGXGFREbFUxxkfjWPvOfuwJN5CWS91HD
 0kWGbHqO9DXNIcJL+uV33r6CGR+3Ocj3JgrL05xqwZ8KmJWNCI5trWCt0ktl5sT5yp
 nKd/kmFx/tQVw==
X-Google-Smtp-Source: ABdhPJywDyFHYaIxrWSBcAnDDsvFyzMN1rO/xQl7TxTsoTfGwXme0jp7BjNRTzumje835VaKEkDPyyP8R0QtuCPZpGE=
X-Received: by 2002:a17:906:ae4e:: with SMTP id
 lf14mr23355440ejb.310.1607957666417; 
 Mon, 14 Dec 2020 06:54:26 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
 <1607647514.12750.5.camel@mhfsdcap03>
In-Reply-To: <1607647514.12750.5.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 14 Dec 2020 22:54:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY__HA95WLNppOKainvsZCxA6Wv3edLyvOW6FxAjUos=afQ@mail.gmail.com>
Message-ID: <CAAOTY__HA95WLNppOKainvsZCxA6Wv3edLyvOW6FxAjUos=afQ@mail.gmail.com>
Subject: Re: [PATCH v8, 5/6] drm/mediatek: add RDMA fifo size error handle
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTHml6Ug6YCx5LqUIOS4iuWNiDg6NDXlr6vpgZPvvJoKPgo+IE9u
IFRodSwgMjAyMC0xMi0xMCBhdCAyMzo1MCArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+
IEhpLCBZb25ncWlhbmc6Cj4gPgo+ID4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMOaXpSDpgLHlm5sg5LiL5Y2INTowOOWvq+mBk++8
mgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIGFkZCBSRE1BIGZpZm8gc2l6ZSBlcnJvciBoYW5kbGUK
PiA+ID4gcmRtYSBmaWZvIHNpemUgd2lsbCBub3QgYWx3YXlzIGJpZ2dlciB0aGFuIHRoZSBjYWxj
dWxhdGVkIHRocmVzaG9sZAo+ID4gPiBpZiB0aGF0IGNhc2UgaGFwcGVuZWQsIHdlIG5lZWQgc2V0
IGZpZm8gc2l6ZSBhcyB0aGUgdGhyZXNob2xkCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlv
bmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgfCA0ICsrKysKPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jCj4gPiA+IGluZGV4IDc5NGFjYzUuLjA1MDgzOTIg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1h
LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYwo+
ID4gPiBAQCAtMTUxLDYgKzE1MSwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfcmRtYV9jb25maWcoc3Ry
dWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IHdpZHRoLAo+ID4gPiAgICAgICAg
ICAqIGFjY291bnQgZm9yIGJsYW5raW5nLCBhbmQgd2l0aCBhIHBpeGVsIGRlcHRoIG9mIDQgYnl0
ZXM6Cj4gPiA+ICAgICAgICAgICovCj4gPiA+ICAgICAgICAgdGhyZXNob2xkID0gd2lkdGggKiBo
ZWlnaHQgKiB2cmVmcmVzaCAqIDQgKiA3IC8gMTAwMDAwMDsKPiA+ID4gKwo+ID4gPiArICAgICAg
IGlmICh0aHJlc2hvbGQgPiByZG1hX2ZpZm9fc2l6ZSkKPiA+ID4gKyAgICAgICAgICAgICAgIHRo
cmVzaG9sZCA9IHJkbWFfZmlmb19zaXplOwo+ID4KPiA+IElmIHRoZSBmb3JtdWxhIGlzIG5vdCBj
b3JyZWN0LCB5b3Ugc2hvdWxkIGZpeCB0aGUgZm9ybXVsYSBub3Qgd29yayBhcm91bmQuCj4gPgo+
ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4KPiBob3cgYWJvdXQgdGhpczoKPiB0aHJlc2hv
bGQgPSBtYXgod2lkdGggKiBoZWlnaHQgKiB2cmVmcmVzaCAqIDQgKiA3IC8gMTAwMDAwMCwKPiBy
ZG1hX2ZpZm9fc2l6ZSk7CgpXaGVuIEkgdXNlIHdpZHRoID0gMTkyMCwgaGVpZ2h0ID0gMTA4MCwg
dnJlZnJlc2ggPSA2MCB0byBjYWxjdWxhdGUsIEkKZ2V0IHRocmVzaG9sZCA9IDI5ODUuClNvIEkg
dGhpbmsgc2V0IHRocmVzaG9sZCB0byBoYWxmIG9mIGZpZm8gc2l6ZSBpcyBPSyBmb3IgTUFYX1dJ
RFRILApNQVhfSEVJR0hULCBNQVhfVlJFRlJFU0ggKHRoZXNlIHRocmVlIG1heSBiZSBkaWZmZXJl
bnQgaW4gZWFjaCBTb0MpCgp0aHJlc2hvbGQgPSBSRE1BX0ZJRk9fUFNFVURPX1NJWkUocmRtYV9m
aWZvX3NpemUpIC8gMjsKCkJ1dCBJIHdvcnJ5IGhhbGYgZmlmbyBzaXplIGlzIHRvbyBiaWcgZm9y
IHNtYWxsIHJlc29sdXRpb24gYW5kIGxldApzbWFsbCByZXNvbHV0aW9uIHRvbyBlYXN5IHRvIHRy
aWdnZXIgYnVyc3QgcmVhZCBEUkFNLiBTbyBsZXQgdGhlCmZvcm11bGEgdG8gYmUgdGhpczoKCnRo
cmVzaG9sZCA9IFJETUFfRklGT19QU0VVRE9fU0laRShyZG1hX2ZpZm9fc2l6ZSkgKiB3aWR0aCAq
IGhlaWdodCAqCnZyZWZyZXNoIC8gMiAvIE1BWF9XSURUSCAvIE1BWF9IRUlHSFQgLyBNQVhfVlJF
RlJFU0g7CgpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRoaXM/CgpSZWdhcmRzLApDaHVuLUt1YW5n
LgoKPiA+Cj4gPiA+ICsKPiA+ID4gICAgICAgICByZWcgPSBSRE1BX0ZJRk9fVU5ERVJGTE9XX0VO
IHwKPiA+ID4gICAgICAgICAgICAgICBSRE1BX0ZJRk9fUFNFVURPX1NJWkUocmRtYV9maWZvX3Np
emUpIHwKPiA+ID4gICAgICAgICAgICAgICBSRE1BX09VVFBVVF9WQUxJRF9GSUZPX1RIUkVTSE9M
RCh0aHJlc2hvbGQpOwo+ID4gPiAtLQo+ID4gPiAxLjguMS4xLmRpcnR5Cj4gPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IExpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdAo+ID4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
