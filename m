Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF14E4B65B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC356E343;
	Wed, 19 Jun 2019 10:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72736E343
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:42:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w9so4322908wmd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 03:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TT2nK9A47FLcAVPWjohBdM0YSA12JZIvgdjlygMunHY=;
 b=rTCgJVcP+CnhRp0qOpW409mGB/dOL0HBsnTmBEzXxZ1qn1M5IDnFWhfnM5tehyc8g1
 psgl5mM0OJUQ0A3DN+1zP3LSkuvC3quPtondHJ0tCGJudveP2mcXpfvrRwh4b2FhWedr
 ioElYOoWoCsttKC1j5WnvqRZrACqyAfc1K/wz88q7WW+Ar7avF2hJQH62dKTLZaxQpns
 Cjt3MKvNJ4R7YpotvYFkkcfyeLnQwkdG6ZT0fuiumhVu4Rt2yrcWclrzn7+jOISKenCV
 PavYJ1//wUtOxkevptaiHi+rPKX8dCh9YlGP0s8Lyw9VDhwMHmnt84pJSSSbbFmSppe3
 StUQ==
X-Gm-Message-State: APjAAAXrFTf5zSUCTiNqDEdxNrZfbaT1qd9DyQ4TUJqXgSKe7ZTIc8kN
 VSOzF9Cr8EV+nIihClRt79E=
X-Google-Smtp-Source: APXvYqwZTMniWreXGV97t4naAESnNM/rCdLIobReK3BHsdELYGgUuiUhiov95Ols8kq0IrJru4hIaQ==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr8069991wmc.62.1560940939330;
 Wed, 19 Jun 2019 03:42:19 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id w2sm16821493wrr.31.2019.06.19.03.42.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 03:42:18 -0700 (PDT)
Date: Wed, 19 Jun 2019 11:40:14 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 11/12] drm/virtio: switch from ttm to gem shmem helpers
Message-ID: <20190619104014.GB1896@arch-x1c3>
References: <20190619090420.6667-1-kraxel@redhat.com>
 <20190619090420.6667-12-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619090420.6667-12-kraxel@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TT2nK9A47FLcAVPWjohBdM0YSA12JZIvgdjlygMunHY=;
 b=NyIsIIb+uVSx90RcZzFhDtYTjpvPlbj+hShSLfVTuJIpwMvZ/ktBguPb0h4gANFzoi
 hvLO9eK3+HcdDVGQqD4g6tfj30LVmL361dA7To7DiQGi0nM1Zm1pvX7plq+6FOH7NmAr
 /O+kiyQUl0JxHCQQcIUjmJvlZIDtqcyTcqHWD7j+mEn55FSdIUa+BgKm50iEvucQFs6s
 enAOJmxl4UVjU7zLox6+cqbLZeNCNPM24D74OHDh2chnsVpkFDOlc4Nn8zllc0AlalEC
 VdJcgCpHGQZ2WOKypxHA5wiou0C8wvRHblDGY4Y9c8KsQ+vcp7r5s5pobRcx7rLVlV03
 1hZA==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VyZCwKCk9uIDIwMTkvMDYvMTksIEdlcmQgSG9mZm1hbm4gd3JvdGU6Cgo+IC1zdGF0aWMg
dm9pZCB2aXJ0aW9fZ3B1X2luaXRfdHRtX3BsYWNlbWVudChzdHJ1Y3QgdmlydGlvX2dwdV9vYmpl
Y3QgKnZnYm8pCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgdjNk
X2dlbV9mdW5jcyA9IHsKcy92M2QvdmlydGlvL2cKCkRvdWJ0IEknbGwgaGF2ZSB0aGUgdGltZSBm
b3IgYSBwcm9wZXIgcmV2aWV3IC0ganVzdCB0aGlzIGFuZCB0aGUgMS8xMiBuaXRzIDotXAoKSFRI
CkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
