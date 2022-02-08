Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F84AE32D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 23:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACBF10E523;
	Tue,  8 Feb 2022 22:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1473810E27B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 22:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644357749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v+/tNcBi1hqQ3zAZ+kreP8zrjRNSZd5An8aAqUlnWDs=;
 b=IgYTq4zSiYt9lO6prQQmO+Ammvc6Z4XYuY7kvg7lBxOSAOf3nJ5HfwGVUvg2beP+bxGjqs
 ojkbCe19Gg+GLh73YsByj3jhWAaQALN0NX3cnVR+sZadNJAGENZneOJ8WmBj0sjOGPxkH1
 vDE/ZA/yEUzI046Z0Y2NiwKEysvcF20=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-cefXVui8PxGZ_aCuus3vtg-1; Tue, 08 Feb 2022 17:02:22 -0500
X-MC-Unique: cefXVui8PxGZ_aCuus3vtg-1
Received: by mail-qk1-f197.google.com with SMTP id
 q5-20020a05620a0d8500b004738c1b48beso151215qkl.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 14:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=v+/tNcBi1hqQ3zAZ+kreP8zrjRNSZd5An8aAqUlnWDs=;
 b=0HHzkhRptlvRHfPtX7JhTBCvRve7lL+qVgaV1z2JxttB1OTkJ6oRNVy8TX5IQLLiz9
 W5wCqYwbvfIyPO49+dqg4vUff/RHxKQLA+ZX5+kxg0LRiaKDbyx8mv87PHfKxHNwllVy
 IXCkyDnfTxHRIQk/coeABdoxT5wiQAFevsmiafmJc0a0nhoJfiP4YYFQsNjdBAMHZDJq
 QbEYoD9wSKTpD9tDA2FFzTXDUM9bHBE241oJz0chaFKstaInO7tTT9YWyvvbXbg18J2h
 rqUlrlZXsB5rnCJN/KPH1U9DzK1EvzK0fHH9XrDQN6StbvFb/jGOxsSlkW5dEKTs1tgv
 eMUw==
X-Gm-Message-State: AOAM533mr2ZpcdlgPYdApQ4/8ADVMGFq+PyZTV8gNTkDYjZY8yjq5+k0
 7fZnzH5LG+f2cEQY0xktB5Dpqq2P3sCA2SFu5bOHRuW3IaOXe5QCjg0pcLHxSwXTTe9KSdqZ3If
 9H4VaWedeZVUOeQg5GwuzLinPC4EO
X-Received: by 2002:a05:6214:62b:: with SMTP id
 a11mr4576789qvx.99.1644357741253; 
 Tue, 08 Feb 2022 14:02:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzDmob0mRw3m+J1LeJvrujTFW2KQpp8qCWQ71N6Q6IhmpZwPecRLzOaHkQFsysr2sKjwHqKQ==
X-Received: by 2002:a05:6214:62b:: with SMTP id
 a11mr4576772qvx.99.1644357741022; 
 Tue, 08 Feb 2022 14:02:21 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id d6sm8080823qtb.55.2022.02.08.14.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 14:02:20 -0800 (PST)
Message-ID: <10bfefe40b9cb82610d4f1e8d3e7293824fac03b.camel@redhat.com>
Subject: Re: [PATCH] drm/i915/psr: Disable PSR2 selective fetch for all TGL
 steps
From: Lyude Paul <lyude@redhat.com>
To: "Souza, Jose" <jose.souza@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Date: Tue, 08 Feb 2022 17:02:18 -0500
In-Reply-To: <47eed687da699a6abbfd7726439fd307786c9d93.camel@intel.com>
References: <20220207213923.3605-1-lyude@redhat.com>
 <47eed687da699a6abbfd7726439fd307786c9d93.camel@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Mun, 
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "Kahola,
 Mika" <mika.kahola@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Opened the issue at https://gitlab.freedesktop.org/drm/intel/-/issues/5077 ,
included dmesg + video. Feel free to let me know if you need any more info, or
need me to try any patches

On Tue, 2022-02-08 at 13:06 +0000, Souza, Jose wrote:
> On Mon, 2022-02-07 at 16:38 -0500, Lyude Paul wrote:
> > As we've unfortunately started to come to expect from PSR on Intel
> > platforms, PSR2 selective fetch is not at all ready to be enabled on
> > Tigerlake as it results in severe flickering issues - at least on this
> > ThinkPad X1 Carbon 9th generation. The easiest way I've found of
> > reproducing these issues is to just move the cursor around the left border
> > of the screen (suspicious…).
> 
> Where is the bug for that? Where is the logs?
> We can't go from enabled to disabled without any debug and because of a
> single device.
> In the mean time you have the option to set the i915 parameter to disable
> it.
> 
> > 
> > So, fix people's displays again and turn PSR2 selective fetch off for all
> > steppings of Tigerlake. This can be re-enabled again if someone from Intel
> > finds the time to fix this functionality on OEM machines.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Fixes: 7f6002e58025 ("drm/i915/display: Enable PSR2 selective fetch by
> > default")
> > Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: José Roberto de Souza <jose.souza@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: <stable@vger.kernel.org> # v5.16+
> > ---
> >  drivers/gpu/drm/i915/display/intel_psr.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
> > b/drivers/gpu/drm/i915/display/intel_psr.c
> > index a1a663f362e7..25c16abcd9cd 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> > @@ -737,10 +737,14 @@ static bool intel_psr2_sel_fetch_config_valid(struct
> > intel_dp *intel_dp,
> >                 return false;
> >         }
> >  
> > -       /* Wa_14010254185 Wa_14010103792 */
> > -       if (IS_TGL_DISPLAY_STEP(dev_priv, STEP_A0, STEP_C0)) {
> > +       /*
> > +        * There's two things stopping this from being enabled on TGL:
> > +        * For steps A0-C0: workarounds Wa_14010254185 Wa_14010103792 are
> > missing
> > +        * For all steps: PSR2 selective fetch causes screen flickering
> > +        */
> > +       if (IS_TIGERLAKE(dev_priv)) {
> >                 drm_dbg_kms(&dev_priv->drm,
> > -                           "PSR2 sel fetch not enabled, missing the
> > implementation of WAs\n");
> > +                           "PSR2 sel fetch not enabled, currently broken
> > on TGL\n");
> >                 return false;
> >         }
> >  
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

