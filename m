Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6962C9287
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E5389BFB;
	Mon, 30 Nov 2020 23:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8116589BFB;
 Mon, 30 Nov 2020 23:30:07 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id z23so9425639oti.13;
 Mon, 30 Nov 2020 15:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+uMOErT0cr65Ou3LFaf1alFJAddt+nc1yJ4P5ZkXSgw=;
 b=LMadV/9nvicO3vvuQxDXRrBC3owXn1KVMb0n/9FSUeUSXXxAFqgyrzU+op51wl1Vdi
 tuiuZrBC3sYtPAjhwQfYRmBxmfa+KjeI8DzNShbDtwD4Lh1Y9GtYXCX/3CQShqsMikpQ
 XyW0OvZjiPIo15Vjcwbh/xvdxlVarywtmfqN93pwMwUdq9eJO+I85tdt6yMUYcyI8mUi
 ezti7BgLs+TNquwGZblzt4NR6ryiipnvp8Q+2KnYDFOUN8ZoVvRjrCh5v8R2SWQW4zxz
 NczWkjyxN6sd7jx9Ub/1lp12yiX6NfpBDETw3Dlp4ac/Qv3v3hTV+uyhc5OBwf3m2Lp5
 d+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+uMOErT0cr65Ou3LFaf1alFJAddt+nc1yJ4P5ZkXSgw=;
 b=Kdwp8Xw+cFOjEZDmGLh4DrR07vQX9z6+sr3X6sUzW6SkdtruvGl6Fp5ih8leSxBYyk
 s7zdT+nvECbdcCdhiSG3NNPFcuFuPjaIlnTOqnZu0R5A7RLozFYtexHM4EpWjvHcnhTr
 VPB5Rt0q25bVrb7CYR5ruM0yxz9Uoq2JE8b4C9wIpeZWLpxshwacm4klPJUzFbL0QO8l
 4usXTyGwXvaGaHaVpWgcYieC2+9kkDEBzzbxiZNX0JKe9nNHSQO1f24WiLdE05HfR8cZ
 TFYBzx/VCkZ1plbrCpguM2EzijkAt96DcC3P/MpIPyJ7Qtsv6GeBSIggwJgFozynYo36
 R17A==
X-Gm-Message-State: AOAM533GWJWtBeOCk8XkhR1U19wNdEVV7V3WFc7i2S31k2wa4Ss+L/MC
 mn3JEcL3eh6M7cwH+eYb+CqH38eXWT0HkvTiM2I=
X-Google-Smtp-Source: ABdhPJw5LXpVxlLKZYxswd9WOJd3cPpw3dpLYTRdEcrta+gSNUaFyxsqW4utb6G0ceYh4Wue0dZAs4TwjozVvV3CW54=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr19386387otf.132.1606779006892; 
 Mon, 30 Nov 2020 15:30:06 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-11-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-11-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 18:29:55 -0500
Message-ID: <CADnq5_Mt7gT6cYkvJLiZRr73p_C06qhJH7iCAnYyZ6pP8yYGvw@mail.gmail.com>
Subject: Re: [PATCH 10/40] drm/amd/pm/inc/pp_thermal: Mark
 'SMU7Thermal{WithDelay}Policy' as __maybe_unused
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
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0MyBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IFRoZXkgYXJlIHVzZWQgYnkgc29tZSBzb3VyY2UgZmlsZXMgd2hp
Y2ggaW5jbHVkZSBwcF90aGVybWFsLmgsIGJ1dCBub3QgYWxsLgo+Cj4gRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vcG0vaW5jL3BwX3RoZXJtYWwuaDoyODo0MTogd2FybmluZzog4oCYU01VN1Ro
ZXJtYWxXaXRoRGVsYXlQb2xpY3nigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNv
bnN0LXZhcmlhYmxlPV0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vaW5jL3Bw
X3RoZXJtYWwuaDoyODo0MTogd2FybmluZzog4oCYU01VN1RoZXJtYWxXaXRoRGVsYXlQb2xpY3ni
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vaW5jL3BwX3RoZXJtYWwuaDozNDo0MTogd2Fy
bmluZzog4oCYU01VN1RoZXJtYWxQb2xpY3nigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0v
aW5jL3BwX3RoZXJtYWwuaDozNDo0MTogd2FybmluZzog4oCYU01VN1RoZXJtYWxQb2xpY3nigJkg
ZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vaW5jL3BwX3RoZXJtYWwuaDozNDo0MTogd2Fybmlu
Zzog4oCYU01VN1RoZXJtYWxQb2xpY3nigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWNvbnN0LXZhcmlhYmxlPV0KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNv
bT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vaW5jL3BwX3RoZXJtYWwuaCB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vaW5jL3BwX3RoZXJtYWwuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG0vaW5jL3BwX3RoZXJtYWwuaAo+IGluZGV4IDNlMzA3NjhmOWUxY2MuLmY3YzQxMTg1MDk3ZTQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvcHBfdGhlcm1hbC5oCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvcHBfdGhlcm1hbC5oCj4gQEAgLTI1LDEz
ICsyNSwxMyBAQAo+Cj4gICNpbmNsdWRlICJwb3dlcl9zdGF0ZS5oIgo+Cj4gLXN0YXRpYyBjb25z
dCBzdHJ1Y3QgUFBfVGVtcGVyYXR1cmVSYW5nZSBTTVU3VGhlcm1hbFdpdGhEZWxheVBvbGljeVtd
ID0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBQUF9UZW1wZXJhdHVyZVJhbmdlIF9fbWF5YmVfdW51
c2VkIFNNVTdUaGVybWFsV2l0aERlbGF5UG9saWN5W10gPQo+ICB7Cj4gICAgICAgICB7LTI3MzE1
MCwgIDk5MDAwLCA5OTAwMCwgLTI3MzE1MCwgOTkwMDAsIDk5MDAwLCAtMjczMTUwLCA5OTAwMCwg
OTkwMDB9LAo+ICAgICAgICAgeyAxMjAwMDAsIDEyMDAwMCwgMTIwMDAwLCAxMjAwMDAsIDEyMDAw
MCwgMTIwMDAwLCAxMjAwMDAsIDEyMDAwMCwgMTIwMDAwfSwKPiAgfTsKPgo+IC1zdGF0aWMgY29u
c3Qgc3RydWN0IFBQX1RlbXBlcmF0dXJlUmFuZ2UgU01VN1RoZXJtYWxQb2xpY3lbXSA9Cj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgUFBfVGVtcGVyYXR1cmVSYW5nZSBfX21heWJlX3VudXNlZCBTTVU3
VGhlcm1hbFBvbGljeVtdID0KPiAgewo+ICAgICAgICAgey0yNzMxNTAsICA5OTAwMCwgOTkwMDAs
IC0yNzMxNTAsIDk5MDAwLCA5OTAwMCwgLTI3MzE1MCwgOTkwMDAsIDk5MDAwfSwKPiAgICAgICAg
IHsgMTIwMDAwLCAxMjAwMDAsIDEyMDAwMCwgMTIwMDAwLCAxMjAwMDAsIDEyMDAwMCwgMTIwMDAw
LCAxMjAwMDAsIDEyMDAwMH0sCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
