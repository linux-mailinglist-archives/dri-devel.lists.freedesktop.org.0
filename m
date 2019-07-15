Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ED868724
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 12:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E96898B6;
	Mon, 15 Jul 2019 10:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C973E8987C;
 Mon, 15 Jul 2019 10:40:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v19so14672389wmj.5;
 Mon, 15 Jul 2019 03:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OLhOlGy/Zpqk6ycbhGl95GCnRY0eR5mykg/94zkQXyM=;
 b=UsEXAmuILXh1Ys8MdH6VLaqItW6RWztyqZ+dtoLqlsORlPgxq81NGMuwvK5HHY9bPa
 mfGVYrvc5lO9rH5mbpMKCaSDnfYCKIld1kk6WAQGNb74iXUu8H0Hq7tQgUx6/KLFZETO
 eR6N0dJxuB7NqmbY/Tr/FyXjn0W/xUkmL2YA7HX794ynsnLya5n5eZS/kc1NfdXdGRkD
 7l/lJfU60HOBlCi9j39RLpHMdxQNOlK0DBMS6i5pxemWmzTTznJ/GSSEH+pM2xapvAIp
 jCiC6TbQZNLGQPZM07m22tuac0Ko7IoJKjS2U1GcvIQ8H2IUCPxf2+V3K4BTM/u7pKEn
 BY5w==
X-Gm-Message-State: APjAAAUo01xYur7O65R3cCdsLctIoBxvAbvObk0/yjasLbg/Od5nvA6U
 sIbZli8/sAwxIL7s2DoalKM=
X-Google-Smtp-Source: APXvYqyCvN1z7i6TYAqjic41kTp/MqB/5K7wVhGC9Qeaiv1CVUiAEgMVsPPOsOESqC9Cne4zkSc5Bw==
X-Received: by 2002:a1c:9e90:: with SMTP id h138mr25059180wme.67.1563187222360; 
 Mon, 15 Jul 2019 03:40:22 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id 5sm16132908wmg.42.2019.07.15.03.40.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 03:40:21 -0700 (PDT)
Date: Mon, 15 Jul 2019 11:40:20 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: Re: [PATCH v3 05/24] drm/amdgpu: remove memset after kzalloc
Message-ID: <20190715104020.GB20839@arch-x1c3>
References: <20190715031731.6421-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715031731.6421-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OLhOlGy/Zpqk6ycbhGl95GCnRY0eR5mykg/94zkQXyM=;
 b=U/68ct6QI4cClrqDBJmUuHunt/bg7Eh4NWXxIK1SZh1Pct9mlDieZnhhyXUDkdTiMo
 xwZ5DZv4rGnkwvCZoErPIwjqKBjEa3vYL/k+jmjni4t3FKK/w/DCKUF2Z6+4wnekTco5
 ICKzJxf7I3hOwcglNlrZw2CpBPvJqF+tjL568qKQr1flPxkdLSCMP7jSDYqgWL6Kl8ds
 ZMulunacwg1naNMsspmMzqHf29PGhqan6ls1G2ZHgbqylCBYXA9TzSsXs/5Khwouv/tF
 74+NRsRAotsQ+tGtwEAIeMu0WM8lCJB+ksyGYuUsUxZEjbBVvGNy+Axn64dS1Xqi9hG+
 7DMA==
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNy8xNSwgRnVxaWFuIEh1YW5nIHdyb3RlOgo+IGt6YWxsb2MgaGFzIGFscmVhZHkg
emVyb2VkIHRoZSBtZW1vcnkgZHVyaW5nIHRoZSBhbGxvY2F0aW9uLgo+IFNvIG1lbXNldCBpcyB1
bm5lZWRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGdXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFu
QGdtYWlsLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYzOgo+ICAgLSBGaXggc3ViamVjdCBwcmVm
aXg6IGdwdS9kcm0gLT4gZHJtL2FtZGdwdQo+IApSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxl
bWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCi1FbWlsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
