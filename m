Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3623F9DEF5E
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 09:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE3510E151;
	Sat, 30 Nov 2024 08:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vwo78bS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C0410E151
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 08:31:44 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ffd711274dso30985131fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 00:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732955502; x=1733560302; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jAlLAAAGM9bVH738rgOjUvG+kp8ufe3wXv46mmUzS24=;
 b=vwo78bS9Hu96SlMVXODNx4iJhs/8zuKJB85Ger3I42KnI5WL3TLjjDFS9KhYLqv7Mq
 FUTjv2iE108+n0rZic0bC6J+t465FrXyn8801YOF25HEiWb3apHBPIWi6s8ziYmTXdCh
 fyAgBsYpftbIq21hdXuDV8C9g+AwMxuXQ2GH2TP2Sonhc/U3ApSQ9kAvfCq2zS5rXMdU
 NmfuaYkcL3liLkZYo9o0PCn3SKnp6UNl9cGCR563Z+6eqOc3CHh6RipufjT6TBtHCNA3
 a7KiZiGB1SKoM9f2PheEWXHNW0L+wFI3Ci252ttU3d2WCli6ekFFwGSxciWLynZRPbQH
 rRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732955502; x=1733560302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jAlLAAAGM9bVH738rgOjUvG+kp8ufe3wXv46mmUzS24=;
 b=i0spWIlMaS9ezRUsoMVYL24tfNoFqOOuU0LCPGEiU4R6sMdfgWXW8vYg9fgXz3Rok3
 MsgKUr9V+ZzUMXu4GFno6sjP+hsEYstjW3FKEGcao6S9TTT/951c6WOoB4lCZPj3gSbC
 dOkYDHF2IvedKqxUBMIds5DsiKxb/Md4W/N4o7wAHVPRiu85eM3OcBqF7Hr/xnNIluhD
 mdd9gDuKHps2H4MzmdOc7TDJlR/Q1zQdP4ykx8n5Sap4U79N2mI3KdSsWcpnu9am62k9
 ew8TgeAXcVrPDA9JFDZNlbbkl0TvNmvb8qzgJHc2BM54EawGFnfkqUFCD0HbQjLeYznH
 vomg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl4OSwJAu7mEbguy+SLVyU9rk4BRjTwK8F0Ig7ejVW0jxK/5k2MaGOFR+ppEMtLcRCHMOiQZQCNrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJGAXHky/HCwh/ms6dgQrRs0DRfV6/yqG7ho84fpM78a01qUop
 wtSrLIem5YGBO27d4O+EkaSpk9X4t/tTEC7RQXe/8oBPOf789Lc/H/gQ3T4AWNI=
X-Gm-Gg: ASbGncs4jAn0RNMIAcbJFcrH8fuMAeY4TRuN92snK+Swk6am2+1yc5Bo2yGkYbMU2ZJ
 Y0adK6zP/L9NDz6FAiHHWVkqQh9rnipTBkKe6MrBmIHJqZwFl0vQW7qiPc5aooc2bVBIWAvI6/R
 tU/B9X7S2GWzfNALeDiKmBr77PmAtaqZ0BB4nrIxy0MaKYpUhjZ5BICnaAzOdjbVywGohGpY9Dq
 V2lCyTAiFOxAinf3cdUR8nY3ATQ/UjjfF8OjTfXAiDGeQ7UfzPVPUCb80JPD51I/HP8CSdiHS0o
 W4fG0dzo64Wro6E2uz3GlZtclOlRyQ==
X-Google-Smtp-Source: AGHT+IHqlibCJpfN5cUZPPd4TL/8XxztYBv4PAhJSEPCWQRqaxNuibgDwkMBYYVSBLF2QupVe40mkw==
X-Received: by 2002:a2e:b8c3:0:b0:2ef:28ed:1ff5 with SMTP id
 38308e7fff4ca-2ffde23dfe7mr37315291fa.15.1732955502004; 
 Sat, 30 Nov 2024 00:31:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfbb8fc5sm6296371fa.22.2024.11.30.00.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 00:31:40 -0800 (PST)
Date: Sat, 30 Nov 2024 10:31:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Guy Chronister <guyc.linux.patches@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm:panel-orientation-quirks Added DeckHD support to
 panel orientation quirks for Steam Deck This commit introduces a new quirk
 to handle specific orientation issues for DeckHD panels on the Steam Deck.
 The quirk ensures the correct display orientation for these panels,
 enhancing the user experience on Steam Deck devices. Tested on my Steam Deck
 to ensure reliability. Feedback and further testing are welcome.
Message-ID: <t4faz7cyi5lnib2zsxxv3j5ykltrecsjee6hrb3ky2g6gdypju@6u6ggrhuisjr>
References: <20241127203545.17475-1-guyc.linux.patches@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127203545.17475-1-guyc.linux.patches@gmail.com>
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

On Wed, Nov 27, 2024 at 02:35:45PM -0600, Guy Chronister wrote:
> Signed-off-by: Guy Chronister <guyc.linux.patches@gmail.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
>  1 file changed, 7 insertions(+)

It seems that you didn't break the subject / commit message properly.
Please add an empty line after the subject line in the Git commit
message and post v2.

> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 3f2e2b851cbc..c412273799cb 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -456,6 +456,13 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
>  		},
>  		.driver_data = (void *)&lcd1280x1920_rightside_up,
> +	}, {	/* Valve Steam Deck (Jupiter) with DeckHD */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
> +		},
> +		.driver_data = (void *)&lcd1200x1920_rightside_up,
>  	}, {	/* Valve Steam Deck (Jupiter) */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
