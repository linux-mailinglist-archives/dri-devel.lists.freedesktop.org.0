Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C57107C020E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 18:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7561710E3AD;
	Tue, 10 Oct 2023 16:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECCA10E3AD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 16:55:49 +0000 (UTC)
Received: from i53875b94.versanet.de ([83.135.91.148] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qqG1H-0006GE-9T; Tue, 10 Oct 2023 18:55:43 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: quentin.schulz@theobroma-systems.com
Subject: Re: [PATCH 1/3] drm/panel: ltk050h3146w: add
 mipi_dsi_device.mode_flags to of_match_data
Date: Tue, 10 Oct 2023 18:55:42 +0200
Message-ID: <2369051.yKrmzQ4Hd0@diego>
In-Reply-To: <169695678310.350877.5388571923561270631.b4-ty@sntech.de>
References: <20220131164723.714836-1-quentin.schulz@theobroma-systems.com>
 <169695678310.350877.5388571923561270631.b4-ty@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Quentin Schulz <foss+kernel@0leil.net>,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 10. Oktober 2023, 18:54:11 CEST schrieb Heiko Stuebner:
> On Mon, 31 Jan 2022 17:47:21 +0100, quentin.schulz@theobroma-systems.com wrote:
> > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > 
> > To prepare for a new display to be supported by this driver which has a
> > slightly different set of DSI mode related flags, let's move the
> > currently hardcoded mode flags to the .data field of of_device_id
> > structure.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] drm/panel: ltk050h3146w: add mipi_dsi_device.mode_flags to of_match_data
>       commit: 99403d747ae8c7b3bfb5cd14c8908930ec6801c6
> [2/3] drm/panel: ltk050h3146w: add support for Leadtek LTK050H3148W-CTA6 variant
>       commit: e5f9d543419c78ac58f3b3557bc5a76b20ff600b
> [3/3] dt-bindings: ltk050h3146w: add compatible for LTK050H3148W-CTA6 variant
>       commit: 29d8e38c36cb662331a833699c359ec1af1edbec

forgot to add, I included the move to the generic mipi_dsi_dcs_write_seq()
for the new sequence.




