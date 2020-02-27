Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9867D1727C0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409106E8C5;
	Thu, 27 Feb 2020 18:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137546E8C5;
 Thu, 27 Feb 2020 18:38:41 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t7so260707edr.4;
 Thu, 27 Feb 2020 10:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+Pu8YZT4WecVSREo/VFJSkPifBBBkzcaXDpj+HPmkyU=;
 b=hFULuJDQMIXYJvp+pi9tKg6lmcMRVl/G4c828g/jDHnGGrmgxDk6ojp7mr5eMv2xRO
 6kjAHVJ1dVS7MND7yDvtzxHGMvjonGL4cIzkpONdV/wZdmHBUpUjIHdwUqeB8fQiUCNG
 wU0fCuK/S7Hqz0cecg/bvsHP1my8IkyrPP1oyj3nSjML3MRayAz0iArbCJ5g0Sdfttzl
 6EnbWIs0+0YAT29guM4twTQ73VBUayqkEzef+YyXG6IdB0h/NC51Tx15cFHqcvvhr/RC
 ACYHVmjg3w84Y1x/GEQGo8CQSrQsEHsYSKsKHqt/T8FPLUciC4X3eDrneW93RBKSo60a
 dvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Pu8YZT4WecVSREo/VFJSkPifBBBkzcaXDpj+HPmkyU=;
 b=G/DtPR9voj5JMyRVLvgLjgmlTruOhkeyG3P6icCB4RGCDBrV1WD87nnw1sCItoc0DV
 Fg8hgVrrzL6w95q049GTncUSHLtbvORlR2D4xbQ/+eGcy2W20jPApYBdUVci80xHGH9X
 nW3cezQUNixVFrWePb80w0kOZZ6GcvT2b5m4o+WVzg7SLub6XfT7JRMr5pRlb27xg3ca
 2mLNCEhckfJ0roHfrhzlmpvC9xI9A61GkL7kHgRnmeL3HvRWpH+6zmNSd6DJmZiCzEDo
 Shje6bGIULiW29Q1M0v7W4BHfeGMbT1bkItlP9EvjhtyCPOqvyVZ9FPcEJqkQ1ZK5Qqm
 7Q7w==
X-Gm-Message-State: APjAAAU+aNYqb44yk5RbOkIKPz0rwRQ4QiAj5HkyOT7XxEwtDP8lK0cr
 CydqlpN4O8KrrRyL+myoLKY=
X-Google-Smtp-Source: APXvYqyDdoq3iSo+IzNbpfI/a4XgeNjcr4wtzQybEnC+XrHvfsb54aJdwBA9g8frn61J9u9VB+6Ivg==
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr403219ejg.161.1582828719623; 
 Thu, 27 Feb 2020 10:38:39 -0800 (PST)
Received: from smtp.gmail.com ([2001:818:e238:a000:51c6:2c09:a768:9c37])
 by smtp.gmail.com with ESMTPSA id d23sm315293ejt.53.2020.02.27.10.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:38:38 -0800 (PST)
Date: Thu, 27 Feb 2020 15:38:31 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH 0/2] drm/amd/display: dc_link: cleaning up some code
 style issues
Message-ID: <20200227183831.hchdotzbbaq5uyvd@smtp.gmail.com>
References: <cover.1582752490.git.melissa.srw@gmail.com>
 <20200227150518.tchch32d4lcjripr@outlook.office365.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227150518.tchch32d4lcjripr@outlook.office365.com>
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On 02/27, Rodrigo Siqueira wrote:
> Hi Melissa,
> 
> First of all, thank you very much for this patchset; in general,
> everything looks good to me.
> 
> I noticed that your patchset does not apply because you made your
> changes based on `drm-misc-next`; when you send patches to amdgpu, use
> the following repository:
> 
>  git://people.freedesktop.org/~agd5f/linux 
> 
> Could you prepare a V2?
Yes.

Thanks for reviewing my patches.
Soon, I will send a V2 with the changes suggested by you. 
> 
> Thanks!
> 
> On 02/26, Melissa Wen wrote:
> > This patchset solves some coding style issues on dc_link for readability
> > and cleaning up warnings. Change suggested by checkpatch.pl. 
> > 
> > Melissa Wen (2):
> >   drm/amd/display: dc_link: code clean up on enable_link_dp function
> >   drm/amd/display: dc_link: code clean up on detect_dp function
> > 
> >  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 67 +++++++++----------
> >  1 file changed, 32 insertions(+), 35 deletions(-)
> > 
> > -- 
> > 2.25.0
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7CRodrigo.Siqueira%40amd.com%7C7a3e02e3f43447ed4fab08d7bb080d9b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637183515885211986&amp;sdata=bnipkrUtKdO1oOKxdt1th4iIG1%2BBgl2wMPVrdmn3P1U%3D&amp;reserved=0
> 
> -- 
> Rodrigo Siqueira
> https://siqueira.tech

Melissa Wen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
