Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9084037AC06
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 18:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95576E1EE;
	Tue, 11 May 2021 16:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC7F6E1EE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 16:34:51 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 h9-20020a4a94090000b02901f9d4f64172so4324515ooi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 09:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jtRsLR7tw7/ws6UHbTbAGxhYbBVVPFNMe8r9CvkiMc0=;
 b=nuaEaWAoXueXoY/9qSf6sZqWHJXaeAYBy6geLvW4dsHjpoYaG8QXoKFX0e4D0XCUqI
 6xn+RW13swL6jSnq3hOuAdmBELDtTrTQGSStd4bRc8PGu2WSX4UKbARDR/xfBkZwpS9D
 hSLDooni+LjoGLjSZX3MCCpXpfH/pyX5FE/d/AaVzuLpWrLvOrzTUfnlCpSAlmRroa+Y
 oPAY/rrvGNMLdYf4gmgKizpK3NA1n5ZkvJP5fBeugPo3SQAUEySM6HhQqfiEH6mVvL/r
 nzFllOLwJAf1s7dQXAiPpCiTuAZwznyrRG8EnRz25PegLBOYPCfn0cUzHBacwD2jKink
 OCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jtRsLR7tw7/ws6UHbTbAGxhYbBVVPFNMe8r9CvkiMc0=;
 b=NAcL1RqMsjUMIT3SYyfcnrE+HDV/2vcVbpgpD6l55owGDdpqiAG6iOZOwSp8+1mBQ7
 1iMoj3JMciikBOI5DyLSvo8wI51I+/1K4GomI72s0wY9fzophSOBRJK7SFpFhJPgFFKB
 PSDMtHB9Tw2W8pcoOp8LzwIjmRsiFFOkEG6/kn7AUpliKcS9hBlSVuXRSccf+uDi74Pu
 eSh8cuuhBbr4/2SPntvROM+Ehnj3mZ8hWy4yobSB5qls/ADoinHMsooa2sjRTdHiULXX
 C5abPu/zfjW3e40jzKOoARvtaGFmbzpOtqWdBjFhDDm5QIb/tpwOTY7l4FrKJDe/mdQE
 /azg==
X-Gm-Message-State: AOAM532s5v1gjBAUeBkrOx7XNcptK/krAppTejq6Plb4pR+8wuIsRYNH
 j6EHFzJqzgPczhd9FcPLSwgjR8OlNwT6A8rq4rWlupZE
X-Google-Smtp-Source: ABdhPJy/TooDudc1x0tUUgGg7n3GuOdw0E07h/+JgNNDyTCdr5Gf+xa4k8kzfufi5jIdVEyZjDowBRvtg3AyzwAsV+8=
X-Received: by 2002:a4a:d085:: with SMTP id i5mr24141937oor.61.1620750891309; 
 Tue, 11 May 2021 09:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210511155512.582798-1-maxime@cerno.tech>
In-Reply-To: <20210511155512.582798-1-maxime@cerno.tech>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 May 2021 12:34:40 -0400
Message-ID: <CADnq5_NG8dwfk9uu83_CM7430Pj1CTK1=UTuQR7U7nnmcdPu2g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpu: Mention the requirements for new
 properties
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 11:55 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> New KMS properties come with a bunch of requirements to avoid each
> driver from running their own, inconsistent, set of properties,
> eventually leading to issues like property conflicts, inconsistencies
> between drivers and semantics, etc.
>
> Let's document what we expect.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/gpu/drm-kms.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 87e5023e3f55..30f4c376f419 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -463,6 +463,24 @@ KMS Properties
>  This section of the documentation is primarily aimed at user-space developers.
>  For the driver APIs, see the other sections.
>
> +Requirements
> +------------
> +
> +KMS drivers might need to add extra properties to support new features.
> +Each new property introduced in a driver need to meet a few
> +requirements, in addition to the one mentioned above.:
> +
> +- It must be standardized, with some documentation to describe the

"to describe how the"

With that fixed, it looks good to me.

Alex

> +  property can be used.
> +
> +- It must provide a generic helper in the core code to register that
> +  property on the object it attaches to.
> +
> +- Its content must be decoded by the core and provided in the object
> +  associated state structure.
> +
> +- An IGT test must be submitted.
> +
>  Property Types and Blob Property Support
>  ----------------------------------------
>
> --
> 2.31.1
>
