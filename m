Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8166D652581
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 18:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91B710E0CF;
	Tue, 20 Dec 2022 17:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DA310E0CF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 17:23:02 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso16120620fac.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9m759R3NNJtMIrV9Yundq41ukEnmCHJ740TTiiogoDM=;
 b=dyzB4wZ6/3k3yyIirPbsn2MBd49oOJ81xqWP1HB9J5hkiTzbKi6s+3bi5YJKqysIn6
 ji34kZr4pm21xnZoIV5RHbm/rOOOdq+8jCNbQPecr+Z8voP7uGhbcI1mtMM/nIFZwY4Q
 vsBhM68P6A+90SwTCzT9XAk3Ezo2jCamFyHM8oTEg3Qb5fOOhC8/LluuWhQcKTGlv2bX
 74xlNghGIHJRpNZhjBeCW7zR6g2uHVJp1U4O6PSVBMQb/SftnqthgGlZ25I9mks1sfe0
 Z17ew2YDUaFVTf+2K25cMmSO3ZqFPmNrlu1YIXSwM72AqYX+kleKpMhCAYxpuGw29mhp
 NO5A==
X-Gm-Message-State: AFqh2koOHGXh4EHS+myHKuTavGbuUj+8y6cnpY0lu2aaMLXEw9cXmrDA
 W3KUc2sI83983D2+ycnskQ==
X-Google-Smtp-Source: AMrXdXsO8yqVRg7avcaopThhKulTDE9MWTEUA6xsuEbVm364CmV8ytfwd7JYTHsN4QCxJtQ+X6Zyrg==
X-Received: by 2002:a05:6870:e08:b0:14c:6a72:dd31 with SMTP id
 mp8-20020a0568700e0800b0014c6a72dd31mr639642oab.18.1671556981556; 
 Tue, 20 Dec 2022 09:23:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l44-20020a05687106ac00b0013bc95650c8sm6216885oao.54.2022.12.20.09.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 09:23:00 -0800 (PST)
Received: (nullmailer pid 774015 invoked by uid 1000);
 Tue, 20 Dec 2022 17:22:59 -0000
Date: Tue, 20 Dec 2022 11:22:59 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/10] dt-bindings: display: bridge: it66121: Add
 compatible string for IT6610
Message-ID: <20221220172259.GA768859-robh@kernel.org>
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-2-paul@crapouillou.net>
 <CAG3jFytgK0noWteGvXTdSm9as9Q=qfhf_ep3Z8Wv2ofmLzGb=A@mail.gmail.com>
 <c78e92ae3cbea037abdd31ecd64e997c8dd1def2.camel@crapouillou.net>
 <bb2b5b72-42b3-3a6c-d865-9e338e34aba0@linaro.org>
 <d1f6d19d3218d9f1acc9b38e44af413f72f8a824.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1f6d19d3218d9f1acc9b38e44af413f72f8a824.camel@crapouillou.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Phong LE <ple@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 16, 2022 at 01:21:54PM +0100, Paul Cercueil wrote:
> Hi Krzysztof,
> 
> Le vendredi 16 décembre 2022 à 12:21 +0100, Krzysztof Kozlowski a
> écrit :
> > On 16/12/2022 11:46, Paul Cercueil wrote:
> > 
> > > > >  properties:
> > > > >    compatible:
> > > > > -    const: ite,it66121
> > > > > +    enum:
> > > > > +      - ite,it66121
> > > > > +      - ite,it6610
> > 
> > These should be ordered alphabetically. What's with the tendency of
> > adding always to the end?
> 
> I'm too used to the "inverse christmas tree" sort :)

Come on, the DT standard is sideways christmas tree. ;)

Rob
