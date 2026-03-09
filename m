Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAlMIJgJr2lzMQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:55:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7C823E066
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F6D10E57E;
	Mon,  9 Mar 2026 17:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mIjH8KFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128D510E57E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 17:55:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 045BE1A2D7D;
 Mon,  9 Mar 2026 17:55:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CD3B85FFB8;
 Mon,  9 Mar 2026 17:55:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3EC5103698F7; Mon,  9 Mar 2026 18:55:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773078930; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k773d9FceRIM619GILcDFU5QIQt2WBBQdDcjscUDI6U=;
 b=mIjH8KFqeNgha+/3rbWA1/vEsMh0oO6YqvO8ZdvXwe+jAhkHcLkZLq38R2BisQW3CV7IGE
 lcpXToBf3kM1oXKuERIgphUTuwkNrFXtob727CjCYarcZZ5B0/4Far5dQPD2CmfhcaX12M
 dPwlIeO3capiTM3EMndU+3eBIhaQUmwOa8gU/OC0CTl9Y3GIT4TnauZiyRB4+HH68Iz0ix
 FKUTCJx3qaQ58cgjPrIr0BqCfoadIHpqMwQpNsDoCt2e049uKRuFPN1APhURMU8ywvJfz2
 khylHa0a9Abr5rxnCmrosVfQNjUzxKaIbcTj1UsFyfTnK8r3Nl8fn8OnCfGFuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 18:55:27 +0100
Message-Id: <DGYG0UBEFW5W.29YB9R2AM8GZM@bootlin.com>
Subject: Re: [PATCH v10 5/6] cadence: cdns-mhdp8546*: Change drm_connector
 from structure to pointer
To: "Harikrishna Shenoy" <h-shenoy@ti.com>,
 <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>, <lumag@kernel.org>,
 <lyude@redhat.com>, <maarten.lankhorst@linux.intel.com>,
 <mordan@ispras.ru>, <mripard@kernel.org>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <s-jain1@ti.com>, <simona@ffwll.ch>,
 <tomi.valkeinen@ideasonboard.com>, <tzimmermann@suse.de>, <u-kumar1@ti.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251209120332.3559893-1-h-shenoy@ti.com>
 <20251209120332.3559893-6-h-shenoy@ti.com>
In-Reply-To: <20251209120332.3559893-6-h-shenoy@ti.com>
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
X-Rspamd-Queue-Id: 1C7C823E066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:h-shenoy@ti.com,m:Laurent.pinchart@ideasonboard.com,m:airlied@gmail.com,m:andrzej.hajda@intel.com,m:andy.yan@rock-chips.com,m:aradhya.bhatia@linux.dev,m:devarsht@ti.com,m:dianders@chromium.org,m:javierm@redhat.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:linux-kernel@vger.kernel.org,m:linux@treblig.org,m:lumag@kernel.org,m:lyude@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mordan@ispras.ru,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:s-jain1@ti.com,m:simona@ffwll.ch,m:tomi.valkeinen@ideasonboard.com,m:tzimmermann@suse.de,m:u-kumar1@ti.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ti.com,ideasonboard.com,gmail.com,intel.com,rock-chips.com,linux.dev,chromium.org,lists.freedesktop.org,redhat.com,kwiboo.se,vger.kernel.org,treblig.org,kernel.org,linux.intel.com,ispras.ru,linaro.org,ffwll.ch,suse.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:mid]
X-Rspamd-Action: no action

On Tue Dec 9, 2025 at 1:03 PM CET, Harikrishna Shenoy wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
>
> Now that we have dropped the legacy code which became redundant with
> introduction of DRM_BRIDGE_ATTACH_NO_CONNECTOR
> usecase in driver,we can cleanly switch to drm_connector pointer
> instead of structure.
>
> Rename the connector_ptr member variable to connector for clarity and
> consistency. The driver was using both connector and connector_ptr member=
s,
> but connector_ptr was the only one actually used throughout the code.
> This change removes the unused connector struct member and renames
> connector_ptr to connector for better readability.
>
> This is purely a code cleanup change with no functional impact. All
> references to connector_ptr are updated to use the renamed connector
> variable throughout the driver.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
