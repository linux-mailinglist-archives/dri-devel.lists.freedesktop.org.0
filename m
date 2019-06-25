Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B125643E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9276E312;
	Wed, 26 Jun 2019 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D524D888D9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:59:42 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id r185so3219776iod.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 06:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FSKVD6KDrsHOIAGdSS2iIF1paS8HEckPICs4ZTQha7A=;
 b=CzrwKOsDLl6qziRR6+EMzUph6qh6DRAiLRmPu4kuPKqKrIEGcWcBy6g7xruaniuU/N
 VGgYqonfkpTUvkSHo88PHKtmyL4kKvh0uj8bf4zt2TnJs+BQrrAZa7SaGeQ00jELeHDQ
 CPh/w86fVzPQncuV3Mu9lXIF1pTU7fbEM87I3rzkjmyu8skS/0uQIvDIodm2wv667d1q
 qzCOgUFVEifpd2XfqzrwARFTPlDCK513Bz7dtXnlc9hr+CvmSpJs6Jo1EvanFyW4dNMQ
 TFp4RCPJKXGILrXugEt+2/t11aP9efUAn8n9Wfdyk8MO+X/t9sdy+34sSrQxfHJ6KWRQ
 TunA==
X-Gm-Message-State: APjAAAX4gRSEdAD25A3z+cAKa/+5LAF8sx6WG+J+l2G5tHcqrykQFsBB
 Oybog8csYHd+qVNeyHqoge0Ik7qiOfYJFZJ6gsrXQpF96DQ=
X-Google-Smtp-Source: APXvYqxmnt8MEd1RguBGDPqLRfzzb9romTQZPdCDEivRbQSFmE/+w6gs05eJ6i7Cam4Ehk7qMOhLxD8u0q7TEYPp0B4=
X-Received: by 2002:a02:7420:: with SMTP id o32mr49882917jac.117.1561471181881; 
 Tue, 25 Jun 2019 06:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
 <20190624160330.38048-5-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190624160330.38048-5-hverkuil-cisco@xs4all.nl>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Tue, 25 Jun 2019 15:59:31 +0200
Message-ID: <CALFZZQHLz6jV95NRMrbOdpu1oNh=KCrNpC+t2YiL-8MAUi0dTQ@mail.gmail.com>
Subject: Re: [PATCHv8 04/13] cec: expose the new connector info API
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FSKVD6KDrsHOIAGdSS2iIF1paS8HEckPICs4ZTQha7A=;
 b=ecAb+aHbHVfPXb4iypgv8GeAIglpM84hLdzUkIAqyhk+2wCosCq++FUV3WnVdwdZHP
 Qch8cQ7/Igi0Rip6A1zWPj4+XhCHHmqy9CgrRC0iVgejvjnxDudL08zdh0CYSBuuJva/
 FCwN1NKMec7zGB//MtWibOZd3NLnbKhZya0Q5J3iKBfBJjhiCnqo9VnCfJHzFoqF4HCv
 rv8b1pumw5qbRiTiOPeI7+uHYWJZQVylfH0ywNFf0GBf3D3pQ1sw2itesbLUig6TqspN
 gDlnibWpEsF6KhMcRz029tjCFI9rsnVAnPr5ZmC2IduFoQI1R9XYUp7A+YFAi6QjyvLc
 DsRw==
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
Cc: Cheng-yi Chiang <cychiang@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkuCgpUaGlzIGxvb2tzIGdvb2QgZXhjZXB0IG9uZSBjb21tZW50IGFib3V0IHRoZSBpb2N0bC4K
Ck9uIE1vbiwgSnVuIDI0LCAyMDE5IGF0IDY6MDMgUE0gSGFucyBWZXJrdWlsIDxodmVya3VpbC1j
aXNjb0B4czRhbGwubmw+IHdyb3RlOgo+Ci4uLgo+ICtzdGF0aWMgbG9uZyBjZWNfYWRhcF9nX2Nv
bm5lY3Rvcl9pbmZvKHN0cnVjdCBjZWNfYWRhcHRlciAqYWRhcCwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjZWNfbG9nX2FkZHJzIF9fdXNlciAqcGFyZykK
PiArewo+ICsgICAgICAgaWYgKCEoYWRhcC0+Y2FwYWJpbGl0aWVzICYgQ0VDX0NBUF9DT05ORUNU
T1JfSU5GTykpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PVFRZOwpJIGd1ZXNzIGFjY2Vz
cyB0byBhZGFwLT5jb25uX2luZm8gbmVlZHMgdG8gYmUgZ3VhcmRlZCBieSB0aGUgbG9jayBub3cu
Cgo+ICsgICAgICAgaWYgKGNvcHlfdG9fdXNlcihwYXJnLCAmYWRhcC0+Y29ubl9pbmZvLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoYWRhcC0+Y29ubl9pbmZvKSkpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KCkJlc3Qg
cmVnYXJkcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
