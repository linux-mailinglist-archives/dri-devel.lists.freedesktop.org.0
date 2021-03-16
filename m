Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD24A33D0F0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 10:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B2E6E12E;
	Tue, 16 Mar 2021 09:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F14D6E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 09:39:49 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id s7so34512304qkg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OuU2U/df8nTye7pdhY0eb4aRrdzeWMZFzLOkuzN2Xog=;
 b=CpbVnkrMDemfezSvw/jpXedj3dzogjjeu7jS1O9DRv5+Y/btKK0cZYEXoksa9d2Jau
 nr8c+kowc1rvxJP6MAkhfO+fsoFIumvSqbhl3TWhnHdVNTKw/dAaDnBzqyzhHhOV5HNw
 qzE6EPHVVmon3anUgFyVrOpb/xSGFAQeDKMJSpcaXtn8A1h+xP2Wpp7ZTQdC1hI9mbH+
 QllOFcNNnAzWoRe9iCkdu/a54PQzICNGObeglnzVmWWErR6Lpo1E0GyKwI1Z3oLo8llc
 j9yIordk036Xijs1anLgXAWuIR45iz+vkDWRy3gzxeD6UMzNxGNhRRqBKGqFTSep8yXf
 SY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OuU2U/df8nTye7pdhY0eb4aRrdzeWMZFzLOkuzN2Xog=;
 b=iJKdmxHTFchi/zDUysUsiK67+9xnf/s/X8AuS+7ju4i84o8DRtO/vi9gn2ddte50HA
 RWh2MlvP2hyE+5FqwnhVB72dCw222KdqHD72kpYKu6Ykyb4jML9Sune5fE4km9aLhUwQ
 NvryjXokNchEYz49otFHUpGhH4xcFASuMahEtk7SNuQZAnc8wLP8LtysyqiGJjHLZmIb
 OA8E9Q6BYXAQ4+yUL1P6v0lFZ3gJWSbgV8NvBfLlFpnN7gqln/7C551XIZy/KcrZcdOC
 X34d4RrQ2C7KlNhC1P+ELWCJA5VNMMKY7iX/cJwsQEsAao6KepGJi00kEj8YCIJGdFFF
 R66g==
X-Gm-Message-State: AOAM531j7O2BqDgGkD9WjYuU5lTN0FLgH6PheTO3Jr+69OLlAtSspH3C
 X/9GlmBg3egaZONTy5upuO7Y7xUNe610CKCnR8o=
X-Google-Smtp-Source: ABdhPJyEZiCti7nXW2bruTOXliSJSig6xCGCyqhXhzPTm15ylOhBBbENG9mtFBpKjpGh0SiVLhL4pSBiormGXY1Q8a8=
X-Received: by 2002:a05:620a:45:: with SMTP id
 t5mr29968021qkt.17.1615887587672; 
 Tue, 16 Mar 2021 02:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210315191432.153826-1-christian.koenig@amd.com>
In-Reply-To: <20210315191432.153826-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 16 Mar 2021 09:39:21 +0000
Message-ID: <CAM0jSHNaDq73prkcDm8xtB72sBni-54ekZXe5kwSdQNQtKsOLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/qxl: clean up qxl_bo_move_notify
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNSBNYXIgMjAyMSBhdCAxOToxNCwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gUmVtb3ZlIHRoZSB1bnVzZWQgZXZp
Y3QgcGFyYW1ldGVyIGFuZCBkcm9wIHN3YXBwaW5nIGJvLT5tZW0uCj4KPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpGb3IgdGhlIHNl
cmllcywKUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
