Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHe+H3Fhd2n8eQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:43:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041FE88685
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6D210E219;
	Mon, 26 Jan 2026 12:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eC2kWM3G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0590510E219
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q/b0eV8GWF0hx7ncfxAaAZ5efEPdYyTOi8sswpZJTZo=; b=eC2kWM3GZf+pML19GjCpjk/gxy
 vrNF0WlKe5F2jwuIfQH3VNGgG4OfDNVCwMrgYaMlYkuu0/14jNbSg3ZWBvM7Xawor2rk1uGNnwCac
 BsJG34Ykn5TIgK3XErMyGTvycNhUIuS4IPT4UzYyHNYtU3g1r5eE526LQLOObnCc1YuWss7yXNu/e
 S9OohBOiuGxMbwgU38VrE9RrNCeU5CjXeAH8qynsCQDydgafSG1DUHkjJb7Q3u6ceMWOmzYdXDxey
 pW7z526OFvkTYxSBJOEBPTBmW4QnfWtbZoO8zOf0y8USCRo/vdsTUfCD/ckONnz8Pd07MG9q3NQvQ
 RrxakwiQ==;
Received: from [187.36.210.68] (helo=morissey)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vkLw6-00A2mC-D1; Mon, 26 Jan 2026 13:43:19 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH] drm/panel: ilitek-ili9882t: Select DRM_DISPLAY_DSC_HELPER
Date: Mon, 26 Jan 2026 09:42:34 -0300
Message-ID: <176943134904.488301.12365695309428276734.b4-ty@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115125136.64866-1-mcanal@igalia.com>
References: <20260115125136.64866-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:yelangyan@huaqin.corp-partner.google.com,m:mcanal@igalia.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,huaqin.corp-partner.google.com,igalia.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 041FE88685
X-Rspamd-Action: no action


On Thu, 15 Jan 2026 09:50:48 -0300, Maíra Canal wrote:
> The panel-ilitek-ili9882t driver uses drm_dsc_pps_payload_pack() which
> is provided by the DRM_DISPLAY_DSC_HELPER. Add the missing Kconfig
> select to fix the following build error:
> 
>   ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-ilitek-ili9882t.ko] undefined!
> 
> 
> [...]

Applied, thanks!

[1/1] drm/panel: ilitek-ili9882t: Select DRM_DISPLAY_DSC_HELPER
      commit: 68e28facbc8ab3e701e1814323d397a75b400865

Best regards,
- Maíra
