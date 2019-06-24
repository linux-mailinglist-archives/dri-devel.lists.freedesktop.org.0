Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B94C50754
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 12:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25631898E4;
	Mon, 24 Jun 2019 10:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9489898A4;
 Mon, 24 Jun 2019 10:10:01 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id u3so8155978vsh.6;
 Mon, 24 Jun 2019 03:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Adhzn2Fk1xYPtXllMDEiX+loE3vJiTpPBnguAft3xkU=;
 b=t/9lxyMV/VVJ/GCm0dhvomwmefXii675TooM2mX45fYWlOJ51RphLF0WHkcRfXsQG7
 FD2wa0GHfzjgIWsBxvtyuExgU2Wf4eY4M5tlgqXou8/nvRdflI7jqPAf9JI22+j2lgkv
 VTyoayVRZ1i9BTcAog/peJnbQewnnoUWImmtLY/1wFPokgUuD2CTUB6GSuSbfjELngTg
 4WjJTqq7mAQNEtVUqbhUR5RlPpCan2epax4fBdgSvXmJH1Fg1a+w7K0UkvI56wpsKyMu
 N9zrKiYIArsW8CFdaOV+6xZmq4ZM5fdc/X7fU5XSTvazv2BIA21VP83+hGq1RK2GuyQU
 6SKQ==
X-Gm-Message-State: APjAAAVDBN3jGFENBLAcYuqZ8cF7NRkGGNsz6QZmhAf1QheyXi3EXKyz
 Dy8sJjI/ShQwe2Tswygw8vPO7NYR/Q1c65nD6v8=
X-Google-Smtp-Source: APXvYqxLUK1NML9xJkUuCtFa/6cmbRiYCLbkkxQ3Pq3vJ8O/mN8EmiMYfyXOPI92LRzfrxV4BhKOPxNCaPe+cK1gLZE=
X-Received: by 2002:a67:ee12:: with SMTP id f18mr21286861vsp.186.1561371000934; 
 Mon, 24 Jun 2019 03:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190622121156.17217-1-sam@ravnborg.org>
 <20190624082135.GL12905@phenom.ffwll.local>
In-Reply-To: <20190624082135.GL12905@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 24 Jun 2019 11:07:39 +0100
Message-ID: <CACvgo53j8XEiTO3+g_692GkcvzHAViMzhh_ZuK+-6W4kHm0pgw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v1 0/2] drm: drop uapi dependencies from
 include/drm
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Adhzn2Fk1xYPtXllMDEiX+loE3vJiTpPBnguAft3xkU=;
 b=s7K9xnoUWiCS2EDyfVScLKjEz5gX5foa2HiXgf9osM4SAyvX7i4iBldUwDlBTFdSvQ
 xp1fVrMejXQb/f+4UQk/IG1OLgwdDwgj6NB4RriYhyKoH/jRZuwMvnSh2RgfxqyYz1i5
 0Hk9Gm4WpJKzdHq6aDZQypMnUE/ZvyZfWaQ0YJMlvsO7Q7HyZBDS4m2zQUdVMCLXYlwm
 yvZT2Sl7wzNGR0k5hRnWJYX3XYOpsTbgcA4C5gDVVX2zkZivXf84xo5HNyL245PfgvTB
 3XYuzxorn9AtFUcwV73z+Tg+Dm7GKr2Bpg7QDykabsPa9/xW2cWY74UkiVORXZbLHA5t
 zaGQ==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyNCBKdW4gMjAxOSBhdCAwOToyMSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPiB3cm90ZToKCj4gPiBkcm1fbGVnYWN5LmgKPiA+IC0gbmVlZHMgZHJtX21hcF90eXBlIGFu
ZCBkcm1fbWFwX2ZsYWdzLiBTZWVtcyBsZWdpdC4KPgo+IGVudW0gaW4gdWFwaSwgc3dlZXQgKG5l
dmVyIGRvIHRoaXMsIGl0J3Mgbm90IHBvcnRhYmxlIGFjcm9zcyBjb21waWxlcnMsCj4gI2RlZmlu
ZXMgYWxsIHRoZSB3YXkpLgoKRG9uJ3QgbG9vayB0b28gY2xvc2VseSB0aGVuCiQgZ2l0IGdyZXAg
ZW51bSAtLSBpbmNsdWRlL3VhcGkvZHJtLyB8IHdjIC1sCjk2CgpBIGhhbmRmdWwgb2YgdGhvc2Ug
YXJlIGxlZ2FjeSBzdHVmZiwgeWV0IHF1aXRlIGEgZmV3IGFyZSBub3QgOi1cCgpIVEgKLUVtaWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
