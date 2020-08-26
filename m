Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32956253E68
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6F16EB2D;
	Thu, 27 Aug 2020 06:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41F46E135
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 14:44:32 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n18so1556964qtw.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=3fltz4Tid80yvbd7ycd5CEvXCm5Dl/pplKlQTmdAxKA=;
 b=k4m5mEJBWpHKc8UCyiMSoWpLFbB9PLsFXQSse1GeHDwA4DKW/bxLFf2oq06iweP+iL
 M8bgXdl0A9155UGa8Nz8VJmE6L39gWW8oVIXtrtnNW2XbaFdQ7/KhobmLnk55ujnHV/2
 tPPob3cH4BlQEISinoXdsc01CEIIJiQYM7T+gkUDqRjYhkY6CbBd83M1+SskyHHbWLvL
 rHtzPGZUMHG7eDyNL2Q4ZV/nAiZIzogvhqr+a2Knoik0r52ut2ISFzGOCWsps3sZCmxq
 fBsjIPcK+lwVA+ap0kK3kVNC6i6d4qEdXhZRr9MSKdg1iPVBdKJXwariY86XZf+E2JPH
 +9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=3fltz4Tid80yvbd7ycd5CEvXCm5Dl/pplKlQTmdAxKA=;
 b=DJKy1X6vIv2Hbegw4nzaNYMnuBRH2eO2lZVEe8xtQ4ha7T8nTuXYEtNVHTrwP6e5av
 J5DhQNZKUZu24qXgkHzQ77cuRRhylWFowNQq9383+G2moL2nuSU9Py8DGiON7LB/wcKR
 OHE/2TVtEBaXe9i9t1rc9XluOF9Dd/iBjPcOcyacQClmkm0pvZjsX/Pxq96kqHF0f7+R
 E4qebZ7lWuZMxK3nXm6DU18vDHWgtQrHmTQKnJK2clqVMc1+nPx6eBeIE5UR38+tzB9M
 p5fWhBnaM/NHQy3X/5xKmK5gDtJ+lbMYOfnSKAyHfKD96IiHfi45c66MWIONsOKtMD++
 Q/Eg==
X-Gm-Message-State: AOAM5311a79kSFe1q7QgTYDbz6DCzKZapVnLBmFZaeKSIwiYP8S0TQ5Q
 nGVWZUJSjDHFMmx6VXtTviuchA==
X-Google-Smtp-Source: ABdhPJzCRDv2m2NsfRzSYdU3punl1WmSuoZIWY3X6Qrw3w/UZAKmzNkoM0/3I601SkHanbswK7RLyw==
X-Received: by 2002:ac8:33a1:: with SMTP id c30mr10693591qtb.156.1598453071797; 
 Wed, 26 Aug 2020 07:44:31 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
 by smtp.gmail.com with ESMTPSA id a203sm1862906qkg.30.2020.08.26.07.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 07:44:31 -0700 (PDT)
Message-ID: <aade022eeea9d9196774d0f21cbdaa118de8f885.camel@ndufresne.ca>
Subject: Re: [PATCH 00/49] DRM driver for Hikey 970
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Dave Airlie
 <airlied@gmail.com>
