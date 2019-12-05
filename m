Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F58114D60
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129766EB75;
	Fri,  6 Dec 2019 08:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D6A6F5EF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 08:44:27 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id c16so2747447ioh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 00:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wt9G2vozOpMT2hGMgKE0ip5uoYB13lnK1YvlPurVBq4=;
 b=o8RVsrHuoExZF55hyrigmDpa91qcOKpb/XtDPGANnD2QX/TnHiq8UyuZTYZjPm+MaE
 3NTZactj+vC5oPlPpxH+j9dkM3O2Z3P8+JVt3BCqblKixhfyyjUHfNU7UlVwm9u1jlr7
 x9e68uFlIAkovyz/iY5QgZwek5XQUFxwUBJkt3ont7pUF86o9OsZeg5v1mbFyIg+7ndJ
 ooqQqhwPVfzgiYwtyTlMxtyh30mv+AiXYhvxUmb9Mdkz7SEx/AJ28HZa/ch1QcRsGgZM
 NNGfeP7OdP4miukTdNMUTfoWN7R9HSv7TlfKw6Vc87YfuzH507gAoUGy4pRwSeWip3J4
 qUJQ==
X-Gm-Message-State: APjAAAWEl2UeHFFfCNuAjxUFPSZ9xS2yRVfcbkGriSCIpjsbBMNh2FJc
 z9A92h54zOgGzIxN5kB49Kk8qDodSNBKR6lv3h7KMw==
X-Google-Smtp-Source: APXvYqzsTUeVlvYNSc46o8MgjJIitMPOpzSQhh53SIxsiMDq5akjwRzVyhJ8uX4NGcPMJOsXZfEjVH38FLKYx8LYJGo=
X-Received: by 2002:a5d:8cd6:: with SMTP id k22mr5264840iot.283.1575535467112; 
 Thu, 05 Dec 2019 00:44:27 -0800 (PST)
MIME-Version: 1.0
References: <1574817475-22378-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAJMQK-iDnOWCYmxcREGschD=sDfU6yKpUu+koP3YDeO3MPCdhQ@mail.gmail.com>
 <1575529976.9400.4.camel@mhfsdcap03>
In-Reply-To: <1575529976.9400.4.camel@mhfsdcap03>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 5 Dec 2019 16:44:01 +0800
Message-ID: <CAJMQK-jGTAm7YS3ov3ok0SkrH7dWEL4umC21O6RSchrfDs5omw@mail.gmail.com>
Subject: Re: [v1,1/2] drm/mediatek: Fixup external display black screen issue
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wt9G2vozOpMT2hGMgKE0ip5uoYB13lnK1YvlPurVBq4=;
 b=mx51vNNmXng2Ai4iTAblfI1F6ComWE5BNDOYZ4xrxfULaKGleW01zww0J9E6sEvEGm
 lfLcgIvUw/0nKHL3PF9n6k428lWT/lZXzBTmVRVLyRjWQMqUnL/4r42HLnAkItilGkYS
 rEOKRmjE51Iy/fCKvADi2jVYm4ok8Pi5z2RxI=
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
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgNSwgMjAxOSBhdCAzOjEzIFBNIFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5u
aXVAbWVkaWF0ZWsuY29tPiB3cm90ZToKPgo+IHBsZWFzZSBkb3VibGUgY29uZmlybSBpcyB0aGlz
IGR1bXAgc3RhY2sgbG9nIGlzIHJ1aW5pbmcgb24gTVQ4MTczIHJlYWwKPiBJQyBvciBub3QuCj4g
aWYgeWVzLCB0aGF0IG1heSBjYXVzZWQgb3ZsIGhhbmcgd2hlbiBkaXNhYmxlIGxheWVyIG5vdCBp
biBibGFua2luZywKPiB0aGVuIGNhdXNlIHZibGFuayB0aW1lIG91dC4KPiBpIHdpbGwgZGlzYWJs
ZSBvdmVybGF5IHdpdGggY21kcSBpbiBuZXh0IHZlcnNpb24uCj4KSXQgaXMgcnVubmluZyBvbiBN
VDgxNzMgYWNlciBjaHJvbWVib29rLiBFcnJvciBvbmx5IGhhcHBlbnMgd2hlbgp0dXJuaW5nIG9m
ZiBkaXNwbGF5Lgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
