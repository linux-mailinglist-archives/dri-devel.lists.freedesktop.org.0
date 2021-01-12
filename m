Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8566A2F3C40
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EA989A9B;
	Tue, 12 Jan 2021 22:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E6A89A91;
 Tue, 12 Jan 2021 22:21:15 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id f132so4034174oib.12;
 Tue, 12 Jan 2021 14:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l7Y0duFp1C4lw+E+Nzfmj0+WgSI2yLq1yZ1r2Jd4oJQ=;
 b=nXbX9TIhOYo3owiFsiD4pDz/CGmBtv7vaR2Mr+twRXbhbA0/4xxNTkQpUYKr0Rx7FW
 KAUTGT42Qi0G1N1/3m3N3JW+uAHGoEWyGL0slDq3UCUpVLuZcpWitXD92husg/0kG9My
 jFUc6upfUIU+tF8JDpXeT16C0fsJNYxBXCFlG/ALJUUNVl76wDgQAICTL813QulIpgz2
 f5JEAmCjmIxGzkIYR/cqgR9LLCLw4HPDQRB7NiSanJnpOhf50Spx4VMmtHCGLdE0T7HE
 4LAJ/6pc4aNGuZ9UkhJ+2yjQRuqMhl8WhECtubae+pnBfIqzr2vBml5UW+NNTiVF5pSr
 su3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l7Y0duFp1C4lw+E+Nzfmj0+WgSI2yLq1yZ1r2Jd4oJQ=;
 b=XtbiYQL+C0YTZebS2OK1e+8Y/h5cXwSDSSLOTTNe3zgLb6Xct7+Fmtvat0xZwWhXKv
 7mObrqMFw5+7foPVQtV+8csUBO/4WbQhYM5siM3kNzjqVJXinHgVimTmuGhcgl76vBb7
 Zvo4GyaIQzv3jf7AHzpCuAmjcLYXl6XKQovJcgZYFz0fK8F/W3I+raJx9T1vOqWzh2sE
 5V3BwO7vjmEtLQZgpLtTLkXN2AgnY11GwyCHXXng3YxUJoVl97IAvZIaUnXuBcbgrfGV
 e6z5JkMrR2EwHvEPLSiC5Rd/fV6azDyWM+CQkAimFY49BIkGCIK0TerUhLjWRwKui/VA
 8DEA==
X-Gm-Message-State: AOAM5336tUf2aS75Btg+hrUXtNM54JWFMEOBHFldj63cJ02umpky8RgB
 +lVhXeSyFqt2YOUTCWNcBywnCpE0okXoUlfiAw0=
X-Google-Smtp-Source: ABdhPJxc5anMDvnjB+DYgVroZJaGh8IVQ/N4EE42+1GEuf5KCxPaap0rjwGvZsYy5PBdgItNxBVoosG7fY3rOW6L+Qo=
X-Received: by 2002:a54:4083:: with SMTP id i3mr812054oii.120.1610490075337;
 Tue, 12 Jan 2021 14:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-23-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-23-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:21:03 -0500
Message-ID: <CADnq5_MddJZ8EFERTXZp8OfzZxmyHaevd9PZ9VhB+29N557O9g@mail.gmail.com>
Subject: Re: [PATCH 22/40] drm/amd/display/dc/dce110/dce110_hw_sequencer:
 Demote non-conformant kernel-doc header
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

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYzoxNjM5OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3IgbWVtYmVyICdkYycgbm90IGRlc2NyaWJlZCBpbiAnZGNlMTEwX2VuYWJsZV9hY2Nl
bGVyYXRlZF9tb2RlJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2Rj
L2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmM6MTYzOTogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAnY29udGV4dCcgbm90IGRlc2NyaWJlZCBpbiAnZGNlMTEwX2VuYWJs
ZV9hY2NlbGVyYXRlZF9tb2RlJwo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
PgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVl
bmNlci5jCj4gaW5kZXggNGMyMzBmMWRlOWEzMC4uYzU3NDA1ZmE0YmViYyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5j
ZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEw
X2h3X3NlcXVlbmNlci5jCj4gQEAgLTE2MjgsNyArMTYyOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZGNf
bGluayAqZ2V0X2VkcF9saW5rX3dpdGhfc2luaygKPiAgICAgICAgIHJldHVybiBsaW5rOwo+ICB9
Cj4KPiAtLyoqCj4gKy8qCj4gICAqIFdoZW4gQVNJQyBnb2VzIGZyb20gVkJJT1MvVkdBIG1vZGUg
dG8gZHJpdmVyL2FjY2VsZXJhdGVkIG1vZGUgd2UgbmVlZDoKPiAgICogIDEuIFBvd2VyIGRvd24g
YWxsIERDIEhXIGJsb2Nrcwo+ICAgKiAgMi4gRGlzYWJsZSBWR0EgZW5naW5lIG9uIGFsbCBjb250
cm9sbGVycwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