Date: Wed, 26 Aug 2020 10:44:28 -0400
In-Reply-To: <20200825133025.13f047f0@coco.lan>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <20200819152120.GA106437@ravnborg.org>
 <20200819153045.GA18469@pendragon.ideasonboard.com>
 <CALAqxLUXnPRec3UYbMKge8yNKBagLOatOeRCagF=JEyPEfWeKA@mail.gmail.com>
 <20200820090326.3f400a15@coco.lan>
 <20200820100205.GA5962@pendragon.ideasonboard.com>
 <CAPM=9twzsw7T=GD6Jc1EFenXq9ZhTgf_Nuo71uLfX2W33oa=6w@mail.gmail.com>
 <20200825133025.13f047f0@coco.lan>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:37 +0000
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, driverdevel <devel@driverdev.osuosl.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Wei Xu <xuwei5@hisilicon.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>, Jakub Kicinski <kuba@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Liwei Cai <cailiwei@hisilicon.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alexei Starovoitov <ast@kernel.org>, "moderated
 list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rob Herring <robh+dt@kernel.org>, mauro.chehab@huawei.com,
 Rob Clark <robdclark@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>, Liuyao An <anliuyao@huawei.com>,
 Network Development <netdev@vger.kernel.org>,
 Rongrong Zou <zourongrong@gmail.com>, BPF Mailing List <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWFyZGkgMjUgYW/Du3QgMjAyMCDDoCAxMzozMCArMDIwMCwgTWF1cm8gQ2FydmFsaG8gQ2hl
