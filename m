Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE592A97B0C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 01:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49DE10E3CD;
	Tue, 22 Apr 2025 23:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GAYvrRaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FE010E3CD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 23:35:48 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ac2963dc379so857861866b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 16:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745364947; x=1745969747; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8evr1lVWkjGhFcHqCwFiqGLW2yKbaQuEQo6rltTE0io=;
 b=GAYvrRaHNQlq+S//BDiY4Di77uF08xalRNOMh7HMCcRIil/XpS4oyarfeFvQ2NgiP1
 skZ2DG2KbXWU57bJ+T5oEqMuNstAnZYtsZ1egwygMBp+vHpGyG1WH0gTiExE6EvLhdpv
 w9HKhFtN3pTX1i84mpxT3EuoTsWBQW+aq671r0X0ZhAi91COnexwJ5HgRJCbAJ7mupZx
 Y3nHLF3yfBTfUETR0EXpIIsG7I9cqv8/wyX/uiF0XN1V5impI4n9t1Ek5PWOP3IuEVc2
 UWE34pN6ubyLlR0mF+0K3UYhaGwpDqjuDYKaMVvK1qk+/5axtnCNQ+Q13CQKbEdU83fY
 eXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745364947; x=1745969747;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8evr1lVWkjGhFcHqCwFiqGLW2yKbaQuEQo6rltTE0io=;
 b=rpB19xT9J+4k4sX3wDDJm8M7qcIvxXx4rxPRMc4lr7rJcSf57oN49qAbGAvag6eXMs
 a8H50BOO2HPNekRqki9R53eWFrFeOaBq9MRbRue8D2yOvA8bPw/LLeKvDF1vrbchvDV2
 T92EQf57j4mGlvRVsRRqKMaizUcDGJ85nsTb24BEPVctZ1pAOfCArhr4H1ekAsTcePRl
 3Ho3Xc+GoW4MvRZsNz7OI8c4ZEu2B8VCdIQvDDcyUdd5Wb3b8kT7wEMrbLvg/hK4Gwx0
 pf8OElIW92l2Xnwqi5l3TGi8NGq7xDJL5ELh7ZZlG9YCSA2c439noXy3SMDO8F4UZ8IA
 ZyCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5SCx+ZR2D5CmJdV6R/K5rKZ/MtVIt1AiKyt4rhGSGeCPPSnUxNOnHfvZEyiPtrqm5UcFYcUqOsmQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrijkCA9oVckcsrZepAsjEQ9lGCPlCyUxkroksEa4tRtdUtG9o
 FpHkxLOIrMCZmWdWiVgxyMiFaYXfZVli8Mc5X0P/mpxEwb5BBegzVH67fXFbw3NCS8Cs5+fsCCB
 n3mCH+d+ZcaAg3rbEus6SKogsfFk=
X-Gm-Gg: ASbGncsuj0j0+UZesUf2rRjeCgE8Ze15ychuuau2xDdsFrmLF/PEIRbtgdfZFUghMd3
 pRoYsBCfFdbNKs4YQDttsdFb0MtmDBKUnyWsE6EF7lw68VdKZS131nqnXbboVDhvbENCwl88dNS
 X+9IXRh2s7a3CZa8gTHGKj
X-Google-Smtp-Source: AGHT+IGPBCvVkGGFoVxutgeMLV1VA6BMn9j0l/mEeV5VPNpJ+rQQEhNqOMMqkYADMRezWKJOMdty505Y74E7CtKfq5g=
X-Received: by 2002:a17:907:9727:b0:acb:5f9a:7303 with SMTP id
 a640c23a62f3a-acb74bcc517mr1442737266b.35.1745364946515; Tue, 22 Apr 2025
 16:35:46 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 23 Apr 2025 09:35:35 +1000
X-Gm-Features: ATxdqUEe9VqsZcjFJ7H39W8c5vJDNYZbW8UA0a5_aM-A3KrRMzPSeAEAgzH1Iuo
Message-ID: <CAPM=9txG6J5cAMcKJWE_Ya7HCdykQYeM=s5qmEwcTVLbF9qoAA@mail.gmail.com>
Subject: force_alloc in ttm_operation_ctx
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hey,

Been digging a bit into cgroups stuff and I found this force_alloc
flags in the TTM operation context that seemed like I should dig
deeper, but I can't see this flag being used anywhere, places set it
but I can't spot the consumer of it?

Is there some out of tree patch or something currently being
upstreamed to use it?

Dave.
