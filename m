Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15245DE73
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B807E6E0DB;
	Wed,  3 Jul 2019 07:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223E589FDB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 17:03:24 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id n5so38674696ioc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 10:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=coCn1S/KhTlU6UnovTFnkK0gRN1c323cXsK4kHrMZx4=;
 b=dLaB851yoQdn+oPrWmhgq5FohV6DlEFatfy/tUpp/YjWabgrjh++R0hJZSOMKyaVLt
 nf6V27vZFtj98q0HUYQm/E2g6oZI5EWB4HkNgMBpV8urNzTIkiG4AP4x3CbXTXeK0fut
 DstIREtrEOSmHBto2Rx8FHzYtyFYeZCYFUJCqxwknb5DOjze3bOoFgpBNGq053rkCtDK
 nEne2QWD2e5tO45z5+aldhIx+Sa8/Rtbu1C32se+0WyWpPHvLnJpF1brQtNJ8dJFu7p8
 6+GWAQBaZgExCI/Un1diVOogI6KR5LpwpccTU/CnAZAz1zl9H9xIZf6VfVk8UI7vNyZr
 2pNw==
X-Gm-Message-State: APjAAAV0ybEfQDPjsik56iz8fmQmr+AN9REBz4BO4LFNZEHHC2OjSmxs
 heD9DT/+RUHEym+7zxzwxf6A+RL/wFUVZlrxpfU=
X-Google-Smtp-Source: APXvYqxnFMtieZLKZd/T/0vK9Gp3smQydqy37XS5zeh3WsU3mF/z6ESMHfhgZOIpIhAt7qH3m94Mtg0/4O6cvn9KvRI=
X-Received: by 2002:a6b:b987:: with SMTP id
 j129mr31324445iof.166.1562087003547; 
 Tue, 02 Jul 2019 10:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190702154419.20812-1-robdclark@gmail.com>
 <20190702154419.20812-2-robdclark@gmail.com>
In-Reply-To: <20190702154419.20812-2-robdclark@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 2 Jul 2019 11:03:13 -0600
Message-ID: <CAOCk7NqifwhT=MRddB7ikh8My1y6ROL2L1B2k_djfLdd=sAxrw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: add link to datasheet
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=coCn1S/KhTlU6UnovTFnkK0gRN1c323cXsK4kHrMZx4=;
 b=ryyozQMLfXxI705cSwC2vCV77+ux9SbAMvRyV52eweQ45EjCUkQYAJDtX7lAdis14Y
 MHZBQ41ADOI6DCMm8kzW5d2SyGyfTV0EVTiK3dPk9ZMX3rkgq3UnVLSj2Q/9BkdM2W2T
 2VuKWrxHqYVX39Gs3RV7OaxUmH4OICxe2QRfCDqG0xT47qBfzvZJMnNeq08TG/SAityp
 tqS2PpaALsQdIp6RuwXH4h5zm5fRA9fOkrY+Q0YtQmGLBWHwR3acOdf8UWf1SmKwXKsq
 KggQbCfbZIAeIpjXiWlDE+sM7Ud7MUkCxhOmEj8s4rMLM8fmCLQFYBsllSBiAS43UH5i
 cggA==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCA5OjQ1IEFNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+
Cj4KPiBUaGUgYnJpZGdlIGhhcyBwcmV0dHkgZ29vZCBkb2NzLCBsZXRzIGFkZCBhIGxpbmsgdG8g
bWFrZSB0aGVtIGVhc2llciB0bwo+IGZpbmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+CgpUaGlzIGlzIGluIHRoZSBEVCBiaW5kaW5nLCBidXQg
aGF2aW5nIGl0IGluIHRoZSBkcml2ZXIgYXMgd2VsbCBpcyBhIG5pY2UgdG91Y2guCgpSZXZpZXdl
ZC1ieTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
