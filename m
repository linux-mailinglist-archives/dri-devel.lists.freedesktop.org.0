Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAFA1040E0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61046E8A4;
	Wed, 20 Nov 2019 16:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B636E89F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 16:35:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b17so299679wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 08:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=4fUPFIHSdVdO2uzRzyZ9JTr48DiWdw9H1oGUMfBPlq8=;
 b=c8H+5I7TLpeEtEHJ2R4WyuC9k2OvMH6Cku7VIZ20tDGqKxUII8vDZ13XK2YAl1DqLE
 kQ1j9GbI+pVhlfEaV+0lqaUcngc5wGURlVJvW/5hWBMsfMIUoz4dNsuV0oq/NQWX7PuD
 6axvFrqq3vULOfGLnw5m8NkUBEMn3RuV0ASePje52XHD+ZlnUoNTU3DI6Z07XrEcwIou
 Lsz4Xx5aB9WxY8575YUnu0L80/S+uBHiUNBvYF+nHoieRQR9jEZpORlRby6xmonP6fFO
 ecfeKM9O1lRtTlnuVoCt4wznJtv1IyobTt9PG/eNjlwc5BJ8+JSPm8HSimjQp45K8h3K
 6TmQ==
X-Gm-Message-State: APjAAAWbB/KsTH5rt10fg/gN59CpFlpvDd/zB5LZSdVgFlTLhwhCJcQu
 1g3fFt+rKAnrMoiaMThUpWkh2A==
X-Google-Smtp-Source: APXvYqw9vT20MMT3HUF7KxV6D/s8Y8R+aQrytDgCSBT5FL/Oh1YNqHNOkq72AWFQBYVLeAyoflJbBQ==
X-Received: by 2002:a7b:cb59:: with SMTP id v25mr4288117wmj.159.1574267749238; 
 Wed, 20 Nov 2019 08:35:49 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l4sm6956811wme.4.2019.11.20.08.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:35:48 -0800 (PST)
Date: Wed, 20 Nov 2019 17:35:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] vga: Fix Kconfig indentation
Message-ID: <20191120163546.GL30416@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
References: <20191120133327.6519-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120133327.6519-1-krzk@kernel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4fUPFIHSdVdO2uzRzyZ9JTr48DiWdw9H1oGUMfBPlq8=;
 b=gH/voLgqjfiTk2viiTaiNAjT1Ol4SHo9Jnz2I2LuyQqAiTMzaJcB0CncoVMdVYXwbz
 wjKhv0+TdFvu/Rx3liHLQ1aELDti2HmnkrQ1XU1kR0WSLbMUWOLoQDOFg8xNxMA3YfyF
 2goF2o0ukq8/MtqsPm3rxOMSkNNyoxIpiVWiA=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6MzM6MjdQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KClF1ZXVlZCBmb3Ig
NS42IGluIGRybS1taXNjLCB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCi1EYW5pZWwKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvdmdhL0tjb25maWcgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS92Z2Ev
S2NvbmZpZyBiL2RyaXZlcnMvZ3B1L3ZnYS9LY29uZmlnCj4gaW5kZXggYzhjNzcwYjA1ZWQ5Li4x
YWQ0YzRlZjBiNWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvdmdhL0tjb25maWcKPiArKysg
Yi9kcml2ZXJzL2dwdS92Z2EvS2NvbmZpZwo+IEBAIC0yOCw2ICsyOCw2IEBAIGNvbmZpZyBWR0Ff
U1dJVENIRVJPTwo+ICAJaGVscAo+ICAJICBNYW55IGxhcHRvcHMgcmVsZWFzZWQgaW4gMjAwOC85
LzEwIGhhdmUgdHdvIEdQVXMgd2l0aCBhIG11bHRpcGxleGVyCj4gIAkgIHRvIHN3aXRjaCBiZXR3
ZWVuIHRoZW0uIFRoaXMgYWRkcyBzdXBwb3J0IGZvciBkeW5hbWljIHN3aXRjaGluZyB3aGVuCj4g
LSAgICAgICAgICBYIGlzbid0IHJ1bm5pbmcgYW5kIGRlbGF5ZWQgc3dpdGNoaW5nIHVudGlsIHRo
ZSBuZXh0IGxvZ29mZi4gVGhpcwo+ICsJICBYIGlzbid0IHJ1bm5pbmcgYW5kIGRlbGF5ZWQgc3dp
dGNoaW5nIHVudGlsIHRoZSBuZXh0IGxvZ29mZi4gVGhpcwo+ICAJICBmZWF0dXJlIGlzIGNhbGxl
ZCBoeWJyaWQgZ3JhcGhpY3MsIEFUSSBQb3dlclhwcmVzcywgYW5kIE52aWRpYQo+ICAJICBIeWJy
aWRQb3dlci4KPiAtLSAKPiAyLjE3LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
