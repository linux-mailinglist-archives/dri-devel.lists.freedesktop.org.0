Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMG6BGP4eGnYuAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 18:39:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725C698901
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 18:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F51210E59A;
	Tue, 27 Jan 2026 17:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k8RyZ6Jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8642710E59A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 17:39:42 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so3656838f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769535581; x=1770140381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=syfA3BkKAIe5vn02Wihs7fQFdQwNkyJZbjNriJ6lerQ=;
 b=k8RyZ6JxLnvDENxO6+eXiqSZDWL9ydRA6lsx5z2mWl70FOpWYL462TJKMBhbXzpmtW
 sIJXbB9FDMhu2ueCMeuIUiLCrg0+WcZ9fK1u1VwP93noCXcGWDpliynPYApZHnq+f4HC
 7Ox5IfwC0JkcArXg0BWZEd7UuytUZuU8NXNmPTV3h2AmOLR30DJ90l6DpOjEzoqvbPwg
 HS+1jUT/6la7mBs/c4zk5GoTxqbNEOr1tVsiGIxzy1/pDnaOrb9DLBs837mRGLZ7K/qo
 jdE5rlUxAZx2SF9oD/aSV00z482L4znWw3M6feroaO5kMBOXT0wTG+LmlIaOCNuYTNV3
 Knuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769535581; x=1770140381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=syfA3BkKAIe5vn02Wihs7fQFdQwNkyJZbjNriJ6lerQ=;
 b=xRxcicoZzJCm2vVbG9VsnoVDGHb6aLOmAe5IQdgrioEQqb4PQp4bmntBkPAf3cqrCi
 HGm/9i524HRF60tNuO4Y5c9gUuslB/jZWo0HrOxxfU+gETK1+ho9+ATyxo20+CYDvr1t
 Cap6g7n0neqceGKx+Qtbx+EWgEF7raQPVxb5LPs8tvDjld546LLcI0/3rW3BjFRVCfT+
 ApH5DEr2MT2pjmmEyoPbCLQr5WR1kWwMfI7J6uisyzSUGV5u2k2/HQYjCweUV8pGaKIS
 hZsKs5rcFlfYMUdGu7jqMqQ7fxvT07aRaitcRc9HoC2bvv5Y+lSrOroRhaZN7I9cRTY2
 hhig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ/8tj7VZEeulfqquXoBSZdI9ES3eTFrsYZIchiz2h7G/KZWksjH4F8SDri2Hw4pUBJ5gjXAHHKCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbmOIzn22xBYV8eRZRFOmq2FcbuM3a5/5IAd5G4ivcYmg0VLKK
 ManJx566r4RFv4WklELtOVhqnN7EKvl42A5HMOWFwaXDzSwM2NiODSe1
X-Gm-Gg: AZuq6aJNMU60jsl0b05sxMcEQ9dNpdCV6kg/qvZF6ztb/xSGWQLjzI20kX9YNNsJ9YE
 6n8fWxPcIyDKGLssUUdE8KnPd/PotJ7o0w21LAJeR7aJIO27Ar/VN5DwgYGrMjAfyGMOrjOxa1h
 iSLP3B9i80b4AUGY4k1pY2hIknTgd86bXme/szOCNcEWF05iEeNda2FhNZcRuKsJFA3Ho0cDfVe
 Nd9WeQExxMhw4sBVp9Q4ivaSqiV09UcTcyrKenf3GgztADQZ9eaBa/teyNIXGC2ilu4A3yDllsa
 VerRhwk01a6PPchb3sbLR9/b+XG2JrrkMtzc8D8n/Agv6+rBItyajytaFp2uV9lRnSf0f03WDOL
 W7PS/V+O/088OzCWzudihN5WsVU8bKRlQeRLTbl+nWmZAB8DhGYY5o4N522ZIqdVm8agFj7jmZc
 BfCZkcWVmTaVkQ2rs2u8rpRk17VGSid2WK6DCNg8CMuU+K4bDyqBZE
X-Received: by 2002:a5d:5f88:0:b0:435:a647:a3c3 with SMTP id
 ffacd0b85a97d-435dd073c0fmr3746612f8f.23.1769535580531; 
 Tue, 27 Jan 2026 09:39:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e132356dsm335609f8f.33.2026.01.27.09.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 09:39:40 -0800 (PST)
Date: Tue, 27 Jan 2026 17:39:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, Heiko
 =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, Robert Mader <robert.mader@collabora.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, "=?UTF-8?B?TsOtY29sYXM=?= F. R. A.
 Prado" <nfraprado@collabora.com>, Diederik de Haas
 <diederik@cknow-tech.com>
Subject: Re: [PATCH v5 1/4] uapi: Provide DIV_ROUND_CLOSEST()
Message-ID: <20260127173938.314d922c@pumpkin>
In-Reply-To: <aXjNyHaJDHoCPRJO@smile.fi.intel.com>
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
 <20260127-rk3588-bgcolor-v5-1-b25aa8613211@collabora.com>
 <baf075b2370a13cddd597a3d421b5f39290d87a4@intel.com>
 <aXjNyHaJDHoCPRJO@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:jani.nikula@linux.intel.com,m:cristian.ciocaltea@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:nfraprado@collabora.com,m:diederik@cknow-tech.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,collabora.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,cknow-tech.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 725C698901
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 16:38:00 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Tue, Jan 27, 2026 at 03:58:13PM +0200, Jani Nikula wrote:
> > On Tue, 27 Jan 2026, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:  
> > > Currently DIV_ROUND_CLOSEST() is only available for the kernel via
> > > include/linux/math.h.
> > >
> > > Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST() as
> > > a common definition in uapi.
> > >
> > > Additionally, ensure it allows building ISO C applications by switching
> > > from the 'typeof' GNU extension to the ISO-friendly __typeof__.  
> > 
> > I am not convinced that it's a good idea to make the implementation of
> > kernel DIV_ROUND_CLOSEST() part of the kernel UAPI, which is what this
> > change effectively does.
> > 
> > I'd at least like to get an ack from Andy Shevchenko first (Cc'd).  
> 
> Thanks for Cc'ing me!
> 
> So, the history of the DIV_ROUND_UP() to appear in UAPI is a response to
> the ethtool change that missed the fact that this was a kernel internal macro.
> Giving a precedent there is no technical issues to add DIV_ROUND_CLOSEST()
> to UAPI as proposed. Main question here is: Does DRM headers in question
> (that are going to use it) really need this?

My 2c...

And is it actually going to 'clean compile' in userspace?
The tests for x < 0 are very likely to generate warnings when x
is unsigned.
It is hard to avoid those in the kernel build, never mind some 'random'
userspace build.

I'd have thought that the only reason for any of the kernel defines 'leaking'
into the uapi headers is that they are used in other uapi headers for
constants that programs need to use.

It isn't as though it isn't hard to write something that will 'do the job'
and in a place where the definition will be found while reading the sources.
Even just 'hiding' the definitions the kernel itself uses in the uapi
headers doesn't really help anyone.

	David



