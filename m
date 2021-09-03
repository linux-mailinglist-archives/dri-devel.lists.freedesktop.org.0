Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C08E4004FA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72266E8C5;
	Fri,  3 Sep 2021 18:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DDC6E8C5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630694421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWtF9jf2Zkp/EIHUVbxUvuUljulDqbFLTLzbdRX5bvg=;
 b=I8B31O8eeLnxKdukWOFfP+Zv0qyRjBODHk4R5Ia1y88Yazh2xMdANy2eHGmX78OeR7K7Q5
 d8tE0kB9LH8oWfgdFQdc2rLqvOCWBA79K7GxLKMJMBtzS/a/RCSss+1DeWQTCVXhM54IMX
 Dmq/3fR8Le4wzCFpXDfAQRfEM1Oweno=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-9NynWSgrOEiDvKkA4q8EAQ-1; Fri, 03 Sep 2021 14:40:20 -0400
X-MC-Unique: 9NynWSgrOEiDvKkA4q8EAQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 f34-20020a05622a1a2200b0029c338949c1so2411qtb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=aWtF9jf2Zkp/EIHUVbxUvuUljulDqbFLTLzbdRX5bvg=;
 b=n6IjXmjzHuQICGgn9xtC87DAAA1glVorFFdON6pKSglGmTTqwZ9iFN6dk4qE596imZ
 U2BCKNY/ftquh+AIiDizDusdKTTBlY+dupEPk8k9mQ+EEJyJDkHBZ0+kUDN9RpUL+oKe
 cEMKXG70j850ex6reESsOMND56A/AuMAOt2mNCLLf78oq//jGlbioodF+58ObxpUkcNe
 trs0ybVDBDtMxyRAVPREjc20qJUEGXu8PGLQeRzN9m4zvB0Un90fGa0i+PlQaZQbec8a
 bg7f3oeG74nfzmewNJRs7/JiVmoFnQtdL97sziBq1CcNqmpjxpCPfRhmXOmpvmC4wAid
 y99A==
X-Gm-Message-State: AOAM531EA+uvYYX4TgT4E+/BnSOYZXXUEK92bf6wK7cpFzhjnGFMdsKW
 emGlgoAkkqWxOpDg0oQTOUM8U/1YlDMPNcyW/ttUJUBuhFk49kgo2Lb3eWODZ2DQWOiTIDwEKmy
 oUiwQN+//TfpknUz3r1K6zVHuE4ky
X-Received: by 2002:a05:620a:2e4:: with SMTP id
 a4mr241543qko.288.1630694419555; 
 Fri, 03 Sep 2021 11:40:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqVC1TcFhJm7LcUohfzVUt093xlPQkNtnzfm7+W7zSXklTGCQY6X98oT4Qb3UWtx1UAb1ngA==
X-Received: by 2002:a05:620a:2e4:: with SMTP id
 a4mr241518qko.288.1630694419233; 
 Fri, 03 Sep 2021 11:40:19 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id a189sm4443447qkf.114.2021.09.03.11.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:40:18 -0700 (PDT)
Message-ID: <ca29cfea709f54f74899900068bddcd838d5ab2c.camel@redhat.com>
Subject: Re: [PATCH] drm/msm: remove unneeded variable
From: Lyude Paul <lyude@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, cgel.zte@gmail.com, 
 robdclark@gmail.com
Cc: sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com, 
 laurent.pinchart@ideasonboard.com, chi.minghao@zte.com.cn,
 treding@nvidia.com,  linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Date: Fri, 03 Sep 2021 14:40:17 -0400
In-Reply-To: <52a6c92d-fe59-cdb8-23de-6fcda6ca2c68@linaro.org>
References: <20210831115127.18236-1-chi.minghao@zte.com.cn>
 <2d6784e3327cab7bfdc88ca1ef7c9c4c9cca113a.camel@redhat.com>
 <52a6c92d-fe59-cdb8-23de-6fcda6ca2c68@linaro.org>
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

On Fri, 2021-09-03 at 21:31 +0300, Dmitry Baryshkov wrote:
> On 02/09/2021 21:40, Lyude Paul wrote:
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > Do you need me to push this?
> 
> We'd pick this up through the msm tree.

ah-totally forgot msm had their own tree and didn't go through drm-misc-next.
Thanks!

> 
> > 
> > On Tue, 2021-08-31 at 04:51 -0700, cgel.zte@gmail.com wrote:
> > > From: Chi Minghao <chi.minghao@zte.com.cn>
> > > 
> > > Fix the following coccicheck REVIEW:
> > > ./drivers/gpu/drm/msm/edp/edp_ctrl.c:1245:5-8 Unneeded variable
> > > 
> > > Reported-by: Zeal Robot <zealci@zte.com.cn>
> > > Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>
> > > ---
> > >   drivers/gpu/drm/msm/edp/edp_ctrl.c | 4 +---
> > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> > > b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> > > index 4fb397ee7c84..3610e26e62fa 100644
> > > --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> > > @@ -1242,8 +1242,6 @@ bool msm_edp_ctrl_panel_connected(struct edp_ctrl
> > > *ctrl)
> > >   int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
> > >                  struct drm_connector *connector, struct edid **edid)
> > >   {
> > > -       int ret = 0;
> > > -
> > >          mutex_lock(&ctrl->dev_mutex);
> > >   
> > >          if (ctrl->edid) {
> > > @@ -1278,7 +1276,7 @@ int msm_edp_ctrl_get_panel_info(struct edp_ctrl
> > > *ctrl,
> > >          }
> > >   unlock_ret:
> > >          mutex_unlock(&ctrl->dev_mutex);
> > > -       return ret;
> > > +       return 0;
> > >   }
> > >   
> > >   int msm_edp_ctrl_timing_cfg(struct edp_ctrl *ctrl,
> > 
> 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

