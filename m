Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A618FA28F5E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 15:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2418810E0AC;
	Wed,  5 Feb 2025 14:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="n3RSsdGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C4410E0AC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 14:24:30 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7be49f6b331so613736385a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 06:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1738765469; x=1739370269;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ld1oYj72iOoIU8GaSocADZfs7sr+ubrQTaVt3aghNVU=;
 b=n3RSsdGNrxq+7VLk3O6pxsCk07+7MONDaZYGKO7pENSU7cigb3jjEIqcJaxMIbPXM6
 F8+eFbvbZnU4jwxjpMa/sPy/9Z0gnmTRvpPXiNPrAqHSvaFNNg2p6hqv5iAONW4IUyen
 9N/KY74dqnZjtA+dxshm9tb3IliFSSFo06Vcdmt+2ZN5eah55EK2t+a9Snxf7BIGOTg/
 cMx1AHy3/8dDIexJhYgWugfTJEbidWyoQj8+TUu9hJCG3CJKkYI27SHxWrY992TeAdZA
 N6/Iikr/10bkrcEjNBQtDZxFXVsM+jcEFhVSrmlOtSEUs2Bq0OQFG5/lzYPG9QC9ka8R
 /Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738765469; x=1739370269;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ld1oYj72iOoIU8GaSocADZfs7sr+ubrQTaVt3aghNVU=;
 b=l63QJBLl8mqN9Hrir/wCKothMyKrWyG4qvK0up0XgMMTOUHSFqbhie/bOL7dThc9cu
 JtR+NZ/slBxtc0xsFvCn3KmB76weJpqfeUSWri+rcwFEw3tm4kHRZOR1dMpc+K9+19Ic
 FWW/QejknDTw2RIDUgmEXzHBv2Fjx4YCZ8MGDCPXM1CwQ3E3erEV+fiT6no4J3dVI1rF
 5LJPGgUyODnOMcTRAMr+otHOC6wMPwaYNBxcNJuQUeYzuY25O1vUJNY3A904j/afSoBT
 PRmKB1EIQ1NJGCTNqxcUMyDrBhzplET8MaADnz0gxPGrTfcsxTgcqhZlu+4A9MV6Ldwg
 AWog==
X-Gm-Message-State: AOJu0YxNRiBewKnA97/4ypIEdD3OGwpx+5zPzerqS+4RnBJ2IXxEyH3q
 1jBo1t54pMv3COBHwGXvt6w7tURQsNpgmANP7ayNvvS8HC6TAgYFEkhcrTfKkNYBwFIXAjDhg0b
 KZoaIapRbM9zx328e8Rdr/91AHsDI8D2LgYlVJQ==
X-Gm-Gg: ASbGncsbrd+J3sYocNm0JfjyL2McaPk75EruRFpw3jP2r+iJiMuybBo1K/hlLkiMuxs
 SYve6c8FDcgsgh6vSq6NGxy/qADRWp/TVU2F1x+MJUk+US3e8GWRrNbeEO4vKJCQATDCyTQ==
X-Google-Smtp-Source: AGHT+IFPR0OeA9uoeQPLRJ/PVeOESSKUd48c4NvqLCM7ceOkwPl/SNrIh5YGHdKirT6M9x5TaHEttfB2XqRT50R5zH0=
X-Received: by 2002:a05:620a:2726:b0:7b1:527f:cf4f with SMTP id
 af79cd13be357-7c03a035203mr396153785a.42.1738765469402; Wed, 05 Feb 2025
 06:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20250205134811.2002718-1-vignesh.raman@collabora.com>
In-Reply-To: <20250205134811.2002718-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 5 Feb 2025 14:24:18 +0000
X-Gm-Features: AWEUYZktRsUSSGoFW48lG4Mw2z0zY_bip7FAmQz944mGwxXuWjZNSfIAfUeHsAk
Message-ID: <CAPj87rPREj3hJmjuhQRd1Tzxt8fk6rsa8Qv5xoHx97LuzwgYrw@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Update drm/ci maintainers
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
 robdclark@gmail.com, guilherme.gallo@collabora.com, 
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org, mripard@kernel.org, 
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

On Wed, 5 Feb 2025 at 13:48, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Update drm/ci maintainer entries:
>
> * Add myself as drm/ci maintainer.
> * Update Helen's email address.

Acked-by: Daniel Stone <daniels@collabora.com>
