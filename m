Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AA42B1685
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 08:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3566E435;
	Fri, 13 Nov 2020 07:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7684A6E3FC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 07:36:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c17so8577847wrc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 23:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=h75klXVcmCdUqgkQ6FTqe7WDEW7XWDLja/aoiNvLvvA=;
 b=XDxXhtqca6DKFfUR/ZqKAryL+7RB5T3U/piwok/uUO3i3lEYq4wahqq/CgTckFwbE0
 FqJSLb8ZyaiBHndwkwq6XHm+N3LK+rUqrEJwx4IzlQTIwbxydg2FALf7l5Mggdjtmqtg
 ePDME5k8cZ8ZW0jRK5ouCvXJCFJdPd9PITB/sktY4lGOOT1CjAdJScXi1RGXFGZCPH0r
 db83Y+jXtz4qUR+a7MQ05mw6+zspknlWKwjptHvjKijBAiKzRjlAS2us2eX59ChzpXs0
 h22ELXdErcpdwy7AZ/jDGzAmeQN4/AB0lht7cm5HXnruSocnymj1Y9hz+Yyy/WVH3UCJ
 Fr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=h75klXVcmCdUqgkQ6FTqe7WDEW7XWDLja/aoiNvLvvA=;
 b=lBIApkvRa3nnJ2mgJt3Q1j6pO/eyhw1xWW4LVdXX34hQNneffiiaJ/zGjQqBKO/mMs
 3ahdLmr9kPzMhOaWHWJJGVn2mL8hf9tZUtIxYyqCjeWOkMdX7aWtGWCYehVnpxGkaz/l
 VP7O6LwUpcJ606yjeflIo+VRZaHqHk85CvMOwTM4YIw2pdiZFt61qz/3CBI0EWF4BRp1
 dhmZaIHvHEvzut66DkRe4uKfEXDn4ejK+7dt9AJVES6dIOt5AM1un7duSWogCeMwaLT1
 RJCzQnXTYtPmzs7h40BZk5P9c6HeMOfS2QTo2azaV1alCBt3oTWrLNj6ZYwwuwAyKBog
 ApzQ==
X-Gm-Message-State: AOAM531OjPOBWVKSxwaHgivy3WNhLdfW29KOG2VmvrJeiG8KxvCQkOAk
 LjmeZcu8gXYfLUipU7GX6Jra/g==
X-Google-Smtp-Source: ABdhPJwj2l3oAnuo6QHrM5Iat4Yv7D1oYYIfgkBuiyIm2+e/H9IEYWvHD5BWIHM/ICwOyeusyGOvlQ==
X-Received: by 2002:adf:dc4c:: with SMTP id m12mr1662187wrj.177.1605252997162; 
 Thu, 12 Nov 2020 23:36:37 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id q2sm9826724wru.76.2020.11.12.23.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 23:36:36 -0800 (PST)
Date: Fri, 13 Nov 2020 07:36:34 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
Message-ID: <20201113073634.GG2787115@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201113071932.GF2787115@dell>
 <CADnq5_NnKoOMQCQm0fJnER7mOGgYPvudfbbFOZkPC5Kg6Lp0XA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NnKoOMQCQm0fJnER7mOGgYPvudfbbFOZkPC5Kg6Lp0XA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, Rob Clark <rob@ti.com>,
 Gareth Hughes <gareth@valinux.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Rob Clark <rob.clark@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Keith Whitwell <keith@tungstengraphics.com>, Andy Gross <andy.gross@ti.com>,
 linux-media <linux-media@vger.kernel.org>, Leo Li <sunpeng.li@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 by <jhartmann@precisioninsight.com>, Jeff Hartmann <jhartmann@valinux.com>,
 LKML <linux-kernel@vger.kernel.org>, Faith <faith@valinux.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMyBOb3YgMjAyMCwgQWxleCBEZXVjaGVyIHdyb3RlOgoKPiBPbiBGcmksIE5vdiAx
