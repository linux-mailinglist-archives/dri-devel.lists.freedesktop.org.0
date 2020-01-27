Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2845214AC0F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 23:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8786EC07;
	Mon, 27 Jan 2020 22:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661436EC07;
 Mon, 27 Jan 2020 22:32:42 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c9so13664268wrw.8;
 Mon, 27 Jan 2020 14:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7xmxId/hN3e5rAuBqP305UFcoidt2bDdfMSY6RecTCA=;
 b=Eve4qj86POX93iPMYl/6eWM5mmWMAy2j5K9H1jCIse8WmssYQ45NUGfRxxI7a0pJTt
 X+7RkfjnRVx1qYjWLPG1THkdhUXwnF4CJ0vJOEFyOnw+/lkaetGWOKKT1JME2c9LXdfr
 PddwcZLcYOYgtKGw6RichZ0ydX8uPMVhSvEjeYHaZEh17rZANj9DmyInu/0G29AyLsD9
 O2jrKGJWW48Wy9UDvWNEqEOVzVON2vloGU/oHz4/JO5ZmmwyGhyHN+tq7BjgzcSPWCtQ
 jBPRdIdHgcScDGEaKZlLP/nEqT2yEL5niiBar/9GXdBuCdujjPgsLAIBkWhbv1dKlktW
 MOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7xmxId/hN3e5rAuBqP305UFcoidt2bDdfMSY6RecTCA=;
 b=qGnpejjFU17E/RrSOu0ARfjvl/Ou3hTRkjlqLx9oHZnUM84+Q4x5NmUWcsjB/z82dY
 wNY5PxMbrVJxPODufXTp7CwqjHY5BwNzQ7gfIih69uEpgh2RJFP+Dn7Bicp+j61jOyC+
 y8x0UI+lcU6Dnpc2EgeFJbOTt2HPTFlWhKtZ9lEAc0dhaEZ3LxDiwRqO7jv4dLoGZ7K0
 VUyq+gr5s4KOMQWCatYqFG3+qeIOJser3GgAJEptF5xozXrkSSVcI5jt+bNG5ItQbbWs
 lujDkZua+DMOVJfY0rkYxi2BgM6G+mlEKQvWCvQrEa2Ig3VsXwSVPbcM2SYi0zzpFqy/
 m9GA==
X-Gm-Message-State: APjAAAUbdrIsRvaZ+vTAZ7ByfjeMwQEDwN9Q7GZcScoBldsvVhERzimL
 mAd6JvdAd3+xxIPWE71zGji9rRLSkUFuZXcvCP54nA==
X-Google-Smtp-Source: APXvYqww645REmcL+/bms0gsua2HY9gHqucxqvqnkGbYKHELwWtPVFANIB9kNzTPUS3WExZVBOVIarg8sxStuUMUGAg=
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr25526653wrn.124.1580164361144; 
 Mon, 27 Jan 2020 14:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20200124200231.10517-6-ville.syrjala@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jan 2020 17:32:29 -0500
Message-ID: <CADnq5_POWv6Pw2diOveEXsJTgCvDnJj4O8b-iVzPkW4LgEfXEg@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/edid: Add a FIXME about DispID CEA data block
 revision
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Andres Rodriguez <andresx7@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMjQsIDIwMjAgYXQgMzowMiBQTSBWaWxsZSBTeXJqYWxhCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Cj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQg
dGhlIERpc3BJRCBDRUEgZGF0YSBibG9jayByZXZpc2lvbgo+IG1lYW5zLiBUaGUgc3BlYyBkb2Vz
bid0IHNheS4gSSBndWVzcyBzb21lIERpc3BJRCBtdXN0IGhhdmUKPiBhIHZhbHVlIG9mID49IDMg
aW4gdGhlcmUgb3IgZWxzZSB3ZSBnZW5lcmFsbHkgd291bGRuJ3QKPiBldmVuIHBhcnNlIHRoZSBD
RUEgZGF0YSBibG9ja3MuIE9yIGRvZXMgYWxsIHRoaXMgY29kZQo+IGFjdHVhbGx5IG5vdCBkbyBh
bnl0aGluZz8KPgo+IENjOiBBbmRyZXMgUm9kcmlndWV6IDxhbmRyZXN4N0BnbWFpbC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCA3ICsrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBpbmRleCAw
MzY5YTU0ZTNkMzIuLmZkOWI3MjQwNjdhNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gQEAgLTM5Nzcs
NiArMzk3NywxMyBAQCBjZWFfZGJfdGFnKGNvbnN0IHU4ICpkYikKPiAgc3RhdGljIGludAo+ICBj
ZWFfcmV2aXNpb24oY29uc3QgdTggKmNlYSkKPiAgewo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IEZJWE1FIGlzIHRoaXMgY29ycmVjdCBmb3IgdGhlIERpc3BJRCB2YXJpYW50Pwo+ICsgICAgICAg
ICogVGhlIERpc3BJRCBzcGVjIGRvZXNuJ3QgcmVhbGx5IHNwZWNpZnkgd2hldGhlcgo+ICsgICAg
ICAgICogdGhpcyBpcyB0aGUgcmV2aXNpb24gb2YgdGhlIENFQSBleHRlbnNpb24gb3IKPiArICAg
ICAgICAqIHRoZSBEaXNwSUQgQ0VBIGRhdGEgYmxvY2suIEFuZCB0aGUgb25seSB2YWx1ZQo+ICsg
ICAgICAgICogZ2l2ZW4gYXMgYW4gZXhhbXBsZSBpcyAwLgo+ICsgICAgICAgICovCgpTYW1lIGNv
bW1lbnQgYXMgdGhlIHByZXZpb3VzIHBhdGNoIHJlZ2FyZGluZyB0aGUgY29tbWVudCBmb3JtYXR0
aW5nLgoKQWxleAoKPiAgICAgICAgIHJldHVybiBjZWFbMV07Cj4gIH0KPgo+IC0tCj4gMi4yNC4x
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
