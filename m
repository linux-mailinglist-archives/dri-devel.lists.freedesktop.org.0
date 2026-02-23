Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOC4F8zTnGkJLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:25:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0610017E499
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C0010E31E;
	Mon, 23 Feb 2026 22:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XtqRmn6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4844C10E31E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:25:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0795341A8B;
 Mon, 23 Feb 2026 22:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE5BC116C6;
 Mon, 23 Feb 2026 22:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771885512;
 bh=wfg4VRQE5OBvnbfLt0WHzLC4rvZAYdoLxo98gn+3YZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XtqRmn6sXzxFhXP8E1IfC+idVmhuk6RUIOBACSkm8U+6774jsU0QDnOUnd+IxaDbn
 YUtMJccEZHsa+M/i6Lpr8CyXFcryxYRuwtRBtpNgAEWqIcv1Ec45o3CHJ7qpjfyCzd
 T+DQp8mMgCp2ELMj037MUXQZbdO8AvpA1Jb5KxKf+ukIMRNAY1/dQhePyW7jSaWNl8
 Ql9cNguaVf3Q8b/Lw9d8xi52N3OPFD3kAOSKKe0WJa7CqFIymNvuiPUoABLoBIp/ce
 9Pc1lacSracywRFZSsWniAQ1LIM0cjNqajIIxbnGgU5hwzNuDorYyN8tjmXkewdouL
 XHI3edGwUpc7Q==
Date: Mon, 23 Feb 2026 16:25:08 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm
 DSP accelerator
Message-ID: <oe4ho45dxtwjjjsqj6nd4op3gh7dz2pqwsuuhgqpdbf5hym645@smg3g4evqmge>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
 <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
 <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
 <r7eko65ua2ofyejqf6ipnh6jm4s76f4mqy6a4msgmlraz4xuec@uymfzc65dbng>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r7eko65ua2ofyejqf6ipnh6jm4s76f4mqy6a4msgmlraz4xuec@uymfzc65dbng>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0610017E499
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:12:32AM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 23, 2026 at 03:50:32PM -0600, Bjorn Andersson wrote:
> > On Mon, Feb 23, 2026 at 11:23:13PM +0200, Dmitry Baryshkov wrote:
> > > On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
> > [..]
> > > > diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> > [..]
> > > > +/* Error logging - always logs and tracks errors */
> > > > +#define qda_err(qdev, fmt, ...) do { \
> > > > +	struct device *__dev = qda_get_log_device(qdev); \
> > > > +	if (__dev) \
> > > > +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> > > > +	else \
> > > > +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> > > 
> > > What /why? You are under drm, so you can use drm_* helpers instead.
> > > 
> > 
> > In particular, rather than rolling our own wrappers around standard
> > functions, just use dev_err() whenever you have a struct device. And for
> > something like fastrpc - life starts at some probe() and ends at some
> > remove() so that should be always.
> 
> I'd say differently. For the DRM devices the life cycle is centered
> around the DRM device (which can outlive platform device for multiple
> reasons). So, please start by registering the DRM accel device and using
> it for all the logging (and btw for private data management too).
> 

There are no platform_devices here, but tomato tomato... What defines
the life cycle of the DRM device then? Might it linger because clients
are holding open handles to it?

Note that the fastrpc service is coming and going, as the remoteproc
starts and stops.

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> 
> -- 
> With best wishes
> Dmitry
