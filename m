Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632E2B44C
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C3A89DE5;
	Mon, 27 May 2019 12:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AE06E10A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 20:43:37 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id go2so4596847plb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 13:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
 :user-agent:date;
 bh=XYlEJGhmV+ZH77RNipzHzZLCyxSeSQNCKabAuaHQX5g=;
 b=SZfFU9S8ipAnTs02Enk56167F9OzKNr+fMIEh1nT7NEue/YRgNZHfNpxnpAsIAblP6
 9OEp1IJg/pNwcywU+Ol3qOvfSlsjFV8V4LlrAHCXx/H6+0fTOH3HK4CxcuGW5b5vXcZq
 i/F654lfEGNmMkRzswZUs8y1KJ/+GWFuIcLXl908Bph5Cn9YcY5BYzOee2Juvyh8+n9H
 To7ruUSfw2eNIJ/gs2To2PjTFvtXRy35uN5Y7gykY0OdKeDGrG4HDBNR5p41vPuLbJzj
 kCv1kCtiM0xFzhhDSFbYitDsS3wnQ2xm8RHDyDPZxt548PYJTRIZ8NPEcu6a7p8x43+D
 lJWw==
X-Gm-Message-State: APjAAAXYvxxpani31gbNOsnvehQeRhRTH+3iNInEP3H3RkqhagYqj3aQ
 QBu3kC9M9nSEs3ighmwV866atg==
X-Google-Smtp-Source: APXvYqy4bHdJtzpQke5FGpvQIwzY9VRQtG1nbSuaGtiQQwPTga0LpVbsbq2N7mJ7wkglH8TDxg5eyw==
X-Received: by 2002:a17:902:d24:: with SMTP id
 33mr108743947plu.148.1558730617412; 
 Fri, 24 May 2019 13:43:37 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id q19sm4403146pff.96.2019.05.24.13.43.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 13:43:36 -0700 (PDT)
Message-ID: <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20190524173231.5040-1-sean@poorly.run>
References: <20190524173231.5040-1-sean@poorly.run>
Subject: Re: [PATCH 1/2] drm/msm/dpu: Use provided drm_minor to initialize
 debugfs
From: Stephen Boyd <swboyd@chromium.org>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
User-Agent: alot/0.8.1
Date: Fri, 24 May 2019 13:43:35 -0700
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:subject:from:cc:to:user-agent:date;
 bh=XYlEJGhmV+ZH77RNipzHzZLCyxSeSQNCKabAuaHQX5g=;
 b=ZysEZ+lzbs4WdfNLSfgn4Jd5YoDfaKAShEaz4jGm4KKJb96DCqWPU+PihMo2zf9s0A
 VvLLbECme3tWN4KsnLA27AHO5WQQbOt+ACDR9xmiSu9lZPb0fMoO7Ev+wZBJcvjdphMs
 N6tr3emJekd2/Qf84t+1l53//jQmatrbfIoHE=
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTZWFuIFBhdWwgKDIwMTktMDUtMjQgMTA6MzI6MTgpCj4gRnJvbTogU2VhbiBQYXVs
IDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gCj4gSW5zdGVhZCBvZiByZWFjaGluZyBpbnRvIGRl
di0+cHJpbWFyeSBmb3IgZGVidWdmc19yb290LCB1c2UgdGhlIG1pbm9yCj4gcGFzc2VkIGludG8g
ZGVidWdmc19pbml0Lgo+IAo+IFRoaXMgYXZvaWRzIGNyZWF0aW5nIHRoZSBkZWJ1ZyBkaXJlY3Rv
cnkgdW5kZXIgL3N5cy9rZXJuZWwvZGVidWcvIGFuZAo+IGluc3RlYWQgY3JlYXRlcyB0aGUgZGly
ZWN0b3J5IHVuZGVyIHRoZSBjb3JyZWN0IG5vZGUgaW4KPiAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkv
PG5vZGU+LwoKU28gZG9lcyB0aGlzIG1ha2UgaXQgYmVjb21lIC9zeXMva2VybmVsL2RlYnVnL2Ry
aS88bm9kZT4vZGVidWc/CgpJIHdvbmRlciB3aHkgaXQgY2FuJ3QgYWxsIGJlIGNyZWF0ZWQgdW5k
ZXIgL3N5cy9rZXJuZWwvZGVidWcvZHJpLzxub2RlPgphbmQgdGhlbiBhdm9pZCB0aGUgZXh0cmEg
ImRlYnVnIiBkaXJlY3RvcnkgdGhhdCBpc24ndCBhZGRpbmcgYW55IHZhbHVlPwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
