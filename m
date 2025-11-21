Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E202FC7A465
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E164310E028;
	Fri, 21 Nov 2025 14:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WbQuHd0n";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="efcDhBCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 989 seconds by postgrey-1.36 at gabe;
 Fri, 21 Nov 2025 14:48:10 UTC
Received: from a7-51.smtp-out.eu-west-1.amazonses.com
 (a7-51.smtp-out.eu-west-1.amazonses.com [54.240.7.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE77610E028
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=5uqmrq7mz5dkaze44elodgxarejai7vg; d=collabora.com; t=1763735499;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=pvGVLndqtK5GDhuNliEvH5x/gSiTEabBJ1Df1cFwNZA=;
 b=WbQuHd0n7YkIfYM1rdtC+3emGqAX53okln9mjIBNS7Z+EivvHYVeMqEnxqPhbapo
 zedkRJSErymvdYdnpPAP+ilQr+02CYT1P2lcu97j/HV0og7zsjCtQ6pBx7eQPn/CaUl
 TjCj7bjecFFaCj6PG6rMBzwJMOM0VWs5C+/WbLNJWlAoKnrG5qIAV5/3g9B19d1k5by
 Vkj08vuxrcnWIUgDUidYpsSk9FOIIUo5Rg8QmVSk30Y7RqZtXJK3uJeK6c06yu7XDUS
 YoOZ4e+FYP091o7+yzCSyM6ZVYpG3UyxRu/5QVP5RcNa4N7tHkDVNnjpz798gsicPpG
 LcikrKZZ6w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1763735499;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=pvGVLndqtK5GDhuNliEvH5x/gSiTEabBJ1Df1cFwNZA=;
 b=efcDhBCGs68ibsR+D/W4pxxcB5J4jveCnYUnDe94cnuQNl7jsutLq5z2YSVkUPHK
 5NOOLD5jX4kFPWz1QEhXgAUpd0BUjwm6Qm25zQVTlWoKJaYymUhsGlgQU5sa3HJthJO
 sFf1ZS3osd7ufxR+W1wMI/Iweay8BNgNDgIjpD98=
Message-ID: <0102019aa6d3f354-c89f4a5f-af85-443f-a721-2c65ad673049-000000@eu-west-1.amazonses.com>
Date: Fri, 21 Nov 2025 14:31:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/scdc: add frl config/status registers to scdc
 header.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20251114035338.15144-1-airlied@gmail.com>
Content-Language: en-CA
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <20251114035338.15144-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2025.11.21-54.240.7.51
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

On 11/13/25 9:53 PM, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>
> These are sourced from publically available presentations like
> https://www.ti.com/content/dam/videos/external-videos/en-us/11/3816841626001/overview-ddc-bus-hdmi-systems.mp4/subassets/overview-ddc-bus-hdmi-systems-presentation.pdf
>
> Document in the kernel in case they are of use to someone.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   include/drm/display/drm_scdc.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
Acked-by: Derek Foreman <derek.foreman@collabora.com>
> diff --git a/include/drm/display/drm_scdc.h b/include/drm/display/drm_scdc.h
> index 3d58f37e8ed8..3b6a8a4a4bca 100644
> --- a/include/drm/display/drm_scdc.h
> +++ b/include/drm/display/drm_scdc.h
> @@ -29,6 +29,8 @@
>   #define SCDC_SOURCE_VERSION 0x02
>   
>   #define SCDC_UPDATE_0 0x10
> +#define  SCDC_FLT_UPDATE (1 << 5)
> +#define  SCDC_FRL_START (1 << 4)
>   #define  SCDC_READ_REQUEST_TEST (1 << 2)
>   #define  SCDC_CED_UPDATE (1 << 1)
>   #define  SCDC_STATUS_UPDATE (1 << 0)
> @@ -46,7 +48,20 @@
>   #define SCDC_CONFIG_0 0x30
>   #define  SCDC_READ_REQUEST_ENABLE (1 << 0)
>   
> +#define SCDC_CONFIG_FRL 0x31
> +#define  SCDC_FRL_RATE(x) (((x) & 0x7) << 0)
> +#define  SCDC_FRL_RATE_DISABLE 0
> +#define  SCDC_FRL_RATE_FIXED_3LANE_3GB 1
> +#define  SCDC_FRL_RATE_FIXED_3LANE_6GB 2
> +#define  SCDC_FRL_RATE_FIXED_4LANE_6GB 3
> +#define  SCDC_FRL_RATE_FIXED_4LANE_8GB 4
> +#define  SCDC_FRL_RATE_FIXED_4LANE_10GB 5
> +#define  SCDC_FRL_RATE_FIXED_4LANE_12GB 6
> +#define  SCDC_FRL_FFE_LEVELS(x) (((x) & 0xF) << 4)
> +
>   #define SCDC_STATUS_FLAGS_0 0x40
> +#define  SCDC_FLT_READY (1 << 6)
> +#define  SCDC_LANE3_LOCK (1 << 4)
>   #define  SCDC_CH2_LOCK (1 << 3)
>   #define  SCDC_CH1_LOCK (1 << 2)
>   #define  SCDC_CH0_LOCK (1 << 1)
> @@ -55,6 +70,9 @@
>   
>   #define SCDC_STATUS_FLAGS_1 0x41
>   
> +#define SCDC_LN_LTP_01 0x41
> +#define SCDC_LN_LTP_23 0x42
> +
>   #define SCDC_ERR_DET_0_L 0x50
>   #define SCDC_ERR_DET_0_H 0x51
>   #define SCDC_ERR_DET_1_L 0x52
