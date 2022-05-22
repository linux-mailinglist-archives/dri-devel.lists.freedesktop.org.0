Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DBF530972
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2D510EC83;
	Mon, 23 May 2022 06:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC4010E179
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 10:48:22 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id i1so10779409plg.7
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:references:mime-version:message-id;
 bh=Kh/n9vuXVQd8fgnIcZMaRuPO1vU9hAZGR+74/5wDLh0=;
 b=HC6d3nNhKdEpTXCN+oCkF+J2VoS9KMqtLOK/C+qVW/PPxhfumEtsf7EvHttSX5E2s/
 Tuu/lUUYQ5DXZbW4iEYLTsTggqThlERuCO92rXIZ3szDwBEPgilKy2JNsUcFEvpIjwcg
 DlWgT8P3MZ5sA0BKEUKlb1vJf2/SwnHApNXEuPZ65vdpPRWOXHsjSvCJ/AVclO3TEbFe
 VWCOK5VSib7Cy0rUG/pKG9jFiVkZ2QOHDKkZlk1S/ei3qODE1//XFOcyqh79INCp1rND
 BRCJJrMmy/N2UIYoU29G9H3gJdXqOUqw7gJFZu+EhmtApjeF2tADZYszAiPF1W046gw1
 ATAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:references:mime-version
 :message-id;
 bh=Kh/n9vuXVQd8fgnIcZMaRuPO1vU9hAZGR+74/5wDLh0=;
 b=207/TpDf5IE120A69SrbNKDZtTeoj8/T2pl84y7eLo7vFoTBklTYnraQy0HQpyrQUb
 CXwkkYuTi9VtPmeSvMYbmkwlfOLZGNWqIbmWeMz2QylLEtOqLhErOcqGUJDXv4pCXQ48
 3tNI7ODoDCTO1b8yDbbxmFtRa7WJh583A4+vWbaYBAgYSH9jJ2GpUfKG8c3HQ68IYEbM
 abdn1g2P6z1jQxzPLNMWI+h27DgRI/ArhWlgw7hTiR7MJhSJwvcro2XC+sveJcE9Mo+V
 DmLyC1aDtU3Muziw3rIVABGmZ689clFIUrueabpNr5KP8JEA6COrzDGzTAqhZmbO8znf
 peMw==
X-Gm-Message-State: AOAM532fzflO+pcZbs6Po/j2ng6ZsaXEnvDVu+eS3C7mk9D43Uwdj5Ds
 9//dm/83MY+sPUZOZJsqKW4=
X-Google-Smtp-Source: ABdhPJwiaABM8+g/9eq+3xUXUWvSKV4zlUPDkLnaIbK8OEH4olBJ1RbRiR6M94HOFF0woJWdeFmlzA==
X-Received: by 2002:a17:902:ead5:b0:161:7a01:be10 with SMTP id
 p21-20020a170902ead500b001617a01be10mr18270166pld.4.1653216502207; 
 Sun, 22 May 2022 03:48:22 -0700 (PDT)
Received: from DESKTOP-PUVK7A5 ([144.24.65.202])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a62bd0c000000b0050dc7628188sm5067939pff.98.2022.05.22.03.48.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 May 2022 03:48:21 -0700 (PDT)
Date: Sun, 22 May 2022 18:48:27 +0800
From: "benlypan@gmail.com" <benlypan@gmail.com>
To: jernej.skrabec <jernej.skrabec@gmail.com>, mripard <mripard@kernel.org>, 
 wens <wens@csie.org>
Subject: Re: [PATCH] drm/sun4i: mixer: fix scanline for V3s and D1
References: <20220521133443.1114749-1-benlypan@gmail.com>, 
 <3173956.44csPzL39Z@jernej-laptop>
X-Priority: 3
X-GUID: C2789BE2-AEB8-4336-A815-853BAF306557
X-Has-Attach: no
X-Mailer: Foxmail 7.2.20.259[cn]
Mime-Version: 1.0
Message-ID: <202205221848264427024@gmail.com>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart552572204643_=----"
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

This is a multi-part message in MIME format.

