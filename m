Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAhkL7ZqfGn+MQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:24:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E413B84E6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E5810E926;
	Fri, 30 Jan 2026 08:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YQdWQF6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B5210E924
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 08:24:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so1112675f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 00:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769761457; x=1770366257; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kSHfEKQ3xKgmT9AN7R0YJI5063g4zHXX2+tc+T6cmxk=;
 b=YQdWQF6CUwTL19goD85GtvmZIqIOxI7yUfBuPp357Rti5x8grogyC7hiaJBWyd29oo
 mEGABxoW5EblomF/vvIj4cJwxOj4HKi0Ho97fDTHC9pmO4EKPLB7/44T4Og+AuorJMwv
 5VLfHW1y/HIbhe0wKkcz1Iffiw4P/W4WqRqceUkaqinyRVsZyETQ7kp4zkDH/rrOuMbG
 +N6BADZcfxGw0J1kHgQoTxfk6YrepbM334s08zhvIYkNRv1gkkKfe3+VDISe5w9dQ+/k
 24Ck8/NF2ZoisGIhAk3b+JMkudBugu/ukTjxRPw7npnnNdqqCgKV+0ltEa0AVYh+d7kY
 OiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769761457; x=1770366257;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kSHfEKQ3xKgmT9AN7R0YJI5063g4zHXX2+tc+T6cmxk=;
 b=wAXy2HWDJoT5iHhniZ3cYEDOp03/dj1uIksl0MHxkpGoUP55L6syXMm/zNMs6mRQ/M
 3v8jJJUybKo2bgXzj4qzhVzFDwLZ3Alms7/LKSy/Dq9cmkK2mJh/RhZF5SuPyQwYiTf0
 929z+mLNvVqGbeyI7VBoA8MCjefgqxTVLycRydd2fVhkxoJXfpMyLF8El1qOVfxD5s6i
 byJr3BqhUCR38OX4TlDo4R+oecS++sMIcFHeT1vV9Dl/1ZLZ8fibbI9T1q4ak/ae6Oxn
 IpDjiF1j1V1CLuuHAd0jE8FJxTO1uUJp81EiN453Xt0oMlnGHSFfpuRjEYwjBMRV5tET
 XIrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN1zPeHysu/Pnc6ViLaQvWDW4m/24LLSWd1RzTogffMAqXbI9TPVAC7KL65LhIR8+6aWVQjzUSyIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5JVEnuNElAjw2povAl2yZvQp9JBxBziOmqiOIDLF963sMSE8O
 WC6XmQdH/i4L6JSaAFqVZO065ZM08kx31yE0MgEuWG7L0RIi36LOSG/SpOx8gcylFw8=
X-Gm-Gg: AZuq6aIJgsvG6oiYLnMckJJWiIraqVvaeBLCjsm34tdZsp+ZaLSVdWii5GmzfFEA06v
 w/5QYj03e8SflBl/+zDnugBZHlIl6H6jzdkJLID7V6LbBJHFr232TTG8AvmpcwD0JKf4vvXthzw
 PUpdENWW/xKRq09/CKhqH9QjBaD5wWyD1hZG2IW28eqKtaayE6FNRC9Qui2fyvXWFd5TTELq/hb
 bIfLwdcUktDQitTBnqpmqHRx3se1SIfuGDCfeK+AWEdaB2pmuNINRJ9UWSPlvE8BWzg2OWQvMsY
 Cdaqe4AO9yjJpuR/rckKcu139Th59hzVzomCaVpJ5VjOXCgVuVMgBJwWOuJP5UOSbVpaBPvnZsK
 ry+i7o1Rbcl1/EUlhIMzcbVwqHpskFl4OsnyHPrv1wmsQ1ZWnldHLL1A60FsIbaStkcre7GnqFO
 7/VTreexCnLBZXHrwcTTDxwJiiSmc=
X-Received: by 2002:a05:6000:220c:b0:435:8f18:9539 with SMTP id
 ffacd0b85a97d-435f3a6cd84mr3201514f8f.9.1769761456834; 
 Fri, 30 Jan 2026 00:24:16 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354d43sm21835959f8f.43.2026.01.30.00.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 00:24:16 -0800 (PST)
Date: Fri, 30 Jan 2026 11:24:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sunliming <sunliming@linux.dev>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, sean@poorly.run, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <aXxqrD3ZzK_dTAmb@stanley.mountain>
References: <20260129024919.30449-1-sunliming@linux.dev>
 <aXsHSTHHP0eyI-Pk@stanley.mountain>
 <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunliming@linux.dev,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: 6E413B84E6
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:30:35PM +0800, sunliming wrote:
> 
> On 2026/1/29 15:07, Dan Carpenter wrote:
> > On Thu, Jan 29, 2026 at 10:49:19AM +0800,sunliming@linux.dev  wrote:
> > > From: sunliming<sunliming@kylinos.cn>
> > > 
> > > Fix below smatch warnings:
> > > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> > > warn: variable dereferenced before check 'ctx' (see line 159)
> > > 
> > > Reported-by: kernel test robot<lkp@intel.com>
> > > Reported-by: Dan Carpenter<error27@gmail.com>
> > > Closes:https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> > > Signed-off-by: sunliming<sunliming@kylinos.cn>
> > > ---
> 
> Previously, a maintainer suggested that the name should match the email
> address,
> 

Yes.  But normally people change their email address instead of their
name.

> but community patches have consistently used the name "sunliming" since
> then.
> 

Consistency is less important than being correct...  It's just a weird
thing to say.  Are there other non-community patches with a different
name?  It's fine if that's your legal name and we have made exceptions
for people who aren't able to share their real name because of stalking
or whatever...

regards,
dan carpenter