aGFiIGEgw6ljcml0IDoKPiBFbSBUdWUsIDI1IEF1ZyAyMDIwIDA1OjI5OjI5ICsxMDAwCj4gRGF2
ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiBlc2NyZXZldToKPiAKPiA+IE9uIFRodSwgMjAg
QXVnIDIwMjAgYXQgMjA6MDIsIExhdXJlbnQgUGluY2hhcnQKPiA+IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+ID4gPiBIaSBNYXVybywKPiA+ID4gCj4gPiA+IE9u
IFRodSwgQXVnIDIwLCAyMDIwIGF0IDA5OjAzOjI2QU0gKzAyMDAsIE1hdXJvIENhcnZhbGhvIENo
ZWhhYiB3cm90ZTogIAo+ID4gPiA+IEVtIFdlZCwgMTkgQXVnIDIwMjAgMTI6NTI6MDYgLTA3MDAg
Sm9obiBTdHVsdHogZXNjcmV2ZXU6ICAKPiA+ID4gPiA+IE9uIFdlZCwgQXVnIDE5LCAyMDIwIGF0
IDg6MzEgQU0gTGF1cmVudCBQaW5jaGFydCB3cm90ZTogIAo+ID4gPiA+ID4gPiBPbiBXZWQsIEF1
ZyAxOSwgMjAyMCBhdCAwNToyMToyMFBNICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6ICAKPiA+
ID4gPiA+ID4gPiBPbiBXZWQsIEF1ZyAxOSwgMjAyMCBhdCAwMTo0NToyOFBNICswMjAwLCBNYXVy
byBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6ICAKPiA+ID4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggc2Vy
aWVzIHBvcnQgdGhlIG91dC1vZi10cmVlIGRyaXZlciBmb3IgSGlrZXkgOTcwICh3aGljaAo+ID4g
PiA+ID4gPiA+ID4gc2hvdWxkIGFsc28gc3VwcG9ydCBIaWtleSA5NjApIGZyb20gdGhlIG9mZmlj
aWFsIDk2Ym9hcmRzIHRyZWU6Cj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ICAgIGh0
dHBzOi8vZ2l0aHViLmNvbS85NmJvYXJkcy1oaWtleS9saW51eC90cmVlL2hpa2V5OTcwLXY0LjkK
PiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gQmFzZWQgb24gaGlzIGhpc3RvcnksIHRo
aXMgZHJpdmVyIHNlZW1zIHRvIGJlIG9yaWdpbmFsbHkgd3JpdHRlbgo+ID4gPiA+ID4gPiA+ID4g
Zm9yIEtlcm5lbCA0LjQsIGFuZCB3YXMgbGF0ZXIgcG9ydGVkIHRvIEtlcm5lbCA0LjkuIFRoZSBv
cmlnaW5hbAo+ID4gPiA+ID4gPiA+ID4gZHJpdmVyIHVzZWQgdG8gZGVwZW5kIG9uIElPTiAoZnJv
bSBLZXJuZWwgNC40KSBhbmQgaGFkIGl0cyBvd24KPiA+ID4gPiA+ID4gPiA+IGltcGxlbWVudGF0
aW9uIGZvciBGQiBkZXYgQVBJLgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBBcyBJ
IG5lZWQgdG8gcHJlc2VydmUgdGhlIG9yaWdpbmFsIGhpc3RvcnkgKHdpdGggaGFzIHBhdGNoZXMg
ZnJvbQo+ID4gPiA+ID4gPiA+ID4gYm90aCBIaVNpbGljb24gYW5kIGZyb20gTGluYXJvKSwgIEkn
bSBzdGFydGluZyBmcm9tIHRoZSBvcmlnaW5hbAo+ID4gPiA+ID4gPiA+ID4gcGF0Y2ggYXBwbGll
ZCB0aGVyZS4gVGhlIHJlbWFpbmluZyBwYXRjaGVzIGFyZSBpbmNyZW1lbnRhbCwKPiA+ID4gPiA+
ID4gPiA+IGFuZCBwb3J0IHRoaXMgZHJpdmVyIHRvIHdvcmsgd2l0aCB1cHN0cmVhbSBLZXJuZWwu
Cj4gPiA+ID4gPiA+ID4gPiAgCj4gPiA+ID4gPiAuLi4gIAo+ID4gPiA+ID4gPiA+ID4gLSBEdWUg
dG8gbGVnYWwgcmVhc29ucywgSSBuZWVkIHRvIHByZXNlcnZlIHRoZSBhdXRob3JzaGlwIG9mCj4g
PiA+ID4gPiA+ID4gPiAgIGVhY2ggb25lIHJlc3BvbnNiaWxlIGZvciBlYWNoIHBhdGNoLiBTbywg
SSBuZWVkIHRvIHN0YXJ0IGZyb20KPiA+ID4gPiA+ID4gPiA+ICAgdGhlIG9yaWdpbmFsIHBhdGNo
IGZyb20gS2VybmVsIDQuNDsgIAo+ID4gPiA+ID4gLi4uICAKPiA+ID4gPiA+ID4gPiBJIGRvIGFj
a25vd2xlZGdlIHlvdSBuZWVkIHRvIHByZXNlcnZlIGhpc3RvcnkgYW5kIGFsbCAtCj4gPiA+ID4g
PiA+ID4gYnV0IHRoaXMgcGF0Y2hzZXQgaXMgbm90IGVhc3kgdG8gcmV2aWV3LiAgCj4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiBXaHkgZG8gd2UgbmVlZCB0byBwcmVzZXJ2ZSBoaXN0b3J5ID8gQWRk
aW5nIHJlbGV2YW50IFNpZ25lZC1vZmYtYnkgYW5kCj4gPiA+ID4gPiA+IENvLWRldmVsb3BlZC1i
eSBzaG91bGQgYmUgZW5vdWdoLCBzaG91bGRuJ3QgaXQgPyBIYXZpbmcgYSBwdWJsaWMgYnJhbmNo
Cj4gPiA+ID4gPiA+IHRoYXQgY29udGFpbnMgdGhlIGhpc3RvcnkgaXMgdXNlZnVsIGlmIGFueW9u
ZSBpcyBpbnRlcmVzdGVkLCBidXQgSSBkb24ndAo+ID4gPiA+ID4gPiB0aGluayBpdCdzIHJlcXVp
cmVkIGluIG1haW5saW5lLiAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFllYS4gSSBjb25jdXIgd2l0
aCBMYXVyZW50IGhlcmUuIEknbSBub3Qgc3VyZSB3aGF0IGxlZ2FsIHJlYXNvbmluZyB5b3UKPiA+
ID4gPiA+IGhhdmUgb24gdGhpcyBidXQgcHJlc2VydmluZyB0aGUgImFic29sdXRlIiBoaXN0b3J5
IGhlcmUgaXMgYWN0aXZlbHkKPiA+ID4gPiA+IGRldHJpbWVudGFsIGZvciByZXZpZXcgYW5kIHVu
ZGVyc3RhbmRpbmcgb2YgdGhlIHBhdGNoIHNldC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gUHJlc2Vy
dmluZyBBdXRob3JzaGlwLCBTaWduZWQtb2ZmLWJ5IGxpbmVzIGFuZCBhZGRpbmcgQ28tZGV2ZWxv
cGVkLWJ5Cj4gPiA+ID4gPiBsaW5lcyBzaG91bGQgYmUgc3VmZmljaWVudCB0byBwcm92aWRlIGJv
dGggYXRyaWJ1dGlvbiBjcmVkaXQgYW5kIERDTwo+ID4gPiA+ID4gaGlzdG9yeS4gIAo+ID4gPiA+
IAo+ID4gPiA+IEknbSBub3QgY29udmluY2VkIHRoYXQsIGZyb20gbGVnYWwgc3RhbmRwb2ludCwg
Zm9sZGluZyB0aGluZ3Mgd291bGQKPiA+ID4gPiBiZSBlbm91Z2guIFNlZSwgdGhlcmUgYXJlIGF0
IGxlYXN0IDMgbGVnYWwgc3lzdGVtcyBpbnZvbHZlZCBoZXJlCj4gPiA+ID4gYW1vbmcgdGhlIGRp
ZmZlcmVudCBwYXRjaCBhdXRob3JzOgo+ID4gPiA+IAo+ID4gPiA+ICAgICAgIC0gY2l2aWwgbGF3
Owo+ID4gPiA+ICAgICAgIC0gY29tbW9uIGxhdzsKPiA+ID4gPiAgICAgICAtIGN1c3RvbWFyeSBs
YXcgKyBjb21tb24gbGF3Lgo+ID4gPiA+IAo+ID4gPiA+IE1lcmdpbmcgc3R1ZmYgYWx0b2dldGhl
ciBmcm9tIGRpZmZlcmVudCBsYXcgc3lzdGVtcyBjYW4gYmUgcHJvYmxlbWF0aWMsCj4gPiA+ID4g
YW5kIHRyeWluZyB0byBkaXNjdXNzIHRoaXMgd2l0aCBleHBlcmllbmNlZCBJUCBwcm9wZXJ0eSBs
YXd5ZXJzIHdpbGwKPiA+ID4gPiBmb3Igc3VyZSB0YWtlIGEgbG90IG9mIHRpbWUgYW5kIGVmZm9y
dHMuIEkgYWxzbyBiZXQgdGhhdCBkaWZmZXJlbnQKPiA+ID4gPiBsYXd5ZXJzIHdpbGwgaGF2ZSBk
aWZmZXJlbnQgb3BpbmlvbnMsIGJlY2F1c2UgbGF3cyBhcmUgc3ViamVjdCB0bwo+ID4gPiA+IGlu
dGVycHJldGF0aW9uLiBXaXRoIHRoYXQgbWF0dGVyIEknbSBub3QgYXdhcmUgb2YgYW55IGNvdXJ0
IHJ1bGVzCj4gPiA+ID4gd2l0aCByZWdhcmRzIHRvIGZvbGRlZCBwYXRjaGVzLiBTbywgaXQgc291
bmRzIHRvIG1lIHRoYXQgZm9sZGluZwo+ID4gPiA+IHBhdGNoZXMgaXMgc29tZXRoaW5nIHRoYXQg
aGFzIHlldCB0byBiZSBwcm9vZmVkIGluIGNvdXJ0cyBhcm91bmQKPiA+ID4gPiB0aGUgZ2xvYmUu
Cj4gPiA+ID4gCj4gPiA+ID4gQXQgbGVhc3QgZm9yIFVTIGxlZ2FsIHN5c3RlbSwgaXQgc291bmRz
IHRoYXQgdGhlIENvdW50cnkgb2YKPiA+ID4gPiBvcmlnaW4gb2YgYSBwYXRjaCBpcyByZWxldmFu
dCwgYXMgdGhleSBoYXZlIGEgY29uY2VwdCBvZgo+ID4gPiA+ICJuYXRpb25hbCB0ZWNobm9sb2d5
IiB0aGF0IGNhbiBiZSBzdWJqZWN0IHRvIGV4cG9ydCByZWd1bGF0aW9ucy4KPiA+ID4gPiAKPiA+
ID4gPiBGcm9tIG15IHNpZGUsIEkgcmVhbGx5IHByZWZlciB0byBwbGF5IHNhZmUgYW5kIHN0YXkg
b3V0IG9mIGFueSBzdWNoCj4gPiA+ID4gbGVnYWwgZGlzY3Vzc2lvbnMuICAKPiA+ID4gCj4gPiA+
IExldCdzIGJlIHNlcmlvdXMgZm9yIGEgbW9tZW50LiBJZiB5b3UgdGhpbmsgdGhlcmUgYXJlIGxl
Z2FsIGlzc3VlcyBpbgo+ID4gPiB0YWtpbmcgR1BMLXYyLjAtb25seSBwYXRjaGVzIGFuZCBzcXVh
c2hpbmcgdGhlbSB3aGlsZSByZXRhaW5pbmcKPiA+ID4gYXV0aG9yc2hpcCBpbmZvcm1hdGlvbiB0
aHJvdWdoIHRhZ3MsIHRoZSBMaW51eCBrZXJuZWwgaWYgKmZ1bGwqIG9mIHRoYXQuCj4gPiA+IFlv
dSBhbHNvIHJvdXRpbmVseSBtb2RpZnkgcGF0Y2hlcyB0aGF0IHlvdSBjb21taXQgdG8gdGhlIG1l
ZGlhIHN1YnN5c3RlbQo+ID4gPiB0byBmaXggInNtYWxsIGlzc3VlcyIuCj4gPiA+IAo+ID4gPiBU
aGUgY291bnRyeSBvZiBvcmlnaW4gYXJndW1lbnQgbWFrZXMgbm8gc2Vuc2UgZWl0aGVyLCB0aGUg
a2VybmVsIGNvZGUKPiA+ID4gYmFzZSBpZiBmdWxsIG9mIGNvZGUgY29taW5nIGZyb20gcHJldHR5
IG11Y2ggYWxsIGNvdW50cnkgb24gdGhlIHBsYW5ldC4KPiA+ID4gCj4gPiA+IEtlZXBpbmcgdGhl
IHBhdGNoZXMgc2VwYXJhdGUgbWFrZSB0aGlzIGhhcmQgdG8gcmV2aWV3LiBQbGVhc2Ugc3F1YXNo
Cj4gPiA+IHRoZW0uICAKPiA+IAo+ID4gSSdtIGluY2xpbmVkIHRvIGFncmVlIHdpdGggTGF1cmVu
dCBoZXJlLgo+ID4gCj4gPiBQYXRjaGVzIHN1Ym1pdHRlZCBhcyBHUEwtdjIgd2l0aCBEQ08gbGlu
ZXMgYW5kIGF1dGhvciBuYW1lcy9jb21wYW5pZXMKPiA+IHNob3VsZCBiZSBmaW5lIHRvIGJlIHNx
dWFzaGVkIGFuZCByZWFycmFuZ2VkLAo+ID4gYXMgbG9uZyBhcyB0aGUgRENPIGFuZCBBdXRob3Jz
aGlwIGlzIGtlcHQgc29tZXdoZXJlIGluIHRoZSBuZXcgcGF0Y2gKPiA+IHRoYXQgaXMgYXBwbGll
ZC4KPiA+IAo+ID4gUmV2aWV3IGlzIG1vcmUgaW1wb3J0YW50IGhlcmUuCj4gCj4gU29ycnksIGJ1
dCBJIGNhbid0IGFncmVlIHRoYXQgcmV2aWV3IGlzIG1vcmUgaW1wb3J0YW50IHRoYW4gdG8gYmUg
YWJsZQo+IHRvIHByb3Blcmx5IGluZGljYXRlIGNvcHlyaWdodHMgaW4gYSB2YWxpZCB3YXkgYXQg
dGhlIGxlZ2FsIHN5c3RlbXMgdGhhdAo+IGl0IHdvdWxkIGFwcGx5IDstKQoKUmVnYXJkbGVzcyBv
ZiB0aGUgInJldmlldy1hYmlsaXR5Iiwgb3VyIHVzZXJzIGRpc3RyaWJ1dGUgdGhlIExpbnV4Cktl
cm5lbCBhcyBhIHdob2xlLCBzbyB3aG8gY29udHJpYnV0ZWQgd2hpY2ggc3BlY2lmaWMgbGluZSBv
ZiBjb2RlIGlzCmFscmVhZHkgbG9zdCBpbiBhIHdheS4gQWxsIHdlIHNlZSBpbiB0aGUgZGlzdHJp
YnV0aW9uIGlmIGEgbGlzdCBvZgpjb3B5cmlnaHQgaG9sZGVyIGFuZCBsaWNlbnNlcy4gSW4gdGhp
cyBjb250ZXh0LCB0aGUgcGVyIHBhdGNoZXMKb3duZXJzaGlwIGhhdmUgbm8gbGVnYWwgaW1wbGlj
YXRpb24uIE15IHR3bywgbm9uIGxhd3llciBjZW50cy4KCj4gCj4gSW4gYW55IGNhc2UsIHRoZXJl
J3MgYW4gZWFzeSB3YXkgdG8gbWFrZSB0aGUgY29kZSBlYXN5IHRvIHJldmlldzoKPiBJIGNhbiB3
cml0ZSB0aGUgcGF0Y2hlcyBhZ2FpbnN0IHN0YWdpbmcgKHdoZXJlIGl0IGlzIE9LIHRvIHN1Ym1p
dAo+IHByZXNlcnZpbmcgdGhlIGhpc3RvcnkpIGFuZCB0aGVuIGFkZCBhIGZpbmFsIHBhdGNoIG1v
dmluZyBpdCBvdXQKPiBvZiBzdGFnaW5nLgo+IAo+IFlvdSBjYW4gdGhlbiBqdXN0IHJldmlldyB0
aGUgbGFzdCBwYXRjaCwgYXMgaXQgd2lsbCBjb250YWluIHRoZQo+IGVudGlyZSBjb2RlIG9uIGl0
Lgo+IAo+IEFub3RoZXIgYWx0ZXJuYXRpdmUsIGFzIEknbSBhbHJlYWR5IGRvaW5nIHdpdGggU2Ft
LCBpcyBmb3IgbWUgdG8KPiBzdWJtaXQgdGhlIGZvbGRlZCBjb2RlIGFzIGEgcmVwbHkgdG8gMDAv
eHguIFlvdSBjYW4gdGhlbiBqdXN0IAo+IHJldmlldyB0aGUgZmluYWwgY29kZSwgd2l0aG91dCBj
b25jZXJuaW5nIGFib3V0IGhvdyB0aGUgY29kZSByZWFjaGVkCj4gdGhlcmUuCj4gCj4gRnJvbSBy
ZXZpZXcgcG9pbnQgb2YgdGhlIHZpZXcsIHRoaXMgd2lsbCBiZSB0aGUgc2FtZSBhcyByZXZpZXdp
bmcKPiBhIGZvbGRlZCBwYXRjaCwgYnV0LCBmcm9tIGxlZ2FsIHN0YW5kcG9pbnQsIHRoZSBlbnRp
cmUgY29weXJpZ2h0Cj4gY2hhaW4gd2lsbCBiZSBwcmVzZXJ2ZWQuCj4gCj4gVGhhbmtzLAo+IE1h
dXJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
