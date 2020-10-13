Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D707928D4F1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 21:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ED06E93C;
	Tue, 13 Oct 2020 19:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D576E93C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 19:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602618556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0ux1xTKPBxfq9RjQgexlsC3i9yhXD4P12rrGU6ncZQ=;
 b=C+9RmjIYXHXqlouXKyhljoxHCMcI/ebP0pB6WBBD1k5AWGp6Zw0Ph/cYB5MPGIHrA+9O1Z
 wNRTCYQ2YOb1pWQNJ/ynrFTLllzO+6Tu3xdCwGr43lPr5n8kI4S2FmJ7YRFmU58ttXhyTb
 hserdyfqjbg7/rk8zUw0+3reJ+tGlkM=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149--3bK2S8sOrGx-AdK54QCGQ-1; Tue, 13 Oct 2020 15:49:14 -0400
X-MC-Unique: -3bK2S8sOrGx-AdK54QCGQ-1
Received: by mail-il1-f198.google.com with SMTP id y62so700079ilk.20
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 12:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=f0ux1xTKPBxfq9RjQgexlsC3i9yhXD4P12rrGU6ncZQ=;
 b=pGeYxnmcV41ukpeskM0s98kYEhpXo+m+G89wAin2DyC/ZVW25Zny8QYkLmm09JK7Ir
 4w6kzzj2+uQJuHmRBrQ4sxLPdLjbuoWQ4URiq1Qh9tVYHJ2M0hxZEFGHge4DJgInqofm
 1yM7trtQz4zdOfiVpmh+Pfw/2HV+eASEJOjOj/5sm/1QnqFCniOqatUvgMh4xZYsAaiW
 WHcLrDThfivcco5o4RiDcIlAKRq9ywyd6hHtveMqCaTvfTGTooOCPY81uusYlGfv8H6l
 p5+6OIvAor5oHtUWjQrVvpDhCwe9HaI45HwUP67j9ZbNCECFapjfWTBQP/MFbjX45jck
 mrtQ==
X-Gm-Message-State: AOAM533O/6olOoT/OhOapXwJDjz8OZebeixBuPkcyKAteckks5tYULeO
 mORkI3Y7dC7LZkE5ml2a2gawpnNnrGmwHYLj5wSmYlqpZDX3qAgpMfh/Tk86YMvFQyOp48uqQR2
 ymzOAdZ1XvSX+QKO3yMlN1s1mGTAV
X-Received: by 2002:a5d:904d:: with SMTP id v13mr367269ioq.116.1602618554060; 
 Tue, 13 Oct 2020 12:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDqfEEfyJyMyCoWRznA9va/mq9ExgxhqBZ33Zi9msVGip30Bel4moaxsKIohV04qcw3BC6lA==
X-Received: by 2002:a5d:904d:: with SMTP id v13mr367264ioq.116.1602618553871; 
 Tue, 13 Oct 2020 12:49:13 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id p12sm873496ili.14.2020.10.13.12.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 12:49:13 -0700 (PDT)
Message-ID: <b7c9b5ddc2bdd5d1a0bb5a000d88681ad0b6fabe.camel@redhat.com>
Subject: Re: [PATCH v2 12/24] drm/dp: fix a kernel-doc issue at drm_edid.c
From: Lyude Paul <lyude@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Date: Tue, 13 Oct 2020 15:49:11 -0400
In-Reply-To: <96d648f86024535e5f7d5b0caf8ebf93c7f8eaab.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
 <96d648f86024535e5f7d5b0caf8ebf93c7f8eaab.1602590106.git.mchehab+huawei@kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

wait, I think there's some confusion here. these patches have already been
pushed


On Tue, 2020-10-13 at 14:14 +0200, Mauro Carvalho Chehab wrote:
> The name of the argument is different, causing those warnings:
> 
> 	./drivers/gpu/drm/drm_edid.c:3754: warning: Function parameter or member
> 'video_code' not described in 'drm_display_mode_from_cea_vic'
> 	./drivers/gpu/drm/drm_edid.c:3754: warning: Excess function parameter
> 'vic' description in 'drm_display_mode_from_cea_vic'
> 
> Fixes: 7af655bce275 ("drm/dp: Add drm_dp_downstream_mode()")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index a82f37d44258..631125b46e04 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3741,7 +3741,7 @@ drm_add_cmdb_modes(struct drm_connector *connector, u8
> svd)
>  /**
>   * drm_display_mode_from_cea_vic() - return a mode for CEA VIC
>   * @dev: DRM device
> - * @vic: CEA VIC of the mode
> + * @video_code: CEA VIC of the mode
>   *
>   * Creates a new mode matching the specified CEA VIC.
>   *
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
