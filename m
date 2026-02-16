Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SlmjMfemk2ly7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BE11480E6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AEF10E251;
	Mon, 16 Feb 2026 23:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zhan.science header.i=@zhan.science header.b="trbBbA1Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Mon, 16 Feb 2026 09:57:33 UTC
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500AA10E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 09:57:33 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhan.science;
 s=key1; t=1771235533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eUTuchl87bbjf0z6lqoJU4OxzcdpLm8oToWJMNMm/EQ=;
 b=trbBbA1ZK7USsGShnG+154Ny8pqqf4dJpNNMMVDLIkrgrsK+QM5DRsNbkj1qPNMl8AaS4c
 JHfN/8o+XGzTgt9t457Xm84bArZJ9zATm8htzJ3BZPUOI7ICgqNaZuLhhv0iHtCsTh6KRL
 MiBEkHNG+ILALQT+TFykXLqVGxTpqAxXs1pfwBK3ias1mAgavx1HQsS4cBbUdHngThFCSs
 ULt/ENYZ5wMzb0lxWOcmfZwqzpO/Ms+G0KxeW/X1Duh+V9ANcbJaPMdqIEu+HSxbMCiOGq
 q4+AjB8Xu/ID6iIVqqk5XUBLf7idqf4tZ6YwI198dkIAfy/2zad5DBKMM76WPQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 09:51:57 +0000
Message-Id: <DGGAL7I1KRM8.1DSZIKWRHLEPM@zhan.science>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Yifei Zhan" <yifei@zhan.science>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Richard Acayan"
 <mailingradian@gmail.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Thierry Reding"
 <thierry.reding@gmail.com>, "Sam Ravnborg" <sam@ravnborg.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/panel: Add Novatek/Tianma NT37700F panel
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-4-mailingradian@gmail.com>
 <gpkuq7b6mae5ib2xvphmir66pb6ysexhhfqkorve5zewkj4ofc@ryccazsoxqm7>
In-Reply-To: <gpkuq7b6mae5ib2xvphmir66pb6ysexhhfqkorve5zewkj4ofc@ryccazsoxqm7>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 16 Feb 2026 23:23:19 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[zhan.science,quarantine];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[zhan.science:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[yifei@zhan.science,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yifei@zhan.science,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[zhan.science:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,zhan.science:mid,zhan.science:dkim,zhan.science:email]
X-Rspamd-Queue-Id: 45BE11480E6
X-Rspamd-Action: no action

On Fri Feb 13, 2026 at 6:07 PM UTC, Dmitry Baryshkov wrote:
> On Mon, Feb 09, 2026 at 09:32:57PM -0500, Richard Acayan wrote:
>> Some Pixel 3a XL devices have a Tianma panel. Add support for it, with
>> the aid of linux-mdss-dsi-panel-driver-generator.
>>=20
>> Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-ge=
nerator
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
>>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>  .../gpu/drm/panel/panel-novatek-nt37700f.c    | 294 ++++++++++++++++++
>>  3 files changed, 304 insertions(+)
>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c

<--cut-->

>>=20
>> +// TODO: Check if /sys/class/backlight/.../actual_brightness actually r=
eturns
>> +// correct values. If not, remove this function.
>
> Any chance of checking it?


I tested this with my Pixel3A XL with tianma panel, it worked correctly.
/sys/class/backlight/.../actual_brightness returns same value
as /sys/class/backlight/.../brightness and I'm able to change brightness
level.
                                                                           =
                                                                           =
                                                              =20
Tested-by: Yifei Zhan <yifei@zhan.science> =20
>
