Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927686DD69C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 11:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D906B10E04A;
	Tue, 11 Apr 2023 09:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-44.mta1.migadu.com (out-44.mta1.migadu.com
 [IPv6:2001:41d0:203:375::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5948A10E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 09:28:58 +0000 (UTC)
Date: Tue, 11 Apr 2023 11:28:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1681205332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=herqdWTSpQzIg4qxrA3Oi6bo3dutKqr8QPmPpf/XCig=;
 b=XrEy6Y82J+f6A5SrwL6EnMQ1YyNXk9Irj2fGdVsvyJYveUSX3YYzS6HiVSkYCaOvlqZZh4
 wQ1KG/AKUbmtPvGIm0YVTIpyfkTDynWwxr5mVPf2AjT5HzTy9mcs7PJrG8lLRWqNHP06Jt
 mYB0rFw1kJJD5kZBvsbg7ArSPx89Qfs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH RESEND v2 0/2] panel-simple: Add InnoLux G070ACE-L01
 support
Message-ID: <20230411092849.GB4993@g0hl1n.net>
References: <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 08:50:15AM +0100, richard.leitner@linux.dev wrote:
> This series adds support for the InnoLux G070ACE-L01 7" 800x480 TFT LCD
> panel with WLED backlight.

Friendly reminder for this small series 😉

> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
> Richard Leitner (2):
>       dt-bindings: display: simple: add support for InnoLux G070ACE-L01
>       drm/panel: simple: Add InnoLux G070ACE-L01
> 
>  .../bindings/display/panel/panel-simple.yaml       |  2 ++
>  drivers/gpu/drm/panel/panel-simple.c               | 35 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
> ---
> base-commit: c0b67534c95c537f7a506a06b98e5e85d72e2b7d
> change-id: 20230201-innolux-g070ace-fda21c89efe2
> 
> Best regards,
> -- 
> Richard Leitner <richard.leitner@skidata.com>
> 
