Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AC9108A6D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8A889FEC;
	Mon, 25 Nov 2019 09:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06B489C85
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:04:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i12so16972412wro.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=TvuH8l9EzqCh6w89WPpuHfczuxrSA4KxqFlFxqfV2Vg=;
 b=ntYmdB9mbyqNkbQq7zOjc0zhi7u/sT7WL+CN0h4qz4sVERq7/zwGe32t4lJ76yE0EK
 4SX4HeSNNQjs+VjgEpqevSBXpuCMxrnReK7yxPUdlvuj6cRnCsmNQMgNMftYOb/7LnjE
 iE80jOwFgGVAfaOCvwPjyOrKdEISboQMflKM4kTB5VeQlmRrqFAKKjkJrmBZ+ijgz9O+
 QGNapNu4C4fx88VwhLFcNp7nEtuGoPKP/NEk50dXDH4JHXi3tbeQ0NttIOYOyT3fxWM2
 L2rgZfX2x2XESXQSMtEoTxg6Z2YVWCrPxYQFYuqq8zpzZ2tnz6MOL02sAYz6UA+yxrZB
 +Bpw==
X-Gm-Message-State: APjAAAV3vgluFULwJ0Q6wyvbUeXmNepBwW469nL7UJZOCrpaw2hgMQRi
 pI+S5nV3Zh/Hi1vWBmY2sWH7Bg==
X-Google-Smtp-Source: APXvYqwsTKxRds7w/Vwas8Sm4n8Ch850R9kaOYWXGPAfYeWytHb2qi4KaE5RZDdYutqWLL8tmS0xpQ==
X-Received: by 2002:a5d:6651:: with SMTP id f17mr27703663wrw.208.1574672651417; 
 Mon, 25 Nov 2019 01:04:11 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g8sm7676020wmk.23.2019.11.25.01.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 01:04:10 -0800 (PST)
Date: Mon, 25 Nov 2019 10:04:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] drm/vc4: Fix Kconfig indentation
Message-ID: <20191125090409.GC29965@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
References: <20191121132919.29430-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121132919.29430-1-krzk@kernel.org>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TvuH8l9EzqCh6w89WPpuHfczuxrSA4KxqFlFxqfV2Vg=;
 b=ADcl5dL63j8YxIKYJXlZwaPs0RKp9DO7wjV/o2NWZjYmbsCU9i+r7F/I57mHpBrjRW
 KLsRMDFkbdMlWHf2lMPDOls3hQTT4Fop28L9O3CNZpULMsFOHN9r+NEMSl8S+kgI8JxO
 y54KSGHAM/fM5USepihb7iRhIHMaANxba3cTs=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDk6Mjk6MTlQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KClF1ZXVlZCBpbiBk
cm0tbWlzYy1uZXh0IGZvciA1LjYsIHRoYW5rcyBmb3IgeW91ciBwYXRjaC4KLURhbmllbAoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3ZjNC9LY29uZmlnIHwgOCArKysrLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdmM0L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L0tjb25m
aWcKPiBpbmRleCA3YzIzMTdlZmQ1YjcuLjExOGU4YTQyNmIxYSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdmM0L0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L0tjb25m
aWcKPiBAQCAtMjIsOSArMjIsOSBAQCBjb25maWcgRFJNX1ZDNAo+ICAJICBvdXIgZGlzcGxheSBz
ZXR1cC4KPiAgCj4gIGNvbmZpZyBEUk1fVkM0X0hETUlfQ0VDCj4gLSAgICAgICBib29sICJCcm9h
ZGNvbSBWQzQgSERNSSBDRUMgU3VwcG9ydCIKPiAtICAgICAgIGRlcGVuZHMgb24gRFJNX1ZDNAo+
IC0gICAgICAgc2VsZWN0IENFQ19DT1JFCj4gLSAgICAgICBoZWxwCj4gKwlib29sICJCcm9hZGNv
bSBWQzQgSERNSSBDRUMgU3VwcG9ydCIKPiArCWRlcGVuZHMgb24gRFJNX1ZDNAo+ICsJc2VsZWN0
IENFQ19DT1JFCj4gKwloZWxwCj4gIAkgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBh
IEJyb2FkY29tIFZDNCBHUFUKPiAgCSAgYW5kIHdhbnQgdG8gdXNlIENFQy4KPiAtLSAKPiAyLjE3
LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
