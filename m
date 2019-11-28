Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA7510C68C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 11:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D9F6E78B;
	Thu, 28 Nov 2019 10:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A8C6E78B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 10:20:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so27256934wrt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 02:20:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=1ZHv1hUDZXloYpmI5YiH/7Xq4I6YnjSf1ED3Ka+GIRc=;
 b=ZOjbBuKPY8FmFiutEUT8ezwyBdnUqUshBISxXxnPlLDcwp2UxLndjpTyyYzW/gsbfk
 +yeKL5NaoGOy6OOOOFbWLVAKccLXWR7mju3aMnfq9JHAH+5RrjYe0UqAtZHVB+un0ojy
 gmMSbepdRti97dF+o648kVCnuWjtNSb1HuJStgEzEq8fyBMQIu6kCVUfV6uhq5KBKNQd
 tgd+cBPJxLFiBw+b0Sew5Hn//NNX+D/DgdFeqyAba0/Sf0OPpPrfP0wH4eUd5R1GL/MF
 s7IbxV6jpeYVVSemaFsbDmrV8ibicZiaSZ2TfIMLhVBy9Eg/KrWo9WEPAUocd0WpUHoz
 pAlw==
X-Gm-Message-State: APjAAAUwRGdR9sD4VsLSVbyytFDKfCKVu4OsAdC6ogw23VxCTWn2+XzT
 /8SBQRgDaVTUDcGHyGfu/4JFPQ==
X-Google-Smtp-Source: APXvYqyFwjg5SccZ49IjwM76iSTTFfBzBmcNBkj2ubLYov/j9Rc3tSi2DWs9rWgL3eAX81xADmbhaQ==
X-Received: by 2002:a5d:694d:: with SMTP id r13mr37376781wrw.395.1574936402284; 
 Thu, 28 Nov 2019 02:20:02 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id w13sm22273236wrm.8.2019.11.28.02.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 02:20:00 -0800 (PST)
Date: Thu, 28 Nov 2019 11:19:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 2/2] drm/fourcc: Fill out all block sizes for P210
Message-ID: <20191128101958.GS406127@phenom.ffwll.local>
References: <20191126091414.226070-1-daniel.vetter@ffwll.ch>
 <20191126091414.226070-2-daniel.vetter@ffwll.ch>
 <20191126114654.kvncds3adtxfy77h@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126114654.kvncds3adtxfy77h@e110455-lin.cambridge.arm.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=1ZHv1hUDZXloYpmI5YiH/7Xq4I6YnjSf1ED3Ka+GIRc=;
 b=R/0Baf0lB7AKWaUlctfVjVStr/5a5x82PouKEwQg9MXPB15ia8thOkvZPMOq+/kYUv
 IWMnPbTYZC29Pkk1/aJKHXXivnxmzZ1kjeZYYQwVK8hWclu/MTdoGVR5BhKxWSMguj+V
 MwBXf+rwI5irJj8lwApyQH9zUQ9s8jrMqRs/8=
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Ayan Kumar Halder <ayan.halder@arm.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMTE6NDY6NTRBTSArMDAwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gT24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMTA6MTQ6MTRBTSArMDEwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiA+IDAgbWVhbnMgMSBhcyB0aGUgZGVmYXVsdCwgYnV0IGl0J3MgbWlnaHR5
IGNvbmZ1c2luZyBpZiB0aGUgYmxvY2sgc2l6ZQo+ID4gZm9yIHRoZSBmaXJzdCBwbGFuZSBpcyBz
cGVsbGVkIG91dCBleHBsaWNpdGx5LCBidXQgbm90IGZvciB0aGUgMm5kCj4gPiBwbGFuZS4KPiA+
IAo+ID4gTm8gY2M6IHN0YWJsZSBiZWNhdXNlIHRoaXMgaXMganVzdCBjb25mdXNpb24sIGJ1dCAw
IGZ1bmN0aW9uYWwgaXNzdWUuCj4gCj4gQWdyZWUhCj4gCj4gPiAKPiA+IEZpeGVzOiA3YmEwZmVl
MjQ3ZWUgKCJkcm0vZm91cmNjOiBBZGQgQUZCQyB5dXYgZm91cmNjcyBmb3IgTWFsaSIpCj4gPiBD
YzogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgo+ID4gQ2M6IEF5YW4gS3Vt
YXIgSGFsZGVyIDxheWFuLmhhbGRlckBhcm0uY29tPgo+ID4gQ2M6IExpdml1IER1ZGF1IDxsaXZp
dS5kdWRhdUBhcm0uY29tPgo+IAo+IEFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVA
YXJtLmNvbT4KCkJvdGggcGF0Y2hlcyBhcHBsaWVkLCB0aGFua3MgZm9yIHRha2luZyBhIGxvb2su
Ci1EYW5pZWwKCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+ID4gQ2M6IEFseXNzYSBSb3Nlbnp3ZWln
IDxhbHlzc2FAcm9zZW56d2VpZy5pbz4KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBh
cmRAa2VybmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2Mu
YyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jCj4gPiBpbmRleCBmZTc5Y2U4NTdjOGEuLmIyMzRi
ZmFlZGEwNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKPiA+IEBAIC0yNjMsNyArMjYzLDcg
QEAgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqX19kcm1fZm9ybWF0X2luZm8odTMyIGZv
cm1hdCkKPiA+ICAJCSAgLmhzdWIgPSAyLCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlfSwKPiA+
ICAJCXsgLmZvcm1hdCA9IERSTV9GT1JNQVRfUDIxMCwJCS5kZXB0aCA9IDAsCj4gPiAgCQkgIC5u
dW1fcGxhbmVzID0gMiwgLmNoYXJfcGVyX2Jsb2NrID0geyAyLCA0LCAwIH0sCj4gPiAtCQkgIC5i
bG9ja193ID0geyAxLCAwLCAwIH0sIC5ibG9ja19oID0geyAxLCAwLCAwIH0sIC5oc3ViID0gMiwK
PiA+ICsJCSAgLmJsb2NrX3cgPSB7IDEsIDEsIDAgfSwgLmJsb2NrX2ggPSB7IDEsIDEsIDAgfSwg
LmhzdWIgPSAyLAo+ID4gIAkJICAudnN1YiA9IDEsIC5pc195dXYgPSB0cnVlIH0sCj4gPiAgCQl7
IC5mb3JtYXQgPSBEUk1fRk9STUFUX1ZVWTEwMTAxMCwJLmRlcHRoID0gMCwKPiA+ICAJCSAgLm51
bV9wbGFuZXMgPSAxLCAuY3BwID0geyAwLCAwLCAwIH0sIC5oc3ViID0gMSwgLnZzdWIgPSAxLAo+
ID4gLS0gCj4gPiAyLjI0LjAKPiA+IAo+IAo+IC0tIAo+ID09PT09PT09PT09PT09PT09PT09Cj4g
fCBJIHdvdWxkIGxpa2UgdG8gfAo+IHwgZml4IHRoZSB3b3JsZCwgIHwKPiB8IGJ1dCB0aGV5J3Jl
IG5vdCB8Cj4gfCBnaXZpbmcgbWUgdGhlICAgfAo+ICBcIHNvdXJjZSBjb2RlISAgLwo+ICAgLS0t
LS0tLS0tLS0tLS0tCj4gICAgIMKvXF8o44OEKV8vwq8KCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
