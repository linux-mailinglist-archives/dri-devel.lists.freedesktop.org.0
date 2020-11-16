Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059B22B3EE0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 09:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2F889D9B;
	Mon, 16 Nov 2020 08:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DF189D9B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 08:40:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so17723927wrt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 00:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=66vgfrqqdZ/IjftnWRbyL4mui98MkxfRQBZDGIvtL2s=;
 b=rG3sxjughMIpsK016TP+ndDu9i6AsudSrG82mApavm72NuxKrKmrpmqp7UfsnrS+yr
 LPkQykKHB7bRePswqOeFuGE5U3urfRmgY8xCS2gNc18KwwFLvnk13kusPLexPkHCAW4J
 Q9HmnCCFvyN/irDbL+knw2OVY4WgR9jGxnNnnkdowuQhOUiVIrhDotn0STih9731kL2C
 /o8NkkcLheLF2oh3UB4RhqEomcfmm1va+jVfdm4csg0sztaacD7Acd252QOQanS4gjCV
 gVJG2ZjycLDmaEQGJe2yo8jij2ity89vkyHFF3HwoQOqrTAzFbKF1R57Z2dOgJPXgc73
 2pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=66vgfrqqdZ/IjftnWRbyL4mui98MkxfRQBZDGIvtL2s=;
 b=iZSj2kk0SZBOXiQsgOWfkb1M+pRnftvs5FP0epcycyKPoLn77jTI5BA5qZ/GEgd3js
 nxuFtqaES/AgdLcqksQULJq5UTvayABdpLm+swvDcjBeBsFb5XAZcY1CKWwn/nreRf6U
 0dM4bwYDlmsrYnsn1aWfg8wTIO6A2+aiR7BUMWx8zP7AieU2BQMlT32zZxnHBLcqIsu6
 DlFCfYWhBvDr983apokldgnWtn+Mf1KIHx1IMbj9xDr5/9et4kS51mrZELOXezvNHywP
 nOVl7P+NmYvrmgnE6LTVvgMyzd9B74A/kE9m6jD9UsM2qASVWkZj2mjJt6tZQUZpc+/B
 lPow==
X-Gm-Message-State: AOAM532GT4WJBhu1NM+DqJ2qHw1UQI60TBUBWXhMeAj15fae2vJt9KPH
 4pUuC/5sB3dYx3TJvD+3zTc9mg==
X-Google-Smtp-Source: ABdhPJwtkF/gvhkWNlAdOMKy71DTjd+S++as5sylbMhPP9SVjdJjRBSawpKlXZ8BBiftB8AUIyg38Q==
X-Received: by 2002:adf:f94b:: with SMTP id q11mr18901740wrr.351.1605516026241; 
 Mon, 16 Nov 2020 00:40:26 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t5sm18937446wmg.19.2020.11.16.00.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 00:40:25 -0800 (PST)
Date: Mon, 16 Nov 2020 08:40:23 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 12/40] drm/pl111/pl111_display: Make local function static
Message-ID: <20201116084023.GL3718728@dell>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-13-lee.jones@linaro.org>
 <20201114191127.GB3797389@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201114191127.GB3797389@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAxNCBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUsCj4gT24g
RnJpLCBOb3YgMTMsIDIwMjAgYXQgMDE6NDk6MTBQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+
ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gPiAK
PiA+ICBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jOjM1Njo2OiB3YXJuaW5n
OiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBsMTExX2Rpc3BsYXlfZGlzYWJsZeKAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gPiAKPiA+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0Bhbmhv
bHQubmV0Pgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KPiAKPiBFcmljJ3Mgd2FzIG5vdCBjb3BpZWQgb24gdGhpcyBvciB0aGUgb3RoZXIg
cGwxMTEgcGF0Y2guCj4gQWRkZWQgRXJpYyBzbyBoZSBjYW4gYmUgYXdhcmUgb2YgdGhpcyBmaXgu
CgpFcmljIEFuaG9sdD8KCkhlJ3Mgb24gQ2M/Cgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L3BsMTExL3BsMTExX2Rpc3BsYXkuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFf
ZGlzcGxheS5jCj4gPiBpbmRleCBiM2U4Njk3Y2FmY2YxLi42OWMwMmU3YzgyYjdlIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYwo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYwo+ID4gQEAgLTM1Myw3ICszNTMs
NyBAQCBzdGF0aWMgdm9pZCBwbDExMV9kaXNwbGF5X2VuYWJsZShzdHJ1Y3QgZHJtX3NpbXBsZV9k
aXNwbGF5X3BpcGUgKnBpcGUsCj4gPiAgCQlkcm1fY3J0Y192Ymxhbmtfb24oY3J0Yyk7Cj4gPiAg
fQo+ID4gIAo+ID4gLXZvaWQgcGwxMTFfZGlzcGxheV9kaXNhYmxlKHN0cnVjdCBkcm1fc2ltcGxl
X2Rpc3BsYXlfcGlwZSAqcGlwZSkKPiA+ICtzdGF0aWMgdm9pZCBwbDExMV9kaXNwbGF5X2Rpc2Fi
bGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlKQo+ID4gIHsKPiA+ICAJc3Ry
dWN0IGRybV9jcnRjICpjcnRjID0gJnBpcGUtPmNydGM7Cj4gPiAgCXN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0gPSBjcnRjLT5kZXY7CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNo
bmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVy
IHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