------=_001_NextPart552572204643_=----
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgSmVybmVqIQ0KDQo+IFdoaWNoIFNESz8gQWxsIFNES3MgdGhhdCBJIGhhdmUgb3IgZm91bmQg
b24gaW50ZXJuZXQgZG9uJ3QgbWVudGlvbiBZVVYgbm9yIFJHQg0KPiBzY2FubGluZSBsaW1pdC4g
VGhhdCBkb2Vzbid0IG1lYW4gdGhlcmUgaXMgbm9uZSwgSSdtIGp1c3QgdW5hYmxlIHRvIHZlcmlm
eQ0KPiB5b3VyIGNsYWltLiBEaWQgeW91IHRlc3QgdGhpcyBieSB5b3Vyc2VsZj8gQWxzbywgcGxl
YXNlIG1ha2UgWVVWIHNjYW5saW5lDQo+IGNoYW5nZSBzZXBhcmF0ZSBwYXRjaCB3aXRoIGZpeGVz
IHRhZy4NCg0KSGVyZSBpcyB0aGUgY29kZSBhYm91dCBzY2FubGluZSBjb25maWcgZm9yIFYzczoN
Cmh0dHBzOi8vZ2l0aHViLmNvbS9UaW5hLUxpbnV4L3RpbmEtdjNzLWxpbnV4LTQuOS9ibG9iL21h
c3Rlci9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnhpL2Rpc3AyL2Rpc3AvZGUvbG93bGV2ZWxfc3Vu
OGl3OC9kZV9mZWF0LmMjTDU1DQpodHRwczovL2dpdGh1Yi5jb20vVGluYS1MaW51eC90aW5hLXYz
cy1saW51eC00LjkvYmxvYi9tYXN0ZXIvZHJpdmVycy92aWRlby9mYmRldi9zdW54aS9kaXNwMi9k
aXNwL2RlL2xvd2xldmVsX3N1bjhpdzgvZGVfcnRteC5jI0wxMjEyDQoNCkFuZCBoZXJlIGlzIGZv
ciBEMToNCmh0dHBzOi8vZ2l0bGFiLmNvbS93ZWlkb25nc2hhbi90aW5hLWQxLWgvLS9ibG9iL21h
aW4vbGljaGVlL2xpbnV4LTUuNC9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnhpL2Rpc3AyL2Rpc3Av
ZGUvbG93bGV2ZWxfdjJ4L2RlX2ZlYXQuYyNMMTgyDQpodHRwczovL2dpdGxhYi5jb20vd2VpZG9u
Z3NoYW4vdGluYS1kMS1oLy0vYmxvYi9tYWluL2xpY2hlZS9saW51eC01LjQvZHJpdmVycy92aWRl
by9mYmRldi9zdW54aS9kaXNwMi9kaXNwL2RlL2xvd2xldmVsX3YyeC9kZV9ydG14LmMjTDE1ODgN
Cg0KSSB3YXMgdGVzdGVkIGl0IG9uIFYzcy4gV2l0aG91dCB0aGlzIHBhdGNoLCB0aGUgcGxhbmUg
d2lsbCBub3QgZGlzcGxheQ0KY29ycmVjdGx5IGlmIHNyY193IGxhcmdlIHRoYW4gMTAyNCwgZm9y
IGJvdGggWVVWIGFuZCBSR0IuIEkgZG9uJ3QgaGF2ZSBhDQpkZXZpY2Ugd2l0aCBEMSwgc28gRDEg
aXMgbm90IHRlc3RlZC4gQnV0IGFjY29yZGluZyB0byB0aGUgU0RLIGNvZGUgb2YgRDEsDQp0aGUg
c2NhbmxpbmUgdmFsdWUgb2YgbWl4ZXIxIGlzIDEwMjQuDQoNCkknbSBuZXcgdG8gc3VibWl0dGlu
ZyBwYXRjaGVzLCBTbyBtYXkgSSBhc2sgYSBxdWVzdGlvbj8gSWYgdGhlcmUgaXMgbm8NCnByb2Js
ZW0gd2l0aCB0aGlzIHBhdGNoLCB3aGF0IEkgbmVlZCB0byBkbyBpcyB0byBzZW5kIG5ldyBwYXRj
aGVzIGFzIHlvdQ0Kc3VnZ2VzdGVkPw0KDQpCZXN0IHJlZ2FyZHMsDQpHZW5mdSBQYW4NCg0K

------=_001_NextPart552572204643_=----
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DISO-8859-1"><style>body { line-height: 1.5; }blockquote { margin-top: =
0px; margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font=
-family: "Segoe UI"; color: rgb(0, 0, 0); line-height: 1.5; }</style></hea=
d><body>=0A<div><span></span><div><div>Hi Jernej!</div><div><br></div><div=
>&gt; Which SDK? All SDKs that I have or found on internet don't mention Y=
UV nor RGB</div><div>&gt; scanline limit. That doesn't mean there is none,=
 I'm just unable to verify</div><div>&gt; your claim. Did you test this by=
 yourself? Also, please make YUV scanline</div><div>&gt; change separate p=
atch with fixes tag.</div><div><br></div><div>Here is the code about scanl=
ine config for V3s:</div><div>https://github.com/Tina-Linux/tina-v3s-linux=
-4.9/blob/master/drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_sun8iw8/=
de_feat.c#L55</div><div>https://github.com/Tina-Linux/tina-v3s-linux-4.9/b=
lob/master/drivers/video/fbdev/sunxi/disp2/disp/de/lowlevel_sun8iw8/de_rtm=
x.c#L1212</div><div><br></div><div>And here is for D1:</div><div>https://g=
itlab.com/weidongshan/tina-d1-h/-/blob/main/lichee/linux-5.4/drivers/video=
/fbdev/sunxi/disp2/disp/de/lowlevel_v2x/de_feat.c#L182</div><div>https://g=
itlab.com/weidongshan/tina-d1-h/-/blob/main/lichee/linux-5.4/drivers/video=
/fbdev/sunxi/disp2/disp/de/lowlevel_v2x/de_rtmx.c#L1588</div><div><br></di=
v><div>I was tested it on V3s. Without this patch, the plane will not disp=
lay</div><div>correctly if src_w large than 1024, for both YUV and RGB. I =
don't have a</div><div>device with D1, so D1 is not tested. But according =
to the SDK code of D1,</div><div>the scanline value of mixer1 is 1024.</di=
v><div><br></div><div>I'm new to submitting patches, So may I ask a questi=
on? If there is no</div><div>problem with this patch, what I need to do is=
 to send new patches as you</div><div>suggested?</div><div><br></div><div>=
Best regards,</div><div>Genfu Pan</div></div></div><div><br></div><blockqu=
ote style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: 0.5em; marg=
in-Right: inherit"><div>=0A</div></blockquote>=0A</body></html>
------=_001_NextPart552572204643_=------

