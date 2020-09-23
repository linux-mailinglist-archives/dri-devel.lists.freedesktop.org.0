Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B23274E51
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 03:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44216E0B8;
	Wed, 23 Sep 2020 01:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01F86E0B8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 01:28:06 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id x18so16803393ila.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 18:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QS25WlOeUPQHrCUw0cdos8+dV1aU1kXgtHvYAn4oQeE=;
 b=q41RsEWhtCX+XFh9RQF6Q/Rudzyg8vdNbZAP3/H6bqqI03Nkd6v5MFE1LVQA0yEHOI
 KiFd8ex9OqMqNFPgxyu2oxchYao1bHLDetBUFnlYaqWXvxMhtcGxCNX7FUn91zpV6doa
 VEy7isCTpyulwO0T8C50LfHbErfwjnsS3H4AjcL6mx+nq+N1bai4ud0G4QFI7OqxLZng
 uFOPmX+AggOlo3ZptLW7ifY7MOwHw2ZRpc6aoHW5Cp6LSqcxSURS35/BAfdS3uQaFgwk
 vhjqr+w0orjOKcZ8pINLvLfOsINSfqVaTSCnPSaYYif1infAuByih9lhQ4ar8UMW4HSu
 XvGg==
X-Gm-Message-State: AOAM532VhyIGZX8F0FulkXuCZ5KNOx8SPlZtKVBogb/SoTsovAxPGxI+
 FFvBlkhX7PgfqzW2C7XGbQ==
X-Google-Smtp-Source: ABdhPJyDq6KsxVdqb84529uluzCnDBXafHIUSIQRG2lkorieEL37IUfKunEyKovQlRGvCFWv3dY7UA==
X-Received: by 2002:a92:dd8a:: with SMTP id g10mr4971211iln.125.1600824486322; 
 Tue, 22 Sep 2020 18:28:06 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 64sm8414847iob.36.2020.09.22.18.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 18:28:05 -0700 (PDT)
Received: (nullmailer pid 3655638 invoked by uid 1000);
 Wed, 23 Sep 2020 01:28:04 -0000
Date: Tue, 22 Sep 2020 19:28:04 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add Shanghai Top
 Display Optolelectronics vendor prefix
Message-ID: <20200923012804.GA3655566@bogus>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
 <20200915121912.4347-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915121912.4347-2-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Sep 2020 14:19:09 +0200, Neil Armstrong wrote:
> Shanghai Top Display Optolelectronics Co., Ltd  is a display manufacturer
> from Shanghai.
> Web site of the company: http://www.shtdo.com/
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
