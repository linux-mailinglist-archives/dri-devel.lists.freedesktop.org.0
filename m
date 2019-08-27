Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F719F085
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 18:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A534189BBD;
	Tue, 27 Aug 2019 16:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CB089BBD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 16:44:15 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id x19so32170582eda.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=T4/dJTACRgyspP6PQrEfl3SMkEU0BRTMNnpAOcNAN9k=;
 b=XfVLFyNW3W9Np62VMEWgC1K9BB/zDc+AbwsjmM6P5oiKS/nWwf38nMmyAAV2Bos5iF
 DvNp0sEx9hCErolXcSdzilMMGxEg0SD7/I+Pars96Hw6ZNJTsGDTxt1nTYQsAuHAhAjk
 tn9XqyrMopNWZ7inkYVY1xQymdpe22CTGwd0X9n3/+YhLVxOqul1JFDs/1gNp26Zil4N
 W6e47YxeWTeIDglwQAUQBtk2vyjr9typAor/04IL7e3S5q5NedWiRyDzPW/pHz6q11e0
 gmcJ3JY/V0RgBh78mro1b/n7+tahWerkcRAJOlOKNsBOOo3qd989iMRBE6g1J/YmfphM
 eEtg==
X-Gm-Message-State: APjAAAVK7t9GmsQD+5oPcS7pQS1cImssflWBDOjYa4WQH3GALJiuQaZ5
 zdYPSRci8rz4VCFm2Zia5dYz+J0Y7722eA==
X-Google-Smtp-Source: APXvYqzGZWYGoQY3nS9VufjvpYmxU7hjhjBeufmUT4bsglP7TAQ2Nsm6LWhsAFqb4Pi6mCtsDOWt0g==
X-Received: by 2002:aa7:d813:: with SMTP id v19mr25334216edq.45.1566924253874; 
 Tue, 27 Aug 2019 09:44:13 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l27sm3498970ejd.31.2019.08.27.09.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 09:44:13 -0700 (PDT)
Date: Tue, 27 Aug 2019 18:44:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] drm/meson: add resume/suspend hooks
Message-ID: <20190827164411.GE2112@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20190827095825.21015-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827095825.21015-1-narmstrong@baylibre.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=T4/dJTACRgyspP6PQrEfl3SMkEU0BRTMNnpAOcNAN9k=;
 b=Fzqv4nQ+umzv/2+KsGP2IW6/1O7DBQCIYC2HmBh/Ixkm0qxY1XpDuoKgz+tncImxs7
 N7m7N3ReqRn0EeNNxHDIVftSZ9fXBGgZpadIxuWhZwJwT9VgxqDJeUZWp8QGR+pDw7jL
 MrGOVuuTzL+18NS2EevgZPTFpC6D+ugKy/n7k=
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
Cc: linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTE6NTg6MjNBTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gVGhpcyBzZXJpZSBhZGRzIHRoZSByZXN1bWUvc3VzcGVuZCBob29rcyBpbiB0aGUg
QW1sb2dpYyBNZXNvbiBWUFUgbWFpbiBkcml2ZXIKPiBhbmQgdGhlIERXLUhETUkgR2x1ZSBkcml2
ZXIgdG8gY29ycmVjdGx5IHNhdmUgc3RhdGUgYW5kIGRpc2FibGUgSFcgYmVmb3JlCj4gc3VzcGVu
ZCwgYW5kIHN1Y2Nlc2Z1bGx5IHJlLWluaXQgdGhlIEhXIHRvIHJlY292ZXIgZnVuY3Rpb25uYWwg
ZGlzcGxheQo+IGFmdGVyIHJlc3VtZS4KPiAKPiBUaGlzIHNlcmllIGhhcyBiZWVuIHRlc3RlZCBv
biBBbWxvZ2ljIEcxMkEgYmFzZWQgU0VJNTEwIGJvYXJkLCB1c2luZwo+IHRoZSBuZXdseSBhY2Nl
cHRlZCBWUlRDIGRyaXZlciBhbmQgdGhlIHJ0Y3dha2UgdXRpbGl0eS4KCk5vIGlkZWEgYWJvdXQg
dGhlIGh3LCBidXQgbG9va3MgYWxsIG5lYXRseSBpbnRlZ3JhdGVkIGludG8gcG0gc3R1ZmYsIHNv
IG9uCmJvdGggcGF0Y2hlczoKCkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgo+IAo+IE5laWwgQXJtc3Ryb25nICgyKToKPiAgIGRybS9tZXNvbjogZHdfaGRt
aTogYWRkIHJlc3VtZS9zdXNwZW5kIGhvb2tzCj4gICBkcm0vbWVzb246IGFkZCByZXN1bWUvc3Vz
cGVuZCBob29rcwo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgICAgIHwg
IDMyICsrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgfCAx
MTAgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMDggaW5z
ZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4yMi4wCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
