Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8DF4B9B9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 15:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245F26E3C7;
	Wed, 19 Jun 2019 13:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A5D6E3C7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:21:18 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v24so3196141ljg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 06:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g18058N/C2pjcBGgjgbat4LbXOhva175NVhezQY00XQ=;
 b=bsYAu0TTe8lbVS7TeYSgoFT75F80IBetGBgQ06DLdvAbx6hJDRhucO43BGwk2O9Acn
 /WrW3DJEnl90XBogDDqtN+RI1bzpUiaeG7JvHOEcHWF9lLladBOEcd1m9YLCFNIdIcCZ
 YIfG5Hu5aWeCBvnFxw8LfwIk3kY0DRb0ToLj0CEOeCLkXVRQjNwJAhVWb00zWh3Ktz92
 tZcGyCQJVcKsUGNdrbx0BmPe+9pEWXWjHcc/HIbuNQAbCs/XkQGekIGMJtL6/rw9aDqC
 nOow63Ny/i6OJQOsH923O/6np4mhgTEivlwCLwkNkKDbpZGM5iQDhOFJhFKyfzPVZ97V
 rKkg==
X-Gm-Message-State: APjAAAXkYrU4Y6Fb+W/32yG2cyK4GanE6/a8u6yqBq26L+qsMDsWEXyw
 ffXrhUkKWNScw0YbnQ1d3QuGTvfxR6PRdnWJOqE=
X-Google-Smtp-Source: APXvYqyAMgmk6ys/VsOTesM/6z0KH2z75G1WFcyJbVadMJ+QdScEq8u41WtyiImcwlE2f5Aw7kaHsoWTLJ1vAaQzsSs=
X-Received: by 2002:a2e:2c07:: with SMTP id s7mr26636418ljs.44.1560950476875; 
 Wed, 19 Jun 2019 06:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <1560864646-1468-1-git-send-email-robert.chiras@nxp.com>
 <1560864646-1468-2-git-send-email-robert.chiras@nxp.com>
In-Reply-To: <1560864646-1468-2-git-send-email-robert.chiras@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Jun 2019 10:21:29 -0300
Message-ID: <CAOMZO5DwwL5+V4Eifskk=pKzpceRmk5bvdXNeCzZfU3jVwEhEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add support for
 Raydium RM67191 panel
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=g18058N/C2pjcBGgjgbat4LbXOhva175NVhezQY00XQ=;
 b=tjPmzkP70fAsA26NOsSJclg4L+TUZI/ysTww8TpmgX4bSxFk0ASk0tUeVxZuNORPdX
 CaTllXz7jbARzX1I+8qPEuPUZEOsjB+KDB3Jb+fLCml0fPsBUa/FuOxzBwydfY2JK1Kp
 r0PZhb5pEycAT29k5T34UFbUu18o+yFJN9b4J52B+vPAdP0nKwcLyrjY7GjDMTFsycmT
 N9GdVXdkfxSFregeODQs8CG4BXAH6S4P610UDPJvTkt+UbskAb69T4eA/Df8KacxurAF
 dDgMS2W8C2xv7HdoziJtd0uFWbPc1TJnRsgByjPlGasOqZiTdNTyIhJ51E1YWvH8+B2z
 TEbw==
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
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKT24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTA6MzMgQU0gUm9iZXJ0IENoaXJh
cyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPiB3cm90ZToKCj4gK09wdGlvbmFsIHByb3BlcnRpZXM6
Cj4gKy0gcmVzZXQtZ3Bpb3M6ICAgICAgICAgYSBHUElPIHNwZWMgZm9yIHRoZSBSU1RfQiBHUElP
IHBpbgo+ICstIHBpbmN0cmwtMCAgICAgICAgICAgIHBoYW5kbGUgdG8gdGhlIHBpbiBzZXR0aW5n
cyBmb3IgdGhlIHJlc2V0IHBpbgo+ICstIHdpZHRoLW1tOiAgICAgICAgICAgIHBoeXNpY2FsIHBh
bmVsIHdpZHRoIFttbV0KPiArLSBoZWlnaHQtbW06ICAgICAgICAgICBwaHlzaWNhbCBwYW5lbCBo
ZWlnaHQgW21tXQo+ICstIGRpc3BsYXktdGltaW5nczogICAgIHRpbWluZ3MgZm9yIHRoZSBjb25u
ZWN0ZWQgcGFuZWwgYWNjb3JkaW5nIHRvIFsxXQoKU3RpbGwgbm90IGNvbnZpbmNlZCB3ZSBuZWVk
IHRoZSAnZGlzcGxheS10aW1pbmdzJyBwcm9wZXJ0eSwgZXZlbiBhcyBhbgpvcHRpb25hbCBwcm9w
ZXJ0eS4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHBhc3NpbmcgZGlzcGxheSB0aW1pbmdzIGlu
CnRoZSBkZXZpY2V0cmVlIGlzIG5vdCBlbmNvdXJhZ2VkLgoKTGFzdCB0aW1lIHlvdSBzYWlkIHlv
dSBuZWVkIHRvIHBhc3MgJydkaXNwbGF5LXRpbWluZ3MnIHRvIHdvcmthcm91bmQKdGhlIHByb2Js
ZW0gb2YgY29ubmVjdGluZyB0aGlzIHBhbmVsIHRvIG14OG0gRENTUyBvciBlTENESUYuCgpUaGUg
cGFuZWwgdGltaW5ncyBjb21lIGZyb20gdGhlIExDRCBtYW51ZmFjdHVyZXIgYW5kIGl0IGlzIGFn
bm9zdGljIHRvCndoYXQgZGlzcGxheSBjb250cm9sbGVyIGludGVyZmFjZSBpdCBpcyBjb25uZWN0
ZWQgdG8uCgpTbyBJIHN1Z2dlc3QgbWFraW5nIHN1cmUgdGhlIHRpbWluZ3MgcGFzc2VkIGluIHRo
ZSBkcml2ZXIgYXJlIGNvcnJlY3QKYXMgcGVyIHRoZSB2ZW5kb3IgZGF0YXNoZWV0LiBJZiB0aGV5
IGFyZSBjb3JyZWN0IGFuZCBvbmUgc3BlY2lmaWMKaW50ZXJmYWNlIGlzIG5vdCBhYmxlIHRvIGRy
aXZlIGl0LCB0aGVuIHByb2JhYmx5IGl0IGlzIGEgYnVnIGluIHRoaXMKc3BlY2lmaWMgZGlzcGxh
eSBjb250cm9sbGVyIGludGVyZmFjZSBvciBpbiB0aGUgU29DIGNsb2NrIGRyaXZlci4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
