Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IF//FzXkemn5/AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 05:38:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA9FABB50
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 05:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D44E10E7C3;
	Thu, 29 Jan 2026 04:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="USNDVzpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E4E10E7C4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 04:38:09 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-c62239decbeso237139a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 20:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769661488; x=1770266288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtQGOuC29uzt/6xaJHUti83+eOwCdLjkcvzsqNsGu6w=;
 b=USNDVzpi/NMuc4WTVKvX34yX6KxaKMPv456dt/vyTHVVT6nxo2XrrHGxCWLNjxAbRi
 lYqExVzkvjtk74tLsUMlF8c7Mi1vpuMHsTQ9I08zXjvkLol+2bLL0fUtbEVPNqTvXadF
 Hg2Hw8suq+WKq9UtgbJi1O1YYXR2iayZ6xxrQ5SeFso7bsoOcJ3b1o/j3Xj8iXDBj+mB
 uUXX0FK1vC8WAT3xtorZoJ9skrv66i4Fua0AiWZQFYxLC7gCNLTeDQjp2UKnN2HEo47v
 U3maa+ySJV5yNzK93F4pDjilJi2csYHEFBlKWzyXP/TD90nDyQdF7Mn+3L0/MtAJANfu
 fJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769661488; x=1770266288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NtQGOuC29uzt/6xaJHUti83+eOwCdLjkcvzsqNsGu6w=;
 b=a3JMfu1sadiSUZDT6PNQmGmL4MDLYdMd++3AykOSuXBlyT2H1Pr7OMT8cSUnDgZk6W
 0h4XTPFnNGNHXlgqBeYrC9sR8OPAmt+Lh1EtW1g/hL9WyYORVWI7kQ1+kWvfZTjRYkGZ
 IrMtoTws+xTLaWiRTp6+0zZnU9wXxbn55JZbslhf0jNEOxUJvbvK3cpA+3fW1eug56fM
 OEr1tPLgnZDMnPrY07ddO55Bbu59+2ss4izHLJQTuiQjdX1CpiHzW0UJ+B0VCqdQafVp
 9/iQAHNaMgRHQCuK10SRPKiAzporsRwg21LSyR6bX0StNGLLM38Mw/oILarExzdlD2ws
 OHRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjVaJFpQf5chHXfqTWSR4OZcqj3cQusRwBxsjf/hXiUf52xof0Yl5iYAam1NlIWhofDatbdLpRByE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbIBY7fhYOK2DNOPVO/H/KCndFFA2TeDv3yCFc1EH+jQn4IDC8
 2c/ZkD+tzRERZK78eeY/QaQWP+Of7bvBIP0pD+EKt0p0wjE8A1nFHvQ=
X-Gm-Gg: AZuq6aJ/eLq16y4nZ6uuwkE1ggqMaSLtb+0HnTNh+Ag5O/fvCYVA7Xff5m3tY/6YUjs
 vljZV3l2mVgmLOYlQfDzEsGX3Nzrg8mAYMcWA880wPv9KMWk36tLwCy/MkCg/VFawmcoguczaao
 +AUFpGpSt7/WEFCS2e3cQvdFsPpxZJHOk7922vdtaPn+WC3ElIna3QgHiiJguxWbWp71A+IUZow
 QEV8/oRrI1t7J5zUFwHQQfyOYFas04AGdtFxT/O+ygzrGNlwCeYH6dNRdSGYvEVlA1poJasLbC7
 l8Gdt5g20QU46EAOdYaCx/CIZ0Y5UX5C3xIizTKHLHe47ukxV6HzR7LGzoBrSTZUKFTpv4oBdPK
 cbShpqeyH9c2WHfLKquj0o6276PUtbVayAIikVBVUFV3DJEm7tF6pvSkCc7ID30osXJfgBHSJ9H
 oAvWYuppmtyhS0
X-Received: by 2002:a05:6a20:2d26:b0:38b:e430:156f with SMTP id
 adf61e73a8af0-38ec62c6411mr6930473637.20.1769661488418; 
 Wed, 28 Jan 2026 20:38:08 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6427e9ce21sm3595710a12.10.2026.01.28.20.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 20:38:08 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: airlied@gmail.com, ardb@kernel.org, atharvatiwarilinuxdev@gmail.com,
 bp@alien8.de, dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple
 devices
Date: Thu, 29 Jan 2026 04:37:59 +0000
Message-ID: <20260129043759.1220-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXovFQsk-w90wZi1@wunner.de>
References: <aXovFQsk-w90wZi1@wunner.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,alien8.de,lists.freedesktop.org,linux.intel.com,redhat.com,vger.kernel.org,intel.com,ffwll.ch,ursulin.net,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:airlied@gmail.com,m:ardb@kernel.org,m:atharvatiwarilinuxdev@gmail.com,m:bp@alien8.de,m:francescopompo2@gmail.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:jani.nikula@linux.intel.com,m:javierm@redhat.com,m:joonas.lahtinen@linux.intel.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lszubowi@redhat.com,m:rodrigo.vivi@intel.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:tzimmermann@suse.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EFA9FABB50
X-Rspamd-Action: no action

> As discussed previously, your patch will regress older MacBook Airs
> which use SPI to access keyboard + trackpad if the set_os protocol
> is invoked:
> 
> https://lore.kernel.org/all/ZoJPgSlZJ3ZlU2zL@wunner.de/
> 
> The last time this topic came up, I suggested counting the number of
> GPUs instead of using the DMI quirk.  I even provided a patch but
> nobody with an eGPU bothered to test it, so the thread fizzled out:
> 
> https://lore.kernel.org/all/Z6paeFrjdv7L3mtv@wunner.de/
> 
> Maybe you could give it a spin and verify if it fixes the issue for you?

I tested your patch, and well it works (you still need the 2nd patch to 
avoid a blank screen), but i can see how this will fail
like for example, with the iMacPro (only has dGPU) you would need 2 eGPUs
to turn on apple-set-os.

My opinion is, we disable apple-set-os using a dmi check on the 2013/2014
MacbookAir models.
