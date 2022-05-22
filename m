Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86BF530977
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD95710EADC;
	Mon, 23 May 2022 06:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609B910E00A
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 10:53:09 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id h13so5052451pfq.5
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 03:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:references:mime-version:message-id
 :content-transfer-encoding;
 bh=bSbLSYLiEVp5Ck75TvixzyuLOTYB4+YAC/RLwIpjiSE=;
 b=oOmOzcOCSEk/WVR9gogBlVXlbC+V8Yhj+SWAhCXFbfy9LncFZjitmN4O+IcmRrjmsV
 2vOeMMJa3X7fb6G+0nUKOZQx43MAsPKyLqZfLl0aw3JjRcGdI2IPXGH5aEuLFIjwYlkE
 CJfPRxaTz4H+ld7jH40fhBkfE9k3uC1DE9KEZx61sAbPvj8XMerqLMcIPxpKu0+lEv9h
 jgXyaHSUMfa+CCaO1anbRFgBLMjxYhCXvgMslS897C7DqW3AkOZLImftxZfcMtpd7+Qi
 zNqqT86NHh1TS5Oqiaoht2Hrn6U4aJ1EqHjKaT2Vxja+HnEv2iTT9nme8+ah8jyQGOvq
 uqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:references:mime-version
 :message-id:content-transfer-encoding;
 bh=bSbLSYLiEVp5Ck75TvixzyuLOTYB4+YAC/RLwIpjiSE=;
 b=eIzIuEWyT/P6TBpox+p+D/amWIUFCimOwexRgXTFyHXMpwBysNTx5uRU7+4/4E5ZXT
 cCo1WiV78/yN/xFEPQmqqDQBweUbig3pIZuLPDr+/4BhH/xOpfkRhmSWFNqQJ3pMoJF4
 sAr8VIEmGXWF5Jl9Ggo7SIxYokJdwVOvYQkMUHbb406W3oYhxn21wcEWddKMZqNUOACF
 OkwmV4q567Tmkw0mwyFV3K+VFfvijQjzIgBB86yAs+Yh6ZYl9FGcQRck0KcxY7EARBwp
 QleL9LygVPlA7cO8UnScLUwWartXylt3IRwEc6pFyo6zTsJRpF0BuPEi0jUHF6/Gbc9m
 QvuQ==
X-Gm-Message-State: AOAM531f0TWxGOnlLdcrnW++DUPXOSaToY1KneoMmrI0FkUW2Y/tcq75
 sZRybziC9L6xLxMWE7+tWVn+QlXQXuIYLYzY
X-Google-Smtp-Source: ABdhPJzuGobPl0n/IDwG0R6zGw+enGaFKapO6cpkrcksA2pK/rcVkCHeFnnQEze9bx97oxKIyAQWRQ==
X-Received: by 2002:a63:3d87:0:b0:3f6:1c54:b315 with SMTP id
 k129-20020a633d87000000b003f61c54b315mr16471834pga.432.1653216789034; 
 Sun, 22 May 2022 03:53:09 -0700 (PDT)
Received: from DESKTOP-PUVK7A5 ([144.24.65.202])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a1709028d9700b0016160b3331bsm973618plo.305.2022.05.22.03.53.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 May 2022 03:53:08 -0700 (PDT)
Date: Sun, 22 May 2022 18:53:14 +0800
From: "benlypan@gmail.com" <benlypan@gmail.com>
To: jernej.skrabec <jernej.skrabec@gmail.com>, mripard <mripard@kernel.org>, 
 wens <wens@csie.org>
Subject: Re: [PATCH] drm/sun4i: mixer: fix scanline for V3s and D1
References: <20220521133443.1114749-1-benlypan@gmail.com>, 
 <3173956.44csPzL39Z@jernej-laptop>
