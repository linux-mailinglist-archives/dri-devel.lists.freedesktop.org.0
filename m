Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BFE668733
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 23:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E9B10E94B;
	Thu, 12 Jan 2023 22:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B4F10E94D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 22:45:42 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id jl4so21656408plb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 14:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ooim2Wn4nxPzype/U3O2bg5SkJtVRY7qsQNtyTRmags=;
 b=YGaM1pN0C8twUIzQgGfKjkYks+VnXiObKg1aQaTkoY3olojecUD3RTItE7YfBzxsXQ
 ap49M0nIV5gwf/pkXPjh3bX8XHcHw2MqaSz2nwdIGfXeyGzq/xzLxr3Cigh1uBhm0PdQ
 xXPPrdT6WSBM60Mci5MPFJD/YztPmxYo5yMbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ooim2Wn4nxPzype/U3O2bg5SkJtVRY7qsQNtyTRmags=;
 b=7FFFSwxIaH/iSmhXT7sw8AMHk7qyuGaiMf8+9JnTpgDmnns4MIywoLALCc00vic2hh
 rIIu9S5j8VHpD99zy+oF28rAgX0ojcWPEKR5M9L/GLtfld/Lrw2GJEsr++MavCVLilOR
 brkfXv4g43qtpGxDF5L/B+suYwpvTR08FVQND01e0/uWxRdZXrAEsp7JuYig8H4qfOni
 M4fO5SCXL9NXnGrKWJKmwNUFlhM1eXBP33xQjI01q4BZcR2TluJF3L76vX8c9uBgUfgu
 glqVfya+5ofk8kBAKu6JV/1zyPOXxCvzrK7EjsQdFLbx8P91NnmPJZLIv+dMfXeVJa+Z
 0QwQ==
X-Gm-Message-State: AFqh2kqTL/2ivedjeq578DXY4Jf4SBUh622mdjm+g8rqg8OAy97V5X5k
 PzkuAgLPHvqiqgOy/Rcmo4oI2Q==
X-Google-Smtp-Source: AMrXdXvGve+4kNjBvlBdmOxwGLXehsNBREHOMLlomMlydd2DdmmiiiqSkLXYqlPUtwZFaLbLOdvQUw==
X-Received: by 2002:a17:90b:2356:b0:226:e1a0:6596 with SMTP id
 ms22-20020a17090b235600b00226e1a06596mr8726077pjb.12.1673563541660; 
 Thu, 12 Jan 2023 14:45:41 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a17090a474700b00219463262desm10980238pjg.39.2023.01.12.14.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 14:45:41 -0800 (PST)
Date: Thu, 12 Jan 2023 14:45:40 -0800
From: Kees Cook <keescook@chromium.org>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: Re: Coverity: dm_dmub_sw_init(): Incorrect expression
Message-ID: <202301121445.393EAD9B21@keescook>
References: <202301121425.FB249B61B4@keescook>
 <MN0PR12MB6101667DFB81967706C13111E2FD9@MN0PR12MB6101.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN0PR12MB6101667DFB81967706C13111E2FD9@MN0PR12MB6101.namprd12.prod.outlook.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Roman" <Roman.Li@amd.com>, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Wu, Hersen" <hersenxs.wu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 10:39:20PM +0000, Limonciello, Mario wrote:
> This particular one was fixed already in https://patchwork.freedesktop.org/patch/518050/ which got applied today.

Ah-ha; thanks!

-- 
Kees Cook
