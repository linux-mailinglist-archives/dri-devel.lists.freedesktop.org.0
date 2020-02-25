Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA616EC06
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 18:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB966E8EA;
	Tue, 25 Feb 2020 17:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74F76E8EA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 17:03:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t79so2291649wmt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=WOIAsrMCz3yWV6MBUgzBXfjjCWfPYKrvISaoax4svGg=;
 b=c6to44zjOaQzbhDA/lFx5Mls2Au9Ezwa/69UC8iBSsIBqoMJAqlzyrQnRyqMpBBl8v
 GT9mukF5ICwZDg8ZA2eTZ1EGz9vL/yxTo8qjooJjQyGnH/wQpynUEZlHg5hBCvNdNDSD
 xHEZ1ihJNWTddgYvwVpBObxeXSIR4gv25OpmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=WOIAsrMCz3yWV6MBUgzBXfjjCWfPYKrvISaoax4svGg=;
 b=LNbYTfLWzxT2EqHj/QDpSohr7up1BMQnmsL5x94EFBlK9f5YzLbpbSIS9NdSpOU49E
 +gMp6H+6GdJH1K6JEu3sxvNmoTXAYd8SzSB6XVSTbOySPAQNTKq7ePS8c9lKoQ8l909o
 5BbKVu8ZRunfK1Zk+LWKFV4u7nb646dXXEfpIAYANjhmrNvICiIYWix2Qq7wMmqw9jf2
 n9Fmkx7K6sxS+4B2EkuF5Sl7SZr17N3suQfQ2UZb+fRBc0us07vTZtGQbmyPVcQTbX+W
 YRNVKNKwKCG/0a9Or2wxWyUxLnIL8d/fdCjGxMZ7qTzwsDEfEeYcmafzhqS0IPhBflAd
 3Y2Q==
X-Gm-Message-State: APjAAAXQumVn8qqs/ITCVQrnshIvNN9W4qqkWs0nbtKlQ7oiM/23wqSB
 zXV4XtoNIz2Tis7qsK3uhu5PCg==
X-Google-Smtp-Source: APXvYqxzMtJXGOMsbQswdMRDN2uVpGfy+dccFzRbeHW7WQ/y4aSNT5fG7LwhOvE6poFHaK+wdbi2IQ==
X-Received: by 2002:a05:600c:22d1:: with SMTP id
 17mr215809wmg.91.1582650196202; 
 Tue, 25 Feb 2020 09:03:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n3sm4944105wmc.27.2020.02.25.09.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:03:15 -0800 (PST)
Date: Tue, 25 Feb 2020 18:03:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emmanuel Vadot <manu@bidouilliste.com>
Subject: Re: [PATCH v2 1/2] drm/client: Dual licence the file in GPL-2 and MIT
Message-ID: <20200225170313.GM2363188@phenom.ffwll.local>
Mail-Followup-To: Emmanuel Vadot <manu@bidouilliste.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Emmanuel Vadot <manu@FreeBSD.org>,
 Jani Nikula <jani.nikula@intel.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, efremov@linux.com,
 kraxel@redhat.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 noralf@tronnes.org, sam@ravnborg.org, tzimmermann@suse.de
References: <20200215180911.18299-1-manu@FreeBSD.org>
 <20200215180911.18299-2-manu@FreeBSD.org>
 <877e0n66qi.fsf@intel.com>
 <158254443806.15220.5582277260130009235@skylake-alporthouse-com>
 <20200225091810.1de39ea4e0d578d363420412@bidouilliste.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225091810.1de39ea4e0d578d363420412@bidouilliste.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: tzimmermann@suse.de, Jani Nikula <jani.nikula@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emmanuel Vadot <manu@FreeBSD.org>, airlied@linux.ie, efremov@linux.com,
 sam@ravnborg.org, kraxel@redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 09:18:10AM +0100, Emmanuel Vadot wrote:
> On Mon, 24 Feb 2020 11:40:38 +0000
> Chris Wilson <chris@chris-wilson.co.uk> wrote:
> =

> > Quoting Jani Nikula (2020-02-15 18:33:09)
> > > On Sat, 15 Feb 2020, Emmanuel Vadot <manu@FreeBSD.org> wrote:
> > > > From: Emmanuel Vadot <manu@FreeBSD.Org>
> > > >
> > > > Contributors for this file are :
> > > > Chris Wilson <chris@chris-wilson.co.uk>
> > > > Denis Efremov <efremov@linux.com>
> > > > Jani Nikula <jani.nikula@intel.com>
> > > > Maxime Ripard <mripard@kernel.org>
> > > > Noralf Tr=F8nnes <noralf@tronnes.org>
> > > > Sam Ravnborg <sam@ravnborg.org>
> > > > Thomas Zimmermann <tzimmermann@suse.de>
> > > >
> > > > Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>
> > > =

> > > I've only converted some logging.
> > > =

> > > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > =

> > Bonus ack from another Intel employee to cover all Intel copyright in
> > this file,
> > Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
> > -Chris
> =

>  Thanks Chris,
> =

>  Daniel, if I'm counting right this was the last ack needed.

I'm counting the same, patch applied and thanks for taking care of the
paperwork pushing here.

Thanks, Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
