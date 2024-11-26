Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075349DA451
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 10:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893E210EA49;
	Wed, 27 Nov 2024 09:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T/+cz1xj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A22C10E97B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 18:34:08 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e388ff24cfeso5248739276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732646047; x=1733250847; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B5ZdijXHGTf9/VBMxXk0sgaeGJSHANk1xhdrCGF3VVs=;
 b=T/+cz1xjDIEAMwtCCIgTGcjcHhFl1uZsQh4sVrbzLA3aAJyeaF+mCNSvSBrGcXw36j
 Q3H/Rb3eo2+PQ+fblgA+O0HTo73ZX9dvli+/COsQZrCIzk0pjk3iXQD7q5gLd1A7D4l9
 eKEtc4v/irVFdxRu2DJkLH8GcPvFw0ZPQrpGalbTjmqYdVU7ACXegNT2VS9iaQWv47O6
 RieCRdoGOWszS2rcktcfg9Uc+cnm6q7mpRmKoPF3/gHnhcdD89oqieEg8nDwgTMHhQpG
 lf0cMCpJp6ZiJK4x/4EN39GKxFa9WxR/yVeoA/2X5XlQ+wOUMVcEDqPueNcO1GYH4z+9
 391w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732646047; x=1733250847;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5ZdijXHGTf9/VBMxXk0sgaeGJSHANk1xhdrCGF3VVs=;
 b=CNpWxmYLTVjbVGfbzal7JaxV17Bz7CGh2lSsi4mj0+glqoUMv+TGkM3K55tpRruKcJ
 F+nbXmNXFZwcEMNESXdJtvCQr+lH2mb0FUaZNcKfrueAt7CNAXJRduO2U2MiNvorImjc
 IbYsvW7V/z3j6ZvnzAp3vPm2xvWFXlC+n3z6or8b4L2TnfydYM8LFiHrZSowAaT0549Z
 lqj60plZ8zNlg/x41y/ucgkXVwVQBNgC364u3XZ4BoiTCs3T60EJJLbU+UNsP66lk9lB
 VT+eTp7FX0J5zq+NtOVlWYDZiu+0v0Yhzs2Sso08ocaRRvK3rMglIIRtCLma6XQLLa4B
 SSLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW25p+0BUzLjDDR+niuQOoh/cYrKadHclMNTo09a6ie+QObLPURxK0i3MQ4bRHERmD1gYXFuvSS2wU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzdt1A9tgecMI+FvUYd+6eykhEHutxBNC3c7pl4CUYzdIxQ5ht4
 EjTij3Hldb3OjPI8wMcan0TmPkyRWDxkM+guWBf6Ge/vYHwVwKe74Zfmb5VZo3hEQRvSFR0cn7l
 DeOIDIxeUsoVSIwOAKhune10SM0o=
X-Gm-Gg: ASbGncvQe3iufQcIiupCN/AkSHH8EkRIYvA1AcCOmJqJY1dfV9+vSjtEqlykwhiygNK
 egJz9hhhJKSSLFT+pKgpruBE+CDLJnf2k
X-Google-Smtp-Source: AGHT+IEAKAQZoBZRcCS59s6ATzOJRqSPoDhyFrhH0wpI4a7G9pyRjoqsbwGfh6mDJveSJ2gv3edzPDtBsyPh4VazY1Y=
X-Received: by 2002:a05:6902:2606:b0:e30:e9b8:abcc with SMTP id
 3f1490d57ef6-e395b973db9mr91652276.48.1732646047430; Tue, 26 Nov 2024
 10:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
 <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
In-Reply-To: <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 26 Nov 2024 19:33:56 +0100
Message-ID: <CAMT+MTRJrN1_LBm+Ba6wh1BcdG0co-AHY8t4rnLuLAV=75wZbA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 27 Nov 2024 09:01:48 +0000
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

On Tue, 26 Nov 2024 at 17:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Please take a look how other bindings define ports. You miss here
> several items and more important - description what are these ports for.

Aside from missing descriptions, this definition is copied almost verbatim from
snps,dw-mipi-dsi.
Ack on the rest of the comments, those and the descriptions will be
fixed for v3.
