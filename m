Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D658BD9135
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB2710E5AF;
	Tue, 14 Oct 2025 11:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="yz3OKdHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC22710E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:43:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 732CC1A136A;
 Tue, 14 Oct 2025 11:43:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44F13606EC;
 Tue, 14 Oct 2025 11:43:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0217D102F2298; 
 Tue, 14 Oct 2025 13:43:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760442211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nCxasSvJLE/ntqOSQlVYeTt9F+Rb39yn4NlUI8d4k/M=;
 b=yz3OKdHLUlM5a0ogcR2e1FHIeHsXztLkAOqBkLeUoqs7Om7wan+FAvJcb6nl+Tg6jJb/H8
 D7DXXQJUDhdX9/NTTT8pCkGoc0aYJHSMfqQtbi6yYQts0yMDaZdr8cbDu5pdxfW0DIHaLd
 RzrnVGJN95+qXdIHj7ulqmii9Sl6cgovt73I+mcpPSfRqfKYm+sc9QpOTxRCQjBZlCEbGt
 YHoOBfIfMbARrjtVmVlTUpJt+xWYGZQIYF/t0kQxB95cgb1MMCUOdbn7qf0t+XG8QJiFym
 7lmzea5XoYT7i9bwNM1wq/2h064mVdgEaxa7K+/rqCTnecTZ6ShzMFioJP/tnQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Oct 2025 13:43:21 +0200
Message-Id: <DDI0OEMAGBI3.2WFIP0O7M73LB@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
Cc: "Anusha Srivatsa" <asrivats@redhat.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Jessica Zhang"
 <quic_jesszhan@quicinc.com>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] drm/panel/panel-simple v6.17 WARNING regression
X-Mailer: aerc 0.20.1
References: <hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh>
 <DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com>
 <kcunz2b2usmvadgrnnu65op5oi5ttblrc463twgxp5gqhnufav@eze53y23avel>
In-Reply-To: <kcunz2b2usmvadgrnnu65op5oi5ttblrc463twgxp5gqhnufav@eze53y23avel>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Ernest,

On Tue Oct 14, 2025 at 1:25 PM CEST, Ernest Van Hoecke wrote:
> Hi Luca,
>
> Thanks for your fast reply and all your work here.
>
> On Tue, Oct 14, 2025 at 12:31:35PM +0200, Luca Ceresoli wrote:
>> Let me have a look at the DRM_IMX driver, I'll try to send a series
>> converting it to the new API within today.
>
> I will gladly test, thanks!

Just sent:
https://lore.kernel.org/all/20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1d=
cbff50@bootlin.com/

>> I recently sent a series proposing to make drm_bridge_add() mandatory
>> before drm_bridge_attach() in the docs and warn if that is violated [1].=
 If
>> you apply patch 4 of that series you should see the warning.
>
> I gave it a quick try and did not see the warning. Some printk debugging
> told me that `list_empty(&bridge->list)`, inside drm_bridge_attach, is
> returning 0.

Ouch, I think this is because without using devm_drm_bridge_alloc() even
the list is uninitialized, and so list_empty will do:

static inline int list_empty(const struct list_head *head)
{
	return READ_ONCE(head->next) =3D=3D head;
	                        ^         ^
                NULL (bridge->list      valid pointer
                zeroed by kzalloc)      to bridge->list
}

So it returns false. I guess that means the series to make drm_bridge_add()
mandatory before drm_bridge_attach() [0] will need a better check to
trigger the warning.

[0] https://lore.kernel.org/lkml/20251003-b4-drm-bridge-alloc-add-before-at=
tach-v1-0-92fb40d27704@bootlin.com/

>> > However, later on, another regression seems to be introduced by
>> > commit 8fa5909400f3 ("drm/bridge: get the bridge returned by drm_bridg=
e_chain_get_first_bridge()")
>> > so reverting 94d50c1a2ca3 on top of drm-misc-next does not solve
>> > everything. This was tested by rebasing drm-misc-next onto (260f6f4fda=
93
>> > plus the revert of 94d50c1a2ca3) and then bisecting.
>> >
>> > So in v6.18-rc1, both regressions are present.
>> >
>> > There, I get the following additional warnings:
>> >
>> > [    9.732278] ------------[ cut here ]------------
>> > [    9.732336] WARNING: CPU: 0 PID: 38 at lib/refcount.c:22 drm_bridge=
_get+0x10/0x18
>> > [    9.744608] refcount_t: saturated; leaking memory.
>>
>> Not sure here, but it may well be another symptom of the same bug: the
>> refcount was not initialized correctly, so it is found inconsistent late=
r
>> when trying to increase it. Let's fix the known issue and then we'll see=
.
>
> Makes sense to me.

Alright. Let me know whether the series I've sent fixes 0, 1 or both
warnings.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
