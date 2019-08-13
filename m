Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF08B971
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642456E125;
	Tue, 13 Aug 2019 13:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA106E125
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:04:21 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z51so19406824edz.13
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 06:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=BeprlSRyo9i3tCmSN6bMyBMTJqsuh2Pl578/LN6Zv7E=;
 b=d2+NlS647FotmketvOGWRTBy1WCgO2rgH33CP9bY9WFoX+4zkIzjnRfXC7bbm0oTbt
 XcoHqKd+NPEnW+b3MQDQa9xcbQ+PsajZTY+ApBTz5Ay6027V9olQNruYB9vm49mYo2zv
 CPMn1jnjSCWsC6xEUNkmDSMCvoVPUUnerjRJe+K8Calj729vBRTiA0znl35ZMOsAwqz1
 OBMh/rKwOknMJFwF3wwPkiARMScGndt+HogPhxiRC7FQSD0xsw+gFBz69fPmtGNHF21d
 bojH0/mRH0hF+ghUnkpJ7+MGmaP4f8CISosn0O9FLWiVlPiuiMUjFGzMXi7wtCbhZl96
 6jKg==
X-Gm-Message-State: APjAAAUZFwDHZc+unj+QWajl3nLnklsKu6DM3y42J0f9YIWX1+XPVxG5
 9MrfbQuDeC8meUzcVQ4p0YIWvg==
X-Google-Smtp-Source: APXvYqz7LBTCYHg7cQQTjZ5VNnLXvpeFWAxTBiBBcrQc0PK/POH7ZTNqynUrD+HS6e+r4Jpu65duGA==
X-Received: by 2002:a50:ee89:: with SMTP id f9mr10253355edr.65.1565701459898; 
 Tue, 13 Aug 2019 06:04:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j57sm1327262eda.61.2019.08.13.06.04.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 06:04:19 -0700 (PDT)
Date: Tue, 13 Aug 2019 15:04:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 04/26] drm/print: Add drm_err_printer()
Message-ID: <20190813130417.GU7444@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, Juston Li <juston.li@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <hwentlan@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org
References: <20190718014329.8107-1-lyude@redhat.com>
 <20190718014329.8107-5-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718014329.8107-5-lyude@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=BeprlSRyo9i3tCmSN6bMyBMTJqsuh2Pl578/LN6Zv7E=;
 b=CXvxBtP6BpeLUfjSTmWgYakTCBmeUGPojZavzZeBG44qwwncTnPDEeP8UL+7vlsgdr
 KXuvguKssX2tx10gYosyLPDX5D8JnzR+/TaV5WQ8aZd9DtcdU3FYCe/mMLu0aBPlvIXF
 sWnheBW/f0mZSYjdxIPI8uT9DLSrNHMKy/ZgM=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDk6NDI6MjdQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBBIHNpbXBsZSBjb252aWVuZW5jZSBmdW5jdGlvbiB0aGF0IHJldHVybnMgYSBkcm1fcHJp
