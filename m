Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67C53FF357
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 20:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7614A6E09F;
	Thu,  2 Sep 2021 18:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0820A6E09F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 18:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630608065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bj1YZCOICCuWhBGeiWp2KDW8cxmxWvm+507OpITl/f8=;
 b=DQH/HJfwQtcnYPdFrBhl0Z2Ygp/76yFhtTdaTrsWViUvLiHYFedQZ0rc5RjOLeya9ElWNZ
 R4bA9k0j+4OAxsBNvyKI/CUGrp5zCynved3glRvEveE1IQFUbIp5V77iE1HXukY3qheQGf
 GzZigtCQHbTcxJ89F1PpCCvPBkWr3PY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-LbyNV0JGPxuhVYS9zFweCA-1; Thu, 02 Sep 2021 14:41:02 -0400
X-MC-Unique: LbyNV0JGPxuhVYS9zFweCA-1
Received: by mail-qv1-f72.google.com with SMTP id
 dv7-20020ad44ee7000000b0036fa79fd337so3215705qvb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 11:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Bj1YZCOICCuWhBGeiWp2KDW8cxmxWvm+507OpITl/f8=;
 b=Gd1Xlvn/AgizmdBTNwCy1wVBya8EiO1UbxjP7TIh46Hqn2Bi+a01bQnHbho0YUj9Zk
 A9Oekzx3Uxj9uKAhVdm0Fh5eL5yegQxtDZGGuxIAek7LAysaooLT8RtGIbTx4D0M0TUW
 u+4jOWT8XpC/JeGorNHvX5eOKHa5NaLjHZHMB+/d+j3lDEcbCFJl+rWap8B/DYO3zjbl
 6C7Ng3fsLXdJTowbA2Vb7oT0C5JgsLU9dlgE7XmpjCBslh4X2FrLXBcNi5r27pDllFFb
 rhwecewPpzmfMGhLvXzwyDz9kmKEd2bYVKA4J/ziXyhgwRbmWd2r25m10h4cE9GAoOC1
 gEnw==
X-Gm-Message-State: AOAM530sweraY0JShIvdOavDv1tgFqHXwi8lb8H7tppMklIBsqYbkNdl
 xu5iqp/TA2ax+TDtJzSoFBSDzlz730ZLaiJtdPAvdVfFt++9s+6PKXv4gj/47phtbUi5Mcxcgv0
 EmsYj10eCPmuLS34N53z1tU8tH3C9
X-Received: by 2002:ac8:7ef6:: with SMTP id r22mr4422765qtc.158.1630608061706; 
 Thu, 02 Sep 2021 11:41:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzER9U7aKRPWcbQbf6Y4ZH5pTc8T3UJYAdtuN5uesnicOA+1yjnC5jy8JOV95bM70GmgFDNcw==
X-Received: by 2002:ac8:7ef6:: with SMTP id r22mr4422741qtc.158.1630608061430; 
 Thu, 02 Sep 2021 11:41:01 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id p22sm1995353qkj.16.2021.09.02.11.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 11:41:00 -0700 (PDT)
Message-ID: <2d6784e3327cab7bfdc88ca1ef7c9c4c9cca113a.camel@redhat.com>
Subject: Re: [PATCH] drm/msm: remove unneeded variable
From: Lyude Paul <lyude@redhat.com>
To: cgel.zte@gmail.com, robdclark@gmail.com
Cc: sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com, 
 laurent.pinchart@ideasonboard.com, chi.minghao@zte.com.cn,
 treding@nvidia.com,  linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Date: Thu, 02 Sep 2021 14:40:59 -0400
In-Reply-To: <20210831115127.18236-1-chi.minghao@zte.com.cn>
References: <20210831115127.18236-1-chi.minghao@zte.com.cn>
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

Do you need me to push this?

On Tue, 2021-08-31 at 04:51 -0700, cgel.zte@gmail.com wrote:
> From: Chi Minghao <chi.minghao@zte.com.cn>
> 
> Fix the following coccicheck REVIEW:
> ./drivers/gpu/drm/msm/edp/edp_ctrl.c:1245:5-8 Unneeded variable
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>
> ---
>  drivers/gpu/drm/msm/edp/edp_ctrl.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index 4fb397ee7c84..3610e26e62fa 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -1242,8 +1242,6 @@ bool msm_edp_ctrl_panel_connected(struct edp_ctrl
> *ctrl)
>  int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>                 struct drm_connector *connector, struct edid **edid)
>  {
> -       int ret = 0;
> -
>         mutex_lock(&ctrl->dev_mutex);
>  
>         if (ctrl->edid) {
> @@ -1278,7 +1276,7 @@ int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>         }
>  unlock_ret:
>         mutex_unlock(&ctrl->dev_mutex);
> -       return ret;
> +       return 0;
>  }
>  
>  int msm_edp_ctrl_timing_cfg(struct edp_ctrl *ctrl,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

