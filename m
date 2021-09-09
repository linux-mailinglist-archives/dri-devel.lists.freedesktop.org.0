Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65059405AA4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B9A6E8AF;
	Thu,  9 Sep 2021 16:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8746E8AF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631204310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewBHaw6CXr7fu1kkTtufkK6zzYGeCnEb1o6teII30n0=;
 b=jFYvwijWqO0sq1P/nR5XPupRpeQorjWCpd/ryHFa4CrojSV+7sNX7IMx347SW1oc3WSkNw
 E8zvXzgn7guOcLA/7ZdV3AZbqP2O1y+tz/RgVdXG8D+oUcgC64Rn/J1gysazOJjCc+djLg
 YfZ5i8vseL07B7Om+EI0xuCZI5pH470=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-Tv5RKjzgNQSBCMbGVIJEQQ-1; Thu, 09 Sep 2021 12:18:29 -0400
X-MC-Unique: Tv5RKjzgNQSBCMbGVIJEQQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 x19-20020a05620a099300b003f64d79cbbaso5159962qkx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 09:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ewBHaw6CXr7fu1kkTtufkK6zzYGeCnEb1o6teII30n0=;
 b=gY0uWxwNpq9qrwCoD0E767YeavtPEWER4vg89xmdFefnhDmRpmXv0U12PHP9wWFFKd
 b8m8k8urRrBh2/cGlfZcLT0kPLNbrvSUZb+fsozqShRRusnmCEXB709RJRd43GHsd8oV
 ioodKmm9l2QDCq+2PzSE4j7y3oUZpbgJLh9PPJWba1CIe2RmSec7f8oMcXsWc500nZX0
 0xMtalzEpjYINKMuYwP8Tx7dFEt8Zzm9HEKbKjGdYukqxI9f6LEyDtC3nMonRuMhK+Vy
 bLOQTPqqZ7j5+5znO21Lu/RMC51VSP7g/khWf5NkF2XpS8iGdD0OGKkYL2hPYCR/PAtd
 3bwA==
X-Gm-Message-State: AOAM530n0uT7vU4TFQ2Qxo2tb9Lm9wgIO48t6zOCv/OWRX171IbGEg4P
 URk0+RTEMQMiIWyNWo4U3MblOFJ50MjwSATPNL+5ql4xGrUyypig7d8RSOrML7XGyBCLl2l78Zy
 dAyor7yfBIOMThAyTm/pittjjobec
X-Received: by 2002:a05:6214:130a:: with SMTP id
 a10mr3869429qvv.53.1631204309057; 
 Thu, 09 Sep 2021 09:18:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfrNSaQBwEqiRj+mMqs77Y036x02BGZlpVc98v6yXwCA+EFrazr+WrnxmecQoDDyTFLf7vxw==
X-Received: by 2002:a05:6214:130a:: with SMTP id
 a10mr3869412qvv.53.1631204308888; 
 Thu, 09 Sep 2021 09:18:28 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id a9sm1647417qko.27.2021.09.09.09.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 09:18:28 -0700 (PDT)
Message-ID: <b13705a75f7820772984b2f368664c7234dcb6ff.camel@redhat.com>
Subject: Re: [PATCH v3 02/13] drm/dp: use more of the extended receiver cap
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com, 
 manasi.d.navare@intel.com
Date: Thu, 09 Sep 2021 12:18:27 -0400
In-Reply-To: <282213f032b3dfe10cf7c461083c26b474f09f0f.camel@redhat.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
 <649051cb896821147feee91aab1f2abc523c1353.1631191763.git.jani.nikula@intel.com>
 <282213f032b3dfe10cf7c461083c26b474f09f0f.camel@redhat.com>
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

…whoops, that was supposed to be:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2021-09-09 at 12:18 -0400, Lyude Paul wrote:
> I thought I remembered an issue with this but looked up the previous emails,
> and it looks like that this change actually should be safe!
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> On Thu, 2021-09-09 at 15:51 +0300, Jani Nikula wrote:
> > Extend the use of extended receiver cap at 0x2200 to cover
> > MAIN_LINK_CHANNEL_CODING_CAP in 0x2206, in case an implementation hides
> > the DP 2.0 128b/132b channel encoding cap.
> > 
> > v2: Extend to DP_RECEIVER_CAP_SIZE (Ville)
> > 
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index 9b2a2961fca8..2e74b02ed96b 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -608,7 +608,7 @@ static u8 drm_dp_downstream_port_count(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE])
> >  static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
> >                                           u8 dpcd[DP_RECEIVER_CAP_SIZE])
> >  {
> > -       u8 dpcd_ext[6];
> > +       u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
> >         int ret;
> >  
> >         /*
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

