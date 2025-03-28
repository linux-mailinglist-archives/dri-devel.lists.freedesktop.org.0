Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA1CA74942
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C38210E0E8;
	Fri, 28 Mar 2025 11:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="TZVKhzzK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A38A10E0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 11:35:20 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7c07cd527e4so199450285a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1743161719; x=1743766519;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pd8PN3p/9kcncZ2GucwiT4TwhVYWesPdmNLpevSyZB8=;
 b=TZVKhzzKFGrkTV5T1IFHtZ09Bm7THMmR9SPbNmzisBd38HGQ6iFdJl5viMHEH+ghkj
 ojo5VkySVMo3zats084sYFX8/6s5xHi6hCSjBi0uSoj96luOJJpuu4weHFU8vYD8UbCA
 LZAbfucs8W2JMTT/Csf//JZm+88+fYP4llLGnCusHs8yHA9TNN2LHKfnWptHGbH6LdNn
 5F8PkItXtp6xCKoml6Z3QCd0MjSYgHSJwFtOr/HlMH6xr8QyD9PYnJSD61WrT3EDSAT9
 yH+VW3skXhpUAZHI/Tg6WtMXwR93RdbxZ5831OyW3wZ7bpIB03svLnRpUkMBiIYeTED6
 vQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743161719; x=1743766519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pd8PN3p/9kcncZ2GucwiT4TwhVYWesPdmNLpevSyZB8=;
 b=s6mKiy7ccMf1jv2RZArSvJikUkPpNvlaPdQSrJ4zger5YjkNQ42sdYWkP5xMXfa6uR
 w3bGqLGooh0QJ+OeYkRT9SSquBfZ8Y9B4YWFco3pqfu9sF4McDu7WFKBusDJtmMH6v6v
 fbxUgNjeOA5YOPtTd1fA4ICONR8oykxl9DYAy3U3g31+9xWRhfeQ/XsernlMe2zburVS
 yrP+dy6JxcDA6NGlpFIp4p07tcfqrPlXhDYB8dd/sXavJP4GBHG2eJlZir5HB0VPyU9k
 nO7MmmF8OCQJnDnQgVM2E+boBhJAFD/Fw43cbL5E+zYLPOdujwGGo114h1lbcI1j3oya
 ckFw==
X-Gm-Message-State: AOJu0YypTw4Y3ONo6/Q1FNJNRp/V3mow9IBFnkTfU2mJ7oj83vgbv6zQ
 n7au+abW7NzrPO1QuVtlEYYf2RU6Rm2Kcw2cA5TZ4W/pyOLGZMWggRdfGvWKF3juNg/XRspfXoP
 n3Y7KfBdpZD/ovFrBwEbHDUgAf45x+LatwB8JJw==
X-Gm-Gg: ASbGnctfNjxfC/W+kwQmJPp1CKlsWJ2YivdLc0aEAl1z0vJ/xktD+ScG+46xgzpfF5C
 cBtqvcRC7DMtX2mHVcJRT+eGjmDEORLc2QdZrcoc4C/BRVR4RKqFeWuk1mNrDlPjvn1yRfE5WhM
 ajQ3q8o6f7TcETgdBGBjJ1sUoJ
X-Google-Smtp-Source: AGHT+IGU/FLsYSVAavUZD7ktRkUnhsimm7RoBgs50oKXuun5E8Xt5sIYYsCRUWZIx6YbZMwldkrPM7yjhWbUWKN2PaI=
X-Received: by 2002:a05:620a:4496:b0:7c5:4949:23f9 with SMTP id
 af79cd13be357-7c5ed9fd825mr1126022385a.18.1743161719039; Fri, 28 Mar 2025
 04:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
 <20250328110239.993685-3-vignesh.raman@collabora.com>
In-Reply-To: <20250328110239.993685-3-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Mar 2025 11:35:08 +0000
X-Gm-Features: AQ5f1JqqTavugbKkR-L4Seu2kshOIzEVZgcN1gS5a5w-02Htx7tpV1HQ9g70LxI
Message-ID: <CAPj87rNLqMxBgKGTSHMHT39agzu=GY-Dgk6Zma1oM1ztkTch3Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/ci: check-patch: unshallow repository before
 fetching
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
 robdclark@gmail.com, guilherme.gallo@collabora.com, 
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
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

Hi Vignesh,

On Fri, 28 Mar 2025 at 11:03, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Ensure the repository is not shallow before fetching branches in
> check-patch job. This prevents issues where git merge-base fails
> due to incomplete history. Set the timeout of check-patch job to 1h.

Ouch - an hour is pretty brutal. Is there a way to unshallow only back
to the merge base?

Cheers,
Daniel
