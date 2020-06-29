Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF3220CCD9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 08:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B516E41A;
	Mon, 29 Jun 2020 06:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B29D89FE6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 04:43:49 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f8so4226091ljc.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 21:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G67XglocsFCULDVFlZz25+muwRgmWctY4sNf3EyvSFo=;
 b=pkwHyKQp1TekcwUwGxfEpYgbDqDUe9BCxsmDq6yK3K7e9BKJu+UeVjD8ZjsTMmdh0B
 74Xb6DKkoco64a+pK1fivAYYnrHbCq1FlOkb5CtFHNyF/5Ao+1FszWk9dImCxgBaYN6X
 k+ua5hVlOJOrN/BG5Hq8wExJd4RUzK5QeFH02Ks82XgQW/cvBFNwDNWkGCvJgrfxfjij
 wt1eYpoTKq5NZrDO2meE1y7ntOYXYijrAUbFPQlfuNr18dpFMpXqiI06Xq8iCGFvc3nh
 zUxUflUyRuz8TQAvV54uluIqwAoZMovFtPqoFaTLqmCA9LlCMLL3FOhIo9pfxdHFh74w
 LVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G67XglocsFCULDVFlZz25+muwRgmWctY4sNf3EyvSFo=;
 b=d6eVvNDcO9cWm/4cxcHHsflo4K6Sif0OWrqfMtONy1JEh5zMCuVOqZtURHdIxUeRRO
 taqjnUT0j3wjgr3SyGjZvikKuCbM7/yLgk1LJQOcbT8UvxmNhS9zKnKOLJPOuBmHhDLR
 UGFt3il8vaLZ40VG3ToPrv8zFIt7GumClrxgYcX+HJU9BGxywf/apWBqd3RMGfm4re5T
 0E9BBoww2JaueLqypLfGheKUQLD/xEFvrM1uRmU7d2lW9vpChV0KeY2MUwcWHA2AlQoR
 rgYzzFjpwjv+sMxMmz40r4pYU5pDONp0/UMyauNRrs0vLgj/+Em99v6XtznrDSTzb3kA
 Axsw==
X-Gm-Message-State: AOAM530ihGItwEVeojimYkJbqqS1LfzrQ05Ye942pbajv7i+ToUw71kO
 VcAASILhDAQBLKBJwbC5oF+Qs4ayEkM=
X-Google-Smtp-Source: ABdhPJzNgsK1K7TgW7QDtCKTG2X6rC6uZ77p0Lin1O779ofdgBoRD5gkdECDnLNaYQZu8wY9H1f1wg==
X-Received: by 2002:a2e:b88f:: with SMTP id r15mr267417ljp.355.1593405827995; 
 Sun, 28 Jun 2020 21:43:47 -0700 (PDT)
Received: from dimatab (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id y26sm3623601ljm.46.2020.06.28.21.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 21:43:47 -0700 (PDT)
Date: Mon, 29 Jun 2020 07:43:40 +0300
From: Dmitry Osipenko <digetx@gmail.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: panel: simple: Drop drive/sample bus flags for
 LVDS panels
Message-ID: <20200629074340.11b427cc@dimatab>
In-Reply-To: <20200628075401.10975-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200628075401.10975-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jun 2020 06:50:54 +0000
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
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Pascal Roeleven <dev@pascalroeleven.nl>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

0JIgU3VuLCAyOCBKdW4gMjAyMCAxMDo1NDowMSArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4g0L/QuNGI0LXRgjoKCj4gVGhl
IERSTSBidXMgZmxhZ3MgcmVwb3J0aW5nIG9uIHdoaWNoIGNsb2NrIGVkZ2UgdGhlIHBpeGVsIGRh
dGEgYW5kCj4gc3luYyBzaWduYWxzIGFyZSBzYW1wbGVkIG9yIGRyaXZlbiBkb24ndCBtYWtlIHNl
bnNlIGZvciBMVkRTIHBhbmVscywKPiBhcyB0aGUgYnVzIHRoZW4gdXNlcyBzdWItY2xvY2sgdGlt
aW5ncyB0byBzZW5kIGRhdGEuIERyb3AgdGhvc2UgZmxhZ3MKPiBhbmQgYWRkIGEgd2FybmluZyBp
biB0aGUgcHJvYmUgZnVuY3Rpb24gdG8gbWFrZSBzdXJlIHRoZSBtaXN0YWtlCj4gd29uJ3QgYmUg
cmVwZWF0ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydAo+IDxsYXVyZW50
LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDMwCj4gKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LSAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTIKPiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgaW5kZXgKPiBiZmYxY2FiNTI5ZDIu
LjUzN2Q3NWVmN2ZjMiAxMDA2NDQgLS0tCj4gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2ltcGxlLmMgKysrCj4gYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgQEAg
LTU0OSw2ICs1NDksMTQgQEAgc3RhdGljCj4gaW50IHBhbmVsX3NpbXBsZV9wcm9iZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjCj4gKmRlc2MpIHBhbmVsX3NpbXBs
ZV9wYXJzZV9wYW5lbF90aW1pbmdfbm9kZShkZXYsIHBhbmVsLCAmZHQpOyB9Cj4gIAo+ICsJaWYg
KGRlc2MtPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTKQo+ICsJCS8q
IENhdGNoIGNvbW1vbiBtaXN0YWtlcyBmb3IgTFZEUyBwYW5lbHMuICovCj4gKwkJV0FSTl9PTihk
ZXNjLT5idXNfZmxhZ3MgJgo+ICsJCQkoRFJNX0JVU19GTEFHX1BJWERBVEFfUE9TRURHRSB8Cj4g
KwkJCSBEUk1fQlVTX0ZMQUdfUElYREFUQV9ORUdFREdFIHwKPiArCQkJIERSTV9CVVNfRkxBR19T
WU5DX1BPU0VER0UgfAo+ICsJCQkgRFJNX0JVU19GTEFHX1NZTkNfTkVHRURHRSkpOwoKVmVyeSBu
aWNlISBUaGFuayB5b3UhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
