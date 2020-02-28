Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9829617433A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 00:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD796F52D;
	Fri, 28 Feb 2020 23:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB416F530
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 23:36:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r7so5099101wro.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 15:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=KIMqojdySftVbEchMKmvDu1hxx5jOX8pHCLHKZzK8dU=;
 b=WW2H1CwTYnCSSKdB5ERVN3QZUhoZ9JiiYzedNV1EWDCV0kqjvb0Q5tjCl6kUBpjTpa
 JnpkQt+M7rN5tJY1dDyyxR1g0jQo0iAGjA4PLgfG2C6pNXR0E2doz3nmatm8g2dKTfle
 2b572mjacSe892li+jxrKQwzRChv+DUfjwxSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=KIMqojdySftVbEchMKmvDu1hxx5jOX8pHCLHKZzK8dU=;
 b=LtzXiKDLqH36ujbrJFnPsDjzUp9o/Xox5gPYD+3BFTp/f7sccaYldAGmeVrrcoh+5Q
 zMvD62nHzs9HAhhQ7n0d6kVVFGWhgCApk3okogdrTTpvEi+zLtMQpeL25wiHBrtGejkP
 ToI+RrLSrzcVrFI8yWZv5EcwS9iX2z1ND4infof5K3UBAXe69qRuPRLiaU0PteLf/T3k
 91AgW4MqfJwccBjVYZ1cHeHpdjRQ63yCqvMLXk7AXsgdQbP59tVQ6jaLF6MhJ4SfjC2y
 OBHsZJZ3DCQo9oeSt7XthTJjb/uNFdXn2k0wnG3zYM8LkSA+63UWJ7isHbYYaRHZTkFm
 oDiQ==
X-Gm-Message-State: APjAAAUi/HrRsdrt4zQsw7FERy+MTvmKUZULTOt+cqhkXy1Kmf0wITWg
 90UO5rokw9w76m5YnsJBaFnifg==
X-Google-Smtp-Source: APXvYqxyy9j4SCqy/MmdVuOuV66PGkzhqqv7BQiUHzSNu1O8KoFBtk987ErE61Xt4RH6BLYh4yDpxg==
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr6824766wru.293.1582932965285; 
 Fri, 28 Feb 2020 15:36:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g10sm15069342wrr.13.2020.02.28.15.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 15:36:04 -0800 (PST)
Date: Sat, 29 Feb 2020 00:36:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 1/2] drm/client: Dual licence the file in GPL-2 and MIT
Message-ID: <20200228233602.GA2363188@phenom.ffwll.local>
Mail-Followup-To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Emmanuel Vadot <manu@bidouilliste.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Emmanuel Vadot <manu@FreeBSD.org>,
 Jani Nikula <jani.nikula@intel.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, efremov@linux.com,
 kraxel@redhat.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sam@ravnborg.org, tzimmermann@suse.de
References: <20200215180911.18299-1-manu@FreeBSD.org>
 <20200215180911.18299-2-manu@FreeBSD.org>
 <877e0n66qi.fsf@intel.com>
 <158254443806.15220.5582277260130009235@skylake-alporthouse-com>
 <20200225091810.1de39ea4e0d578d363420412@bidouilliste.com>
 <20200225170313.GM2363188@phenom.ffwll.local>
 <2a735cb0-5a78-8dcf-dcaa-30f5a5f77e2d@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a735cb0-5a78-8dcf-dcaa-30f5a5f77e2d@tronnes.org>
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
Cc: Emmanuel Vadot <manu@bidouilliste.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emmanuel Vadot <manu@FreeBSD.org>, airlied@linux.ie, efremov@linux.com,
 tzimmermann@suse.de, sam@ravnborg.org, kraxel@redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 01:28:57PM +0100, Noralf Tr=F8nnes wrote:
> =

> =

> Den 25.02.2020 18.03, skrev Daniel Vetter:
> > On Tue, Feb 25, 2020 at 09:18:10AM +0100, Emmanuel Vadot wrote:
> >> On Mon, 24 Feb 2020 11:40:38 +0000
> >> Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >>
> >>> Quoting Jani Nikula (2020-02-15 18:33:09)
> >>>> On Sat, 15 Feb 2020, Emmanuel Vadot <manu@FreeBSD.org> wrote:
> >>>>> From: Emmanuel Vadot <manu@FreeBSD.Org>
> >>>>>
> >>>>> Contributors for this file are :
> >>>>> Chris Wilson <chris@chris-wilson.co.uk>
> >>>>> Denis Efremov <efremov@linux.com>
> >>>>> Jani Nikula <jani.nikula@intel.com>
> >>>>> Maxime Ripard <mripard@kernel.org>
> >>>>> Noralf Tr=F8nnes <noralf@tronnes.org>
> >>>>> Sam Ravnborg <sam@ravnborg.org>
> >>>>> Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>
> >>>>> Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>
> >>>>
> >>>> I've only converted some logging.
> >>>>
> >>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
> >>>
> >>> Bonus ack from another Intel employee to cover all Intel copyright in
> >>> this file,
> >>> Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
> >>> -Chris
> >>
> >>  Thanks Chris,
> >>
> >>  Daniel, if I'm counting right this was the last ack needed.
> > =

> > I'm counting the same, patch applied and thanks for taking care of the
> > paperwork pushing here.
> > =

> =

> Looks like it got lost somehow, I can't find it in drm-tip at least.

Sry got stuck in my script, I kicked now.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
