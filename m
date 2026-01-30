Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHDlJ7KCfGlwNgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:06:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E34B9276
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314CB10E97A;
	Fri, 30 Jan 2026 10:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="cfn89/8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE4610E97A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 10:06:37 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-88a2fe9e200so18948156d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:06:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769767596; cv=none;
 d=google.com; s=arc-20240605;
 b=Q6ng4m7g7U2JxlFxVkF2ZN4l03tvhJpMFV+ygrXOMRpTI4vrR3jOiADbGu2Jdnr4ca
 Atbroc5Zkta4x0LJIyxKfyocMG2+C8iNKUzxdDFlNWoRVwV8T5SpxGZzqz1vtYJxWTqj
 YBhd7Ca+XQj7IckOxfqTkLmy7vvN9sFTDV4wKXtold7OTIarksbA+TfjQ7KnyTNbgAeU
 qGX8sFDGcQbsBHWiVt03BDtR+AGBiYZ/UQF4BUJG93bNx2d9Yln7kEPhTNgvWDJaye98
 /ifvAwzqItho7Fxwd7dtz9q6/e3nScDLfgMb3BCWpwLhidSRvDFpA4N9GceoH2vTU6aO
 zdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=d/atVvu+mRYrrfkSmM/N2rjvstGdnGlJT4JIZmnh61A=;
 fh=+i5CgmNlYgLi8i/usPjb/TySuKux0mPEH7JhyRlkaMY=;
 b=DKCuyYLw5i2IhoF4jAuwFYRYAv3X16nBh2a4RjNZKPdgAS9VB21HFyt/pw20fuNUhR
 7kkxU92t9zansJNARYbK0afpDv0EDCS/+NTWt9G4HXv0xO2Sf5ihKxQbdgFxYc8odmsb
 G/XsqA/bkgtCnYjl6j5UZlo6d3FgWPBz1FwgoGAq4SSYnfky5UNs5bAr711TrkzXDs8p
 auwqLkQYyEM7vDMe6A5ovnayHrI9ht2bmR9tAiCe7rDziafmnL6kg5Q+jJjnoxIroyYO
 9u5VlIKlF4FuG0e9G/OI1Ou05pfd51MlD+8/0CsvJhDU0tuEqqDxc6SMZXpsW+EqNEQU
 m/DA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1769767596; x=1770372396;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d/atVvu+mRYrrfkSmM/N2rjvstGdnGlJT4JIZmnh61A=;
 b=cfn89/8/R2lsFi2xBc4CWrrG8Q/r0jdQxNiKgK/FwP++cxwVlk5x2ADtWh9z2XyFod
 R/RzkoR57PyyckrXL50gfZctMqJYCFrt2LjDFIlKWTUVdTNz22htO1Iji/5lPXR34zRf
 yJigGDPr1u3YGz2xGwc76/ZzI8n5Wal2TCEx40qIyq482TaFgquK7VevX4TzhevdcxGk
 0apSlCPDCIm3Lwwx8aduI5x7U+UahM29ugy3pAeBa0G4Xu3Od8G5nnLK9OIOyEe1RKQW
 PgKHGpeCYzSpIv9T0ieogAY8X5VdOT8999yUG76+bjBvbn8eq/2JJrrWfR4/Y2vJFIAD
 ehiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769767596; x=1770372396;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/atVvu+mRYrrfkSmM/N2rjvstGdnGlJT4JIZmnh61A=;
 b=f8wJDNFdl+WFl3+kQzAg7eVbg1B+piktg44Cae93X/AvW2KASHkSggULdt2AC+cAeF
 5UIY2GE8+LsiLooF9F+/MrohjIFQ3gYwgS2gQAmSodKG4qg1jXOgCOP/rnH/iVn8Q8xd
 uvS34T2S9Req9VPC5D5H2R8PgKQMQb2CFpkAoZnjL8NSB6RDWLU7nZ03OUhe4c3GiJN+
 KmsPr6jM6DsLAKGkSY8+Y8b8CwI4fZrYHr9NpRUTg6/ac+fGZrhVKVurw6PkxML8Txjz
 gk9CAhnFFeJwzMZiO0ntTLPT/lglaTp0uUPr6+yY0UIMpBwj+g5ANqkllmsW82QUj8O9
 7xbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV65/jGlAmAGmn9mtC7ng5W7NPzgyTT0VxeBWGXhl/j/BUWlQQVjWQf/cVvfkcyEuDRkxCzv3IdE2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNssJLtLrZvIk5ZmAvGPKuLT6jdAeBQTGzYoy9UbeTXSlN8zpY
 ovvFJCxxQXMSHOwUNuECaBgZioMkN+GDHF+SeTr4BIgA9GHTDz8r9vauOlsY/vWwt2wK9x1Bval
 Fhz/8L+dC19NOIbbzCdvrwHAxcaRDf1hxQ3foB4CVnQ==
X-Gm-Gg: AZuq6aJSfFj7+zSwZgRjnRjf7vp23Mgvf3vZiSkV9AkXJZkB1WeJYh7iztOi5v/BjGo
 fwSQcyiWmKgyI2iBnUPl5H53Fw/60J6sx0n/2O2cgsfSRjkwUr2i1e1Jmb9N1xw4qpVIqHK3x22
 VSEseOKI9ERfV5DlAwg7NRVNCIY3nC+UtOWcZolvkjkLkO13msgVGw2k/zg9CDeFz867EU8puQ9
 G8Z2E5VWVSprbn9uSc7S0NLAGCAjoKHZVEm5CKQ5uRjbDh23r1wGqqRBW8jRWQQr/9C0Jbjdudu
 dKU8qg==
X-Received: by 2002:ad4:5de6:0:b0:890:7084:e32 with SMTP id
 6a1803df08f44-894e9f264a8mr25950396d6.9.1769767596651; Fri, 30 Jan 2026
 02:06:36 -0800 (PST)
MIME-Version: 1.0
References: <20260129-dw-hdmi-qp-iframe-v2-0-0157ad05232c@collabora.com>
 <64e48e881353cf81b07707a1ae016bfe@kernel.org>
In-Reply-To: <64e48e881353cf81b07707a1ae016bfe@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Jan 2026 10:06:25 +0000
X-Gm-Features: AZwV_Qi4HPo11hG5XJVDE356rTXHhTrIYczvDtdBhsjPrffHbH1Y6bcJos4A_Yk
Message-ID: <CAPj87rNd-6c8EYALmDQQ0rC8hReRDfXzbP2N4=fPL0aK4j3fzA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Provide HDMI VSI & SPD InfoFrames to DW HDMI QP TX
To: Maxime Ripard <mripard@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 kernel@collabora.com, linux-kernel@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[fooishbar.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:cristian.ciocaltea@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:andrzej.hajda@intel.com,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,lists.freedesktop.org,vger.kernel.org,intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,kernel.org,ffwll.ch,suse.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,fooishbar.org:dkim]
X-Rspamd-Queue-Id: F1E34B9276
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 at 08:43, Maxime Ripard <mripard@kernel.org> wrote:
> On Thu, 29 Jan 2026 14:13:31 +0200, Cristian Ciocaltea wrote:
> > This patch series provides the missing support for sending HDMI
> > Vendor-Specific Infoframes and Source Product Description InfoFrames in
> > dw-hdmi-qp library.
> >
> > Additionally, it improves the existing AVI, DRM and Audio infoframes
> >
> > [ ... ]
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks Maxime (and thanks for all the work on the helpers too!). I've
pushed this to drm-misc-next.

Cheers,
Daniel
