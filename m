Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E859C25F3DD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 09:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594716E229;
	Mon,  7 Sep 2020 07:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F46A6E0E1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 06:54:35 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id gf14so6010995pjb.5
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Sep 2020 23:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o8g2x95/5vs9teUbA+OBdLU6ARSUU/ROuR8WWiVtU9g=;
 b=giFPadgMBYboBptsHg38rbJuFrrSa7hN5l2ZasV3JrETKlbNfqoiI2M4BTiL2/4FVl
 t3qr7tzlSXXzCyyJsCkoLasYAE3/mzHasPjNxASmT9ih5kqapZ/bSe6VPffuIpgbmsF5
 8RLannbfcmiIlYYl2nofuISkLnCX4o3PsRokxpCnfQ+W4dFG61HezklWqfwprkIg1/1s
 4qRbLkgZQfltAoPatGT7rTyb1r2rSvEVHDfa2B+3Q9+IjKULub2rgKNeVoHN1X2I08ar
 96TLIn4xcZJjfdVYsFtvVYOnU1hVeZjMGVg2+JLviy47EF62nGac8hkwDVuo+yIxQZB9
 Vj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o8g2x95/5vs9teUbA+OBdLU6ARSUU/ROuR8WWiVtU9g=;
 b=uVTUplaC3MwRU3HUmLKMGcYSCY2XLG64X89hsCnevDl+cLKcnp18NaDWMR6OSDEMyq
 KRJ0bngbVQJD57Sjt8I9BOEv9QGxjTEdXTc5F2+bMXOrBTtVtsNx6pwYrvEcwhx8aOw3
 6N2igRppLqT51dRASCiQgjGvwyyhPJHp8Jmws9f+Uf7URUx0eVhkRGabNC2iX42RyiDM
 8CJ0OGhpar8UEiqG4Udw+yyynd04/0daWE5WAIEiPRxjkotMp7ya+Fd834D+M9D/vqtt
 PKrjdvPmJADMdh6rOAq0aem2x/vEgINl3Pis/vMqLuvE92ihCKnYHXuySGfHOYuzHo8f
 1q6Q==
X-Gm-Message-State: AOAM533il/Dwd8FAbNFOJAcSi9DhrzUlwC+6ewll/+hThbM8r/5X51gN
 R40Bpzmbanso/Stvrjru0YQ=
X-Google-Smtp-Source: ABdhPJw55OcWofC6teQbiKEAY1os2nE0Xo3rrdLivdlVHahC5JQQHN2ViUEJwrnGbmArWTFuwtnBlg==
X-Received: by 2002:a17:90a:5283:: with SMTP id
 w3mr19683479pjh.201.1599461675200; 
 Sun, 06 Sep 2020 23:54:35 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id q3sm14114254pfb.201.2020.09.06.23.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 23:54:34 -0700 (PDT)
Date: Mon, 7 Sep 2020 12:22:16 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 1/2] video: fbdev: aty:
 radeon_pm: remove redundant CONFIG_PM container
Message-ID: <20200907065139.GA29423@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-2-vaibhavgupta40@gmail.com>
 <20200907063347.GB29062@gmail.com>
 <20200907064810.GB284261@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907064810.GB284261@kroah.com>
X-Mailman-Approved-At: Mon, 07 Sep 2020 07:22:17 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bjorn@helgaas.com>, Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <treding@nvidia.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 08:48:10AM +0200, Greg KH wrote:
> On Mon, Sep 07, 2020 at 12:03:47PM +0530, Vaibhav Gupta wrote:
> > 
> 
> Why did you send empty emails out?
> 
> greg k-h
I was trying to re-ping the patches. Guess it went empty. I will send patches
again.

Vaibhav
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
