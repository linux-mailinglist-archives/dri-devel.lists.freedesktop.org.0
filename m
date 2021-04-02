Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B349352B51
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 16:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7536E09E;
	Fri,  2 Apr 2021 14:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27306E09E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617374160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbSLew8mhA3CPW9rGzb5rYU5719GfEykfUChPKVn5Jw=;
 b=Vs2Thb2G4NzVVECVXlLQOKLuQLJjen8lK77nJRzIzBDyngFkv1QUegmJftuMrK7k2mT2EA
 ULEXnv9c4tQD1Hhr1BTtgy0oaeboJnL8EL362j0l6TPfKDE6LOnHUmFg13i6OnxuIzuTPr
 FA7wIRJgesdlKbPed9sH7TsdlXP68a8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-uCoVUS8zP8i2Jdc7m4fKCA-1; Fri, 02 Apr 2021 10:35:57 -0400
X-MC-Unique: uCoVUS8zP8i2Jdc7m4fKCA-1
Received: by mail-qk1-f199.google.com with SMTP id h134so5885404qke.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 07:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dbSLew8mhA3CPW9rGzb5rYU5719GfEykfUChPKVn5Jw=;
 b=O0Of6XGI5+hYnR+1xD+BwmxqAi54O7MFUIHYrlZxWbzWkVnms4UC43Ua1FPoRpnnqn
 sUxGieWr/DKPsVBx5omz9yPQZgdJ4bQXfFsRYeppYv5CGcbXFuLv2EGIlnsRmrmpoo7G
 q8xKterAuXny5lUMmSxXnCP5e6abDxt6HTEew7q7AYN9I16bdnGourpIkqQJUIbfOyaq
 fiMHmxwWQuT618KMOPzVv7EZY6+KwbVYy7VLVYyRKHlGmYk0/djmXAfQXWaGvRT8N+1m
 cj/SeEUhV7dMRCY6qmNLyApzSlV1lWIoyCzURa1KoIiRx0E+UvPDsh3gOCApxn8ZxjD2
 jt/Q==
X-Gm-Message-State: AOAM530xZAhedJC9YZk/cxK6Qjq7XBbLOV89+5kyX+Ybmm/cETSOGOGP
 p0hGaJcbnaDCm7uJZyjycQbz/5WeHM1z4fjr2R9NM+ZKPyWdQsogYpb4nAGrAIDN/meO0rPBF57
 D8f5WyV7yvn9nxwnXBI7KYTMBfu0R
X-Received: by 2002:a37:615:: with SMTP id 21mr13401251qkg.421.1617374157169; 
 Fri, 02 Apr 2021 07:35:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2JYxQhsnq8GXwaJBpbPQ9qEbMufMffGDiB8BqHyePDcCzZbxxbZ8pdHCByvdi8v+81NIOKw==
X-Received: by 2002:a37:615:: with SMTP id 21mr13401229qkg.421.1617374156960; 
 Fri, 02 Apr 2021 07:35:56 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id g17sm6488596qts.93.2021.04.02.07.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 07:35:56 -0700 (PDT)
Subject: Re: [PATCH RFC 0/3] Adds support to allow the bitstream configuration
 from pre-allocated dma-buffer
To: Nava kishore Manne <nava.manne@xilinx.com>, mdf@kernel.org,
 robh+dt@kernel.org, michal.simek@xilinx.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, linux-fpga@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 git@xilinx.com
References: <20210402090933.32276-1-nava.manne@xilinx.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <979ebb17-bc76-e0ef-10b4-996edc12dfa3@redhat.com>
Date: Fri, 2 Apr 2021 07:35:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210402090933.32276-1-nava.manne@xilinx.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please add to this patch cover letter what you want to discuss.

Got this new feature, not sure about ...

Tom

On 4/2/21 2:09 AM, Nava kishore Manne wrote:
> Nava kishore Manne (3):
>   fpga: region: Add fpga-region property 'fpga-config-from-dmabuf'
>   fpga: support loading from a pre-allocated buffer
>   fpga: zynqmp: Use the scatterlist interface
>
>  .../devicetree/bindings/fpga/fpga-region.txt  |   2 +
>  drivers/fpga/fpga-mgr.c                       | 126 +++++++++++++++++-
>  drivers/fpga/of-fpga-region.c                 |   3 +
>  drivers/fpga/zynqmp-fpga.c                    |  35 +++++
>  include/linux/fpga/fpga-mgr.h                 |   6 +-
>  5 files changed, 169 insertions(+), 3 deletions(-)
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
