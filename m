Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2F72C6F4D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 09:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3526EC1C;
	Sat, 28 Nov 2020 08:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95466EC1C
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 08:28:25 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t4so7884179wrr.12
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 00:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cTkHTcSrLgZszRAVwj45rxiuIrfPvRKqnrUG46P7sq0=;
 b=cKkBRCT9v3oLHM8wav0akpMQBP5NQv6bQKs+GZ/8ukgTgbOwh1PuqROZURCCkNwi3T
 SMdHme0S8PmFhAuBAjz7gWpNURcXbFOsyZXGUbYn2fj+yfX7HYHyirHocDl3LiMNeqPd
 UtYUN1gfGUh+Hi15h+UHpO44QyIPVkuyG82ZOMrmqTc94dnrldHSf0Q9PIP0kep3mPch
 thvjtJasTUNy2zutYM2Nu6EY40cQow+/BXRMbZr/T6FWXL2YMRRwaI2XO/xdrDDOQ+sI
 +Xt4OSwpB8LRJeNy2zANynlgqFw7ryU38BPxYOnqZiS2EgYTfCyhy2yFdKKcpORqZ82K
 NMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cTkHTcSrLgZszRAVwj45rxiuIrfPvRKqnrUG46P7sq0=;
 b=eiWeh88JiLhQmSQ6iannJhE6wVKkAb6PaITYktblZOvx1Dorn4VMIVZsfd1SFqKCU8
 hUxwsLEV5XyL8JVTDjzrkBFynnWH3CUOS76Wm5feh1Srzj7AuIACwNTwciTEO/w5NkVT
 YB2OF5IIeL+AoWqIKuV5su+m05ZDKoFN3lFcYYqR9XoEKGqNXDNW8aGog/msCpqKvaHZ
 IUJZMV06BZ2sEyGhlzNbq8mOPAcnC24rHR8xrlJSxoUldFTGvXN5z+FwVfYPxN5XSuam
 wGqL8lpbTSxmBo8WNnv5kRc8zKPjfzhwsUJnuhhtbUiV3SvAdw9ZSKUNssNafwb5KGyJ
 8jfg==
X-Gm-Message-State: AOAM531vQJ17aa0iGpM02EdwDsUCpt6sRQcDZa9g4AI9OGGnkQ0Vgiup
 LFhlJ1TSfsvgxh/QYdLFSG+L7A==
X-Google-Smtp-Source: ABdhPJzeYRmsxFZn2ZwidIPjzPMgaEV7J3TB5ydD8HIA0sG5PSBN25cXxEFEWF0I3IINU4+ZI56Q1Q==
X-Received: by 2002:adf:e449:: with SMTP id t9mr16202556wrm.257.1606552104332; 
 Sat, 28 Nov 2020 00:28:24 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id z19sm16842255wmk.12.2020.11.28.00.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 00:28:23 -0800 (PST)
Date: Sat, 28 Nov 2020 08:28:20 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 01/28] video: Fix W=1 warnings in of_videomode +
 of_display_timing
Message-ID: <20201128082820.GX2455276@dell>
References: <20201127195825.858960-1-sam@ravnborg.org>
 <20201127195825.858960-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127195825.858960-2-sam@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 dri-devel@lists.freedesktop.org, Peter Rosin <peda@axentia.se>,
 Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNyBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBGaXggdHJpdmlhbCBX
