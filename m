Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2C48CE903
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 19:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF1D10EF61;
	Fri, 24 May 2024 17:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VU647xEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9852B10EF9F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:08:16 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-df7719583d0so851260276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 04:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716548895; x=1717153695; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YIKm1y4gY2lJsOegqZ3pNgy8uY1r/NNidQZmyALCU+Q=;
 b=VU647xEiMcyuV8mo/GUkAWk5sTVsn274ejhhkTcl+jQYDPzEoIbdZXS7Tb2FkQWtsh
 yWviPv25u756uHeUscI99ZVFv34B3Ytd9XK/r/9eyGMIzTPIrs2B565qwKTStm/oFxq1
 rhsA71sbl2ryAVdz7tIukI2KscBqTqMT3ihRgbAn5DN8nWEIUts7LWJXgFsZgdiVbHFv
 zCEABz64Elfd+W4EyWz7IUKOHZJXluI5eFa43TP0ZXLzqCQYq6nc1BJ0CpnDDwSFRS+j
 dQYAyIPBlB0Pa28eCMLD9SQ2Qcy7jJGPFF+FNnTvRMyqLG9fXeet6SQHFQxOC6uwMPTr
 mS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716548895; x=1717153695;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YIKm1y4gY2lJsOegqZ3pNgy8uY1r/NNidQZmyALCU+Q=;
 b=DlpLdpoljnbBo2O0kX6/JHTGNCNOXE5lFAdsRaWFnbMAeHQZIq1l38eH/b0CCOB8kR
 +Bl3qiKmV240NaWvGw5mlRbp4VoYy9IHcQ6m5BxK7mS4NyvapwSwKA6rwKtVBfJvBs7u
 npxq2jE3bqw/g4mHih3+P8dx0FBdDYkTB/q763/NYnS5RtwnDGhGWT4zMVPG6cIClLLi
 Rli++xFVmK8VTlRi4IoS4tTeGXx8jAVveikwU2y95uudE3JEmB+YqK4UZuIqH+1XFijk
 NWi0+HN9a8Q1EFWbgkRFzEgwwLz/TmIBIfaIe3fEUxqRUk5A5h5AyE9EePxmD2rl9YZI
 5yCw==
X-Gm-Message-State: AOJu0Yx7rkaRO/fhw7YrKQQwPQ5eaD+mGnz5eDM6vy5JKfJomleN6Kcd
 BGGoR1B6BhUAjxQAFL5PZcZ0ZYJAtiOiNGCNtbcBpqxqFXOKfH3DNgPtDYD/yREe9DIjHF5mXMV
 5044N49n6b1T5oYVuPkWVprfDhYk=
X-Google-Smtp-Source: AGHT+IFAGfPJGrXOnaH/Gx2u24PuxTtPCsvl4gdJyfYHcmy5PG5TQGqzudRXoxNzaVhKmKUUbKPRP0m59zS/YBd+TMM=
X-Received: by 2002:a25:90f:0:b0:df4:2beb:344e with SMTP id
 3f1490d57ef6-df77215e3f6mr1767903276.2.1716548893984; Fri, 24 May 2024
 04:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240524103506.187277-1-ryan@testtoast.com>
 <20240524103506.187277-3-ryan@testtoast.com>
In-Reply-To: <20240524103506.187277-3-ryan@testtoast.com>
From: =?UTF-8?B?44GN44GP44Gh44KD44KT44GV44KT?= <kikuchan98@gmail.com>
Date: Fri, 24 May 2024 20:08:02 +0900
Message-ID: <CAG40kxFTT-K2LPZOM=0TLKREye8ooa+uvo5Rj7tYC1Um0rzNnw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: panel: nv3052c: Add WL-355608-A8 panel
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chris Morgan <macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 24 May 2024 17:09:22 +0000
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

Hi Ryan,

Thanks for your contribution. Here's my sign-off:

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
