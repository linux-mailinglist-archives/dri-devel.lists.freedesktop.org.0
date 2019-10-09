Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBA8D11D8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 16:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40B36E9CF;
	Wed,  9 Oct 2019 14:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691E86E9CF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 14:57:53 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r9so2299517edl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 07:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=1j8DG26scIDXczGfE3Cp9ntkWAhO4UPg895umAMSVcw=;
 b=XY8RSg8fRELt+HCipOeeAE3WhUigXsPluIBAWAb3Llu697EOZN+9GmtDir38kMlOJS
 3sxuNQroI1mDLVI/GKpjwGX9DR0exfOPbLmS8CTGMn4dm/O+Et0xeVQ436D0OoXMFVc7
 l+lgRCYL6RmCO357phpDHA24lFRbzQ964dWq1xeUqHi0TSYeSubsviDsnZsizjv+mUnR
 AtLRIFw5GY+r9p2SxLFUeSX8RUbYyVs3lP/V5tKiXzWyYo88jopyPA/rsG5jicZrPelM
 5bhwtInOQg4RCAWaMxOteT5RnP82BcmpEOZo8poJRqHyCPxv9hB/8fsdQhkhnNpuwXLa
 HzTw==
X-Gm-Message-State: APjAAAVZA5DzpBZXcNp9CKOHUQHkdlHSgWBF3SVX3Ac4Lfo/Msp0fDlb
 5K8R4tHTyh1l0juLNcLzn0kSuw==
X-Google-Smtp-Source: APXvYqwz/C8A4F/jwkywWnk+LXw7tcSuKuzB0UEllbqaz+xX8g6qBnrUckM2XbkqlebRBbXbY9EhRw==
X-Received: by 2002:a17:906:c4f:: with SMTP id
 t15mr3195056ejf.293.1570633071906; 
 Wed, 09 Oct 2019 07:57:51 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id s22sm304593eja.91.2019.10.09.07.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 07:57:50 -0700 (PDT)
Date: Wed, 9 Oct 2019 16:57:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qiang Yu <yuq825@gmail.com>
Subject: Re: [PATCH 1/6] drm/gem: refine drm_gem_objects_lookup
Message-ID: <20191009145748.GC16989@phenom.ffwll.local>
References: <20190926141046.30758-1-yuq825@gmail.com>
 <20190926141046.30758-3-yuq825@gmail.com>
 <CAL_JsqJOP90jmeDDCsf3tNs6Q13U4GSUsToHsggT3js3=+R94w@mail.gmail.com>
 <CAKGbVbs7ZN=gTkRhY0YqMfUd1=_Rux3WjsDcxbKA9SUaH5F-iw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKGbVbs7ZN=gTkRhY0YqMfUd1=_Rux3WjsDcxbKA9SUaH5F-iw@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=1j8DG26scIDXczGfE3Cp9ntkWAhO4UPg895umAMSVcw=;
 b=HfRWyh8EQqhx60Kus45xXXMDY4dPzknJzc2D6eYOsuG6Zr2VSMQJ6bK4yYHmnnPXFJ
 eBBctd/koVWZdg2skm6KJsfrZICUsPh6ijcAolxAF9VXxrrziBN2GGQvRPDsGh9vrN2A
 G2hE/o7Y3Z1Cbk92NRIlEB5BUJwnXghuUHaPE=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, lima@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDg6MDk6NTJBTSArMDgwMCwgUWlhbmcgWXUgd3JvdGU6
