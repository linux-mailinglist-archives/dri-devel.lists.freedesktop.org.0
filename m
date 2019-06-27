Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD0B58696
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 18:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24156E060;
	Thu, 27 Jun 2019 16:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752676E05F;
 Thu, 27 Jun 2019 16:02:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k11so3223322wrl.1;
 Thu, 27 Jun 2019 09:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TX0PH5LENMLq4sqsfzVBDZigOo0jYU9ew5cFE8wrzTg=;
 b=rCahs+QYNSr2iDYZTYh/fewdjW84hbyLgegMjO+DqbQI6yhaeOQl4Lj96HENPSbsY1
 Am4SG6r8FfhiNE3MQi4DsEem7VYPgdfcllZU5gMdjzXEZT8LKNeWGsH5du7UPqyaycf9
 e2ofsOe93AUKsg2fqEgOS/cr3wi6XjhKDABfVH8GGH7orPD9uKrAuY61gOxAFfKY+6/I
 O+sBM2wU4z8ayuYBzYubaBCCQfsUZ7nGGlBR5NENfUHSLK0QDoahoZCStCpP2YvwnRep
 y0kOzs/um0i9Hrlm+bVEjKF0YqhKLnMu8hU7UDP4WIDC8WDOr7fZ9nUr9lvJWq+/oxQb
 fLAg==
X-Gm-Message-State: APjAAAUTLCwOc8s31fLnlepOpL4cO8lIGgi75haJHt6NQI8pZnL7mbyk
 AbWF2lOdfyQLFvwCSP5lCLy36ys5fSIx8HCiZaU=
X-Google-Smtp-Source: APXvYqyuyR+GwQcgXshLDQQ3dyR5MLZwf3sqxXo+FdDohn6bKxhmN9ZlAtZsWNwu4HWBtHbYKrH5m3umtNSoLetgp1U=
X-Received: by 2002:a05:6000:106:: with SMTP id o6mr4101553wrx.4.1561651331074; 
 Thu, 27 Jun 2019 09:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190626132427.12615-1-colin.king@canonical.com>
 <CAPj87rM9y5Zen5A5KkiCqqUF5m+vAwwtLj-iJrcwFfzMev+Mrw@mail.gmail.com>
 <2bd65b8f-f278-1000-d9a2-6476fc3a497f@canonical.com>
In-Reply-To: <2bd65b8f-f278-1000-d9a2-6476fc3a497f@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Jun 2019 12:01:58 -0400
Message-ID: <CADnq5_O9oA4PxnqxwTurRbgQ=M2PceiqUpZiCncdaiYmbJsiQA@mail.gmail.com>
Subject: Re: [PATCH][next[ drm/amd/display: fix a couple of spelling mistakes
To: Colin Ian King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TX0PH5LENMLq4sqsfzVBDZigOo0jYU9ew5cFE8wrzTg=;
 b=Xh0eEy4GNq2E1fFz0Mf4HWpAQzWzv+Mh4oLRb7vSZS98yd6MvlK9CboKxTcwOewaHO
 Y7k7uwsAV/mqnfv4lPq71a6rCgKWf0mciNxHc/aKROYQqo3F7QfHLFBpsmTHsEyYO2mi
 DeZRhmJ84RgySQzi+KhkdTqhOpF/60KlzvaNaT+wnmmfyxx9o9mMAQZRuJ3B7oLjaK0z
 7qGkR4TqhRwg11aXJVXbRwP+c9imC8TXDHVwSKLt3ZT2x22NIX17w3krZPySsSg86iZz
 4RFn4l+ONCVqOh6P/uyGysBZKn3Ns3QSQAS4BOl3KHDqwEIfBp6WlNvvWQGMnMiRESFO
 Bz6Q==
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgOTozMiBBTSBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IE9uIDI2LzA2LzIwMTkgMTQ6MjUsIERhbmllbCBT
dG9uZSB3cm90ZToKPiA+IEhpIENvbGluLAo+ID4KPiA+IE9uIFdlZCwgMjYgSnVuIDIwMTkgYXQg
MTQ6MjQsIENvbGluIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gPj4g
VGhlcmUgYXJlIGEgY291cGxlIG9mIHNwZWxsaW5nIG1pc3Rha2VzIGluIGRtX2Vycm9yIG1lc3Nh
Z2VzIGFuZAo+ID4+IGEgY29tbWVudC4gRml4IHRoZXNlLgo+ID4KPiA+IFdoaWxzdCB0aGVyZSwg
eW91IG1pZ2h0IGZpeCB0aGUgJ1tuZXh0WycgdHlwbyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4K
PiBVZ2gsIGZpY2tsZSBmaW5nZXJzLiBNYXliZSB0aGUgdXBzdHJlYW0gZGV2cyB3aWxsIGZpeCB0
aGF0IGJlZm9yZQo+IGFwcGx5aW5nLi4uCgpGaXhlZCB1cCBhbmQgYXBwbGllZC4KClRoYW5rcywK
CkFsZXgKCj4KPgo+ID4KPiA+IENoZWVycywKPiA+IERhbmllbAo+ID4KPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
