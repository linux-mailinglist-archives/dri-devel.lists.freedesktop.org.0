Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77B5F1C69
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CA16EE0E;
	Wed,  6 Nov 2019 17:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE7B6EE0E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:24:20 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 193so18113476pfc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 09:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=12yzcHf1qZ16w0lmbe/z8YOyijtRMnml2sd6alF7R5E=;
 b=Igx1VhYYSfJ3+0NFZ1/ZQ4d5B6DDap5gBIVUDxdJWpH8CS+MdDFLyUFMuc2HnHy2u1
 8hVahwkKFqA8LAuq2fVfPQqpBIq80PW9YzeVPwI+1DZsgLmd8eGj2Y5J0KKJTec/qq+F
 lTQogajSdk50EP4QgQM5RpQUOdAERRqlI1wYPaSOIUXTsL+7g3madw2zzMGV229Uj4vB
 ub+jI4VvSQcUYNLA3X3fT5HNUnl7Cj2XyisVYvneS7RstffE9fJ+w/afArc63710TtzQ
 Uc4Cutb7Ttjxtxb+aKQaJrFifY8qPQE8QeUFpnYAkRH9OYCN+1Ws6UzNJ14mOqIlvLs+
 tyFw==
X-Gm-Message-State: APjAAAUOYQbwDPeSjb5WZHMF2y19nV40qoKH9fpyKXIAzqiUimS+4kxt
 9WAwNozLj8hdnJqxOOYhILv0djbi0Ms=
X-Google-Smtp-Source: APXvYqy7xuqTPQAOe29RalAbDCQZWFanMlY7Ggk5BBqItrUCBBl297x/gKwCqPK8O48UCRtYXi9sLw==
X-Received: by 2002:a63:9a09:: with SMTP id o9mr4197481pge.276.1573061060339; 
 Wed, 06 Nov 2019 09:24:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j7sm3606496pjz.12.2019.11.06.09.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 09:24:19 -0800 (PST)
Date: Wed, 6 Nov 2019 09:24:18 -0800
From: Kees Cook <keescook@chromium.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: Limit to INT_MAX in create_blob ioctl
Message-ID: <201911060920.71D7E76E@keescook>
References: <20191106164755.31478-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106164755.31478-1-daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=12yzcHf1qZ16w0lmbe/z8YOyijtRMnml2sd6alF7R5E=;
 b=Kjeez8xg9w1G0Sz1XNlqaJiqB+5U+nf27WRtq9ESx/wrXx9XWIlBYGf3N+a1s30Lqf
 PO9E2S/zhEHf1DsS35YdbMoLwH66sXNTBbln/nDtH4nNulV3cDyG24+euda4cLAG+myE
 aM2/vQI5JXoWUGhG8qnNOmPeigi3l2obzYdKQ=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 syzbot+fb77e97ebf0612ee6914@syzkaller.appspotmail.com,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDU6NDc6NTVQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGUgaGFyZGVuZWQgdXNlcmNweSBjb2RlIGlzIHRvbyBwYXJhbm9pZCBldmVyIHNp
