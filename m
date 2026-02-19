Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCSNOPQemGnhAgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E598165D86
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4AD10E7CB;
	Fri, 20 Feb 2026 08:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fateQn91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3870610E33A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 22:33:15 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-59e4993e00aso1720757e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 14:33:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771540393; cv=none;
 d=google.com; s=arc-20240605;
 b=D6UZ+f6dmOGTZpqhu7qKmsOCTWz1UZyEmBeP55KLwlmZv7F9w4fyQ/ONJNFJOM+wlq
 K1cylD9bhnQK9cpokYBOWgkByeCQRxCRFE8BuGVJBGSUC37Rcqg5edz5b22NVrASSc6B
 dGBV/4pBmix/zCl9d3LnMiy1l9ecrdillPygHQh0nuVLOOvm68OD6yj4KjrZuJdB6ONt
 aN4kkIYLyKXIZzoVhIcrN3VmbZa96OWJuVRd/1aExRqMlOXPq/pWKK7j6Ptx5fT+dNOh
 BvJkmYruHAkadRdy++cyKo3Hj6/VCpFizJvQ/IRSVJXUVZ5Vj/H2Mc2y/dzyQknroj5y
 ut9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=0c86jRAYAOOniszwr225rxzBQAZQQwvb90WTwPNyTgs=;
 fh=FZOwDXhIVsOMx67BDW0hn+e94OrtwNlu+M1PgBIm6Lo=;
 b=h1TPvss8tZupchHVQHA4czmacVepdGuPnh4kohqAK56dgFUz2+c9KCOR87qUFgBSUQ
 wf0U9k9oW0l2p3gEdTC5/Rldfw5B/w5lA22I+9mzCXfdAh7lmPcpMDPWMln9HNdpe3mI
 K7igl5wIWWVb8XZ+6TfrYrYjvgM8FvOj8RTF71l9zqqV+GFqfOolkn+ZYvqZcKtf6j7+
 LzyOdEcA1JF+3+dCuld6qvV2px3uTJ+W+I79QIGFTUw+VaexeDRhjaTZvqAXa/SGftMS
 E1l5Iikv4uPpY5uBq2bZC32njI5C3knepdpHnOkJRAkxOVf1y6xou2uWT+yOI8BJEHIM
 dskA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771540393; x=1772145193; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0c86jRAYAOOniszwr225rxzBQAZQQwvb90WTwPNyTgs=;
 b=fateQn91chOHA1r0zB95seIPnmhGRABm8/XTI80X9C0c7yM4pt7Uf60yB78wW7ImDz
 H0Vz7RLz9zMY9BNPdf/hxjESw77C4Xqdxj55ES96YS0oQK7KZslAbfibCakODdpx1z/m
 RsE4nE3mTn0PWmZV56cH1jZWf14TG66ISiWgwXEC+h0ONTBj3fkTjrREbQAchi5pfCyE
 3pl1WOH1ZBpKgaS32PbKeDqI0mrb0/Ax8c500ewpRHpvuH4TYjKL9p/VXVAW2P129x2P
 07nWLtCXWzRCu7Ozv3SANbiP6HxhvNyhzj5794+IRuT6CU+nX0BVw3MmRILTp1ush5aD
 6qPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771540393; x=1772145193;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0c86jRAYAOOniszwr225rxzBQAZQQwvb90WTwPNyTgs=;
 b=WritY2wLW8sRD2iWbL5yn9e7f8R/xeDrcQ4uvpXlURdVFcsqI5lztbtvLP3ZttNahC
 gH5ShJhzPJp25vb6Xdc4KLCoO5ILTdc6JdnLQydCreBMD19UbDwd1j4CvvDr9iZXlh5L
 EOyOf8WKZtSncN74xHYSxQdOSSz8WndXYvC5W0LRUblGNNIZBAGh+a7vGSJWw+lOGMQU
 JQQvFS5Exeg81eUikhvU27yYP5Oh4DhhHJQyB/tTM3bdCkUUPVZ84XpCZ3jQBjwrEczj
 fGum2UkNgBu69pkOzxluBjWDOOoQ7lXOFGSbrClT4x1yF4tNOfw82zIfSLZV7ZA9Qog6
 fl+g==
X-Gm-Message-State: AOJu0YxuJd5Zao/cop9bebYopSDPAjuH47e5cbYFAT11eUx9DhJx5MDL
 4hDt3eMqNFftEb8p9LdTdyBIac/IwEZjKQ9BncdgaeOwb+QP3nNlBO1KZLLv6S8hKBdElB+vtW6
 uv5GS6G+tyJdt7gTIHcOYE8rGT2vRog==
