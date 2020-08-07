Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A342623E997
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 10:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09C26E986;
	Fri,  7 Aug 2020 08:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD25D6E981
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 08:52:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 9so1033378wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 01:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v5Sy/iGXl/ZOwBfSsungmIvGx/+wZokjulOswUfq7cg=;
 b=QHZlkb6/jBAPRhTXzh1tie+ahrgcJ3DrsuaZH3jxEAwiNd0RC7DYkPDxliWEeAxb6E
 f07yPY/7KurDAKTK9NIV1zxoqcjO+1bCYYo1xmRALqpJAEvWj3u0chnWoUEGfskuc8Re
 1NKyv9SY1WBfrUuiEW0vqG9Sd6oZe2HRpGa5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v5Sy/iGXl/ZOwBfSsungmIvGx/+wZokjulOswUfq7cg=;
 b=nHURbhU60UGul6zIY9giC/f/GiWkWgtFrPO4Zr9T1lpHerdEXb1vi2jYZsTfnfaWXG
 b7hytPrGfXX6/8YmBlaBjjeZEbTacxyeEgxD5XBOLjDiBvvTmF7NkQwpR1VfZfviHkCb
 RMKNsG8EEJ8hvD1vDZ83NKq1q+yJB//Ncm2w8t5CtN/vt3QoSU4jL+U/QYhG5sElJKXP
 JSI3CXcKlW2lq74xfcHG/sjqsglNdWGACFGGsln4BlRPOP/xxmSiC1gmCbbXPr0R57dM
 KMQVpVHrPRTF8edlsUrs2xASy6q5+wVPejn3RGuLzGH6c1Mlal9wKeTuTRpZ4s2cu0Kj
 5PTA==
X-Gm-Message-State: AOAM533iETj1cbLxF/WGgASG9LuumCP1G0eRZiuwLXdjxBZESv4SKwWE
 kvOMTJVyTI/JHlegHb3tKGoLcA==
X-Google-Smtp-Source: ABdhPJwj8KUbOAfPYNomCnBAdTgDN1jPrq5Vx0yNs4xxcLQ2dvKEPt6QxTpBYI9BzNCS/8LOkxb+tg==
X-Received: by 2002:a05:600c:2112:: with SMTP id
 u18mr1278371wml.7.1596790336538; 
 Fri, 07 Aug 2020 01:52:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm10384860wml.41.2020.08.07.01.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:52:15 -0700 (PDT)
Date: Fri, 7 Aug 2020 10:52:14 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 7/7] drm/amd/display: Replace DRM private objects with
 subclassed DRM atomic state
Message-ID: <20200807085214.GP6419@phenom.ffwll.local>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-8-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730203642.17553-8-nicholas.kazlauskas@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 04:36:42PM -0400, Nicholas Kazlauskas wrote:
> @@ -440,7 +431,7 @@ struct dm_crtc_state {
>  #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
>  
>  struct dm_atomic_state {
> -	struct drm_private_state base;
> +	struct drm_atomic_state base;
>  
>  	struct dc_state *context;

Also curiosity: Can't we just embed dc_state here, instead of a pointer?
Then it would become a lot more obvious that mostly this is a state object
container like drm_atomic_state, but for the DC specific state structures.
And we could look into moving the actual DC states into drm private states
perhaps (if that helps with the code structure and overall flow).

Maybe as next steps.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
