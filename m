Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IvpOVEHe2maAgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:08:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5A3AC6E3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE23810E7D5;
	Thu, 29 Jan 2026 07:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FWyaRwTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7883410E7D5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:07:58 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so459992f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769670477; x=1770275277; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nLKZ/+6JwT2YBvhO87EM+NlzTMpXl06Qt/e59HknqH0=;
 b=FWyaRwTlgUwzXVDNxpWBUe9emhbTyDoGFr0Lpy3BDozVgo68tco6a4z9NkR0/BZ0Gq
 sT1c5I/Ki2dheOo47gWtB2dV5Zp3OXFv/dOZkyd1vPCOAoYuroeU3PS4kM3iIGLcFlkD
 gptKaSn1LNICDQlcJKUjJhAT1n3Yiyxj7eEoofQ+wIx4Cnm8MPRRHDSm7gCzBasGstq5
 HeZHLaPqUmWCG8O/VqETfmQp/A1p3j5mJxGGNhkaQoH+bpr/QoGm5m9X5korjFL+SKf2
 kgLN0uuayPCGTidCfCAj4F7x52/xBnZsRfCybAixY+okESzkGLdyTPEaUd/ukiurCf9J
 Wiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769670477; x=1770275277;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nLKZ/+6JwT2YBvhO87EM+NlzTMpXl06Qt/e59HknqH0=;
 b=hKKZbI58ygZjb1/h01nsyRp83h802KRSaajVd4YqfDqwuKpxl2NVD7aTUQKjuFz6DU
 KAXtSw3lYt73kduky6lHYrHimIe2Vm1ZD/wvMu/C240aTXphnTvtMdICSDEAepd2evXe
 eV1BJabx8yG0YRmHUvzEpVuxRqfAEOl+0A/uJ2quRMR4ZPEEylGXkIAlmK2LkoAduBTZ
 KfqwRg1D3P50M1ltP21xNISi8tPNF9zF98PTEJY15ArfMG5ykiJofDUX8SXLSC6BcJ/t
 aFRDqw9+gPss8358TTKb46oqHnWxojjPrXZ/MKe/EWAqEUSBeRrbxdIozt1GWXVHr5He
 UI3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9x8atHomQrfU8Zll0ks9xE4iCJibI2BC3K9y8+kBAy1DbP++kQ9Mvy/K8Lpm3oPaK2+2Z8lyXlgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYnFvJZokgzvIQmWLZseOCmqA9pBwuyi9A21kNKACkYytqCY5K
 1YeyYKPtQxYiovd036yoa4hK0dvgEn5FHmsUi1wlIyTcAoh+EYRGEV42AO/ZzSsUB5Q=
X-Gm-Gg: AZuq6aKLl2n9mrw26zUou3/pJ0/mYCqWqsmLicTTN9d8pnWsshhLER2lXChHIm8hIt1
 V2VaP2I8ysXCjw6oqlISa9iZj2nrHq+JxUb51jMs5701Kvn8/bw8MaNWaGslcJCbx4CnR1qD57D
 areyOshOC8Dg+GF0MR3oQEQHcn1OJNEnMGGxn4uBPS2U/BtqC8q5ZXrYpq4gw8x0wvPIOK/eAhS
 h4EBoZg6m68Y9aTtiAh5vqMYJYQydA3Ca5+PD4Nzm0EFrZAvPjpb6w28liQE8GTMeHRYbjd7HCH
 caSFsgkd9vj8vdFxLgiCNYIgLad1iw88/gaqRl8MWoDPS8viUDs5LXBex8K8rxUJEtALzpMH+/Z
 j80ru4YTvltse14krr64lUpyx6bhyaJMhQ563Ikj1CJYkF3rNcY8Ah1AasD1X4lxyhxRGIBHqoJ
 GK8EyEgEQKjfaidpej
X-Received: by 2002:a5d:5f54:0:b0:435:94c4:649c with SMTP id
 ffacd0b85a97d-435dd0b678dmr11429356f8f.30.1769670476703; 
 Wed, 28 Jan 2026 23:07:56 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cf16sm13036791f8f.22.2026.01.28.23.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:07:56 -0800 (PST)
Date: Thu, 29 Jan 2026 10:07:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sunliming@linux.dev
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, sean@poorly.run, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <aXsHSTHHP0eyI-Pk@stanley.mountain>
References: <20260129024919.30449-1-sunliming@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129024919.30449-1-sunliming@linux.dev>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:dkim,kylinos.cn:email,intel.com:email,stanley.mountain:mid]
X-Rspamd-Queue-Id: 9B5A3AC6E3
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 10:49:19AM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---

Could you capitalize your name?  It's supposed to be a bit formal like
signing a legal document.

This isn't a RESEND, it's a v2.  A RESEND means we accidentally ignored
your email so now you have to send the exact same email again.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

