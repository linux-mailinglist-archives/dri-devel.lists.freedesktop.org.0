Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9737E5046B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 10:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053EB893EA;
	Mon, 24 Jun 2019 08:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279BE893D1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:21:40 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e3so20441855edr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 01:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=/8MzLnpwG6qDe7b6oGbo7xDCkvZaK7RUXS7Z7z1koW8=;
 b=Fcl+RrtXR6OAjPPW/jnJ59cYPfEqsd12443yrSWoaepYll4xMUayZueNCgbW4iy15O
 Rw0/70YkIMTsaR5/JgfmrcB7iQ1oTu51VN4HaBZejaprTHsbpH5NLIFtes9Ex+0T491Z
 eB+YbXe4YFgoETDNjyXco9/oL2HGOjODDMK4Jyxb2PBfG5uOUqbsWNWKb8AcW27N5E2f
 PDCj0gyxN4Lkgb6V0pcTpDRFkyb5xExe/Tzcn6EvquY/STWDUVSMIhk1bYBfuSIiCJhL
 QK3zEPmWKSi96IOVcTEC4M8By/GRJ8cBLJ04kADF+nY65oa/4UKumexmmMNKrSxFxQVR
 HRSw==
X-Gm-Message-State: APjAAAVE9RuMAd8WCMZwiZ+5zzwWdq6E8bDj0tH/aE4OE59lfbFTBuPL
 xSbyMgPNc8iMKQl4ycy1tKXSdw==
X-Google-Smtp-Source: APXvYqwVp8+VWgrPZO4Q8Tk2UOzoYnVEZQlTA+mxMv//t5DWDE4dUhgGqZyYAolpuEmzvqyFmswGbg==
X-Received: by 2002:a17:906:1292:: with SMTP id
 k18mr10907789ejb.146.1561364498694; 
 Mon, 24 Jun 2019 01:21:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b30sm89912edb.46.2019.06.24.01.21.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 01:21:37 -0700 (PDT)
Date: Mon, 24 Jun 2019 10:21:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 0/2] drm: drop uapi dependencies from include/drm
Message-ID: <20190624082135.GL12905@phenom.ffwll.local>
References: <20190622121156.17217-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190622121156.17217-1-sam@ravnborg.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/8MzLnpwG6qDe7b6oGbo7xDCkvZaK7RUXS7Z7z1koW8=;
 b=R3Hy9HIQkzf4XjTFRNww8Jxfo6CS7/ziRDVICJXjmam6OzYnyvhfNxAS4ruBHZG6eq
 2H89bqHxXV7nqyOaBqpuU1nb1CaVg+/oPRJcIgMGoGMy9PMwgLbSC4pwtCr2k+yBAQqP
 dDGZEIOOGUsbEDoDttVgttm5wso73PAYhCJqQ=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMjIsIDIwMTkgYXQgMDI6MTE6NTRQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IGluY2x1ZGUvZHJtLyogc2hhbGwgaGF2ZSBubyBvciBhdCBsZWFzdCBtaW5pbWFsIGRl
cGVuZGVuY2llcwo+IHRvIGluY2x1ZGUvdWFwaS9kcm0vKi4KPiBGb2xsb3dpbmcgdHdvIHBhdGNo
ZXMgZG8gYSBzbWFsbCBlZmZvcnQgdG8gZHJvcCBzdWNoIGRlcGVuZGVuY2llcy4KPiAKPiBBZnRl
ciB0aGVzZSBwYXRjaGVzIHRoZXJlIGFyZSB0d28gdXNlcnMKPiBvZiB1YXBpL2RybS9kcm0uaCBs
ZWZ0IGluIGluY2x1ZGUvZHJtOgo+IAo+IGRybV9maWxlLmg6Cj4gLSBuZWVkcyBkcm1fbWFnaWNf
dAo+ICAgZHJtX21hZ2ljX3QgaXMgYSBzaW1wbGUgdHlwZWRlZiwgYSBzaW1wbGUgdW5zaWduZWQg
aW50IHdvdWxkIGRvIHRoZSB0cmljawoKSSB0aGluayB3ZSBjb3VsZCBzd2l0Y2ggb3ZlciB0byB1
bnNpZ25lZCBpbnQgZm9yIHRoaXMuCgo+IGRybV9sZWdhY3kuaAo+IC0gbmVlZHMgZHJtX21hcF90
eXBlIGFuZCBkcm1fbWFwX2ZsYWdzLiBTZWVtcyBsZWdpdC4KCmVudW0gaW4gdWFwaSwgc3dlZXQg
KG5ldmVyIGRvIHRoaXMsIGl0J3Mgbm90IHBvcnRhYmxlIGFjcm9zcyBjb21waWxlcnMsCiNkZWZp
bmVzIGFsbCB0aGUgd2F5KS4gQnV0IHllYWggc2VlbXMgbGVnaXQsIHBsdXMgd2UgZG9uJ3QgY2Fy
ZSBhYm91dApkcm1fbGVnYWN5LmgKCj4gCj4gSSBkaWQgbm90IHNwZW5kIHRpbWUgdG8gYW5hbHl6
ZSBmdXJ0aGVyIGRlcGVuZGVuY2llcy4KPiAKPiBQYXRjaGVzIGFyZSBidWlsZCB0ZXN0ZWQuCj4g
Cj4gCVNhbQo+IAo+IFNhbSBSYXZuYm9yZyAoMik6Cj4gICAgICAgZHJtOiBkcm9wIHVhcGkgZGVw
ZW5kZW5jeSBmcm9tIGRybV9wcmludC5oCj4gICAgICAgZHJtOiBkcm9wIHVhcGkgZGVwZW5kZW5j
eSBmcm9tIGRybV92YmxhbmsuaAoKT24gYm90aCBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gCj4gIGluY2x1ZGUvZHJtL2RybV9wcmludC5oICB8
IDQgKy0tLQo+ICBpbmNsdWRlL2RybS9kcm1fdmJsYW5rLmggfCAxIC0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiAKCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
