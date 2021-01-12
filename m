Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8AA2F3C39
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548118992E;
	Tue, 12 Jan 2021 22:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD7E8992E;
 Tue, 12 Jan 2021 22:18:47 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id o11so19466ote.4;
 Tue, 12 Jan 2021 14:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Od+zSJfKa4Z6aPePHWW0VtrqDCrKYYEC4JyNh+WdTnU=;
 b=eaKJmvWGEow921M6Fs9SwyrCmgpcNbnIFEkktGJvIy1+SiX/caWuAu+CIsUdj+I7fd
 cF9xeMUAjuK7ctMAoeszK2RRZRZU63n0KlRRZcg+SRvasrRk4NNe52n0agCFOYNEKPuT
 6pYPPvdhpBJbhHG93HVh6aVUJas1NCMXWRRhdXSRcl3uzhKU7Z7ISUOozq4GrG477Q14
 Z+sLX0BnpBeSze0hLoxk/RjIcU28zFNywARPxJ3m51PqUiiindxPmsRhKyK0plXwjWuT
 hkvYJeuUfMq+mk82Ma38oGtruJMmnQW4rMu5HHRmt1uF+n7NWHSZaRtHoHhn5C4Q2dHF
 z55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Od+zSJfKa4Z6aPePHWW0VtrqDCrKYYEC4JyNh+WdTnU=;
 b=ZZ/V3u+n4BkiD8BS+1HqBm6I8IhfZvhSxmd8A6O8smyzmwA5aaMELSm9kEUkVoYM/u
 og2z+axFCUwkovx3YbEs4TjdgEYhAWJcPuzE5A7PRy3QwDqAvyNRvIJlc2tdC162xyR6
 4oSDhymUqUnMp6RW3NX4zM5oPdkXqGr9CID/VfucYNLO61N/M+HGyZmWr9+j4NFa1jsW
 0KNg1YCfkabY/4b/r/X1IVGtSUQOzBv6HDrBVekH9640Z6nO91q2eC24nCOoVMoMVRDV
 +34LeoVlpN21G7H3N0GeySWXqpd4HQsSyKE7edhmH2Vj3jkJ+XFdrwZs0o7M7Tltm6pl
 DoJw==
X-Gm-Message-State: AOAM533JXFChRmlW0TRG2cy/qClzsbW7AaEtuUd7gr897jGZNUb8wfLA
 HN0amcQgyhrspt/+CVpzSEVJPgNzhZjxoeHjUpo=
X-Google-Smtp-Source: ABdhPJxRm1UAUowsFQsgEpfEUFrFqiLUYJb4jpm5M3vR60WksR0JiJ0iGdD/PaSerJLJl8UGHWh470g6qgC5EdXwh9Q=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr1022285otl.311.1610489926631; 
 Tue, 12 Jan 2021 14:18:46 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-21-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-21-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:18:34 -0500
Message-ID: <CADnq5_PkVSbEQJ+MBNTsYOrbAs0j5TYtiFvRUt00Dd4JqJnNgA@mail.gmail.com>
Subject: Re: [PATCH 20/40] drm/amd/display/dc/dce110/dce110_timing_generator:
 Remove unused variable 'value_crtc_vtotal'
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmM6IEluIGZ1bmN0aW9uIOKAmGRjZTExMF90
aW1pbmdfZ2VuZXJhdG9yX3RlYXJfZG93bl9nbG9iYWxfc3dhcF9sb2Nr4oCZOgo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfdGltaW5nX2dl
bmVyYXRvci5jOjEzNTQ6MTI6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHZhbHVlX2NydGNfdnRvdGFs
4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBDYzog
SGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3Vu
cGVuZy5saUBhbWQuY29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogQXJpYyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+Cj4g
Q2M6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgo+IENjOiBUb255IENoZW5nIDxU
b255LkNoZW5nQGFtZC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCgo+
IC0tLQo+ICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19n
ZW5lcmF0b3IuYyAgfCA1ICstLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
NCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yLmMKPiBpbmRleCAx
ZWE3ZGI4ZWViOTg4Li45YTZjNDExYmI3ZmU2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19nZW5lcmF0b3IuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19nZW5l
cmF0b3IuYwo+IEBAIC0xMzUxLDEwICsxMzUxLDcgQEAgdm9pZCBkY2UxMTBfdGltaW5nX2dlbmVy
YXRvcl90ZWFyX2Rvd25fZ2xvYmFsX3N3YXBfbG9jaygKPgo+ICAgICAgICAgLyogUmVzdG9yZSBE
Q1BfR1NMX1BVUlBPU0VfU1VSRkFDRV9GTElQICovCj4gICAgICAgICB7Cj4gLSAgICAgICAgICAg
ICAgIHVpbnQzMl90IHZhbHVlX2NydGNfdnRvdGFsOwo+IC0KPiAtICAgICAgICAgICAgICAgdmFs
dWVfY3J0Y192dG90YWwgPSBkbV9yZWFkX3JlZyh0Zy0+Y3R4LAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQ1JUQ19SRUcobW1DUlRDX1ZfVE9UQUwpKTsKPiArICAgICAgICAgICAg
ICAgZG1fcmVhZF9yZWcodGctPmN0eCwgQ1JUQ19SRUcobW1DUlRDX1ZfVE9UQUwpKTsKPgo+ICAg
ICAgICAgICAgICAgICBzZXRfcmVnX2ZpZWxkX3ZhbHVlKHZhbHVlLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMCwKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
