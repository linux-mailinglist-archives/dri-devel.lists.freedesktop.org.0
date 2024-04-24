Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9048B0AB2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 15:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34ED510FED2;
	Wed, 24 Apr 2024 13:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P4V96OJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439BE10FED2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 13:20:34 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41aa15ae26dso18908195e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713964832; x=1714569632; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2TyuW/9e9KLJDEWEaZausa76J+1CE2fdIpzJjL72yaU=;
 b=P4V96OJJFT23VRLx9usAdxqgw7laTBx4rutEH5MHNzqfeaTJbc57vepZNsgV19MuJa
 09nw53cge7v84FkkuFoVuXpc1Jap9m2GEJIo0WSrOYxsUUnXScccTxrfbKCa5RpHHtah
 DUVBbR54EtuNJMCyHf+OmI1VHDe9/FC0/iIJQjMJO+byWsPaHtHbjvwv+dMYGEE8FpmS
 3S+GHGAsHKkEzBf4zdd4NOFJOonrPIqyg41rZaXvqK7sP5fMVzgU+IPOGPQa4fGYqq7/
 c1u8KvgnJ9hUvQ0ldffZR+Bvi0PGwnwK6OsKzWYXK2aK2Y9iOtcQNRNYz89eyKWGqiTP
 BCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713964832; x=1714569632;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2TyuW/9e9KLJDEWEaZausa76J+1CE2fdIpzJjL72yaU=;
 b=NrwmpHwfy4tmA+AQhUbT+GUutvjjBTFw5wwUdgnUMsmCqRkYmdH6qxlE4Zwxbb34r4
 7/tUQzD32W8cnQ+4/wqp9mRnZQ6bUfDiNBjCy9WYC1rqrKS7mdEH3+nrbZPxZ+B2MtF1
 02iVHANg/1dsOMrl0U6Dh/rk+ku8B1RT9T/5IFAC7BhMTygksNJEwu0Gy+0JZ4OuV3Wv
 g4Jqe2Ims/Gy1EXIDESNeJOWjKlPdXfvvho4pzkfWp5D8+ki5W4sLL7XlOUxqQ/aPR6S
 7GphMRV2DWPSxYCmNY2yPjZfV9l8nzRw0OIKanSho3N9sf+PNfE0NnxsdPDKybzxdmzB
 AtBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULeO7G09FgzQrvodfCsMK95VXjHIDt9+G4T5GkACznqxjxh3UA+anGIgQ6Msvs4ZZ/bHL70XQFes3Qb4KkjsvD+F7bVqWdbeyvWx9Ujyso
X-Gm-Message-State: AOJu0Yzg+1AeOI9C0DqCU7k7t3P2cJDDuYEb6yJqn7pz7z4lK80yh4Wd
 r0zLXmRYavVVO24ja2TNTtTD1DHo1CFdtQpb6nMeJVlnss14CCipz1la96Wndww=
X-Google-Smtp-Source: AGHT+IEqx+6Q5HPT/226uSYOEj4gagY8/ay6pqBgEdYUwvp1rFV97+gPRI8UX0jMy33YgTglYnf6VA==
X-Received: by 2002:adf:ec49:0:b0:34b:e79:2677 with SMTP id
 w9-20020adfec49000000b0034b0e792677mr1820503wrn.63.1713964832050; 
 Wed, 24 Apr 2024 06:20:32 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 e37-20020a5d5965000000b0034a44c615ddsm15180075wri.88.2024.04.24.06.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 06:20:31 -0700 (PDT)
Date: Wed, 24 Apr 2024 16:20:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alvin Lee <alvin.lee2@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Jun Lei <jun.lei@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/amd/display: re-indent dc_power_down_on_boot()
Message-ID: <4a996c51-e101-47a0-8a89-78c6f9f01e0f@moroto.mountain>
References: <e5f538ab-ebc8-400b-8104-4642b8089b4f@moroto.mountain>
 <bbc315ed-3482-4abb-b3f6-88c335dcf9d2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbc315ed-3482-4abb-b3f6-88c335dcf9d2@amd.com>
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

On Wed, Apr 24, 2024 at 03:11:08PM +0200, Christian König wrote:
> Am 24.04.24 um 13:41 schrieb Dan Carpenter:
> > These lines are indented too far.  Clean the whitespace.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/gpu/drm/amd/display/dc/core/dc.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > index 8eefba757da4..f64d7229eb6c 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > @@ -5043,11 +5043,10 @@ void dc_interrupt_ack(struct dc *dc, enum dc_irq_source src)
> >   void dc_power_down_on_boot(struct dc *dc)
> >   {
> >   	if (dc->ctx->dce_environment != DCE_ENV_VIRTUAL_HW &&
> > -			dc->hwss.power_down_on_boot) {
> > -
> > -			if (dc->caps.ips_support)
> > -				dc_exit_ips_for_hw_access(dc);
> > +	    dc->hwss.power_down_on_boot) {
> > +		if (dc->caps.ips_support)
> > +			dc_exit_ips_for_hw_access(dc);
> 
> Well while at it can't the two ifs be merged here?
> 
> (I don't know this code to well, but it looks like it).
> 

I'm sorry, I don't see what you're saying.

I probably should have deleted the other blank line as well, though.
It introduces a checkpatch.pl --strict warning.

regards,
dan carpenter

