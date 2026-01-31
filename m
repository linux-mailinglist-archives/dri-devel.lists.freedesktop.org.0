Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMN0FkAffmmhVwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 16:26:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16DC2AC8
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 16:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3294210E154;
	Sat, 31 Jan 2026 15:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="rhT4ppLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C0310E154
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 15:26:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D7EA31A2B5D;
 Sat, 31 Jan 2026 15:26:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8D500606B6;
 Sat, 31 Jan 2026 15:26:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA38E119A888D; Sat, 31 Jan 2026 16:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769873208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ME7pHoAEju0N5k3+ETPtM4gKEW2g2cPy/BmUFwMt/O8=;
 b=rhT4ppLlvuL1J9Kf8r7xznmQzhilwixZsftabPADKpgNziIFhRf5dGM24UjxSmrMSKB80S
 8YZfm0bOiZ+WAiBncHrw5S5PDyTCunMm8DsxauDXmvQCE2lgoATY1zde9Q6bMo/+cGZulQ
 gzkgT8EPrtZIWuS84S2/BJVmT7Yp1FJLGto14iGUUi6gyYYCnOiKwN42g1BniGKCIeRxMz
 t1A2UL1ODeFngNaqd7MROKzZCO9j3K6UFvstH23Q/sj1n1zEZWp8FSz8wCuWQ8apz6rRL+
 NVGFuiQ5GQu2+zs7jl+xs13nJqpRR7xQNKKdNo4R7X8IjsZ+4HwdocyoMKtNLA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 16:26:37 +0100
Message-Id: <DG2VOQLW9RYT.181HW9ZI8HHOR@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 3/6] drm/mcde: dsi: warn in case of multiple subnodes
Cc: "Biju Das" <biju.das.jz@bp.renesas.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Anitha
 Chrisanthus" <anitha.chrisanthus@intel.com>, "Edmund Dea"
 <edmund.j.dea@intel.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
X-Mailer: aerc 0.20.1
References: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
 <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-3-e34b38f50d27@bootlin.com>
 <CAD++jLm_Va+7c_usgoPDhsDiCr4NQMZWsQ3iJW5-a1ETP4EaJQ@mail.gmail.com>
In-Reply-To: <CAD++jLm_Va+7c_usgoPDhsDiCr4NQMZWsQ3iJW5-a1ETP4EaJQ@mail.gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:anitha.chrisanthus@intel.com,m:edmund.j.dea@intel.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:tomi.valkeinen@ideasonboard.com,m:Hui.Pu@gehealthcare.com,m:ian.ray@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7B16DC2AC8
X-Rspamd-Action: no action

Hello Linus,

On Mon Jan 19, 2026 at 9:54 AM CET, Linus Walleij wrote:
> On Fri, Jan 16, 2026 at 6:33=E2=80=AFPM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>
>> mcde_dsi_bind() has a loop over all subnodes looking for a panel, but do=
es
>> not exit when a match is found and only stores the last match. However t=
his
>> will be problematic when introducing refcounting on the struct drm_devic=
e
>> pointer in a following commit, because of_drm_find_and_get_bridge() woul=
d
>> get a reference to multiple bridges.
>>
>> Assuming there is no real reason for looking for multiple panels, add a
>> warning so it gets noticed in case the assumption is wrong.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>
>> ---
>>
>> I think the correct thing to do would be adding a break statement when
>> there is a match. However I don't have knowledge of this driver and the
>> hardware, thus this patch is a prudential alternative, not changing the
>> behaviour.
>
> Go ahead and insert a break when the panel is found, there is
> no MCDE-attached device with more than one panel.
>
> There *exist* the Samsung Gavini device which has a
> LED panel, *and* the same lines attached to a mini-projector
> so these two can be used at the same time. I have no idea
> how to actually deal with that if someone one day want to
> support it. Probably by putting the projector as a side thing
> and not deal with the video stream in the device tree.

Thanks for sharing these info! I'm very happy to know I can break instead
of warning here. Change queued for v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