X-Priority: 3
X-GUID: 44554B07-4D1B-4258-8E6F-B7B805B582F0
X-Has-Attach: no
X-Mailer: Foxmail 7.2.20.259[cn]
Mime-Version: 1.0
Message-ID: <202205221853133067396@gmail.com>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Mon, 23 May 2022 06:25:06 +0000
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
Cc: samuel <samuel@sholland.org>, airlied <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-sunxi <linux-sunxi@lists.linux.dev>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmVybmVqIQoKPiBXaGljaCBTREs/IEFsbCBTREtzIHRoYXQgSSBoYXZlIG9yIGZvdW5kIG9u
IGludGVybmV0IGRvbid0IG1lbnRpb24gWVVWIG5vciBSR0IKPiBzY2FubGluZSBsaW1pdC4gVGhh
dCBkb2Vzbid0IG1lYW4gdGhlcmUgaXMgbm9uZSwgSSdtIGp1c3QgdW5hYmxlIHRvIHZlcmlmeQo+
IHlvdXIgY2xhaW0uIERpZCB5b3UgdGVzdCB0aGlzIGJ5IHlvdXJzZWxmPyBBbHNvLCBwbGVhc2Ug
bWFrZSBZVVYgc2NhbmxpbmUKPiBjaGFuZ2Ugc2VwYXJhdGUgcGF0Y2ggd2l0aCBmaXhlcyB0YWcu
CgpIZXJlIGlzIHRoZSBjb2RlIGFib3V0IHNjYW5saW5lIGNvbmZpZyBmb3IgVjNzOgpodHRwczov
L2dpdGh1Yi5jb20vVGluYS1MaW51eC90aW5hLXYzcy1saW51eC00LjkvYmxvYi9tYXN0ZXIvZHJp
dmVycy92aWRlby9mYmRldi9zdW54aS9kaXNwMi9kaXNwL2RlL2xvd2xldmVsX3N1bjhpdzgvZGVf
ZmVhdC5jI0w1NQpodHRwczovL2dpdGh1Yi5jb20vVGluYS1MaW51eC90aW5hLXYzcy1saW51eC00
LjkvYmxvYi9tYXN0ZXIvZHJpdmVycy92aWRlby9mYmRldi9zdW54aS9kaXNwMi9kaXNwL2RlL2xv
d2xldmVsX3N1bjhpdzgvZGVfcnRteC5jI0wxMjEyCgpBbmQgaGVyZSBpcyBmb3IgRDE6Cmh0dHBz
Oi8vZ2l0bGFiLmNvbS93ZWlkb25nc2hhbi90aW5hLWQxLWgvLS9ibG9iL21haW4vbGljaGVlL2xp
bnV4LTUuNC9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnhpL2Rpc3AyL2Rpc3AvZGUvbG93bGV2ZWxf
djJ4L2RlX2ZlYXQuYyNMMTgyCmh0dHBzOi8vZ2l0bGFiLmNvbS93ZWlkb25nc2hhbi90aW5hLWQx
LWgvLS9ibG9iL21haW4vbGljaGVlL2xpbnV4LTUuNC9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnhp
L2Rpc3AyL2Rpc3AvZGUvbG93bGV2ZWxfdjJ4L2RlX3J0bXguYyNMMTU4OAoKSSB3YXMgdGVzdGVk
IGl0IG9uIFYzcy4gV2l0aG91dCB0aGlzIHBhdGNoLCB0aGUgcGxhbmUgd2lsbCBub3QgZGlzcGxh
eQpjb3JyZWN0bHkgaWYgc3JjX3cgbGFyZ2UgdGhhbiAxMDI0LCBmb3IgYm90aCBZVVYgYW5kIFJH
Qi4gSSBkb24ndCBoYXZlIGEKZGV2aWNlIHdpdGggRDEsIHNvIEQxIGlzIG5vdCB0ZXN0ZWQuIEJ1
dCBhY2NvcmRpbmcgdG8gdGhlIFNESyBjb2RlIG9mIEQxLAp0aGUgc2NhbmxpbmUgdmFsdWUgb2Yg
bWl4ZXIxIGlzIDEwMjQuCgpJJ20gbmV3IHRvIHN1Ym1pdHRpbmcgcGF0Y2hlcywgU28gbWF5IEkg
YXNrIGEgcXVlc3Rpb24/IElmIHRoZXJlIGlzIG5vCnByb2JsZW0gd2l0aCB0aGlzIHBhdGNoLCB3
aGF0IEkgbmVlZCB0byBkbyBpcyB0byBzZW5kIG5ldyBwYXRjaGVzIGFzIHlvdQpzdWdnZXN0ZWQ/
CgpCZXN0IHJlZ2FyZHMsCkdlbmZ1IFBhbgoK

