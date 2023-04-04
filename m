Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7DE6D6D1F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 21:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A8810E78A;
	Tue,  4 Apr 2023 19:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D198310E77F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 19:28:07 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r11so134997233edd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 12:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680636486; x=1683228486;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eCVmz0T8iHiHtH7a2wMYKMxDUPs6L8UFRcHeBvRmBAU=;
 b=W+yeEUVDtcLeK1sXdifY29Ljdfd3je0Eb7T4XfBZ+ltTmV+JKqnAYAsi3H0pOYhIl5
 jbc0tBu6ZFDMBXbGzHwFR5QCJYtTgpqblVF8invTekBzRx86hiOKlB0FZNOe5QoDEUSW
 pLaDnxpUbbj9Wuu9OOZgWUelYmi+VGQjlW7/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680636486; x=1683228486;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eCVmz0T8iHiHtH7a2wMYKMxDUPs6L8UFRcHeBvRmBAU=;
 b=roQaiC+SavBHdFd7coLgULtVLXDX4mK3d8fd6FSVN+vRveTH2i9cyxAlkA/audIxdx
 BzsRjR7xTGQ8BP4I1WU6Yii4ce+HboFd+Z+T6uQT+UMqYuYBP1ug12u4tXr5fhgNBQU3
 mYJPEWP1CSSCsDh4yENzvKZdgArf/SsZfbXi/wpeHdbm+Z4BfoDtsVWDDpmjopp+6aTd
 0hyGm5U8YOhiPAFWJHfoG/Qnvv4Uya6Fv3+NCwkuzUT/eV10/C8somDlNQyeqLYvQ9an
 dHOXTlRr1R8w0cutlG23co/ZQKE35xS75TrIs2wWK9OPfQDFkThHuJ8eEH/Oci78xcA3
 nggA==
X-Gm-Message-State: AAQBX9dkTM3JQZ94ZPy4OH9r5M/JFGzQ3K1Rlwr7/tMobVg6HcYRPJHn
 gCuYa150Qo/JEog9mDKb2B+nig==
X-Google-Smtp-Source: AKy350ZfSXIvET0COGP5gtjzSXywPfCpMp7M5ms3jss4Y0ez/AQVBbeHSNIrJP0+TaHdDf0Qe7/7Xw==
X-Received: by 2002:a05:6402:1e8e:b0:502:1f7b:f069 with SMTP id
 f14-20020a0564021e8e00b005021f7bf069mr598086edf.2.1680636485980; 
 Tue, 04 Apr 2023 12:28:05 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s10-20020a056402036a00b004e48f8df7e2sm6256896edw.72.2023.04.04.12.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 12:28:05 -0700 (PDT)
Date: Tue, 4 Apr 2023 21:28:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 0/3] Revert lima fdinfo patchset
Message-ID: <ZCx6Q5y1dgAv2q/o@phenom.ffwll.local>
Mail-Followup-To: Emil Velikov <emil.l.velikov@gmail.com>, yq882255@163.com,
 Stephen Rothwell <sfr@canb.auug.org.au>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
References: <20230404002601.24136-1-yq882255@163.com>
 <CACvgo53mV7Aoe+omtSF0BNg+gVOWqDQ_QAmMkhikjQw-vF55Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACvgo53mV7Aoe+omtSF0BNg+gVOWqDQ_QAmMkhikjQw-vF55Xw@mail.gmail.com>
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
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 04:17:33PM +0100, Emil Velikov wrote:
> On Tue, 4 Apr 2023 at 08:13, <yq882255@163.com> wrote:
> >
> > From: Qiang Yu <yuq825@gmail.com>
> >
> > Upstream has reverted the dependant commit
> > df622729ddbf ("drm/scheduler: track GPU active time per entity""),
> > but this patchset has been pushed to drm-misc-next which still
> > has that commit. To avoid other branch build fail after merge
> > drm-misc-next, just revert the lima patchset on drm-misc-next too.
> >
> 
> The bug/revert is unfortunate, although we better keep the build clean
> or Linus will go bananas ^_^
> 
> Fwiw for the series:
> Acked-by: Emil Velikov <emil.l.velikov@gmail.com>

Can you (eitehr of you really) please push asap and make sure this doesn't
miss the last drm-misc-next pull (-rc6 is this w/e)? Otherwise we'll have
a bit a mess.
-Daniel

> 
> HTH
> -Emil

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