bnRlciB3aGljaCBwcmludHMKPiB1c2luZyBwcl9lcnIoKQo+IAo+IENjOiBKdXN0b24gTGkgPGp1
c3Rvbi5saUBpbnRlbC5jb20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4K
PiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBD
YzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTHl1
ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9w
cmludC5jIHwgIDYgKysrKysrCj4gIGluY2x1ZGUvZHJtL2RybV9wcmludC5oICAgICB8IDE3ICsr
KysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3ByaW50LmMKPiBpbmRleCBhMTdjOGExNGRiYTQuLjYxMTJiZTM1ODc2OSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3ByaW50LmMKPiBAQCAtMTQ3LDYgKzE0NywxMiBAQCB2b2lkIF9fZHJtX3ByaW50Zm5f
ZGVidWcoc3RydWN0IGRybV9wcmludGVyICpwLCBzdHJ1Y3QgdmFfZm9ybWF0ICp2YWYpCj4gIH0K
PiAgRVhQT1JUX1NZTUJPTChfX2RybV9wcmludGZuX2RlYnVnKTsKPiAgCj4gK3ZvaWQgX19kcm1f
cHJpbnRmbl9lcnIoc3RydWN0IGRybV9wcmludGVyICpwLCBzdHJ1Y3QgdmFfZm9ybWF0ICp2YWYp
Cj4gK3sKPiArCXByX2VycigiJXMgJXBWIiwgcC0+cHJlZml4LCB2YWYpOwoKRFJNIHByaW50aW5n
IGlzIGEgaHVnZSBiaWtlc2hhZCAob3IgdGlyZSBmaXJlPykuIFdlIGNhbid0IGNhbGwgRFJNX0VS
Uk9SLApidXQgZm9yIGNvbnNpc3RlbmN5IG1hYnllIGVtdWxhdGUgdGhlIGxheW91dD8KCkVpdGhl
ciB3YXk6IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
PgoKCj4gK30KPiArRVhQT1JUX1NZTUJPTChfX2RybV9wcmludGZuX2Vycik7Cj4gKwo+ICAvKioK
PiAgICogZHJtX3B1dHMgLSBwcmludCBhIGNvbnN0IHN0cmluZyB0byBhICZkcm1fcHJpbnRlciBz
dHJlYW0KPiAgICogQHA6IHRoZSAmZHJtIHByaW50ZXIKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX3ByaW50LmggYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+IGluZGV4IGE1ZDZmMmYz
ZTQzMC4uMTEyMTY1ZDMxOTVkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5o
Cj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKPiBAQCAtODMsNiArODMsNyBAQCB2b2lk
IF9fZHJtX3ByaW50Zm5fc2VxX2ZpbGUoc3RydWN0IGRybV9wcmludGVyICpwLCBzdHJ1Y3QgdmFf
Zm9ybWF0ICp2YWYpOwo+ICB2b2lkIF9fZHJtX3B1dHNfc2VxX2ZpbGUoc3RydWN0IGRybV9wcmlu
dGVyICpwLCBjb25zdCBjaGFyICpzdHIpOwo+ICB2b2lkIF9fZHJtX3ByaW50Zm5faW5mbyhzdHJ1
Y3QgZHJtX3ByaW50ZXIgKnAsIHN0cnVjdCB2YV9mb3JtYXQgKnZhZik7Cj4gIHZvaWQgX19kcm1f
cHJpbnRmbl9kZWJ1ZyhzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIHN0cnVjdCB2YV9mb3JtYXQgKnZh
Zik7Cj4gK3ZvaWQgX19kcm1fcHJpbnRmbl9lcnIoc3RydWN0IGRybV9wcmludGVyICpwLCBzdHJ1
Y3QgdmFfZm9ybWF0ICp2YWYpOwo+ICAKPiAgX19wcmludGYoMiwgMykKPiAgdm9pZCBkcm1fcHJp
bnRmKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgY29uc3QgY2hhciAqZiwgLi4uKTsKPiBAQCAtMjI3
LDYgKzIyOCwyMiBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fcHJpbnRlciBkcm1fZGVidWdf
cHJpbnRlcihjb25zdCBjaGFyICpwcmVmaXgpCj4gIAlyZXR1cm4gcDsKPiAgfQo+ICAKPiArLyoq
Cj4gKyAqIGRybV9lcnJfcHJpbnRlciAtIGNvbnN0cnVjdCBhICZkcm1fcHJpbnRlciB0aGF0IG91
dHB1dHMgdG8gcHJfZXJyKCkKPiArICogQHByZWZpeDogZGVidWcgb3V0cHV0IHByZWZpeAo+ICsg
Kgo+ICsgKiBSRVRVUk5TOgo+ICsgKiBUaGUgJmRybV9wcmludGVyIG9iamVjdAo+ICsgKi8KPiAr
c3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX3ByaW50ZXIgZHJtX2Vycl9wcmludGVyKGNvbnN0IGNo
YXIgKnByZWZpeCkKPiArewo+ICsJc3RydWN0IGRybV9wcmludGVyIHAgPSB7Cj4gKwkJLnByaW50
Zm4gPSBfX2RybV9wcmludGZuX2VyciwKPiArCQkucHJlZml4ID0gcHJlZml4Cj4gKwl9Owo+ICsJ
cmV0dXJuIHA7Cj4gK30KPiArCj4gIC8qCj4gICAqIFRoZSBmb2xsb3dpbmcgY2F0ZWdvcmllcyBh
cmUgZGVmaW5lZDoKPiAgICoKPiAtLSAKPiAyLjIxLjAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
