Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A2443E9EE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 23:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBE16E82E;
	Thu, 28 Oct 2021 21:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F1C6E82E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 21:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635454807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YyHcHMPFK6L4kSqZBARMjYQnoudOF5bHyFz0FdV/YWw=;
 b=cnxaLvCoKdvq5ZHIsy67nbiPany4DKa43KWQWcSrgweQ+UbQx95CZ2XF+s7x02Oq5XZG9M
 /x2woNVytz8AmJsO+PnOwR+cd9onIxa85U6+Z1PqkIJMgsDKFMCVNoX7Eb+tgVXpk3bAKx
 SHLWV9b6MWk2sDywJ9eaXqu7zSedDdA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-sqGO1r6xPSe-E3Eyk_AFkg-1; Thu, 28 Oct 2021 17:00:06 -0400
X-MC-Unique: sqGO1r6xPSe-E3Eyk_AFkg-1
Received: by mail-qk1-f197.google.com with SMTP id
 q5-20020a05620a0d8500b0045edb4779dbso4807943qkl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 14:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=YyHcHMPFK6L4kSqZBARMjYQnoudOF5bHyFz0FdV/YWw=;
 b=o6higISivDlrlBkD9npLaMB6M016MGWQ0NuZ3zkD/KH6XsX4jVSIm5u4JV9eYSFoTG
 IjAP130bHBn8tc6AnZEUoFbzmfYzhhdCWLu+4pojrBt40ZrSwyVyudE7XOqlSvnlKw57
 PPmQ3smjOSY+MJ20C+V6/QaiLQpyOuOh7s8kWyiVlP3qEHYmWuEZysz8b/j1O/S1PTKv
 Lgtr/JooDv/uTGjfa191DfTpBPoPCUZyFEOnfpZFT8ir369UpLmYefhe401FkXWDnPOQ
 hiC/eaVUM3nR3zFqxGMU6nEnuWhA9EF6HeZ9G2Z2MlsnyqNp50uYYEWDA5XMRur8IZib
 qyhQ==
X-Gm-Message-State: AOAM531uY6iRqF4++NxTI6kCLjb/StrSCc/D+/mOMqoG3k30+Wfpiou+
 W/ZcgurE1UsK2mIaUm1XwIbuJp9FN4IK0JIxZqBITSVDZnCiU7eJkEssEBS//yWPn2v+JcT8syf
 pA4A8coK/tEcnbcOr2XCKIukroEqz
X-Received: by 2002:ac8:7193:: with SMTP id w19mr7354846qto.311.1635454806105; 
 Thu, 28 Oct 2021 14:00:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDlnXAfxMInUNg2FDZR0gL41Mf7pQpcS0zWxi7UlLCw9YzoEg6Gp1ylQDXamI3Dcj5CHkREg==
X-Received: by 2002:ac8:7193:: with SMTP id w19mr7354806qto.311.1635454805809; 
 Thu, 28 Oct 2021 14:00:05 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id w185sm2692822qkd.30.2021.10.28.14.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:00:05 -0700 (PDT)
Message-ID: <2f2145ed5e0a73a59a6996f2f709a3270b8d1449.camel@redhat.com>
Subject: Re: [PATCH v4 3/5] drm/dp: Disable unsupported features in
 DP_EDP_BACKLIGHT_MODE_SET_REGISTER
From: Lyude Paul <lyude@redhat.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, Satadru Pramanik
 <satadru@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,  Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>, open list
 <linux-kernel@vger.kernel.org>
Date: Thu, 28 Oct 2021 17:00:03 -0400
In-Reply-To: <CAD=FV=VXJA0DoCBOG+fzqv-5rYP4mWQE-HPxH9DxCVWgnuS4Dw@mail.gmail.com>
References: <20211026220848.439530-1-lyude@redhat.com>
 <20211026220848.439530-4-lyude@redhat.com>
 <CAD=FV=VXJA0DoCBOG+fzqv-5rYP4mWQE-HPxH9DxCVWgnuS4Dw@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 2021-10-28 at 11:27 -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 26, 2021 at 3:09 PM Lyude Paul <lyude@redhat.com> wrote:
> > 
> > As it turns out, apparently some machines will actually leave additional
> > backlight functionality like dynamic backlight control on before the OS
> > loads. Currently we don't take care to disable unsupported features when
> > writing back the backlight mode, which can lead to some rather strange
> > looking behavior when adjusting the backlight.
> > 
> > So, let's fix this by ensuring we only keep supported features enabled for
> > panel backlights - which should fix some of the issues we were seeing from
> > this on fi-bdw-samus.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Fixes: 867cf9cd73c3 ("drm/dp: Extract i915's eDP backlight code into DRM
> > helpers")
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index ada0a1ff262d..8f2032a955cf 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -3372,7 +3372,9 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux,
> > const struct drm_edp_backli
> >                 return ret < 0 ? ret : -EIO;
> >         }
> > 
> > -       new_dpcd_buf = dpcd_buf;
> > +       /* Disable any backlight functionality we don't support that might
> > be on */
> > +       new_dpcd_buf = dpcd_buf & (DP_EDP_BACKLIGHT_CONTROL_MODE_MASK |
> > +                                  DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE);
> 
> My first thought when reading the above was: if we're masking so much
> stuff out, why do we bother reading the old value back out at all?
> 
> I guess the two places you use the old value for are:
> 
> 1. You avoid setting the "DP_EDP_PWMGEN_BIT_COUNT" if the backlight
> was already configured for DPCD mode.
> 
> 2. You avoid writing the register if you didn't change it.
> 
> I would actually argue that use #1 is probably a bug. If you're
> worried about the firmware leaving the backlight configured in a
> strange way, it could very well have left the backlight configured in
> DPCD mode but set a different "bit count" than you want, right? Maybe
> you should just always set the bit count?
> 
> Use #2 is fine, but does it buy you anything? Are writes to the DCPD
> bus somehow more expensive than reads? ...or maybe you're expecting
> that a display will glitch / act badly if you write the same value
> that's already there?
> 
> 
> So I guess my instinct here is that you should avoid reading all
> together and just program the value you want.

Good point, will respin this in a little bit

> 
> -Doug
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

