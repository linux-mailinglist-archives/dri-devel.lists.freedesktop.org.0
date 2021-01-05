Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B97D2EB5E5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 00:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDB46E0EC;
	Tue,  5 Jan 2021 23:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416E16E0EC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 23:09:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6A7A230FD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 23:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609888180;
 bh=fed5XlKEYP7XWtaTDihJhGMdXSKuB5tSlmnJYeJp5tA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XTorqmmoQFo45G1nbewWbvP/CAvceHKlyXWurSrvetkZZc/6Kuavisei2FTiVpZ13
 vVx27/Msk/wjDmCKaBFSV0xmyQ1R1rqj2S7HfSDf8rBdcUKh/FQjukqWHttxrImIBq
 i7q5eRq119nsRWEku8jfaeNm38AvuH8WI7exdD4y6oWj3Ej4qsbuUfrm1RUNEA4xuv
 d0qy0RR9uo3rbPxZ46uOG2qGaE9/oRYGdygF/B5cMKUXGNBrO3woliFM7wKvJ5/D4X
 goorMZ2I8ptX/nwdRzzsyYXqV7eAxwoDems14MOxsH0kTfIanPc6Nk6EINA1WNwL93
 YLgNEr/YXSuEw==
Received: by mail-ed1-f50.google.com with SMTP id g24so2595640edw.9
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 15:09:39 -0800 (PST)
X-Gm-Message-State: AOAM533YvHIpPpnfkeRf4N6I5/Hruf5JiQ4yC1pVxQzrAW5Ti2PhLtFa
 3KOiCws5sXXQkxFSuU9qrpfg5/5so3LhNuivkQ==
X-Google-Smtp-Source: ABdhPJzIhUlEvoUVEDqvgDDYC9VWDoT47pLXuX5VmL//f0UtuCznywGNVW5rGOqFAhZlyQJoJHGegCDvr8Y5OwVO8xU=
X-Received: by 2002:a50:fc96:: with SMTP id f22mr2120443edq.162.1609888178364; 
 Tue, 05 Jan 2021 15:09:38 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
 <1607647514.12750.5.camel@mhfsdcap03>
 <CAAOTY__HA95WLNppOKainvsZCxA6Wv3edLyvOW6FxAjUos=afQ@mail.gmail.com>
 <1609828577.1574.5.camel@mhfsdcap03>
