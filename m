Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B614333D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 22:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90B56EA90;
	Mon, 20 Jan 2020 21:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DB06EA90
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 21:09:57 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m30so374256lfp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 13:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pvaSgWMpb6splfUtGpHmUXkmUITklAkoFwnJKC0eF4Q=;
 b=bb3x7cNOKn69RgFu74r3MQQiaEcUx6Pn/Z5yg+absJpmY61l/7WUXXhjQSMcVBE5XA
 6QismlDKAUEKuyBOxnlJTZLIRnIHONK1IQoUAx1lIMzz8WaQkI1phC/VXCzoE3D5cKsH
 cCCMBdNjPbg+DOMuuiEX1+sFPKI8gDG2yc0lPUT+8H5Ajl4ePYrwp8VOclBiY/RPrLLl
 0JH7l4H4OclWA4SL8gO2nR3oaEitSsWsewfHwyvC0qvLPmC5HWYzA1L/HIxXRkZJy1TR
 K0lgx9yjB/nuG5rD0JBGiBoXmXUqV2JcUy13YCjM59AGveh6/eWJnKdaf0VeSah1sr8b
 Smtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pvaSgWMpb6splfUtGpHmUXkmUITklAkoFwnJKC0eF4Q=;
 b=HTVMoypGPoqyX+LxYFCkAZ4zVRaHk8Tcv2GPbWgLAOdisAXKTYRp1kWJlrGGiNq9z7
 1a2w85G2XZdOEnpBOt1p1Riq4NDfiXMFVDxBgwpGEj02sSqo9udEsH5qXHbH65h+J5Z9
 UOB7Z6wVcVHTUxv0X3j4kOfxj7QsT8EnrPJj7LB7HoPAFH1jMdZa4uVpaqO/8uKHDYK+
 +kn42eXoYJ4063W8YZRTnXTJO/wm0CwRaVZl/IkxDCMW6tc2GIIqUo+OLcaSP9jp+LoZ
 vbrrmtV4p7X79yHFTy0zCb6SzbF/p7Rw22Q2lkm2DSRXf0BMSqVtoV6CpOqSbJ1Ajy1f
 k6Lw==
X-Gm-Message-State: APjAAAVjzqQnx0mcPunlsH8EzW9X12RDK7To6r9S7PKFOP570eEi7m+a
 NERrNxGDn/5va6ABXgXKqschCQnu3ILeS9KdUtYxow==
X-Google-Smtp-Source: APXvYqyP3N/1Y5S8MI3eAEuF0IHAdY13oenwTOuI07a1GDAe55pl/crQBfXIQGhS7urZQRAkeaEyKpc656E0JLiMA8U=
X-Received: by 2002:a19:4849:: with SMTP id v70mr703151lfa.30.1579554596044;
 Mon, 20 Jan 2020 13:09:56 -0800 (PST)
MIME-Version: 1.0
References: <20200116092934.5276-1-thomas_os@shipmail.org>
In-Reply-To: <20200116092934.5276-1-thomas_os@shipmail.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 21 Jan 2020 07:09:44 +1000
Message-ID: <CAPM=9tzVFe=O-0A-5PKdjBV-95aLvTaprzFuxxeai4y9PJKk9Q@mail.gmail.com>
Subject: Re: [git pull] vmwgfx-next
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
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
Cc: pv-drivers@vmware.com, Dave Airlie <airlied@redhat.com>,
 Linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNiBKYW4gMjAyMCBhdCAxOTozMCwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkK
PHRob21hc19vc0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Cj4gRGF2ZSwgRGFuaWVsCj4KPiBUaGUg
bWFpbiA1LjYgLW5leHQgcHVsbCBmcm9tIHZtd2dmeC4gTWlub3IgdGhpbmdzIGhlcmUgYW5kIHRo
ZXJlLCBhcyB3ZWxsCj4gYXMgYW4gYWRkZWQgaW9jdGwgZm9yIGhvc3QgbWVzc2FnaW5nIGFuZCBh
IGNvcnJlc3BvbmRpbmcgYXBpIHZlcnNpb24gYnVtcC4KCklzIHRoZXJlIHVzZXJzcGFjZSBmb3Ig
dGhpcyBpb2N0bCBzb21ld2hlcmU/IEkgbmVlZCBhIHBvaW50ZXIgdG8gc29tZQpyZXZpZXdlZCB1
c2Vyc3BhY2UgTVIgZm9yIE1lc2Egb3Igb3RoZXIgdGhpbmcgdG8gYWRkIG5ldyB1QVBJIHRvCmRy
aXZlcnMuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
