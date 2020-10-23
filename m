Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3B729722B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 17:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E426F8A3;
	Fri, 23 Oct 2020 15:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5756F8A3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 15:23:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h5so2333988wrv.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RPt1OpDoFOdmaXAkFw1GdI/71ok4UntQrJfZpVyILjQ=;
 b=TYZ0HwSFa6555DQlQQvq5BVHvnffBsxDku7hCLF4V11LRezIuOx3d/xPobBNggp/JN
 JbowqyEUKH8Y7ilTBgPBfWfPRxE1xDiYDdR+vq+5h9YJc9W/C9QI/Kt0yM09WxjZnFE+
 FZn5reomW1SHPMHSAbCUrMLPc7ncF7UcI1uMY4y+NBrG3+ush/wjzRiEvcvM5eEa2oaO
 l+HJknjW69m20KtXn6j1hFBrBzxvSHihxWOYCmzQMJQDBqBRCPN0noMVarS2H8/lP2u2
 z2KQ8iFoQFsxe9+vjqsv6RwzaW7SYdCx9iImMdoGI6M2Mlqtnl3j8wCfvvRiW1bjBzXS
 K+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RPt1OpDoFOdmaXAkFw1GdI/71ok4UntQrJfZpVyILjQ=;
 b=A4jvZ2KqxB2J/EywQLy7D/lPh8wob5hRfR6GAje27UvdOjrEZ2KtmdHTAOK0bcimNo
 egrSrp8GgujVBZIHgAN+G+NzA1DoX8++rgaPQCDo+h+kBli2OJ/aLnYWTcCCkyd3HJ5R
 yeGH1p1Nhi1J+1TdEG7U1UyBcIKjvCb5GpPmqj76OhJTtWo4MzI00JDEMhKRKrrOu+ge
 123dYPO6GcbLMoHeSIMzuLWkYfe0XqhhKK3kNU4k2PzYTGZ75sENhBuoU4rlhcBqFB1X
 GFUuSgW04XPAGPugTW/ZXDGrlBjMFOE0esDmJ+GWvDCyoOwfbq5+2+kZ6AD1Xr0m4Sb8
 o7EA==
X-Gm-Message-State: AOAM53033FVxl5N+pof5fi8f6DnvfT1KBqI6bhMDsHxqZgfYtnUMFuJi
 xy9Ycq1GbOrIJbe7+NmVOgPjXlyz1Ls9/GtjBeihLXVPWmM=
X-Google-Smtp-Source: ABdhPJwi3J0+TdSxP1vHSnBJokfI5kwclJrCxFm+bzIHA5gTc+ndnDuDxAnF0tuVE9B00OyIrbdCGLTJW/wwBr73ahU=
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr3121640wrn.362.1603466593112; 
 Fri, 23 Oct 2020 08:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <-II5uGU2OLUvxeRHxuPIMmnyrFPVyg6pkc2UM16KaQ5f6_kbDJN0se2tfgIf15RJLLKrWZg0niAIgXxr-0V7qBQGR9mPq306qamxuQq9q7M=@pm.me>
 <CADnq5_M+qgk7p92daoUMNN-OaoXKeTWULUQiivGe=V_J4e1oqA@mail.gmail.com>
 <rfi6blr6iZOO9U7GHVXPZVcbAxN21dh52TEK19odIK5sxSI3JiOSKEowBQqN97pJcTkgV8nFzG_d70g9-x1swBX-7kQ-ZqTme73yCbXgIm4=@pm.me>
 <CADnq5_PZXmSVardcOL8=-CTeSkT3+eTrKXSHNLWbWzz0q7i0yQ@mail.gmail.com>
 <GgC8qa2cwsqjMRU57ic-nZTX3iT8kjSuufzM0AnjfYINBvR3t0y-rlir8J_YaS5PGtuZv2THf5dQruxBXZL_ySkbg9B-N555-ll3zrOj27o=@pm.me>
In-Reply-To: <GgC8qa2cwsqjMRU57ic-nZTX3iT8kjSuufzM0AnjfYINBvR3t0y-rlir8J_YaS5PGtuZv2THf5dQruxBXZL_ySkbg9B-N555-ll3zrOj27o=@pm.me>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Oct 2020 11:22:58 -0400
Message-ID: <CADnq5_OPrKGC8o0H9jyyCjqbqOQ1Q7kGLMnW=aEUZdFGnU6oFA@mail.gmail.com>
Subject: Re: amdgpu: Manual Card Configuration Change
To: Josh Fuhs <Joshua.Fuhs@pm.me>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjIsIDIwMjAgYXQgMjo1MCBQTSBKb3NoIEZ1aHMgPEpvc2h1YS5GdWhzQHBt
Lm1lPiB3cm90ZToKPgo+IOKAkOKAkOKAkOKAkOKAkOKAkOKAkCBPcmlnaW5hbCBNZXNzYWdlIOKA
kOKAkOKAkOKAkOKAkOKAkOKAkAo+IE9uIFdlZG5lc2RheSwgT2N0b2JlciAyMSwgMjAyMCAyOjQ0
IFBNLCBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IE9u
IE1vbiwgT2N0IDE5LCAyMDIwIGF0IDg6NTMgUE0gSm9zaCBGdWhzIEpvc2h1YS5GdWhzQHBtLm1l
IHdyb3RlOgo+ID4KPiA+ID4gVGhhbmtzLiBJIHRyaWVkIDUuOS4xIGFuZCBJIHRoaW5rIHRoZXJl
J3Mgc3RpbGwgYSBwcm9ibGVtLCBvciBhdCBsZWFzdCBzb21ldGhpbmcgZGlmZmVyZW50Lgo+ID4g
PiBVc2luZyB0aGUgc2FtZSBjb25maWd1cmF0aW9uIHNjcmlwdCwgSSBub3RpY2VkIHRoYXQgbXkg
Y2FyZHMgYXJlIHJ1bm5pbmcgYSBsb3QgaG90dGVyLiBGb3IgZXhhbXBsZSwgaGVyZSdzIHRvdGFs
IHBvd2VyIGNvbnN1bXB0aW9uIG9mIGEgdHdvLWNhcmQgc3lzdGVtIHdpdGggdHdvIGRpZmZlcmVu
dCBrZXJuZWxzOgo+ID4gPgo+ID4gPiAgICAgNS44LjE0OiA0NjBXCj4gPiA+ICAgICA1LjkuMTog
IDU2MCtXCj4gPiA+Cj4gPiA+Cj4gPiA+IE1lbW9yeSBhbmQgc3lzdGVtIGNsb2NrcyBhcmUgaW5p
dGlhbGx5IHNldCB0aGUgc2FtZSBvbiBhbGwgY2FyZHMgaW4gYWxsIGNhc2VzLgo+ID4KPiA+IENh
biB5b3UgYmlzZWN0Pwo+ID4KPgo+IEkgYXNzdW1lIHRoaXMgbWVhbnMgdXNpbmcgZ2l0IGJpc2Vj
dCB0byBuYXJyb3cgZG93biB0aGUgY29tbWl0IHRoYXQgaW50cm9kdWNlZCB0aGUgZWZmZWN0LiBJ
J20gbm90IHNldCB1cCBmb3Iga2VybmVsIGJ1aWxkcy4gSXMgdGhlcmUgYSBndWlkZT8KPgoKWWVz
OiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9hZG1pbi1ndWlkZS9idWct
YmlzZWN0Lmh0bWwKClRoYW5rcyEKCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
