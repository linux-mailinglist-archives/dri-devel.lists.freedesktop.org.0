Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F255B98B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 14:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5E810E21B;
	Mon, 27 Jun 2022 12:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C136110E21B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:36:40 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q9so12860480wrd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 05:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jhMnhvP16Ty9k8cx9JCXsgpH4aaz/Fmtpfaqc20VWcw=;
 b=U2eoD6YDVpV31d326aqV/g/RltpyIY9rjQhWggIwoWRflNvpYzNZjKN5ZWbHmBMAni
 BxvYB5z4hvivkexCcJPbQVEWe2aJV4lWBt/7wWqncgkl2lFMlZuDesqTog7utiql1i5/
 Xz+MmTHHTMwk6bNlD+gi+eqn1zpJbjwNe/9uHC+VDab2/YDsuNFLHOq8TgipaXv7/N3W
 UY4moBD/9CIxU4vaWTuOi/rQOb8x7su6rnXCgGxD0vBfZGpC4348dQ0dHayejMpY152u
 72GldKPx+N641AUIDCh8tF+cEUt5AZRc1Zd9qNdxRvOlV7AowEZmC+bfG8Njf1HBUajK
 CHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jhMnhvP16Ty9k8cx9JCXsgpH4aaz/Fmtpfaqc20VWcw=;
 b=MseuRdNktaJ8v/oYNrDxZb59yYeK7/s8B25DcTnr00TQJa+WFd7E+787ykp6nE82JW
 2s53mV/cfGjcn8aW33mm3mdA/75ygtLVh3bJKJWlCbaEgTk6xiehnw4TS6DfHTfu5Tza
 GFzWOqZdPiUPdJuiXkzwcAO0Wum9b4b/cP+H8FlLVpBVswiZi3bT/Fchh9I0oUXhyl24
 SRtBkl7eOL/ykX2AmSanelk7wV2Guz1lAlutinzYU2n1n4rH4g9yKl/oe0lxyAkQ9msz
 pEq7VyEDdcoNQlim+JxeFJk+sEVYgP8alAM5owwgFPt8++mKhir4yLqD0NM87Xz2x01F
 WqLQ==
X-Gm-Message-State: AJIora97asOB8M0CBrcPZY+ILJZTVH7N1PWm+L5S6ZXHjpBmyoR25K1M
 hlS00rwndNHi4Dk9RtF0IKY=
X-Google-Smtp-Source: AGRyM1svJUkoG5oAT5Lk55huQ5TszxhpG9aNgEtz8h6NX5RX9cQJEWBIL7AVwXyu5Ir1dSZHN90+xg==
X-Received: by 2002:a5d:5107:0:b0:21b:8c5d:1072 with SMTP id
 s7-20020a5d5107000000b0021b8c5d1072mr12859255wrt.378.1656333399251; 
 Mon, 27 Jun 2022 05:36:39 -0700 (PDT)
Received: from elementary ([94.73.36.128]) by smtp.gmail.com with ESMTPSA id
 e12-20020a5d530c000000b002185d79dc7fsm10398933wrv.75.2022.06.27.05.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 05:36:38 -0700 (PDT)
Date: Mon, 27 Jun 2022 14:36:36 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/3] drm/doc: Add KUnit documentation
Message-ID: <20220627123636.GA1772666@elementary>
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
 <20220613171738.111013-4-jose.exposito89@gmail.com>
 <c50e5c87-3198-08b7-1e32-d0959af1f296@redhat.com>
 <YrYmR+aCdO3ldORB@phenom.ffwll.local>
 <b16eba9c-30cc-c71f-ad95-eb5398f84af8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b16eba9c-30cc-c71f-ad95-eb5398f84af8@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com,
 Maxime Ripard <maxime@cerno.tech>, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier, Daniel,

On Fri, Jun 24, 2022 at 11:18:40PM +0200, Javier Martinez Canillas wrote:
> Hello Daniel,
> 
> On 6/24/22 23:01, Daniel Vetter wrote:
> >
> > [...]
> > 
> > Hey so since you have a bunch of patches merged into drm already but seem
> > to lack drm-misc commit rights to push these yourself I think it's time to
> > get those:
> > 
> > https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc
> >
> > And I guess Javier can help you with any questions you might have and make
> > sure the request gets through by poking folks on #dri-devel irc?
> >
> 
> Yes, he already requested commit access and got the acks, so I think is
> just a matter of time until he has this sorted out.
> 
> José, please don't hesitate to ask if you need any help or clarification
> once you have a setup to push your patches. The dim documentation [0] is
> superb but I know that it can be somewhat stressful the first time :)

Thanks for creating my ssh account :D

The tool is really well documented, setting it up was a piece of cake.
I pushed the patches to drm-misc-next. The output didn't show any
errors or warnings, hopefully meaning that I didn't mess up.

Jose

> [0]: https://drm.pages.freedesktop.org/maintainer-tools/dim.html
>  -- 
> Best regards,
> 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 
