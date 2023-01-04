Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC3E65D893
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A018B10E0E9;
	Wed,  4 Jan 2023 16:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944A710E0E9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 16:16:01 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id 186so37060468ybe.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 08:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rYCkosDmfyCmdOaBvh38a6ArUNgKuq3lsDwckVQ9BUY=;
 b=fTYNQnbxKPOK8EdapHYtp+HRHmzog1EejJPBhTwhprWt/oHMS6KvehHmjFDhCrgm9+
 6ye5hSniYA7bnKpBSbiOF0ALB0WszZqkUfi7Juayg4+RYN/UPbmMUsREnQq30BFEXCcN
 y54SBpclLikOhA+vulpw4QhmFF9i/DGcVM+gSVu85mvJvLTnyqAFTZ8EAXLzmAG1l8LR
 mHZkKkVPVTrOaTsKM8cYpnevb9vY+4lhstC4NFykaL8PO3B7MXZFzdHRuv7To4fC/R4a
 QtB0oqDrF7cvHdjzIVD5Ud6feIig+ug24rIn6NUhCO+82t0DBaKd4J5fsWbd1qWv97e/
 LW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rYCkosDmfyCmdOaBvh38a6ArUNgKuq3lsDwckVQ9BUY=;
 b=m5gH8YFWw1v3zxwM8hAFhUmN2hgWdPdxuzsL5UhFfoVvMxtXo0z/OvzR7neInP/Lnu
 bP7iVt0/TYdSrC/ihiriJRLlUvj6/bLBPJUIFCRlGhGuloesBKm1a9fel1YxXSQMGHM5
 3uDKmDjK9mo68nLFL9tmhQFO7GK+CZfAKyOZ2QHJdNO6V1idc8c/C8CIwCZrgdAPjYN4
 r3+r5Zs/uupA5RrfMuomzpObOHoH5X8M2fF01HJ2+vC0hYx+ulxAWKv9jYzbkxlRjQRz
 A0YWgauTydiMbk9ZdFNAv5Ptl/42n47k0rBaaZV9zY3NYAsWVcTorg4x3gjiCy30Xg0b
 CF2g==
X-Gm-Message-State: AFqh2kq1YIGP+1DgH4ky69ZNvqbloASN80yHSCuSsJ/tAH7hFZzuGQw3
 FQIZvSM1f+wxStJWBxX/QX7c1Q==
X-Google-Smtp-Source: AMrXdXtFcTC/FgkTAlug8QxMiqTgnAiUJjlG9sUapVsyCKhPfFlb4v9hDHvg+gmEe6c4fC8XLVaDbA==
X-Received: by 2002:a25:fc21:0:b0:781:eaeb:b92f with SMTP id
 v33-20020a25fc21000000b00781eaebb92fmr30031918ybd.36.1672848960678; 
 Wed, 04 Jan 2023 08:16:00 -0800 (PST)
Received: from localhost (200.234.86.34.bc.googleusercontent.com.
 [34.86.234.200]) by smtp.gmail.com with ESMTPSA id
 f1-20020a05620a280100b006fa43e139b5sm24060496qkp.59.2023.01.04.08.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 08:15:59 -0800 (PST)
Date: Wed, 4 Jan 2023 16:15:59 +0000
From: Sean Paul <sean@poorly.run>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/docs: Explicitly document default CRTC background
 behavior
Message-ID: <Y7WmP/uWW7Tdy2ua@art_vandelay>
References: <20230103152738.1213785-1-sean@poorly.run>
 <aM3aLd9cDn4gsHtm4RNuQvCtKBUwXF7Fv3Blvo14SamrerqT8UVdCwYxtcKTp_BkPq2ddrA1iFZt6fLRqiosbhNMFWLUPrSpKk3V0N8UC_c=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aM3aLd9cDn4gsHtm4RNuQvCtKBUwXF7Fv3Blvo14SamrerqT8UVdCwYxtcKTp_BkPq2ddrA1iFZt6fLRqiosbhNMFWLUPrSpKk3V0N8UC_c=@emersion.fr>
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
Cc: Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 03, 2023 at 06:32:58PM +0000, Simon Ser wrote:
> Nice!
> 
> Reviewed-by: Simon Ser <contact@emersion.fr>

Thanks for the review, Simon! Applied to drm-misc-next.


-- 
Sean Paul, Software Engineer, Google / Chromium OS
