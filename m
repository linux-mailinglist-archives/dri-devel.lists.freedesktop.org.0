Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5EC450693
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2BA6EDEC;
	Mon, 15 Nov 2021 14:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D3D6EDEC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:20:16 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w1so6562960edc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 06:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GndoKYrsi7gk8s6CKvodJM9hy9pkBsJfGJQuMwuWtzw=;
 b=BWDIPgms4jvVtSZGTpOnzhPp80HbkSaHLH77aoBzCjYWcvoijj1yGRlFWW8r1pWyJz
 2tpYUHy3lCuTWYMqp9Ou8UZFWmelmGrjRBBJatue5qN8vx9oXCa2gGSyFg483Zj9xygq
 y0qjkMzXgaOFKyX1oQvRq559PC94HuS8bhyC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GndoKYrsi7gk8s6CKvodJM9hy9pkBsJfGJQuMwuWtzw=;
 b=2XFkZA04zE7tacYOcdmc1uB04DubuTmcihZP5ZnHlZFYA9DxwLooOPTdXRwNNVoLGz
 iNElqb96t8JQEcb11hlOQZih0iJO1A9oBU+I03tNkbVoDFvQOY/8SnSCWJVj2cRJ/qMz
 Gm0z+k345umLCtHBIn090oUEGHiHqho0MfDUiA47jjkpR7gcRoTCSH/O/0QveIa0xcmr
 aEtU9yqkfk24tt9QD2DVGnrN5ApHAVQd6jhD256L4dwP60s1obC+H6l6CkkYo/S6yHKN
 FXpM576k4Rtx5FUc3FEfnh7vFaiuhOunIj7oZ8IcVft2wdwWYBFOQE/tkaHRSdEA2hMy
 SsXQ==
X-Gm-Message-State: AOAM533SEoFCEDFJIZlrWuRIDWHQSNtUyvVdzFAKbLU7ISGFLUTLr8sP
 xmGtI2mPwqsxRFi65b6Y7rju1Q==
X-Google-Smtp-Source: ABdhPJypJuADiLCBdsITEm5LHu0pMh/C59fcqZ94Q7RN4zIXkVhiEbyRl1mxuEnUACjBP/3+YU35Pw==
X-Received: by 2002:a17:906:1457:: with SMTP id
 q23mr47564647ejc.561.1636986014977; 
 Mon, 15 Nov 2021 06:20:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id eg8sm6075005edb.75.2021.11.15.06.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:20:14 -0800 (PST)
Date: Mon, 15 Nov 2021 15:20:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document DRM_IOCTL_MODE_GETFB2
Message-ID: <YZJsnNBc4w15Teva@phenom.ffwll.local>
References: <20211109085601.170275-1-contact@emersion.fr>
 <CAPj87rNA1SzxJnT+L+Vpw8n15Gzed4rWto+OL6LdJRi0KOYReA@mail.gmail.com>
 <K23DZgTtMERkTEFRX3ZTohvEJ4DCdbJ3uj7rCmQC2Hh8n5z3mOioMVz4Q6TxxJjgVPao9H2RRTBL1NuCsDOCmJhrD0VelHPwqW6AhsbS7dA=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <K23DZgTtMERkTEFRX3ZTohvEJ4DCdbJ3uj7rCmQC2Hh8n5z3mOioMVz4Q6TxxJjgVPao9H2RRTBL1NuCsDOCmJhrD0VelHPwqW6AhsbS7dA=@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 12:09:47PM +0000, Simon Ser wrote:
> On Thursday, November 11th, 2021 at 12:50, Daniel Stone <daniel@fooishbar.org> wrote:
> 
> > In fairness it is perfectly clear, it's just that I never considered
> > calling it without master/admin because why would you ever do that?
> 
> FWIW, drm_info does it to display the current buffers metadata. Pretty
> useful when debugging.

We also have the state debugfs file for this, which should dump everything
we can decode. If it doesn't we should extend it there ideally, instead of
hand-rolling some tool that users/devs then don't have handy. debugfs
tends to be there (at least for developers).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
