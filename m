Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F30234215
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 11:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D846EA37;
	Fri, 31 Jul 2020 09:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B386EA37
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 09:11:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g10so6000354wmc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=WRZsaWH75/5Iq8OKoAx5+9VLutXrIla+ysrRSJUPm1c=;
 b=MYVt6NoXLAR/L4rGhf6N59GHtdGK562gzGbqOW+6Zk9s+6HX4VA6m9ky2k+QzarJXg
 GOWqBUN7qvt+vytb71ocRMPQekmwnMyaILt7cLPVlilyWjXets3ok0/N//6MV9eQ5ZGO
 aRM7ZBAWjzi8p/5xm8DgFPppdawqVV6WcGT7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=WRZsaWH75/5Iq8OKoAx5+9VLutXrIla+ysrRSJUPm1c=;
 b=k6vCtHxxHOsLBgMECm7HWXWmz1ugYCaiq76Hy9C3lr3rUrRZdQtV/lfk25cmhWxQdw
 XsVnvNF9fmHuj292+0ij+/jhWPEkwEzW9uRBT8sx+2uK/F2tfp9jyR0jjd7WFU+jxiND
 rF9zauIJJVMQuINL5AfvqrdJDIlxLSbYWa5Mw4J/GPkF7kBZD4PPFL9ReWKgJmv9GSLx
 8bnZy+eYhNJ6IIm4pS3b2z/QizZlR9ec2zcsBVHL73/ItNI079c4ieMEUyXCdEu9izNc
 V8gQTkB+WMdoS6VMLPMWng7eazbPUet581mzphPvOFi9BRk2TBS8VAs4lfYvt5AzRpCN
 ESHQ==
X-Gm-Message-State: AOAM530qAL+7xAhyaQQBhBUrYBVCxO7sYcSmNs18RfSEGF2MytLiWN1O
 6/FEzDpbBtFq+CSNMcIOP5jMiA==
X-Google-Smtp-Source: ABdhPJy1z6Gykg826DXlEWkylfgl6Y+BGbsxUdXutQ8kXUucm/vcH+x0BFlrhspIKsABOQVPUdN82w==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr3236516wmi.180.1596186704846; 
 Fri, 31 Jul 2020 02:11:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p6sm12191414wmg.0.2020.07.31.02.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 02:11:44 -0700 (PDT)
Date: Fri, 31 Jul 2020 11:11:42 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 0/2] Small cleanups to ingenic-drm driver
Message-ID: <20200731091142.GS6419@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@linux.ie>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200728151641.26124-1-paul@crapouillou.net>
 <20200728201736.GA1277651@ravnborg.org>
 <20200728220008.GI6419@phenom.ffwll.local>
 <PYF7EQ.CC652MXUV2R41@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PYF7EQ.CC652MXUV2R41@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 od@zcrc.me, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 02:28:01AM +0200, Paul Cercueil wrote:
> =

> =

> Le mer. 29 juil. 2020 =E0 0:00, daniel@ffwll.ch a =E9crit :
> > On Tue, Jul 28, 2020 at 10:17:36PM +0200, Sam Ravnborg wrote:
> > >  Hi Paul.
> > > =

> > >  On Tue, Jul 28, 2020 at 05:16:39PM +0200, Paul Cercueil wrote:
> > >  > Here are a few cleanups to the ingenic-drm driver.
> > >  > - some error paths were missing and have been added;
> > >  > - the mode validation has been moved to the .mode_valid helper
> > > callback.
> > >  >
> > >  > Cheers,
> > >  > -Paul
> > >  >
> > >  > Paul Cercueil (2):
> > >  >   drm/ingenic: Handle errors of drm_atomic_get_plane_state
> > >  >   drm/ingenic: Validate mode in a .mode_valid callback
> > > =

> > >  Both looks fine, you can add my:
> > >  Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > =

> > >  I assume you will apply the patches.
> > >  Maybe wait for Daniel to take a look, he had some feedback on where
> > >  to add checks. I assume this is covered by the second patch.
> > =

> > Yeah changelog for new versions would be great, but aside from that
> > bickering patch 2 lgtm now.
> =

> This patchset is V1, I'm fixing issues you saw in the ingenic-drm driver
> when reviewing a different patchset.

Oh right that was pre-existing issue in which callback to use, apologies
for the confusion.
-Daniel

> =

> Thanks for the review, I'll apply now.
> =

> -Paul
> > =

> =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
