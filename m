Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLqDCvzJdGla9wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 14:32:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC827DBBE
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 14:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513DB10E128;
	Sat, 24 Jan 2026 13:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="og/phbew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD52A10E128
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 13:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1769261548; x=1769866348; i=wahrenst@gmx.net;
 bh=Y4G9MVhOxej2u9n2lGIIuHLqIN9naxKqNEi8higlo4g=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=og/phbewYd81Ifmn2sULazawrU4buKhGdRnuejIGGtikrr/tr5SRXRw3xNjnsczj
 AoXeFappuCgNyzduz+pd9d+cWBrQTZ+2dPSqoj3L7NUMntogLSugSgZIM3isbnqgV
 mCj+GcNKfGQ/fVuXSARyaYQb8NBD1P5+3bmH1cXwnBZW1xmUzW4a61rFfut6Q5/GX
 JG5QA4y2MPhjk+oomLym4KGYLtonv55rW9HPR6dLa0cd77WmyDWvQdmZ38QCEazhS
 ydZWzld4bMQzRwvgy0mi9kBAbvc+vYJ34Ars0GAMQ8aNy7Yu97hcBI+vTX1NGXAvA
 vIc+GBI+a7Szj7EyQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.209.202]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbox-1vQbhP059P-00MmEi; Sat, 24
 Jan 2026 14:32:28 +0100
Message-ID: <826c5f19-4ccd-499a-8d35-2aecf43c373b@gmx.net>
Date: Sat, 24 Jan 2026 14:32:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
To: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
 <20260116-v3d-power-management-v3-2-4e1874e81dd6@igalia.com>
 <3cf75fc2-1a20-40ba-9d7e-f3ef50a95d0c@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <3cf75fc2-1a20-40ba-9d7e-f3ef50a95d0c@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ka4SfT5h1qx9mc5wfQ7aWdkh24W05yWlrWKsGkcNd7x1s0c7cia
 GTFLF9UfK1t38qn64BqiCy7lzjsZXEbNHNKzqNK21KtiZya8FX5BeL4gkAat4nRyUF1l+ZQ
 r8cXJ03CY5v3mE9yRjQ2PibCSFERDG9+WAE49OltK13F4C0/X6BEV4rcFAjMjAj+xNp331l
 7yxqNnzPjfnUYVyGsry0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bQal5H3HUM4=;VQsz4P08+dIyMFs5NDkFEnXD6ui
 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
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
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:mcanal@igalia.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:mripard@kernel.org,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:popcornmix@gmail.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,baylibre.com,kernel.org,broadcom.com,gmail.com,raspberrypi.com,pengutronix.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.net];
	FORGED_SENDER(0.00)[wahrenst@gmx.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[wahrenst@gmx.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email]
X-Rspamd-Queue-Id: 8AC827DBBE
X-Rspamd-Action: no action

Hi,

Am 23.01.26 um 16:47 schrieb Melissa Wen:
>
>
> On 16/01/2026 17:19, Ma=C3=ADra Canal wrote:
>> If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will ski=
p
>> HSM initialization, which would result in a bus lockup. However, those
>> clocks are consumed by drivers (vc4 and HEVC decoder drivers,
>> respectively), which means that they can be enabled/disabled by the
>> drivers.
>>
>> Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
>> drivers when appropriate.
> Acked-by: Melissa Wen <mwen@igalia.com>
>
> But it'd be better if Stefan or Dave could check if we're missing=20
> anything in the firmware perspective.
sorry, I don't have any insight to the firmware or the clocks. As long=20
it has been tested with a Raspberry Pi 3 & 4 generation, i'm fine.

Best regards
>>
>> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>> ---
>> =C2=A0 drivers/clk/bcm/clk-raspberrypi.c | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/bcm/clk-raspberrypi.c=20
>> b/drivers/clk/bcm/clk-raspberrypi.c
>> index=20
>> 9783385d5859836898683209e320fcc928dfdc71..41f058bf44e8a5257e4b2a90389b5=
e9525f2fffb=20
>> 100644
>> --- a/drivers/clk/bcm/clk-raspberrypi.c
>> +++ b/drivers/clk/bcm/clk-raspberrypi.c
>> @@ -139,12 +139,12 @@=20
>> raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [RPI_FIRMWARE_PIXEL_CLK_ID] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .export =3D true=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .minimize =3D tr=
ue,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D CLK_IS_CRITICAL,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D CLK_IGNORE_UNUSE=
D,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [RPI_FIRMWARE_HEVC_CLK_ID] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .export =3D true=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .minimize =3D tr=
ue,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D CLK_IS_CRITICAL,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D CLK_IGNORE_UNUSE=
D,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [RPI_FIRMWARE_ISP_CLK_ID] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .export =3D true=
,
>>
>

