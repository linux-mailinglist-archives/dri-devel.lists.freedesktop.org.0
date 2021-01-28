Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F58307EE7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B566EA13;
	Thu, 28 Jan 2021 19:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BBA6E9CE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 18:24:47 +0000 (UTC)
Received: by mail-vk1-xa49.google.com with SMTP id d124so275909vkf.22
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 10:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:cc
 :content-transfer-encoding;
 bh=cHIvwUXm0lHuy8rQzrOgn2oz2Aq5uQKCMOMrBcKZwBg=;
 b=Zc99w0hKc7U8hNCoPJDy9cvpaEfnjCHz+dH+XBgm5zAmXTTLaglY0QZ+xewQSHkXDB
 xOzLPxKUqfoX69HUflAkk5SVsvrLU9yedbGZVCA98fwvlaSAIS3S/zp8mVGd6ywKiKpi
 IcBrcmJAv1ow6QN5MLJiF0/UJ29JNPDTX5vrbFDH7zIXudgNkb7biFgC+6QMR6IwUOvN
 3lVpfjg+fzannImonM+QVX0zCX7wz61NABL/Y4xSO28FZUEZWM0w+poVt809HPQoCW82
 cl2RCr3NCpxwOA7gySz+fi86VicU7XbIKlWOv6+46w7gEH7vPDZP2tLy+TyHNI8EF8T4
 FcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :cc:content-transfer-encoding;
 bh=cHIvwUXm0lHuy8rQzrOgn2oz2Aq5uQKCMOMrBcKZwBg=;
 b=dq/U27W+/Vg79o8u0EO9nFlpSXkVbBRgQp9yscIYwG/JSnq6Qznip0oVr1oy7D0bVT
 57g+GwMWu8JD9DiZjal3/+KSvrza+Pz/qIoDXJc+qPaZjzFmLcJpL+UWZ3RbrnYHRM93
 2w9nCXrOPAqnUC3tKfSXyExZJetdoL3sXXoYfxT1ugTt796q5u3uaHaO8qr3xwAFGS2M
 BcXpWb/hUj7d92Nzjz0bHaihAYeOf1g4ZbGT7nbKw9qDAcGqgpoNr4Y9ASFgJsHp/6tt
 l871Ermi8WeaPVlL0GsGKHercComkdLljAMTG92Y+W2J4YM8U2AsCN33kMU7kE5cQ0g1
 MW8g==
X-Gm-Message-State: AOAM532F1xOpb2ZYeIhf4i1IbVFwU5eYFKBZTvK0t5QU+wYiu/eKVywm
 iFb5aaeMIQBdtd7y8Bdl70u+MQ1T3v5q25Wafw==
X-Google-Smtp-Source: ABdhPJxjOgT+zASwb9ZYuq0uI6fVz8Lr4Lk+05wuK0BleAbT7nbROSuQIr3xjDt42c7GZUo8Tn1YW1FsSYhCEyIssw==
X-Received: from kaleshsingh.c.googlers.com
 ([fda3:e722:ac3:10:14:4d90:c0a8:2145])
 (user=kaleshsingh job=sendgmr) by 2002:a67:eac2:: with SMTP id
 s2mr963597vso.22.1611858286409; Thu, 28 Jan 2021 10:24:46 -0800 (PST)
Date: Thu, 28 Jan 2021 18:24:29 +0000
Message-Id: <20210128182432.2216573-1-kaleshsingh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH 0/2] Allow reading process DMA buf stats from fdinfo
From: Kalesh Singh <kaleshsingh@google.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, Andrei Vagin <avagin@gmail.com>,
 Kalesh Singh <kaleshsingh@google.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Michel Lespinasse <walken@google.com>, jeffv@google.com,
 Daniel Jordan <daniel.m.jordan@oracle.com>, kernel-team@android.com,
 Alexey Dobriyan <adobriyan@gmail.com>, linux-media@vger.kernel.org,
 keescook@chromium.org, jannh@google.com, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, Bernd Edlinger <bernd.edlinger@hotmail.de>,
 surenb@google.com, Alexey Gladkov <gladkov.alexey@gmail.com>,
 linux-kernel@vger.kernel.org, minchan@kernel.org,
 Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, hridya@google.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kcm9pZCBjYXB0dXJlcyBwZXItcHJvY2VzcyBzeXN0ZW0gbWVtb3J5IHN0YXRlIHdoZW4gY2Vy
