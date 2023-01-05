Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546CB65EAC4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BDB10E707;
	Thu,  5 Jan 2023 12:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC6110E707
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:35:41 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso1175350wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 04:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YSA6zYxnKj2CJGgjVWVQgRIzGVPZDpCjVD215GDDcrM=;
 b=ILs/3NmKO0MKq0m1McZEP/lP6y2ZDXCidXCmIk0bb8ETVdlK9OHnV7vUKL8L9QZgZV
 ufyxm3BzRa8jaWz9QD5gMzHvWjU9JtPoYAArECXVeovwa3JPFpWLny2qQaG+bLQJZIhE
 ARw+YS6V3a+7Claq5yhDsGZtlBMCshLkIInkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSA6zYxnKj2CJGgjVWVQgRIzGVPZDpCjVD215GDDcrM=;
 b=z0p799mm/QrLQ+uy9j/crI0nb17ursSM9z7hBpzlw9FO/UUdc7DvInqzAjan37ip3+
 dBp9COtLOCRrY7X03H5c7OKms4hBp279lYKEDYK1+3+JF47XG5dLkNuISmBTlv1pFcET
 Vp6SXSwu/axPBBHp/wCGc6R4BMnylpCqhyRJI5mTKAzr9Fpo+orYLFEGLoYQKmEBcrmq
 cfTu9Rdty5xIka5dNt7CMbpWAwZqphitmvirwjhLSCQuL1nJQUd5y44lVEhBorVbELS+
 psQhUwH68kRk2pL/OC7eP7eFX4EspGDC48ET/WJJO393JBvP5XP/0brewVjr6mo7Yf6M
 N5kA==
X-Gm-Message-State: AFqh2krMjyGg78+2GmjrP6+tnYx0Oa9aGQGVR3VeJJPuoNoEhQw2790F
 d9hSBnAapoEOzCVa6cQSX2+hsw==
X-Google-Smtp-Source: AMrXdXu3Q8WzdIO45lcNUAkTD9WkyiNM8TGg+WFlc9SJ4E40l78FDH5Y3z2AZwCJ5/ZeO72ekhJrFA==
X-Received: by 2002:a05:600c:4fcf:b0:3cf:360e:f37d with SMTP id
 o15-20020a05600c4fcf00b003cf360ef37dmr35938993wmq.22.1672922140065; 
 Thu, 05 Jan 2023 04:35:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1c5403000000b003cf5ec79bf9sm2377554wmb.40.2023.01.05.04.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 04:35:39 -0800 (PST)
Date: Thu, 5 Jan 2023 13:35:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
Message-ID: <Y7bEGaZol7jFuHwR@phenom.ffwll.local>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
 <Y4iqR94aGFa3NahQ@kroah.com>
 <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
 <20221201141642.uvonbrny4rhuacl5@meerkat.local>
 <dad6891d-5ca2-b849-b504-1a37b4741886@suse.cz>
 <Y4i672D3GHu2xPS5@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4i672D3GHu2xPS5@sirena.org.uk>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Vlastimil Babka <vbabka@suse.cz>, Thomas Zimmermann <tzimmermann@suse.de>,
 tools@linux.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 01, 2022 at 02:32:15PM +0000, Mark Brown wrote:
> On Thu, Dec 01, 2022 at 03:27:32PM +0100, Vlastimil Babka wrote:
> 
> > I usually do that with git send-email and a custom --cc-cmd script, but
> > additionally it sends the cover letter also to everyone that's on any
> > individual patch's Cc, so everyone gets at least the cover letter + their
> > specific patch(es).
> 
> > But that extra logic could be optional.
> 
> Yeah, without the cover letter if you've just got an individual patch it
> can be unclear what's going on with dependencies and so on for getting
> the patches merged.

+1 on including the cover letter for any recipient. If b4 can do this
right by default, that would be a really good reason for me to look into
it and switch.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
