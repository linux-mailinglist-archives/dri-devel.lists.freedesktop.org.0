Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7498A4E124
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C6E6E839;
	Fri, 21 Jun 2019 07:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AD36E5B2;
 Thu, 20 Jun 2019 14:48:21 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id m24so411589ioo.2;
 Thu, 20 Jun 2019 07:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VsQgLN55m2Gadfa4Rkhy/vSEEq52+zbPqM7w5Sqzpzw=;
 b=lEUK0CYlK9TubY5Vl3KxCOTmMJ88Gdzg+FLM5MiBFdUCyKZdX4eAsHOiGhmQ+ZluX1
 V/N212srBDuG11KDKNYypDzmJ94TVN0OhYTtOopWOAt62tgnkdINi4UwdnJU3glTuBaB
 IGHvffss4nSJBEJ1GJprNJDfceyjaj1uTnnmfaC6B35gvjLXolRBLExdcihikbktwKbt
 1rvK6e55BKa1otk2urnpW1UPL9Mbm9V7GBKBk2cWVLurrp2y3QccaHOld3psi7vS8s66
 WilyaKQsnf6E42Sf5nVPCQ96l6lTLI/+x5UEnjFsfRRXL+KQw4a3DUkf0ScQqpNqTCvo
 1ayg==
X-Gm-Message-State: APjAAAVSrUB11cBB547+x+oWL7bhzPuxeH6NyttE3PcIkZ1NOcNhTofv
 wIrK7InZQCerYX4DE6w2JlQVj7yY8M/cRzPt2Qg=
X-Google-Smtp-Source: APXvYqymqUxrf8avJ4KxgGLTzfC12Z41YYErMCh3cVS0mHma2ZJVWrRojP1WSFL43Rq+qeb5N3d6E2Un86A0iYmOnyE=
X-Received: by 2002:a02:ac09:: with SMTP id a9mr18708279jao.48.1561042101139; 
 Thu, 20 Jun 2019 07:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
 <20190618221022.28749-1-robdclark@gmail.com>
In-Reply-To: <20190618221022.28749-1-robdclark@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 20 Jun 2019 08:48:08 -0600
Message-ID: <CAOCk7NozdcpnHpot35KyQ9OStrsVUvLN3-rL=q3Lzu5jfk=3-Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 5/5 v3] drm/msm/mdp5: Use the interconnect API
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VsQgLN55m2Gadfa4Rkhy/vSEEq52+zbPqM7w5Sqzpzw=;
 b=j2DEPEe4nld4yIyPis9Njlqjyfk9imzNxLBH6KEDxpb8hgq5acI9Z8sjs1xuyRraQd
 HS1C7IEN6L9TQrFV2SUneM5xM/6Gs26rLPbV0Fp+jjjZsuEWIy3K7ijDfGLajiI6XJd5
 3lPkXIEl+0iAUNndnphTgPGxOYHzQzXSABUIwbrVgtX6jH3zlRgmzKrd0Pu8p6nG3gRC
 /CZmXYuaezyFl/6RhZrGNYo3FJ2ZKrnK3ewS02liO5Acb+W4vnOPqud0MXd/jSIJ2Tk3
 B18WirhpJfp4Rmw5v9PYnTNFTdoNhr4iEljimEfc68Bp350tJ/ci6gNucn2JtwlfNIcd
 ofOQ==
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
Cc: Rob Clark <robdclark@chromium.org>, Boris Brezillon <bbrezillon@kernel.org>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgNDoxMCBQTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogR2VvcmdpIERqYWtvdiA8Z2VvcmdpLmRqYWtvdkBsaW5h
cm8ub3JnPgo+Cj4gVGhlIGludGVyY29ubmVjdCBBUEkgcHJvdmlkZXMgYW4gaW50ZXJmYWNlIGZv
ciBjb25zdW1lciBkcml2ZXJzIHRvCj4gZXhwcmVzcyB0aGVpciBiYW5kd2lkdGggbmVlZHMgaW4g
dGhlIFNvQy4gVGhpcyBkYXRhIGlzIGFnZ3JlZ2F0ZWQKPiBhbmQgdGhlIG9uLWNoaXAgaW50ZXJj
b25uZWN0IGhhcmR3YXJlIGlzIGNvbmZpZ3VyZWQgdG8gdGhlIG1vc3QKPiBhcHByb3ByaWF0ZSBw
b3dlci9wZXJmb3JtYW5jZSBwcm9maWxlLgo+Cj4gVXNlIHRoZSBBUEkgdG8gY29uZmlndXJlIHRo
ZSBpbnRlcmNvbm5lY3RzIGFuZCByZXF1ZXN0IGJhbmR3aWR0aAo+IGJldHdlZW4gRERSIGFuZCB0
aGUgZGlzcGxheSBoYXJkd2FyZSAoTURQIHBvcnQocykgYW5kIHJvdGF0b3IKPiBkb3duc2NhbGVy
KS4KPgo+IHYyOiB1cGRhdGUgdGhlIHBhdGggbmFtZXMgdG8gYmUgY29uc2lzdGVudCB3aXRoIGRw
dSwgaGFuZGxlIHRoZSBOVUxMCj4gICAgIHBhdGggY2FzZSwgdXBkYXRlZCBjb21taXQgbXNnIGZy
b20gR2VvcmdpLgo+IHYzOiBzcGxpdCBvdXQgaWNjIHNldHVwIGludG8gaXQncyBvd24gZnVuY3Rp
b24sIGFuZCByZXdvcmsgbG9naWMKPiAgICAgc2xpZ2h0bHkgc28gbm8gaW50ZXJjb25uZWN0IHBh
dGhzIGlzIG5vdCBmYXRhbC4KPgo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnaSBEamFrb3YgPGdlb3Jn
aS5kamFrb3ZAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFy
a0BjaHJvbWl1bS5vcmc+CgpMb29rcyBnb29kIHRvIG1lLgpSZXZpZXdlZC1CeTogSmVmZnJleSBI
dWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
