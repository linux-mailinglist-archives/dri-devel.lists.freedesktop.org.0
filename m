Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0617338B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 18:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABD26E5EC;
	Wed, 24 Jul 2019 16:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D286E5E1;
 Wed, 24 Jul 2019 16:18:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p13so47605333wru.10;
 Wed, 24 Jul 2019 09:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zA+ESs+28SsdljZo0563GBh9pGeuVXgllTPcSWt0iU4=;
 b=lazJaa0LKg3iEppJELOA8V+saypZTZYXBFPfKfTZzNDJOsAZNPfzO7maASWDKu3QE+
 9iQ8b4HaAXFCm9PYqJTtCR3VVDx94oLYanTUXlN7ZakTA9ZddlHVk5WeLbO5WzT6Nf6x
 wfuD78NOVnbW2MCsAE0yYWmRCwoKVqghS8hckhbFV7+1eqd1E+hlW/cRCe103r/+P/AJ
 Ni7rlnmaZkCz/6Y3sCJKFJAMkili7uYtS8KU7VTmt9vIOCNyDrvCqk/gws4tSefojXU7
 DMpLEHv0rxuFt09fQhZQYt5E3aXzS19zqFVd1CwDhPYX9WUBq/PzE2aRhgerGX4T+0Ge
 ct3g==
X-Gm-Message-State: APjAAAW2uj0qV1xvLbCW9zsDelZxZWVeABoS36RLbOLGuyn0tLRhy/ZX
 eQqWi07Yi99ZreZ9E+jOsa8=
X-Google-Smtp-Source: APXvYqxwgTLXyWzSX+p/ONaw35d/degL4jyFO7v8I39H/rzFDZs/vdEqCzc6Yrx126MZkftW9UzNoA==
X-Received: by 2002:adf:e483:: with SMTP id i3mr48048429wrm.210.1563985120293; 
 Wed, 24 Jul 2019 09:18:40 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id w23sm47718775wmi.45.2019.07.24.09.18.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:18:39 -0700 (PDT)
Date: Wed, 24 Jul 2019 17:18:21 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 0/4] drm/via: drop use of deprecated headers drmP.h +
 drm_os_linux.h
Message-ID: <20190724161821.GD24644@arch-x1c3>
References: <20190723200944.17285-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723200944.17285-1-sam@ravnborg.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zA+ESs+28SsdljZo0563GBh9pGeuVXgllTPcSWt0iU4=;
 b=IDRgDp4V7dRfzjoX8HmZhHucoGiZ0eoKOf6JCwxQFCYeHnjiJZEW6FIMBrB9CP0Hog
 fA35+H+EjydORqz+WHRKaPigOrFypKDyGIqH33Mu3ZSkiriVzEHBgMmdmkvNh9/mT16N
 iAZ7h9VtMpRYHO6/XZXis050IGA+QX+y4mGN75Bgn8QWRqWJx9YRRVRWMkZmC2wliVQp
 x+tk/vXmZwfX6gG1eq7OEi92WXOTiEOMbjUL/QPff5p7BOOydd1zjiD0H7tMU2M8cfCG
 xujrAUeVz6HMV+yYO5ecTWPZX1WGFrpSQRn8YNzjdTpsJB7L1nH/h1YkNCtdSnpPU6uN
 3TKg==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 dri-devel@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNy8yMywgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IFRoaXMgaXMgc29tZSBqYW5pdG9y
aWFsIHVwZGF0ZXMgdG8gdGhlIHZpYSBkcml2ZXIKPiB0aGF0IGlzIHJlcXVpcmVkIHRvIGdldCBy
aWQgb2YgZGVwcmVjYXRlZCBoZWFkZXJzCj4gaW4gdGhlIGRybSBzdWJzeXN0ZW0uCj4gCj4gVGhl
IGZpcnN0IHRocmVlIHBhdGNoZXMgcHJlcGFyZSBmb3IgdGhlIHJlbW92YWwgb2YgZHJtUC5oLgo+
IFRoZSBsYXN0IHBhdGNoIHJlbW92ZSB1c2Ugb2YgZHJtUC5oIGFuZCByZXBsYWNlIHdpdGggbmVj
ZXNzYXJ5Cj4gaW5jbHVkZSBmaWxlcyB0byBmaXggYnVpbGQuCj4gCj4gQnVpbGQgdGVzdGVkIHdp
dGggdmFyaW91cyBjb25maWdzIGFuZCB2YXJpb3VzIGFyY2hpdGVjdHVyZXMuCj4gCj4gSSBoYWQg
cHJlZmVycmVkIHRoYXQgdGhlIHZpYSBkcml2ZXIgd2FzIHJlcGxhY2VkIGJ5IHRoZQo+IG9wZW5j
aHJvbWUgZHJpdmVyLCBidXQgdW50aWwgd2UgaGF2ZSBpdCB0aGVuIHdlIG5lZWQKPiB0byBkZWFs
IHdpdGggdGhlIGxlZ2FjeSB2aWEgZHJpdmVyIHdoZW4gcmVtb3Zpbmcgb2xkIGNydWZ0Cj4gaW4g
dGhlIGRybSBzdWJzeXN0ZW0uCj4gCj4gdjQ6Cj4gLSBVc2UgYSBtb3JlIHN0YW5kYXJkIHZhcmlh
bnQgZm9yIHZpYV93cml0ZThfbWFzaygpIChFbWlsKQo+IApUaGFuayB5b3UuIFRoZSBzZXJpZXMg
aXM6ClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29t
PgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
