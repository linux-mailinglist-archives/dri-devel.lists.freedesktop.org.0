Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDAFF95CF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 17:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB996EB6B;
	Tue, 12 Nov 2019 16:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35816E7A0;
 Tue, 12 Nov 2019 16:40:35 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t5so18577053ljk.0;
 Tue, 12 Nov 2019 08:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=mWVrCYmejhKGmzIIEDPgBnwgNyRnKaMZUgPiu5/d9v4=;
 b=pPhFCKwg+02kTdfF9/UuW1+UodiAJYz85YmGH9D/LuWBHVB4X5TVgIXez2erBIBfGc
 GrlG+sIXUSY6NpRjDSXU5o6R9SU8gnpI59MNLtjUoyuaddCdEZQdmwh7dbu5NdLH28zM
 vDxzh1HpbgVGaQK6FveVaNrUaY3lDXv6uEv/v5LMrlZjRnHB2Ym0MsWvsjMCzFCX9zOj
 7HCLx8cwR8W5BKLXRLBOU/wBdqq8E+dzkHPM5q6tTAqJH26luhIM1J/DHWVcQKrzt0xT
 npwINDbCCPfX5ri48fkZH4ddhpB+DPcaRXkIli34Mi7GHt1GEaZxXmsLdAsICC4O5MaP
 Tt+A==
X-Gm-Message-State: APjAAAVoKBqdTn4oVyN55mxt41k4oePT4CMNLnSyy54nzsOex50Y6wrv
 KlGqVEB3rN4wN/ihq+ohkc6wGcM9V9axOqRmfunOb9m9
X-Google-Smtp-Source: APXvYqwGOAyQYyc+eRSdNINGCv/uWJ7yTf9nqDn9F3cglME2ClIXK1ZBV5Gr7ob+J6hAyyebEbhdqt83uuXr/OQU0Pg=
X-Received: by 2002:a2e:6e15:: with SMTP id j21mr20900560ljc.17.1573576833954; 
 Tue, 12 Nov 2019 08:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20191015134012.15165-1-festevam@gmail.com>
 <CAOCk7NpoGA8VmTXSk96VxVtGU2yFs0+n8wyBeQkvwR8HZSOCRQ@mail.gmail.com>
 <CAOMZO5AnZ2dhgxsLVUSDqSGcPH8T1yOABWrqEniKotONTR29fw@mail.gmail.com>
 <20191101145209.GA16446@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20191101145209.GA16446@jcrouse1-lnx.qualcomm.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 Nov 2019 13:40:22 -0300
Message-ID: <CAOMZO5ADoav=-6ZMn-C=7UA0Fz96BVyitSYeAsn+kxf8HBzZ2g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RESEND] drm/msm/adreno: Do not print error on
 "qcom, gpu-pwrlevels" absence
To: Fabio Estevam <festevam@gmail.com>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Sean Paul <sean@poorly.run>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, Chris Healy <cphealy@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=mWVrCYmejhKGmzIIEDPgBnwgNyRnKaMZUgPiu5/d9v4=;
 b=lSJCXWj2qpsEYAMgRhqnyjOsNxKjB63rFMKifZMlUNZmu14pNKwBUtD/kkNtMpf9R+
 SEgLRObhUYLioMS0bJpVML5ysZSipyDf8eZZMEjmeUbZAFGUus4IInSSJSpcLL7UzQKU
 7EY8+dSvlxJ2twMH85JfGiTvUeOiCNoYwB26qzlmBRSNNo9o0mLes6q1yByVIDiCa4RJ
 rBSfv63wANY4Kk8HYYLpbgVQ6TDBEDNt7xfp1er8WVV27SUPEi0GnYs5oOQqzu2sWMYT
 ldLqhfz32bLYf6D2X/1lcUwbXxI5fE4X3CVU8tMIwaGHqAT4BWx0g/rrU0z4/B5lvYiE
 6r4A==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9yZGFuLAoKT24gRnJpLCBOb3YgMSwgMjAxOSBhdCAxMTo1MiBBTSBKb3JkYW4gQ3JvdXNl
IDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKCj4gSSdtIGdvb2Qgd2l0aCB0aGlzLiBU
aGlzIHJlYWxseSBzaG91bGQgb25seSBiZSBhcm91bmQgZm9yCj4gY29tcGF0aWJpbGl0eSB3aXRo
IGRvd25zdHJlYW0gZGV2aWNlIHRyZWUgZmlsZXMgd2hpY2ggc2hvdWxkIG1lYW4gbm90aGluZyBm
b3IKPiBJLk1YNS4KCk1heSBJIHJlc2VuZCBpdCB3aXRoIHlvdXIgUmV2aWV3ZWQtYnkgdGFnPwoK
VGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
