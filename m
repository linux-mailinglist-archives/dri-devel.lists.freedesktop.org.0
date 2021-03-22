Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F842343BED
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 09:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D63A89C80;
	Mon, 22 Mar 2021 08:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BECC89C83
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 08:39:52 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b16so18255567eds.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WosURJkM/PKSCOw9xPERzj9fjDA03BThhpk0x/4VEXg=;
 b=Xmw1I0kVglEkkyuysEP1PPTcEa0qNfUT+YiRUf21xzme6vAcGVqGQFhILRd5KF6HQT
 oAFfhdwqyw/7k+Z2aHghIGttZFXr1qMivDnMOZCpx8s5pSWybC9p5wS1T/12dE6axlRE
 XAlEAguYbFxtFpFCih0t7ANGSfFkAXJPAyhS+Jg6Q8zR7vgp8MQJsJZwV5QH4Lv271/e
 lMaD1/D08eqYnnkHs2fb3tKFeeRsUuQqLNmnsRV+6ktK6/aHy3TmEZc2QmGgIgILxbUb
 0fyOqeOpSaLYJh4YvLz/ximI7JeQMp89Wpc2roOfrbULHCS6TVt3Xn9qBMNloAPNH+ra
 IZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WosURJkM/PKSCOw9xPERzj9fjDA03BThhpk0x/4VEXg=;
 b=GNNMBSBM6PomcfC+HeZNf8Z+XWqZobXut2SWrgF+LRn1o84xl4Sn8czgvJLJZzZ1Hs
 Hgdv+Jblij9mIClWGAlrmyKeYw8IdGZdLBkfowd4AsU0FcAREL44qbU9kOzfm+/qsUhK
 l4sR+oCsnEfLHMo8vrwmiF9NbGKWMqn54DAZWK4RQoceN+fhS5BfCyjr/rfWMfR14ouE
 +x1qPVpjxrn5ahM4aZAMjCKlwaVs6sgF6+xSZ5YnKVAHnDd9d81DkJz17HCFUS26i+To
 mxquzSzwZNq81VGYRosMYRbUjKrhY+iwAtaYRUSGNgvSXNkGtI1YaJEHqmsPepfkOdAc
 odeg==
X-Gm-Message-State: AOAM530SsVmzm4DTip53C5Y2+FhaoseYeENwZ6UkCdk0C1FtOSpx0Ihi
 GZob7mg3QGYfwrU4rlQHA31BTw==
X-Google-Smtp-Source: ABdhPJw6q+bFZcIwo/y4uN0oE8skM7XUnmmeJDRr9QTv/JOzMN54LLFvW9KELWO6DcVO4jr2DhMgiA==
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr23148734edu.52.1616402390537; 
 Mon, 22 Mar 2021 01:39:50 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id ga28sm4809735ejc.82.2021.03.22.01.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 01:39:50 -0700 (PDT)
Date: Mon, 22 Mar 2021 08:39:47 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Roland Scheidegger <sroland@vmware.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Anthony Koo <Anthony.Koo@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Harry Wentland <harry.wentland@amd.com>, Jeremy Kolb <jkolb@brandeis.edu>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Leo Li <sunpeng.li@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Rob Clark <rob.clark@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>
Subject: Re: [RESEND 00/53] Rid GPU from W=1 warnings
Message-ID: <20210322083947.GM2916463@dell>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell> <YEobySvG0zPs9xhc@phenom.ffwll.local>
 <20210311135152.GT701493@dell> <20210317081729.GH701493@dell>
 <CAKMK7uEibsgXXTEM1d2CGSswp-koouPSouseP_rwLHTdpxfRpw@mail.gmail.com>
 <CAKMK7uHkJGDL8k3FfAqAM78honZR0euMcacW8UpdPZfS1J-7cA@mail.gmail.com>
 <20210319082407.GG2916463@dell>
 <YFTlhh1ZSFffO+Nr@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFTlhh1ZSFffO+Nr@phenom.ffwll.local>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxOSBNYXIgMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gRnJpLCBNYXIg