X-Gm-Gg: AZuq6aJrl3lnouULj+Sk8GwWptYNl9VOQ8x/BxlX4g2pe+SHDf5lhqwU0JujBHO7tA1
 2uD20iBXWHEzZuYNri0DukQOf+7/3+zb4e6eiX5R0TC99rMOeQQi6h090URUEHqBLxYKbiWECvd
 4LVymlBIDQ4PLWHB1aQyNS3XFHxsjH9s4km6RPYjSd/Euw1WSFotlY+cLD3PJdJo+sKsmHlGTmZ
 Q/NwlvUWnklWJgVgEqZHuHLecYDz7ICGaSB3g0+rMxMmwbSHcvjQz/n+QpNpNJ0QJWuXlMyZj3A
 Pu5Sua0KNQ5+EyBz4A==
X-Received: by 2002:a05:6512:23a4:b0:59d:f47c:100d with SMTP id
 2adb3069b0e04-59f83bbad74mr2430338e87.24.1771540393099; Thu, 19 Feb 2026
 14:33:13 -0800 (PST)
MIME-Version: 1.0
From: John The Cooling Fan <ivan8215145640@gmail.com>
Date: Fri, 20 Feb 2026 01:33:01 +0300
X-Gm-Features: AaiRm51jvRuCF3Uzbemg_3Ogc0GaotIPeGjtPgaNcd2hy_qmzlM99LaySlt9CPA
Message-ID: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
Subject: [REGRESSION] VRR not detected on a DisplayPort monitor using an AMD
 GPU
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, regressions@lists.linux.dev, 
 mwen@igalia.com, mario.limonciello@amd.com, alex.hung@amd.com, 
 daniel.wheeler@amd.com, rodrigo.siqueira@amd.com, alexander.deucher@amd.com, 
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com, 
 huangalex409@gmail.com
Content-Type: multipart/mixed; boundary="000000000000d620f9064b34e329"
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:31 +0000
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:regressions@lists.linux.dev,m:mwen@igalia.com,m:mario.limonciello@amd.com,m:alex.hung@amd.com,m:daniel.wheeler@amd.com,m:rodrigo.siqueira@amd.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:christian.koenig@amd.com,m:huangalex409@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ivan8215145640@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,igalia.com,amd.com,gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivan8215145640@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6E598165D86
X-Rspamd-Action: no action

--000000000000d620f9064b34e329
Content-Type: text/plain; charset="UTF-8"

Noticed a regression with VRR after updating the kernel. My main
monitor's VRR stopped being recognized, I was no longer able to enable
it in my desktop environment settings and
/sys/kernel/debug/dri/0/DP-1/vrr_range showed a range of 0 to 0. I did
a bisect on the linux kernel git tree, and found that the commit
introducing this issue is 0159f88a99c9f5722dbe52ac42faf3446f371dea.

The monitor is connected via DisplayPort, no converters as far as I
know. The GPU in use is AMD Radeon RX 6700XT. There is another
monitor, connected over HDMI and it has VRR working in all the
versions I've tested. Attached the DisplayPort monitor's edid copied
from sysfs.

#regzbot introduced: 0159f88a99c9f5722dbe52ac42faf3446f371dea

--000000000000d620f9064b34e329
Content-Type: application/octet-stream; name="main-edid.bin"
Content-Disposition: attachment; filename="main-edid.bin"
Content-Transfer-Encoding: base64
Content-ID: <f_mlu0pn6z0>
X-Attachment-Id: f_mlu0pn6z0

AP///////wBNZxMnAAAAABkhAQS1PCF4Ol3QqFNHqyEFUFSvzwBxT4GAgQCBwKnAlQCzAAEBal4A
oKCgKVAwIDUAYVwhAAAaAAAA/QAwS9/fKAEKICAgICAgAAAA/wAwMDAwMDAwMDAwMDAKAAAA/ABE
RVhQIERRMjdOMgogAXcCAzTxSwECAwQEDhMAABAAIwmHB4MBAABlAwwAEABtGgAAAgEwSwAAAAAA
AGfYXcQBeMAAAjqAGHE4LUBYLEUAYVwhAAAaNnYAoKCgKVAwIDoAuoghAAAeg0iAGHE4LUBYLEUA
DyghAAB/AAAAAAAAAAAAAAAAAAAAAAAAAAAAGA==
--000000000000d620f9064b34e329--
