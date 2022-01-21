Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5CD496226
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 16:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FEE10E4BF;
	Fri, 21 Jan 2022 15:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 466 seconds by postgrey-1.36 at gabe;
 Fri, 21 Jan 2022 15:33:10 UTC
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA8F10E41E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 15:33:10 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4F0813F17B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 15:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642778722;
 bh=kmO+xAN2J4Jy/ih5e+qjMQI4v9QuAWJh5wyH2KxAvmg=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=dUDxqYVBx+WwLOn02CctmPlEO8aVrXCCsVwSsCarStsSNAXjPHrDiY8xd9q8FSNEu
 wwPs+LBNSA78ZCyx4aW5ztnKrtA0wtWl/vfP5sUP/G14ojChUwLX/Rxz1gIaoqZcih
 JPFVNWkFBVVCKMSwwM9xggxTOZ7HCIM3ARG1KUCtUYREGywjcRe++hl4EzpgGw7p80
 /Lq72Opq7xUeEcT/NJ3K6EEH5gR37x6YxAtw3Kv8oM0CWUUqVPRB1lFJJ3rkNFqXW1
 5vEVV9CZWhG7VmOg48PZT+d4j57NavmOMibX2fp99mrqTeOzDMWn8s+TEB5nuWpSfq
 TUk8WYXTk2WWg==
Received: by mail-il1-f197.google.com with SMTP id
 x6-20020a056e021ca600b002b7e8b542e6so6086797ill.21
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 07:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kmO+xAN2J4Jy/ih5e+qjMQI4v9QuAWJh5wyH2KxAvmg=;
 b=ZNPdMuhQE8NrTh1MQ5Jld4w0+y9S3fMMkdDJ6wEYOcnFDDIR12KRXAVJmGsMIyCqwE
 u4s3KXotrc6QhFF3cf3cDamSBW+HxX1RCb02J+eOsQk28uTyAZFkpuSJeg/gDIB6YdD4
 iTy4orxG+lCoigcTnlYiLoFxbpX5Q2YkcCnruB6/sQax4hLF8NQz76M7W7xCR0n/WC1d
 jNxrX9Ofuw67w+WUS6lBgUXiskhNX5Z6qTzaMZxcI/T2rPiV4lT3HX9tmtWWZVToOaye
 WKXF14JiswCzcNSRRNUDtQYfnB4IzXcuart8wix3PcJYulF5S4gdnhiN1zGCAiux0P32
 ZDgg==
X-Gm-Message-State: AOAM530KoqNMb2Ku8Ab5pGmQiMpzKwX43dsr6xkeJ4Kb9WoaKsGK0C21
 0xCn51ynQQluhV9/6RD+3CrqBZXbRanr0TrDkAbCLmvhoY2v6MX+jBTC4j4vVwBZDHjEFO8uufU
 t66lgStb1BIDxiTlGneYEmvg1BSTEGUw9dq4bL52mX+gpGQ==
X-Received: by 2002:a02:85e3:: with SMTP id d90mr632666jai.15.1642778716284;
 Fri, 21 Jan 2022 07:25:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeOIQp+Scen5y5VsEkzFbri8UfeMJMq603bTmQNLXleUNzAxbMTmooyHEggHDV9wKJC/Ogyw==
X-Received: by 2002:a02:85e3:: with SMTP id d90mr632645jai.15.1642778716007;
 Fri, 21 Jan 2022 07:25:16 -0800 (PST)
Received: from xps13.dannf (c-71-196-238-11.hsd1.co.comcast.net.
 [71.196.238.11])
 by smtp.gmail.com with ESMTPSA id w4sm3282353ilv.32.2022.01.21.07.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:25:14 -0800 (PST)
Date: Fri, 21 Jan 2022 08:25:12 -0700
From: dann frazier <dann.frazier@canonical.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3] drm/ast: Don't check new mode if CRTC is being disabled
Message-ID: <YerQWPxMNYV+zOSG@xps13.dannf>
References: <20200507090640.21561-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507090640.21561-1-tzimmermann@suse.de>
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
Cc: cogarre@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 stable@vger.kernel.org, sam@ravnborg.org, emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 07, 2020 at 11:06:40AM +0200, Thomas Zimmermann wrote:
> Suspending failed because there's no mode if the CRTC is being
> disabled. Early-out in this case. This fixes runtime PM for ast.
> 
> v3:
> 	* fixed commit message
> v2:
> 	* added Tested-by/Reported-by tags
> 	* added Fixes tags and CC (Sam)
> 	* improved comment
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Cary Garrett <cogarre@gmail.com>
> Tested-by: Cary Garrett <cogarre@gmail.com>
> Fixes: b48e1b6ffd28 ("drm/ast: Add CRTC helpers for atomic modesetting")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: <stable@vger.kernel.org> # v5.6+
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 7a9f20a2fd303..0cbbb21edb4e1 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -801,6 +801,9 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>  		return -EINVAL;
>  	}
>  
> +	if (!state->enable)
> +		return 0; /* no mode checks if CRTC is being disabled */
> +
>  	ast_state = to_ast_crtc_state(state);
>  
>  	format = ast_state->format;

hey,
  I'm seeing a regression that I bisected down to this change. I
installed GNOME on a couple of different server models that have
AMI-based BMCs, which provide a web-based graphics display (virtual
KVM). When I enter the lock screen on current upstream kernels, the
display freezes, and I see the following messages appear in syslog
whenever I generate keyboard/mouse events on that display:

Jan 19 20:34:53 starbuck gnome-shell[5002]: Failed to post KMS update: drmModeAtomicCommit: Invalid argument
Jan 19 20:34:53 starbuck gnome-shell[5002]: Page flip discarded: drmModeAtomicCommit: Invalid argument
Jan 19 20:34:53 starbuck gnome-shell[5002]: Failed to post KMS update: drmModeAtomicCommit: Invalid argument
Jan 19 20:34:53 starbuck gnome-shell[5002]: Page flip discarded: drmModeAtomicCommit: Invalid argument
Jan 19 20:34:53 starbuck gnome-shell[5002]: Failed to post KMS update: drmModeAtomicCommit: Invalid argument
Jan 19 20:34:53 starbuck gnome-shell[5002]: Page flip discarded: drmModeAtomicCommit: Invalid argument
Jan 19 20:34:53 starbuck gnome-shell[5002]: Failed to post KMS update: drmModeAtomicCommit: Invalid argument

If I back out this change w/ the following patch (code has evolved
slightly preventing a clean revert), then the lock screen once again
behaves normally:

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 956c8982192b..336c545c46f5 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1012,9 +1012,6 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	const struct drm_format_info *format;
 	bool succ;
 
-	if (!crtc_state->enable)
-		return 0; /* no mode checks if CRTC is being disabled */
-
 	ast_state = to_ast_crtc_state(crtc_state);
 
 	format = ast_state->format;


Apologies for noticing so long after the fact. I don't normally run a
desktop environment on these servers, I just happened to be debugging
something recently that required it.

  -dann