dGFpbiBsb3cgbWVtb3J5CmV2ZW50cyAoZS5nIGEgZm9yZWdyb3VuZCBhcHAga2lsbCkgb2NjdXIs
IHRvIGlkZW50aWZ5IHBvdGVudGlhbCBtZW1vcnkKaG9nZ2Vycy4gSW4gb3JkZXIgdG8gbWVhc3Vy
ZSBob3cgbXVjaCBtZW1vcnkgYSBwcm9jZXNzIGFjdHVhbGx5IGNvbnN1bWVzLAppdCBpcyBuZWNl
c3NhcnkgdG8gaW5jbHVkZSB0aGUgRE1BIGJ1ZmZlciBzaXplcyBmb3IgdGhhdCBwcm9jZXNzIGlu
IHRoZQptZW1vcnkgYWNjb3VudGluZy4gU2luY2UgdGhlIGhhbmRsZSB0byBETUEgYnVmZmVycyBh
cmUgcmF3IEZEcywgaXQgaXMKaW1wb3J0YW50IHRvIGJlIGFibGUgdG8gaWRlbnRpZnkgd2hpY2gg
cHJvY2Vzc2VzIGhhdmUgRkQgcmVmZXJlbmNlcyB0bwphIERNQSBidWZmZXIuCgpDdXJyZW50bHks
IERNQSBidWZmZXIgRkRzIGNhbiBiZSBhY2NvdW50ZWQgdXNpbmcgL3Byb2MvPHBpZD4vZmQvKiBh
bmQKL3Byb2MvPHBpZD4vZmRpbmZvIC0tIGJvdGggYXJlIG9ubHkgcmVhZGFibGUgYnkgdGhlIHBy
b2Nlc3Mgb3duZXIsCmFzIGZvbGxvd3M6CiAgMS4gRG8gYSByZWFkbGluayBvbiBlYWNoIEZELgog
IDIuIElmIHRoZSB0YXJnZXQgcGF0aCBiZWdpbnMgd2l0aCAiL2RtYWJ1ZiIsIHRoZW4gdGhlIEZE
IGlzIGEgZG1hYnVmIEZELgogIDMuIHN0YXQgdGhlIGZpbGUgdG8gZ2V0IHRoZSBkbWFidWYgaW5v
ZGUgbnVtYmVyLgogIDQuIFJlYWQvIHByb2MvPHBpZD4vZmRpbmZvLzxmZD4sIHRvIGdldCB0aGUg
RE1BIGJ1ZmZlciBzaXplLgoKQWNjZXNzaW5nIG90aGVyIHByb2Nlc3Nlc+KAmSBmZGluZm8gcmVx
dWlyZXMgcm9vdCBwcml2aWxlZ2VzLiBUaGlzIGxpbWl0cwp0aGUgdXNlIG9mIHRoZSBpbnRlcmZh
Y2UgdG8gZGVidWdnaW5nIGVudmlyb25tZW50cyBhbmQgaXMgbm90IHN1aXRhYmxlCmZvciBwcm9k
dWN0aW9uIGJ1aWxkcy4gIEdyYW50aW5nIHJvb3QgcHJpdmlsZWdlcyBldmVuIHRvIGEgc3lzdGVt
IHByb2Nlc3MKaW5jcmVhc2VzIHRoZSBhdHRhY2sgc3VyZmFjZSBhbmQgaXMgaGlnaGx5IHVuZGVz
aXJhYmxlLgoKVGhpcyBzZXJpZXMgcHJvcG9zZXMgbWFraW5nIHRoZSByZXF1aXJlbWVudCB0byBy
ZWFkIGZkaW5mbyBsZXNzIHN0cmljdAp3aXRoIFBUUkFDRV9NT0RFX1JFQUQuCgoKS2FsZXNoIFNp
bmdoICgyKToKICBwcm9jZnM6IEFsbG93IHJlYWRpbmcgZmRpbmZvIHdpdGggUFRSQUNFX01PREVf
UkVBRAogIGRtYWJ1ZjogQWRkIGRtYWJ1ZiBpbm9kZSBubyB0byBmZGluZm8KCiBkcml2ZXJzL2Rt
YS1idWYvZG1hLWJ1Zi5jIHwgIDEgKwogZnMvcHJvYy9iYXNlLmMgICAgICAgICAgICB8ICA0ICsr
LS0KIGZzL3Byb2MvZmQuYyAgICAgICAgICAgICAgfCAxNSArKysrKysrKysrKysrKy0KIDMgZmls
ZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjMwLjAu
MzY1LmcwMmJjNjkzNzg5LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
