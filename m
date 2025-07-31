Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE35B16FC0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 12:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0C610E765;
	Thu, 31 Jul 2025 10:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="IPycU4Ui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DBD10E765
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 10:45:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753958757; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IX0rqFuW6AKtOeujbXGJL7dYtca2+0CGs4V4MZPCzVoRbuUj4Tp/AlTPAzL9I7XxxHookTdIiX8pbegYt52LxLTT2GJybNNH/TgMtleXynt3lrvjHLuh3SIB2XmN3SjXb4KDuADQu1r5iX+3oVBuAJJxucA+1zIoQN8AIPvFX+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753958757;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KCj62mFmtZcjuNsdbw8lNFwbIS7ToIULKjH4tNirfZ8=; 
 b=UwZNpxwaCK2/xkjzu5ht6z6N74tVR9iTlqarjUnVtDl3OC6pNVeqfpHfUNeIgZyBfppJuJ2XqWDuitgMYeH0FKOcrr5m00pvPiKlVz2kJWe8bYf8wYBdec/XWxZVuquVSA8yA0g6Y2aJE1e85eY0bD0I9lHP+RcrYjACDKmONkw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753958757; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=KCj62mFmtZcjuNsdbw8lNFwbIS7ToIULKjH4tNirfZ8=;
 b=IPycU4Uixq67P4TblsB3xmTCUUUg6g43xYeSWI5xlSScxL0TuZUrqruCR89wJ8x+
 OXCCPwestmzBgCNZ66PLStKmGW724VdctLDNJbbdyw1ddHNBjhOJGzH6w8W3q/2R/gI
 sVhcjFodxOB/PMDL4w6wL66PpPbTxvpUHZ8axaX0=
Received: by mx.zohomail.com with SMTPS id 1753958755531289.9960517655592;
 Thu, 31 Jul 2025 03:45:55 -0700 (PDT)
Message-ID: <a1317262-fe95-4da0-96f3-d468d2bac07d@collabora.com>
Date: Thu, 31 Jul 2025 12:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/vkms: Add writeback encoders as possible clones
To: louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org
References: <20250718121442.490634-1-robert.mader@collabora.com>
Content-Language: en-US, de-DE
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <20250718121442.490634-1-robert.mader@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hey Louis, would you be fine to add your Rb on this one? :) Would love 
to get it into drm-next / 6.17.

On 18.07.25 14:14, Robert Mader wrote:
> Since commit 41b4b11da0215 ("drm: Add valid clones check") setting
> the `possible_clones` values is a hard requirement for cloning.
> `vkms` supports cloning for writeback connectors in order to capture
> CRTC content, however that broke with said commit.
>
> Writeback connectors are created on a per-CRTC basis, thus mark
> every non-writeback connector that is compatible with a given CRTC
> as possible clone - and vice-versa.
>
> Using a default configuration, the corresponding `drm_info` output
> changes from:
>
> ├───Encoders
> │   ├───Encoder 0
> │   │   ├───Object ID: 40
> │   │   ├───Type: virtual
> │   │   ├───CRTCS: {0}
> │   │   └───Clones: {0}
> │   └───Encoder 1
> │       ├───Object ID: 41
> │       ├───Type: virtual
> │       ├───CRTCS: {0}
> │       └───Clones: {1}
>
> to:
>
> ├───Encoders
> │   ├───Encoder 0
> │   │   ├───Object ID: 44
> │   │   ├───Type: virtual
> │   │   ├───CRTCS: {0}
> │   │   └───Clones: {0, 1}
> │   └───Encoder 1
> │       ├───Object ID: 50
> │       ├───Type: virtual
> │       ├───CRTCS: {0}
> │       └───Clones: {0, 1}
>
> Fixes: dbd9d80c1b2e (drm/vkms: Add support for writeback)
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> ---
>   drivers/gpu/drm/vkms/vkms_output.c    | 13 +++++++++++++
>   drivers/gpu/drm/vkms/vkms_writeback.c |  2 ++
>   2 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 8d7ca0cdd79f..2ee3749e2b28 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -77,9 +77,22 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>   			return ret;
>   		}
>   
> +		encoder_cfg->encoder->possible_clones |=
> +			drm_encoder_mask(encoder_cfg->encoder);
> +
>   		vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) {
>   			encoder_cfg->encoder->possible_crtcs |=
>   				drm_crtc_mask(&possible_crtc->crtc->crtc);
> +
> +			if (vkms_config_crtc_get_writeback(possible_crtc)) {
> +				struct drm_encoder *wb_encoder =
> +					&possible_crtc->crtc->wb_encoder;
> +
> +				encoder_cfg->encoder->possible_clones |=
> +					drm_encoder_mask(wb_encoder);
> +				wb_encoder->possible_clones |=
> +					drm_encoder_mask(encoder_cfg->encoder);
> +			}
>   		}
>   	}
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index fe163271d5b5..45d69a3b85f6 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -174,6 +174,8 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
>   	if (ret)
>   		return ret;
>   	vkms_output->wb_encoder.possible_crtcs |= drm_crtc_mask(&vkms_output->crtc);
> +	vkms_output->wb_encoder.possible_clones |=
> +		drm_encoder_mask(&vkms_output->wb_encoder);
>   
>   	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>   

-- 
Robert Mader
Consultant Software Developer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

