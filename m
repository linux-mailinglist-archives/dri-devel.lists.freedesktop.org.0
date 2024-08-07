Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E994A7BB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 14:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2987110E4E7;
	Wed,  7 Aug 2024 12:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="zWVH7iYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF6810E4E7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 12:33:22 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7a1d42da3baso98160185a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 05:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1723034002; x=1723638802;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IyhseLdbTcH0HQjwdopNFEMJ8vOCRMD61AHrQ0ocnI0=;
 b=zWVH7iYimEtt5vhgLs4knKSYUOFVqtA/lgs6K8jSoSTRh9bA2qesuiAbdqo6yq4FCT
 q3Iej1BEbAfk21yxjQJZfyu/VPovcEuln4tuVLLzNw/ikF+8z810D3h/Gs/q7VJ/skNX
 Q1IveGWof7C/sN35+lTw2tica3ZheVfgJn1Q0ToZeNbCoMRnt6WMrwtgvRrYFa3J5tUM
 daFV9HlhkWZAgSSaTqORVN6/ttEBb7GsrCi7AtgnODdCKEdbo0ti42ER65zLXr8ZBnsG
 LpIPi1SIDq0wFvE5fvx2/glxHcpk2ru55gFPedtJLoZKwrTN63U6prrE03rbfET/gmcF
 +Nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723034002; x=1723638802;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IyhseLdbTcH0HQjwdopNFEMJ8vOCRMD61AHrQ0ocnI0=;
 b=EtGIJ2ejdXWrTks7LypNg629ekt7ALZ4wMA2FfYP5WSdtqOLPUW69a+SbvMSWUF6Rz
 Ye2Fbh/Yh7x1jZEi38rdcFDFgaXeut33t6Co+nX2itTWkjyYK7jLIBFhGnq/YCvDy86d
 Uddlo39q5BvpJfCE+MDKBDB/OX+s/3vYkOpnqVwykjGl05Vse4FV5sHLB4F7rvseV0Za
 irpF1/X2QHMSiy0RoYZevearvlqj+nVm3/DwBDCedGca+EYdr0QsZ0kXe937kIiJIeyc
 nuZVfpHeSsBpSmYPLRkHdQbYgVFjV8YbSFDaRUY2wk/j6Ev0plC/hMWaMCCKC3mEgg4B
 swmQ==
X-Gm-Message-State: AOJu0YzETc2MB5Y5DGsGOYaRt/CprCq1BAM0FcnzK7ADMNP+H/3e6Pht
 xsiyp3lTyxmeyqotHktFLrZmtgmDbDLcGj2BTmHgQe7RUpH2PuPJRzMXTKmAHQcpitSez840JgB
 mBIvbBAgCfIcaIG+5cYIL5TCAbB0VSEXU0eddkw==
X-Google-Smtp-Source: AGHT+IGQwAyTHhFa5d+FgtHDb/BNARGoCOB1HyGv1K0p8jaGlwe20AFtdOyHBmDOX28AhldVlxO/Uqi7jv9po6LmYek=
X-Received: by 2002:a05:620a:f0c:b0:79f:178f:99e6 with SMTP id
 af79cd13be357-7a34efdce00mr2225516985a.64.1723034001790; Wed, 07 Aug 2024
 05:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240807082020.429434-1-vignesh.raman@collabora.com>
In-Reply-To: <20240807082020.429434-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 7 Aug 2024 13:33:10 +0100
Message-ID: <CAPj87rNO4ckvgggn=FE4odpAsGDb95XZ7py0GrguJqB0Y0TN8g@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: uprev mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
 robdclark@gmail.com, guilherme.gallo@collabora.com, 
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 7 Aug 2024 at 09:21, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Uprev mesa to adapt to the latest changes in mesa ci.
> Project 'anholt/deqp-runner' was moved to 'mesa/deqp-runner'.
> So update the link.

Reviewed-by: Daniel Stone <daniels@collabora.com>
