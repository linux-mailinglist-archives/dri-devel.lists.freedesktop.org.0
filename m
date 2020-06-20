Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A013203028
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DC96E1F7;
	Mon, 22 Jun 2020 07:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DC06E09A
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 15:05:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n24so14652487lji.10
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 08:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cC/kgYZ98AFtKsSnL1c9eWREKRXoMKu60JHedrpuptk=;
 b=ClaI3OCondxVk+pVJYSeistUsa1TfvZDmkq0JpZHtC8xsR0LnmmdEkgjNYoEkQnUKX
 tkGbCfVDf5tlH3C/BWaojJPDXgntX4ZpNhYO4Ax7KghREvaXj+aqxhECGB80nF2imTy1
 gLkDagTcQr9S2bxcx8R568dCyifzswvs+hpf218s6lNwETXVWrQQlbVl7Gex1GeWy3ob
 ffKGeJkYgbSUhhr5e78mHzksFV1Kz4JuMTz0bSdC2ekCuqu9Nvy4KDYjaOEdihGSuPgo
 kmd/8X3rH/OWDyIe7rA3eEAoRAfPms3tfjFq4TUc/8k63p0OsH48dycl5dLFVPmUZEy4
 osQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cC/kgYZ98AFtKsSnL1c9eWREKRXoMKu60JHedrpuptk=;
 b=UXawRNSmAJBbjJRcyrNGWvOL67+ZPnjKfYxfE78K1oi4Iee+g5aPGXjZ552pdVjstB
 NzyZh0b6XZr+Akm5ED88wnK8KHQn9pkYahjZ9v96L4OVuRfNsz8O/5B8IN0hXh4oXlOu
 1R/LMJ+/Jla09QaCq98A99EsGeH5R5LQXfq08ZSmTYcpHBV2JAz6Mub/Gop52dABV5DI
 C+S/yPUbsP8uvkLTyWi5vGRWsU0r52qLqUswX7Y2AgokwKm9nKm26XsYqttYdzfiIV+9
 +0EiEWIGJR7KGg3JQimyg2A0WDtr12YbgovNLnX319semCEvuFQCmlb4mk0IXm2FSjYP
 h9dA==
X-Gm-Message-State: AOAM531mxEw0WRrW+llkOaufgRIhtIHS7yfY5uY47ZY2frD431c3T1WU
 oVKKhKhs7gOwqeJGeBIC/eM9tnzX
X-Google-Smtp-Source: ABdhPJxkAwkMqQA+UTB5xAzf8ceKNP0+Ozy6OZt8rrWp77P4n6g60+DuTrmnJPIWs/EOJyIZCJJ6aw==
X-Received: by 2002:a2e:8601:: with SMTP id a1mr3935669lji.255.1592665539062; 
 Sat, 20 Jun 2020 08:05:39 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id m11sm2131027lfl.70.2020.06.20.08.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jun 2020 08:05:38 -0700 (PDT)
Subject: Re: [PATCH v8 7/7] drm/panel-simple: Add missing connector type for
 some panels
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-8-digetx@gmail.com>
 <20200620112132.GB16901@ravnborg.org>
 <20200620114934.GB5829@pendragon.ideasonboard.com>
 <ea421084-a91c-bc03-5997-1723075b7cae@gmail.com>
 <20200620143114.GA22329@ravnborg.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e77a34c1-3e0b-7f30-25d0-a955ec8d8c86@gmail.com>
Date: Sat, 20 Jun 2020 18:05:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200620143114.GA22329@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:46 +0000
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAuMDYuMjAyMCAxNzozMSwgU2FtIFJhdm5ib3JnINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5Cj4g
Cj4+Cj4+IE9vcHMhIEdvb2QgY2F0Y2ghCj4gWWVwLCB0aGFua3MgTGF1cmVudC4gU2hvdWxkIGhh
dmUgdGFrZW4gYSBiZXR0ZXIgbG9vayBiZWZvcmUgYXBwbHlpbmcuCj4gCj4+IEluZGVlZCwgSSBi
bGluZGx5IHNldCB0aGUgTFZEUyB0eXBlIHRvIGFsbCB0aGVzZQo+PiBwYW5lbHMuIFBsZWFzZSBy
ZXZlcnQgdGhpcyBwYXRjaCwgSSdsbCBkb3VibGUgY2hlY2sgZWFjaCBwYW5lbCBhbmQKPj4gcHJl
cGFyZSBhbiB1cGRhdGVkIHZlcnNpb24gb2YgdGhpcyBwYXRjaC4gVGhhbmsgeW91IHZlcnkgbXVj
aCBmb3IgdGhlCj4+IHJldmlldyEKPiAKPiBJZiB5b3UgY2FuIHByZXBhcmUgYSBmaXggd2l0aGlu
IGEgZmV3IGRheXMgdGhlbiBsZXRzIHdhaXQgZm9yIHRoYXQuCj4gSSB3aWxsIGRvIGEgYmV0dGVy
IHJldmlldyBuZXh0IHRpbWUuCgpIZWxsbyBTYW0sCgpJIHNob3VsZCBiZSBhYmxlIHRvIG1ha2Ug
aXQgbGF0ZXIgdG9kYXkgb3IgdG9tb3Jyb3cuIENvdWxkIHlvdSBwbGVhc2UKY2xhcmlmeSB3aGF0
IGRvIHlvdSBtZWFuIGJ5IHRoZSBmaXgsIGRvIHlvdSB3aGF0IGl0IHRvIGJlIGFzIGFuCmFkZGl0
aW9uYWwgcGF0Y2ggb24gdG9wIG9mIHRoZSBhcHBsaWVkIG9uZSBvciBhIG5ldyB2ZXJzaW9uIG9m
IHRoZSBwYXRjaD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
