Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E4B14C22B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 22:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637DE6F422;
	Tue, 28 Jan 2020 21:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD2A6F422
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 21:24:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c9so17795144wrw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 13:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D5AZ+KHDe1ZFmd6svZ9H6oX/QmvepdGXChmNe0lp0fY=;
 b=td5hqFS4v5qy5kwhKt1LKGz0z/eFnaM13/HBfyTtZY+VsTyOooZXJTyiil5kT1/UUt
 BQd1BlA5NvHuFhdn7LoGxgBoWsA0FoxNBP0HgzmQh0yYRiRXv44XOZuz7rHFBoei2h39
 KavwTOScJ/EOYi2ooalYRdWBOc26VhqdPEPCIMecOXKIVUuT588SCJ+aRg20OC5sIZbd
 rwTkE3Ay/rXomzbHGpcbIshd0t2HFHCdG97K8GW/qs7wx5CSl1ZbwyP9UAM17NK3ITLp
 IQj6a7vHRGgBiCAXI0fsTtCbhPKw8J4nNJUK84L7gsFYAwOFI49xTNGOm7lAS/2YL3KN
 m3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D5AZ+KHDe1ZFmd6svZ9H6oX/QmvepdGXChmNe0lp0fY=;
 b=B+xe+cfLdeXKPhjwlT3zYF8oSWs+YwNVtC+Q/X0nrJRRi3XszjqbqXn1qJGJBQ4vBn
 +hCCpgi+Y3YZteWHfQzxBVaxui1sWqIQOzD79bxUmBRzYMHUwkjSBIXLioLBG4S/e0kR
 YdHDKhf9posUGlwO/2Kt2d/Fr7m4NQTy58f1mZPydkYfqvX6FNeKhbseffAgIQ0AviH+
 57TLCHcX4ZxULWSBrYI35jcdrhXKPSc7UzpwJRjzNHgkh+pFvzc0CeZVbWAUjLy2RqEX
 8XjWABpCU81Tj0gsAlkUOM4wvVq6ZJeEhLEIBnfhRbMU8F+Ax96yVTueFPxmbLVVHQJw
 VOCg==
X-Gm-Message-State: APjAAAWLXhSiwvCl7gDlNeAC+QHpPyAWnKHLEudgIRRCCoiOPgs5c/ed
 eveuRWsg6aUPFbpafuTtGm+ikjaklSnnRNZWTs4=
X-Google-Smtp-Source: APXvYqyPpmkBwuCzL1tg0C0C6v4joc2KNmQ1UUzcm7OadB4SSNYwP4cpnVDkjsJ2bPV7hwBh6xOpZMwPeD7WSFLf64M=
X-Received: by 2002:a05:6000:1183:: with SMTP id
 g3mr2461057wrx.374.1580246671079; 
 Tue, 28 Jan 2020 13:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20200128160952.1628146-1-daniel.vetter@ffwll.ch>
 <CADnq5_PhFRASAC62axW9yV_Dq96NonNkw_nvjmRffUYMJa3xCQ@mail.gmail.com>
