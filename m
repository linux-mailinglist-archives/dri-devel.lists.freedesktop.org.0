Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5AEA6333
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 09:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7664B89701;
	Tue,  3 Sep 2019 07:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D324289700
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 07:57:23 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id u6so11741267edq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 00:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=XyH9fjGaETvp4a3MJs0cBMtWSSEc5LYuPiBn8RJcvKU=;
 b=eWfQX0zsAVi8c1i9E63WnvmguISLjMGGaeLvpreB9BjmWCggfaN6iTjwYa+oEX6rh/
 EQKFL69MB+Oeja1Zb5j4a46a2PSm5Eh3NDzuRkekh1t6Kig/DmTNM68SleTIBQO48YRw
 Tge27ARXeyyG+0Ef/kaN/eXc8W1hIysOXZpvf05CWQwXuxnZLoY/7/pdpWKxva0eVsL/
 3RWlAXndeYp12wz99VZ5b7zhdPAaVCBgTAij9E/3sLpYoSg/8Owgcwhbk6P+o4CNcyIG
 pPf0UzUcJx5cIQRy7vpcqa78tMZhozOTFNRW/A9YWjUxjYlD6HCUKiw0E0cY/VOJV7NX
 DPcA==
X-Gm-Message-State: APjAAAXyghVXdqz9OJWtouEwLyeAglBwHJ2Q0sCKA/6gWDGrQYLYCyYI
 ceOpf3uXfE/a4GxTQDfDDWZ68w==
X-Google-Smtp-Source: APXvYqz26Mae/q+g7jCEzVh2CCvBUR7e61Oli7pH4i+m6sIXlm6BLaKU1KIonUizirO+JYsng7b1wg==
X-Received: by 2002:a05:6402:148c:: with SMTP id
 e12mr7741960edv.62.1567497442431; 
 Tue, 03 Sep 2019 00:57:22 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b17sm875141edn.33.2019.09.03.00.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 00:57:21 -0700 (PDT)
Date: Tue, 3 Sep 2019 09:57:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <Kenny.Ho@amd.com>
Subject: Re: [PATCH RFC v4 01/16] drm: Add drm_minor_for_each
Message-ID: <20190903075719.GK2112@phenom.ffwll.local>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-2-Kenny.Ho@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829060533.32315-2-Kenny.Ho@amd.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XyH9fjGaETvp4a3MJs0cBMtWSSEc5LYuPiBn8RJcvKU=;
 b=MKH3mPNBi4p3Uq9gbHUx4XyYw1CGEZnMhDkzLRZx7lVA3RSgEIs68kuEb358zPx+CQ
 ehE050R/2OoMuNL2MSTulCU8vJDKUdr0vXsQmz6XLvXuwMopbaCECeOKp4sPNkyCJNAO
 r2X6vA+MwdTWkEnRVipH+zZhY3xhpW6rRxl4w=
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
Cc: felix.kuehling@amd.com, jsparks@cray.com, amd-gfx@lists.freedesktop.org,
 lkaplan@cray.com, alexander.deucher@amd.com, y2kenny@gmail.com,
 dri-devel@lists.freedesktop.org, joseph.greathouse@amd.com, tj@kernel.org,
 cgroups@vger.kernel.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDI6MDU6MThBTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gVG8gYWxsb3cgb3RoZXIgc3Vic3lzdGVtcyB0byBpdGVyYXRlIHRocm91Z2ggYWxsIHN0b3Jl
