Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E82544AE05D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 19:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4B310E4B1;
	Tue,  8 Feb 2022 18:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F9D10E971
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644343754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/59mzxAxGpcuRuvJCsAZqxLYdHzeJaGwUP97h2Fvxg=;
 b=G+vBbN1Ad5W7S2gaofDNJZGFiX1+NbQkgaNjrjUmhWt7a9GnwPw8QXfgWPdD976fDMc/jv
 yOpTKdraI79lQE6Kp8CfB3OsFtvd6vZayR0fIIZZEGEhysYqsxvTGW2+N14VswbhI+2mdE
 ry+Ok+jOey+VWiJUl/+imYBorEbARz4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-X9s1yp9BO5GWT8Bu0J0ZFw-1; Tue, 08 Feb 2022 13:09:13 -0500
X-MC-Unique: X9s1yp9BO5GWT8Bu0J0ZFw-1
Received: by mail-qv1-f70.google.com with SMTP id
 du13-20020a05621409ad00b0042c2949e2c1so724883qvb.19
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 10:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=D/59mzxAxGpcuRuvJCsAZqxLYdHzeJaGwUP97h2Fvxg=;
 b=Ncxa2P437wK4BoN1ZPDKv4nYCtlb/qBWVJdXFvCVoivDPLPFsu1PcKokExad+t5aAq
 /4dqAaPjtDSxJnmfDyNzSZWqSMY7Gpxn4NW3WhnDhTiZ3y9lu5nn3eslSqpkZCt6ej0s
 /DWYje/B9R8/zK/Wcy55fhKDhcQ2Ncul3SWS4R7n16QFIWo3xAWr6kS2d9qcC3GH5IiL
 5TB7lUE9a4AbinXsFm136ttfl+9pUJCAoMa08VptVZaiUh4GEpmKGqT9SFdRmLbJzmiT
 fpFaLgCyc/49lfR7fMcEe43cUzGJTGXrKMj3lPabeu+Sd+jSz/XFtGCMPzl0PTbzh2RR
 T+sw==
X-Gm-Message-State: AOAM5328frAqzuIl3rI2DNo0hRXZAlFy+IGoh9FuYC/QPZtsfJ3tR5PW
 Ly5zrGjegWl/buRBvzkUnw9KTNScmBTjnwsp6DPpd9D3N/WTmV4HsOJNy0vrQ1tFMuwEbZ4zMZc
 hpIkiaVZ/ZII8+yl8OC89ny1QGHfp
X-Received: by 2002:a05:6214:2aad:: with SMTP id
 js13mr4206756qvb.32.1644343753180; 
 Tue, 08 Feb 2022 10:09:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6hYcmhpCrfUjUFKNHPDOzALofgJurmeN1dJb255nAGw0T7FIS2Qoz5AwnzSFbBkPqC8/MWw==
X-Received: by 2002:a05:6214:2aad:: with SMTP id
 js13mr4206733qvb.32.1644343752985; 
 Tue, 08 Feb 2022 10:09:12 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id s2sm7006656qks.60.2022.02.08.10.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 10:09:12 -0800 (PST)
Message-ID: <eaaeecd5c0c80c8bf2ac81c48f603920b0c12248.camel@redhat.com>
Subject: Re: [PATCH] drm/i915/psr: Disable PSR2 selective fetch for all TGL
 steps
From: Lyude Paul <lyude@redhat.com>
To: "Souza, Jose" <jose.souza@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Date: Tue, 08 Feb 2022 13:09:10 -0500
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

I'm happy to open up a bug and include some logs, will do it in just a moment

> We can't go from enabled to disabled without any debug and because of a
> single device.
> In the mean time you have the option to set the i915 parameter to disable
> it.

I mean - I totally understand the hesistance with the lack of debug info, I'll
go open up an issue with said info in a bit. FWIW is a machine currently being
sold with Linux pre-installs which is expected to work out of the box, so it's
not exactly an uncommon laptop to be running Linux. Also I don't have any
problem with us trying to fix the issue before flat out disabling things - I
sent the revert hoping that would happen, and also because I needed to write
the revert anyway since I had to disable this in Fedora's kernel.

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

