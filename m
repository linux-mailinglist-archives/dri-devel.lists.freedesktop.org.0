Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14E71040F4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C9A6E89C;
	Wed, 20 Nov 2019 16:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA806E89C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 16:39:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b18so571486wrj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 08:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=/OHSU0fY9M2wF7Dch2vz0TnbVEHM5EwSW33Sj289Ves=;
 b=q76XD1jcBZb56ucUHaGmpw79846mKKnAg7uIH7yEq6yVkBz63sXGnKEJSKrxtY2Sjk
 lgBIYtVBPhipDxkqj+9ohbFAWt2TXEZtAfJVE6qUCMrBnplr4byzB8xyGeorw/QF68KO
 uFAE4la+G6sC765OaQHTZjeQvghjxYi4xmR03ivEN7NJhExP8aA7TZpfT2XfklRTw7ln
 EaYu3r1katHyg8EPnulhszzdavu/Gp+A8ot8/8Sz0trJz/src2ExjSjbqF1mXJj8MogS
 KEa9Ctzq3iOX5c/jjxAslHBPFbiKaBdMTg6VBNGW+hB603cWmYIM6g/cXuCfHuVcsjoo
 0pww==
X-Gm-Message-State: APjAAAUIEkFH1QLMzzSoQQ34hfxrpoSmZ7NIYUCHS677tk/YBki/v04o
 2nM7KDc3mrEZ8Sj8r1mZmzU0sw==
X-Google-Smtp-Source: APXvYqxVoHzP5vhF6LkCRi1Hwy3MgV40SQo6RqYoQ3S2Jy5cY6Mt6b3tlm1v83jfAcRsfCuT8TB8DQ==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr4449297wrr.214.1574267942842; 
 Wed, 20 Nov 2019 08:39:02 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id x205sm7917798wmb.5.2019.11.20.08.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:39:01 -0800 (PST)
Date: Wed, 20 Nov 2019 17:39:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] drm/nouveau: Fix Kconfig indentation
Message-ID: <20191120163900.GP30416@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20191120133619.11415-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120133619.11415-1-krzk@kernel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/OHSU0fY9M2wF7Dch2vz0TnbVEHM5EwSW33Sj289Ves=;
 b=VkAzDB4ht07A3g+rZWhLc3RvpxR3tanWxlh0EvxiYekr8nCSPHmUlZ/BUMxKCU6BIR
 9nh+QUHzT2vPnAIxSCHtGSFt+oUe6g7QT00ypWhXOjhdXfvmeBgEVseJPixTskmTqIIY
 sfVoKDB/u0Wor54YoTcwiD3ksN/S9/tvZcGZQ=
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6MzY6MTlQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KClF1ZXVlZCBmb3Ig
NS42IGluIGRybS1taXNjLCB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCi1EYW5pZWwKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmln
Cj4gaW5kZXggMzU1OGRmMDQzNTkyLi45Yzk5MDI2NmU4NzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L0tjb25maWcKPiBAQCAtMiw3ICsyLDcgQEAKPiAgY29uZmlnIERSTV9OT1VWRUFVCj4gIAl0cmlz
dGF0ZSAiTm91dmVhdSAoTlZJRElBKSBjYXJkcyIKPiAgCWRlcGVuZHMgb24gRFJNICYmIFBDSSAm
JiBNTVUKPiAtICAgICAgICBzZWxlY3QgRldfTE9BREVSCj4gKwlzZWxlY3QgRldfTE9BREVSCj4g
IAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAgCXNlbGVjdCBEUk1fVFRNCj4gIAlzZWxlY3QgQkFD
S0xJR0hUX0NMQVNTX0RFVklDRSBpZiBEUk1fTk9VVkVBVV9CQUNLTElHSFQKPiAtLSAKPiAyLjE3
LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
