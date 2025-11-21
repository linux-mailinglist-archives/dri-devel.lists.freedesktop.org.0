Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD561C7A345
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD4C10E88E;
	Fri, 21 Nov 2025 14:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="xhJQVgTJ";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="jVanqvg7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 359 seconds by postgrey-1.36 at gabe;
 Fri, 21 Nov 2025 14:37:51 UTC
Received: from a7-50.smtp-out.eu-west-1.amazonses.com
 (a7-50.smtp-out.eu-west-1.amazonses.com [54.240.7.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A5210E88E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=5uqmrq7mz5dkaze44elodgxarejai7vg; d=collabora.com; t=1763735511;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=fhloa+ZhTP76gVHe02qG5g5yq7/ShmH7RXIp41HB5d4=;
 b=xhJQVgTJ2ihZAuFw/OorwO5b2pSQzCXkGMRCeoe//UmVv1YZIHmBfXymMHXA6KoG
 m/swnUUfHzSdjs4+Ep9fXdktX+l/bz+aOM7pnCyaj4IccEFg1v577v7iWPzkQoDxWsi
 iIM6MB5iSAw6KQ2I4//QQCrDwh6ZRtjwpaWDEVOkO7KQAQMUT0kcJBEcnjklvOmVMmZ
 /0+Qv2f4h+KEG+lNeZlGgOVa67oajOHmZmc8U2Wa6mkLVgc3M5rXKXc89+geHRKmdAD
 bFc2SVij+C9XahL5t1ITt8i7sUNUdhMrvpAUFrhuEOZpw8LX5YkTSohKCjWY8109U3c
 R+UGMAAaFg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1763735511;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=fhloa+ZhTP76gVHe02qG5g5yq7/ShmH7RXIp41HB5d4=;
 b=jVanqvg7oVNXa95FLzcDp1U/aV3u9mya2G3fT0bDRdNCLQrhiSC5Jzd65qeTpA38
 I3VkBLuBe4n8LiDLyw9dHA7D4rKdEenDD62KJzuhA9mVo7fNc5/h8fdmpr/UvnBLKeQ
 0DjXUbnhJPUGELRgB3bVENw29mpivvDorwIBVE6k=
Message-ID: <0102019aa6d41ffb-501deb76-d0fe-429b-95dd-4f86313550b7-000000@eu-west-1.amazonses.com>
Date: Fri, 21 Nov 2025 14:31:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] amd/dc: add frl bits to the registers
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20251114035338.15144-1-airlied@gmail.com>
 <20251114035338.15144-2-airlied@gmail.com>
Content-Language: en-CA
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <20251114035338.15144-2-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2025.11.21-54.240.7.50
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
> document the same bits as added to the main headers.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   .../gpu/drm/amd/display/dc/dc_hdmi_types.h    | 30 +++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
Acked-by: Derek Foreman <derek.foreman@collabora.com>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h b/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
> index b015e80672ec..693129b987ac 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
> @@ -77,11 +77,24 @@ union hdmi_scdc_update_read_data {
>   		uint8_t STATUS_UPDATE:1;
>   		uint8_t CED_UPDATE:1;
>   		uint8_t RR_TEST:1;
> -		uint8_t RESERVED:5;
> +		uint8_t RESERVED0:1;
> +		uint8_t FRL_START:1;
> +		uint8_t FLT_UPDATE:1;
> +		uint8_t RESERVED:2;
>   		uint8_t RESERVED2:8;
>   	} fields;
>   };
>   
> +union hdmi_scdc_config_data {
> +	uint8_t byte[2];
> +	struct {
> +		uint8_t RR_ENABLE:1;
> +		uint8_t RESERVED:7;
> +		uint8_t FRL_RATE:4;
> +		uint8_t FFE_LEVELS:4;
> +	} fields;
> +};
> +
>   union hdmi_scdc_status_flags_data {
>   	uint8_t byte;
>   	struct {
> @@ -89,7 +102,20 @@ union hdmi_scdc_status_flags_data {
>   		uint8_t CH0_LOCKED:1;
>   		uint8_t CH1_LOCKED:1;
>   		uint8_t CH2_LOCKED:1;
> -		uint8_t RESERVED:4;
> +		uint8_t LANE3_LOCKED:1;
> +		uint8_t RESERVED:1;
> +		uint8_t FLT_READY:1;
> +		uint8_t RESERVED2:1;
> +	} fields;
> +};
> +
> +union hdmi_scdc_lane_status_data {
> +	uint8_t byte[2];
> +	struct {
> +		uint8_t ltp_0:4;
> +		uint8_t ltp_1:4;
> +		uint8_t ltp_2:4;
> +		uint8_t ltp_3:4;
>   	} fields;
>   };
>   
