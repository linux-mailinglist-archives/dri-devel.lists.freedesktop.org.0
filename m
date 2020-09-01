Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C52E9258F0A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 15:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5496E07D;
	Tue,  1 Sep 2020 13:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1366E07D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 13:26:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t10so688376wrv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 06:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=CNABcpASJeKoKft4PG4FvpewpijHWWDk2sidoyW6heM=;
 b=j4QVHRpw4GzJKBjxvLbpZVenJ40TC8oXokiCIJpYyNS4gt1CZacOxXPxYVUPI+837r
 HxCvNyadvqQ/QRyp4sYjxy+1jcMfW4tL2nJ+mBuDTSyF6V4hm8dMGWErFM7WuWKliuos
 Ii4MIPD+rHfy/HsCl6NgbsWz/2pfoUUa4x8WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=CNABcpASJeKoKft4PG4FvpewpijHWWDk2sidoyW6heM=;
 b=BlmShavgC4vQV+Pw4NNmYOogeqFcvn01pW+XHBV8XnltZSJ9VRViEB2/1leRuaQoIg
 vtcCpLbChvll9NK15VY77CKPlXAPGt5Euy56yVGTtJkgfFm5j8azQx1aU6vnc6HHqQeC
 lyioBm8OQX62wSJnJlefreUwbcougUaiXwAJ0ZhGOsyHrNbuYlCRqQOxALPy10tM654R
 om2gRXrPoSf6J9NBb2H8GPHWB/Jnv/ssvXDq9p8wAH2/mqVsHDvCUjKshYnFgWjjsIn9
 oJYOI07p8YZvjLNKc1R6TGW92uadMrWlFJxpG598+AaeFw4u5Trt2mKjLZ0zgwS9/SIA
 Icnw==
X-Gm-Message-State: AOAM5319imaLvGR5dPMIMwGumMBgs5mhgjriv0s9yHJiKL68XTekw2qE
 HjghWo/ZGZXkgtE5OAauK+BRXg==
X-Google-Smtp-Source: ABdhPJz/tROheQMCb+pApG2Lu/+Is30f61BJWt+eoItPVyJcy/+r2iL4m5NBLt+OOKw+9cBOY3dI/A==
X-Received: by 2002:a5d:56cd:: with SMTP id m13mr1852446wrw.261.1598966818495; 
 Tue, 01 Sep 2020 06:26:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w15sm2402549wro.46.2020.09.01.06.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 06:26:57 -0700 (PDT)
Date: Tue, 1 Sep 2020 15:26:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: add support for gamma_set interface
Message-ID: <20200901132656.GD2352366@phenom.ffwll.local>
Mail-Followup-To: Simon Ser <contact@emersion.fr>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 Sidong Yang <realwakka@gmail.com>
References: <20200829140647.7626-1-realwakka@gmail.com>
 <UeJwFKvmNgKdZY_icN0-nrFly9R1vbzaMZ-TiyxIIPBcdl278uZsK6YdTTdRl6rFukBAmN-eyCFpnfsIB-El9QpyYiutdcpgJg64n4tsRRc=@emersion.fr>
 <20200831133858.GA9280@realwakka> <20200831134852.GY6112@intel.com>
 <C7EgdPUBX9nRTKx9kkGIZijd0yGMOLEtXOwa2jvk-rKtprmNZKSDP-Jos7mYU88DOQYiXJBnz0_D2FAQ1x7jCwLcR-cmZtzCc5cLsJqyDCk=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C7EgdPUBX9nRTKx9kkGIZijd0yGMOLEtXOwa2jvk-rKtprmNZKSDP-Jos7mYU88DOQYiXJBnz0_D2FAQ1x7jCwLcR-cmZtzCc5cLsJqyDCk=@emersion.fr>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 01, 2020 at 08:57:37AM +0000, Simon Ser wrote:
> On Monday, August 31, 2020 3:48 PM, Ville Syrj=E4l=E4 <ville.syrjala@linu=
x.intel.com> wrote:
> =

> > > > It doesn't seem like this IGT test's goal is to exercise support for
> > > > gamma LUTs. Does the test just tries to reset the gamma LUT to line=
ar?
> > > > If so, I think the IGT test should be fixed to ignore "I don't supp=
ort
> > > > gamma" errors.
> > >
> > > It seems like that IGT test pixel-format is to make gamma lut like be=
low.
> > > for (i =3D 0; i < lut_size; i++)
> > > lut[i] =3D (i * 0xffff / (lut_size - 1)) & mask;
> > > And set this table to drm driver. and test begins. It's the test abou=
t pixel
> > > format. I think you're right. It's not about gamma lut.
> >
> > The point of the gamma LUT stuff in the pixel format test is to throw
> > away a bunch of the lsbs so that the test passes when the result is
> > "close enough" to the 8bpc RGB reference image. Without it we would
> > never get a crc match when testing non-8bpc or YCbCr formats.
> =

> OK, that makes sense. Would it be sensible to:
> =

> - Don't set gamma if the pixel format being tested is 8bpc

Hm not sure what 8bpc format you mean here, because we have C8 (needs
gamma table or doesn't work) and the 8b greyscale one with the R8 one. If
you ask for legacy 8bpc you get C8.


> - Make the test skip if the pixel format is >8bpc and gamma isn't
>   supported

Yeah the test should skip if gamma isn't there.
-Daniel

> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
