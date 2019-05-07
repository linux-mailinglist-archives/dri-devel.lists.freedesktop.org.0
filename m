Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ACE166D2
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 17:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C6A6E7EB;
	Tue,  7 May 2019 15:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472186E7EB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 15:34:47 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q10so14760708ljc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 08:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zVPm+iA8UXfnyytWDD0bNAyKVw8r/B8z7jwx9A/Rbus=;
 b=YtZgXp2zwpD7oEifA8cCC0g5PPGVCOU5vPp/a8uALbaVZZuFGXDxjV70pxnwFF+VmI
 cvBPy8AmN1Z5IwOVMCJq/c0laPIuPgfrs6vQDkdzqooqD6jvriTDmErgA9zvYzeXfhRl
 CtQ+IMuB0dUP71l/Jh2Og95y1V6mVZIKvFNQ08O64eK/rEBMtGQcxcNnMHEQ/Eje42GO
 BUq9DD9H5ChBJoHMYAF5nvISttIr2OOVJ9r54tTRGKsm+SnB7WhPb90kJH6o78mIIGIl
 sltuoEXOaOS48ukzEDXBk69mu7QSY/d6dQH36rKiYT1Ke0JJqW1pqcf2LIbMpust445U
 kuIQ==
X-Gm-Message-State: APjAAAXq1GEnqTUj7y+OiboE7UdQ4EkSlcpwgEj1wx/5uJaZaxETobIm
 7dQbp5cmrzekFIthbDiYYJg7SgRhvReGLBK4uJ0=
X-Google-Smtp-Source: APXvYqxjikTtYXoUUvyDuWS3S+iQSmIeLX+KO7rhcOaHnuFa7qaK3eqAbOCl2ZZq/GAnYu4xaDb1G8ncZRoHtYmR3B4=
X-Received: by 2002:a2e:9188:: with SMTP id f8mr15331839ljg.100.1557243285680; 
 Tue, 07 May 2019 08:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
 <20190507152713.27494-2-sebastien.szymanski@armadeus.com>
In-Reply-To: <20190507152713.27494-2-sebastien.szymanski@armadeus.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 May 2019 12:34:48 -0300
Message-ID: <CAOMZO5Ca7tZAb0vO8ZM1oKR2UXNV_KqcJ7oxeiV3kkb7=2jQBA@mail.gmail.com>
Subject: Re: [PATCH RE-RESEND 2/2] ARM: dts: opos6uldev: use OF graph to
 describe the display
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zVPm+iA8UXfnyytWDD0bNAyKVw8r/B8z7jwx9A/Rbus=;
 b=OFC/zfgB3JVNqG9xBB4T7ZJLwevlNgQAhHLrrCGHo70ZSK1aA9+jvfeYxjsvax4RIp
 QFQWQ6MkBpKOu0oFf7EkN5Lxt1qt3OUnLqDa/E4XMHuhtCDQag13uZ+7fU+zZQaxTWRV
 3kb8VhUYCevaBOA1V+WzT2ygwHjHQKExj5iLc2oALlUOWpOriru0Iku4IW6dlNUXGFn5
 1Q8pFLTpxnCZB/JRNu2WvCSnntc4A3t83IkBmVBkRdR+0bfPjGhTLgKU7K1DmZ2e1uQ/
 Z98tnaxiU5wJ7E2zvyraa1dOZ1P0qVQ4iXNKNgeq5yZQAEXzAkjiJLHKRWD0hZOa6eZL
 DDpw==
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 stable <stable@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU8OpYmFzdGllbiwKCk9uIFR1ZSwgTWF5IDcsIDIwMTkgYXQgMTI6MjcgUE0gU8OpYmFzdGll
biBTenltYW5za2kKPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPiB3cm90ZToKPgo+
IFRvIG1ha2UgdXNlIG9mIHRoZSBuZXcgZUxDRElGIERSTSBkcml2ZXIgT0YgZ3JhcGggZGVzY3Jp
cHRpb24gaXMKPiByZXF1aXJlZC4gRGVzY3JpYmUgdGhlIGRpc3BsYXkgdXNpbmcgT0YgZ3JhcGgg
bm9kZXMuCj4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY0LjE5CgpUaGUgQ2MgdG8g
c3RhYmxlIGFwcGxpZXMgdG8gYnVnZml4ZXMsIHdoaWNoIGlzIG5vdCB0aGUgY2FzZSBoZXJlLgoK
V2l0aCBzdWNoIHRhZyByZW1vdmVkOgoKUmV2aWV3ZWQtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3Rl
dmFtQGdtYWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
