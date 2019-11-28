Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5810C871
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 13:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D366E819;
	Thu, 28 Nov 2019 12:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141476E81B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 12:15:42 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so5519055wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 04:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ribroWq2BMVb2ZRoTd8sGEdBPVQi+d8tu2riUN2XyD4=;
 b=XRZu9nuHLCLufyIbaGqq6sHqos/HyOXOAP5CDSc4LbJuNXrcktvXKG5hExu7aGAxQk
 jvxf74jetsjWmjcp+ZqnpIkPB7BY6pQC04CaBgicfLSHzaoBYVCPrjS0TNmVoPLX54LE
 ixwAcy1Q/K6BCr50j2heHCRmXd6XMLBLYXygbUXbu00OE8g+n8iQXQNBIOnRL90A4XN/
 vNtnqeiFhqkE4pNsc3Dg4Ysb3utjxXVKrQW/lezCLBRQtwu3tYC/TE33X6mTRcA1TF10
 X4gAJcK95w7MJbqCZrSE4PUKe3xwkcDfsBjfqNSZLcIfcZCr2bFQsKg5EFHygU0cWAkN
 Fykg==
X-Gm-Message-State: APjAAAWYf3Exan+++t8h4Nz58cHVFMddTn4Q1M+OwEqcsaohGM1WS/fJ
 NiJMVxURw8sbvVSldHpUqU14a+QWO1A=
X-Google-Smtp-Source: APXvYqyOcCOcqZ0jelBTyLnn4hP1E6cXtTqAUAVj07pF/AGcBuHELadeKxF4MVlN71hj5vThhvseuQ==
X-Received: by 2002:a05:600c:2049:: with SMTP id
 p9mr9310212wmg.128.1574943340619; 
 Thu, 28 Nov 2019 04:15:40 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 91sm24192953wrm.42.2019.11.28.04.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 04:15:39 -0800 (PST)
Date: Thu, 28 Nov 2019 13:15:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/rect: update kerneldoc for drm_rect_clip_scaled()
Message-ID: <20191128121537.GT406127@phenom.ffwll.local>
References: <20191126145213.380079-1-daniel.vetter@ffwll.ch>
 <20191126151014.GB1208@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126151014.GB1208@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=ribroWq2BMVb2ZRoTd8sGEdBPVQi+d8tu2riUN2XyD4=;
 b=d2EHs0p3p2uLlGFJFTYTnQc5UxgxYysM0zwAnv4AL+P5ZZb6QO1/h0IoQiFvyufPrn
 eaJxyPUhUh2f02ft3exEzCHzBgO1PQcVxfJY5mOWcsGnhMb57Q9+YVitfxGrselnORJm
 TQz4tspLlRAy1E1QnRffBTSDOszZLmiWBHNxM=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDU6MTA6MTRQTSArMDIwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFR1ZSwgTm92IDI2LCAyMDE5IGF0IDAzOjUyOjEzUE0gKzAxMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBUaGlzIHdhcyBmb3Jnb3R0ZW4gaW4gZjk2YmRmNTY0ZjNlICgi
ZHJtL3JlY3Q6IEhhbmRsZSByb3VuZGluZyBlcnJvcnMKPiA+IGluIGRybV9yZWN0X2NsaXBfc2Nh
bGVkLCB2My4iKQo+ID4gCj4gPiBTcG90dGVkIHdoaWxlIHJldmlld2luZyBwYXRjaGVzIGZyb20g
VmlsbGUgdG91Y2hpbmcgdGhpcyBhcmVhLgo+ID4gCj4gPiBGaXhlczogZjk2YmRmNTY0ZjNlICgi
ZHJtL3JlY3Q6IEhhbmRsZSByb3VuZGluZyBlcnJvcnMgaW4gZHJtX3JlY3RfY2xpcF9zY2FsZWQs
IHYzLiIpCj4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KPiA+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRA
c3QuY29tPgo+ID4gQ2M6IFZpbGxlIFN5cmphbGEgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+CgpUaGFua3MgZm9yIHRha2luZyBhIGxvb2ssIHBhdGNoIHB1c2hlZC4K
LURhbmllbAoKPiAKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jIHwgNiAr
KysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYwo+ID4gaW5kZXggYjgzNjNhYWE5MDMyLi5lNmU2NDBmMmQ1
ZTMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYwo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMKPiA+IEBAIC03MywxMSArNzMsMTMgQEAgc3RhdGlj
IHUzMiBjbGlwX3NjYWxlZCh1MzIgc3JjLCB1MzIgZHN0LCB1MzIgY2xpcCkKPiA+ICAgKiBAY2xp
cDogY2xpcCByZWN0YW5nbGUKPiA+ICAgKgo+ID4gICAqIENsaXAgcmVjdGFuZ2xlIEBkc3QgYnkg
cmVjdGFuZ2xlIEBjbGlwLiBDbGlwIHJlY3RhbmdsZSBAc3JjIGJ5IHRoZQo+ID4gLSAqIHNhbWUg
YW1vdW50cyBtdWx0aXBsaWVkIGJ5IEBoc2NhbGUgYW5kIEB2c2NhbGUuCj4gPiArICogdGhlIGNv
cnJlc3BvbmRpbmcgYW1vdW50cywgcmV0YWluaW5nIHRoZSB2ZXJ0aWNhbCBhbmQgaG9yaXpvbnRh
bCBzY2FsaW5nCj4gPiArICogZmFjdG9ycyBmcm9tIEBzcmMgdG8gQGRzdC4KPiA+ICAgKgo+ID4g
ICAqIFJFVFVSTlM6Cj4gPiArICoKPiA+ICAgKiAldHJ1ZSBpZiByZWN0YW5nbGUgQGRzdCBpcyBz
dGlsbCB2aXNpYmxlIGFmdGVyIGJlaW5nIGNsaXBwZWQsCj4gPiAtICogJWZhbHNlIG90aGVyd2lz
ZQo+ID4gKyAqICVmYWxzZSBvdGhlcndpc2UuCj4gPiAgICovCj4gPiAgYm9vbCBkcm1fcmVjdF9j
bGlwX3NjYWxlZChzdHJ1Y3QgZHJtX3JlY3QgKnNyYywgc3RydWN0IGRybV9yZWN0ICpkc3QsCj4g
PiAgCQkJICBjb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApCj4gPiAtLSAKPiA+IDIuMjQuMAo+
IAo+IC0tIAo+IFZpbGxlIFN5cmrDpGzDpAo+IEludGVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
