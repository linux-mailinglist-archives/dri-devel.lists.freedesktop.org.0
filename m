Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45765214DF
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC48898A3;
	Fri, 17 May 2019 07:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE6D898A7;
 Fri, 17 May 2019 07:35:09 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id z28so3279083pfk.0;
 Fri, 17 May 2019 00:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UcaBfi1RcfCM+fQaIDSrzEfG2lN6ZvmfEpq0ih52Kx8=;
 b=iMPFHopYfvb6Hpg0UYB9y95cDPtlemSb5ZCOBRBxwEZn2h8tvsZqvY63V/Xj8GX1HQ
 M5svca1F/IBijYUbKNcQ4JCH7crmTzNY++h/csG2kaTsiKvzOBc/E0Zm+/uAgo51Bggx
 zMMwmcD6tyXdBuOjG8aeHr4NDofKYm3HHQinrmyDlPQRSLxKE+xYnEpmnHgoqigHXFG1
 4cMm2FbFPHOaNLHZPerPyIHSYsEF7MVt6QsmGh2Rog3Rn4jtCRVvbMsNGCkFT/RhR4fr
 qIaGe0hrbwGqg5FrzV7OcCEdZ+lNG30I/eqjtGPGIlwtWMnxK93b5PF2fM2p5t/iynqG
 7QMA==
X-Gm-Message-State: APjAAAUIA1XJNhuPMCLM/MzISTdOdRRnqhuZ/k848OkWW03QB3fLDMpE
 RjoSdbxDAXQsLftIlESqlbc=
X-Google-Smtp-Source: APXvYqw3w87YR06oknkwpYs/AFOdVPDmALqqgvTH+nL6zMlckTE6u+9pJmZN3GBud0TKYhfAlb+tJQ==
X-Received: by 2002:a65:6494:: with SMTP id e20mr46551747pgv.117.1558078509402; 
 Fri, 17 May 2019 00:35:09 -0700 (PDT)
Received: from localhost ([175.223.38.122])
 by smtp.gmail.com with ESMTPSA id c16sm5127082pfd.99.2019.05.17.00.35.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 May 2019 00:35:08 -0700 (PDT)
Date: Fri, 17 May 2019 16:35:05 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: drm/nouveau/core/memory: kmemleak 684 new suspected memory leaks
Message-ID: <20190517073505.GA7102@jagdpanzerIV>
References: <20190517061340.GA709@jagdpanzerIV>
 <20190517072737.GA651@jagdpanzerIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517072737.GA651@jagdpanzerIV>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UcaBfi1RcfCM+fQaIDSrzEfG2lN6ZvmfEpq0ih52Kx8=;
 b=rh6FqwC9IwW9Lgd8HQTloFfd3HmbQbBGciIE04NoXYiVugCCptB70BTvcOGlA3cmfc
 5wkKrkKClNBvUTrEbzeAWTbtFzjnwNupx8zpfPOWeyztwONH7C38ga66KbzVVIYDeoBw
 ceMOnRb47ShNXLggf/EIRYQR1a9G1DeXp1YHuI2KZikwEbKntzR8cLDRBZoTtm2k81dA
 zVDRBxMcKILb9wkCeAo+6X4QRpp6VtXu8zNtODSOgSHdVz0cgC/zH6cRHL6sV1HFxQ9B
 NyelfHsgQN8lKXOUOfxPNCfqPx2PX0LFM+oR/4re3iL2sKtyZlCuiWIj8eM5dAs0OB65
 f0Vw==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA1LzE3LzE5IDE2OjI3KSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgo+ID4gLi4uIGJ1
dCBtb3N0IGxpa2VseSBpdCdzIHV0dGVybHkgd3JvbmcuCj4gPiAKPiAKPiBKRkksIEkgcmVtb3Zl
ZCBrbWVtbGVhayBhbm5vdGF0aW9uCgptZWVlaGhoLi4uLgoKa21lbWxlYWs6IDIwNDYgbmV3IHN1
c3BlY3RlZCBtZW1vcnkgbGVha3MgKHNlZSAvc3lzL2tlcm5lbC9kZWJ1Zy9rbWVtbGVhaykKCnVu
cmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmOTVjYmVhNGU2MDYwIChzaXplIDE2KToKICBjb21tICJX
ZWIgQ29udGVudCIsIHBpZCAxMTkxLCBqaWZmaWVzIDQyOTQ3OTU2NjkgKGFnZSA3MzUuOTUwcykK
ICBoZXggZHVtcCAoZmlyc3QgMTYgYnl0ZXMpOgogICAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KICBiYWNrdHJhY2U6CiAg
ICBbPDAwMDAwMDAwZDA3ODFlYTQ+XSBudmttX21lbW9yeV90YWdzX2dldCsweDhlLzB4MTMwCiAg
ICBbPDAwMDAwMDAwMDYxZjNjODk+XSBnZjEwMF92bW1fdmFsaWQrMHgxOTYvMHgyZjAKICAgIFs8
MDAwMDAwMDBkNzkwODRiNz5dIG52a21fdm1tX21hcCsweGE4LzB4MzYwCiAgICBbPDAwMDAwMDAw
ZTMxNzRlMzM+XSBudmttX3ZyYW1fbWFwKzB4NDgvMHg1MAogICAgWzwwMDAwMDAwMDAwNmFkZGRi
Pl0gbnZrbV91dm1tX210aGQrMHg2NTgvMHg3NzAKICAgIFs8MDAwMDAwMDBiMzZmM2E4Yj5dIG52
a21faW9jdGwrMHhkZi8weDE3NwogICAgWzwwMDAwMDAwMDAzYWNlYTJjPl0gbnZpZl9vYmplY3Rf
bXRoZCsweGQ0LzB4MTAwCiAgICBbPDAwMDAwMDAwMzM4MjQyOTI+XSBudmlmX3ZtbV9tYXArMHhl
Yi8weDEwMAogICAgWzwwMDAwMDAwMDUzN2Y4NjI5Pl0gbm91dmVhdV9tZW1fbWFwKzB4NzkvMHhk
MAogICAgWzwwMDAwMDAwMGMzYjIwYjczPl0gbm91dmVhdV92bWFfbmV3KzB4MTlkLzB4MWMwCiAg
ICBbPDAwMDAwMDAwZGM5MTM4M2Y+XSBub3V2ZWF1X2dlbV9vYmplY3Rfb3BlbisweGQ0LzB4MTQw
CiAgICBbPDAwMDAwMDAwNWE1MzEyM2I+XSBkcm1fZ2VtX2hhbmRsZV9jcmVhdGVfdGFpbCsweGUz
LzB4MTYwCiAgICBbPDAwMDAwMDAwZTczM2Y1YTg+XSBub3V2ZWF1X2dlbV9pb2N0bF9uZXcrMHg2
ZS8weGQwCiAgICBbPDAwMDAwMDAwYjViZWJlZjU+XSBkcm1faW9jdGxfa2VybmVsKzB4OGMvMHhk
MAogICAgWzwwMDAwMDAwMDRmMjhkOGE2Pl0gZHJtX2lvY3RsKzB4MWM0LzB4MzYwCiAgICBbPDAw
MDAwMDAwYjA4YjU3MjM+XSBub3V2ZWF1X2RybV9pb2N0bCsweDYzLzB4YjAKCgktc3MKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
