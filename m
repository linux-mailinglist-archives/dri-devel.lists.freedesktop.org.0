Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCDF2FCC46
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 09:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F456E141;
	Wed, 20 Jan 2021 08:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86286E141
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 08:05:31 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id m2so1993772wmm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 00:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=i0E7CMnkJOpieDzn6Vg+wQQjdFWzO1+rNLsWhsRoe3o=;
 b=OCmzqzCx+kJKozrzBCDTsmV41sa//C8Xz6MgavuR25f4oaXCkpVJHvPWsgS/XltA9g
 6MsYyWYfHRBgBYFYevh1ruUsDAO1aCK96HPyTCAT4mYW4BjSb2RygzqlQUBXGQMZyYo4
 oHcyS26K06EL/6eFa3SOYkGyH0h5522KhkZ9z9CcF1618Y3lDTM061Yj/gpJalQ9pSlf
 BjL36AZ1kECVP7B92jDo2L9BZRpQrJ4zvGVsDQuphXYnvNXXnR52kOfzjo8BiS+LtI+6
 3bRjXALY6WVXvu3dC9Djf0Bx8av9XnTcqBqUhhYBD/3Ln/T0JDGmzMzfxu+yKs/9xxE3
 nf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=i0E7CMnkJOpieDzn6Vg+wQQjdFWzO1+rNLsWhsRoe3o=;
 b=svpZ6jI2Duz8JG5RtABrG+JUBDuhzy9+6PNeFN77unO/LbxQI2xtvvCEBaX79m6Ho/
 n8hiSi9YkVIlNOXLh89UwfLr1YkcmTA8jB69tTRxCquMYtA5vH5o7CPKi0c8SVEPcBjT
 W42hKIcebqqNVYn9bGUAr2FzWQD17ZVoDzQeoqsPY6f/4AKefu++927+ts1Efc0ATQYB
 t4ALLdDicnrzuPR6ORc0V33XDsyqsn4F8vpkvKOD5jTvkW8Mbbux/Xb45aoKfB2/Hltg
 u+TlumPOqcztjaW223Fe/sUxyjXTAJ1+TP99MhQCm/IgOL+hyD5MZw+PDsMiVmYU0zVG
 7dmg==
X-Gm-Message-State: AOAM532XJqLkxpR0aJYcueP3d8JDNl258j9CvRPh6fM+mbg7gcV+uKrP
 CDV7jl5Y+VShaO/jhjxFgroRkg==
X-Google-Smtp-Source: ABdhPJw03a3Mt+JIRRJlN+qL5Wvmb168qR1zfbc+zME3aDudXf2zqFFDvbGkZ01CEqJS8MlUBAm8PA==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr3049511wmj.19.1611129930271;
 Wed, 20 Jan 2021 00:05:30 -0800 (PST)
Received: from dell ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id s13sm2538012wra.53.2021.01.20.00.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 00:05:29 -0800 (PST)
Date: Wed, 20 Jan 2021 08:05:26 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings from GPU!
Message-ID: <20210120080526.GL4903@dell>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local> <20210118150945.GE4903@dell>
 <YAXDgmWMR9s4OgxN@phenom.ffwll.local> <20210119082927.GJ4903@dell>
 <8DE96253-47A3-4A16-9331-62F547A2CC44@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8DE96253-47A3-4A16-9331-62F547A2CC44@vmware.com>
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
Cc: Jackie Li <yaodong.li@intel.com>, David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jesse Barnes <jesse.barnes@intel.com>, Tina Zhang <tina.zhang@intel.com>,
 Jan Safrata <jan.nikitenko@gmail.com>, Gareth Hughes <gareth@valinux.com>,
 Pei Zhang <pei.zhang@intel.com>, Rob Clark <rob.clark@linaro.org>,
 Min He <min.he@intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Niu Bing <bing.niu@intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, jim liu <jim.liu@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Keith Packard <keithp@keithp.com>, Eddie Dong <eddie.dong@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Faith <faith@valinux.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ping Gao <ping.a.gao@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhiyuan Lv <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOSBKYW4gMjAyMSwgWmFjayBSdXNpbiB3cm90ZToKCj4gCj4gCj4gPiBPbiBKYW4g
