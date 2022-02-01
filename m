Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3F64A617E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 17:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7C10E206;
	Tue,  1 Feb 2022 16:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E92410E206
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 16:42:13 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id r14so14915111qtt.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 08:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=otyEMvVogZiC/qLnQYtuKjXRtrkndEx9vzMbrLjZjDE=;
 b=dj13jx2a1MprLlYA1kB5O4aC7dmPTtNC2m9oAj0hEzL5g88I3AgHJKZvwGSvQ9UlPq
 mVttKA/nLeBtVoFjgpVG+TOJ/et/3WIez8o/W1sYKBuWfUbAMWgHnQmN0ZsVlASNY60O
 qvTpr126c84fdzOSOJUgfbEp8s1K7AAbqrdKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=otyEMvVogZiC/qLnQYtuKjXRtrkndEx9vzMbrLjZjDE=;
 b=CmaPGmMpMr3SUidT8/aM2EwMyZ55+JpmjXcIinAwKtcx+AD4DlKh+Izjnvh8ot8Lxh
 R3Hv/oqdfKwMm07w9nMEDv+GJhaIej1NGcsp933rxRheByzEs9+lL/jl5GtM6TWjmuIS
 oQtS1/fk3Iqj+AQ+Dw6JdJqApVEGhFiuXJW26aVFG98+ceQry2x4gpyu98tBkmD1Iqgm
 6FpQGvflCGzaSGeHSeiGZltEABM7e4binXyIgMi6cZQKyEhX3lKu+OegBuC9UnMU71X/
 aMjb+pjOMENP/7vkx+1pcLTfp6PhpdNoBDboHWNrllcDHFBd54mivOXR9Oikk2mpburE
 meew==
X-Gm-Message-State: AOAM531TlcW70enI532I83vTFbydKVnLLVI9bLWdxnuloMq0zYC3ayEf
 B+qEPHQl14+iMMiNRogrkr+vnS/HHaoqUA==
X-Google-Smtp-Source: ABdhPJzZx5kiyHIoh4cE8IKCPHwBMKjeXoXcS/9U2sSq05fBtIYqqAKB20Jt3Hl2ptDqHXYNDQ8S0g==
X-Received: by 2002:ac8:4718:: with SMTP id f24mr19534954qtp.364.1643733732118; 
 Tue, 01 Feb 2022 08:42:12 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id 5sm4355796qtp.81.2022.02.01.08.42.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 08:42:11 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id c6so52745849ybk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 08:42:10 -0800 (PST)
X-Received: by 2002:a25:c58f:: with SMTP id
 v137mr37662763ybe.609.1643733730084; 
 Tue, 01 Feb 2022 08:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20220125135406.1.I62322abf81dbc1a1b72392a093be0c767da9bf51@changeid>
 <e89dbc7b-b3ae-c334-b704-f5633725c29f@redhat.com>
 <CAD=FV=U8VGnRXv8MgofKzZF22_x0_X3M+AMfyPQ1u=yTXnFBQA@mail.gmail.com>
 <6fdcfbcf-0546-6b4f-b50f-cf2382ad746f@redhat.com>
In-Reply-To: <6fdcfbcf-0546-6b4f-b50f-cf2382ad746f@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Feb 2022 08:41:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U3YHt=+cr8c39zMxFWMeo4Pr=R3BBPMKanpySPhsYh9w@mail.gmail.com>
Message-ID: <CAD=FV=U3YHt=+cr8c39zMxFWMeo4Pr=R3BBPMKanpySPhsYh9w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Allow querying the detected panel via sysfs
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, jjsu@chromium.org,
 lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 26, 2022 at 12:25 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> On 1/26/22 00:25, Doug Anderson wrote:
> > On Tue, Jan 25, 2022 at 2:55 PM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
>
> [snip]
>
> >> Should this new sysfs entry be documented in Documentation/ABI/ ?
> >
> > I'm not sure what the policy is here. I actually don't know that I'm
> > too worried about this being an ABI. For the purposes of our tests
> > then if something about this file changed (path changed or something
> > like that) it wouldn't be a huge deal. Presumably the test itself
> > would just "fail" in this case and that would clue us in that the ABI
> > changed and we could adapt to whatever new way was needed to discover
> > this.
> >
> > That being said, if the policy is that everything in sysfs is supposed
> > to be ABI then I can add documentation for this...
> >
>
> I also don't know the policy, hence the question. But in any case, I
> think that it could even be done as a follow-up if is needed.

Sounds good. Since it's been pretty silent and I had your review I
pushed this to drm-misc-next. If there are comments or someone has an
opinion documenting this as a stable ABI then please yell.

363c4c3811db drm/panel-edp: Allow querying the detected panel via sysfs
