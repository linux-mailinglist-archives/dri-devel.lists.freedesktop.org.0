Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5364DE5C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 17:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6043910E0ED;
	Thu, 15 Dec 2022 16:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3D10E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 16:16:41 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1447c7aa004so21516862fac.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 08:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WmhcSod630WMmrv8Iz4/Aem44InqHzLhbQpOczKGFtI=;
 b=FHsmd/P1LeOekUAzEUmrg8IAe5kZ0SmK36VCdFxitg0/K1Hn+N03GJ/RgRfXWZXucv
 2z3KjuUjlRMcflJEjioZOADVX8AFI7A8Vi7NhFAFOn5MUCPCKebpLXGvYLPOZYoYRPef
 MeMKmoBwHGfrG4EtdNIhFZqwMCc+B8xBpWE2//k1DNuN/aUAj0vpAdo7KXlxkiIVkShB
 +Tsp03Pe14Aal6fMzLFuzUKM9l8fvRqOkGrKoU1bKcHq3T+fBtYnZHvINGg++T6OqjSt
 pdhePh5ZwdsvhrbRx6Pp+ZNTV7naAhAEQqN+Ol9Kj7TU7P8++b1WvZfffUhHEQs1wW1F
 KxuA==
X-Gm-Message-State: ANoB5plwn+Zu7NOYtKP0MgiHkYpoGuTYpacojj8fEHrGyp5i86uBV8bj
 91bW4W3C0aJpZKUpJP/z1w==
X-Google-Smtp-Source: AA0mqf4ZpeLvaDZnLN6XCqYqsI3uas4LVmmjGi9sULsC0m6a0NGAeb3+kld7P5xa9O7lOS23KVKnfQ==
X-Received: by 2002:a05:6870:ebc4:b0:144:e283:831f with SMTP id
 cr4-20020a056870ebc400b00144e283831fmr14321577oab.11.1671121000173; 
 Thu, 15 Dec 2022 08:16:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05687080d400b0012d939eb0bfsm4222398oab.34.2022.12.15.08.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 08:16:39 -0800 (PST)
Received: (nullmailer pid 138172 invoked by uid 1000);
 Thu, 15 Dec 2022 16:16:38 -0000
Date: Thu, 15 Dec 2022 10:16:38 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V5 2/4] dt-bindings: display: panel: Add Magnachip
 D53E6EA8966
Message-ID: <20221215161638.GA135300-robh@kernel.org>
References: <20221214180611.109651-1-macroalpha82@gmail.com>
 <20221214180611.109651-3-macroalpha82@gmail.com>
 <CACRpkdY7UArNJ5ZH8f5rx+9aoV_ii=0aE9PCj-6XHCL7Om0+=Q@mail.gmail.com>
 <SN6PR06MB53429788776760E4BDBC55ABA5E19@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR06MB53429788776760E4BDBC55ABA5E19@SN6PR06MB5342.namprd06.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, Chris Morgan <macroalpha82@gmail.com>,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 15, 2022 at 08:44:56AM -0600, Chris Morgan wrote:
> On Thu, Dec 15, 2022 at 09:47:19AM +0100, Linus Walleij wrote:
> > On Wed, Dec 14, 2022 at 7:06 PM Chris Morgan <macroalpha82@gmail.com> wrote:
> > 
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >
> > > Add documentation for Magnachip D53E6EA8966 based panels such as the
> > > Samsung AMS495QA01 panel.
> > >
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > (...)
> > >  .../display/panel/magnachip,d53e6ea8966.yaml  | 62 +++++++++++++++++++
> > 
> > It's fine to keep this as samsung,ams495qa01.
> > 
> 
> Would the device tree team be okay with that change? The driver name
> itself has changed and I fear possible confusion if someone is looking
> for docs by driver name.

Doesn't matter to me either way.

Rob
