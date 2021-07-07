Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F07333BE752
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 13:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028E56E0FF;
	Wed,  7 Jul 2021 11:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93DC6E0ED
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 11:42:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d12so2080704wre.13
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 04:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=bKpgpEz+pk+V+ldgYqur++W1nBmK81ST14+xbKpmd58=;
 b=Fa/4vUyzf6E/EeDLy6JA+hJ9oLQfkIh9ABPr1r7T0uafu1NuvOHR3sFu5FyWw0L3GF
 ZFn6unFwsJeeh8WW+FhQFlWCsUjK/jt+pMYKIeStGioEptkrLw2RzPnHrzPO6uezZQHr
 im692Taa5fNCLajZnqP9itJUWEFobUwLQxw/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=bKpgpEz+pk+V+ldgYqur++W1nBmK81ST14+xbKpmd58=;
 b=swY3Gv9c2LH4uDI5r1fWh/CHvSVwCxYblNAb1n170lYhwCrcJ7akZ1gcUkg7MtGEtw
 kgplX5cGaDdkHkIxjNbldpOOXU0plu+iJR8OOjoVpMAX0fgWD5Rz82jKwDWBFeOLylhP
 wZAP6BPwSPzMlzEeVqE8zZM9LfK1DpWu1YUvPv+JtZ+D0dD0XAnPWkBKsb5EJEErtlfQ
 i3Ck04hehaiPMHtazBkeHP4ME0MDptuv67kNUPrDNzugLeRLHmpH9rHkrcIU8OlALIFe
 3bRFBj+KyGKx3R7VcDng1PDyZesleQxGOKl8iDV2AonDrSnlg0eb/+hRXuY1R1NMYXWG
 rLcA==
X-Gm-Message-State: AOAM532ZnpwVgjdx443IiWtuyAv9BzlbJzrkGMkOZ+UHPvRNitpwyVIi
 7F5JbSQ5LvLzeivkQVDR8z5v4w==
X-Google-Smtp-Source: ABdhPJz9VXlKr00wIlz5nQYZ/vo1ak+FD0N7gT29dc1uZMdxDAOtpeV9ocDO/8PFl/9HtziAzBi5Qg==
X-Received: by 2002:adf:d1cc:: with SMTP id b12mr20190027wrd.410.1625658123765; 
 Wed, 07 Jul 2021 04:42:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d186sm6226981wmd.14.2021.07.07.04.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 04:42:03 -0700 (PDT)
Date: Wed, 7 Jul 2021 13:42:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/2] Add "BACKGROUND_COLOR" drm property
Message-ID: <YOWTCSpOZTGZS2qP@phenom.ffwll.local>
Mail-Followup-To: Simon Ser <contact@emersion.fr>,
 Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Yannick FERTRE <yannick.fertre@st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <31K3xupK1-7HNWorHqIwGwgEJl-1XdFjUQEoNYm6yB-lRoZ8kq5quRji_r3mzPZ0bUayLef6xPfQDiETgZp9lR7vUpDn2nB_37ncSd-J0Wc=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31K3xupK1-7HNWorHqIwGwgEJl-1XdFjUQEoNYm6yB-lRoZ8kq5quRji_r3mzPZ0bUayLef6xPfQDiETgZp9lR7vUpDn2nB_37ncSd-J0Wc=@emersion.fr>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 07, 2021 at 09:03:03AM +0000, Simon Ser wrote:
> Hi,
> 
> Thanks for working on this. Do you have plans for user-space
> implementations and IGT?

Note that these parts are mandatory, and there's a patch floating around
further clarifying what's all expected for new properties:

https://lore.kernel.org/dri-devel/20210706161244.1038592-1-maxime@cerno.tech/

Cheers, Daniel

> 
> Thanks,
> 
> Simon

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
