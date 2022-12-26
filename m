Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB426563B0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 16:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D70410E12A;
	Mon, 26 Dec 2022 15:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [46.30.211.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EC610E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=e9bygt9btbW9iwPktn9TB5j7OYW3jMUXCcPXvrorm8c=;
 b=msH6HEoDoiW4TnKVAkHA5AS/j7GFph8h3oWgxILBS0Mx1YCL/5UnqyOnoXAmTi2iXIjQkjTEqPz/v
 O/UykmRpq0vGnN/7iYv3sIBzw7cVc8wksMc7PvWXse/P8XiAjfZHlaSsztxmU5LE877ekdx/XaG7yG
 ag0A/Zt92svMepjPAGD6nT3vQ86VQkIoOfNzxmahvkw/T/qiDpTf9hhSC3MpVQEzasrVX7ddSiBtv8
 lhbXKxS02QHSFmpEbS8pqJk5RWFHY4vo8gatJSWcYeTD3h7Te9pBUz19Rfio0ZMhO2rDB/FCemmP1G
 uUXxENmWhMi1oVv+tsSNVJJCql5YrRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=e9bygt9btbW9iwPktn9TB5j7OYW3jMUXCcPXvrorm8c=;
 b=FFjtsigMz8bhHtfzvzFDv2aSfDXgi6MbaO27/WJsWwRut6rXOcEbzFvMIqF24Yiywxe93Wrdkvw67
 yJsRSBBBA==
X-HalOne-ID: b46d9cb0-852e-11ed-8ff6-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id b46d9cb0-852e-11ed-8ff6-cde5ad41a1dd;
 Mon, 26 Dec 2022 15:05:18 +0000 (UTC)
Date: Mon, 26 Dec 2022 16:05:16 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 1/4] drm: panel: Add Himax HX8394 panel controller
 driver
Message-ID: <Y6m4LONOyoPo/+Cv@ravnborg.org>
References: <20221226134909.2822179-1-javierm@redhat.com>
 <20221226134909.2822179-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226134909.2822179-2-javierm@redhat.com>
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
Cc: Robert Mader <robert.mader@posteo.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier.

On Mon, Dec 26, 2022 at 02:49:05PM +0100, Javier Martinez Canillas wrote:
> From: Kamil Trzciński <ayufan@ayufan.eu>
> 
> The driver is for panels based on the Himax HX8394 controller, such as the
> HannStar HSD060BHW4 720x1440 TFT LCD panel that uses a MIPI-DSI interface.
> 
> Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
> Co-developed-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Co-developed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Strictly speaking the binding should be applied before the driver.

	Sam
