Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118DA2F3C12
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9774789798;
	Tue, 12 Jan 2021 22:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398A789686;
 Tue, 12 Jan 2021 22:01:14 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id q25so3812400otn.10;
 Tue, 12 Jan 2021 14:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uDgXaAc7GjnI10LhfsoqNmXSnUmmiZemrpWcOnIj94I=;
 b=M3RVDzYrqIP3u6OHFrOxpLkodlzSq3MDQx6G7IroukGaiphYRgkCtzdK/8Nva5+wNd
 oKtJUrjMYopz1EY0gMjb93n2sKyRcWtFUoVAh+0LvfjlFPxyXuusuDV8/UqEj7/VYM0G
 1YiqDM7CkiZHOvD7u5nIL627APi57ywnlAkIGJIV0d7RVFZzpBnIgTH2SgFuax6yJOjm
 crjYamCIy7B8edeijbnzNnCSua5/9aEfF0FqdCI/v47z+xtugFO/rNwI/T9qI36kI+PF
 J5czcwkvuUdCW3g3E7vMYdgJhsh/xqx3PBfzqhOF3VRZz3MKAc9D/W+Z7JH/8mkZIsha
 K6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uDgXaAc7GjnI10LhfsoqNmXSnUmmiZemrpWcOnIj94I=;
 b=i7Mmbm2m89458VeAs/wHbbhUS8eRgrYTqEbeSNkKPrtse/UuqYMv6c9//caBEL7I9L
 6wCJh5u7buf1BgKThFTSJtNSPJob1XqdDbXa+SZkLOmsf3Vw9795G91mv+ThwgTzIA/X
 EJBhhxSOMHY0IKYVyae6Mb9qaz/dHYc5xBBML8eEnmuF6zCRQ90WQg96LzwZs9HFBzlM
 Tpo8Ao+twvY2DkaHZ7CVYk/Je39s4qK/ZruSXnOXmGWUgHh2eT+UxqffLdmb0f8qccyw
 lgfDF4gYLRt+6iRoTc+6WRh2b7pW9r1I6zBv1iv9F6SCmJ4wrBPTSBbCl4pwfcTnZdse
 wM9w==
X-Gm-Message-State: AOAM530VCLf0xQijOOTmXj/b2jcNJziM7FmRiMQBAl3v3tEph5rCjGpo
 Or3oV6EJiteLOcVChTvckvrJ1cCqREYOrdXInNA=
X-Google-Smtp-Source: ABdhPJyyLnlZ0c/XFzX5hhTiscgmlUWNQdxYsP5RXf3GqkaPaFyUpzym8bAFtc+UJlYAi8PpkiijKyvYHrZZ/hdhau4=
X-Received: by 2002:a9d:2ac2:: with SMTP id e60mr993699otb.23.1610488873181;
 Tue, 12 Jan 2021 14:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-6-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-6-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:01:02 -0500
Message-ID: <CADnq5_P16YPwTUOQMLSbRcM54Wy1yCjO=fiinOwOFmkkV_gd5w@mail.gmail.com>
Subject: Re: [PATCH 05/40] drm/amd/display/dc/dce/dce_transform: Demote
 kernel-doc abuse
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoxOSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IFRoZSBoZWFkZXIgZG9lc24ndCBwcm92aWRlIGFueSBhZGRpdGlv
bmFsIHBhcmFtZXRlciBkZXNjcmlwdGlvbnMuCj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBr
ZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9kaXNwbGF5L2RjL2RjZS9kY2VfdHJhbnNmb3JtLmM6MTEwNDogd2FybmluZzogQ2Fubm90IHVu
ZGVyc3RhbmQgICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhh
cnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+
IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBDYzogTWF1cm8gUm9zc2kgPGlzc29yLm9ydWFtQGdtYWlsLmNvbT4KPiBDYzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpB
cHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZS9kY2VfdHJhbnNmb3JtLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX3RyYW5zZm9ybS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZS9kY2VfdHJhbnNmb3JtLmMKPiBpbmRleCA2MTIxYmI3YjAwOWI4Li5h
YmJhYTZiMGIyZGI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX3RyYW5zZm9ybS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2VfdHJhbnNmb3JtLmMKPiBAQCAtMTEwMCw3ICsxMTAwLDcgQEAgc3RhdGljIHZv
aWQgcHJvZ3JhbV9nYW11dF9yZW1hcCgKPgo+ICB9Cj4KPiAtLyoqCj4gKy8qCj4gICAqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKgo+ICAgKiAgRnVuY3Rpb246IGRhbF90cmFuc2Zvcm1fd2lkZV9nYW11dF9z
ZXRfZ2FtdXRfcmVtYXAKPiAgICoKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
