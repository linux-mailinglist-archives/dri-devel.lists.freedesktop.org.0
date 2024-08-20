Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E2E958A15
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 16:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C11C10E012;
	Tue, 20 Aug 2024 14:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zCgNrYRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C635610E012
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 14:49:01 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a7a94478a4eso1143014966b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724165340; x=1724770140; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2YaLZ+0V3VWfcae/qqnaZyv35zNsNu2JTJUshy4c9tU=;
 b=zCgNrYRIYmjo5k1pULuuu53nh09Ch5ZC3mlrpt1Pv+8M65zxYsKimmktCs7eeSZ9XC
 3DBkoUHvElvZqJgbwASF/R2UmjSlWkBUHID/s5kAfLWxxpC4Z89JR9MhfmIz4LP7O+ym
 GBn8WgzycdhlTFe/ZgHDdDRzTSutBoFCntPgYERlxZK4pSd4wwQc/fzTDkgNT3/zdb6B
 o8Fu+aMsSJ6fgBEiGvbs7uTjAFLaObSCCMyTc5adgcjbZaRBnlmO9RqC1EX0/Jcr5vYD
 yLzyuq3PtwjZQZez3JR23foiJoceYnODeiwydFuZ2avFAxJPmifK4rPqiNmN1Lxd3dh6
 dF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724165340; x=1724770140;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2YaLZ+0V3VWfcae/qqnaZyv35zNsNu2JTJUshy4c9tU=;
 b=DtMKYS6+1DEF9s2sstqlXwXd5QKG5dzxCbL4QJK5RlZXQvTDfuidQ1tFAlPcKWUmMb
 9LJPdLewok3JCaCRSDsrD3x7GHeru4GFX5yG36nunrtkgYtE3xiDfH9FiD79CFsFh6VI
 fVmtfP3Ww7sMs0lj9nQWeqMx+mDa/rjQN2+ejPZeMj849xwrz36wk0RE9/yN0VJ9Xpxn
 JCzK1CmQI3K//u9+ZkzljWfYobc0vYkaEKoRrrKvm9nRESoJvdeqbpSegHJ+/zoG6fgA
 iSZkVUY7C1oNxvu8QUa5vMKSlvFdh+ykupMTvJ82mP0+2SiZZO3fF8Jkyb6DPDuD5VpO
 OIFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdz5+dLWW5peIzwgaNLDd2Jg4RYKeC6/D3sMgPoPkvIieixwzi0WY1MfyctukqkRYXF+01gDQPiboxtmIztBLoDjNXTBxMWkgi2RpfwZCw
X-Gm-Message-State: AOJu0Yw/6yvolfEj+d+7cLsOaHO+BX1wDlOZJLyZZKuBqq7xxA1Yk8/U
 BmtLJfgnQkHUPqQXt1ebAoCxnVmcZTpf1LIzaECsE8xImoNwtcCqIwdHNX/GKpw=
X-Google-Smtp-Source: AGHT+IFMONhHLM2+mq8E7LcD5cDuQG95OSK7Bj9m5/lBOEhwVUrwJH6L1U6/5gFtHeUe2P0Agvz4mw==
X-Received: by 2002:a17:906:c111:b0:a6f:e7a0:91cf with SMTP id
 a640c23a62f3a-a8643ffb8e5mr316017066b.24.1724165339790; 
 Tue, 20 Aug 2024 07:48:59 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbdfad42sm6908628a12.47.2024.08.20.07.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:48:59 -0700 (PDT)
Date: Tue, 20 Aug 2024 17:48:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/amd/gfx11: move the gfx mutex into the caller
Message-ID: <49c41696-bdb7-41b6-8f72-c06bc434a145@stanley.mountain>
References: <20240820143909.1933483-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820143909.1933483-1-alexander.deucher@amd.com>
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

On Tue, Aug 20, 2024 at 10:39:09AM -0400, Alex Deucher wrote:
> Otherwise we can fail to drop the software mutex when
> we fail to take the hardware mutex.
> 
> Fixes: 76acba7b7f12 ("drm/amdgpu/gfx11: add a mutex for the gfx semaphore")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Thanks so much!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

