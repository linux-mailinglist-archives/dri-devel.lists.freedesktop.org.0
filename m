Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C43173E3
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924C489718;
	Wed,  8 May 2019 08:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF8A89718
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 08:33:09 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w37so21274984edw.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 01:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=pK6wVbjmnvB/fkRhlO06WndQQley/CLsWlKi7Lo/4rk=;
 b=nIRWjq2veTznwSolRGVYbQoEeFE7lBKMnqe9rmQo7DxuqCxStmvPkxHSnVob2/6Mre
 9FROiEY7UYZjAJtPTUg3B+cYNVjZXdMuOcmwi8zTc3TV0QFUVkLZDlizmJ8OCdXLJqrC
 MxVcZzibdjsDefYPEK9XaHRYuavCbQIB2wUmMj4QzZrwjG9YFKZ+mAinFEKlpm3pKCgg
 OAc8L8hNz4Zux//2QAB2iWcz/jfC11N59hFtG8lEVUKcKG/s5QE2THM0RhIsbr8M4Awk
 +pAXuSsD7GVfpnjvmeZoXnDot/EJsDfghBHZpC7pa2HWYKzbO3Je7NeXOll0flDdpccN
 1KcA==
X-Gm-Message-State: APjAAAW8gP/PPWCHIzq6WoUjYU84DbBrYJzHJ6XscTJhJRGwqGEcEs3G
 ri3F4a3DMe/rIDITANMFqqsfdg==
X-Google-Smtp-Source: APXvYqwUkZlPgHY9vRwVHZGsHkyTtIbJaS1tfENj3GHg4lDVQYijjVoHXXBWgmsCGnRbNduUH4WMew==
X-Received: by 2002:a50:8927:: with SMTP id e36mr38416424ede.54.1557304387856; 
 Wed, 08 May 2019 01:33:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m27sm2593869eje.67.2019.05.08.01.33.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 01:33:06 -0700 (PDT)
Date: Wed, 8 May 2019 10:33:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH RE-RESEND 1/2] drm/panel: Add support for Armadeus ST0700
 Adapt
Message-ID: <20190508083303.GR17751@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 Fabio Estevam <festevam@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 stable <stable@vger.kernel.org>,
 =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5B2nMsVNO6O_D+YTSjux=-DjNPGxhkEi3AQquOZVODumA@mail.gmail.com>
 <20190507161950.GA24879@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507161950.GA24879@ravnborg.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=pK6wVbjmnvB/fkRhlO06WndQQley/CLsWlKi7Lo/4rk=;
 b=jyKQzz7bipEyXQ6mMXMUmxM55YNMYTV09/uuB5zNRCY0/9ZBIP+Lfyi94AaxP8Hj0y
 hnYPMzZdHpSUNgX7RXjh+tdhhT8nVwCAOFUoj8mudlIsy8+E2rpAyby34PhbMF66SUe3
 RGDCf2Tg5xAYPjSK0ABIlA3ukX0dLv5ZwK9Bs=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 stable <stable@vger.kernel.org>,
 =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDY6MTk6NTBQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIEZhYmlvCj4gCj4gT24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMTI6MzM6MzlQTSAt
MDMwMCwgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiA+IFtBZGRpbmcgU2FtLCB3aG8gaXMgaGVscGlu
ZyB0byByZXZpZXcvY29sbGVjdCBwYW5lbC1zaW1wbGUgcGF0Y2hlc10KPiA+IAo+ID4gT24gVHVl
LCBNYXkgNywgMjAxOSBhdCAxMjoyNyBQTSBTw6liYXN0aWVuIFN6eW1hbnNraQo+ID4gPHNlYmFz
dGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBwYXRj
aCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBBcm1hZGV1cyBTVDA3MDAgQWRhcHQuIEl0IGNvbWVzIHdp
dGggYQo+ID4gPiBTYW50ZWsgU1QwNzAwSTVZLVJCU0xXIDcuMCIgV1ZHQSAoODAweDQ4MCkgVEZU
IGFuZCBhbiBhZGFwdGVyIGJvYXJkIHNvCj4gPiA+IHRoYXQgaXQgY2FuIGJlIGNvbm5lY3RlZCBv
biB0aGUgVEZUIGhlYWRlciBvZiBBcm1hZGV1cyBEZXYgYm9hcmRzLgo+ID4gPgo+ID4gPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY0LjE5Cj4gPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6
eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAKPiBJZiB5b3Ugd2lsIGxyZXNlbmQg
dGhlIHBhdGNoIEkgY2FuIGFwcGx5IGl0Lgo+IEkgaGF2ZSBsb3N0IHRoZSBvcmlnaW5hbCBtYWls
LgoKVXN1YWxseSBwYXRjaHdvcmsgc2hvdWxkIGhhdmUgaXQgYWxyZWFkeSAoYW5kIHlvdSBjYW4g
cGlwZSB0aGUgcmF3CnBhdGNod29yayBtYm94IGludG8gZGltIGFwcGx5KSwgYnV0IHNvbWVob3cg
aXQncyBub3QgdGhlcmUgZWl0aGVyLgpOb3Qgc3VyZSB3aHksIHNvbWV0aW1lcyB0aGlzIGlzIGJl
Y2F1c2UgbWFpbHMgYXJlIHN0dWNrIGluIG1vZGVyYXRpb24sCnNvbWV0aW1lcyBiZWNhdXNlIHBl
b3BsZSBkbyBpbnRlcmVzdGluZyB0aGluZ3Mgd2l0aCB0aGVpciBtYWlscyAoZS5nLiBzbXRwCnNl
cnZlcnMgbWFuZ2xpbmcgZm9ybWF0dGluZykuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
