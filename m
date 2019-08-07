Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B520285080
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 18:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52446E72F;
	Wed,  7 Aug 2019 16:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB856E72F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 16:00:56 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id x67so31260677ywd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 09:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q8SjvpuplBkOBLI0LTXY0YATSg1BRT303FImnhchLoI=;
 b=h0iOcC6qWwfMenYe4NBYegAIK6lAv90DPoXzxQNyKi9cb4GyVvxI1aLN/KmlIB3laQ
 mCu2xiqYMgNBp2wNWosPsa7wEn4rxN4/D00Cq5tSQLE184sZGrNO5C2tFnJ8KyGA5Cwe
 BYUXjj/RiHs2vqtDFVIg2W6uiE5a3cGtzaRhQkGUSA21YX9ZUA8WkV5An+6x4no4hZNJ
 zgX2Z19NsCYZ3XyfXsMpPwejdl5N3oUX4D2ErZBvpxuuJQASDeY8ghmPtEzc0Bto0eq+
 ST9pDj+4XFZD1m9bXrfkU47O39niztzZyg1SqXC4ki1zGLRLQCn3Sp43ME2LIEIGq+4z
 zubQ==
X-Gm-Message-State: APjAAAVYgyTJmdm2GvVT1U/A7UkIk+Hy1GDyI9Zsyl7zI6RI+o9Ca/hh
 TsmCqeAs2G0GL/VfqN+Hr8qI8hOYHsg=
X-Google-Smtp-Source: APXvYqxSlu1CkJOtqcGr/4Z+rVGTxaXNFrwDf6CsNB2CDThZTjTGMFnL6SQJUnEo40v3i/J8kmEypQ==
X-Received: by 2002:a81:32d8:: with SMTP id y207mr6184965ywy.252.1565193654250; 
 Wed, 07 Aug 2019 09:00:54 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id l4sm19060606ywa.58.2019.08.07.09.00.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 09:00:53 -0700 (PDT)
Date: Wed, 7 Aug 2019 12:00:52 -0400
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, robh@kernel.org, emil.velikov@collabora.com
Subject: Re: [PATCH 0/2] drm/panfrost: Revert drm_gem_map_offset changes
Message-ID: <20190807160052.GB104440@art_vandelay>
References: <20190807145253.2037-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807145253.2037-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q8SjvpuplBkOBLI0LTXY0YATSg1BRT303FImnhchLoI=;
 b=QKPTseKbpW3t/MBYau7MrUs/2AG4Rj6VhWFZop7Te5AAdCSbfExBx33w4FRhwba7hy
 Xu1eSck2XXsdefw+vZ3eirTsjMHIxboaSuPmcmxGKQU1ocEWo71wm6WRYi23UiPA3KMV
 9tR+L8feNqLStgC68hJn4l1bu8123S4y9un1ciX1nJqgRxeeK4FYBeqjvEY7JD+cYBlb
 VvgDZBRDodKVuIdKSncK52wlAplzA7QO70vYRvXGL4s9I6NyzuI597WM4wVw78cMunph
 JRztgoJeSK/gM3qykwEzkf0YqZBILwJeHMP6hzou1zYPUiGUApET0NxeVIsT4oCNMfIf
 2bbw==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTA6NTI6NDZBTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IFdoZW4gSSBz
dGFydGVkIHJlLWFwcGx5aW5nIHRoZXNlIEkgcmVhbGl6ZWQgdGhleSBoYWRuJ3QgaGl0IHRoZSBs
aXN0Lgo+IAoKQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0CgpTZWFuCgo+IFNlYW4KPiAKPiBSb2Ig
SGVycmluZyAoMik6Cj4gICBSZXZlcnQgImRybS9nZW06IFJlbmFtZSBkcm1fZ2VtX2R1bWJfbWFw
X29mZnNldCgpIHRvCj4gICAgIGRybV9nZW1fbWFwX29mZnNldCgpIgo+ICAgUmV2ZXJ0ICJkcm0v
cGFuZnJvc3Q6IFVzZSBkcm1fZ2VtX21hcF9vZmZzZXQoKSIKPiAKPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9kdW1iX2J1ZmZlcnMuYyAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbS5jICAgICAgICAgICAgICAgfCAxMCArKystLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9nZW0uYyB8ICAzICsrLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZHJ2LmMgfCAxNiArKysrKysrKysrKysrKy0tCj4gIGluY2x1ZGUvZHJtL2Ry
bV9nZW0uaCAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAy
MyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiBTZWFuIFBhdWwsIFNv
ZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+IAoKLS0gClNlYW4gUGF1bCwg
U29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
