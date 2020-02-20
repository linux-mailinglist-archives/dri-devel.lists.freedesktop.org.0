Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A7E165D0D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 13:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1972F6ED3B;
	Thu, 20 Feb 2020 12:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FF36ED38;
 Thu, 20 Feb 2020 12:00:17 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id p14so2471105vsq.6;
 Thu, 20 Feb 2020 04:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2maRxbwaWQdYG4KYSFEZQXuW4XTvPWB6+BI1DcPAf7s=;
 b=uiPbHKi5ifQGd/+vU3Bg2bWwW7uLXfeb9jyg9h2kuFqSvFAb1meTuoyQT7Y9xyn+yh
 4GG01nAiQRzNFnEJrL47dFGQKR1BYAmbCJf+MfMsaxFYIJuOV/5vU6V05TXW0iicvMgx
 T7tuBRl0TROqcMMqKJh83gz12LnbkmlMWphR1KmZU8esWp5KmbFCQID1SH7M7DIdj/7e
 wjmfYeR4RdGMh8NA8mptJhe16sKbTGyIRlaVruSMOr7muGBwwGjUvNRt/vVGeEyq9xL0
 zYGcpP0qYWT/GA6N40zvpI8RYaTAIz4/1gP/YlGXbiNKi0PkhuHjxSgonlp/utReHYwp
 HLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2maRxbwaWQdYG4KYSFEZQXuW4XTvPWB6+BI1DcPAf7s=;
 b=aBWjwmgqWmRrD3MQWOch+smgMDutJP2QWZax1U2K6oHv6j5I0ptbZjFSq5K+2DAyII
 2gcKmLeySdiRwLQwavx8cS9W4leVEQSJIdGOfnka6m+D5xhZ8lhm2T4CDTQrC+8jtN9x
 uOAjBAARubWFPc2I6EK/mhfglK9jT/rTyMt9GOQ1ljqMPOAWvX5y5Kwv3OCprx/4sTlP
 ZRT2unjDr32Vp/Bs6l3raKYIME4NhrwJ3rCPAqXTV9Y6t4AVWaVcJvEBcucDM6OkXYay
 Qn8W8r3BKOnYz41Ns8loM2SwqQZTso91Dvfeg+TYWhEw1HGvoMnGI7QvG8k8JauWiKRa
 AHFg==
X-Gm-Message-State: APjAAAUCPpWFxe13w2hvNz82cz3mYZwQwG7ip1wBUdnua15o5F1NmK4f
 CcAf41ZrPTk65eNR8carcLceDV9cBUGUve+uHgQ=
X-Google-Smtp-Source: APXvYqxXNcOfGZ2acPaakwTwE7nSVQySWcCd6QGUbcsKuezSgJtJAGBBcyUTM0+jsTO+dzIDRVrFr42LH1TZAFyMVv0=
X-Received: by 2002:a67:c204:: with SMTP id i4mr17663271vsj.118.1582200016567; 
 Thu, 20 Feb 2020 04:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20200219203544.31013-5-ville.syrjala@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Feb 2020 12:00:04 +0000
Message-ID: <CACvgo52gOX7OioTqaLUEi1Luc49y2FpREv5ERRP5DPYxodRMLw@mail.gmail.com>
Subject: Re: [PATCH 04/12] drm: Nuke mode->vrefresh
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-amlogic@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBGZWIgMjAyMCBhdCAyMDozNiwgVmlsbGUgU3lyamFsYQo8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IEdldCByaWQgb2YgbW9kZS0+dnJlZnJlc2gg
YW5kIGp1c3QgY2FsY3VsYXRlIGl0IG9uIGRlbWFuZC4gU2F2ZXMKPiBhIGJpdCBvZiBzcGFjZSBh
bmQgYXZvaWRzIHRoZSBjYWNoZWQgdmFsdWUgZ2V0dGluZyBvdXQgb2Ygc3luYwo+IHdpdGggcmVh
bGl0eS4KPgo+IE1vc3RseSBkb25lIHdpdGggY29jY2ksIHdpdGggdGhlIGZvbGxvd2luZyBtYW51
YWwgZml4dXBzOgo+IC0gUmVtb3ZlIHRoZSBub3cgZW1wdHkgbG9vcCBpbiBkcm1faGVscGVyX3By
b2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoKQo+IC0gRml4IF9fTU9ERSgpIG1hY3JvIGluIGNo
NzAwNl9tb2RlLmMKClNwZWFraW5nIG9mIGNoNzAwNl9tb2RlLmMsIGl0IGhhcyBpdHMgb3duICJm
aXhlZCB2cmVmcmVzaCIsIHdoaWNoCmRvZXNuJ3Qgc2VlbSB0byBiZSB1c2VkIGFueXdoZXJlLgpP
bmUgY291bGQgcG90ZW50aWFsbHkgbnVrZSBpdCwgYWx0aG91Z2ggaXQgY2FuIGJlIGEgY29tcGxl
dGVseSBzZXBhcmF0ZSBwYXRjaC4KClRoaXMgcGF0Y2ggaXM6ClJldmlld2VkLWJ5OiBFbWlsIFZl
bGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKLUVtaWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