MTksIDIwMjEsIGF0IDAzOjI5LCBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90
ZToKPiA+IAo+ID4gT24gTW9uLCAxOCBKYW4gMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+
IAo+ID4+IE9uIE1vbiwgSmFuIDE4LCAyMDIxIGF0IDAzOjA5OjQ1UE0gKzAwMDAsIExlZSBKb25l
cyB3cm90ZToKPiA+Pj4gT24gTW9uLCAxOCBKYW4gMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToK
PiA+Pj4gCj4gPj4+PiBPbiBGcmksIEphbiAxNSwgMjAyMSBhdCAwNjoyNzoxNVBNICswMDAwLCBa
YWNrIFJ1c2luIHdyb3RlOgo+ID4+Pj4+IAo+ID4+Pj4+PiBPbiBKYW4gMTUsIDIwMjEsIGF0IDEz
OjE1LCBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+Pj4+Pj4gCj4g
Pj4+Pj4+IFRoaXMgc2V0IGlzIHBhcnQgb2YgYSBsYXJnZXIgZWZmb3J0IGF0dGVtcHRpbmcgdG8g
Y2xlYW4tdXAgVz0xCj4gPj4+Pj4+IGtlcm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkg
b3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4gPj4+Pj4+IG5pZ2dseSBsaXR0bGUgd2Fybmlu
Z3MuCj4gPj4+Pj4+IAo+ID4+Pj4+PiBMYXN0IHNldCEgIEFsbCBjbGVhbiBhZnRlciB0aGlzIGZv
cjsgQXJtLCBBcm02NCwgUFBDLCBNSVBTIGFuZCB4ODYuCj4gPj4+Pj4gCj4gPj4+Pj4gVGhhbmtz
ISBGb3IgYWxsIHRoZSB2bXdnZnggYml0czoKPiA+Pj4+PiBSZXZpZXdlZC1ieTogWmFjayBSdXNp
biA8emFja3JAdm13YXJlLmNvbT4KPiA+Pj4+IAo+ID4+Pj4gT2sgSSBtZXJnZWQgZXZlcnl0aGlu
ZyBleGNlcHQgdm13Z2Z4ICh0aGF0J3MgZm9yIFphY2spIGFuZCBpOTE1L25vdXZlYXUKPiA+Pj4+
ICh0aG9zZSBnZW5lcmFsbHkgZ28gdGhyb3VnaCBvdGhlciB0cmVlcywgcGxzIGhvbGxlciBpZiB0
aGV5J3JlIHN0dWNrKS4KPiA+Pj4gCj4gPj4+IFRoYW5rcyBEYW5pZWwsIHlvdSdyZSBhIHN1cGVy
c3RhciEKPiA+Pj4gCj4gPj4+IFNvIFphY2sgd2lsbCB0YWtlIHRoZSB2bXdnZnggcGFydHM/ICBE
ZXNwaXRlIHByb3ZpZGluZyBhIFItYj8KPiA+PiAKPiA+PiBJIG9ubHkgbWVyZ2Ugc3R1ZmYgdGhh
dCdzIGRlZmFjdG8gYWJhbmRvbmVkIGFscmVhZHkuIEV2ZXJ5dGhpbmcgZWxzZSBJIHRyeQo+ID4+
IHRvIG9mZmxvYWQgdG8gd2hvbWV2ZXIgYWN0dWFsbHkgY2FyZXMgOi0pCj4gPiAKPiA+IFVuZGVy
c3Rvb2QuICBUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4KPiA+IAo+ID4gSG9wZWZ1bGx5IFph
Y2sgYWN0dWFsbHkgY2FyZXMuIDpECj4gCj4gaGFoLCBJIGRvLiBJIGp1c3QgcHVzaGVkIGFsbCBv
ZiB0aGUgY2hhbmdlcyB0byBkcm0tbWlzYy1uZXh0LiBMZXQgbWUKPiBrbm93IGlmIEkgbWlzc2Vk
IGFueXRoaW5nLiBUaGFua3MhCgpQZXJmZWN0LiAgVGhhbmsgeW91IFphY2suCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNl
cwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93
IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
