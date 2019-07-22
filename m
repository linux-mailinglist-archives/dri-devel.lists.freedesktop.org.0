Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF5070A5A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBD289E32;
	Mon, 22 Jul 2019 20:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731B789E32
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:09:02 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id q5so3245989ybp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KCSwi/wEU6W85GPo7V5lMqTbkH4jmSSOqIObX4ZleYA=;
 b=lCqERApj/bzjYBaiIUsHK0SGUchAGYouwyp5c7UFHBvD2ovC7gz+vtspNt8P90EWNQ
 i5Y7gseOLYSUdLx5Aa92L0dI8NikO0im/DVbF8/CS8o/NY0Fogxt4VFq1LrHClyOZav7
 ZC5RrfhLwD2T8LZHTMkvEMX2yA5b5GxZV1nZ1koa34ZYxI7STiarDDyG+aUdXEbNgyIo
 Zrs6z5aWI6WpiZEKcJzbwbYr7b6/gVPrawlsomwfIJoiQy1b7JybNfv+CDXaGan15Dye
 4jCiBnwT0V2tZNbFAbG5lD2vXD8okWoy74j+TtxzNZzwOjH+e+ERaVlVjiM2f5P8mpH/
 EU5A==
X-Gm-Message-State: APjAAAVFkQNjFXwpC0NK23Sn6gGuwTVjXoeXnYzTCZ6Inn5/RJEUXCMY
 xOn4ihBF1wPE996aIyQ/4m+rzQ==
X-Google-Smtp-Source: APXvYqz7NdcF38Eaz6w/9ST0kleODWieJkv6GTHnTGkkxqMLZW1amLP2JXSSmNOXcuv7zCy1pu4oBQ==
X-Received: by 2002:a25:1b07:: with SMTP id b7mr44799999ybb.512.1563826141651; 
 Mon, 22 Jul 2019 13:09:01 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id m40sm10005352ywh.2.2019.07.22.13.09.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 13:09:01 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:09:00 -0400
From: Sean Paul <sean@poorly.run>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm/bridge: Improve the help text for DRM_ANALOGIX_ANX78XX
Message-ID: <20190722200900.GK104440@art_vandelay>
References: <20190722194049.20761-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722194049.20761-1-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KCSwi/wEU6W85GPo7V5lMqTbkH4jmSSOqIObX4ZleYA=;
 b=YhO47nWHZKevdtn/289FR6a0QKAsyw9VHbz2428DAENxWJr4a6ox8Ntw5lpsnliojt
 GE1ISRv9P+hqtkYcLiRIl298/MbIdz/NcutPhi6xyzdXLGWPh4ddR7bu6fVsP8I+bCwR
 R+liEUl3+85Tq8/FBmRPZIIgWBgvQGdpkQQ2OZuCb9qaDJX2SGQ9Jdvg01/QCv6acXFF
 VWUuR1HV2myLRb3jqPUE6bfduePtku5vruAgad6eUr6uJKf6tWIdkkIYMf0qym+PIgKP
 jrxqyD/8FYTcdSmo05b9ahZsdGXo5CJ2wxvXUF96Gy3Fn4FW/lI0AC8EcRvTHAA1pms4
 yfVA==
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
Cc: enric.balletbo@collabora.com, Laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDQ6NDA6NDlQTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToKPiBJbXByb3ZlIHRoZSBoZWxwIHRleHQgZm9yIERSTV9BTkFMT0dJWF9BTlg3OFhYIGJ5
IGFkZGluZyB0aGUgbWlzc2luZwo+ICJwb3dlciIgd29yZC4KPiAKPiBBZnRlciB0aGlzIGNoYW5n
ZSB0aGUgaGVscCB0ZXh0IG1hdGNoZXMgd2l0aCB0aGUgQU5YNzgxNAo+IHByb2R1Y3QgZGVzY3Jp
cHRpb24gZnJvbSB0aGUgQW5hbG9naXggd2Vic2l0ZToKPiAKPiBodHRwczovL3d3dy5hbmFsb2dp
eC5jb20vZW4vcHJvZHVjdHMvY29udmVydGVyc2JyaWRnZXMvYW54NzgxNAo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KClRoYW5rcyBmb3IgeW91
ciBwYXRjaCEgSSd2ZSBhcHBsaWVkIGl0IHRvIGRybS1taXNjLW5leHQKClNlYW4KCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+
IGluZGV4IGVlNzc3NDY5MjkzYS4uYTZlZWM5MDhjNDNlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2Nv
bmZpZwo+IEBAIC0yMSw3ICsyMSw3IEBAIGNvbmZpZyBEUk1fQU5BTE9HSVhfQU5YNzhYWAo+ICAJ
c2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gIAlzZWxlY3QgUkVHTUFQX0kyQwo+ICAJLS0taGVscC0t
LQo+IC0JICBBTlg3OFhYIGlzIGFuIHVsdHJhLWxvdyBGdWxsLUhEIFNsaW1Qb3J0IHRyYW5zbWl0
dGVyCj4gKwkgIEFOWDc4WFggaXMgYW4gdWx0cmEtbG93IHBvd2VyIEZ1bGwtSEQgU2xpbVBvcnQg
dHJhbnNtaXR0ZXIKPiAgCSAgZGVzaWduZWQgZm9yIHBvcnRhYmxlIGRldmljZXMuIFRoZSBBTlg3
OFhYIHRyYW5zZm9ybXMKPiAgCSAgdGhlIEhETUkgb3V0cHV0IG9mIGFuIGFwcGxpY2F0aW9uIHBy
b2Nlc3NvciB0byBNeURQCj4gIAkgIG9yIERpc3BsYXlQb3J0Lgo+IC0tIAo+IDIuMTcuMQo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0g
ClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
