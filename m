Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686F6725A68
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269F510E497;
	Wed,  7 Jun 2023 09:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4F210E497
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:29:47 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-39aa8256db7so2596682b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686130187; x=1688722187;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OmfrPg999neWX9s3M1zxfSUyWf/prJhvEaWFAiQaaNY=;
 b=IBsaOvK/uVHM3lREN8AMM9yEVo1Xd6I7yfSEz8mue99kPhB/8t8WanbqtRa7i8BdoO
 SWQf6vsygtojPOj0AQmu6SNrkRD3jyKhTGtw383Qvncs+5gDHvpIcuuEa+rVZXny/IPT
 pb8pAhz3frMOZLENbbZpwlXNlDdsHs00knMr8mSIo1EJWbcs/sR4QABohUkd5ZCftzlB
 uVE8fvWsBdjY9Q0TYwu8Gw7iUWZnPxHbKSpa7VOp6QGqAPukdzLzYL0OWbXZIrOOjsk1
 hPbYfFz+4LzkZPOoQnxQPzj6QmXzc124bK+/T2nKG9MHum1FeZNNMkxT4sLFW1+4d9HU
 tE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686130187; x=1688722187;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OmfrPg999neWX9s3M1zxfSUyWf/prJhvEaWFAiQaaNY=;
 b=dh5hAo7mFwFI+bhd/WJW52+rzaxld9qTUzRBS8OyL/VWIAiRJ+7lCqliV+/pxoT6SJ
 2b6mBwwvUHTFqmiNQgbcbRI/J/4isIDDpC+leC8tvwSLmTB5d9jYF6IL2THfkKx9bAru
 TG7sknnSPW337xZ5iacGq0WjgF6T/ljxS3qramW6AsPjT+O1pFfw1WtKRKamb0ULv9sI
 NU+jS8gxSpR4V5DnLljyaXu8+yYoQJD0ahcqLZ4z3teNL2tBxTDhmXZ5S+R2HdqHA3Hg
 DbF2N7ffHMTX0C92yT9iDYfWg0jxhd2/YaBiGuIS69nFm0mvXGsgsuflGfk9O4U0ZNYb
 Mntw==
X-Gm-Message-State: AC+VfDyQmKyyEFzWVPc9nyRlXxoeW8sU1qpjknTUsij1AQogb+6lwYND
 LDLyNPP5wY5NjiWp4IXfBvzhQGvUSpmV67wJirA=
X-Google-Smtp-Source: ACHHUZ7Qk+jpHAzTBaSr66IffeL7iiuj6egRj7ybLFDxSM222reY+UmlAVuzuWXXi32jct9e4nbPBvG5eT/9JeS1goc=
X-Received: by 2002:aca:2b09:0:b0:386:d4f7:6791 with SMTP id
 i9-20020aca2b09000000b00386d4f76791mr4441087oik.37.1686130186597; Wed, 07 Jun
 2023 02:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230606140757.818705-1-pavacic.p@gmail.com>
 <20230606140757.818705-3-pavacic.p@gmail.com>
 <cac57af0-aa0f-0a60-3376-234e1da7f4eb@linaro.org>
In-Reply-To: <cac57af0-aa0f-0a60-3376-234e1da7f4eb@linaro.org>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Wed, 7 Jun 2023 11:29:35 +0200
Message-ID: <CAO9szn3+u_yuWb5y_aQGWA8RhW2=qPVcxcZvGWz8MbHH_DamNg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: panel: add fannal,c3004
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzysztof,

uto, 6. lip 2023. u 16:43 Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> napisao je:
>
> On 06/06/2023 16:07, Paulo Pavacic wrote:
> > Added fannal to vendor-prefixes and dt bindings for Fannal C3004.
> > Fannal C3004 is a 480x800 MIPI DSI Panel which requires
> > DCS initialization sequences with certain delays between certain
> > commands.
> >
> > Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> > ---
> > v4 changelog:
> >   - add spaces between properties
>
> ???

Added empty lines between properties in yml file

>
> I pointed out last incorrect versioning. This is v3, not v4. Or is it v4?

It is v4 of the patch but v3 of the patchset. I wasn't sure whether
somebody would complain if I were to name [patch 2/3] in a patch set
with different version. I will try to edit changelog to match patchset
version.

>
> What about my tag?
>

I have changed in MAINTAINERS file from "+C:
matrix:r/mipi-dsi-bringup:matrix.org" to " +C:
matrix:r/linux-drm:matrix.org". So I wasn't sure whether to add it.
I will add it in future version of the patch.

> What about my comment?
>

I thought you wanted me to have more generalized MAINTAINERS community
URI that's why I have changed it to linux-drm. I will remove community
URI in future version of the patch.

> Best regards,
> Krzysztof
>

Thanks,
Paulo
