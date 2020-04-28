Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43871BC205
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 16:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A2D6E811;
	Tue, 28 Apr 2020 14:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210866E804
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 14:55:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v8so2570079wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 07:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=6jFGKnF82v8suNis8fMuokycBjbhGzKZuUKxIPnz6aU=;
 b=BZjH9ieYve/gpLatbRDZvJ5mYMgq6YUzTeqo/oWKI+CvmthCFiA2MHvBErEm7R56zX
 yGznMbgkGKeZ+H/WGkmuaje2vBjRkQceSGF3pHEBbC5mX9V583N7EswiLWe5KsmKjLY1
 7ME8A6V8IBT7cX79iEnfogPbJkUN3SvScH9Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=6jFGKnF82v8suNis8fMuokycBjbhGzKZuUKxIPnz6aU=;
 b=LAnaA6F7kTNOV4Akb4COCmsL215XJbH/rP09L/NNP/vJctvTneMVAxyFcCIGqqHyav
 3j/WmdhAbPWnrTJfgV/YPC/DIqwKsoF1ucOYHDajSxYBd3tVlDuS+Qktto6ITsZZRXng
 9bXPxeULfyL/rtLDNTav4KNw9DdTNnDA3Hm8MCPPw50Mqbwz+Am0Za2//maQnSql6dU/
 yrExR6CtRKhUXusUt1WXAPW9npjQZBfUC+R2+MbnDtKWUrUUyIy1yzeJdPt10olycuF2
 4ScTQmBGSpkGNPfq8xCZjfa2gsylb17enLZa4dFpenV0tmRqWZhxO8FXoUd2tEGJ6tkQ
 VIFw==
X-Gm-Message-State: AGi0PuaFG8Rj3FjrY1IBWPUXERf7yYWcNqraXitO2zA20anXGfhX1Z9I
 Qr+WCpDHN5kiprM5WEE+ihtdjQ==
X-Google-Smtp-Source: APiQypLVWUTBQ/2GQLWlB4vZEl5cImSOrQr/pNFn43Y9nr0LlTg+bI/kjjQbJ752mXJz4e4Gw8vG/Q==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr4825208wmj.169.1588085709816; 
 Tue, 28 Apr 2020 07:55:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p190sm3680671wmp.38.2020.04.28.07.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 07:55:09 -0700 (PDT)
Date: Tue, 28 Apr 2020 16:55:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH -next] drm/mediatek: Fix Kconfig warning
Message-ID: <20200428145507.GQ3456981@phenom.ffwll.local>
Mail-Followup-To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
References: <20200420135045.27984-1-yuehaibing@huawei.com>
 <CAAOTY__km=QZQACp8g-Qr+aWZ4r0Yp7O5j7u8ZTpDpTXXfUdNw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY__km=QZQACp8g-Qr+aWZ4r0Yp7O5j7u8ZTpDpTXXfUdNw@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBcHIgMjYsIDIwMjAgYXQgMDQ6MjA6MzlQTSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3
cm90ZToKPiBIaSwgWXVlSGFpYmluZzoKPiAKPiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdl
aS5jb20+IOaWvCAyMDIw5bm0NOaciDIw5pelIOmAseS4gCDkuIvljYgxMDowNOWvq+mBk++8mgo+
ID4KPiA+IFdBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0ZWQgZm9yIE1U
S19NTVNZUwo+ID4gICBEZXBlbmRzIG9uIFtuXTogKEFSQ0hfTUVESUFURUsgWz15XSB8fCBDT01Q
SUxFX1RFU1QgWz1uXSkgJiYgQ09NTU9OX0NMS19NVDgxNzNfTU1TWVMgWz1uXQo+ID4gICBTZWxl
Y3RlZCBieSBbeV06Cj4gPiAgIC0gRFJNX01FRElBVEVLIFs9eV0gJiYgSEFTX0lPTUVNIFs9eV0g
JiYgRFJNIFs9eV0gJiYgKEFSQ0hfTUVESUFURUsgWz15XSB8fCBBUk0gJiYgQ09NUElMRV9URVNU
IFs9bl0pICYmIENPTU1PTl9DTEsgWz15XSAmJiBIQVZFX0FSTV9TTUNDQyBbPXldICYmIE9GIFs9
eV0KPiA+Cj4gPiBBZGQgbWlzc2luZyBkZXBlbmRjeSBDT01NT05fQ0xLX01UODE3M19NTVNZUyB0
byBmaXggdGhpcy4KPiAKPiBGcm9tIHRoZSBjb2RlIHJlbGF0aW9uc2hpcCwgbWVkaWF0ZWsgZHJt
IGhhcyByZWxhdGlvbiB3aXRoIG1lZGlhdGVrCj4gbW1zeXMsIGFuZCBtZWRpYXRlayBtbXN5cyBo
YXMgcmVsYXRpb24gd2l0aCBtZWRhaXRlayBjbG9jay4KPiBTbyBJIHRoaW5rIGl0J3MgYmV0dGVy
IHRoYXQgQ09ORklHX01US19NTVNZUyBzZWxlY3QKPiBDT05GSUdfQ09NTU9OX0NMS19NVDgxNzNf
TU1TWVMuCgpzZWxlY3QgaXMgdmVyeSBzdHJvbmdseSBkaXNjb3VyYWdlZCBhbmQgc2hvdWxkIG9u
bHkgYmUgdXNlZCBmb3IgS2NvbmZpZwpzeW1ib2xzIG5vdCB2aXNpYmxlIHRvIHVzZXJzLgotRGFu
aWVsCgo+IAo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPiAKPiA+Cj4gPiBGaXhlczogMmM3NThl
MzAxZWQ5ICgic29jIC8gZHJtOiBtZWRpYXRlazogTW92ZSByb3V0aW5nIGNvbnRyb2wgdG8gbW1z
eXMgZGV2aWNlIikKPiA+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
d2VpLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnIHwg
MSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL0tjb25maWcKPiA+IGluZGV4IGM0MjBmNWEzZDMzYi4uNGQ5YjU1NDBkZTY4IDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnCj4gPiBAQCAtNiw2ICs2LDcgQEAgY29uZmln
IERSTV9NRURJQVRFSwo+ID4gICAgICAgICBkZXBlbmRzIG9uIENPTU1PTl9DTEsKPiA+ICAgICAg
ICAgZGVwZW5kcyBvbiBIQVZFX0FSTV9TTUNDQwo+ID4gICAgICAgICBkZXBlbmRzIG9uIE9GCj4g
PiArICAgICAgIGRlcGVuZHMgb24gQ09NTU9OX0NMS19NVDgxNzNfTU1TWVMKPiA+ICAgICAgICAg
c2VsZWN0IERSTV9HRU1fQ01BX0hFTFBFUgo+ID4gICAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQ
RVIKPiA+ICAgICAgICAgc2VsZWN0IERSTV9NSVBJX0RTSQo+ID4gLS0KPiA+IDIuMTcuMQo+ID4K
PiA+CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