Cj4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTE6MDEgUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgOToxMiBBTSBR
aWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IERvIG5vdCB1c2Ug
dXNlciBzcGFjZSBibyBoYW5kbGVzIGRpcmVjdGx5IGFuZCBsZWZ0IHRoZSB1c2VyCj4gPiA+IHRv
IGtlcm5lbCBjb3B5IHdvcmsgdG8gZHJpdmVycyBjYWxsaW5nIHRoaXMgZnVuY3Rpb24uCj4gPiA+
Cj4gPiA+IFRoaXMgaXMgZm9yIGRyaXZlciBsaWtlIGxpbWEgd2hpY2ggZG9lcyBub3QgcGFzcyBn
ZW0gYm8KPiA+ID4gaGFuZGxlcyBjb250aW5vdXNseSBpbiBhbiBhcnJheSBpbiBpb2N0bCBhcmd1
bWVudC4KPiA+ID4KPiA+ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiA+
IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+ID4gPiBDYzog
U3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiA+ID4gQ2M6IEFseXNzYSBSb3Nl
bnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICAgfCAyOCArKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCAy
MyArKysrKysrKysrKysrKysrKy0tLQo+ID4KPiA+IFBsZWFzZSBrZWVwIHRoZSBjdXJyZW50IHZh
cmlhbnQuIFdoaWxlIG9ubHkgcGFuZnJvc3QgaXMgY29udmVydGVkIEFUTSwKPiA+IHZjNCBhbmQg
djNkIHdpbGwgdXNlIHRoaXMgdG9vLgo+ID4KPiA+ID4gIGluY2x1ZGUvZHJtL2RybV9nZW0uaCAg
ICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDI5IGluc2Vy
dGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKPiA+ID4gaW5k
ZXggNjg1NGY1ODY3ZDUxLi45ZjczZTVmM2I1M2YgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+
ID4gPiBAQCAtNjc5LDExICs2NzksMTEgQEAgc3RhdGljIGludCBvYmplY3RzX2xvb2t1cChzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbHAsIHUzMiAqaGFuZGxlLCBpbnQgY291bnQsCj4gPiA+ICAvKioKPiA+
ID4gICAqIGRybV9nZW1fb2JqZWN0c19sb29rdXAgLSBsb29rIHVwIEdFTSBvYmplY3RzIGZyb20g
YW4gYXJyYXkgb2YgaGFuZGxlcwo+ID4gPiAgICogQGZpbHA6IERSTSBmaWxlIHByaXZhdGUgZGF0
ZQo+ID4gPiAtICogQGJvX2hhbmRsZXM6IHVzZXIgcG9pbnRlciB0byBhcnJheSBvZiB1c2Vyc3Bh
Y2UgaGFuZGxlCj4gPiA+ICsgKiBAYm9faGFuZGxlczogYXJyYXkgb2YgR0VNIG9iamVjdCBoYW5k
bGVzCj4gPiA+ICAgKiBAY291bnQ6IHNpemUgb2YgaGFuZGxlIGFycmF5Cj4gPiA+ICAgKiBAb2Jq
c19vdXQ6IHJldHVybmVkIHBvaW50ZXIgdG8gYXJyYXkgb2YgZHJtX2dlbV9vYmplY3QgcG9pbnRl
cnMKPiA+ID4gICAqCj4gPiA+IC0gKiBUYWtlcyBhbiBhcnJheSBvZiB1c2Vyc3BhY2UgaGFuZGxl
cyBhbmQgcmV0dXJucyBhIG5ld2x5IGFsbG9jYXRlZCBhcnJheSBvZgo+ID4gPiArICogVGFrZXMg
YW4gYXJyYXkgb2YgR0VNIG9iamVjdCBoYW5kbGVzIGFuZCByZXR1cm5zIGEgbmV3bHkgYWxsb2Nh
dGVkIGFycmF5IG9mCj4gPiA+ICAgKiBHRU0gb2JqZWN0cy4KPiA+ID4gICAqCj4gPiA+ICAgKiBG
b3IgYSBzaW5nbGUgaGFuZGxlIGxvb2t1cCwgdXNlIGRybV9nZW1fb2JqZWN0X2xvb2t1cCgpLgo+
ID4gPiBAQCAtNjk1LDExICs2OTUsMTAgQEAgc3RhdGljIGludCBvYmplY3RzX2xvb2t1cChzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbHAsIHUzMiAqaGFuZGxlLCBpbnQgY291bnQsCj4gPiA+ICAgKiBmYWls
dXJlLiAwIGlzIHJldHVybmVkIG9uIHN1Y2Nlc3MuCj4gPiA+ICAgKgo+ID4gPiAgICovCj4gPiA+
IC1pbnQgZHJtX2dlbV9vYmplY3RzX2xvb2t1cChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHAsIHZvaWQg
X191c2VyICpib19oYW5kbGVzLAo+ID4gPiAraW50IGRybV9nZW1fb2JqZWN0c19sb29rdXAoc3Ry
dWN0IGRybV9maWxlICpmaWxwLCB1MzIgKmJvX2hhbmRsZXMsCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGludCBjb3VudCwgc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqKm9ianNfb3V0
KQo+ID4KPiA+IEVpdGhlciBzcGxpdCBpbnRvIGRybV9nZW1fb2JqZWN0c19sb29rdXAoKSBhbmQg
YQo+ID4gZHJtX2dlbV9vYmplY3RzX2xvb2t1cF91c2VyKCkgd2l0aCB0aGUgbGF0dGVyIGNhbGxp
bmcgdGhlIGZvcm1lciBvcgo+ID4ganVzdCBtYWtlIHRoZSBoZWxwZXIgdGFrZSBib3RoIGEgdXNl
ciBhbmQgdTMyKiBwdHIgd2l0aCB0aGUKPiA+IGV4cGVjdGF0aW9uIHRoYXQgb25seSBvbmUgb2Yg
dGhlbSBpcyBub24tTlVMTC4KPiA+Cj4gT0ssIEkgcHJlZmVyIHRoZSBmaXJzdCB3YXksIHdpbGwg
c2VuZCB2MiBmb3IgaXQuCgpOb3RlIHRoYXQgaG9wZWZ1bGx5IHNvb24gKENocmlzdGlhbiBLw7Zu
aWcgaXMgd29ya2luZyBvbiBpdCkgd2UnbGwgaGF2ZQp3d19tdXRleCBsb2NraW5nIGhlbHBlcnMs
IHdoaWNoIHdpbGwgaW50cm9kdWNlIGEgZHJtX2dlbV9vcGVyYXRpb25fY3R4LgpPbmNlIHdlIGhh
dmUgdGhhdCBJIHRoaW5rIHdlIGNhbiB1bmlmeSBhIGxvdCBvZiB0aGVzZSBoZWxwZXJzIChHZXJk
CkhvZmZtYW5uIGhhcyBsb29rZWQgaW50byBpdCkgYWxsIHdoaWxlIG1ha2luZyB0aGVtIG1vcmUg
ZmxleGlibGUgKGkuZS4gbm90Cm9ubHkgd29ya3Mgd2l0aCBhcnJheXMpLiBTbyBtaWdodCBiZSB3
b3J0aCB0byBjb29yZGluYXRlIGEgYml0IGhlcmUsIGFuZAptYXliZSBob2xkIG9mZiBvbiBqdXN0
IHRoaXMgcGFydCBmb3IgbGltYSBmb3IgYSBiaXQuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
