Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8764EAEF8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 16:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA8710E8E0;
	Tue, 29 Mar 2022 14:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73F910E8E0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 14:02:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r13so24952916wrr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3YwiF3dNLZdMtbfpg06P1mlDVUresljsvoynNQnAt7Y=;
 b=VXKz1QXe/IeXmVI5+tfLu7J4idHZg1R+4aV31hZr5XJZUkg5j5eP09GGlqiKPUAqq0
 6vxmfXj0mw7F1fYPNJTlH9WW6/NfCAHitZqKyf9SYj7K2PEKLtzNHubTboYEWMJxRDAf
 FHcyT4IdaRnah1CPqyPiO8tuUM/wCQsD8YXhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3YwiF3dNLZdMtbfpg06P1mlDVUresljsvoynNQnAt7Y=;
 b=FVEJpY1zPeuQwLiupSPcXigPyQJgSLAyaiNSmTzPELuyhPqV9Y47TcaCVNG/YXaZwH
 sW/8kSQZKI6y3oFmaQegXl+mKqSHPDWs85prHwBS+7MO10mlO0UWY+bgAMjO1OZyxyVG
 IHHpoh0hw7ooiUFeolERqfSqXwUuYKXawURzOt8wbJPpGc8OQlKoPA2eD9cAjOF8QHWy
 J3bhSHysD7hHnUdzXzcnBELeitn7QkIH8kcI54hC7aGh81V9BB0uYWqpALl9gZ0mSDWq
 f5XL0KX3xs256CzXI8n4idKhnfIy2uC20uzVySPOZR6lg0H2BMeYV+0I04F1rDzHkwDX
 +S1A==
X-Gm-Message-State: AOAM5303NY9T8jQ7cDv8zZNGdKzgK0xxqPw04paW7TUALJk3lkYxOmyK
 lv1CrcMOvN4B1mS4wJm3tAxktNOnbmI1n2UL
X-Google-Smtp-Source: ABdhPJyiQ9LAaa7R3GM8nsVi+PuN7N3AzDAkV0GURdELIk/XaoNVNpKbhedX+H5nfuu/axFVuthL9w==
X-Received: by 2002:a5d:59a5:0:b0:205:c33c:44ad with SMTP id
 p5-20020a5d59a5000000b00205c33c44admr13554868wrr.103.1648562533240; 
 Tue, 29 Mar 2022 07:02:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 14-20020adf828e000000b00205b0fc825csm9438920wrc.65.2022.03.29.07.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 07:02:12 -0700 (PDT)
Date: Tue, 29 Mar 2022 16:02:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Allow ttm_buffer_object without resource
Message-ID: <YkMRY6faCAZRLBhF@phenom.ffwll.local>
References: <20220329110243.6335-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220329110243.6335-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 01:02:32PM +0200, Christian König wrote:
> Hi guys,
> 
> this patch set cleans up the handling of TTM buffer objects quite a bit
> by allowing to create them without allocating a ttm_resource as well.
> 
> That's not only cleaner in general, but also a necessary prerequisite for
> quite a number of related work.

Maybe there's some threads I missed, but I can't really guess what this
could be useful for without even a hint.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
