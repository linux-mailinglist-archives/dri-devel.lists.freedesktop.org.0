Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A445F4A685C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 00:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F9D10E1CC;
	Tue,  1 Feb 2022 23:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A5010E1CC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 23:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=kzu0F19ot5U0CXhXpGsmgOBzGIvXF/v3Q09a87bCxyg=; b=gn26cEa6UIdLY+OV4ubyeB3cTC
 dJFg+fK25DZPXMP4goFy6z7Nr43CK/m7omd6BGcKlwIVnpMxy5XBOf6kWKS1ORRDdWCFttoyOurqp
 DotbZsXvUmIVn372SV+1EyMXd8B6kgejxV27J0FwYZVu683UT3IUsOfs/XIxw/NgLi6eMkZKXka+2
 iWGjxry/nEnAq4KOHhF9zASJUztmI+7+smaxr3EKNgeomwmUC2Fvxhb0k68Zjw6PiHXKrlWpdpX9B
 KKMHvIsC0y1v3Cd/ZCwvtcVebfrxkwS0c/oTRBG6JAHxcUXB8ONX3Nd4zNUPm/PSzyYsiOYrJzAhG
 H4V+TBKg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF2Dy-0060mV-Uw; Tue, 01 Feb 2022 23:06:11 +0000
Message-ID: <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
Date: Tue, 1 Feb 2022 15:06:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Kconfig CONFIG_FB dependency regression
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Arnd Bergmann <arnd@kernel.org>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/1/22 15:01, Thinh Nguyen wrote:
> Hi,
> 
> One of our test setups is unable to boot (stuck at initramfs). Git
> bisection points to the commit below:
> 
> f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> 
> Reverting this patch resolves the issue. This issue persists in mainline
> also. Unfortunately there isn't any meaningful log. Hopefully someone
> can give some insight as to what could be the issue and revert/fix this
> issue.

Hi,
Did you enable DRM_FBDEV_EMULATION?
Please provide the failing .config file.

-- 
~Randy