In-Reply-To: <1609828577.1574.5.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 6 Jan 2021 07:09:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-AGNuwwCv-A_GWy7gDO8csXenJGciLsP7mRAUuUKWUKA@mail.gmail.com>
Message-ID: <CAAOTY_-AGNuwwCv-A_GWy7gDO8csXenJGciLsP7mRAUuUKWUKA@mail.gmail.com>
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
PiDmlrwgMjAyMeW5tDHmnIg15pelIOmAseS6jCDkuIvljYgyOjM25a+r6YGT77yaCj4KPiBPbiBN
b24sIDIwMjAtMTItMTQgYXQgMjI6NTQgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiBI
aSwgWW9uZ3FpYW5nOgo+ID4KPiA+IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPiDmlrwgMjAyMOW5tDEy5pyIMTHml6Ug6YCx5LqUIOS4iuWNiDg6NDXlr6vpgZPvvJoK
PiA+ID4KPiA+ID4gT24gVGh1LCAyMDIwLTEyLTEwIGF0IDIzOjUwICswODAwLCBDaHVuLUt1YW5n
IEh1IHdyb3RlOgo+ID4gPiA+IEhpLCBZb25ncWlhbmc6Cj4gPiA+ID4KPiA+ID4gPiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQxMuaciDEw5pel
IOmAseWbmyDkuIvljYg1OjA45a+r6YGT77yaCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhpcyBwYXRj
aCBhZGQgUkRNQSBmaWZvIHNpemUgZXJyb3IgaGFuZGxlCj4gPiA+ID4gPiByZG1hIGZpZm8gc2l6
ZSB3aWxsIG5vdCBhbHdheXMgYmlnZ2VyIHRoYW4gdGhlIGNhbGN1bGF0ZWQgdGhyZXNob2xkCj4g
PiA+ID4gPiBpZiB0aGF0IGNhc2UgaGFwcGVuZWQsIHdlIG5lZWQgc2V0IGZpZm8gc2l6ZSBhcyB0
aGUgdGhyZXNob2xkCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5n
IE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIHwgNCArKysrCj4gPiA+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4KPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYwo+ID4gPiA+ID4gaW5kZXgg
Nzk0YWNjNS4uMDUwODM5MiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKPiA+ID4gPiA+IEBAIC0xNTEsNiArMTUxLDEwIEBAIHN0
YXRpYyB2b2lkIG10a19yZG1hX2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNp
Z25lZCBpbnQgd2lkdGgsCj4gPiA+ID4gPiAgICAgICAgICAqIGFjY291bnQgZm9yIGJsYW5raW5n
LCBhbmQgd2l0aCBhIHBpeGVsIGRlcHRoIG9mIDQgYnl0ZXM6Cj4gPiA+ID4gPiAgICAgICAgICAq
Lwo+ID4gPiA+ID4gICAgICAgICB0aHJlc2hvbGQgPSB3aWR0aCAqIGhlaWdodCAqIHZyZWZyZXNo
ICogNCAqIDcgLyAxMDAwMDAwOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBpZiAodGhy
ZXNob2xkID4gcmRtYV9maWZvX3NpemUpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgdGhyZXNo
b2xkID0gcmRtYV9maWZvX3NpemU7Cj4gPiA+ID4KPiA+ID4gPiBJZiB0aGUgZm9ybXVsYSBpcyBu
b3QgY29ycmVjdCwgeW91IHNob3VsZCBmaXggdGhlIGZvcm11bGEgbm90IHdvcmsgYXJvdW5kLgo+
ID4gPiA+Cj4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiBDaHVuLUt1YW5nLgo+ID4gPgo+ID4gPiBo
b3cgYWJvdXQgdGhpczoKPiA+ID4gdGhyZXNob2xkID0gbWF4KHdpZHRoICogaGVpZ2h0ICogdnJl
ZnJlc2ggKiA0ICogNyAvIDEwMDAwMDAsCj4gPiA+IHJkbWFfZmlmb19zaXplKTsKPiA+Cj4gPiBX
aGVuIEkgdXNlIHdpZHRoID0gMTkyMCwgaGVpZ2h0ID0gMTA4MCwgdnJlZnJlc2ggPSA2MCB0byBj
YWxjdWxhdGUsIEkKPiA+IGdldCB0aHJlc2hvbGQgPSAyOTg1Lgo+ID4gU28gSSB0aGluayBzZXQg
dGhyZXNob2xkIHRvIGhhbGYgb2YgZmlmbyBzaXplIGlzIE9LIGZvciBNQVhfV0lEVEgsCj4gPiBN
QVhfSEVJR0hULCBNQVhfVlJFRlJFU0ggKHRoZXNlIHRocmVlIG1heSBiZSBkaWZmZXJlbnQgaW4g
ZWFjaCBTb0MpCj4gPgo+ID4gdGhyZXNob2xkID0gUkRNQV9GSUZPX1BTRVVET19TSVpFKHJkbWFf
Zmlmb19zaXplKSAvIDI7Cj4gPgo+ID4gQnV0IEkgd29ycnkgaGFsZiBmaWZvIHNpemUgaXMgdG9v
IGJpZyBmb3Igc21hbGwgcmVzb2x1dGlvbiBhbmQgbGV0Cj4gPiBzbWFsbCByZXNvbHV0aW9uIHRv
byBlYXN5IHRvIHRyaWdnZXIgYnVyc3QgcmVhZCBEUkFNLiBTbyBsZXQgdGhlCj4gPiBmb3JtdWxh
IHRvIGJlIHRoaXM6Cj4gPgo+ID4gdGhyZXNob2xkID0gUkRNQV9GSUZPX1BTRVVET19TSVpFKHJk
bWFfZmlmb19zaXplKSAqIHdpZHRoICogaGVpZ2h0ICoKPiA+IHZyZWZyZXNoIC8gMiAvIE1BWF9X
SURUSCAvIE1BWF9IRUlHSFQgLyBNQVhfVlJFRlJFU0g7Cj4gPgo+ID4gSG93IGRvIHlvdSB0aGlu
ayBhYm91dCB0aGlzPwo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBDaHVuLUt1YW5nLgo+Cj4gaG93IGFi
b3V0IHJlbW92ZSB0aGlzIGZvcm11bGEsIGFuZCBzZXQgdGhyZXNob2xkID0gcmRtYV9maWZvX3Np
emUKClRoaXMgbWVhbnMgdGhhdCBSRE1BIHdvdWxkIGFsd2F5cyB0cmlnZ2VyIGJ1cnN0IHJlYWQu
IEluIG5vcm1hbCBjYXNlLApJIHRoaW5rIG5vIGhhcmR3YXJlIHdvdWxkIHRyaWdnZXIgYnVyc3Qg
cmVhZC4gT25seSB0aGUgZW1lcmdlbmN5Cm9jY3VyLCB0aGUgaGFyZHdhcmUgdHJpZ2dlciBidXJz
dCByZWFkLiBSRE1BIGFsd2F5cyB0cmlnZ2VyaW5nIGJ1cnN0CnJlYWQgaXMgZ29vZCBmb3IgUkRN
QSwgYnV0IGl0IG1heSBodXJ0IG90aGVyIGhhcmR3YXJlIHRvIHJlYWQgRFJBTS4gU28KSSB0aGlu
ayBSRE1BIHNob3VsZCB0cmlnZ2VyIGJ1cnN0IHJlYWQgb25seSB3aGVuIGZpZm8gZGF0YSBpcyB1
bmRlciBhCmVtZXJnZW5jeSB0aHJlc2hvbGQuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiA+Cj4g
PiA+ID4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICAgICAgICAgcmVnID0gUkRNQV9GSUZPX1VOREVS
RkxPV19FTiB8Cj4gPiA+ID4gPiAgICAgICAgICAgICAgIFJETUFfRklGT19QU0VVRE9fU0laRShy
ZG1hX2ZpZm9fc2l6ZSkgfAo+ID4gPiA+ID4gICAgICAgICAgICAgICBSRE1BX09VVFBVVF9WQUxJ
RF9GSUZPX1RIUkVTSE9MRCh0aHJlc2hvbGQpOwo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDEuOC4x
LjEuZGlydHkKPiA+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiA+ID4gPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiA+ID4gPiA+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gPiA+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKPiA+ID4KPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
