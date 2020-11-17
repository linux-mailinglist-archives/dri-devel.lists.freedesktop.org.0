Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4566C2B71A6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 23:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729B389F33;
	Tue, 17 Nov 2020 22:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19026E140
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 22:37:45 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51ED421D7E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 22:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605652665;
 bh=/qLq+cMo48jQIDjSZj4KxKcEC755zqt8wk04d18Aaw4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zoI91+Iat05PS64BcIKkVcj8hKrWgcN8QqaVqbVRY8Egprk5h6MXsy5ul/uaB1c3r
 a1dN8dvOtH6jKCMg5HEcS3Iu6ASjqhMqp1D29DUUsSHzFgl1A0LYoq7G3q5CkaXDVd
 8b75tsKw++LFAZHaGV7wl0IaJh2MeXxfSySynIEY=
Received: by mail-ot1-f51.google.com with SMTP id o3so10578439ota.8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 14:37:45 -0800 (PST)
X-Gm-Message-State: AOAM5312raMPFswJu3qCZPFwYzMtG5c8WV69fiNWSGwaZKF/O6h11LmL
 c0y4IxJ2U/cbLkRvRhH8vf+NydkQEh49GMT5cg==
X-Google-Smtp-Source: ABdhPJwbivA8ARTNwWarhPIBav+yTVu3bH35FwlUSmuCTR2S6nTDgwHPSbv/j2hlWlFalXqjvh1IQs2ZN/UxVpRT/jw=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr4367695oti.107.1605652664605; 
 Tue, 17 Nov 2020 14:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20201117200522.4000817-1-robh@kernel.org>
In-Reply-To: <20201117200522.4000817-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 17 Nov 2020 16:37:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLENMjeNYsg0JSCBvsgZOqiz2ivKX7jP9kVE_AV5in3dw@mail.gmail.com>
Message-ID: <CAL_JsqLENMjeNYsg0JSCBvsgZOqiz2ivKX7jP9kVE_AV5in3dw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: Use OF graph schema
To: Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 2:05 PM Rob Herring <robh@kernel.org> wrote:
>
> Now that we have a graph schema, rework the display related schemas to use
> it. Mostly this is adding a reference to graph.yaml and dropping duplicate
> parts from schemas.
>
> In panel-common.yaml, 'ports' is dropped. Any binding using 'ports'
> should be one with more than 1 port node, and the binding must define
> what each port is.
>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Drop 'type: object' where we have a $ref
>  - Drop any common properties like 'reg', '#address-cells', "#size-cells',
>    'remote-endpoint'

I think this isn't going to work in regards to unevaluatedProperties.
Consider this example:

parent:
  $ref: schema.yaml#/parent  # containing properties of 'child'
  properties:
    child:
      unevaluatedProperties: false

The problem is at the 'child' instance level when
'unevaluatedProperties' is evaluated, it can't see the parent schema
with the $ref. So any property in schema.yaml won't be taken into
account. Instead, we have to do something like this:

parent:
  $ref: schema.yaml#/parent
  properties:
    child:
      $ref: schema.yaml#/child
      unevaluatedProperties: false

So we're going to need a $ref for every ports, port, and endpoint
node. Or just allow extra properties.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