ZCBEUk0gbWlub3JzIGFuZAo+IGFjdCB1cG9uIHRoZW0uCj4gCj4gQWxzbyBleHBvc2VzIGRybV9t
aW5vcl9hY3F1aXJlIGFuZCBkcm1fbWlub3JfcmVsZWFzZSBmb3Igb3RoZXIgc3Vic3lzdGVtCj4g
dG8gaGFuZGxlIGRybV9taW5vci4gIERSTSBjZ3JvdXAgY29udHJvbGxlciBpcyB0aGUgaW5pdGlh
bCBjb25zdW1lciBvZgo+IHRoaXMgbmV3IGZlYXR1cmVzLgo+IAo+IENoYW5nZS1JZDogSTdjNGI2
N2NlNmIzMWYwNmQxMDM3YjAzNDM1Mzg2ZmY1YjgxNDRjYTUKPiBTaWduZWQtb2ZmLWJ5OiBLZW5u
eSBIbyA8S2VubnkuSG9AYW1kLmNvbT4KCkl0ZXJhdGluZyBvdmVyIG1pbm9ycyBmb3IgY2dyb3Vw
cyBzb3VuZHMgdmVyeSwgdmVyeSB3cm9uZy4gV2h5IGRvIHdlIGNhcmUKd2hldGhlciBhIGJ1ZmZl
ciB3YXMgYWxsb2NhdGVkIHRocm91Z2gga21zIGR1bWIgdnMgcmVuZGVyIG5vZGVzPwoKSSdkIGV4
cGVjdCBhbGwgdGhlIGNncm91cCBzdHVmZiB0byBvbmx5IHdvcmsgb24gZHJtX2RldmljZSwgaWYg
aXQgZG9lcwpjYXJlIGFib3V0IGRldmljZXMuCgooSSBkaWRuJ3QgbG9vayB0aHJvdWdoIHRoZSBw
YXRjaCBzZXJpZXMgdG8gZmluZCBvdXQgd2hlcmUgZXhhY3RseSB5b3UncmUKdXNpbmcgdGhpcywg
c28gbWF5YmUgSSdtIG9mZiB0aGUgcmFpbHMgaGVyZSkuCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5oIHwgIDQgLS0tLQo+ICBpbmNsdWRlL2RybS9kcm1f
ZHJ2LmggICAgICAgICAgfCAgNCArKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKPiBpbmRleCA4NjI2MjE0OTRhOTMu
LjAwMGNkZGFiZDk3MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwo+IEBAIC0yNTQsMTEgKzI1NCwxMyBAQCBz
dHJ1Y3QgZHJtX21pbm9yICpkcm1fbWlub3JfYWNxdWlyZSh1bnNpZ25lZCBpbnQgbWlub3JfaWQp
Cj4gIAo+ICAJcmV0dXJuIG1pbm9yOwo+ICB9Cj4gK0VYUE9SVF9TWU1CT0woZHJtX21pbm9yX2Fj
cXVpcmUpOwo+ICAKPiAgdm9pZCBkcm1fbWlub3JfcmVsZWFzZShzdHJ1Y3QgZHJtX21pbm9yICpt
aW5vcikKPiAgewo+ICAJZHJtX2Rldl9wdXQobWlub3ItPmRldik7Cj4gIH0KPiArRVhQT1JUX1NZ
TUJPTChkcm1fbWlub3JfcmVsZWFzZSk7Cj4gIAo+ICAvKioKPiAgICogRE9DOiBkcml2ZXIgaW5z
dGFuY2Ugb3ZlcnZpZXcKPiBAQCAtMTA3OCw2ICsxMDgwLDIzIEBAIGludCBkcm1fZGV2X3NldF91
bmlxdWUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbmFtZSkKPiAgfQo+ICBF
WFBPUlRfU1lNQk9MKGRybV9kZXZfc2V0X3VuaXF1ZSk7Cj4gIAo+ICsvKioKPiArICogZHJtX21p
bm9yX2Zvcl9lYWNoIC0gSXRlcmF0ZSB0aHJvdWdoIGFsbCBzdG9yZWQgRFJNIG1pbm9ycwo+ICsg
KiBAZm46IEZ1bmN0aW9uIHRvIGJlIGNhbGxlZCBmb3IgZWFjaCBwb2ludGVyLgo+ICsgKiBAZGF0
YTogRGF0YSBwYXNzZWQgdG8gY2FsbGJhY2sgZnVuY3Rpb24uCj4gKyAqCj4gKyAqIFRoZSBjYWxs
YmFjayBmdW5jdGlvbiB3aWxsIGJlIGNhbGxlZCBmb3IgZWFjaCBAZHJtX21pbm9yIGVudHJ5LCBw
YXNzaW5nCj4gKyAqIHRoZSBtaW5vciwgdGhlIGVudHJ5IGFuZCBAZGF0YS4KPiArICoKPiArICog
SWYgQGZuIHJldHVybnMgYW55dGhpbmcgb3RoZXIgdGhhbiAlMCwgdGhlIGl0ZXJhdGlvbiBzdG9w
cyBhbmQgdGhhdAo+ICsgKiB2YWx1ZSBpcyByZXR1cm5lZCBmcm9tIHRoaXMgZnVuY3Rpb24uCj4g
KyAqLwo+ICtpbnQgZHJtX21pbm9yX2Zvcl9lYWNoKGludCAoKmZuKShpbnQgaWQsIHZvaWQgKnAs
IHZvaWQgKmRhdGEpLCB2b2lkICpkYXRhKQo+ICt7Cj4gKwlyZXR1cm4gaWRyX2Zvcl9lYWNoKCZk
cm1fbWlub3JzX2lkciwgZm4sIGRhdGEpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZHJtX21pbm9y
X2Zvcl9lYWNoKTsKPiArCj4gIC8qCj4gICAqIERSTSBDb3JlCj4gICAqIFRoZSBEUk0gY29yZSBt
b2R1bGUgaW5pdGlhbGl6ZXMgYWxsIGdsb2JhbCBEUk0gb2JqZWN0cyBhbmQgbWFrZXMgdGhlbQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmggYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ludGVybmFsLmgKPiBpbmRleCBlMTlhYzdjYTYwMmQuLjZiZmFkNzZmOGU3OCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmgKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmgKPiBAQCAtNTQsMTAgKzU0LDYgQEAgdm9pZCBkcm1f
cHJpbWVfZGVzdHJveV9maWxlX3ByaXZhdGUoc3RydWN0IGRybV9wcmltZV9maWxlX3ByaXZhdGUg
KnByaW1lX2Zwcml2KTsKPiAgdm9pZCBkcm1fcHJpbWVfcmVtb3ZlX2J1Zl9oYW5kbGVfbG9ja2Vk
KHN0cnVjdCBkcm1fcHJpbWVfZmlsZV9wcml2YXRlICpwcmltZV9mcHJpdiwKPiAgCQkJCQlzdHJ1
Y3QgZG1hX2J1ZiAqZG1hX2J1Zik7Cj4gIAo+IC0vKiBkcm1fZHJ2LmMgKi8KPiAtc3RydWN0IGRy
bV9taW5vciAqZHJtX21pbm9yX2FjcXVpcmUodW5zaWduZWQgaW50IG1pbm9yX2lkKTsKPiAtdm9p
ZCBkcm1fbWlub3JfcmVsZWFzZShzdHJ1Y3QgZHJtX21pbm9yICptaW5vcik7Cj4gLQo+ICAvKiBk
cm1fdmJsYW5rLmMgKi8KPiAgdm9pZCBkcm1fdmJsYW5rX2Rpc2FibGVfYW5kX3NhdmUoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUpOwo+ICB2b2lkIGRybV92Ymxhbmtf
Y2xlYW51cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2Rydi5oIGIvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCj4gaW5kZXggNjhjYTczNmM1NDhk
Li4yNGY4ZDA1NGM1NzAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCj4gQEAgLTc5OSw1ICs3OTksOSBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgZHJtX2Rydl91c2VzX2F0b21pY19tb2Rlc2V0KHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpCj4gIAo+ICBpbnQgZHJtX2Rldl9zZXRfdW5pcXVlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IGNvbnN0IGNoYXIgKm5hbWUpOwo+ICAKPiAraW50IGRybV9taW5vcl9mb3JfZWFjaChpbnQgKCpm
bikoaW50IGlkLCB2b2lkICpwLCB2b2lkICpkYXRhKSwgdm9pZCAqZGF0YSk7Cj4gKwo+ICtzdHJ1
Y3QgZHJtX21pbm9yICpkcm1fbWlub3JfYWNxdWlyZSh1bnNpZ25lZCBpbnQgbWlub3JfaWQpOwo+
ICt2b2lkIGRybV9taW5vcl9yZWxlYXNlKHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKTsKPiAgCj4g
ICNlbmRpZgo+IC0tIAo+IDIuMjIuMAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
