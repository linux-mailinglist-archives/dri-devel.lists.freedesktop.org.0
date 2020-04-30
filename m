Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D1B1C023F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 18:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3516E930;
	Thu, 30 Apr 2020 16:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021A76E406;
 Thu, 30 Apr 2020 16:20:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x25so2568883wmc.0;
 Thu, 30 Apr 2020 09:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0jneJP/9CUxzcRcR0GnH47oWkPo3130a3U/bdfBPa/Y=;
 b=Y47j44ZE2mX1wgtCi5IAu5TYpvREd4YgmxPN94HNvG9rvVrgt/7OSBsx5L2XqW1POP
 lucbRejNmfAxJeChSX8O2xyS2JQsmxh88txJDRoOajptXZn9U9R7hmvd7hxnmXYi+5qT
 EaCg3JTyCxWWRYoJ0mid3lqSwUGiLbFhek2RrUUH6Tcg1l2iB9e2Ofmuf4Rodx1GB+31
 Wl/sKFTo7yfdp5DIo8Iya+NEYnNYYLHNlubtyUV1hCo5OuUe8lZpSrdGAPemd8Kb6twy
 EEm3PpU3Kgnh+Od0iuOLNnG9MyVhMnfctiOlgLsmglpm8q8XBhsXJcuBP1DW6AqZqaT/
 0w+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0jneJP/9CUxzcRcR0GnH47oWkPo3130a3U/bdfBPa/Y=;
 b=Oci9U1AbGcMATiZuN/WYWSPX95gqOQxGa6VaMR4CXPMzKIZxVlN/+3ruj7PvdMk5kY
 0SnXqnZHpXGFkoqb2x/LkF4Qt2SFOBtnwcJMbwCHGAjYm+jmJXQV31G+dsXZ5QUr5zFu
 +ojYnkQvcIDJaQGxIM9pYH34rrRMQKtAfIFqMYd3p2E6H6blx32pLL5mPG0urKarmAWA
 5GahtAQAPoGewu9+9BHGDUxAOIa9d2WHqcqLmXbqS+z5HjeR86DUPTcLUevtUimos9+0
 u96rft2eVbxb8fhG87AHu0VMIFNCgdD0inol127cjVUtzzrj/eaUuTDiwjav/+XKxcu6
 yCWw==
X-Gm-Message-State: AGi0PuaO4LwE8HmUuExMWoWwR/iiI/c4VIjETXrE5L0dTTm5DKm2hMpl
 6mnBOYkhEpS8qr21mVq7CYgSIPoh9cNXxctzKLF/Xg==
X-Google-Smtp-Source: APiQypK0+H0kOoB7PagGfA8ppNbgqW+kntofnBNVylH1rrGE5BIOtVBb1aQ5dxBB9lB/9PDuUk1siYOJENIwc04IDJ4=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr3911546wmb.56.1588263635683; 
 Thu, 30 Apr 2020 09:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200430022653.46365-1-zhengbin13@huawei.com>
 <38e64a9c-53e4-6010-2d90-3c22d32e6c79@gmail.com>
In-Reply-To: <38e64a9c-53e4-6010-2d90-3c22d32e6c79@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Apr 2020 12:20:24 -0400
Message-ID: <CADnq5_PhHeH0G9VG4agg0GG=xuXawtYxnA80H9pV+RvtrQWE3g@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amdgpu: remove set but not used variables
To: Christian Koenig <christian.koenig@amd.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Zheng Bin <zhengbin13@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFRodSwgQXByIDMwLCAyMDIwIGF0IDk6MDcgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3Rl
Ogo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4gZm9yIHRoZSBzZXJpZXMuCj4KPiBBbSAzMC4wNC4yMCB1bSAwNDoyNiBzY2hyaWViIFpo
ZW5nIEJpbjoKPiA+IFpoZW5nIEJpbiAoMyk6Cj4gPiAgICBkcm0vYW1kZ3B1OiByZW1vdmUgc2V0
IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAncHJpb3JpdHknCj4gPiAgICBkcm0vYW1kZ3B1OiByZW1v
dmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAnZGlyZWN0X3BvbGwnIGluCj4gPiAgICAgIHZj
bl92Ml8wLmMKPiA+ICAgIGRybS9hbWRncHU6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlh
YmxlICdkaXJlY3RfcG9sbCcgaW4KPiA+ICAgICAgdmNuX3YyXzUuYwo+ID4KPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgfCAyIC0tCj4gPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgIHwgMyAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdmNuX3YyXzUuYyAgfCAyIC0tCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgNyBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiAtLQo+ID4gMi4yNi4wLjEwNi5nOWZhZGVkZAo+ID4KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+ID4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
