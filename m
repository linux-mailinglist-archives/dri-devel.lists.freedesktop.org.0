Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D03525AFCF9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 09:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EBA10E39C;
	Wed,  7 Sep 2022 06:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0D310E38F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 06:59:51 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id u6so18209718eda.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 23:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=qvR1N7BkwDYnsAvrsfaIO11nwQpKCU3X2O+a+Y27DUY=;
 b=JboZiw5UMpW3fLQ7FupCjwd6aK+mUdgjr5hh3TDItIM8ud3MPqItdIZvSBy6At4SrH
 PwHoYA4AU7ZjeZqaYWaA3JMJIRefSwml0t4qwc+ktxSSMu3EjO0DighbDKTn3xqOODKU
 8aA5FL4HALl1QQW2k4T0rKr+B9yknpX5DSbnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=qvR1N7BkwDYnsAvrsfaIO11nwQpKCU3X2O+a+Y27DUY=;
 b=4LdmBuraQtvV+06AKy7vefTdSkjV9/pUhnQIh6hjpyzkSgP2QOtcKVvXKVPp8DmLhA
 I+cGRWQkEhPurlzM1PayFQWpcy/aTdChaRjz9VU+LZGgtEWYwE1A22E6GaoREnaZOV9e
 KhjIMhXkegzvGs8id/sgN+9SKXVwpR7knrNOeHyaXMNRKNMdjp18namULgB+iIGVpgYi
 QbMtG1pN6YOHOwCe/Eu0nqKyqAmEOMfrelrq5KFwh3xZqu6NVx0MDFXkzFIrc+QPqHQU
 oF0qurTXHke7bHS8bPGE8OdbHWjN0shfwPqv/A0VscMpMYlKvYF42xeiCfXhHT1NHLqL
 JSQw==
X-Gm-Message-State: ACgBeo2tw5GtnR0JhfnXQiOqe/zOBdvwQJRbvZw9cQ3SpNU/Ja0KXJwI
 vFkKXnmt4r7RpoiDArbgKFFWgA==
X-Google-Smtp-Source: AA6agR5JW86JYwYYzN91pflVev5axL6S1Bv3lsKRf4XqvatlwpwQmUIlpWFZiPfqhA85TeaL1Xn6kg==
X-Received: by 2002:a05:6402:5cd:b0:446:5965:f4af with SMTP id
 n13-20020a05640205cd00b004465965f4afmr1916771edx.12.1662533990421; 
 Tue, 06 Sep 2022 23:59:50 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s25-20020a170906bc5900b007081282cbd8sm7824571ejv.76.2022.09.06.23.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 23:59:49 -0700 (PDT)
Date: Wed, 7 Sep 2022 08:59:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v6 39/57] dyndbg/drm: POC add tracebits sysfs-knob
Message-ID: <YxhBZLAasKaBPEDT@phenom.ffwll.local>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, robdclark@gmail.com,
 linux@rasmusvillemoes.dk, joe@perches.com
References: <20220904214134.408619-1-jim.cromie@gmail.com>
 <20220904214134.408619-40-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220904214134.408619-40-jim.cromie@gmail.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 04, 2022 at 03:41:16PM -0600, Jim Cromie wrote:
> clone DRM.debug interface to DRM.tracebits: ie map bits to
> drm-debug-categories, except this interface enables messages to
> tracefs, not to syslog.
> 
> 1- we reuse the class-map added previously.
>    this reflects the single source of both syslog/trace events
> 
> 2- add a 2nd struct ddebug_classes_bitmap_param
>    refs 1, reusing it.
>    flags = "T", to enable trace-events on this callsite.
> 
> 3- module_param_cb([2]) - does the sysfs part
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

All the drm patches (excluding nouveau) I haven't commented on:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think nouveau I'll leave up to nouveau folks.
-Daniel



> ---
>  drivers/gpu/drm/drm_print.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index c50edbf443d3..75d0cecd7e86 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -45,6 +45,9 @@
>  unsigned long __drm_debug;
>  EXPORT_SYMBOL(__drm_debug);
>  
> +unsigned long __drm_trace;
> +EXPORT_SYMBOL(__drm_trace);
> +
>  MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
>  "\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
>  "\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"
> @@ -77,6 +80,13 @@ static struct ddebug_class_param drm_debug_bitmap = {
>  	.map = &drm_debug_classes,
>  };
>  module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
> +
> +static struct ddebug_class_param drm_trace_bitmap = {
> +	.bits = &__drm_trace,
> +	.flags = "T",
> +	.map = &drm_debug_classes,
> +};
> +module_param_cb(tracecats, &param_ops_dyndbg_classes, &drm_trace_bitmap, 0600);
>  #endif
>  
>  void __drm_puts_coredump(struct drm_printer *p, const char *str)
> -- 
> 2.37.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
