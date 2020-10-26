Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EAF29889B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114B86E886;
	Mon, 26 Oct 2020 08:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4E86E886
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 08:40:36 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id w25so8402216edx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 01:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fPY3YUMaHx0SYLGgmZyNAyMNlSCq8nr0Au+mUxZwASo=;
 b=pkcgVph4uFMy0e7bwXGh8/V6zimtvger1c1l0kYpJ6r5r6rqNCEBt+DWHgNRaBjiF3
 PYDwJxyfqpvARN7LnfDxrOWkODcO/tIcOiCVX7k0lji7qU/WcV1o5nj5Rnjsb/J7DrKP
 FAeQJKyGqpKNmz2wXTdfrZ9/s4xcnBiDTeD7qvSifkHLWszr+IS0j8/rppGxCHTkTfDs
 /iIMm+WUrnTdPNdwDzv26RdSvyR9t97TguuilstxltbrGUjEI7relOjbneLBeZJ9wSrg
 JA+UBYg7EyMWpRO/VM8I0s8XVYyh48eGDKWSdheIBe3/gJmktBJmTWZWtx3s2KTZN384
 6nCQ==
X-Gm-Message-State: AOAM5335VsW1XvHhGwU/AQEGzcyHKFktpv9pQssIowZ0ZcQDSNFhSH6C
 vMrv2ay9iX29Ge5+DbDZsUE=
X-Google-Smtp-Source: ABdhPJzMNFAPm/G/FPe2T5GfoWx+hZWCWuIsNulsXqm9QWpIwDSzI0aXCpKKCmaS2zzfu6KxDgxn0A==
X-Received: by 2002:a50:8f61:: with SMTP id 88mr14969192edy.175.1603701634845; 
 Mon, 26 Oct 2020 01:40:34 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id u10sm5306057ejh.54.2020.10.26.01.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 01:40:33 -0700 (PDT)
Date: Mon, 26 Oct 2020 09:40:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: More whitespace clean-ups in schema files
Message-ID: <20201026084031.GA7466@kozik-lap>
References: <20201023192258.3126047-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023192258.3126047-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 02:22:58PM -0500, Rob Herring wrote:
> Clean-up incorrect indentation, extra spaces, and missing EOF newline in
> schema files. Most of the clean-ups are for list indentation which
> should always be 2 spaces more than the preceding keyword.
> 
> Found with yamllint (now integrated into the checks).
> 
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
