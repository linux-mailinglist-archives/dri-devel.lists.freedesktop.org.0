Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9944F4CC436
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 18:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2A389DB9;
	Thu,  3 Mar 2022 17:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2C89DB9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 17:43:29 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id t19so1647661plr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 09:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3mNZQL2VC2uYb431PEz6jnFD5ZTmVgeO3AWfSaB6+TY=;
 b=TSou/dg3MxKfuVnSlJ7/9Ygb6rTt3uj1IAV4FuRAP0EFPtQzGCi18SqZsbllXX+6S8
 ntcMT0x0I5bMkPvRf+RymUl7ybQA3dv1GWojQ1350VFS3FT8qE2h7SFFXSceT7yfD2T8
 voM8RJe8gyMdGEmB0QSQndTKjgdU+d71aw2BA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3mNZQL2VC2uYb431PEz6jnFD5ZTmVgeO3AWfSaB6+TY=;
 b=0btXTYVs9OPJxKtmYTttwv3K180zGbZE+YzGf/+QvuLxwQpor7FOcSAY51OF4Z8zwz
 3Rzc1FfDgrVbcGycFci7Hv3u82ALkZUFaC+C9o7U6RBRkMNg3hnXKnU/8iKu3HykhocF
 Us58iK1Apsuv9V9u1LVeFlQR80iG1earWNHcMTUKxfCQ58j9h3RMgsyr8iAR995DA+B3
 a4hH2r35GfNMfblT9EnHN39iWD8RNLophQCXAnu+JfAPRh4yJWQ/eVM2WCMxjDCKzqTo
 ydZR725P+zdC7iIyOy5Iyx8Hx7iNiCr5C6JqeQwLPGFrrIHkuDQ9DQzPIy9A8UIW6+OA
 cAjA==
X-Gm-Message-State: AOAM5336vR2ZmNbMxfZrGOeECz0w/ovQYlsyMYtUgxmgBlV63ygBvZcn
 0S/MP5kz0YZADB9KCisy20rEhQ==
X-Google-Smtp-Source: ABdhPJwuuWN6vPSVt7Mv7dHURNIv9eDx1oLiv+vp7zPxRp6zIMVlyTuNFHJ/8c8jo+dQfkkeI/rm5Q==
X-Received: by 2002:a17:902:d2cd:b0:14f:c169:dc6f with SMTP id
 n13-20020a170902d2cd00b0014fc169dc6fmr36769598plc.170.1646329409448; 
 Thu, 03 Mar 2022 09:43:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a655549000000b0036570f81245sm2536433pgr.84.2022.03.03.09.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 09:43:29 -0800 (PST)
Date: Thu, 3 Mar 2022 09:43:28 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] drm/amd/display: Fix Wstringop-overflow warnings
 in dc_link_dp.c
Message-ID: <202203030937.5BFE3EF@keescook>
References: <20220303172503.GA1731116@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220303172503.GA1731116@embeddedor>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 03, 2022 at 11:25:03AM -0600, Gustavo A. R. Silva wrote:
> Fix the following Wstringop-overflow warnings when building with GCC-11:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:493:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]

Can you "show your work" a little more here? I don't actually see the
what is getting fixed:

enum dc_lane_count {
	...
        LANE_COUNT_FOUR = 4,
	...
        LANE_COUNT_DP_MAX = LANE_COUNT_FOUR
};

struct link_training_settings {
	...
        union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX];
};

void dp_hw_to_dpcd_lane_settings(
		...
		union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX])
{
	...
}

static enum link_training_result dpia_training_cr_transparent(
		...
                struct link_training_settings *lt_settings)
{
	...
                dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
                                lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
	...
}

Everything looks to be the correct size?

-- 
Kees Cook
