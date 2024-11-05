Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07849BD011
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 16:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093CB10E054;
	Tue,  5 Nov 2024 15:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Vaw5mmzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97C710E054
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 15:08:40 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-37d49ffaba6so3793792f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 07:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1730819319; x=1731424119; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OUxCkirX3fcz8EKMiWH4Usqr8T0fYPFHcyJ7GQ4yEOw=;
 b=Vaw5mmzr3KiSFP6+jFVlSREbm9FbjqfmnRKuT2i4YbWQbfZvXTUZ8M9sbgeJDReTsS
 dPZARj1IrctHj3P7JEhAaQvvgPoY4g1HqjhBV3R5s5rZRvEaf8jhCSk6sQ8XE+sX58sS
 CYkWq+J1n9T72JX1CSo4fTsaTboe6x+GN0Rwo5IgjT9SqxVgiyB8T4VkS3nyXHfbQsOe
 sulZpiSLIQeGrom7ZHpjWcEwjKwk3W66lZ3YW0GMk6fgi40MdQ0beSkQLrYTvWsITho+
 zyArxytmIkSDfrvXo3GHzZpqf+78xzvlYt1DEKGwyQprExKT9dxZS7qQX+UH5CmnW+mw
 UJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730819319; x=1731424119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OUxCkirX3fcz8EKMiWH4Usqr8T0fYPFHcyJ7GQ4yEOw=;
 b=cWQB8l2Ji5i0kbO8ldYn505qYhf3w0tDO5UymtvD8+G0Xs/wkNwTabOPMzrgU+nPRF
 sPlCiRceJn1Edk2rOPSSmU3ywxQBJ32Ng5Ac13yxCTIQT7x+il8qPQIOTMMt6xDIOEZN
 Uo7yiFa9vtWkHJbKVx7iUW77fRlVhdpZLukBld1XbquFTMfvFOSmx7sMpBrlrTGlcMiG
 x+UAfOkfzKzL24w2m6DcXX8cwU1j6V152ZLuM7/g387IQ6tgQPgXEFtPxWxQ9pK6y/oK
 pmNNJJYF7GFj1AfPqsYWt8JlrUxu4KHQgMBOlV941YYEcsiL1GiyFj3ECEhYRtvmRw1V
 GoqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOQ6X5eyW25ndan/R7M9wZ3LqtbenQ8uhxJoNZcojFOgOUqjwpZWnbXm3kcFZX2Sjro3JCeCutE9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUnMYVsCqLIv0EdiIlcY3+ZbHM1dtm63yuaMzSPv8Ay224jSJc
 mf9PjYKq6ifMs7lbnXQYn/bfZ0AwLJksojO3MZYBeAfygvTGFVbtMw5G87MOrLo=
X-Google-Smtp-Source: AGHT+IEVGh0YDr33UgdsOxz1TsfADySCUretSIOquT5nwmqrcEyxhuoOfsNUsaAlQ8eDwQ4WBC2qnw==
X-Received: by 2002:adf:ee4d:0:b0:37d:45f0:b33 with SMTP id
 ffacd0b85a97d-381b7056d6amr18907652f8f.9.1730819318758; 
 Tue, 05 Nov 2024 07:08:38 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e74casm16378570f8f.65.2024.11.05.07.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 07:08:38 -0800 (PST)
Date: Tue, 5 Nov 2024 16:08:36 +0100
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] drm/log: Implement suspend/resume
Message-ID: <Zyo09KEPSijfoYL4@pathway.suse.cz>
References: <20241105125109.226866-1-jfalempe@redhat.com>
 <20241105125109.226866-6-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105125109.226866-6-jfalempe@redhat.com>
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

On Tue 2024-11-05 13:42:25, Jocelyn Falempe wrote:
> Normally the console is already suspended when the graphic driver
> suspend callback is called, but if the parameter no_console_suspend
> is set, it might still be active.
> So call console_stop()/console_start() in the suspend/resume
> callbacks, to make sure it won't try to write to the framebuffer
> while the graphic driver is suspended.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Just to make it clear that I agree with this approach
for this patchset:

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am not going to review the rest of the patchset. I believe
    that John did a good job.

    I actually made a quick look at the 2nd patch and the integration
    with the nbcon API looked reasonable. But it was too quick look
    so that my ack would not be much valuable there.
    
