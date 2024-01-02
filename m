Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E72E821E09
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 15:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A5510E1AB;
	Tue,  2 Jan 2024 14:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (mecka.net [159.69.159.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8829C10E1A8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1704206933; bh=OLsgumS1zwfIQwHwTxGsJd911hWOiA9RORKv5bCget8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OlCBZLIVeF/PoWDACRceIzqmgbYteJEJ355bQ4YJdhOXq6ILi0racCbJ6xERTAkhu
 vs1kNQwxNsPHgrddbFYJENfb1E53QLEp3HygJqSADaZcTljUobsfwnjTEIGTHDKB+6
 QpvLBUBJLYdG9s6rMh4rKRQPL+OLQ1h+DdI1Tjpg9ErMxLRbOHGhcTtqxRJBKuyUIX
 lMNavOXv+doYpUl7zIvJZpSkqH7by1n8OkxzTfJkF0ZO/HLUpqQtcTjVS5Cinp+wWA
 k/b3WUCjXkC+POgl8A32MlXHZpUPBHe90L+4TQyUTbde/H3P13qnCQFkNGvcilqhBa
 BqX8loGptRM0A==
Received: from mecka.net (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id 8F75D377B81;
 Tue,  2 Jan 2024 15:48:52 +0100 (CET)
Date: Tue, 2 Jan 2024 15:48:51 +0100
From: Manuel Traut <manut@mecka.net>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for BOE TH101MB31IG002-28A
 panel
Message-ID: <ZZQiU7o9QQrm-axU@mecka.net>
References: <20231223-pinetab2-v2-0-ec1856d0030e@mecka.net>
 <20231223-pinetab2-v2-2-ec1856d0030e@mecka.net>
 <342bf5a0-8454-4fd6-be45-462f1e31e606@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <342bf5a0-8454-4fd6-be45-462f1e31e606@quicinc.com>
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
Cc: Diederik de Haas <didi.debian@cknow.org>, Danct12 <danct12@riseup.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Yao <markyao0591@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Segfault <awarnecke002@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Arnaud Ferraris <aferraris@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 26, 2023 at 02:56:58PM -0800, Jessica Zhang wrote:
> 
> 
> On 12/23/2023 7:20 AM, Manuel Traut wrote:
> > From: Alexander Warnecke <awarnecke002@hotmail.com>
> > 
> > The BOE TH101MB31IG002-28A panel is a WXGA panel.
> > It is used in Pine64 Pinetab2 and PinetabV.
> > 

> Hi Manuel,

Hi Jessica,

> Sorry, I responded to the v1 instead of the latest version. Carrying my
> comment over to here:
> 
> If I remember correctly, commit d2aacaf07395bd798373cbec6af05fff4147aff3
> should have introduced prepared/enabled do the drm_panel struct.

thanks for the hint, I will update this in v3.

Regards
Manuel