In-Reply-To: <CADnq5_PhFRASAC62axW9yV_Dq96NonNkw_nvjmRffUYMJa3xCQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Jan 2020 16:24:19 -0500
Message-ID: <CADnq5_PADDMf+W6hzVSogJn5h-ge2cXt41bjWEpPOq-3eqXWfg@mail.gmail.com>
Subject: Re: [PATCH] radeon: insert 10ms sleep in dce5_crtc_load_lut
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgNDoyMSBQTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEphbiAyOCwgMjAyMCBhdCAxMToxMCBBTSBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBQZXIg
YXQgbGVhc3Qgb25lIHRlc3RlciB0aGlzIGlzIGVub3VnaCBtYWdpYyB0byByZWNvdmVyIHRoZSBy
ZWdyZXNzaW9uCj4gPiBpbnRyb2R1Y2VkIGZvciBzb21lIHBlb3BsZSAoYnV0IG5vdCBhbGwpIGlu
Cj4gPgo+ID4gY29tbWl0IGI4ZTJiMDE5OWNjMzc3NjE3ZGMyMzhmNTEwNjM1MmMwNmRjZDNmYTIK
PiA+IEF1dGhvcjogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KPiA+IERhdGU6ICAgVHVl
IEp1bCA0IDEyOjM2OjU3IDIwMTcgKzAyMDAKPiA+Cj4gPiAgICAgZHJtL2ZiLWhlbHBlcjogZmFj
dG9yIG91dCBwc2V1ZG8tcGFsZXR0ZQo+ID4KPiA+IHdoaWNoIGZvciByYWRlb24gaGFkIHRoZSBz
aWRlLWVmZmVjdCBvZiByZWZhY3RvcmluZyBvdXQgYSBzZWVtaW5nbHkKPiA+IHJlZHVkYW50IHdy
aXRpbmcgb2YgdGhlIGNvbG9yIHBhbGV0dGUuCj4gPgo+ID4gMTBtcyBpbiBhIGZhaXJseSBzbG93
IG1vZGVzZXQgcGF0aCBmZWVscyBsaWtlIGFuIGFjY2VwdGFibGUgZm9ybSBvZgo+ID4gZHVjdC10
YXBlLCBzbyBtYXliZSB3b3J0aCBhIHNob3QgYW5kIHNlZSB3aGF0IHN0aWNrcy4KPiA+Cj4gPiBD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+ID4gQ2M6IE1pY2hl
bCBEw6RuemVyIDxtaWNoZWwuZGFlbnplckBhbWQuY29tPgo+ID4gUmVmZXJlbmNlczogaHR0cHM6
Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0xOTgxMjMKPiA+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+Cj4gV29ya3Mg
Zm9yIG1lLiAgQXBwbGllZC4gIFRoYW5rcyEKCkFjdHVhbGx5LCB0aGlua2luZyBhYm91dCB0aGlz
IG1vcmUsIEkgd29uZGVyIGlmIHRoaXMgd2lsbCBoYXZlIGFkdmVyc2UKYWZmZWN0cyBvbiBzdHVm
ZiB0aGF0IG1lc3NlcyB3aXRoIHRoZSBMVVQgbGlrZSB2YXJpb3VzIGZhZGUgZWZmZWN0cyBpbgpj
b21wb3NpdG9ycy4gIEkgZ3Vlc3Mgd2UgY2FuIGNyb3NzIHRoYXQgYnJpZGdlIHdoZW4gd2UgZ2V0
IHRvIGl0LgoKQWxleAoKCj4KPiBBbGV4Cj4KPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZGlzcGxheS5jIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5j
Cj4gPiBpbmRleCAzNTQ3NTZlMDBmZTEuLmQwN2M3ZGIwYzgxNSAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYwo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jCj4gPiBAQCAtMTI3LDYgKzEyNyw4IEBAIHN0
YXRpYyB2b2lkIGRjZTVfY3J0Y19sb2FkX2x1dChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gPgo+
ID4gICAgICAgICBEUk1fREVCVUdfS01TKCIlZFxuIiwgcmFkZW9uX2NydGMtPmNydGNfaWQpOwo+
ID4KPiA+ICsgICAgICAgbXNsZWVwKDEwKTsKPiA+ICsKPiA+ICAgICAgICAgV1JFRzMyKE5JX0lO
UFVUX0NTQ19DT05UUk9MICsgcmFkZW9uX2NydGMtPmNydGNfb2Zmc2V0LAo+ID4gICAgICAgICAg
ICAgICAgKE5JX0lOUFVUX0NTQ19HUlBIX01PREUoTklfSU5QVVRfQ1NDX0JZUEFTUykgfAo+ID4g
ICAgICAgICAgICAgICAgIE5JX0lOUFVUX0NTQ19PVkxfTU9ERShOSV9JTlBVVF9DU0NfQllQQVNT
KSkpOwo+ID4gLS0KPiA+IDIuMjQuMQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
