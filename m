Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7795358EF8B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 17:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF7118B18F;
	Wed, 10 Aug 2022 15:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF12F14AAC7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 15:42:34 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id p9so7247916ilq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 08:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=lkS5zvLcljQjnjjOHPAoy1vsRnFJ0Grs3H/nJs4gz4c=;
 b=wq5wLpGiAQNDeM8oylo+6Xy7oDD7gioFbkloSmIUfFBsHlmbVMx4JfQ10+SnT5/TD8
 pxaZYXE74wmMi1eWQ+x3qAxXIuDQBxMZWABLYd/0r/F/Ab7PGWZgxVa3rX9RwKkHpW4+
 aE21ejPb9bvB4LmTFqUp0lPZzCY9hlQuasW/BhAKeUgXI6LPRA4Dld74BhcFcWBa/nF8
 1SSV+Zy5coNz8ESK8JjJRwDfcoyOMU84q4LmZpqHh6I4GbS1zkB3bs+gyDtKXXvsaiZ7
 QjXrAh97e3360paZJIQdTvdlSBK+BwK3EWJXj86ovi0hP5TyB0MC5qMXY2R7Cxr0eRI2
 RRxQ==
X-Gm-Message-State: ACgBeo2fNp1VoZT0iBDezN+Adklq3r6tOh5BxaPxMppk+ftWPWEwk/Vw
 0cmJKkTDhcwjycl5mVlh0Q==
X-Google-Smtp-Source: AA6agR766L+G/DmfEJHQx2uTOkZHXshafK1MLBI/ihgSqeChJYk2oM42hj/91O0+xfMGZMhZBO1LZg==
X-Received: by 2002:a92:c501:0:b0:2de:69e6:4143 with SMTP id
 r1-20020a92c501000000b002de69e64143mr13569520ilg.262.1660146153460; 
 Wed, 10 Aug 2022 08:42:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a02b017000000b003427daba276sm887045jah.129.2022.08.10.08.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:42:32 -0700 (PDT)
Received: (nullmailer pid 17851 invoked by uid 1000);
 Wed, 10 Aug 2022 15:42:31 -0000
Date: Wed, 10 Aug 2022 09:42:31 -0600
From: Rob Herring <robh@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: panel-simple-dsi: add Tianma
 TL057FVXP01
Message-ID: <20220810154231.GA17369-robh@kernel.org>
References: <20220810041354.691896-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810041354.691896-1-julianbraha@gmail.com>
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
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Aug 2022 00:13:53 -0400, Julian Braha wrote:
> Adds the bindings for the Tianma TL057FVXP01 DSI panel,
> found on the Motorola Moto G6.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
> v4:
> Fixed makefile entry.
> 
> v3:
> Fixed kconfig dependencies.
> 
> v2:
> Fixed accidental whitespace deletion.
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

