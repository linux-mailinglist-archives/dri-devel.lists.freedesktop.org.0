Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EB729275
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5224A6E094;
	Fri, 24 May 2019 08:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C014D6E094
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:09:41 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id g18so7886067otj.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YuE0856TsTDzOr+71DW3ES+79KQ8yfmx0fgvjM9w/1k=;
 b=nuWA4C8SUuzSU+9vWonea6nj+Hxrnt7jrnGSlqqV8Qx8xrExFb4FIajygVW3una5rn
 EFeMjZnTPw99SzrrQk2AYK9uMpatRhvpI/ZVU5yH1sKKRh70zv1Xmw6nsCQPe2IHo6xQ
 bESc8oMF2SS/mpNAOQaH7k/xNpJNvWWHH/NgYm9BQi9van4WHG44Rqq1XEccX3zZYcqf
 iUoIee24dewdriLXJz2DudMwE0Ns/Ni4iJQz0T7sDVKON/tP1JqIMuymKw4PJrcpiAAx
 12I8XD2RfHgnp0XjCxuQOdScvSfuziGFrjptmvRip2tY5iVV8a3Wy5Kk0lkaOtGVgOyQ
 awVQ==
X-Gm-Message-State: APjAAAXknuPkozY3fc6+KLUp7WsTkCEFNkFhouIAYD1CbyaGPN8LsjDb
 UesAlNdNfrZZTqboHQ9zazCgJOMyTazINNdOFRITOw==
X-Google-Smtp-Source: APXvYqwTQvXvByfrzF4XOqJaZR3DWhg2Aui8um312pfGys3LkCBzcYSph7Loao897bvhjCqFHYARbNInZuy8DwKhvxg=
X-Received: by 2002:a9d:6e1a:: with SMTP id e26mr61890768otr.188.1558685381035; 
 Fri, 24 May 2019 01:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190524082926.6e1a7d8f@canb.auug.org.au>
In-Reply-To: <20190524082926.6e1a7d8f@canb.auug.org.au>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 24 May 2019 10:09:28 +0200
Message-ID: <CAKMK7uGSfOev71DKF+ygRjU0rMWcrW3rL7-=Xhbwdm9STUWntQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YuE0856TsTDzOr+71DW3ES+79KQ8yfmx0fgvjM9w/1k=;
 b=NhG5otDuKj+xoYuqWMZ8PG2WA2QVSXgCAotFXiApL9qn+lNO9iLE9Iqscjht011rS7
 /JdGphDVJAgCROpPSVvDsWfZy5wi6hUW4hvYY9rBdAKg5cyUYwOTcd88yDwY2qkpBNE9
 wPxsQh/OoT6+xGc/qZ2ghPwLXHIymQxMHJods=
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTI6MjkgQU0gU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNh
bmIuYXV1Zy5vcmcuYXU+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+Cj4gQWZ0ZXIgbWVyZ2luZyB0aGUg
ZHJtLWZpeGVzIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAoeDg2XzY0Cj4gYWxsbW9k
Y29uZmlnKSBmYWlsZWQgbGlrZSB0aGlzOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmM6IEluIGZ1bmN0aW9uICdsb2FkX2RtY3Vf
ZncnOgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jOjY2Nzo3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g
J0FTSUNSRVZfSVNfUElDQVNTTyc7IGRpZCB5b3UgbWVhbiAnQVNJQ1JFVl9JU19WRUdBMTJfUCc/
IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgIGlmIChBU0lDUkVW
X0lTX1BJQ0FTU08oYWRldi0+ZXh0ZXJuYWxfcmV2X2lkKSkKPiAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+Cj4gICAgICAgIEFTSUNSRVZfSVNfVkVHQTEyX1AKPgo+IENhdXNlZCBieSBjb21taXQK
Pgo+ICAgNTUxNDNkYzIzY2E0ICgiZHJtL2FtZC9kaXNwbGF5OiBEb24ndCBsb2FkIERNQ1UgZm9y
IFJhdmVuIDEiKQo+Cj4gSSBoYXZlIHJldmVydGVkIHRoYXQgY29tbWl0IGZvciB0b2RheS4KClNl
ZW1zIHRvIGNvbXBpbGUgZmluZSBoZXJlLCBhbmQgRGF2ZSBqdXN0IHNlbnQgb3V0IHRoZSBwdWxs
IHNvIEkgZ3Vlc3MKd29ya3MgZm9yIGhpbSB0b28uIFdoYXQncyB5b3VyIC5jb25maWc/Ci1EYW5p
ZWwKCj4KPiAtLQo+IENoZWVycywKPiBTdGVwaGVuIFJvdGh3ZWxsCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0
OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