bmNlOgo+IAo+IGNvbW1pdCA2YTMwYWZhOGMxZmJkZTVmMTBmOWM1ODRjMjk5MmFhM2M3ZjdhOGZl
Cj4gQXV0aG9yOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBEYXRlOiAgIFdl
ZCBOb3YgNiAxNjowNzowMSAyMDE5ICsxMTAwCj4gCj4gICAgIHVhY2Nlc3M6IGRpc2FsbG93ID4g
SU5UX01BWCBjb3B5IHNpemVzCj4gCj4gQ29kZSBpdHNlbGYgc2hvdWxkIGhhdmUgYmVlbiBmaW5l
IGFzLWlzLgoKSSBoYWQgdG8gZ28gcmVhZCB0aGUgc3l6Ym90IHJlcG9ydCB0byB1bmRlcnN0YW5k
IHdoYXQgd2FzIGFjdHVhbGx5IGJlaW5nCmZpeGVkIGhlcmUuIENhbiB5b3UgYmUgYSBiaXQgbW9y
ZSB2ZXJib3NlIGluIHRoaXMgY29tbWl0IGxvZz8gSXQgc291bmRzCmxpa2UgaHVnZSB1c2VyY29w
eSBzaXplcyB3ZXJlIGFsbG93ZWQgYnkgZHJtICh0aG91Z2ggSSBndWVzcyB0aGV5IHdvdWxkCmZh
aWwgZ3JhY2VmdWxseSBpbiBzb21lIG90aGVyIHdheT8pIGJ1dCBhZnRlciA2YTMwYWZhOGMxZmIs
IHRoZSBjb3B5CndvdWxkIHllbGwgYWJvdXQgc2l6ZXMgd2hlcmUgSU5UX01BWCA8IHNpemUgPCBV
TE9OR19NQVggLSBzaXplb2YoLi4uKSA/CgpXaGF0IHdhcyB0aGUgcHJpb3IgZmFpbHVyZSBtb2Rl
IHRoYXQgbWFkZSB0aGUgZXhpc3RpbmcgVUxPTkdfTUFYIGNoZWNrCnNhZmU/IFlvdXIgcGF0Y2gg
bG9va3MgZmluZSwgdGhvdWdoOgoKUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hy
b21pdW0ub3JnPgoKPiBSZXBvcnRlZC1ieTogc3l6Ym90K2ZiNzdlOTdlYmYwNjEyZWU2OTE0QHN5
emthbGxlci5hcHBzcG90bWFpbC5jb20KPiBGaXhlczogNmEzMGFmYThjMWZiICgidWFjY2Vzczog
ZGlzYWxsb3cgPiBJTlRfTUFYIGNvcHkgc2l6ZXMiKQo+IENjOiBLZWVzIENvb2sgPGtlZXNjb29r
QGNocm9taXVtLm9yZz4KPiBDYzogQWxleGFuZGVyIFZpcm8gPHZpcm9AemVuaXYubGludXgub3Jn
LnVrPgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENj
OiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4KPiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLQo+IEtlZXMvQW5k
cmV3LAo+IAo+IFNpbmNlIHRoaXMgaXMgLW1tIGNhbiBJIGhhdmUgYSBzdGFibGUgc2hhMSBvciBz
b21ldGhpbmcgZm9yCj4gcmVmZXJlbmNpbmc/IE9yIGRvIHlvdSB3YW50IHRvIGluY2x1ZGUgdGhp
cyBpbiB0aGUgLW1tIHBhdGNoIGJvbWIgZm9yCj4gdGhlIG1lcmdlIHdpbmRvdz8KClRyYWRpdGlv
bmFsbHkgdGhlc2UgdGhpbmdzIGxpdmUgaW4gYWtwbSdzIHRyZWUgd2hlbiB0aGV5IGFyZSBmaXhl
cyBmb3IKcGF0Y2hlcyBpbiB0aGVyZS4gSSBoYXZlIG5vIGlkZWEgaG93IHRoZSBGaXhlcyB0YWdz
IHdvcmsgaW4gdGhhdCBjYXNlLAp0aG91Z2guLi4KCi1LZWVzCgo+IC1EYW5pZWwKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0eS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9wcm9wZXJ0eS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0eS5jCj4g
aW5kZXggODkyY2U2MzZlZjcyLi42ZWUwNDgwM2MzNjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9wcm9wZXJ0eS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9wZXJ0
eS5jCj4gQEAgLTU2MSw3ICs1NjEsNyBAQCBkcm1fcHJvcGVydHlfY3JlYXRlX2Jsb2Ioc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgc2l6ZV90IGxlbmd0aCwKPiAgCXN0cnVjdCBkcm1fcHJvcGVydHlf
YmxvYiAqYmxvYjsKPiAgCWludCByZXQ7Cj4gIAo+IC0JaWYgKCFsZW5ndGggfHwgbGVuZ3RoID4g
VUxPTkdfTUFYIC0gc2l6ZW9mKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYikpCj4gKwlpZiAoIWxl
bmd0aCB8fCBsZW5ndGggPiBJTlRfTUFYIC0gc2l6ZW9mKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxv
YikpCj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4gIAo+ICAJYmxvYiA9IGt2emFsbG9j
KHNpemVvZihzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IpK2xlbmd0aCwgR0ZQX0tFUk5FTCk7Cj4g
LS0gCj4gMi4yNC4wLnJjMgo+IAoKLS0gCktlZXMgQ29vawpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
