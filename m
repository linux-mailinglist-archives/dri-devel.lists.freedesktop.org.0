Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69525A1FC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 19:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3A76E3FC;
	Fri, 28 Jun 2019 17:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3481C6E3FC;
 Fri, 28 Jun 2019 17:10:49 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id 8so2455587uaz.11;
 Fri, 28 Jun 2019 10:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nfpJlzlWV60+/HizD2k8iuVrnJ6fNBqwcXZ39MwiLbU=;
 b=jRM6YGsxReUKCjYHvqtdj04VVEcr5hznKUMl2OYljRZ8/pyBFD4wNbrACKWhcXdfZy
 n4/BYwnNmHh/AGVms9nhFpV551sF+ePg1bpuy6yl8jVwBRbLpdlOXyGwvOqEgeO9qGez
 nAa6wLHx+qT3n9OWgHUT3fH2jjaDgDRaio8JevN8b7iZamOK7iob6FGFpwfWL6mcKRiv
 ZGLPgKXGx6kKvDfoSr9k2WZHoUgH2dmwX4Ymprw2LSPws4g+iSlV/AgzCU5lKOgcNFi5
 A2Gtwanr95X5qLDvZvY8tDz0KGws+s+AEfe9bB8A0Z2lw4FJ5V55sPTw0RH9wgB4zutV
 20uA==
X-Gm-Message-State: APjAAAWJfG69r1v74a9XQqVZ5MkpyOyJNieSAKWCZ1eE2LBHpYkFbwIU
 +TqCQljwHxd+dwbfoPU2zWr3MZNIRWYH8u/rAZmy+A==
X-Google-Smtp-Source: APXvYqxQrQy774exQFsrHllcAQcBHM6lGmBP8Oau1gLYakc96CDCpBhnhImE1VDzu7fCjjuN9iWM3kD3pyJD5Zt547E=
X-Received: by 2002:ab0:2789:: with SMTP id t9mr6493383uap.69.1561741848269;
 Fri, 28 Jun 2019 10:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190624165406.13682-1-michel@daenzer.net>
 <20190624165406.13682-2-michel@daenzer.net>
In-Reply-To: <20190624165406.13682-2-michel@daenzer.net>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 28 Jun 2019 18:11:07 +0100
Message-ID: <CACvgo53dE7Hx_VWQVdu18wewJOM5_mK5GnRZ=h2_zTOoxcqBmw@mail.gmail.com>
Subject: Re: [PATCH libdrm 1/9] amdgpu: Pass file descriptor directly to
 amdgpu_close_kms_handle
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nfpJlzlWV60+/HizD2k8iuVrnJ6fNBqwcXZ39MwiLbU=;
 b=EK1OC4ZLu9VA8jTfi5fOAdlMr+k0PgNNtEHxZD3H5SSNNB7riK/uf29E+Ce6AJ4r7d
 q7eztsRblQU3rWozzFDOWI9yc3NSt55jhyR/uZVDPKP/7arkv/5ur0YFPn5aALwP2vbS
 9wSt08oYqZ+N870UrbC4iiG3kFrCVnsKiqQ9pKTPBBDRd9xxFFYO2hhv3PE+IsNY1dQt
 ajAPEzM2lwPF312AKOLiNd2jGjt4/GwWsmSF+D2cQOewhwlSQn8oyIDyo7FkjO2Hzgyt
 +6UHkFy6KtSaoKQyzBeO5zz0CILiBI57VmLdfrTJCjslAvmLgX3NJuD33amKTb55Q2az
 mHFg==
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyNCBKdW4gMjAxOSBhdCAxNzo1NCwgTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVu
emVyLm5ldD4gd3JvdGU6Cj4KPiBGcm9tOiBNaWNoZWwgRMOkbnplciA8bWljaGVsLmRhZW56ZXJA
YW1kLmNvbT4KPgo+IEFuZCBwcm9wYWdhdGUgZHJtSW9jdGwncyByZXR1cm4gdmFsdWUuCj4KPiBU
aGlzIGFsbG93cyByZXBsYWNpbmcgYWxsIHJlbWFpbmluZyBvcGVuLWNvZGVkIERSTV9JT0NUTF9H
RU1fQ0xPU0UKPiBpb2N0bCBjYWxscyB3aXRoIGFtZGdwdV9jbG9zZV9rbXNfaGFuZGxlIGNhbGxz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5j
b20+Cj4gLS0tCj4gIGFtZGdwdS9hbWRncHVfYm8uYyB8IDM1ICsrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyMCBk
ZWxldGlvbnMoLSkKPgpGd2l3IHBhdGNoZXMgMS0zIGFyZToKUmV2aWV3ZWQtYnk6IEVtaWwgVmVs
aWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgoKLUVtaWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