MywgMjAyMCBhdCAyOjE5IEFNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+ID4KPiA+IE9uIEZyaSwgMDYgTm92IDIwMjAsIExlZSBKb25lcyB3cm90ZToKPiA+Cj4gPiA+
IFRoaXMgc2V0IGlzIHBhcnQgb2YgYSBsYXJnZXIgZWZmb3J0IGF0dGVtcHRpbmcgdG8gY2xlYW4t
dXAgVz0xCj4gPiA+IGtlcm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3ZlcndoZWxt
aW5nbHkgcmlkZGxlZCB3aXRoCj4gPiA+IG5pZ2dseSBsaXR0bGUgd2FybmluZ3MuCj4gPiA+Cj4g
PiA+IFRoZXJlIGFyZSA1MDAwIHdhcm5pbmdzIHRvIHdvcmsgdGhyb3VnaC4gIEl0IHdpbGwgdGFr
ZSBhIGNvdXBsZSBtb3JlCj4gPiA+IHNldHMuICBBbHRob3VnaCwgKCJkcm0vYW1kL2Rpc3BsYXkv
ZGMvYmFzaWNzL2ZpeHB0MzFfMzI6IE1vdmUKPiA+ID4gdmFyaWFibGVzIHRvIHdoZXJlIHRoZXkn
cmUgdXNlZCIpIGRvZXMgdGFrZSBjYXJlIG9mIDIwMDAgb2YgdGhlbSEKPiA+ID4KPiA+ID4gTGVl
IEpvbmVzICgxOSk6Cj4gPiA+ICAgZHJtL3R0bS90dG1fcmFuZ2VfbWFuYWdlcjogRGVtb3RlIG5v
bi1jb25mb3JtYW50IGtlcm5lbC1kb2MgaGVhZGVyCj4gPiA+ICAgZHJtL3IxMjgvYXRpX3BjaWdh
cnQ6IFNvdXJjZSBmaWxlIGhlYWRlcnMgYXJlIG5vdCBnb29kIGNhbmRpZGF0ZXMgZm9yCj4gPiA+
ICAgICBrZXJuZWwtZG9jCj4gPiA+ICAgZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVs
cGVyOiBNb3ZlCj4gPiA+ICAgICAnc2lkZWJhbmRfbXNnX3JlcV9lbmNvZGVfZGVjb2RlJyBvbnRv
IHRoZSBoZWFwCj4gPiA+ICAgZHJtL21nYS9tZ2FfZG1hOiBEZW1vdGUga2VybmVsLWRvYyBhYnVz
ZXJzIHRvIHN0YW5kYXJkIGNvbW1lbnQgYmxvY2tzCj4gPiA+ICAgZHJtL21nYS9tZ2Ffc3RhdGU6
IFJlbW92ZSB1bnVzZWQgdmFyaWFibGUgJ2J1Zl9wcml2Jwo+ID4gPiAgIGRybS9yYWRlb24vYXRv
bTogTW92ZSBwcm90b3R5cGUgaW50byBzaGFyZWQgbG9jYXRpb24KPiA+ID4gICBkcm0vcmFkZW9u
L3JhZGVvbl9rbXM6IEluY2x1ZGUgaGVhZGVyIGNvbnRhaW5pbmcgb3VyIG93biBwcm90b3R5cGVz
Cj4gPiA+ICAgZHJtL29tYXBkcm0vb21hcF9nZW06IEZpeCBtaXNuYW1lZCBhbmQgbWlzc2luZyBw
YXJhbWV0ZXIgZGVzY3JpcHRpb25zCj4gPiA+ICAgZHJtL29tYXBkcm0vb21hcF9kbW1fdGlsZXI6
IERlbW90ZSBhYnVzaXZlIHVzZSBvZiBrZXJuZWwtZG9jIGZvcm1hdAo+ID4gPiAgIGRybS9yYWRl
b24vcmFkZW9uOiBNb3ZlIHByb3RvdHlwZSBpbnRvIHNoYXJlZCBoZWFkZXIKPiA+ID4gICBkcm0v
cmFkZW9uL3JhZGVvbl9kcnY6IFNvdXJjZSBmaWxlIGhlYWRlcnMgYXJlIG5vdCBnb29kIGNhbmRp
ZGF0ZXMgZm9yCj4gPiA+ICAgICBrZXJuZWwtZG9jCj4gPiA+ICAgZHJtL2FtZC9kaXNwbGF5L2Rj
L2Jhc2ljcy9maXhwdDMxXzMyOiBNb3ZlIHZhcmlhYmxlcyB0byB3aGVyZSB0aGV5J3JlCj4gPiA+
ICAgICB1c2VkCj4gPiA+ICAgZHJtL3JhZGVvbi9yYWRlb25fZHJ2OiBNb3ZlIHByb3RvdHlwZXMg
dG8gYSBzaGFyZWQgaGVhZGVyZmlsZQo+ID4gPiAgIGRybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2U6IFByb3ZpZGUgZG9jdW1lbnRhdGlvbiBmb3IgJ3JlZ19hZGRyJwo+ID4gPiAgICAgcGFyYW1z
Cj4gPiA+ICAgZHJtL3JhZGVvbjogTW92ZSBwcm90b3R5cGVzIHRvIHNoYXJlZCBoZWFkZXIKPiA+
ID4gICBkcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zOiBSZW1vdmUgJ3N0cnVjdCBkcm1fYW1kZ3B1
X2luZm9fZGV2aWNlCj4gPiA+ICAgICBkZXZfaW5mbycgZnJvbSB0aGUgc3RhY2sKPiA+ID4gICBk
cm0vcmFkZW9uL3JhZGVvbl9rbXM6IEZpeCBtaXNuYW1pbmcgb2YgJ3JhZGVvbl9pbmZvX2lvY3Rs
J3MgZGV2IHBhcmFtCj4gPiA+ICAgZHJtL3JhZGVvbi9hdG9tYmlvc19jcnRjOiBSZW1vdmUgZGVz
Y3JpcHRpb24gb2Ygbm9uLWV4aXN0ZW50IGZ1bmN0aW9uCj4gPiA+ICAgICBwYXJhbSAnZW5jb2Rl
cicKPiA+ID4gICBkcm0vdjNkL3YzZF9kcnY6IFJlbW92ZSB1bnVzZWQgc3RhdGljIHZhcmlhYmxl
ICd2M2RfdjNkX3BtX29wcycKPiA+ID4KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYyAgICB8ICAgMiArCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfa21zLmMgICAgICAgfCAxMDQgKysrKysrKysrLS0tLS0tLS0tCj4gPiA+ICAu
Li4vZHJtL2FtZC9kaXNwbGF5L2RjL2Jhc2ljcy9maXhwdDMxXzMyLmMgICAgfCAgIDUgKwo+ID4g
PiAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9maXhlZDMxXzMyLmggIHwgICA2IC0K
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX2RtYS5jICAgICAgICAgICAgICAgICB8ICAx
MCArLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21nYS9tZ2Ffc3RhdGUuYyAgICAgICAgICAgICAg
IHwgICAyIC0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmMg
ICAgICB8ICAgNiArLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyAg
ICAgICAgICAgIHwgICAzICstCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcjEyOC9hdGlfcGNpZ2Fy
dC5jICAgICAgICAgICAgfCAgIDIgKy0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRv
bS5oICAgICAgICAgICAgICAgICB8ICAgNiArCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2F0b21iaW9zX2NydGMuYyAgICAgICAgfCAgIDEgLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9hdG9tYmlvc19lbmNvZGVycy5jICAgIHwgICA0IC0KPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uLmggICAgICAgICAgICAgICB8ICAgNiArCj4gPiA+ICBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYyAgICAgICAgfCAgIDEgKwo+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmggICAgICAgIHwgIDMyICsrKysrKwo+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jICAgICAgIHwgICA0IC0K
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jICAgICAgICAgICB8ICAx
MSArLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmggICAgICAgICAg
IHwgICA3ICsrCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYyAgICAg
ICAgICAgfCAgIDMgKy0KPiA+ID4gIC4uLi9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9o
ZWxwZXIuYyAgICB8ICAxMSArLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2Vf
bWFuYWdlci5jICAgICAgIHwgICAyICstCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9k
cnYuYyAgICAgICAgICAgICAgICAgfCAgMzYgLS0tLS0tCj4gPiA+ICAyMiBmaWxlcyBjaGFuZ2Vk
LCAxMzggaW5zZXJ0aW9ucygrKSwgMTI2IGRlbGV0aW9ucygtKQo+ID4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5oCj4gPgo+ID4gU3Rp
bGwgbm8gUmFkZW9uIHBhdGNoZXMgaW4gdG9kYXkncyAtbmV4dC4KPiA+Cj4gPiBJIHJlYWxseSB3
YW50ZWQgdG8gaGF2ZSBoYWQgdGhpcyBzZXQgcmViYXNlZCBieSBub3cuCj4gPgo+ID4gSG93IGxv
bmcgZG8gdGhleSB0YWtlIHRvIHBlY3VsYXRlIHRocm91Z2g/Cj4gCj4gVXN1YWxseSBhIGRheSBv
ciB0d28sIGJ1dCBJIHdhcyBzd2FtcGVkIHRoZSBsYXN0IGNvdXBsZSBvZiBkYXlzLiBJCj4gcHVz
aGVkIGFuIHVwZGF0ZWQgLW5leHQgYnJhbmNoIHRvZGF5Ogo+IGh0dHBzOi8vY2dpdC5mcmVlZGVz
a3RvcC5vcmcvfmFnZDVmL2xpbnV4L2xvZy8/aD1kcm0tbmV4dAoKQWgsIHdvbmRlcmZ1bC4KCkkn
bGwgcmViYXNlIGFsbCBvZiB0aGUgc2V0cyBvbiBNb25kYXkgYW5kIHNlZSB3aGF0IHdlJ3JlIGxl
ZnQgd2l0aC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFk
IC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
