Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BFF165CB4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 12:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A346ED36;
	Thu, 20 Feb 2020 11:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52206ED36;
 Thu, 20 Feb 2020 11:24:32 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id m4so2405405vsa.12;
 Thu, 20 Feb 2020 03:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hazjaD2YUbJGiqWwoXV+JokYu0HUKkUko31jANlJplk=;
 b=B5GzCQW/zlr8puDwPi0fy0nIhsM0bVlk2rPvQg75NJL7JTWJtE2W0DmhKepCcD9hOy
 P6gzPhV66fDRSvy49GHQ/eO7JhmvEZ98x9GYJqD4vwRd8pvFYpcz0idz0e98SyhXg9Lb
 iT0thb0Hq8t+pZvpfKWhfG4Z/W+w2pEmD7yplbkMmTcciincv93hFuPM3rs/0SYJgQ4G
 q1krnaE6G2GnMgd5qoziYG4jjVG9QJXehy2YbAVVo4kHfDp2MEqBeCHqhitNfomRkD1w
 AcAp7hyof0nZWU9JgU881XYLYnc3l6Q/DRyzxhRSvm2qNHPWyAt9l1EiFJ30GHA8AEPq
 VQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hazjaD2YUbJGiqWwoXV+JokYu0HUKkUko31jANlJplk=;
 b=WvCsTzx2PVu7X+EQaXMG3EK7gtn67CExmGUl7vUfUz0/lz8iK5dd3sZBo2UVuAVRyk
 Ct4A9wucZKaQHPHAmJdbO8bDkxTd7jzMNC4z9JLxnKoTVTZgyAa/ix/iM+to1WLmFnmA
 Ggfn3Y3SZyb6Avg2D8DDUITatD3MRcaDwhLzXANJk32DgYZC4Jwu44aQRT7WlXePw61p
 a4XVUBFwrl2+4i/ctxSeGnSZIFW5GD5hgN5UigCnX0xYxGdmcHNwbB5dTMU/h/jcgymy
 9mg6WS1FNkScQuC2+ehkzCzgpogOfTNPTU4rd2OE4EI8blye3dzFJuOUUxsSK8NktoUQ
 06Tw==
X-Gm-Message-State: APjAAAVVqepVl69dE3/gND4R1a/E6ypPXE4QKt/otdI5c+20GvO8YcMm
 vEbRya0bloAXhMUlAXnMDzqO9ftrs5cv8BlPHPw=
X-Google-Smtp-Source: APXvYqw2Vi/gK8Y4s/OvdpgxSeePyP+00Ez91phnSXxKSI+4QTscidoLFaPYKAlgM/aym6gCwQw2Dbmx+YfjLnYuGuk=
X-Received: by 2002:a05:6102:7a4:: with SMTP id
 x4mr16028226vsg.85.1582197872123; 
 Thu, 20 Feb 2020 03:24:32 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20200219203544.31013-6-ville.syrjala@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Feb 2020 11:24:20 +0000
Message-ID: <CACvgo50oWkF8vjpGmOYSwaK+khZuAE0yW_npf2UEMQoRTokLBA@mail.gmail.com>
Subject: Re: [PATCH 05/12] drm/msm/dpu: Stop copying around mode->private_flags
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBGZWIgMjAyMCBhdCAyMDozNiwgVmlsbGUgU3lyamFsYQo8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IFRoZSBkcml2ZXIgbmV2ZXIgc2V0cyBtb2Rl
LT5wcml2YXRlX2ZsYWdzIHNvIGNvcHlpbmcKPiBpdCBiYWNrIGFuZCBmb3J0aCBpcyBlbnRpcmVs
eSBwb2ludGxlc3MuIFN0b3AgZG9pbmcgaXQuCj4KPiBBbHNvIGRyb3AgcHJpdmF0ZV9mbGFncyBm
cm9tIHRoZSB0cmFjZXBvaW50Lgo+Cj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNv
bT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IGxpbnV4LWFybS1tc21A
dmdlci5rZXJuZWwub3JnCj4gQ2M6IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBT
aWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgoKUGVyaGFwcyB0aGUgbXNtIHRlYW0gaGFzIGEgV0lQIHdoaWNoIG1ha2VzIHVzZSBvZiBp
dCA/CgpPdGhlcndpc2U6ClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBj
b2xsYWJvcmEuY29tPgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
