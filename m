Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B08D559F4B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 19:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7818410EA19;
	Fri, 24 Jun 2022 17:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2CE10EA19
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 17:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kKMlyigldhqIKPtpc/HTqH04jpVCEZ2Uj0a4oEjScvQ=;
 b=dIA3UtO+bXXsFoKsMM0zNGq/QbMHWhMKuOUXmdH/rpWNjFyzQ1vjr2mVb5N4luMF5COD6CTVfL4ns
 XGIBNrsFu/MMsa4mT8ZA4r3qDWOphUd/pohvpRRqf4e04OEqMQI7SHeLwQ8XALQiZbEAl7xUMJSs66
 w5zFIwoMAonePdbtTee1VWU1YIkgHnQy5H79bw6+gBKPApudhvfaM9wIplEAu0BGXD+oVwDJHlV1lj
 FzHWi6ahSNz+XXvWUHP9jw/UCEhRtUFgp2Qi3/RPrOqTfRElYgnPqLF4aLqppmilZCYXtpUKweuysA
 YXhcgzSbpjGFbTwPCcfyQfO1yg+aUUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kKMlyigldhqIKPtpc/HTqH04jpVCEZ2Uj0a4oEjScvQ=;
 b=pLODzhr0ICxTTRSGGUxLlQi1uSu5F7stxjTe16GEavcTvW1IQRWBpn+FmDm9BS24Wy30B/Vui9P6a
 ZziOKxODw==
X-HalOne-Cookie: ac4d69d102f6ad701fef4aaa0f761458036f703e
X-HalOne-ID: bd268857-f3e2-11ec-be7c-d0431ea8bb03
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id bd268857-f3e2-11ec-be7c-d0431ea8bb03;
 Fri, 24 Jun 2022 17:26:10 +0000 (UTC)
Date: Fri, 24 Jun 2022 19:26:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Philip Oberfichtner <pro@denx.de>
Subject: Re: [RESEND v5 1/2] dt-bindings: display: simple: Add DataImage
 FG1001L0DSSWMG01 compatible string
Message-ID: <YrXzsK9JE8At8WL/@ravnborg.org>
References: <20220623112257.4178461-1-pro@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623112257.4178461-1-pro@denx.de>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 matthias.winker@de.bosch.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philip,

On Thu, Jun 23, 2022 at 01:22:56PM +0200, Philip Oberfichtner wrote:
> Add DataImage FG1001L0DSSWMG01 10.1" 1280x800 TFT LCD panel compatible
> string.
> 
> Signed-off-by: Philip Oberfichtner <pro@denx.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Both patches applied to drm-misc (drm-misc-next)

	Sam
