Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E2425079
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 11:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25726E839;
	Thu,  7 Oct 2021 09:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675796E839
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633600467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYsNDgqbiui3+erYBj+fHVdnDaf/K4T6XT06H3ORdUE=;
 b=c21Fqg5P84qOA8Rve4myvwPhcT3iDe9mPz2SzOU1nB6rrniKaIs+CRBSKymKzSw/iHTMbh
 FicubkpgtjjYdx/lW0tKS04l/O2VMlNEP2dianhj+++4TLzJdsA+si1bRO0Re/lY/VGp7N
 z2+EnlujWnfo7bMF+pT5COyY/dVsHjY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-isxkvvu5ND-Nc-uWE0KSUg-1; Thu, 07 Oct 2021 05:54:26 -0400
X-MC-Unique: isxkvvu5ND-Nc-uWE0KSUg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso5409707edi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 02:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BYsNDgqbiui3+erYBj+fHVdnDaf/K4T6XT06H3ORdUE=;
 b=5/3ehaoB1qEAEJAC97nhxxxVeeipD4DJDMjEi5ziJTpQSemsorPbkBTJhuV0zuXPEu
 jaekXqjgqFRMYSSwKv1hjUGfFSgvub98s0lwsje8pwdSjMu3WwGcGNzm9z7L+0qp7NHK
 Qpk5+JR4UHH5T+AFpBWJc3EKVRHj8R52zjMwWTkzGkV8V6/hdvbPFho/H0ijwx7HIxA6
 P7Bjf5yjfV77TKLU3SLiiScL6btFwVQI5i4MGW2D6W0XYHhTGxP7LMsapEApE8xV2s4c
 NnM+T4HpA9eCdr+jc7hWASjJCpbP19B69YREUPfClPvpWRK95MLjHEMF25dNW0qNnHkp
 BbxA==
X-Gm-Message-State: AOAM531U+wDyKPdeobeHxc67oWwIeReXUepJHUERZW1iy3+/tHh1V1tm
 nPEV8niWa85yvlBp/XF8/4yjyvn3wbtx/JrYlZpcnb/xM8BYQtETLqoWINNvRcb+v7IhrhauOKz
 i4AsfBJsJ0sT3EZpV2nZJJ/8AN30f
X-Received: by 2002:aa7:dcc2:: with SMTP id w2mr4980840edu.192.1633600464897; 
 Thu, 07 Oct 2021 02:54:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx69j3FYhBuJ3MGkPxeuYahwGxCaxZ17rHAl/NxcKCyeHdXtLpj9Qiuxhifurm9qqNJ4Ssq4Q==
X-Received: by 2002:aa7:dcc2:: with SMTP id w2mr4980819edu.192.1633600464701; 
 Thu, 07 Oct 2021 02:54:24 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id gl25sm588257ejb.81.2021.10.07.02.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 02:54:24 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH v2 0/4] drm/dp, drm/i915: Finish basic PWM
 support for VESA backlight helpers
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20211001225344.1752203-1-lyude@redhat.com>
 <a6ea3fa3-fbbd-f5e8-54ab-3929ed9f7294@redhat.com>
 <2b04c75841f4c1661c242a3371b12d52bb0573ef.camel@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6216276e-6998-cb40-3299-81ac03a1f3a9@redhat.com>
Date: Thu, 7 Oct 2021 11:54:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2b04c75841f4c1661c242a3371b12d52bb0573ef.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi,

On 10/5/21 10:26 PM, Lyude Paul wrote:
> On Sat, 2021-10-02 at 11:14 +0200, Hans de Goede wrote:
>> Hi Lyude,
>>
>> On 10/2/21 12:53 AM, Lyude Paul wrote:
>>> When I originally moved all of the VESA backlight code in i915 into DRM
>>> helpers, one of the things I didn't have the hardware or time for
>>> testing was machines that used a combination of PWM and DPCD in order to
>>> control their backlights. This has since then caused some breakages and
>>> resulted in us disabling DPCD backlight support on such machines. This
>>> works fine, unless you have a machine that actually needs this
>>> functionality for backlight controls to work at all. Additionally, we
>>> will need to support PWM for when we start adding support for VESA's
>>> product (as in the product of multiplication) control mode for better
>>> brightness ranges.
>>>
>>> So - let's finally finish up implementing basic support for these types
>>> of backlights to solve these problems in our DP helpers, along with
>>> implementing support for this in i915. And since digging into this issue
>>> solved the last questions we really had about probing backlights in i915
>>> for the most part, let's update some of the comments around that as
>>> well!
>>
>> Backlight control is a topic which I'm reasonably familiar with,
>> do you want me to review this series for you ?
> 
> Possibly, although I definitely want to make sure that someone from Intel gets
> a chance to review this as well.

I already expected you would also want someone from Intel to take a look
as well :)

So to figure out if I have system to test this I ended up taking a close
look at the code, which was a nice learning experience. Interesting how
some panels use a combination of DCPD + pwm/gpio for enable/disable and/or
pwm for brightness level control.

I wonder though what DCPD still does if pwm is used for both the
enable/disable and brightness-level control ?

Since I was taking a close look already I decided to do turn this into
a full, the entire set looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

> I'm more curious if you might happen to have
> any systems that would be able to test this.

I don't believe I have a system where I can test this, The only systems
which I have which presumably (I did not check) use eDP / DCPD backlight
control are boring ThinkPads with only i915 gfx.

Regards,

Hans



>>> Changes:
>>> * Fixup docs
>>> * Add patch to stop us from breaking nouveau
>>>
>>> Lyude Paul (4):
>>>   drm/i915: Add support for panels with VESA backlights with PWM
>>>     enable/disable
>>>   drm/nouveau/kms/nv50-: Explicitly check DPCD backlights for aux
>>>     enable/brightness
>>>   drm/dp, drm/i915: Add support for VESA backlights using PWM for
>>>     brightness control
>>>   drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs()
>>>
>>>  drivers/gpu/drm/drm_dp_helper.c               | 75 +++++++++++------
>>>  .../drm/i915/display/intel_dp_aux_backlight.c | 80 ++++++++++++++-----
>>>  drivers/gpu/drm/nouveau/nouveau_backlight.c   |  5 +-
>>>  include/drm/drm_dp_helper.h                   |  7 +-
>>>  4 files changed, 122 insertions(+), 45 deletions(-)
>>>
>>
> 

