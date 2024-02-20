Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194DB85C484
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 20:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A0F10E52A;
	Tue, 20 Feb 2024 19:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RnZU0vXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55AA10E517
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 19:20:18 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso5546213276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 11:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708456818; x=1709061618; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tJPwApU9XXgv92RddfdwNnrkCzlQ97sHtpLb8FJGPyE=;
 b=RnZU0vXftExHUkI2Ki0lbc7FaXQzfD3feKMwS1DFMEHRKCrF2FcN5qVKUdIL/2thyJ
 6mVVv/ODxAITVXRKc5684hU4rNK2rcZiBU56RPgfPFIsw6CgpeGeNOe99NsfrT6Fww5H
 Ww3hVH0zG2z2WoljUU8UjC9h72QpiZ2teA6Jwfe/5jdwt1kadFXQABpigV8VleksqLGA
 FC5HlxvSkgST9cIOYY9grNn4dAHBnzffcLbKNP8lpH/XEp3iLfaMaLePwGpwYSTw7fKl
 DBsEXnvT1HfKt4p2mIEneciw2Pbn1zD7w1NNs2riycQ//3INoL/1N7R5jOR84xE8LYAN
 KWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708456818; x=1709061618;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJPwApU9XXgv92RddfdwNnrkCzlQ97sHtpLb8FJGPyE=;
 b=CU9U86iAuJuXjnnP3O0IGvkhUtSZSq2xHyx1eS7y4pdsZ59XDsGNI4fDCKERSi2Ldx
 nf/IMx+S/MDbgW5lbsoUW/qA6JJ9ZX+bKMc5XCWX/GcSjat+dj1374Q3HrihVEpYP8vv
 jjAF81ykVAtBhvY1SBPM4gdPIKOLkfoDKT//182FzUcOS0H6lHFnmrfGpTcW7MCkJs92
 7AFmGMGUW+WVtTHlfSSnfQatKp2tods2htZ12FBPSwK3+Ko3WNMpZ45Dy6AurPsEorCk
 2P8jDjb8sTaBsq03xUmVirqzTKqMQE4ftTAZH2OUVHufMQZIaBHHWGDWqnSz7pL2tDXX
 jhdA==
X-Gm-Message-State: AOJu0YwQyrRSHKv8dgUtBXO4eEDoQG8W7FmPPQvQfYCV5TSf0nLmi/9P
 kJwZkbc4Dlsv6behavReZigajlXX54MnLw55D0wsQ+BsZRmEhF8jUVyE2KValuQCKFGWuU/TMSs
 +/CY+1OTS7jbKJAHhl4pXuJ5QxX8cd7yJ2gmkkQ==
X-Google-Smtp-Source: AGHT+IEX8MB1nSQa5VpR8vJoxH2b5PfHyVyzVIBSZF2rtV4Pc7Ci0BkpAzatQu7sQcW34YdMBldvJ8Fd82tHXTI79J4=
X-Received: by 2002:a25:aacb:0:b0:dcc:9e88:b15 with SMTP id
 t69-20020a25aacb000000b00dcc9e880b15mr14917577ybi.41.1708456817505; Tue, 20
 Feb 2024 11:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20240215190834.3222812-1-quic_abhinavk@quicinc.com>
 <CAA8EJppQquHgSgCrxKZHPHk248Pxg7Q8mvmmjbcpUxpreQkcuA@mail.gmail.com>
 <d3674c10-5c29-d917-44f5-758d90d9e679@quicinc.com>
 <CAA8EJpqaG+fBA_FO-L7Bimtjqqg3ZDQtyJL0oPFEueb-1WxjUw@mail.gmail.com>
In-Reply-To: <CAA8EJpqaG+fBA_FO-L7Bimtjqqg3ZDQtyJL0oPFEueb-1WxjUw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 21:20:06 +0200
Message-ID: <CAA8EJpoeb63QRddxawm2J0s8O0XrLQBrDuYXOB=ZtzDG7mu2PQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, robdclark@gmail.com, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com, quic_jesszhan@quicinc.com, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Feb 2024 at 21:05, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 20 Feb 2024 at 20:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 2/20/2024 10:49 AM, Dmitry Baryshkov wrote:
> > > On Thu, 15 Feb 2024 at 21:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >>
> > >> intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
> > >> Lets move this to drm_dp_helper to achieve this.
> > >>
> > >> changes in v2:
> > >>          - rebased on top of drm-tip
> > >>
> > >> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > v1 had an explicit comment before the ack:
> > >
> >
> > Yes, I remember the comment. I did not make any changes to v2 other than
> > just rebasing it on drm-tip to get the ack from i915 folks.
> >
> > >>     From my side, with the promise of the size fixup.
> > >
> > > However I observe neither a second patch removing the size argument
> > > nor it being dropped as a part of this patch.
> > >
> >
> > Yes, now that in v2 we got the ack for this patch, I can spin a v3 with
> > the addition of the next patch to remove the size OR as another series
> > so as to not block the main series which needs this patch.
> >
> > I would prefer the latter.
>
> It doesn't work this way. The comment should have been fixed for v2.

This probably deserves some explanation. Currently there is only one
user of this function. So it is easy to fix it. Once there are several
users, you have to fix all of them at the same time, patching
different drm subtrees. That complicates the life of maintainers.

-- 
With best wishes
Dmitry
