Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3A91040E6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6D76E8F0;
	Wed, 20 Nov 2019 16:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC736E8F1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 16:36:48 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c22so312829wmd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 08:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=tesw3sq2dFVfQE6pmhyrzRi4mLidJzG8GCQ0JteIIRE=;
 b=l0Ok6pJ9700TAx5SPg+UAuIXsTkvHFGPi1q8FRpZ5zkj/VvpcoOb8P3mbVcsOsdPF1
 5sslsFIYg3sfirVGvV9MOOieLfrSPtB9F+TUkA/ckmrabUP6AAcE8/R4ZvSoThT9dk8V
 Ek0d623J8Se0eGVJtkyqrwWavbKkAgLngvLQ/zSJmkfqstcGX6yIpncwfIN0j0RqWDAc
 +s26/j1PUxSvJNf3rBtBkm7xue8WCxMPgV12QSVHKMFtHy95/VlH7YRCW6qMcB51fzDb
 nJGAseRpRQynLjKk6ipkksD5xFNycfMvK/Sy0dqZBhwozBDFZrsdT2LUSOlGpWtmP5xE
 +fpw==
X-Gm-Message-State: APjAAAVLjZKE4uurC4t6hrdyVFA2g0Rbqa8Kntlf9k7Nj7UtgaAviFIf
 ECRQHAbiaq+wkubUtYTSSbe1tA==
X-Google-Smtp-Source: APXvYqwrPubNXX8yGAPcnC9X0GNh3U53hk3U8rLobGyGtHY/2ZK1eXIvpY5fLmaxi+5jpeb51T2FsA==
X-Received: by 2002:a7b:cf05:: with SMTP id l5mr4550515wmg.44.1574267806819;
 Wed, 20 Nov 2019 08:36:46 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g5sm7278951wma.43.2019.11.20.08.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:36:46 -0800 (PST)
Date: Wed, 20 Nov 2019 17:36:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] drm/rockchip: Fix Kconfig indentation
Message-ID: <20191120163644.GN30416@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20191120133348.6640-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120133348.6640-1-krzk@kernel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tesw3sq2dFVfQE6pmhyrzRi4mLidJzG8GCQ0JteIIRE=;
 b=F7HHpENW/MM6F+QovxPoI6sD3Q9wtMmI6R6dM0bwlSguWpp1dqIM349WqcCRZu+Ce/
 xR2k/uEyP92duYLa1gM6Nay/ZhmL1TIAV4PFaefUAcdv3x2XPhuzYyCaphD0yChAMbfG
 vx5JWEzsgxHGZFMh86C1dpXAPEIMGmgSSS52g=
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
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6MzM6NDhQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KClF1ZXVlZCBmb3Ig
NS42IGluIGRybS1taXNjLCB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCi1EYW5pZWwKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL0tjb25maWcgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL0tjb25maWcKPiBpbmRleCA2ZjQyMjJmOGJlZWIuLjE2NzBhNWNhZTNjNyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9LY29uZmlnCj4gQEAgLTI4LDE3ICsyOCwxNyBAQCBjb25maWcgUk9DS0NI
SVBfQU5BTE9HSVhfRFAKPiAgCSAgb24gUkszMjg4IG9yIFJLMzM5OSBiYXNlZCBTb0MsIHlvdSBz
aG91bGQgc2VsZWN0IHRoaXMgb3B0aW9uLgo+ICAKPiAgY29uZmlnIFJPQ0tDSElQX0NETl9EUAo+
IC0gICAgICAgIGJvb2wgIlJvY2tjaGlwIGNkbiBEUCIKPiArCWJvb2wgIlJvY2tjaGlwIGNkbiBE
UCIKPiAgCWRlcGVuZHMgb24gRVhUQ09OPXkgfHwgKEVYVENPTj1tICYmIERSTV9ST0NLQ0hJUD1t
KQo+IC0gICAgICAgIGhlbHAKPiArCWhlbHAKPiAgCSAgVGhpcyBzZWxlY3RzIHN1cHBvcnQgZm9y
IFJvY2tjaGlwIFNvQyBzcGVjaWZpYyBleHRlbnNpb25zCj4gIAkgIGZvciB0aGUgY2RuIERQIGRy
aXZlci4gSWYgeW91IHdhbnQgdG8gZW5hYmxlIERwIG9uCj4gIAkgIFJLMzM5OSBiYXNlZCBTb0Ms
IHlvdSBzaG91bGQgc2VsZWN0IHRoaXMKPiAgCSAgb3B0aW9uLgo+ICAKPiAgY29uZmlnIFJPQ0tD
SElQX0RXX0hETUkKPiAtICAgICAgICBib29sICJSb2NrY2hpcCBzcGVjaWZpYyBleHRlbnNpb25z
IGZvciBTeW5vcHN5cyBEVyBIRE1JIgo+IC0gICAgICAgIGhlbHAKPiArCWJvb2wgIlJvY2tjaGlw
IHNwZWNpZmljIGV4dGVuc2lvbnMgZm9yIFN5bm9wc3lzIERXIEhETUkiCj4gKwloZWxwCj4gIAkg
IFRoaXMgc2VsZWN0cyBzdXBwb3J0IGZvciBSb2NrY2hpcCBTb0Mgc3BlY2lmaWMgZXh0ZW5zaW9u
cwo+ICAJICBmb3IgdGhlIFN5bm9wc3lzIERlc2lnbldhcmUgSERNSSBkcml2ZXIuIElmIHlvdSB3
YW50IHRvCj4gIAkgIGVuYWJsZSBIRE1JIG9uIFJLMzI4OCBvciBSSzMzOTkgYmFzZWQgU29DLCB5
b3Ugc2hvdWxkIHNlbGVjdAo+IC0tIAo+IDIuMTcuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
