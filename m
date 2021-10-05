Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F34231E4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AB76EC4A;
	Tue,  5 Oct 2021 20:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9CB6EC4C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633465591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSF6jCxZJ9Lo/pAWpdyqwfRutIttoAnBdF2YSZZDlW0=;
 b=cTAgbHmQr573ZEqQ9abysLcVDl0vtP7syR4NiFM0C2M4FPXPCtL2XMHdm6rrv9xlLwWxdu
 BIERNkh95UITUKpE7OkOpaSYgplPiQpKEP7niEXZr1y1KDLMMOBqlM/vOv25JFLKPc/3Uv
 /GOt87FywMXm+vITGauBGcvWSD+Q+d0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-5pIfrVgHN0m_n-nx4XvCzA-1; Tue, 05 Oct 2021 16:26:30 -0400
X-MC-Unique: 5pIfrVgHN0m_n-nx4XvCzA-1
Received: by mail-qt1-f198.google.com with SMTP id
 d19-20020ac85ad3000000b002a74d0626bcso292425qtd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 13:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ZSF6jCxZJ9Lo/pAWpdyqwfRutIttoAnBdF2YSZZDlW0=;
 b=30Uf5sZ2maIet7sgByv/sv+LFij+tcz4d4TroL/p3sDbjZQ5Kxx30cVxWMtNEFabxd
 6lUB5iVdvM80hu8gzejrW51TtC3VJjByemYmrZxOv70v4ZLZ859nc292RJqc5MYtaNyJ
 /ulORdNPsPOOsN1UK0PhPu/XoPG+UrOx2J9sZy8jpecPIVaHYdhGG/2RUEAdgkK3+g7+
 QGn9HlA4wb0vtINe8zm01Jd0mg4FSH/7po9yB4GLnUeT0zjFAaS2b/5piuutviIpfesc
 aLaqAWriKBsx239Bqulz6G0OiYEpemOJjwFMUja0L5JEp0ay1H/LzLv6vf8LRt1x+Obd
 jNNg==
X-Gm-Message-State: AOAM533OdwixaNFsxrY44dUIWCDXgcIaXa2Z9+MSYeslcz+VSLC9445b
 yhPL243DjqxFJ+C0E9tvqWWNitwQBWXegN5DpWbyhpcvWNNP11AbViFfFJJBPzxh/jB+lTjU/ze
 xhY57TRscI0xcbmZaEijVn7z99pDy
X-Received: by 2002:ac8:7594:: with SMTP id s20mr21704095qtq.158.1633465589736; 
 Tue, 05 Oct 2021 13:26:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFGL8CYgwl0+YAqpEiDKaGURHpezzUi3uShlPK4PU7tYdF8F4X2cRWBAsEQwveFxTDxgtvuA==
X-Received: by 2002:ac8:7594:: with SMTP id s20mr21704076qtq.158.1633465589546; 
 Tue, 05 Oct 2021 13:26:29 -0700 (PDT)
Received: from [192.168.8.206] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id a16sm10017550qkn.16.2021.10.05.13.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 13:26:29 -0700 (PDT)
Message-ID: <2b04c75841f4c1661c242a3371b12d52bb0573ef.camel@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v2 0/4] drm/dp, drm/i915: Finish basic PWM
 support for VESA backlight helpers
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Tue, 05 Oct 2021 16:26:28 -0400
In-Reply-To: <a6ea3fa3-fbbd-f5e8-54ab-3929ed9f7294@redhat.com>
References: <20211001225344.1752203-1-lyude@redhat.com>
 <a6ea3fa3-fbbd-f5e8-54ab-3929ed9f7294@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
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

On Sat, 2021-10-02 at 11:14 +0200, Hans de Goede wrote:
> Hi Lyude,
> 
> On 10/2/21 12:53 AM, Lyude Paul wrote:
> > When I originally moved all of the VESA backlight code in i915 into DRM
> > helpers, one of the things I didn't have the hardware or time for
> > testing was machines that used a combination of PWM and DPCD in order to
> > control their backlights. This has since then caused some breakages and
> > resulted in us disabling DPCD backlight support on such machines. This
> > works fine, unless you have a machine that actually needs this
> > functionality for backlight controls to work at all. Additionally, we
> > will need to support PWM for when we start adding support for VESA's
> > product (as in the product of multiplication) control mode for better
> > brightness ranges.
> > 
> > So - let's finally finish up implementing basic support for these types
> > of backlights to solve these problems in our DP helpers, along with
> > implementing support for this in i915. And since digging into this issue
> > solved the last questions we really had about probing backlights in i915
> > for the most part, let's update some of the comments around that as
> > well!
> 
> Backlight control is a topic which I'm reasonably familiar with,
> do you want me to review this series for you ?

Possibly, although I definitely want to make sure that someone from Intel gets
a chance to review this as well. I'm more curious if you might happen to have
any systems that would be able to test this.

> 
> Regards,
> 
> Hans
> 
> 
> 
> > 
> > Changes:
> > * Fixup docs
> > * Add patch to stop us from breaking nouveau
> > 
> > Lyude Paul (4):
> >   drm/i915: Add support for panels with VESA backlights with PWM
> >     enable/disable
> >   drm/nouveau/kms/nv50-: Explicitly check DPCD backlights for aux
> >     enable/brightness
> >   drm/dp, drm/i915: Add support for VESA backlights using PWM for
> >     brightness control
> >   drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs()
> > 
> >  drivers/gpu/drm/drm_dp_helper.c               | 75 +++++++++++------
> >  .../drm/i915/display/intel_dp_aux_backlight.c | 80 ++++++++++++++-----
> >  drivers/gpu/drm/nouveau/nouveau_backlight.c   |  5 +-
> >  include/drm/drm_dp_helper.h                   |  7 +-
> >  4 files changed, 122 insertions(+), 45 deletions(-)
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

