Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A172AE26C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD0F89CB5;
	Tue, 10 Nov 2020 22:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B247589CB5;
 Tue, 10 Nov 2020 22:01:32 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 19so3168985wmf.1;
 Tue, 10 Nov 2020 14:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qTpDe0/GgwmVIzYLbElPb7L7arHjRFtBiplih2oclJ0=;
 b=B6ZWARGY3lsVCwD5HBUd05aGlLnn/C7FD6J0fr+iMnG2GZZq+i8ZQXVFN79zr+W6Mf
 Ft4xCJu+ZSOQjtGvTPuDtk4QrKOWewMbMOL0YLnmxlsEXDml/p963wzIEs9cOho3HMVS
 x77Y0/1eSmIHUZ8xmuJJHkGh1Ql1v+zzqOIs7Azgbi5e6qNjLRlD8vvFN8zJoTXcARLa
 GeQggMx5mpA01/JvqxIBCbnSSTBopR2RpIu2aeGLYBdJGEaEl0KbWPh3+9TX53caW4yo
 Wwx44l/ENwrWS4ag34RvoW2bI144bNfFEZudwcrUawbljLIqGPatSL3nY+OxEbRbmkRK
 c2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qTpDe0/GgwmVIzYLbElPb7L7arHjRFtBiplih2oclJ0=;
 b=ZzSXrq0XxVLlDJgvcR8VNkTT1D0EAE8b1BL31ZIa8Tbptcw+gVG7VitVqM1Rv8iEx/
 eq17M21pFWwmFBODAMjtCZO/1e2Mo5SEF7IXyn1OrKHwUiHH3WKH7QYIWQjZT0EPcF/o
 C7PT6QozvxHrGEDoGz1bHGuglnxPaNltsyZGR/GZNxUoxL0rb8FmJJg539cEPzl9BFmy
 OW9pGVshMVNMkht+gF05fB3OzZBfS7X+KflZ9HUP7MxYVNJbGLqnY7KB9eEFKRjXz/k6
 j4/tUGYPPRBgszpzf37tBgR7MBQxO1T0ZuMRg3S2hglPo7c8uy+ew3n9kvnncXAMX6MR
 TATA==
X-Gm-Message-State: AOAM532bmiGe7ekpAT4QERDvpq/shxLt9XY9WmuKw6PRcNsgxKwGVUGA
 PPAAeMDbSGN/j1OHAY5Z98as7RIeqKE+fmbrHnC8n7ec
X-Google-Smtp-Source: ABdhPJwKNw5JpBBAYWu5BZXxS+DNFZ94YS2hrzsr+ku6Hb5U1ENXppyhMmDWDQW2lx4JGYFinXlUPM6oE4CdsyzeYM0=
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr196270wmd.73.1605045691426; 
 Tue, 10 Nov 2020 14:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-19-lee.jones@linaro.org>
In-Reply-To: <20201106214949.2042120-19-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:01:19 -0500
Message-ID: <CADnq5_PKPiD5DOTCYgzDN8TJvb_PF0B+3bYC31qnaXSoCaoz5w@mail.gmail.com>
Subject: Re: [PATCH 18/19] drm/radeon/atombios_crtc: Remove description of
 non-existent function param 'encoder'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgNiwgMjAyMCBhdCA0OjUwIFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19jcnRjLmM6MTc5
Njogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnZW5jb2RlcicgZGVzY3JpcHRp
b24gaW4gJ3JhZGVvbl9nZXRfc2hhcmVkX25vbmRwX3BwbGwnCj4KPiBDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBw
bGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRv
bWJpb3NfY3J0Yy5jIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19jcnRjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b21iaW9zX2NydGMuYwo+IGluZGV4IDkxODExNzU3MTA0YzAu
LjE5NzllZDNkNjU0NzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9t
Ymlvc19jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b21iaW9zX2NydGMu
Ywo+IEBAIC0xNzg3LDcgKzE3ODcsNiBAQCBzdGF0aWMgaW50IHJhZGVvbl9nZXRfc2hhcmVkX2Rw
X3BwbGwoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICAgKiByYWRlb25fZ2V0X3NoYXJlZF9ub25k
cF9wcGxsIC0gcmV0dXJuIHRoZSBQUExMIHVzZWQgYnkgYW5vdGhlciBub24tRFAgY3J0Ywo+ICAg
Kgo+ICAgKiBAY3J0YzogZHJtIGNydGMKPiAtICogQGVuY29kZXI6IGRybSBlbmNvZGVyCj4gICAq
Cj4gICAqIFJldHVybnMgdGhlIFBQTEwgKFBpeGVsIFBMTCkgdXNlZCBieSBhbm90aGVyIG5vbi1E
UCBjcnRjL2VuY29kZXIgd2hpY2ggY2FuCj4gICAqIGJlIHNoYXJlZCAoaS5lLiwgc2FtZSBjbG9j
aykuCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