PTEgd2FybmluZ3MuCj4gVXBkYXRlIGtlcm5lbC1kb2MgdG8gYXZvaWQgdGhlIHdhcm5pbmdzLgoK
Q2FuIHlvdSBwdXQgd2hhdCdzIGJlaW5nIGZpeGVkIGluIHRoZSBzdWJqZWN0IGxpbmUgcGxlYXNl
PwoKImZpeCB3PTEgd2FybmluZ3MiIGlzIHZlcnkgYmxhbmQgYW5kIHRoaXMgaXQgaXMgdW5saWtl
bHkgdG8gYmUgdGhlCm9ubHkgdz0xIHdhcm5pbmcgdGhhdCBnZXRzIGZpeGVkIGluIHRoZXNlIGZp
bGVzLCBzbyBoYXMgYSBoaWdoIGxpa2VseQpob29kIG9mIGhhdmluZyBhbiBpZGVudGljYWwgc3Vi
amVjdC1saW5lIGFzIGEgcHJldmlvdXMvZnV0dXJlIHBhdGNoLgoKV2l0aCByZWdhcmRzIHRvIHRo
ZSBsYXR0ZXIgcG9pbnQ7IEkgaGF2ZSBwZXJzb25hbGx5IGZvdW5kIHN1YmplY3QKbGluZXMgdG8g
YmUgYSBwcmV0dHkgcmVsaWFibGUgd2F5IG9mIG1haW50YWluaW5nL2JhY2twb3J0aW5nIG9sZGVy
Cmtlcm5lbHMuICBUaGUgbm9tZW5jbGF0dXJlIGhlcmUgd291bGQgdGFpbnQgdGhhdCBwcmV0dHkg
cmVhZGlseS4KCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IGxpbnV4LWZiZGV2
QHZnZXIua2VybmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL29mX2Rpc3BsYXlfdGltaW5n
LmMgfCAxICsKPiAgZHJpdmVycy92aWRlby9vZl92aWRlb21vZGUuYyAgICAgIHwgOCArKysrLS0t
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9vZl9kaXNwbGF5X3RpbWluZy5jIGIvZHJpdmVy
cy92aWRlby9vZl9kaXNwbGF5X3RpbWluZy5jCj4gaW5kZXggYWJjOWFkYTc5OGVlLi5mOTNiNmFi
YmUyNTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9vZl9kaXNwbGF5X3RpbWluZy5jCj4g
KysrIGIvZHJpdmVycy92aWRlby9vZl9kaXNwbGF5X3RpbWluZy5jCj4gQEAgLTUyLDYgKzUyLDcg
QEAgc3RhdGljIGludCBwYXJzZV90aW1pbmdfcHJvcGVydHkoY29uc3Qgc3RydWN0IGRldmljZV9u
b2RlICpucCwgY29uc3QgY2hhciAqbmFtZSwKPiAgLyoqCj4gICAqIG9mX3BhcnNlX2Rpc3BsYXlf
dGltaW5nIC0gcGFyc2UgZGlzcGxheV90aW1pbmcgZW50cnkgZnJvbSBkZXZpY2Vfbm9kZQo+ICAg
KiBAbnA6IGRldmljZV9ub2RlIHdpdGggdGhlIHByb3BlcnRpZXMKPiArICogQGR0OiBkaXNwbGF5
X3RpbWluZyB0aGF0IGNvbnRhaW5zIHRoZSByZXN1bHQuIEkgbWF5IGJlIHBhcnRpYWxseSB3cml0
dGVuIGluIGNhc2Ugb2YgZXJyb3JzCj4gICAqKi8KPiAgc3RhdGljIGludCBvZl9wYXJzZV9kaXNw
bGF5X3RpbWluZyhjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ICAJCXN0cnVjdCBkaXNw
bGF5X3RpbWluZyAqZHQpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vb2ZfdmlkZW9tb2Rl
LmMgYi9kcml2ZXJzL3ZpZGVvL29mX3ZpZGVvbW9kZS5jCj4gaW5kZXggNjdhZmYyNDIxYzI5Li5h
NWJiMDJmMDJiNDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9vZl92aWRlb21vZGUuYwo+
ICsrKyBiL2RyaXZlcnMvdmlkZW8vb2ZfdmlkZW9tb2RlLmMKPiBAQCAtMTMsMTAgKzEzLDEwIEBA
Cj4gICNpbmNsdWRlIDx2aWRlby92aWRlb21vZGUuaD4KPiAgCj4gIC8qKgo+IC0gKiBvZl9nZXRf
dmlkZW9tb2RlIC0gZ2V0IHRoZSB2aWRlb21vZGUgIzxpbmRleD4gZnJvbSBkZXZpY2V0cmVlCj4g
LSAqIEBucCAtIGRldmljZW5vZGUgd2l0aCB0aGUgZGlzcGxheV90aW1pbmdzCj4gLSAqIEB2bSAt
IHNldCB0byByZXR1cm4gdmFsdWUKPiAtICogQGluZGV4IC0gaW5kZXggaW50byBsaXN0IG9mIGRp
c3BsYXlfdGltaW5ncwo+ICsgKiBvZl9nZXRfdmlkZW9tb2RlOiBnZXQgdGhlIHZpZGVvbW9kZSAj
PGluZGV4PiBmcm9tIGRldmljZXRyZWUKPiArICogQG5wOiBkZXZpY2Vub2RlIHdpdGggdGhlIGRp
c3BsYXlfdGltaW5ncwo+ICsgKiBAdm06IHNldCB0byByZXR1cm4gdmFsdWUKPiArICogQGluZGV4
OiBpbmRleCBpbnRvIGxpc3Qgb2YgZGlzcGxheV90aW1pbmdzCj4gICAqCSAgICAoU2V0IHRoaXMg
dG8gT0ZfVVNFX05BVElWRV9NT0RFIHRvIHVzZSB3aGF0ZXZlciBtb2RlIGlzCj4gICAqCSAgICAg
c3BlY2lmaWVkIGFzIG5hdGl2ZSBtb2RlIGluIHRoZSBEVC4pCj4gICAqCgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExp
bmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
