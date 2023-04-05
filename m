Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1386D7728
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4797C10E87F;
	Wed,  5 Apr 2023 08:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223BF10E885
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 08:43:42 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5029d4d90fbso11544a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 01:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680684220; x=1683276220;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HN6lXiiJx4/5yCFxwqdcj1SL/T1KBmY3SBfRwXs2JTU=;
 b=FjY3F5Z5GXioXNULwvJZp8rKLWxXRgzzxFf+3IP/jr6oD20oQzlx9iRVMpX04NnKGO
 Zh/Zi1vcgPtDJuqazXE3BDRb2JH8riq84m9wbQaKEXvsRFEzFwib2Nb0MxgioV5jEJV7
 xYc2XnqEkwJaqmdTKEiK5hUo5kUn/h5ZNjNVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680684220; x=1683276220;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HN6lXiiJx4/5yCFxwqdcj1SL/T1KBmY3SBfRwXs2JTU=;
 b=wioILVYTvYhK0ucVey2I6Skiki0fuRiKU565QrDVd+VJldggxBRStTAovLsO9lwc2K
 cms+jVr1xlv9b6SDbPJobUf9AR9LFWQvwE0CMNAFndo7AaAIGKlHfE7XjJSI7s6bwpVb
 hn0ONPen9tHD1cLGGv7HhFANqTDdjHHf/aPadECfU4pp9iJFsqGUcppgvgPx8z8JUGxn
 QhWqSRjzQwf5wdj7J3ZSq8uf3k4QzUruVoYmq4ybCK5phF/HNtoPOSodRjJa6+Lf2r+C
 Pru/rHHKmMB/eAioYsG65jJnlQLcNhkZgTMUJzFCdaJPxmMf5PP97MLoxeoynP+0xmQm
 e1UA==
X-Gm-Message-State: AAQBX9fcaZg6IISGpucHA7DI5tmLoyg0U4ZFyFPrzMG37J2IveQtHf+3
 /OZ4cZBDSZydn8vXa+gDctn9pg==
X-Google-Smtp-Source: AKy350beKEdSQvvyhgJajFb9f2flrdfUuMkXgrhX3Rp6i3c9rA5VvvLwSh0DDm0+MAesQ5cXy+Yyig==
X-Received: by 2002:a05:6402:268e:b0:502:ffd:74a1 with SMTP id
 w14-20020a056402268e00b005020ffd74a1mr1156509edd.2.1680684220218; 
 Wed, 05 Apr 2023 01:43:40 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 k1-20020a1709062a4100b009477ba90a85sm7062009eje.69.2023.04.05.01.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 01:43:39 -0700 (PDT)
Date: Wed, 5 Apr 2023 10:43:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qiang Yu <yuq825@gmail.com>
Subject: Re: [PATCH 0/3] Revert lima fdinfo patchset
Message-ID: <ZC00us/xrcQohID6@phenom.ffwll.local>
Mail-Followup-To: Qiang Yu <yuq825@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, yq882255@163.com,
 Stephen Rothwell <sfr@canb.auug.org.au>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
References: <20230404002601.24136-1-yq882255@163.com>
 <CACvgo53mV7Aoe+omtSF0BNg+gVOWqDQ_QAmMkhikjQw-vF55Xw@mail.gmail.com>
 <ZCx6Q5y1dgAv2q/o@phenom.ffwll.local>
 <CAKGbVbssdy3D8iCyUHr-kqr8spSDkTXfKzg4pQwoSZB+dv3i0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKGbVbssdy3D8iCyUHr-kqr8spSDkTXfKzg4pQwoSZB+dv3i0A@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, yq882255@163.com,
 lima@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 08:50:06AM +0800, Qiang Yu wrote:
> Applied to drm-misc-next, sorry for the trouble.

No worries, I already complained to Lucas/etnaviv people that the sched
revert should have been at least posted/discussed on dri-devel. Imo this
isn't on you.
-Daniel

> 
> Regards,
> Qiang
> 
> On Wed, Apr 5, 2023 at 3:28 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Apr 04, 2023 at 04:17:33PM +0100, Emil Velikov wrote:
> > > On Tue, 4 Apr 2023 at 08:13, <yq882255@163.com> wrote:
> > > >
> > > > From: Qiang Yu <yuq825@gmail.com>
> > > >
> > > > Upstream has reverted the dependant commit
> > > > df622729ddbf ("drm/scheduler: track GPU active time per entity""),
> > > > but this patchset has been pushed to drm-misc-next which still
> > > > has that commit. To avoid other branch build fail after merge
> > > > drm-misc-next, just revert the lima patchset on drm-misc-next too.
> > > >
> > >
> > > The bug/revert is unfortunate, although we better keep the build clean
> > > or Linus will go bananas ^_^
> > >
> > > Fwiw for the series:
> > > Acked-by: Emil Velikov <emil.l.velikov@gmail.com>
> >
> > Can you (eitehr of you really) please push asap and make sure this doesn't
> > miss the last drm-misc-next pull (-rc6 is this w/e)? Otherwise we'll have
> > a bit a mess.
> > -Daniel
> >
> > >
> > > HTH
> > > -Emil
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
