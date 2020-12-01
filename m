Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3C2C93A1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3FA89D8E;
	Tue,  1 Dec 2020 00:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6648D89D5C;
 Tue,  1 Dec 2020 00:07:05 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id o25so16277899oie.5;
 Mon, 30 Nov 2020 16:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vo+tRjj+TvDhpBanVcRgzaWE8EwPmtDQZF4FRG6eKXY=;
 b=FPTgQsr72ct5YMfbQd/8bBoOc+nJMAYfufnd3HIj9QUe2gLM61BxOMmyuBqkg8clWs
 2lb1FRal9GojomQUPxANgXhyF/SyB3mpOXycLHsqsjhqRUhNHuQ8IhDXjdPLpIlAgTXa
 9YY+r6WfnF+eOPm9fSvFjL3VXchzUskf2CHow610wWMXmILNaaZ/Wozb/bAhXmJ1jbPM
 yFt3o+zwpaHCsH/rV0r8fqbeibzGhKQHK4dBBU2wrfkkrXq/LzPfgpUGr/HpTWxSRa7l
 qznMH+MoBAl0k/yLcXdjI4VoDuvJk1aw/5eTl9L7Mi+l3x/ebEDdr7I5Z4/IDVEUAgBz
 etzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vo+tRjj+TvDhpBanVcRgzaWE8EwPmtDQZF4FRG6eKXY=;
 b=ZmprbPKtEkhquuTng7MVG5HgW0JE8g7wl++OeKWNdyXRO8WYTs9b9MNQET5I9iROw9
 03MfYjjO2baBGVAGfRodNQPbLueyQ6y8gRJv9QRZgGtrkZgqUjM8KHTfk5a28XUgV//D
 byyM47sPxJ+Et6PY5MbJsDjgd8fZWq8uM0bd9rxKZ1IUjPQt8xEfWlmcWyTdN7TSkNyA
 +/WaUu6iW7GEnWJho/lqyb9LEbmwwRWtW76F6BuzWgubQOqhEsn6usMc2nNumN2m7niT
 f4Agv9dEq8BDM+sgklvSIrom9Q0DmXGdjCCeXEvh9088ASZ4NMz+MHT0tjZ92uXBYv9C
 wPXw==
X-Gm-Message-State: AOAM532RypxaW54NjSL91P1hzmDHcVlFkhDa6fJpJLgKfx1CYBl1+NKk
 6z7KikBUeTj+6KvdVdzPQOVG6PkVhyE/6U+HdJw=
X-Google-Smtp-Source: ABdhPJwv19U5fZe9MwiHGKE6plwyHcsTtrydbT5iN+fr9a6dO/iWooI7CFtk+go/ABD8ulFVXGOZ9FMelO/POjnwE/s=
X-Received: by 2002:aca:f50e:: with SMTP id t14mr36785oih.123.1606781224826;
 Mon, 30 Nov 2020 16:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-40-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-40-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 19:06:53 -0500
Message-ID: <CADnq5_NBM_6Fz566zvFnW5X=s6NFhYM+eMx36sftjMRnNz6mPw@mail.gmail.com>
Subject: Re: [PATCH 39/40] drm/amd/display/dc/basics/fixpt31_32: Remove unused
 variable 'dc_fixpt_pi'
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0NCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
YmFzaWNzL2ZpeHB0MzFfMzIuYzoyOTozMjogd2FybmluZzog4oCYZGNfZml4cHRfcGnigJkgZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPgo+IENjOiBIYXJy
eSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5n
LmxpQGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+
IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvYmFzaWNzL2ZpeHB0MzFfMzIuYyB8IDEgLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9iYXNpY3MvZml4cHQzMV8zMi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2Jhc2ljcy9maXhwdDMxXzMyLmMKPiBpbmRleCA1OWYzNzU2MzcwNGFkLi4xNzI2YmRm
ODliYWU4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iYXNp
Y3MvZml4cHQzMV8zMi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jh
c2ljcy9maXhwdDMxXzMyLmMKPiBAQCAtMjYsNyArMjYsNiBAQAo+ICAjaW5jbHVkZSAiZG1fc2Vy
dmljZXMuaCIKPiAgI2luY2x1ZGUgImluY2x1ZGUvZml4ZWQzMV8zMi5oIgo+Cj4gLXN0YXRpYyBj
b25zdCBzdHJ1Y3QgZml4ZWQzMV8zMiBkY19maXhwdF9waSA9IHsgMTM0OTMwMzc3MDVMTCB9Owo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpeGVkMzFfMzIgZGNfZml4cHRfdHdvX3BpID0geyAyNjk4
NjA3NTQwOUxMIH07Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZml4ZWQzMV8zMiBkY19maXhwdF9s
bjIgPSB7IDI5NzcwNDQ0NzFMTCB9Owo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpeGVkMzFfMzIg
ZGNfZml4cHRfbG4yX2Rpdl8yID0geyAxNDg4NTIyMjM2TEwgfTsKPiAtLQo+IDIuMjUuMQo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