MTksIDIwMjEgYXQgMDg6MjQ6MDdBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gVGh1
LCAxOCBNYXIgMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IAo+ID4gPiBPbiBXZWQsIE1h
ciAxNywgMjAyMSBhdCA5OjMyIFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIE1hciAxNywgMjAyMSBhdCA5OjE3IEFNIExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9u
IFRodSwgMTEgTWFyIDIwMjEsIExlZSBKb25lcyB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IE9uIFRodSwgMTEgTWFyIDIwMjEsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gT24gTW9uLCBNYXIgMDgsIDIwMjEgYXQgMDk6MTk6MzJBTSArMDAwMCwgTGVl
IEpvbmVzIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24gRnJpLCAwNSBNYXIgMjAyMSwgUm9sYW5k
IFNjaGVpZGVnZ2VyIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gVGhl
IHZtd2dmeCBvbmVzIGxvb2sgYWxsIGdvb2QgdG8gbWUsIHNvIGZvcgo+ID4gPiA+ID4gPiA+ID4g
PiAyMy01MzogUmV2aWV3ZWQtYnk6IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUu
Y29tPgo+ID4gPiA+ID4gPiA+ID4gPiBUaGF0IHNhaWQsIHRoZXkgd2VyZSBhbHJlYWR5IHNpZ25l
ZCBvZmYgYnkgWmFjaywgc28gbm90IHN1cmUgd2hhdAo+ID4gPiA+ID4gPiA+ID4gPiBoYXBwZW5l
ZCBoZXJlLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IFllcywgdGhleSB3ZXJlIGFj
Y2VwdGVkIGF0IG9uZSBwb2ludCwgdGhlbiBkcm9wcGVkIHdpdGhvdXQgYSByZWFzb24uCj4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gU2luY2UgSSByZWJhc2VkIG9udG8gdGhlIGxhdGVz
dCAtbmV4dCwgSSBoYWQgdG8gcGx1Y2sgdGhlbSBiYWNrIG91dCBvZgo+ID4gPiA+ID4gPiA+ID4g
YSBwcmV2aW91cyBvbmUuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUaGV5IHNob3VsZCBz
aG93IHVwIGluIGxpbnV4LW5leHQgYWdhaW4uIFdlIG1lcmdlIHBhdGNoZXMgZm9yIG5leHQgbWVy
Z2UKPiA+ID4gPiA+ID4gPiB3aW5kb3cgZXZlbiBkdXJpbmcgdGhlIGN1cnJlbnQgbWVyZ2Ugd2lu
ZG93LCBidXQgbmVlZCB0byBtYWtlIHN1cmUgdGhleQo+ID4gPiA+ID4gPiA+IGRvbid0IHBvbGx1
dGUgbGludXgtbmV4dC4gT2NjYXNpb25hbGx5IHRoZSBjdXQgb2ZmIGlzIHdyb25nIHNvIHBhdGNo
ZXMKPiA+ID4gPiA+ID4gPiBzaG93IHVwLCBhbmQgdGhlbiBnZXQgcHVsbGVkIGFnYWluLgo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVW5mb3J0dW5hdGVseSBlc3BlY2lhbGx5IHRoZSA1LjEy
IG1lcmdlIGN5Y2xlIHdhcyB2ZXJ5IHdvYmJseSBkdWUgdG8gc29tZQo+ID4gPiA+ID4gPiA+IGNv
bmZ1c2lvbiBoZXJlLiBCdXQgeW91ciBwYXRjaGVzIHNob3VsZCBhbGwgYmUgaW4gbGludXgtbmV4
dCBhZ2FpbiAodGhleQo+ID4gPiA+ID4gPiA+IGFyZSBxdWV1ZWQgdXAgZm9yIDUuMTMgaW4gZHJt
LW1pc2MtbmV4dCwgSSBjaGVja2VkIHRoYXQpLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
U29ycnkgZm9yIHRoZSBjb25mdXNpb24gaGVyZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT2gs
IEkgc2VlLiAgV2VsbCBzbyBsb25nIGFzIHRoZXkgZG9uJ3QgZ2V0IGRyb3BwZWQsIEknbGwgYmUg
aGFwcHkuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9u
IERhbmllbAo+ID4gPiA+ID4KPiA+ID4gPiA+IEFmdGVyIHJlYmFzaW5nIHRvZGF5LCBhbGwgb2Yg
bXkgR1BVIHBhdGNoZXMgaGF2ZSByZW1haW5lZC4gIFdvdWxkCj4gPiA+ID4gPiBzb21lb25lIGJl
IGtpbmQgZW5vdWdoIHRvIGNoZWNrIHRoYXQgZXZlcnl0aGluZyBpcyBzdGlsbCBpbiBvcmRlcgo+
ID4gPiA+ID4gcGxlYXNlPwo+ID4gPiA+Cj4gPiA+ID4gSXQncyBzdGlsbCBicm9rZW4gc29tZWhv
dy4gSSd2ZSBraWNlZCBNYXhpbWUgYW5kIE1hYXJ0ZW4gYWdhaW4sCj4gPiA+ID4gdGhleSdyZSBh
bHNvIG9uIHRoaXMgdGhyZWFkLgo+ID4gPiAKPiA+ID4gWW91J3JlIHBhdGNoZXMgaGF2ZSBtYWRl
IGl0IGludG8gZHJtLW5leHQgbWVhbndoaWxlLCBzbyB0aGV5IHNob3VsZAo+ID4gPiBzaG93IHVw
IGluIGxpbnV4LW5leHQgdGhyb3VnaCB0aGF0IHRyZWUgYXQgbGVhc3QuIEV4Y2VwdCBpZiB0aGF0
IG9uZQo+ID4gPiBhbHNvIGhhcyBzb21lIHRyb3VibGUuCj4gPiAKPiA+IFRoYW5rcyBmb3IgbGV0
dGluZyBtZSBrbm93Lgo+ID4gCj4gPiBJIHNlZSBzb21lIHBhdGNoZXMgbWFkZSBpdCBiYWNrIGlu
LCBvdGhlcnMgZGlkbid0Lgo+ID4gCj4gPiBJJ2xsIHJlc2VuZCB0aGUgc3RyYWdnbGVycyAtIGJl
YXIgd2l0aC4KPiAKPiBUaGUgdm13Z2Z4IG9uZXMgc2hvdWxkIGFsbCBiZSBiYWNrLCB0aGUgb3Ro
ZXJzIEkgZ3Vlc3MganVzdCB3ZXJlbnQgZXZlcgo+IGFwcGxpZWQuIEknbGwgdmFjdXVtIHRoZW0g
YWxsIHVwIGlmIHlvdSByZXNlbmQuIEFwb2xvZ2llcyBmb3IgdGhlIHdvYmJseQo+IHJpZGUuCgpO
UCwgaXQgaGFwcGVucy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNh
bCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBC
bG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
