Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE06656EB1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 18:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3349B6E49E;
	Wed, 26 Jun 2019 16:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7446E49E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 16:27:58 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r12so4167356edo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 09:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=bsUqs0n2JVX/ZHVQlVV/zYXIO+Z2K2kc9Ql7fOjOo7Y=;
 b=M39f4x2dUWxABuMd5M1/IGKX0YNqeBi5YgHuKDVcQEcXD6+LL3o8Aie95Dm3xs9Pf5
 wbTZTw6w+vR5P366Pt57wipUheXHN8Hgy0n/JRzt2K125VVWXCONpKhohQgR5tQibcGv
 DGRtPZehDX7QnmJkbujc3hQYQ1/ZJx8/a2nQC3lWOKnu7c57gMCY3+LTc+PZaiwDxqO0
 UtKvWMztU31HtLeE6xL605aAW3guy8Bv9Sgazza9abENem2ia/Hq0AKuHF+aJSfLeuFP
 I54PaQN1qq1XxNy68dpG60UuDp3n0OGrN3CPds4n4SLceedgfIyFzO5i3pp9EViU0Att
 vQEA==
X-Gm-Message-State: APjAAAWA7uB8pac+w9iBNfCONp1WCzAmb254J221luQ2/1wqp6ou92X2
 8X4zvP10WWdMjQFN7IqvLeL9gw==
X-Google-Smtp-Source: APXvYqwBNfKf7SIdROKkPaUQx5tJA3Bjy6L4WN2tFsurahT7SnAhhQBCE8+s9kljhzSwiaPh2GC1QA==
X-Received: by 2002:a17:906:474a:: with SMTP id
 j10mr5068067ejs.104.1561566476982; 
 Wed, 26 Jun 2019 09:27:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id k11sm5612880edq.54.2019.06.26.09.27.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 09:27:56 -0700 (PDT)
Date: Wed, 26 Jun 2019 18:27:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] drm/vram: store dumb bo dimensions.
Message-ID: <20190626162754.GV12905@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 tzimmermann@suse.de, Sean Paul <sean@poorly.run>
References: <20190626065551.12956-1-kraxel@redhat.com>
 <20190626065551.12956-2-kraxel@redhat.com>
 <20190626144013.GB12510@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626144013.GB12510@ravnborg.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=bsUqs0n2JVX/ZHVQlVV/zYXIO+Z2K2kc9Ql7fOjOo7Y=;
 b=epc0pi3nmEwkTCiUljCqQQ7IQU6202q82Q75Ml2Iw+wDg98cP6TYWDl71HZ3y6wbsi
 NBUo/5QinUkrqDuMPM/XJ2KV2y1rCbfUyNUhIFBEoie2Qo4N7TarQZb+nLu8+zKqW5Db
 BREOCZt0tbzc7sR0r7yQxsjMK3y4thSosLLus=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 tzimmermann@suse.de, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDQ6NDA6MTNQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIEdlcmQuCj4gCj4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDg6NTU6NTBBTSAr
MDIwMCwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPiA+IFN0b3JlIHdpZHRoIGFuZCBoZWlnaHQgb2Yg
dGhlIGJvLiAgTmVlZGVkIGluIGNhc2UgdXNlcnNwYWNlCj4gPiBzZXRzIHVwIGEgZnJhbWVidWZm
ZXIgd2l0aCBmYi0+d2lkdGggIT0gYm8tPndpZHRoLi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
R2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2Ry
bS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgIHwgMSArCj4gPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW1fdnJhbV9oZWxwZXIuYyB8IDIgKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hl
bHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oCj4gPiBpbmRleCAxYTBl
YTE4ZTdhNzQuLjM2OTJkYmExNjdkZiAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9n
ZW1fdnJhbV9oZWxwZXIuaAo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBl
ci5oCj4gPiBAQCAtMzksNiArMzksNyBAQCBzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCB7Cj4g
PiAgCXN0cnVjdCBkcm1fZ2VtX29iamVjdCBnZW07Cj4gPiAgCXN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCBibzsKPiA+ICAJc3RydWN0IHR0bV9ib19rbWFwX29iaiBrbWFwOwo+ID4gKwl1bnNpZ25l
ZCBpbnQgd2lkdGgsIGhlaWdodDsKPiA+ICAKPiA+ICAJLyogU3VwcG9ydGVkIHBsYWNlbWVudHMg
YXJlICVUVE1fUExfVlJBTSBhbmQgJVRUTV9QTF9TWVNURU0gKi8KPiA+ICAJc3RydWN0IHR0bV9w
bGFjZW1lbnQgcGxhY2VtZW50Owo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5j
Cj4gPiBpbmRleCA0ZGU3ODJjYTI2YjIuLmMwMmJmNzY5NDExNyAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKPiA+IEBAIC0zNzcsNiArMzc3LDggQEAgaW50IGRy
bV9nZW1fdnJhbV9maWxsX2NyZWF0ZV9kdW1iKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiA+ICAJ
Z2JvID0gZHJtX2dlbV92cmFtX2NyZWF0ZShkZXYsIGJkZXYsIHNpemUsIHBnX2FsaWduLCBpbnRl
cnJ1cHRpYmxlKTsKPiA+ICAJaWYgKElTX0VSUihnYm8pKQo+ID4gIAkJcmV0dXJuIFBUUl9FUlIo
Z2JvKTsKPiA+ICsJZ2JvLT53aWR0aCA9IGFyZ3MtPndpZHRoOwo+ID4gKwlnYm8tPmhlaWdodCA9
IGFyZ3MtPmhlaWdodDsKPiA+ICAKPiA+ICAJcmV0ID0gZHJtX2dlbV9oYW5kbGVfY3JlYXRlKGZp
bGUsICZnYm8tPmdlbSwgJmhhbmRsZSk7Cj4gPiAgCWlmIChyZXQpCj4gCj4gQmUgd2FybmVkLCBJ
IG1heSBoYXZlIG1pc3NlZCBzb21ldGhpbmcgaW4gdGhlIGJpZ2dlciBwaWN0dXJlLgo+IAo+IFlv
dXIgcGF0Y2ggd2lsbCBzZXQgd2lkdGggYW5kIGhlaWdodCBvbmx5IGZvciBkdW1iIGJvJ3MKPiBC
dXQgd2UgaGF2ZSBzZXZlcmFsIHVzZXJzIG9mIGRybV9nZW1fdnJhbV9jcmVhdGUoKSB0aGF0IHdp
bGwKPiBub3Qgc2V0IHRoZSB3aWR0aCBhbmQgaGVpZ2h0Lgo+IAo+IFNvIG9ubHkgaW4gc29tZSBj
YXNlcyBjYW4gd2UgcmVseSBvbiB0aGVtIGJlaW5nIHNldC4KPiBTaG91bGQgdGhpcyBiZSByZWZh
Y3RvcmVkIHNvIHdlIGFsd2F5cyBzZXQgd2lkdGgsIGhlaWdodC4KPiBPciBtYXliZSBzYXkgaW4g
YSBzbWFsbCBjb21tZW50IHRoYXQgd2lkdGgsaGVpZ2h0IGFyZSBvbmx5Cj4gc2V0IGZvciBkdW1i
IGJvJ3M/CgpBbHNvIGZvciBkdW1iIGJvIGFsbG9jYXRlZCBidWZmZXJzIGlmIHVzZXJzcGFjZSBn
ZXRzIHRoZSBkaW1lbnNpb25zIHdyb25nCmJldHdlZW4gZHVtYl9jcmVhdGUgYW5kIHRoZSBhZGRm
Yiwgc29tZXRoaW5nIGlzIHdyb25nLiBQYXBlcmluZyBvdmVyIHRoYXQKYnkgcmVtZW1iZXJpbmcg
dGhlIHJpZ2h0IGRpbWVuc2lvbnMgZG9lc24ndCBsb29rIGxpa2UgYSBnb29kIHNvbHV0aW9uLgot
RGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
