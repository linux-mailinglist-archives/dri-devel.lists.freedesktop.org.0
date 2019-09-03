Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10560A6197
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 08:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F9C8940F;
	Tue,  3 Sep 2019 06:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B9A893EA;
 Tue,  3 Sep 2019 06:37:14 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id h3so7999158ljb.5;
 Mon, 02 Sep 2019 23:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5vJWSAmzbJeFUqbI+xGxpVUQ6FAayCovedf2lF+sPs=;
 b=TIv7mydYXSBohROPmcs2Q5b6F8D7DRzrb6wvI9fiFha6OlshqV9yMd4LUeZwQqGCVz
 x+f4tXByFt5JfUhClGRJO9s7ZiDSbwNXkgpgmArSnKxlbinMCCZzZUuxyk1NBdGz/19J
 1XEDHE0Sl++25e2rXEYzRy3uOHJEAWg8Jqj+gYbNWxgjEqt5mCa+xs70qt47+PHFFXLr
 kPbHi/N7V/Yw56L7m4UNbEXCJblatlxHzvka0Lw0iOCpbDv9pX+0VgDUqBbw3zLf1LBZ
 fKe+G5LXCa+COtci4Iy6Ds7Jro4LIQqf7tMTMReJkPl20ZoYTbpN7AwCogWNPiVAyvQN
 vw3w==
X-Gm-Message-State: APjAAAWXhXZG2/njAksIE0Sr0mUqrRmIjMDuHkqrPOEecVsIj9A8iv0r
 PeG8nAm1GEQ4ZPjc6kWOPW5qXBzzmSsWbDqEgeo=
X-Google-Smtp-Source: APXvYqzDpJBV+TUVOx2V31AJmvZhuwNuwVXWzBM3Q37XsKMUqJ+IrUok9tbPS84ZOJWxN8VeXZycH91C9nTh8W+Xr8w=
X-Received: by 2002:a2e:780c:: with SMTP id t12mr6376842ljc.226.1567492632954; 
 Mon, 02 Sep 2019 23:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190830212650.5055-1-alexander.deucher@amd.com>
In-Reply-To: <20190830212650.5055-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 3 Sep 2019 16:37:01 +1000
Message-ID: <CAPM=9tw3xmLCnmckvkG3SzAO82rwj2KMfP2yYw=2-WPWLg7fJQ@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-next-5.4
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+5vJWSAmzbJeFUqbI+xGxpVUQ6FAayCovedf2lF+sPs=;
 b=W/isqvBz3wygFRbqw17pibt6righJkyJGv6x6rdjpc3Xq+3RPJPvi/8oo23bPXM24t
 rcD0fuy5/24R3UlyB6rDDGzazJrpXKrpQURC72JkQmKjjvyC8SVsrOGkzZAoUV/xxggQ
 gpneIsnqu1j839wkAEiNBg4aXtD2oDZFjaS7JmEcDzQIZQFemVYTn6hH7pBPMZtHmzaH
 X35ycXoP+SEN5/JtOMHjwptbAGb9Q8OQZZQPnCsYhMaSL10r3xSCmpz+o0hOdAL4GqGV
 DrEpA3vctZMeXwM4Al06+VDBxCu8N238AK5We34H4dZT8aCwO6vDhJhcElh3cqseYB6d
 GEkA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAzMSBBdWcgMjAxOSBhdCAwNzoyNywgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgRGF2ZSwgRGFuaWVsLAo+Cj4gTW9zdGx5IGJ1ZyBmaXhl
cy4gIFRoZSBiaWcgYWRkaXRpb24gaXMgZGlzcGxheSBzdXBwb3J0IGZvciByZW5vaXIKPiB3aGlj
aCBpcyBuZXcgZm9yIDUuNC4gIEkgcmVhbGl6ZSBpdCdzIGEgYml0IGxhdGUgdG8gYWRkIGl0IGJ1
dCB0aGUKPiByZXN0IG9mIHRoZSBjb2RlIGZvciByZW5vaXIgaXMgYWxyZWFkeSBpbiBzbyBpdCB3
b3VsZCBiZSBuaWNlIHRvCj4gZ2V0IHRoZSBkaXNwbGF5IHBhcnQgaW4gYXMgd2VsbC4gIElmIG5v
dCwgbGV0IG1lIGtub3csIGFuZCBJJ2xsCj4gcmVzcGluIHdpdGhvdXQgaXQuICBUaGFua3MhCgpk
aW06IGMwNzJiMGMyNGU2YiAoImRybS9hbWRncHU6IGZpeCBHRlhPRkYgb24gUGljYXNzbyBhbmQg
UmF2ZW4yIik6CkZpeGVzOiBTSEExIGluIG5vdCBwb2ludGluZyBhdCBhbiBhbmNlc3RvcjoKZGlt
OiAgICAgOThmNThhZGEyZDM3ICgiZHJtL2FtZGdwdS9nZng5OiB1cGRhdGUgcGdfZmxhZ3MgYWZ0
ZXIKZGV0ZXJtaW5pbmcgaWYgZ2Z4IG9mZiBpcyBwb3NzaWJsZSIpCmRpbTogRVJST1I6IGlzc3Vl
cyBpbiBjb21taXRzIGRldGVjdGVkLCBhYm9ydGluZwoKYjA1ZjY1ZDc3MjBiMTcyYjZmZGUzYWJm
YTQ5ZWQ2NjgzNzA3MWQ0NQogc2VlbXMgdG8gYmUgdGhlIGNvcnJlY3QgYW5jZXN0b3IgaW4gbXkg
dHJlZS4KCk5vIHByb2JsZW1zIG9uIHRoZSByZW5vaXIgY29kZS4KCkRhdmUuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
